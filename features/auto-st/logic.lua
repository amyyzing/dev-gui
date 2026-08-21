local autoST={}

local players=game:GetService("Players")
local inputService=game:GetService("UserInputService")
local runService=game:GetService("RunService")
local workspace=game:GetService("Workspace")

local localPlayer=players.LocalPlayer
local gravity=Vector3.new(0,-28,0)
local detectionRange=45
local alignSpeed=0.70
local ballCacheTime=0.15

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
end

local function characterRoot()
	local character=localPlayer.Character
	return character,character and (character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart)
end

local function isFootballPart(instance)
	if not(instance and instance:IsA("BasePart") and instance.Parent and not instance.Anchored) then return false end
	local current=instance
	for _=1,4 do
		if not current then break end
		local name=tostring(current.Name):lower()
		if name:find("football",1,true) or name:find("ball",1,true) or name=="918f5408-d86a-4fb8-a88c-5cab57410acf" then
			return true
		end
		current=current.Parent
	end
	return false
end

local function closestFootball(rootPart)
	local best=nil
	local bestDistance=detectionRange
	for _,instance in ipairs(workspace:GetDescendants()) do
		if isFootballPart(instance) then
			local distance=(instance.Position-rootPart.Position).Magnitude
			if distance<=bestDistance then
				best=instance
				bestDistance=distance
			end
		end
	end
	return best
end

local function ballAt(position,velocity,time)
	return position+velocity*time+0.5*gravity*time*time
end

local function interceptPoint(rootPosition,ballPosition,ballVelocity)
	local bestPoint=nil
	local bestDistance=math.huge
	for time=0.03,1.2,0.04 do
		local point=ballAt(ballPosition,ballVelocity,time)
		local distance=(point-rootPosition).Magnitude
		if distance<bestDistance then
			bestDistance=distance
			bestPoint=point
		end
	end
	return bestPoint
end

function autoST.new(app,parent)
	local state=app.State or{}
	local safeDisconnect=app.safeDisconnect
	local inputToBinding=app.inputToBinding
	local makeSection=app.makeSection
	local buildToggleRow=app.buildToggleRow
	local api={}
	local enabled=false
	local holding=false
	local destroyed=false
	local toggle=nil
	local section=nil
	local inputBegan=nil
	local inputEnded=nil
	local heartbeat=nil
	local cachedBall=nil
	local cacheExpires=0

	-- This state is intentionally session-only and always starts disabled.
	state.autoSTEnabled=false

	local function syncToggle()
		if toggle then toggle.set(enabled) end
	end

	local function setEnabled(value)
		enabled=value and true or false
		state.autoSTEnabled=enabled
		if not enabled then holding=false end
		syncToggle()
	end

	function api.SetAutoSTState(value)
		setEnabled(value)
	end

	function api.Refresh()
		syncToggle()
	end

	function api.Reset()
		setEnabled(false)
	end

	local controls=nil
	section,controls=makeSection(parent,6,"Auto ST","hold the configured key",{
		headerToggle={
			startState=false,
			onChange=setEnabled,
		},
	})
	toggle=controls and controls.toggle
	if not toggle then
		toggle=buildToggleRow(section,"Auto ST",false,setEnabled)
	end

	local function configuredKey()
		if app.getAutoSTKey then
			return app.getAutoSTKey() or Enum.KeyCode.V
		end
		return Enum.KeyCode.V
	end

	local function matchesHoldInput(input)
		if input.KeyCode==Enum.KeyCode.ButtonL2 then return true end
		local binding=inputToBinding(input)
		local key=configuredKey()
		return key~=Enum.KeyCode.Unknown and binding==key
	end

	inputBegan=inputService.InputBegan:Connect(function(input,processed)
		if processed or not enabled then return end
		if matchesHoldInput(input) then holding=true end
	end)

	inputEnded=inputService.InputEnded:Connect(function(input)
		if matchesHoldInput(input) then holding=false end
	end)

	heartbeat=runService.Heartbeat:Connect(function()
		if destroyed or not enabled or not holding then return end
		local _,rootPart=characterRoot()
		if not rootPart then return end

		local now=os.clock()
		if not(cachedBall and cachedBall.Parent) or now>=cacheExpires then
			cachedBall=closestFootball(rootPart)
			cacheExpires=now+ballCacheTime
		end
		if not cachedBall then return end

		local target=interceptPoint(rootPart.Position,cachedBall.Position,cachedBall.AssemblyLinearVelocity)
		if not target then return end
		local direction=Vector3.new(target.X-rootPart.Position.X,0,target.Z-rootPart.Position.Z)
		if direction.Magnitude<=0.1 then return end

		local unit=direction.Unit
		local sideLook=Vector3.new(unit.Z,0,-unit.X)
		local targetCFrame=CFrame.lookAt(rootPart.Position,rootPart.Position+sideLook)
		rootPart.CFrame=rootPart.CFrame:Lerp(targetCFrame,alignSpeed)
	end)

	function api.Destroy()
		if destroyed then return end
		destroyed=true
		enabled=false
		holding=false
		cachedBall=nil
		safeDisconnect(inputBegan)
		safeDisconnect(inputEnded)
		safeDisconnect(heartbeat)
		destroyControl(toggle)
	end

	return api
end

return autoST
