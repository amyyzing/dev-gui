-- applies speed, gravity, jump, stamina, and dive values.

local GameParams={}

local Players=game:GetService("Players")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local UIS=game:GetService("UserInputService")
local RunService=game:GetService("RunService")

local me=Players.LocalPlayer
local DEFAULT_GRAVITY=196.2
local DEFAULT_SPEED=18
local SPEED_FORCE_INTERVAL=0.05
local DEFAULT_SELECTED_PAGE="speed"
local PARAMS={
	JumpPower="jumpPowerValue",
	DivePower="divePowerValue",
	SprintStaminaRegenRate="staminaRegenValue",
	SprintStaminaDepleteRate="staminaDepleteValue",
}

local PARAM_STATE_PAGE={
	jumpPowerValue="gravity",
	divePowerValue="speed",
	staminaRegenValue="stamina",
	staminaDepleteValue="stamina",
}

local PAGE_ENABLED_KEY={
	speed="speedParamsEnabled",
	gravity="gravityJumpParamsEnabled",
	stamina="staminaParamsEnabled",
}
local PARAM_ENABLED_KEY={
	gravityValue="gravitySettingEnabled",
	speedValue="speedSettingEnabled",
	jumpPowerValue="jumpPowerSettingEnabled",
	divePowerValue="diveSettingEnabled",
	staminaRegenValue="staminaRegenSettingEnabled",
	staminaDepleteValue="staminaDepleteSettingEnabled",
}
local PAGE_SETTING_KEYS={
	speed={"speedSettingEnabled","diveSettingEnabled"},
	gravity={"gravitySettingEnabled","jumpPowerSettingEnabled"},
	stamina={"staminaRegenSettingEnabled","staminaDepleteSettingEnabled"},
}
local function clampStaminaDeplete(value)
	local n=tonumber(value)
	if not n then return 10 end
	return math.clamp(math.floor(math.abs(n)+0.5),0,50)
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

local function boolDefault(value,default)
	if value==nil then
		return default and true or false
	end

	return value and true or false
end

local function normalizePageKey(value)
	local raw=tostring(value or DEFAULT_SELECTED_PAGE):lower():gsub("%s+","")

	if raw=="speed" or raw=="1" then
		return"speed"
	elseif raw=="gravity" or raw=="jump" or raw=="gravityjump" or raw=="gravity/jump" or raw=="2" then
		return"gravity"
	elseif raw=="stamina" or raw=="3" then
		return"stamina"
	end

	return DEFAULT_SELECTED_PAGE
end

function GameParams.new(app)
	app=app or {}
	local safeDisconnect=app.safeDisconnect
	local inputToBinding=app.inputToBinding
	local state=app.State or {}
	local api={}
	local speedConn=nil
	local speedElapsed=0
	local inputConn=nil
	local rootConns={}
	local folderConns=setmetatable({}, {__mode="k"})
	local valueConns=setmetatable({}, {__mode="k"})
	local applying=false
	local destroyed=false
	local stateListener=nil

	local function disconnect(connection)
		if safeDisconnect then
			safeDisconnect(connection)
		elseif connection then
			pcall(function()
				connection:Disconnect()
			end)
		end
	end

	local function safeDisconnectAll(t)
		if not t then return end

		for _,connection in ipairs(t) do
			disconnect(connection)
		end

		table.clear(t)
	end

	local function changed()
		if app.onChanged then pcall(app.onChanged,state) end
	end

	local function notify(reason)
		if stateListener then
			pcall(stateListener,state,reason)
		end
	end
	local function clampNumber(value,min,max,fallback)
		local n=tonumber(value)
		if not n then return fallback end
		return math.clamp(n,min,max)
	end

	local function isSettingEnabled(settingKey)
		return state[settingKey]==true
	end

	local function isPageEnabled(pageKey)
		pageKey=normalizePageKey(pageKey)
		local keys=PAGE_SETTING_KEYS[pageKey]
		if keys then
			for _,key in ipairs(keys) do
				if isSettingEnabled(key) then
					return true
				end
			end
			return false
		end

		return state[PAGE_ENABLED_KEY[pageKey]]~=false
	end

	local function isStateKeyActive(stateKey)
		local enabledKey=PARAM_ENABLED_KEY[stateKey]
		if enabledKey then
			return isSettingEnabled(enabledKey)
		end

		local pageKey=PARAM_STATE_PAGE[stateKey]
		return not pageKey or isPageEnabled(pageKey)
	end

	local function isSpeedActive()
		return isSettingEnabled("speedSettingEnabled")
	end

	local function isGravityActive()
		return isSettingEnabled("gravitySettingEnabled")
	end

	local function normalizeState()
		state.gameParamsEnabled=true
		state.paramsSelectedPage=normalizePageKey(state.paramsSelectedPage)
		state.speedParamsEnabled=boolDefault(state.speedParamsEnabled,false)
		state.gravityJumpParamsEnabled=boolDefault(state.gravityJumpParamsEnabled,false)
		state.staminaParamsEnabled=boolDefault(state.staminaParamsEnabled,false)
		state.speedSettingEnabled=boolDefault(state.speedSettingEnabled,state.speedParamsEnabled)
		state.diveSettingEnabled=boolDefault(state.diveSettingEnabled,state.speedParamsEnabled)
		state.gravitySettingEnabled=boolDefault(state.gravitySettingEnabled,state.gravityJumpParamsEnabled)
		state.jumpPowerSettingEnabled=boolDefault(state.jumpPowerSettingEnabled,state.gravityJumpParamsEnabled)
		state.staminaRegenSettingEnabled=boolDefault(state.staminaRegenSettingEnabled,state.staminaParamsEnabled)
		state.staminaDepleteSettingEnabled=boolDefault(state.staminaDepleteSettingEnabled,state.staminaParamsEnabled)
		state.speedEnabled=state.speedSettingEnabled
		state.gravityEnabled=state.gravitySettingEnabled
		state.gravityValue=clampNumber(state.gravityValue,0,1000,DEFAULT_GRAVITY)
		state.speedValue=clampSpeed(state.speedValue)
		state.staminaRegenValue=clampNumber(state.staminaRegenValue,0,50,10)
		state.staminaDepleteValue=clampStaminaDeplete(state.staminaDepleteValue)
		state.jumpPowerValue=clampNumber(state.jumpPowerValue,0,300,53.5)
		state.divePowerValue=clampNumber(state.divePowerValue,0,15,1.9)
	end

	local function syncControls(reason)
		notify(reason or "sync")
	end

	local function isAlive()
		return not destroyed
	end

	local function applyGravity(value)
		local gravity=clampNumber(value,0,1000,DEFAULT_GRAVITY)
		state.gravityValue=gravity
		if isGravityActive() then
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
		disconnect(speedConn)
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
		if not isSpeedActive() then
			stopSpeedForcing(false)
			return
		end

		state.speedValue=clampSpeed(state.speedValue)
		applySpeedValue()

		if speedConn then
			return
		end

		speedConn=RunService.Heartbeat:Connect(function(dt)
			if not isSpeedActive() or not isAlive() then
				disconnect(speedConn)
				speedConn=nil
				return
			end

			speedElapsed=speedElapsed+(dt or 0)
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

		if app.getCurrentModeKey then
			local ok,modeKey=pcall(app.getCurrentModeKey)
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
			if applying or not isAlive() or not isStateKeyActive(stateKey) or not valueObject.Parent then
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
		if not isStateKeyActive(stateKey) then
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
		if folderConns[gameParams] then
			return
		end

		folderConns[gameParams]={}

		table.insert(folderConns[gameParams],gameParams.ChildAdded:Connect(function(child)
			if not isAlive() then return end

			local stateKey=PARAMS[child.Name]
			if stateKey and child:IsA("NumberValue") and isStateKeyActive(stateKey) then
				task.defer(function()
					if isAlive() and isStateKeyActive(stateKey) and child.Parent then
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
		if not isAlive() then return end

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
			task.defer(applyGameParams)
		end))

		table.insert(rootConns,root.DescendantAdded:Connect(function(descendant)
			local stateKey=PARAMS[descendant.Name]
			if descendant.Name=="GameParams" or (stateKey and isStateKeyActive(stateKey)) then
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
			if child.Name=="Games" or child.Name=="MiniGames" then
				watchRootFolder(child)
				task.defer(applyGameParams)
			end
		end))

		watchRootFolder(ReplicatedStorage:FindFirstChild("Games"))
		watchRootFolder(ReplicatedStorage:FindFirstChild("MiniGames"))
	end

	function api.GetState()
		return state
	end

	function api.NormalizePageKey(pageKey)
		return normalizePageKey(pageKey)
	end

	function api.IsParamsPageEnabled(pageKey)
		return isPageEnabled(pageKey)
	end

	function api.IsParamSettingEnabled(settingKey)
		return isSettingEnabled(settingKey)
	end

	function api.SetOnStateChanged(callback)
		stateListener=type(callback)=="function" and callback or nil
		if stateListener then
			notify("bind")
		end
	end
	function api.SetGravityState(value,fire)
		state.gravitySettingEnabled=value and true or false
		state.gravityEnabled=state.gravitySettingEnabled
		state.gravityJumpParamsEnabled=isPageEnabled("gravity")
		if isGravityActive() then
			applyGravity(state.gravityValue)
		end
		applyGameParams()
		if not isGravityActive() then
			workspace.Gravity=DEFAULT_GRAVITY
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetGravityValue(value,fire)
		state.gravityValue=clampNumber(value,0,1000,DEFAULT_GRAVITY)
		applyGravity(state.gravityValue)
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetSpeedState(value,fire,resetValue)
		state.speedSettingEnabled=value and true or false
		state.speedEnabled=state.speedSettingEnabled
		state.speedParamsEnabled=isPageEnabled("speed")
		state.speedValue=clampSpeed(state.speedValue)

		if isSpeedActive() then
			ensureSpeedForcing()
		end
		applyGameParams()
		if not isSpeedActive() then
			stopSpeedForcing(resetValue==true)
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetSpeedValue(value,fire)
		state.speedValue=clampSpeed(value)
		if isSpeedActive() then
			ensureSpeedForcing()
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetParamsSelectedPage(pageKey,fire)
		state.paramsSelectedPage=normalizePageKey(pageKey)
		syncControls("page")

		if fire~=false then
			changed()
		end
	end

	function api.ActivateParamsPage(pageKey,fire)
		api.SetParamsSelectedPage(pageKey,fire)
	end

	function api.SetParamsPageEnabled(pageKey,value,fire)
		pageKey=normalizePageKey(pageKey)
		local enabled=value and true or false
		state[PAGE_ENABLED_KEY[pageKey]]=enabled

		for _,settingKey in ipairs(PAGE_SETTING_KEYS[pageKey] or {}) do
			state[settingKey]=enabled
		end

		if pageKey=="speed" then
			state.speedEnabled=state.speedSettingEnabled
			if isSpeedActive() then
				ensureSpeedForcing()
			end
			applyGameParams()
			if not isSpeedActive() then
				stopSpeedForcing(false)
			end
		elseif pageKey=="gravity" then
			state.gravityEnabled=state.gravitySettingEnabled
			if isGravityActive() then
				applyGravity(state.gravityValue)
				applyGameParams()
			else
				workspace.Gravity=DEFAULT_GRAVITY
			end
		elseif pageKey=="stamina" then
			applyGameParams()
		end

		syncControls("page-toggle")

		if fire~=false then
			changed()
		end
	end

	function api.SetParamSettingEnabled(settingKey,value,fire)
		settingKey=tostring(settingKey or "")
		local allowed=false
		for _,keys in pairs(PAGE_SETTING_KEYS) do
			for _,key in ipairs(keys) do
				if key==settingKey then
					allowed=true
					break
				end
			end
			if allowed then break end
		end
		if not allowed then return end

		state[settingKey]=value and true or false
		state.speedParamsEnabled=isPageEnabled("speed")
		state.gravityJumpParamsEnabled=isPageEnabled("gravity")
		state.staminaParamsEnabled=isPageEnabled("stamina")
		state.speedEnabled=state.speedSettingEnabled
		state.gravityEnabled=state.gravitySettingEnabled

		if settingKey=="speedSettingEnabled" then
			if isSpeedActive() then
				ensureSpeedForcing()
			else
				stopSpeedForcing(false)
			end
			applyGameParams()
		elseif settingKey=="gravitySettingEnabled" then
			if isGravityActive() then
				applyGravity(state.gravityValue)
			else
				workspace.Gravity=DEFAULT_GRAVITY
			end
			applyGameParams()
		else
			applyGameParams()
		end

		syncControls("setting-toggle")

		if fire~=false then
			changed()
		end
	end

	function api.SetGameParamsState(_value,fire)
		state.gameParamsEnabled=true
		startWatching()
		applyGameParams()
		if isGravityActive() then
			applyGravity(state.gravityValue)
		else
			workspace.Gravity=DEFAULT_GRAVITY
		end
		if isSpeedActive() then
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
	function api.Refresh()
		normalizeState()
		startWatching()
		applyGameParams()
		if isGravityActive() then
			applyGravity(state.gravityValue)
		else
			workspace.Gravity=DEFAULT_GRAVITY
		end
		if isSpeedActive() then
			ensureSpeedForcing()
		else
			stopSpeedForcing(false)
		end
		syncControls()
	end

	function api.Reset()
		state.gameParamsEnabled=true
		state.paramsSelectedPage=DEFAULT_SELECTED_PAGE
		state.speedParamsEnabled=false
		state.gravityJumpParamsEnabled=false
		state.staminaParamsEnabled=false
		state.speedSettingEnabled=false
		state.diveSettingEnabled=false
		state.gravitySettingEnabled=false
		state.jumpPowerSettingEnabled=false
		state.staminaRegenSettingEnabled=false
		state.staminaDepleteSettingEnabled=false
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
		disconnect(inputConn)
		inputConn=nil
		stopSpeedForcing(false)
		stateListener=nil
	end

	api.Refresh()

	return api
end

return GameParams
