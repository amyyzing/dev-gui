-- HB_RUNTIME_PART_5
-- Runtime chunk 5. Loaded by loader.lua with a shared environment.
function shutdownTool()
	if not toolAlive then return end

	sendPlayerSessionUpdate(true)
	toolAlive=false

	if AnnouncementAPI and AnnouncementAPI.Destroy then
		pcall(function()
			AnnouncementAPI.Destroy()
		end)
	end

	if MainFrame and MainFrame.Destroy then
		pcall(function()
			MainFrame.Destroy()
		end)
	end

	if stopLiquidStrokeAnimation then
		pcall(stopLiquidStrokeAnimation)
	end

	if disconnectRuntimeConnections then
		disconnectRuntimeConnections()
	end

	if SG and SG.Parent then
		SG:Destroy()
	end
end

trackRuntimeConnection(closeBtn.Activated:Connect(shutdownTool))

function applyHitboxPreset(index)
	local preset=PRESETS[index]
	if not preset or not preset.size then return end

	local size=preset.size
	PAGE1_STATE.sizeX=size.X
	PAGE1_STATE.sizeY=size.Y
	PAGE1_STATE.sizeZ=size.Z

	if PAGE1_APIS.Hitbox and PAGE1_APIS.Hitbox.SetHitboxSize then
		pcall(function()
			PAGE1_APIS.Hitbox.SetHitboxSize(size.X,size.Y,size.Z,true)
		end)
	elseif PAGE1_APIS.Hitbox and PAGE1_APIS.Hitbox.Refresh then
		syncPage1State()
		pcall(PAGE1_APIS.Hitbox.Refresh)
		requestPlayerAutosave()
	else
		syncPage1State()
		requestPlayerAutosave()
	end
end

function handleGlobalInput(inp,processed)
	if activeCapture then
		local cap=activeCapture

		if inp.KeyCode==Enum.KeyCode.Escape then
			activeCapture=nil
			if refreshPage2UI then refreshPage2UI() end
			return true
		end

		local binding=inputToBinding(inp)
		if binding~=nil then
			cap.setter(binding)
		end

		activeCapture=nil

		if refreshPage2UI then
			refreshPage2UI()
		end

		return binding~=nil
	end

	if processed then return false end

	local bind=inputToBinding(inp)
	local handled=false
	if bind~=nil and bind==TOGGLE_UI_KEY and TOGGLE_UI_KEY~=Enum.KeyCode.Unknown then
		setUIVisible(not uiVisible)
		handled=true
	end

	if bind~=nil and bind==TOGGLE_ACTION_KEY and TOGGLE_ACTION_KEY~=Enum.KeyCode.Unknown then
		if not(PAGE1_APIS.ESP and PAGE1_APIS.ESP.SetESPState) then
			if CURRENT_MODE_KEY=="mode1" then
				PAGE1_STATE.actionStatusOn=not PAGE1_STATE.actionStatusOn
				syncPage1State()
				refreshActionStatus()
				requestPlayerAutosave()
			else
				PAGE1_STATE.actionStatusOn=false
				syncPage1State()
				refreshActionStatus()
			end
			handled=true
		end
	end

	if bind~=nil then
		for i,preset in ipairs(PRESETS) do
			if preset.key and preset.key~=Enum.KeyCode.Unknown and bind==preset.key then
				applyHitboxPreset(i)
				handled=true
				break
			end
		end
	end

	return handled
end

trackRuntimeConnection(UIS.InputBegan:Connect(function(inp,processed)
	handleGlobalInput(inp,processed)
end))

local RUNTIME_ENV=(getfenv and getfenv()) or _G
local PERSISTENT_GLOBAL_KEYS={
	CURRENT_MODE_KEY=true,
	CURRENT_MODE_LABEL=true,
	TOGGLE_UI_KEY=true,
	TOGGLE_HB_KEY=true,
	TOGGLE_JB_KEY=true,
	TOGGLE_AB_KEY=true,
	TOGGLE_ACTION_KEY=true,
	TOGGLE_SPEED_KEY=true,
	QB_AIM_LOCK_KEY=true,
	QB_AIM_THROW_KEY=true,
	QB_AIM_TOGGLE_KEY=true,
}
local PERSISTENT_STRING_DEFAULTS={
	CURRENT_MODE_KEY="mode1",
	CURRENT_MODE_LABEL="Gameplay",
}
local RUNTIME_REFRESH_APIS={
	"StrokeColourAPI",
	"MapEditorAPI",
	"AntiMaterialAPI",
	"RemoveAdsAPI",
	"MapCleanerAPI",
	"DiscordAPI",
}
local RUNTIME_REFRESH_FNS={
	"refreshPage2UI",
	"applyUIStrokeTheme",
	"updateResponsiveLayout",
	"refreshActionStatus",
}
function getPersistentValue(name,default)
	if PAGE1_STATE and PAGE1_STATE[name]~=nil then return PAGE1_STATE[name] end
	if PERSISTENT_GLOBAL_KEYS[name] and RUNTIME_ENV[name]~=nil then return RUNTIME_ENV[name] end
	return default
end

function setPersistentValue(name,value)
	if PAGE1_STATE and PAGE1_STATE[name]~=nil then
		PAGE1_STATE[name]=value
		syncPage1State()
		return
	end

	local stringDefault=PERSISTENT_STRING_DEFAULTS[name]
	if stringDefault then
		value=tostring(value or stringDefault)
	end

	if PERSISTENT_GLOBAL_KEYS[name] then
		RUNTIME_ENV[name]=value
	end
end

function refreshAllUI()
	if refreshRuntimePageControls then
		pcall(refreshRuntimePageControls,"main")
	else
		for _,api in pairs(PAGE1_APIS) do
			if api and api.Refresh then pcall(api.Refresh) end
		end
		syncPage1State()
	end

	if refreshRuntimeAPIs then
		refreshRuntimeAPIs(RUNTIME_REFRESH_APIS)
	end

	for _,fnName in ipairs(RUNTIME_REFRESH_FNS) do
		local fn=RUNTIME_ENV[fnName]
		if type(fn)=="function" then pcall(fn) end
	end
end

local DATA_SAVE_STATE_SETTERS={
	setTransparency={"targetTransparency"},
	setGravity={"gravityValue",false,"GameParams","SetGravityValue",true},
	setHitboxLock={"hitboxOn",true},
	setSpeedValue={"speedValue",false,"GameParams","SetSpeedValue",true},
	setSpeedState={"speedEnabled",true,"GameParams","SetSpeedState",true},
	setStaminaRegenValue={"staminaRegenValue"},
	setStaminaDepleteValue={"staminaDepleteValue"},
	setJumpPowerValue={"jumpPowerValue"},
	setDivePowerValue={"divePowerValue"},
	setJumpBoostState={"jumpBoostOn",true},
	setGravityState={"gravityEnabled",true,"GameParams","SetGravityState",true},
	setGameParamsState={"gameParamsEnabled",true,"GameParams","SetGameParamsState",true},
	setESPState={"actionStatusOn",true,"ESP","SetESPState",true},
	setQBAimState={"qbAimEnabled",true,"QBAim","SetQBAimState"},
	setQBAimTeamFilter={"qbAimTeamFilter",true,"QBAim","SetTeamFilterState",true},
	setQBAimShowArc={"qbAimShowArc",true,"QBAim","SetShowArcState",true},
	setQBAimLeadDelay={"qbAimLeadDelay",false,"QBAim","SetLeadDelay",true},
	setQBAimPeakHeight={"qbAimPeakHeight",false,"QBAim","SetPeakHeight",true},
	setQBAimQBDrift={"qbAimQBDrift",false,"QBAim","SetQBDrift",true},
	setQBAimQBYDrift={"qbAimQBYDrift",false,"QBAim","SetQBYDrift",true},
	setTestingState={"testingEnabled",true,"Testing","SetTestingState",true},
}

local function callPage1Api(apiName,method,...)
	local api=PAGE1_APIS and PAGE1_APIS[apiName]
	local fn=api and api[method]
	if type(fn)=="function" then
		pcall(fn,...)
	end
end

local function setPage1Field(key,value,coerceBool)
	PAGE1_STATE[key]=coerceBool and (value and true or false) or value
	syncPage1State()
	return PAGE1_STATE[key]
end

local function refreshPage2RuntimeUI()
	if refreshPage2UI then refreshPage2UI() end
end

local function attachDataSaveSetters(ctx)
	ctx.setHitboxSize=function(x,y,z)
		PAGE1_STATE.sizeX=x
		PAGE1_STATE.sizeY=y
		PAGE1_STATE.sizeZ=z
		syncPage1State()
	end

	for setterName,spec in pairs(DATA_SAVE_STATE_SETTERS) do
		ctx[setterName]=function(value)
			local stateValue=setPage1Field(spec[1],value,spec[2])
			if spec[3] then
				if spec[5] then
					callPage1Api(spec[3],spec[4],stateValue,false)
				else
					callPage1Api(spec[3],spec[4],stateValue)
				end
			end
		end
	end

	ctx.setSpeedState=function(value)
		local stateValue=setPage1Field("speedEnabled",value,true)
		PAGE1_STATE.speedParamsEnabled=stateValue
		syncPage1State()
		callPage1Api("GameParams","SetSpeedState",stateValue,false)
	end

	ctx.setGravityState=function(value)
		local stateValue=setPage1Field("gravityEnabled",value,true)
		PAGE1_STATE.gravityJumpParamsEnabled=stateValue
		syncPage1State()
		callPage1Api("GameParams","SetGravityState",stateValue,false)
	end

	ctx.setGameParamsState=function()
		local stateValue=setPage1Field("gameParamsEnabled",true,true)
		callPage1Api("GameParams","SetGameParamsState",stateValue,false)
	end

	ctx.setParamsSelectedPage=function(value)
		local stateValue=setPage1Field("paramsSelectedPage",tostring(value or "speed"),false)
		callPage1Api("GameParams","SetParamsSelectedPage",stateValue,false)
	end

	ctx.setSpeedParamsState=function(value)
		local stateValue=setPage1Field("speedParamsEnabled",value,true)
		PAGE1_STATE.speedEnabled=stateValue
		syncPage1State()
		callPage1Api("GameParams","SetParamsPageEnabled","speed",stateValue,false)
	end

	ctx.setGravityJumpParamsState=function(value)
		local stateValue=setPage1Field("gravityJumpParamsEnabled",value,true)
		PAGE1_STATE.gravityEnabled=stateValue
		syncPage1State()
		callPage1Api("GameParams","SetParamsPageEnabled","gravity",stateValue,false)
	end

	ctx.setStaminaParamsState=function(value)
		local stateValue=setPage1Field("staminaParamsEnabled",value,true)
		callPage1Api("GameParams","SetParamsPageEnabled","stamina",stateValue,false)
	end

	return ctx
end

function buildDataSaveContext()
	return attachDataSaveSetters({
		BOT_API=BOT_API,
		me=me,
		playerId=tostring(me.UserId),
		toolAlive=toolAlive,

		State=PAGE1_STATE,
		Get=getPersistentValue,
		Set=setPersistentValue,

		PRESETS=PRESETS,
		DEFAULT_PRESETS=DEFAULT_PRESETS,
		OWNED_PRESETS=OWNED_PRESETS,
		expandedOwned=PAGE2_EXPANDED_OWNED,

		UI_STYLE=UI_STYLE,
		UI_WINDOW=UI_WINDOW,
		WORLD_SETTINGS=WORLD_SETTINGS,
		root=root,
		getDefaultUIStyle=getDefaultUIStyle,

		RefreshAll=refreshAllUI,
		refreshPage2UI=refreshPage2RuntimeUI,
		rebuildOwnedList=refreshPage2RuntimeUI,
		refreshSettingsPage=refreshSettingsPage,
		applyUIStrokeTheme=applyUIStrokeTheme,
		updateResponsiveLayout=updateResponsiveLayout,
		refreshActionStatus=refreshActionStatus,
	})
end

function rebuildDataSaveFromModule(loadRemoteData)
	local previous=DataSaveAPI

	if DataSaveModule and DataSaveModule.new then
		local ok,result=pcall(function()
			return DataSaveModule.new(buildDataSaveContext())
		end)

		if ok then
			DataSaveAPI=result
		else
			DataSaveAPI=previous
			warn("DataSave module failed:",result)
			return false
		end
	else
		warn("Missing remote module: data-save/data-save.lua")
		return false
	end

	if loadRemoteData and DataSaveAPI then
		pcall(function()
			DataSaveAPI.Load()
			DataSaveAPI.LoadOwnedPresets()
		end)

		if WORLD_SETTINGS and WORLD_SETTINGS.SmoothPlastic and ensureRuntimePageBuilt then
			pcall(ensureRuntimePageBuilt,"maps")
		end
	end

	refreshAllUI()
	return DataSaveAPI~=nil
end

rebuildDataSaveFromModule(true)
if buildAllRuntimePages then
	pcall(buildAllRuntimePages)
end

if AnnouncementModule and AnnouncementModule.new then
	local ok,result=pcall(function()
		return AnnouncementModule.new({
			New=New,
			Fusion=FusionModule,
			THEME=THEME,
			SG=SG,
			BOT_API=BOT_API,
			playerId=tostring(me.UserId),
			getSessionId=function() return playerSessionId end,
			wrapTextButton=wrapTextButton,
			safeDisconnect=safeDisconnect,
		})
	end)

	if ok then
		AnnouncementAPI=result
	else
		warn("Announcement module failed:",result)
	end
else
	warn("Missing remote module: announcement.lua")
end

playerLogSent=false
sendPlayerSessionUpdate=function(final)
	if not playerSessionId then return end

	local ok,result=pcall(function()
		return BOT_API.Post("/player/session",{
			playerId=tostring(me.UserId),
			sessionId=playerSessionId,
			modeKey=CURRENT_MODE_KEY,
			modeLabel=CURRENT_MODE_LABEL,
			final=final and true or false,
		})
	end)

	if not ok or not result or not result.ok then
		warn("Player session update failed:",ok and result and result.error or result)
	end
end

function startPlayerSessionHeartbeat()
	if playerSessionHeartbeatStarted then return end
	playerSessionHeartbeatStarted=true

	task.spawn(function()
		while toolAlive and playerSessionId do
			task.wait(30)
			if toolAlive and playerSessionId then
				sendPlayerSessionUpdate(false)
			end
		end
	end)
end

function sendPlayerLog()
	if playerLogSent then return end
	playerLogSent=true

	task.defer(function()
		task.wait(1)

		local ok,result=pcall(function()
			return BOT_API.Post("/player/log",{
				playerId=tostring(me.UserId),
				username=me.Name,
				displayName=me.DisplayName,
				modeKey=CURRENT_MODE_KEY,
				modeLabel=CURRENT_MODE_LABEL,
			})
		end)

		if not ok or not result or not result.ok then
			warn("Player log failed:",ok and result and result.error or result)
			return
		end

		playerSessionId=result.sessionId
		startPlayerSessionHeartbeat()
	end)
end

setActivePage("main")
applyUIStrokeTheme()
refreshAllUI()
refreshActionStatus()
if MainFrame and MainFrame.RefreshText then
	MainFrame.RefreshText(Description)
elseif modeSubtitle then
	modeSubtitle.Text=getMainDescriptionText()
end
sendPlayerLog()
initManualRefresh()
finishLoader()
