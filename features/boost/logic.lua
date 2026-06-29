-- applies auto boost when the ball is close enough.

local boost={}

local players=game:GetService("Players")
local inputService=game:GetService("UserInputService")
local debris=game:GetService("Debris")
local runService=game:GetService("RunService")

local me=players.LocalPlayer

local defaultBoostForce=32
local defaultBoostCooldown=5
local defaultBoostChance=100
local defaultBoostRadius=10
local footballCacheInterval=0.20
local boostScanInterval=0.05
local boostContactRadius=4.5
local boostScanJobId="AutoBoostContactScan"
local boostToggleKey=Enum.KeyCode.Unknown
local alwaysBoostToggleKey=Enum.KeyCode.Unknown

local function clampNumber(value,min,max,fallback)
	local n=tonumber(value)
	if not n then return fallback end
	return math.clamp(n,min,max)
end

local function isBound(binding,key)
	return key~=nil and key~=Enum.KeyCode.Unknown and binding==key
end

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
end

local function getFootball()
	local parkMap=workspace:FindFirstChild("ParkMap")
	if parkMap and parkMap:FindFirstChild("Replicated") then
		local fields=parkMap.Replicated:FindFirstChild("Fields")
		if fields then
			local parkFields={
				fields:FindFirstChild("LeftField"),
				fields:FindFirstChild("RightField"),
				fields:FindFirstChild("BLeftField"),
				fields:FindFirstChild("BRightField"),
				fields:FindFirstChild("HighField"),
				fields:FindFirstChild("TLeftField"),
				fields:FindFirstChild("TRightField"),
			}

			for _,field in ipairs(parkFields) do
				if field and field:FindFirstChild("Replicated") then
					local football=field.Replicated:FindFirstChild("Football")
					if football and football:IsA("BasePart") then
						return football
					end
				end
			end
		end
	end

	local parkMatchMap=workspace:FindFirstChild("ParkMatchMap")
	if parkMatchMap and parkMatchMap:FindFirstChild("Replicated") then
		local fields=parkMatchMap.Replicated:FindFirstChild("Fields")
		local matchField=fields and fields:FindFirstChild("MatchField")
		local replicated=matchField and matchField:FindFirstChild("Replicated")
		local football=replicated and replicated:FindFirstChild("Football")

		if football and football:IsA("BasePart") then
			return football
		end
	end

	local gamesFolder=workspace:FindFirstChild("Games")
	if gamesFolder then
		for _,gameInstance in ipairs(gamesFolder:GetChildren()) do
			local replicatedFolder=gameInstance:FindFirstChild("Replicated")
			if replicatedFolder then
				local kickoffFootball=replicatedFolder:FindFirstChild("918f5408-d86a-4fb8-a88c-5cab57410acf")
				if kickoffFootball and kickoffFootball:IsA("BasePart") then
					return kickoffFootball
				end

				for _,item in ipairs(replicatedFolder:GetChildren()) do
					if item:IsA("BasePart") and item.Name=="Football" then
						return item
					end
				end
			end
		end
	end

	return nil
end

function boost.new(app,parent)
	local safeDisconnect=app.safeDisconnect
	local inputToBinding=app.inputToBinding
	local makeSection=app.makeSection
	local buildSlider=app.buildSlider
	local buildToggleRow=app.buildToggleRow
	local state=app.State
	local scheduler=app.schedulerApi
	local api={}
	local jumpBoostToggle=nil
	local jumpBoostModeToggle=nil
	local forceSlider=nil
	local chanceSlider=nil
	local radiusSlider=nil
	local jumpBoostTouchConn=nil
	local jumpBoostScanConn=nil
	local jumpBoostScanScheduled=false
	local characterAddedConn=nil
	local inputConn=nil
	local destroyConn=nil
	local boostReady=true
	local section=nil
	local footballCache=nil
	local footballCacheExpires=0

	local function changed()
		if app.onChanged then pcall(app.onChanged,state) end
	end

	local function normalizeState()
		state.jumpBoostOn=state.jumpBoostOn and true or false
		state.jumpBoostTradeMode=state.jumpBoostTradeMode and true or false
		state.boostForceY=clampNumber(state.boostForceY,10,100,defaultBoostForce)
		state.boostCooldown=clampNumber(state.boostCooldown,0,60,defaultBoostCooldown)
		state.boostChance=clampNumber(state.boostChance,0,100,defaultBoostChance)
		state.ballDetectionRadius=clampNumber(state.ballDetectionRadius,1,50,defaultBoostRadius)
	end

	local function syncControls()
		if jumpBoostToggle then jumpBoostToggle.set(state.jumpBoostOn) end
		if jumpBoostModeToggle then jumpBoostModeToggle.set(state.jumpBoostTradeMode) end
		if forceSlider then forceSlider.set(state.boostForceY) end
		if chanceSlider then chanceSlider.set(state.boostChance) end
		if radiusSlider then radiusSlider.set(state.ballDetectionRadius) end
	end

	local function isAlive()
		return section==nil or section.Parent~=nil
	end

	local function applyJumpBoost(rootPart)
		local bv=Instance.new("BodyVelocity")
		bv.Velocity=Vector3.new(0,state.boostForceY,0)
		bv.MaxForce=Vector3.new(0,math.huge,0)
		bv.P=5000
		bv.Parent=rootPart

		debris:AddItem(bv,0.2)
	end

	local function rollBoostChance()
		local chance=math.clamp(state.boostChance or 0,0,100)

		if chance>=100 then
			return true
		end

		if chance<=0 then
			return false
		end

		return math.random(1,100)<=chance
	end

	local function tryJumpBoost(rootPart)
		if not boostReady or not rollBoostChance() then
			return false
		end

		boostReady=false
		applyJumpBoost(rootPart)

		task.delay(state.boostCooldown,function()
			if isAlive() then
				boostReady=true
			end
		end)

		return true
	end

	local function getCachedFootball()
		local now=os.clock()
		if footballCache and footballCache.Parent and now<footballCacheExpires then
			return footballCache
		end

		footballCache=getFootball()
		footballCacheExpires=now+footballCacheInterval
		return footballCache
	end

	local function characterRoot(character)
		return character and (character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart)
	end

	local function hasNearbyBoostTarget(character,root)
		for _,player in ipairs(players:GetPlayers()) do
			local otherChar=player~=me and player.Character
			if otherChar and otherChar~=character then
				local humanoid=otherChar:FindFirstChildOfClass("Humanoid")
				local otherRoot=characterRoot(otherChar)
				if humanoid and humanoid.Health>0 and otherRoot and (otherRoot.Position-root.Position).Magnitude<=boostContactRadius then
					return true
				end
			end
		end

		return false
	end

	local function ballInBoostRange(root)
		if state.jumpBoostTradeMode then
			return true
		end

		local football=getCachedFootball()
		return football and (football.Position-root.Position).Magnitude<=state.ballDetectionRadius
	end

	local function clearJumpBoostTouchConnection()
		safeDisconnect(jumpBoostTouchConn)
		jumpBoostTouchConn=nil
	end

	local function clearJumpBoostScanConnection()
		if jumpBoostScanScheduled and scheduler and type(scheduler.Unregister)=="function" then
			pcall(scheduler.Unregister,"Heartbeat",boostScanJobId)
		end

		jumpBoostScanScheduled=false
		safeDisconnect(jumpBoostScanConn)
		jumpBoostScanConn=nil
	end

	local function scanJumpBoostContact()
		if not isAlive() or not state.jumpBoostOn or not boostReady then
			return
		end

		local character=me.Character
		local root=characterRoot(character)
		if not root or root.AssemblyLinearVelocity.Y>=-2 then
			return
		end

		if hasNearbyBoostTarget(character,root) and ballInBoostRange(root) then
			tryJumpBoost(root)
		end
	end

	local function syncJumpBoostScan()
		if not state.jumpBoostOn then
			clearJumpBoostScanConnection()
			return
		end

		if jumpBoostScanConn or jumpBoostScanScheduled then
			return
		end

		if scheduler and type(scheduler.Register)=="function" then
			local ok,result=pcall(scheduler.Register,"Heartbeat",boostScanJobId,boostScanInterval,scanJumpBoostContact)
			if ok and result then
				jumpBoostScanScheduled=true
				return
			end
		end

		local elapsed=0
		jumpBoostScanConn=runService.Heartbeat:Connect(function(dt)
			elapsed=elapsed+(dt or 0)
			if elapsed<boostScanInterval then
				return
			end

			elapsed=0
			scanJumpBoostContact()
		end)
	end

	local function setupJumpBoost(character)
		clearJumpBoostTouchConnection()

		local root=character and (character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart",3))
		if not root then
			return
		end

		jumpBoostTouchConn=root.Touched:Connect(function(hit)
			if not isAlive() or not state.jumpBoostOn or not boostReady then
				return
			end

			if root.AssemblyLinearVelocity.Y>=-2 then
				return
			end

			local otherChar=hit:FindFirstAncestorWhichIsA("Model")
			local otherHumanoid=otherChar and otherChar:FindFirstChildOfClass("Humanoid")

			if not otherChar or otherChar==character or not otherHumanoid then
				return
			end

			if state.jumpBoostTradeMode then
				tryJumpBoost(root)
				return
			end

			local football=getCachedFootball()
			if football then
				local distance=(football.Position-root.Position).Magnitude
				if distance<=state.ballDetectionRadius then
					tryJumpBoost(root)
				end
			end
		end)

		syncJumpBoostScan()
	end

	function api.SetJumpBoostState(value,fire)
		state.jumpBoostOn=value and true or false
		boostReady=true

		if state.jumpBoostOn then
			local character=me.Character
			if character then
				setupJumpBoost(character)
			end
			syncJumpBoostScan()
		else
			clearJumpBoostTouchConnection()
			clearJumpBoostScanConnection()
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetAlwaysBoostState(value,fire)
		state.jumpBoostTradeMode=value and true or false
		syncJumpBoostScan()
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetBoostForceY(value,fire)
		state.boostForceY=clampNumber(value,10,100,defaultBoostForce)
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetBoostChance(value,fire)
		state.boostChance=clampNumber(value,0,100,defaultBoostChance)
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetBallDetectionRadius(value,fire)
		state.ballDetectionRadius=clampNumber(value,1,50,defaultBoostRadius)
		syncControls()

		if fire~=false then
			changed()
		end
	end

	normalizeState()
	local sectionControls=nil
	section,sectionControls=makeSection(parent,2,"Boost","",{
		headerToggle={
			startState=state.jumpBoostOn,
			onChange=function(value)
				api.SetJumpBoostState(value,true)
			end,
		},
	})

	jumpBoostToggle=sectionControls and sectionControls.toggle
	if not jumpBoostToggle then
		jumpBoostToggle=buildToggleRow(section,"Jump Boost",state.jumpBoostOn,function(value)
			api.SetJumpBoostState(value,true)
		end)
	end

	jumpBoostModeToggle=buildToggleRow(section,"Always Boost",state.jumpBoostTradeMode,function(value)
		api.SetAlwaysBoostState(value,true)
	end)

	forceSlider=buildSlider(section,"Force",10,100,state.boostForceY,1,function(v)
		api.SetBoostForceY(v,true)
	end)

	chanceSlider=buildSlider(section,"Chance",0,100,state.boostChance,0,function(v)
		api.SetBoostChance(v,true)
	end)

	radiusSlider=buildSlider(section,"Radius",1,50,state.ballDetectionRadius,1,function(v)
		api.SetBallDetectionRadius(v,true)
	end)

	function api.Refresh()
		normalizeState()
		api.SetJumpBoostState(state.jumpBoostOn,false)
		syncControls()
	end

	function api.Reset()
		state.jumpBoostOn=false
		state.jumpBoostTradeMode=false
		state.boostForceY=defaultBoostForce
		state.boostCooldown=defaultBoostCooldown
		state.boostChance=defaultBoostChance
		state.ballDetectionRadius=defaultBoostRadius
		api.SetJumpBoostState(false,false)
		syncControls()
		changed()
	end

	function api.Destroy()
		safeDisconnect(inputConn)
		inputConn=nil
		safeDisconnect(characterAddedConn)
		characterAddedConn=nil
		safeDisconnect(destroyConn)
		destroyConn=nil
		clearJumpBoostTouchConnection()
		clearJumpBoostScanConnection()
		footballCache=nil
		footballCacheExpires=0
		destroyControl(jumpBoostToggle)
		destroyControl(jumpBoostModeToggle)
		destroyControl(forceSlider)
		destroyControl(chanceSlider)
		destroyControl(radiusSlider)
		boostReady=true
	end

	characterAddedConn=me.CharacterAdded:Connect(function(character)
		if not isAlive() then return end

		if state.jumpBoostOn then
			task.defer(function()
				setupJumpBoost(character)
			end)
		end
	end)

	local function handleBoostInput(input)
		local jumpBoostKey=boostToggleKey
		local alwaysBoostKey=alwaysBoostToggleKey

		if app.getJumpBoostToggleKey then
			jumpBoostKey=app.getJumpBoostToggleKey() or Enum.KeyCode.Unknown
		end

		if app.getAlwaysBoostToggleKey then
			alwaysBoostKey=app.getAlwaysBoostToggleKey() or Enum.KeyCode.Unknown
		end

		local binding=inputToBinding(input)
		local handled=isBound(binding,jumpBoostKey) or isBound(binding,alwaysBoostKey)
		if not handled then
			return false
		end

		if isBound(binding,jumpBoostKey) then
			api.SetJumpBoostState(not state.jumpBoostOn,true)
		end

		if isBound(binding,alwaysBoostKey) then
			api.SetAlwaysBoostState(not state.jumpBoostTradeMode,true)
		end

		return true
	end

	inputConn=inputService.InputBegan:Connect(function(input,processed)
		if processed then return end
		handleBoostInput(input)
	end)

	destroyConn=section.AncestryChanged:Connect(function()
		if not isAlive() then
			api.Destroy()
		end
	end)

	api.Refresh()

	return api
end

return boost
