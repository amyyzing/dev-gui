-- HB_RUNTIME_PART_5
-- Runtime chunk 5. Loaded by loader.lua with a shared environment.
function shutdownTool()
	if not toolAlive then return end

	sendPlayerSessionUpdate(true)
	toolAlive=false

	if AutoRefreshAPI and AutoRefreshAPI.Destroy then
		pcall(function()
			AutoRefreshAPI.Destroy()
		end)
		AutoRefreshAPI=nil
	end

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

function getPersistentValue(name,default)
	if name=="CURRENT_MODE_KEY" then return CURRENT_MODE_KEY end
	if name=="CURRENT_MODE_LABEL" then return CURRENT_MODE_LABEL end
	if PAGE1_STATE[name]~=nil then return PAGE1_STATE[name] end
	if name=="TOGGLE_UI_KEY" then return TOGGLE_UI_KEY end
	if name=="TOGGLE_HB_KEY" then return TOGGLE_HB_KEY end
	if name=="TOGGLE_JB_KEY" then return TOGGLE_JB_KEY end
	if name=="TOGGLE_AB_KEY" then return TOGGLE_AB_KEY end
	if name=="TOGGLE_ACTION_KEY" then return TOGGLE_ACTION_KEY end
	if name=="TOGGLE_SPEED_KEY" then return TOGGLE_SPEED_KEY end
	if name=="QB_AIM_LOCK_KEY" then return QB_AIM_LOCK_KEY end
	if name=="QB_AIM_THROW_KEY" then return QB_AIM_THROW_KEY end
	if name=="QB_AIM_TOGGLE_KEY" then return QB_AIM_TOGGLE_KEY end
	return default
end

function setPersistentValue(name,value)
	if name=="CURRENT_MODE_KEY" then CURRENT_MODE_KEY=tostring(value or "mode1") return end
	if name=="CURRENT_MODE_LABEL" then CURRENT_MODE_LABEL=tostring(value or "Gameplay") return end
	if PAGE1_STATE[name]~=nil then PAGE1_STATE[name]=value; syncPage1State(); return end
	if name=="TOGGLE_UI_KEY" then TOGGLE_UI_KEY=value return end
	if name=="TOGGLE_HB_KEY" then TOGGLE_HB_KEY=value return end
	if name=="TOGGLE_JB_KEY" then TOGGLE_JB_KEY=value return end
	if name=="TOGGLE_AB_KEY" then TOGGLE_AB_KEY=value return end
	if name=="TOGGLE_ACTION_KEY" then TOGGLE_ACTION_KEY=value return end
	if name=="TOGGLE_SPEED_KEY" then TOGGLE_SPEED_KEY=value return end
	if name=="QB_AIM_LOCK_KEY" then QB_AIM_LOCK_KEY=value return end
	if name=="QB_AIM_THROW_KEY" then QB_AIM_THROW_KEY=value return end
	if name=="QB_AIM_TOGGLE_KEY" then QB_AIM_TOGGLE_KEY=value return end
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

	if StrokeColourAPI and StrokeColourAPI.Refresh then pcall(StrokeColourAPI.Refresh) end
	if MapEditorAPI and MapEditorAPI.Refresh then pcall(MapEditorAPI.Refresh) end
	if AntiMaterialAPI and AntiMaterialAPI.Refresh then pcall(AntiMaterialAPI.Refresh) end
	if RemoveAdsAPI and RemoveAdsAPI.Refresh then pcall(RemoveAdsAPI.Refresh) end
	if MapCleanerAPI and MapCleanerAPI.Refresh then pcall(MapCleanerAPI.Refresh) end
	if DiscordAPI and DiscordAPI.Refresh then pcall(DiscordAPI.Refresh) end
	if refreshPage2UI then pcall(refreshPage2UI) end
	if applyUIStrokeTheme then pcall(applyUIStrokeTheme) end
	if updateResponsiveLayout then pcall(updateResponsiveLayout) end
	if refreshActionStatus then pcall(refreshActionStatus) end
end

AUTO_REFRESH_EFFECT_RESETTING=false

function resetRuntimeEffectsBeforeAutoRefresh()
	if AUTO_REFRESH_EFFECT_RESETTING then return end
	AUTO_REFRESH_EFFECT_RESETTING=true

	local function call(apiName,method,...)
		local api=PAGE1_APIS and PAGE1_APIS[apiName]
		local fn=api and api[method]
		if type(fn)=="function" then
			pcall(fn,...)
		end
	end

	local savedPage1State={}
	if PAGE1_STATE then
		for key,value in pairs(PAGE1_STATE) do
			savedPage1State[key]=value
		end
	end

	local savedSmoothPlastic=WORLD_SETTINGS and WORLD_SETTINGS.SmoothPlastic

	call("Hitbox","SetHitboxLock",false,false)
	call("Gravity","SetGravityState",false,false)
	call("Speed","SetSpeedState",false,false,true)

	if PAGE1_APIS and PAGE1_APIS.GameParams then
		call("GameParams","SetStaminaRegenValue",10,false)
		call("GameParams","SetStaminaDepleteValue",10,false)
		call("GameParams","SetJumpPowerValue",53.5,false)
		call("GameParams","SetDivePowerValue",1.9,false)
		call("GameParams","SetGameParamsState",false,false)
	end

	call("Boost","SetJumpBoostState",false,false)
	call("Boost","SetAlwaysBoostState",false,false)
	call("ESP","SetESPState",false,false)
	call("QBAim","SetQBAimState",false)
	call("Testing","SetTestingState",false,false)

	if AntiMaterialAPI and AntiMaterialAPI.SetEnabled then
		pcall(AntiMaterialAPI.SetEnabled,false,false)
	elseif WORLD_SETTINGS then
		if typeof and typeof(WORLD_SETTINGS.Conn)=="RBXScriptConnection" then
			pcall(function()
				WORLD_SETTINGS.Conn:Disconnect()
			end)
		end

		WORLD_SETTINGS.Conn=nil
		if type(WORLD_SETTINGS.OriginalMaterials)=="table" then
			for part,material in pairs(WORLD_SETTINGS.OriginalMaterials) do
				if part and part.Parent and part:IsA("BasePart") then
					pcall(function()
						part.Material=material
					end)
				end
			end
			WORLD_SETTINGS.OriginalMaterials={}
		end
		WORLD_SETTINGS.SmoothPlastic=false
	end

	if PAGE1_STATE then
		PAGE1_STATE.hitboxOn=false
		PAGE1_STATE.gravityEnabled=false
		PAGE1_STATE.gravityValue=196.2
		PAGE1_STATE.speedEnabled=false
		PAGE1_STATE.speedValue=18
		PAGE1_STATE.gameParamsEnabled=false
		PAGE1_STATE.staminaRegenValue=10
		PAGE1_STATE.staminaDepleteValue=10
		PAGE1_STATE.jumpPowerValue=53.5
		PAGE1_STATE.divePowerValue=1.9
		PAGE1_STATE.jumpBoostOn=false
		PAGE1_STATE.jumpBoostTradeMode=false
		PAGE1_STATE.actionStatusOn=false
		PAGE1_STATE.qbAimEnabled=false
		PAGE1_STATE.testingEnabled=false
	end

	if PAGE1_STATE then
		for key,value in pairs(savedPage1State) do
			PAGE1_STATE[key]=value
		end
	end

	if WORLD_SETTINGS and savedSmoothPlastic~=nil then
		WORLD_SETTINGS.SmoothPlastic=savedSmoothPlastic and true or false
	end

	pcall(function()
		workspace.Gravity=196.2
	end)

	if syncPage1State then pcall(syncPage1State) end
	if refreshActionStatus then pcall(refreshActionStatus) end

	AUTO_REFRESH_EFFECT_RESETTING=false
end

function buildDataSaveContext()
	return {
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
		refreshPage2UI=function() if refreshPage2UI then refreshPage2UI() end end,
		rebuildOwnedList=function() if refreshPage2UI then refreshPage2UI() end end,
		refreshSettingsPage=refreshSettingsPage,
		applyUIStrokeTheme=applyUIStrokeTheme,
		updateResponsiveLayout=updateResponsiveLayout,
		refreshActionStatus=refreshActionStatus,

		setHitboxSize=function(x,y,z) PAGE1_STATE.sizeX=x; PAGE1_STATE.sizeY=y; PAGE1_STATE.sizeZ=z; syncPage1State() end,
		setTransparency=function(v) PAGE1_STATE.targetTransparency=v; syncPage1State() end,
		setGravity=function(v) PAGE1_STATE.gravityValue=v; syncPage1State() end,
		setGravityState=function(v)
			PAGE1_STATE.gravityEnabled=v and true or false
			syncPage1State()
			if PAGE1_APIS.Gravity and PAGE1_APIS.Gravity.SetGravityState then
				pcall(PAGE1_APIS.Gravity.SetGravityState,PAGE1_STATE.gravityEnabled,false)
			end
		end,
		setHitboxLock=function(v) PAGE1_STATE.hitboxOn=v and true or false; syncPage1State() end,
		setSpeedValue=function(v) PAGE1_STATE.speedValue=v; syncPage1State() end,
		setSpeedState=function(v) PAGE1_STATE.speedEnabled=v and true or false; syncPage1State() end,
		setGameParamsState=function(v)
			PAGE1_STATE.gameParamsEnabled=v and true or false
			syncPage1State()
			if PAGE1_APIS.GameParams and PAGE1_APIS.GameParams.SetGameParamsState then
				pcall(PAGE1_APIS.GameParams.SetGameParamsState,PAGE1_STATE.gameParamsEnabled,false)
			end
		end,
		setStaminaRegenValue=function(v) PAGE1_STATE.staminaRegenValue=v; syncPage1State() end,
		setStaminaDepleteValue=function(v) PAGE1_STATE.staminaDepleteValue=v; syncPage1State() end,
		setJumpPowerValue=function(v) PAGE1_STATE.jumpPowerValue=v; syncPage1State() end,
		setDivePowerValue=function(v) PAGE1_STATE.divePowerValue=v; syncPage1State() end,
		setJumpBoostState=function(v) PAGE1_STATE.jumpBoostOn=v and true or false; syncPage1State() end,
		setESPState=function(v)
			PAGE1_STATE.actionStatusOn=v and true or false
			syncPage1State()
			if PAGE1_APIS.ESP and PAGE1_APIS.ESP.SetESPState then
				pcall(PAGE1_APIS.ESP.SetESPState,PAGE1_STATE.actionStatusOn,false)
			end
		end,
		setQBAimState=function(v)
			PAGE1_STATE.qbAimEnabled=v and true or false
			syncPage1State()
			if PAGE1_APIS.QBAim and PAGE1_APIS.QBAim.SetQBAimState then
				pcall(PAGE1_APIS.QBAim.SetQBAimState,PAGE1_STATE.qbAimEnabled)
			end
		end,
		setQBAimTeamFilter=function(v)
			PAGE1_STATE.qbAimTeamFilter=v and true or false
			syncPage1State()
			if PAGE1_APIS.QBAim and PAGE1_APIS.QBAim.SetTeamFilterState then
				pcall(PAGE1_APIS.QBAim.SetTeamFilterState,PAGE1_STATE.qbAimTeamFilter,false)
			end
		end,
		setQBAimShowArc=function(v)
			PAGE1_STATE.qbAimShowArc=v and true or false
			syncPage1State()
			if PAGE1_APIS.QBAim and PAGE1_APIS.QBAim.SetShowArcState then
				pcall(PAGE1_APIS.QBAim.SetShowArcState,PAGE1_STATE.qbAimShowArc,false)
			end
		end,
		setQBAimLeadDelay=function(v)
			PAGE1_STATE.qbAimLeadDelay=v
			syncPage1State()
			if PAGE1_APIS.QBAim and PAGE1_APIS.QBAim.SetLeadDelay then
				pcall(PAGE1_APIS.QBAim.SetLeadDelay,PAGE1_STATE.qbAimLeadDelay,false)
			end
		end,
		setQBAimPeakHeight=function(v)
			PAGE1_STATE.qbAimPeakHeight=v
			syncPage1State()
			if PAGE1_APIS.QBAim and PAGE1_APIS.QBAim.SetPeakHeight then
				pcall(PAGE1_APIS.QBAim.SetPeakHeight,PAGE1_STATE.qbAimPeakHeight,false)
			end
		end,
		setTestingState=function(v)
			PAGE1_STATE.testingEnabled=v and true or false
			syncPage1State()
			if PAGE1_APIS.Testing and PAGE1_APIS.Testing.SetTestingState then
				pcall(PAGE1_APIS.Testing.SetTestingState,PAGE1_STATE.testingEnabled,false)
			end
		end,
	}
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

if AnnouncementModule and AnnouncementModule.new then
	local ok,result=pcall(function()
		return AnnouncementModule.new({
			New=New,
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
modeSubtitle.Text=getMainDescriptionText()
sendPlayerLog()
startAutoRefresh()
finishLoader()
