function shutdownTool()
	if not toolAlive then return end

	task.spawn(sendPlayerSessionUpdate,true)

	if cleanupForManualReload then
		cleanupForManualReload(true)
	else
		toolAlive=false
		if disconnectRuntimeConnections then
			disconnectRuntimeConnections()
		end
	end

	if screenGui and screenGui.Parent then
		screenGui:Destroy()
	end
end

trackRuntimeConnection(closeBtn.Activated:Connect(shutdownTool))

function applyHitboxPreset(index)
	local preset=hitboxPresets[index]
	if not preset or not preset.size then return end

	local size=preset.size
	mainPageState.sizeX=size.X
	mainPageState.sizeY=size.Y
	mainPageState.sizeZ=size.Z

	if mainPageApis.Hitbox and type(mainPageApis.Hitbox.SetHitboxSize)=="function" then
		pcall(function()
			mainPageApis.Hitbox.SetHitboxSize(size.X,size.Y,size.Z,true)
		end)
	elseif mainPageApis.Hitbox and type(mainPageApis.Hitbox.Refresh)=="function" then
		syncMainState()
		pcall(mainPageApis.Hitbox.Refresh)
		requestPlayerAutosave()
	else
		syncMainState()
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
	if bind~=nil and bind==uiToggleKey and uiToggleKey~=Enum.KeyCode.Unknown then
		setUIVisible(not uiVisible)
		handled=true
	end

	if bind~=nil and bind==espToggleKey and espToggleKey~=Enum.KeyCode.Unknown then
		if not(mainPageApis.ESP and mainPageApis.ESP.SetESPState) then
			if currentModeKey=="mode1" then
				mainPageState.actionStatusOn=not mainPageState.actionStatusOn
				syncMainState()
				refreshActionStatus()
				requestPlayerAutosave()
			else
				mainPageState.actionStatusOn=false
				syncMainState()
				refreshActionStatus()
			end
			handled=true
		end
	end

	if bind~=nil then
		for i,preset in ipairs(hitboxPresets) do
			if preset.key and preset.key~=Enum.KeyCode.Unknown and bind==preset.key then
				applyHitboxPreset(i)
				handled=true
				break
			end
		end
	end

	return handled
end

trackRuntimeConnection(inputService.InputBegan:Connect(function(inp,processed)
	handleGlobalInput(inp,processed)
end))

local runtimeEnv=(getfenv and getfenv()) or _G
local persistentKeys={
	currentModeKey=true,
	currentModeLabel=true,
	uiToggleKey=true,
	hitboxToggleKey=true,
	boostToggleKey=true,
	alwaysBoostToggleKey=true,
	espToggleKey=true,
	qbAimLockKey=true,
	qbAimThrowKey=true,
	qbAimToggleKey=true,
	autoSTKey=true,
	jpvKey=true,
	stickyHeadKey=true,
}
local persistentStringDefaults={
	currentModeKey="mode1",
	currentModeLabel="Gameplay",
}
local refreshApis={
	"ColorsAPI",
	"MapEditorAPI",
	"MaterialsAPI",
	"AdsAPI",
	"MapCleanerAPI",
	"DiscordAPI",
}
local refreshFunctions={
	"refreshPage2UI",
	"applyUIStrokeTheme",
	"updateResponsiveLayout",
	"refreshActionStatus",
}
function getPersistentValue(name,default)
	if mainPageState and mainPageState[name]~=nil then return mainPageState[name] end
	if persistentKeys[name] and runtimeEnv[name]~=nil then return runtimeEnv[name] end
	return default
end

function setPersistentValue(name,value)
	if mainPageState and mainPageState[name]~=nil then
		mainPageState[name]=value
		syncMainState()
		return
	end

	local stringDefault=persistentStringDefaults[name]
	if stringDefault then
		value=tostring(value or stringDefault)
	end

	if persistentKeys[name] then
		runtimeEnv[name]=value
	end
end

function refreshAllUI()
	if refreshRuntimePageControls then
		pcall(refreshRuntimePageControls,"main")
	else
		for _,api in pairs(mainPageApis) do
			if api and type(api.Refresh)=="function" then pcall(api.Refresh) end
		end
		syncMainState()
	end

	if refreshRuntimeAPIs then
		refreshRuntimeAPIs(refreshApis)
	end

	for _,fnName in ipairs(refreshFunctions) do
		local fn=runtimeEnv[fnName]
		if type(fn)=="function" then pcall(fn) end
	end
end

local saveStateSetters={
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
	setBoostBypassCooldown={"boostBypassCooldown",true,"Boost","SetBypassCooldownState",true},
	setGravityState={"gravityEnabled",true,"GameParams","SetGravityState",true},
	setGameParamsState={"gameParamsEnabled",true,"GameParams","SetGameParamsState",true},
	setESPState={"actionStatusOn",true,"ESP","SetESPState",true},
	setQBAimState={"qbAimEnabled",true,"QBAim","SetQBAimState"},
	setQBAimTeamFilter={"qbAimTeamFilter",true,"QBAim","SetTeamFilterState",true},
	setQBAimShowArc={"qbAimShowArc",true,"QBAim","SetShowArcState",true},
	setQBAimTargetHighlight={"qbAimTargetHighlight",true,"QBAim","SetTargetHighlightState",true},
	setQBAimLeadDelay={"qbAimLeadDelay",false,"QBAim","SetLeadDelay",true},
	setQBAimPeakHeight={"qbAimPeakHeight",false,"QBAim","SetPeakHeight",true},
	setQBAimThrowDelay={"qbAimThrowDelay",false,"QBAim","SetThrowDelay",true},
	setTestingState={"testingEnabled",true,"Testing","SetTestingState",true},
	setTestingWRState={"testingWREnabled",true,"Testing","SetTestingWRState",true},
	setTestingQBState={"testingQBEnabled",true,"Testing","SetTestingQBState",true},
	setJPVPullValue={"jpvPullValue",false,"JPV","SetPullValue",true},
	setJPVMaxDistance={"jpvMaxDistance",false,"JPV","SetMaxDistance",true},
	setStickyHeadRange={"stickyHeadRange",false,"StickyHead","SetRange",true},
	setStickyHeadSmoothness={"stickyHeadSmoothness",false,"StickyHead","SetSmoothness",true},
	setStickyHeadStrength={"stickyHeadStrength",false,"StickyHead","SetStrength",true},
}

local function callMainApi(apiName,method,...)
	local api=mainPageApis and mainPageApis[apiName]
	local fn=api and api[method]
	if type(fn)=="function" then
		pcall(fn,...)
	end
end

local function setMainField(key,value,coerceBool)
	mainPageState[key]=coerceBool and (value and true or false) or value
	syncMainState()
	return mainPageState[key]
end

local function refreshPage2RuntimeUI()
	if refreshPage2UI then refreshPage2UI() end
end

local function attachDataSaveSetters(app)
	app.setHitboxSize=function(x,y,z)
		mainPageState.sizeX=x
		mainPageState.sizeY=y
		mainPageState.sizeZ=z
		syncMainState()
	end

	for setterName,spec in pairs(saveStateSetters) do
		app[setterName]=function(value)
			local stateValue=setMainField(spec[1],value,spec[2])
			if spec[3] then
				if spec[5] then
					callMainApi(spec[3],spec[4],stateValue,false)
				else
					callMainApi(spec[3],spec[4],stateValue)
				end
			end
		end
	end

	app.setSpeedState=function(value)
		local stateValue=setMainField("speedEnabled",value,true)
		mainPageState.speedParamsEnabled=stateValue
		mainPageState.speedSettingEnabled=stateValue
		syncMainState()
		callMainApi("GameParams","SetSpeedState",stateValue,false)
	end

	app.setGravityState=function(value)
		local stateValue=setMainField("gravityEnabled",value,true)
		mainPageState.gravityJumpParamsEnabled=stateValue
		mainPageState.gravitySettingEnabled=stateValue
		syncMainState()
		callMainApi("GameParams","SetGravityState",stateValue,false)
	end

	app.setGameParamsState=function()
		local stateValue=setMainField("gameParamsEnabled",true,true)
		callMainApi("GameParams","SetGameParamsState",stateValue,false)
	end

	app.setParamsSelectedPage=function(value)
		local stateValue=setMainField("paramsSelectedPage",tostring(value or "speed"),false)
		callMainApi("GameParams","SetParamsSelectedPage",stateValue,false)
	end

	app.setSpeedParamsState=function(value)
		local stateValue=setMainField("speedParamsEnabled",value,true)
		mainPageState.speedEnabled=stateValue
		mainPageState.speedSettingEnabled=stateValue
		mainPageState.diveSettingEnabled=stateValue
		syncMainState()
		callMainApi("GameParams","SetParamsPageEnabled","speed",stateValue,false)
	end

	app.setGravityJumpParamsState=function(value)
		local stateValue=setMainField("gravityJumpParamsEnabled",value,true)
		mainPageState.gravityEnabled=stateValue
		mainPageState.gravitySettingEnabled=stateValue
		mainPageState.jumpPowerSettingEnabled=stateValue
		syncMainState()
		callMainApi("GameParams","SetParamsPageEnabled","gravity",stateValue,false)
	end

	app.setStaminaParamsState=function(value)
		local stateValue=setMainField("staminaParamsEnabled",value,true)
		mainPageState.staminaRegenSettingEnabled=stateValue
		mainPageState.staminaDepleteSettingEnabled=stateValue
		syncMainState()
		callMainApi("GameParams","SetParamsPageEnabled","stamina",stateValue,false)
	end

	local function setParamSettingState(stateKey,value)
		local stateValue=setMainField(stateKey,value,true)
		if stateKey=="speedSettingEnabled" then
			mainPageState.speedEnabled=stateValue
		elseif stateKey=="gravitySettingEnabled" then
			mainPageState.gravityEnabled=stateValue
		end
		mainPageState.speedParamsEnabled=mainPageState.speedSettingEnabled==true or mainPageState.diveSettingEnabled==true
		mainPageState.gravityJumpParamsEnabled=mainPageState.gravitySettingEnabled==true or mainPageState.jumpPowerSettingEnabled==true
		mainPageState.staminaParamsEnabled=mainPageState.staminaRegenSettingEnabled==true or mainPageState.staminaDepleteSettingEnabled==true
		syncMainState()
		callMainApi("GameParams","SetParamSettingEnabled",stateKey,stateValue,false)
	end

	app.setSpeedSettingState=function(value)
		setParamSettingState("speedSettingEnabled",value)
	end

	app.setDiveSettingState=function(value)
		setParamSettingState("diveSettingEnabled",value)
	end

	app.setGravitySettingState=function(value)
		setParamSettingState("gravitySettingEnabled",value)
	end

	app.setJumpPowerSettingState=function(value)
		setParamSettingState("jumpPowerSettingEnabled",value)
	end

	app.setStaminaRegenSettingState=function(value)
		setParamSettingState("staminaRegenSettingEnabled",value)
	end

	app.setStaminaDepleteSettingState=function(value)
		setParamSettingState("staminaDepleteSettingEnabled",value)
	end

	return app
end

function buildDataSaveContext()
	return attachDataSaveSetters({
		botApi=botApi,
		me=me,
		playerId=tostring(me.UserId),
		toolAlive=toolAlive,
		isToolAlive=function()
			return toolAlive
		end,
		Services=sharedRuntime,
		schedulerApi=jobRunner,
		StateStore=settingsStore,
		ThemeStore=themeRuntime,
		Janitor=cleanupBags,

		State=mainPageState,
		Get=getPersistentValue,
		Set=setPersistentValue,
		getCurrentModeKey=function()
			return currentModeKey
		end,

		hitboxPresets=hitboxPresets,
		defaultHitboxPresets=defaultHitboxPresets,
		savedPresets=savedPresets,
		expandedOwned=expandedOwnedPresets,

		style=style,
		themes=guiThemes,
		windowState=windowState,
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
			if previous and previous~=result and type(previous.Destroy)=="function" then
				if type(previous.SaveNow)=="function" then
					pcall(previous.SaveNow)
				end
				pcall(previous.Destroy)
			end
			DataSaveAPI=result
		else
			DataSaveAPI=previous
			warn("data save failed:",result)
			return false
		end
	else
		warn("missing module: data-save/data-save.lua")
		return false
	end

	if loadRemoteData and DataSaveAPI then
		pcall(function()
			if type(DataSaveAPI.Load)=="function" then
				DataSaveAPI.Load()
			end
			if type(DataSaveAPI.LoadOwnedPresets)=="function" then
				DataSaveAPI.LoadOwnedPresets()
			end
		end)

	end

	refreshAllUI()
	return DataSaveAPI~=nil
end

rebuildDataSaveFromModule(true)
loaderPhaseCurrent=(loaderPhaseCurrent or #startupModuleFiles)+1
if setLoaderProgress then
	setLoaderProgress("Restored saved state.",loaderPhaseCurrent,loaderStepTotal,false)
end

local pagesReady=true
if buildAllRuntimePages then
	local ok,result=pcall(buildAllRuntimePages)
	pagesReady=ok and result~=false
	if not pagesReady then
		warn("gui build failed:",ok and result or result)
	end
end

if AnnouncementModule and AnnouncementModule.new then
	if setLoaderProgress then
		setLoaderProgress("Binding announcements.",loaderStepTotal-2,loaderStepTotal,false)
	end

	local ok,result=pcall(function()
		return AnnouncementModule.new({
			make=make,
			fusion=FusionModule,
			Services=sharedRuntime,
			schedulerApi=jobRunner,
			StateStore=settingsStore,
			ThemeStore=themeRuntime,
			Janitor=cleanupBags,
			colors=colors,
			screenGui=screenGui,
			botApi=botApi,
			playerId=tostring(me.UserId),
			getSessionId=function() return playerSessionId end,
			wrapTextButton=wrapTextButton,
			safeDisconnect=safeDisconnect,
		})
	end)

	if ok then
		AnnouncementAPI=result
	else
		warn("announcement failed:",result)
	end
else
	warn("missing module: announcement.lua")
end

playerLogSent=false
sendPlayerSessionUpdate=function(final)
	if not playerSessionId then return end

	local ok,result=pcall(function()
		return botApi.Post("/player/session",{
			playerId=tostring(me.UserId),
			sessionId=playerSessionId,
			modeKey=currentModeKey,
			modeLabel=currentModeLabel,
			final=final and true or false,
		})
	end)

	if not ok or not result or not result.ok then
		warn("session update failed:",ok and result and result.error or result)
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
	if playerLogSent or playerLogSending then return end
	playerLogSending=true

	task.defer(function()
		task.wait(1)
		for attempt=1,3 do
			local ok,result=pcall(function()
				return botApi.Post("/player/log",{
					playerId=tostring(me.UserId),
					username=me.Name,
					displayName=me.DisplayName,
					modeKey=currentModeKey,
					modeLabel=currentModeLabel,
				})
			end)

			if ok and result and result.ok then
				playerLogSent=true
				playerSessionId=result.sessionId
				playerLogSending=false
				startPlayerSessionHeartbeat()
				return
			end

			warn("player log failed:",ok and result and result.error or result)
			if attempt<3 then task.wait(2) end
		end

		playerLogSending=false
	end)
end

setActivePage("main")
if setLoaderProgress then
	setLoaderProgress("applying theme",loaderStepTotal-1,loaderStepTotal,false)
end
applyUIStrokeTheme()
refreshAllUI()
refreshActionStatus()
if mainFrame and type(mainFrame.RefreshText)=="function" then
	mainFrame.RefreshText(description)
elseif modeSubtitle then
	modeSubtitle.Text=getMainDescriptionText()
end
sendPlayerLog()
initManualRefresh()
if modulesLoadedAtBoot==false then
	setLoaderProgress("modules failed. press update, then run again.",loaderStepTotal,loaderStepTotal,true)
elseif pagesReady==false or #runtimeBuildErrors>0 then
	setLoaderProgress("some gui pages failed",loaderStepTotal,loaderStepTotal,true)
else
	setLoaderProgress("ready. jobs: "..tostring(jobRunner.Count()),loaderStepTotal,loaderStepTotal,false)
	finishLoader()
end
