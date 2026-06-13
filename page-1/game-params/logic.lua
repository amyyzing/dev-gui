local GameParams={}

local Players=game:GetService("Players")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local UIS=game:GetService("UserInputService")
local RunService=game:GetService("RunService")

local me=Players.LocalPlayer
local DEFAULT_GRAVITY=196.2
local DEFAULT_SPEED=18
local SPEED_FORCE_INTERVAL=0.05

local PARAMS={
	JumpPower="jumpPowerValue",
	DivePower="divePowerValue",
	SprintStaminaRegenRate="staminaRegenValue",
	SprintStaminaDepleteRate="staminaDepleteValue",
}

local function clampStaminaDeplete(value)
	local n=tonumber(value)
	if not n then return 10 end
	return math.clamp(math.floor(math.abs(n)+0.5),0,50)
end

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
end

local function getMyHumanoid()
	local character=workspace:FindFirstChild(me.Name) or me.Character

	if character then
		return character:FindFirstChildOfClass("Humanoid")
	end

	return nil
end

local function clampSpeed(value)
	return math.clamp(tonumber(value) or DEFAULT_SPEED,0,100)
end

function GameParams.new(ctx,parent)
	local safeDisconnect=ctx.safeDisconnect
	local inputToBinding=ctx.inputToBinding
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local buildToggleRow=ctx.buildToggleRow
	local state=ctx.State
	local api={}
	local toggle=nil
	local gravitySlider=nil
	local speedSlider=nil
	local staminaRegenSlider=nil
	local staminaDepleteSlider=nil
	local jumpSlider=nil
	local diveSlider=nil
	local section=nil
	local sectionControls=nil
	local speedConn=nil
	local speedElapsed=0
	local inputConn=nil
	local destroyConn=nil
	local rootConns={}
	local folderConns=setmetatable({}, {__mode="k"})
	local valueConns=setmetatable({}, {__mode="k"})
	local applying=false
	local destroyed=false

	local function safeDisconnectAll(t)
		if not t then return end

		for _,conn in ipairs(t) do
			safeDisconnect(conn)
		end

		table.clear(t)
	end

	local function changed()
		if ctx.onChanged then pcall(ctx.onChanged,state) end
	end

	local function clampNumber(value,min,max,fallback)
		local n=tonumber(value)
		if not n then return fallback end
		return math.clamp(n,min,max)
	end

	local function normalizeState()
		state.gameParamsEnabled=state.gameParamsEnabled and true or false
		state.gravityEnabled=state.gravityEnabled and true or false
		state.gravityValue=clampNumber(state.gravityValue,0,1000,DEFAULT_GRAVITY)
		state.speedEnabled=state.speedEnabled and true or false
		state.speedValue=clampSpeed(state.speedValue)
		state.staminaRegenValue=clampNumber(state.staminaRegenValue,0,50,10)
		state.staminaDepleteValue=clampStaminaDeplete(state.staminaDepleteValue)
		state.jumpPowerValue=clampNumber(state.jumpPowerValue,0,300,53.5)
		state.divePowerValue=clampNumber(state.divePowerValue,0,15,1.9)
	end

	local function syncControls()
		if toggle then toggle.set(state.gameParamsEnabled) end
		if gravitySlider then gravitySlider.set(state.gravityValue) end
		if speedSlider then speedSlider.set(state.speedValue) end
		if staminaRegenSlider then staminaRegenSlider.set(state.staminaRegenValue) end
		if staminaDepleteSlider then staminaDepleteSlider.set(state.staminaDepleteValue) end
		if jumpSlider then jumpSlider.set(state.jumpPowerValue) end
		if diveSlider then diveSlider.set(state.divePowerValue) end
	end

	local function isAlive()
		return not destroyed and (section==nil or section.Parent~=nil)
	end

	local function applyGravity(value)
		local gravity=clampNumber(value,0,1000,DEFAULT_GRAVITY)
		state.gravityValue=gravity
		if state.gameParamsEnabled and state.gravityEnabled then
			workspace.Gravity=gravity
		end
		return gravity
	end

	local function applySpeedValue()
		local hum=getMyHumanoid()

		if hum then
			hum.WalkSpeed=state.speedValue
		end
	end

	local function stopSpeedForcing(resetValue)
		safeDisconnect(speedConn)
		speedConn=nil
		speedElapsed=0

		if resetValue then
			state.speedValue=DEFAULT_SPEED
		end

		local hum=getMyHumanoid()
		if hum then
			hum.WalkSpeed=DEFAULT_SPEED
		end
	end

	local function ensureSpeedForcing()
		if not(state.gameParamsEnabled and state.speedEnabled) then
			stopSpeedForcing(false)
			return
		end

		state.speedValue=clampSpeed(state.speedValue)
		applySpeedValue()

		if speedConn then
			return
		end

		speedConn=RunService.Heartbeat:Connect(function(dt)
			if not state.speedEnabled or not isAlive() then
				safeDisconnect(speedConn)
				speedConn=nil
				return
			end

			speedElapsed+=(dt or 0)
			if speedElapsed<SPEED_FORCE_INTERVAL then
				return
			end
			speedElapsed=0

			state.speedValue=clampSpeed(state.speedValue)
			local hum=getMyHumanoid()

			if hum and hum.WalkSpeed~=state.speedValue then
				hum.WalkSpeed=state.speedValue
			end
		end)
	end

	local function getCurrentModeKey()
		local miniGames=ReplicatedStorage:FindFirstChild("MiniGames")
		local miniCount=miniGames and #miniGames:GetChildren() or 0

		if miniCount>1 then
			return"mode2"
		elseif miniCount==1 then
			return"mode3"
		end

		local games=ReplicatedStorage:FindFirstChild("Games")
		if games and #games:GetChildren()>0 then
			return"mode1"
		end

		if ctx.getCurrentModeKey then
			local ok,modeKey=pcall(ctx.getCurrentModeKey)
			if ok and modeKey then
				return tostring(modeKey)
			end
		end

		return"mode1"
	end

	local function getTargetGameFolders()
		local modeKey=getCurrentModeKey()
		local folders={}

		if modeKey=="mode1" then
			local games=ReplicatedStorage:FindFirstChild("Games")
			local firstGame=games and games:GetChildren()[1]

			if firstGame then
				table.insert(folders,firstGame)
			end
		else
			local miniGames=ReplicatedStorage:FindFirstChild("MiniGames")
			if not miniGames then
				return folders
			end

			local children=miniGames:GetChildren()

			if modeKey=="mode2" then
				for _,miniGame in ipairs(children) do
					table.insert(folders,miniGame)
				end
			else
				local firstMiniGame=children[1]
				if firstMiniGame then
					table.insert(folders,firstMiniGame)
				end
			end
		end

		return folders
	end

	local function trackNumberValue(valueObject,stateKey)
		if valueConns[valueObject] then
			return
		end

		valueConns[valueObject]={}

		table.insert(valueConns[valueObject],valueObject:GetPropertyChangedSignal("Value"):Connect(function()
			if applying or not isAlive() or not state.gameParamsEnabled or not valueObject.Parent then
				return
			end

			local target=state[stateKey]
			if tonumber(valueObject.Value)~=tonumber(target) then
				applying=true
				valueObject.Value=target
				applying=false
			end
		end))

		table.insert(valueConns[valueObject],valueObject.AncestryChanged:Connect(function(_,parent)
			if parent==nil then
				safeDisconnectAll(valueConns[valueObject])
				valueConns[valueObject]=nil
			end
		end))
	end

	local function applyNumberValue(gameParams,paramName,stateKey)
		if not state.gameParamsEnabled then
			return
		end

		local valueObject=gameParams:FindFirstChild(paramName)

		if not(valueObject and valueObject:IsA("NumberValue")) then
			return
		end

		trackNumberValue(valueObject,stateKey)

		local target=state[stateKey]
		if tonumber(valueObject.Value)~=tonumber(target) then
			applying=true
			valueObject.Value=target
			applying=false
		end
	end

	local function watchGameParamsFolder(gameParams)
		if not state.gameParamsEnabled then
			return
		end

		if folderConns[gameParams] then
			return
		end

		folderConns[gameParams]={}

		table.insert(folderConns[gameParams],gameParams.ChildAdded:Connect(function(child)
			if not isAlive() or not state.gameParamsEnabled then return end

			local stateKey=PARAMS[child.Name]
			if stateKey and child:IsA("NumberValue") then
				task.defer(function()
					if isAlive() and state.gameParamsEnabled and child.Parent then
						applyNumberValue(gameParams,child.Name,stateKey)
					end
				end)
			end
		end))

		table.insert(folderConns[gameParams],gameParams.AncestryChanged:Connect(function(_,parent)
			if parent==nil then
				safeDisconnectAll(folderConns[gameParams])
				folderConns[gameParams]=nil
			end
		end))
	end

	local function applyGameParams()
		if not isAlive() or not state.gameParamsEnabled then return end

		for _,gameFolder in ipairs(getTargetGameFolders()) do
			local gameParams=gameFolder:FindFirstChild("GameParams")

			if gameParams then
				watchGameParamsFolder(gameParams)

				for paramName,stateKey in pairs(PARAMS) do
					applyNumberValue(gameParams,paramName,stateKey)
				end
			end
		end
	end

	local function watchRootFolder(root)
		if not root then return end

		table.insert(rootConns,root.ChildAdded:Connect(function()
			if state.gameParamsEnabled then
				task.defer(applyGameParams)
			end
		end))

		table.insert(rootConns,root.DescendantAdded:Connect(function(descendant)
			if state.gameParamsEnabled and (descendant.Name=="GameParams" or PARAMS[descendant.Name]) then
				task.defer(applyGameParams)
			end
		end))
	end

	local function disconnectWatchers()
		safeDisconnectAll(rootConns)

		for folder,conns in pairs(folderConns) do
			safeDisconnectAll(conns)
			folderConns[folder]=nil
		end

		for valueObject,conns in pairs(valueConns) do
			safeDisconnectAll(conns)
			valueConns[valueObject]=nil
		end
	end

	local function startWatching()
		if #rootConns>0 then
			return
		end

		table.insert(rootConns,ReplicatedStorage.ChildAdded:Connect(function(child)
			if not state.gameParamsEnabled then return end

			if child.Name=="Games" or child.Name=="MiniGames" then
				watchRootFolder(child)
				task.defer(applyGameParams)
			end
		end))

		watchRootFolder(ReplicatedStorage:FindFirstChild("Games"))
		watchRootFolder(ReplicatedStorage:FindFirstChild("MiniGames"))
	end

	function api.SetGravityState(value,fire)
		state.gravityEnabled=value and true or false
		if state.gameParamsEnabled and state.gravityEnabled then
			applyGravity(state.gravityValue)
		else
			workspace.Gravity=DEFAULT_GRAVITY
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetGravityValue(value,fire)
		state.gravityValue=clampNumber(value,0,1000,DEFAULT_GRAVITY)
		if fire~=false then
			state.gravityEnabled=true
		end
		applyGravity(state.gravityValue)
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetSpeedState(value,fire,resetValue)
		state.speedEnabled=value and true or false
		state.speedValue=clampSpeed(state.speedValue)

		if state.gameParamsEnabled and state.speedEnabled then
			ensureSpeedForcing()
		else
			stopSpeedForcing(resetValue==true)
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetSpeedValue(value,fire)
		state.speedValue=clampSpeed(value)
		if fire~=false then
			state.speedEnabled=true
		end
		if state.speedEnabled then
			ensureSpeedForcing()
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetGameParamsState(value,fire)
		state.gameParamsEnabled=value and true or false

		if state.gameParamsEnabled then
			startWatching()
			applyGameParams()
		else
			disconnectWatchers()
		end
		if state.gameParamsEnabled and state.gravityEnabled then
			applyGravity(state.gravityValue)
		else
			workspace.Gravity=DEFAULT_GRAVITY
		end
		if state.gameParamsEnabled and state.speedEnabled then
			ensureSpeedForcing()
		else
			stopSpeedForcing(false)
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetStaminaRegenValue(value,fire)
		state.staminaRegenValue=clampNumber(value,0,50,10)
		applyGameParams()
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetStaminaDepleteValue(value,fire)
		state.staminaDepleteValue=clampStaminaDeplete(value)
		applyGameParams()
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetJumpPowerValue(value,fire)
		state.jumpPowerValue=clampNumber(value,0,300,53.5)
		applyGameParams()
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetDivePowerValue(value,fire)
		state.divePowerValue=clampNumber(value,0,15,1.9)
		applyGameParams()
		syncControls()

		if fire~=false then
			changed()
		end
	end

	normalizeState()
	section,sectionControls=makeSection(parent,2,"Game Params","",{
		headerToggle={
			startState=state.gameParamsEnabled,
			onChange=function(value)
				api.SetGameParamsState(value,true)
			end,
		},
	})

	toggle=sectionControls and sectionControls.toggle
	if not toggle and buildToggleRow then
		toggle=buildToggleRow(section,"Game Params",state.gameParamsEnabled,function(value)
			api.SetGameParamsState(value,true)
		end)
	end

	gravitySlider=buildSlider(section,"Gravity",0,1000,state.gravityValue,1,function(v)
		api.SetGravityValue(v,true)
	end)

	speedSlider=buildSlider(section,"Speed",0,100,state.speedValue,0,function(v)
		api.SetSpeedValue(v,true)
	end)

	staminaRegenSlider=buildSlider(section,"Stamina Regeneration",0,50,state.staminaRegenValue,1,function(v)
		api.SetStaminaRegenValue(v,true)
	end)

	staminaDepleteSlider=buildSlider(section,"Stamina Depletion",0,50,state.staminaDepleteValue,0,function(v)
		api.SetStaminaDepleteValue(v,true)
	end)

	jumpSlider=buildSlider(section,"Jump",0,300,state.jumpPowerValue,1,function(v)
		api.SetJumpPowerValue(v,true)
	end)

	diveSlider=buildSlider(section,"Dive",0,15,state.divePowerValue,2,function(v)
		api.SetDivePowerValue(v,true)
	end)

	function api.Refresh()
		normalizeState()
		if state.gameParamsEnabled then
			startWatching()
			applyGameParams()
		else
			disconnectWatchers()
		end
		if state.gameParamsEnabled and state.gravityEnabled then
			applyGravity(state.gravityValue)
		else
			workspace.Gravity=DEFAULT_GRAVITY
		end
		if state.gameParamsEnabled and state.speedEnabled then
			ensureSpeedForcing()
		else
			stopSpeedForcing(false)
		end
		syncControls()
	end

	function api.Reset()
		state.gameParamsEnabled=false
		state.gravityEnabled=false
		state.gravityValue=DEFAULT_GRAVITY
		state.speedEnabled=false
		state.speedValue=DEFAULT_SPEED
		state.staminaRegenValue=10
		state.staminaDepleteValue=10
		state.jumpPowerValue=53.5
		state.divePowerValue=1.9
		api.Refresh()
		changed()
	end

	function api.Destroy()
		if destroyed then return end
		destroyed=true
		disconnectWatchers()
		safeDisconnect(inputConn)
		inputConn=nil
		safeDisconnect(destroyConn)
		destroyConn=nil
		destroyControl(toggle)
		destroyControl(gravitySlider)
		destroyControl(speedSlider)
		destroyControl(staminaRegenSlider)
		destroyControl(staminaDepleteSlider)
		destroyControl(jumpSlider)
		destroyControl(diveSlider)
		stopSpeedForcing(false)
	end

	local function handleSpeedInput(input)
		local speedKey=ctx.getSpeedToggleKey and ctx.getSpeedToggleKey() or Enum.KeyCode.Unknown
		if speedKey==nil or speedKey==Enum.KeyCode.Unknown then return false end

		local binding=inputToBinding and inputToBinding(input) or nil
		if binding==speedKey then
			api.SetSpeedState(not state.speedEnabled,true,true)
			return true
		end

		return false
	end

	inputConn=UIS.InputBegan:Connect(function(input,processed)
		if processed then return end
		handleSpeedInput(input)
	end)

	destroyConn=section.AncestryChanged:Connect(function()
		if not isAlive() then
			api.Destroy()
		end
	end)

	api.Refresh()

	return api
end

return GameParams
