-- HB_RUNTIME_PART_2
-- Runtime chunk 2. Loaded by loader.lua with a shared environment.
GuiLogic=GuiLogicModule.new({
	New=New,
	THEME=THEME,
	UI_STYLE=UI_STYLE,
	UIS=UIS,
	TweenService=TweenService,
	fmtNumber=fmtNumber,
	BOX_WRAPPERS=BOX_WRAPPERS,
	BUTTON_WRAPPERS=BUTTON_WRAPPERS,
	markThemeRole=markThemeRole,
	getUILibRuntimeStyle=getUILibRuntimeStyle,
})

attachHover=GuiLogic.attachHover
wrapTextBox=GuiLogic.wrapTextBox
placeWrappedBox=GuiLogic.placeWrappedBox
wrapTextButton=GuiLogic.wrapTextButton
placeWrappedButton=GuiLogic.placeWrappedButton
setWrappedButtonBg=GuiLogic.setWrappedButtonBg
makeSection=GuiLogic.makeSection
makeBox=GuiLogic.makeBox
buildSlider=GuiLogic.buildSlider
buildToggleRow=GuiLogic.buildToggleRow
HITBOX_ORIGINALS=HITBOX_ORIGINALS or {
	Transparency=setmetatable({}, {__mode="k"}),
	Size=setmetatable({}, {__mode="k"}),
}

Description=DescriptionModule or {}
rawMakeSection=makeSection
function makeSection(parent,order,titleText,subtitleText,options)
	if Description and type(Description.Section)=="function" then
		local ok,newTitle,newSubtitle=pcall(Description.Section,titleText,subtitleText)
		if ok then
			titleText=newTitle
			subtitleText=newSubtitle
		end
	end

	return rawMakeSection(parent,order,titleText,subtitleText,options)
end

LAZY_PAGE_BUILDERS={}
LAZY_PAGE_BUILT={}
function ensureRuntimePageBuilt(name)
	name=tostring(name or "main")
	local builder=LAZY_PAGE_BUILDERS[name]
	if not builder or LAZY_PAGE_BUILT[name] then
		if refreshRuntimePageControls then
			pcall(refreshRuntimePageControls,name)
		end
		return
	end

	LAZY_PAGE_BUILT[name]=true
	local ok,err=pcall(builder)
	if not ok then
		LAZY_PAGE_BUILT[name]=false
		warn("Lazy page build failed:",name,err)
	end

	if refreshRuntimePageControls then
		pcall(refreshRuntimePageControls,name)
	end
end

MainFrame=MainFrameModule.new({
	New=New,
	THEME=THEME,
	Description=Description,
	UI_WINDOW=UI_WINDOW,
	UI_PROFILE=getCurrentUILibProfile and getCurrentUILibProfile() or nil,
	getCurrentUILibProfile=getCurrentUILibProfile,
	SG=SG,
	UIS=UIS,
	TweenService=TweenService,
	RunService=RunService,
	safeDisconnect=safeDisconnect,
	wrapTextButton=wrapTextButton,
	attachHover=attachHover,
	getUIPrimaryColor=getUIPrimaryColor,
	getUIStrokeColor=getUIStrokeColor,
	getUIStrokeGradientColor=getUIStrokeGradientColor,
	isAlive=function()
		return toolAlive
	end,
	getModeLabel=function()
		return CURRENT_MODE_LABEL
	end,
	onPageActivated=ensureRuntimePageBuilt,
})

root=MainFrame.root
uiScale=MainFrame.uiScale
main=MainFrame.main
header=MainFrame.header
modeSubtitle=MainFrame.modeSubtitle
closeBtn=MainFrame.closeBtn
resetBtn=MainFrame.resetBtn
pageBar=MainFrame.pageBar
pageHost=MainFrame.pageHost
settingsPage=MainFrame.settingsPage
futurePage=MainFrame.futurePage
uiSettingsPage=MainFrame.uiSettingsPage
mapPage=MainFrame.mapPage
serverPage=MainFrame.serverPage
actualSettingsPage=MainFrame.actualSettingsPage
leftCol=MainFrame.leftCol
rightCol=MainFrame.rightCol
footer=MainFrame.footer

function getMainDescriptionText()
	if Description and type(Description.Get)=="function" then
		local ok,value=pcall(Description.Get,"Main.Description",CURRENT_MODE_LABEL.." loaded")
		if ok and value~=nil then
			return value
		end
	end

	return CURRENT_MODE_LABEL.." loaded"
end

function setActivePage(name)
	if MainFrame and MainFrame.SetActivePage then
		MainFrame.SetActivePage(name)
	end
end

function getActivePageName()
	if MainFrame and MainFrame.GetActivePageName then
		return MainFrame.GetActivePageName()
	end

	return "main"
end

updateResponsiveLayout=function()
	if MainFrame and MainFrame.UpdateResponsiveLayout then
		MainFrame.UpdateResponsiveLayout()
	end
end

refreshFooterResetButton=function()
	if MainFrame and MainFrame.RefreshFooterResetButton then
		MainFrame.RefreshFooterResetButton()
	end
end

AnnouncementAPI=nil
playerSessionId=nil
playerSessionHeartbeatStarted=false
sendPlayerSessionUpdate=function() end
resetKeybindPresetPageDefaults=function() end

DataSaveAPI=nil
requestPlayerAutosave=function()
	if DataSaveAPI and DataSaveAPI.Schedule then
		DataSaveAPI.Schedule()
	end
end

function makeLocalPresetCode(name)
	local base=string.upper(string.sub(string.gsub(tostring(name or ""),"[^%w]",""),1,3))
	if base=="" then base="GUI" end
	return base..tostring(math.random(100,999))
end

function setPresetSizeFromDataSave(index,x,y,z)
	if DataSaveAPI and DataSaveAPI.SetPresetSize then
		return DataSaveAPI.SetPresetSize(index,x,y,z)
	end

	local preset=PRESETS[index]
	if not preset then return false,"missing preset" end

	local oldSize=preset.size or Vector3.new(1,1,1)
	preset.size=Vector3.new(
		math.clamp(tonumber(x) or oldSize.X,0.1,50),
		math.clamp(tonumber(y) or oldSize.Y,0.1,50),
		math.clamp(tonumber(z) or oldSize.Z,0.1,50)
	)

	requestPlayerAutosave()
	return true,preset.size
end

function setPresetKeyFromDataSave(index,binding)
	if DataSaveAPI and DataSaveAPI.SetPresetKey then
		return DataSaveAPI.SetPresetKey(index,binding)
	end

	local preset=PRESETS[index]
	if not preset then return false,"missing preset" end

	preset.key=binding or Enum.KeyCode.Unknown
	requestPlayerAutosave()
	return true,preset.key
end

function resetPresetFromDataSave(index)
	if DataSaveAPI and DataSaveAPI.ResetPreset then
		return DataSaveAPI.ResetPreset(index)
	end

	local preset=PRESETS[index]
	local default=DEFAULT_PRESETS[index]
	if not preset or not default then return false,"missing preset" end

	preset.key=default.key
	preset.size=default.size
	requestPlayerAutosave()
	return true,preset
end

function applyPresetEditorFromDataSave(editor)
	if DataSaveAPI and DataSaveAPI.ApplyPresetEditor then
		return DataSaveAPI.ApplyPresetEditor(editor)
	end

	for i=1,4 do
		local item=editor and editor[i]
		if item and PRESETS[i] then
			PRESETS[i].key=item.key or item.Key or item.binding or item.Binding or Enum.KeyCode.Unknown
			PRESETS[i].size=Vector3.new(tonumber(item.x or item.X) or 1,tonumber(item.y or item.Y) or 1,tonumber(item.z or item.Z) or 1)
		end
	end

	requestPlayerAutosave()
	return true
end

function createOwnedPresetFromDataSave(name,editor)
	if DataSaveAPI and DataSaveAPI.CreateOwnedPreset then
		return DataSaveAPI.CreateOwnedPreset(name,editor)
	end

	local cleanName=tostring(name or ""):gsub("^%s*(.-)%s*$","%1")
	if cleanName=="" then return false,"Name cannot be empty." end

	local preset={Code=makeLocalPresetCode(cleanName),Name=cleanName,Data={PresetEditor=editor or {}}}
	table.insert(OWNED_PRESETS,preset)
	requestPlayerAutosave()
	return true,preset
end

function equipOwnedPresetFromDataSave(preset)
	if DataSaveAPI and DataSaveAPI.EquipOwnedPreset then
		return DataSaveAPI.EquipOwnedPreset(preset)
	end

	local data=preset and (preset.Data or preset.data) or {}
	local editor=data.PresetEditor or data.presetEditor
	if not editor and preset then
		editor=preset.presetEditor or preset.PresetEditor
	end

	return applyPresetEditorFromDataSave(editor or {})
end

function deleteOwnedPresetFromDataSave(code,index)
	if DataSaveAPI and DataSaveAPI.DeleteOwnedPreset then
		return DataSaveAPI.DeleteOwnedPreset(code,index)
	end

	for i=#OWNED_PRESETS,1,-1 do
		if tostring(OWNED_PRESETS[i].Code or OWNED_PRESETS[i].code or "")==tostring(code or "") then
			table.remove(OWNED_PRESETS,i)
			return true
		end
	end

	if index and OWNED_PRESETS[index] then
		table.remove(OWNED_PRESETS,index)
	end

	return true
end

PAGE1_STATE={
	hitboxOn=hitboxOn,
	sizeX=sizeX,
	sizeY=sizeY,
	sizeZ=sizeZ,
	targetTransparency=targetTransparency,
	gravityEnabled=gravityEnabled,
	gravityValue=gravityValue,
	speedEnabled=speedEnabled,
	speedValue=speedValue,
	gameParamsEnabled=gameParamsEnabled,
	staminaRegenValue=staminaRegenValue,
	staminaDepleteValue=staminaDepleteValue,
	jumpPowerValue=jumpPowerValue,
	divePowerValue=divePowerValue,
	jumpBoostOn=jumpBoostOn,
	jumpBoostTradeMode=jumpBoostTradeMode,
	boostForceY=boostForceY,
	boostCooldown=boostCooldown,
	boostChance=boostChance,
	ballDetectionRadius=ballDetectionRadius,
	actionStatusOn=actionStatusOn,
	qbAimEnabled=qbAimEnabled,
	qbAimTeamFilter=qbAimTeamFilter,
	qbAimShowArc=qbAimShowArc,
	qbAimLeadDelay=qbAimLeadDelay,
	qbAimPeakHeight=qbAimPeakHeight,
	testingEnabled=testingEnabled,
}

function syncPage1State()
	hitboxOn=PAGE1_STATE.hitboxOn
	sizeX=PAGE1_STATE.sizeX
	sizeY=PAGE1_STATE.sizeY
	sizeZ=PAGE1_STATE.sizeZ
	targetTransparency=PAGE1_STATE.targetTransparency
	gravityEnabled=PAGE1_STATE.gravityEnabled
	gravityValue=PAGE1_STATE.gravityValue
	speedEnabled=PAGE1_STATE.speedEnabled
	speedValue=PAGE1_STATE.speedValue
	gameParamsEnabled=PAGE1_STATE.gameParamsEnabled
	staminaRegenValue=PAGE1_STATE.staminaRegenValue
	staminaDepleteValue=PAGE1_STATE.staminaDepleteValue
	jumpPowerValue=PAGE1_STATE.jumpPowerValue
	divePowerValue=PAGE1_STATE.divePowerValue
	jumpBoostOn=PAGE1_STATE.jumpBoostOn
	jumpBoostTradeMode=PAGE1_STATE.jumpBoostTradeMode
	boostForceY=PAGE1_STATE.boostForceY
	boostCooldown=PAGE1_STATE.boostCooldown
	boostChance=PAGE1_STATE.boostChance
	ballDetectionRadius=PAGE1_STATE.ballDetectionRadius
	actionStatusOn=PAGE1_STATE.actionStatusOn
	qbAimEnabled=PAGE1_STATE.qbAimEnabled
	qbAimTeamFilter=PAGE1_STATE.qbAimTeamFilter
	qbAimShowArc=PAGE1_STATE.qbAimShowArc
	qbAimLeadDelay=PAGE1_STATE.qbAimLeadDelay
	qbAimPeakHeight=PAGE1_STATE.qbAimPeakHeight
	testingEnabled=PAGE1_STATE.testingEnabled
end

function refreshRuntimePageControls(name)
	name=tostring(name or "main")

	if name=="main" then
		syncPage1State()
		for _,api in pairs(PAGE1_APIS) do
			if api and api.Refresh then
				pcall(api.Refresh)
			end
		end
		syncPage1State()
		if refreshActionStatus then
			pcall(refreshActionStatus)
		end
	elseif name=="maps" then
		if refreshSettingsPage then
			pcall(refreshSettingsPage)
		end
	elseif name=="customize" then
		if StrokeColourAPI and StrokeColourAPI.Refresh then
			pcall(StrokeColourAPI.Refresh)
		end
	elseif name=="page2" then
		if refreshPage2UI then
			pcall(refreshPage2UI)
		end
	elseif name=="settings" then
		if PlayerDataAPI and PlayerDataAPI.Refresh then
			pcall(PlayerDataAPI.Refresh)
		end
		if DiscordAPI and DiscordAPI.Refresh then
			pcall(DiscordAPI.Refresh)
		end
	end

	if applyUIStrokeTheme then
		pcall(applyUIStrokeTheme)
	end
	if updateResponsiveLayout then
		pcall(updateResponsiveLayout)
	end
end

PAGE1_APIS={}
refreshActionStatus=function() end

function makePage1Ctx()
	return{
		New=New,
		THEME=THEME,
		State=PAGE1_STATE,
		makeSection=makeSection,
		buildSlider=buildSlider,
		buildToggleRow=buildToggleRow,
		HITBOX_ORIGINALS=HITBOX_ORIGINALS,
		fmtNumber=fmtNumber,
		safeDisconnect=safeDisconnect,
		inputToBinding=inputToBinding,
		Page1HitboxLogicModule=Page1HitboxLogicModule,
		Page1GravityLogicModule=Page1GravityLogicModule,
		Page1SpeedLogicModule=Page1SpeedLogicModule,
		Page1GameParamsLogicModule=Page1GameParamsLogicModule,
		Page1BoostLogicModule=Page1BoostLogicModule,
		Page1ESPLogicModule=Page1ESPLogicModule,
		Page1ESPDefenseLogicModule=Page1ESPDefenseLogicModule,
		Page1ESPOffenseLogicModule=Page1ESPOffenseLogicModule,
		Page1QBAimLogicModule=Page1QBAimLogicModule,
		Page1TestingLogicModule=Page1TestingLogicModule,
		getCurrentModeKey=function() return CURRENT_MODE_KEY end,
		getHitboxToggleKey=function() return TOGGLE_HB_KEY end,
		getSpeedToggleKey=function() return TOGGLE_SPEED_KEY end,
		getJumpBoostToggleKey=function() return TOGGLE_JB_KEY end,
		getAlwaysBoostToggleKey=function() return TOGGLE_AB_KEY end,
		getESPToggleKey=function() return TOGGLE_ACTION_KEY end,
		getQBAimLockKey=function() return QB_AIM_LOCK_KEY end,
		getQBAimThrowKey=function() return QB_AIM_THROW_KEY end,
		getQBAimToggleKey=function() return QB_AIM_TOGGLE_KEY end,
		Description=Description,
		ESPDefenseModule=Page1ESPDefenseLogicModule,
		ESPOffenseModule=Page1ESPOffenseLogicModule,
		refreshESPStatus=function(state,available)
			PAGE1_STATE.actionStatusOn=state and available~=false
			actionStatusOn=PAGE1_STATE.actionStatusOn
			refreshActionStatus()
		end,
		setCurrentMode=function(key,label)
			CURRENT_MODE_KEY=tostring(key or"mode1")
			CURRENT_MODE_LABEL=tostring(label or"Gameplay")
			if modeSubtitle then
				modeSubtitle.Text=getMainDescriptionText()
			end
			if PAGE1_APIS.GameParams and PAGE1_APIS.GameParams.Refresh then
				pcall(PAGE1_APIS.GameParams.Refresh)
			end
			if PAGE1_APIS.ESP and PAGE1_APIS.ESP.Refresh then
				pcall(PAGE1_APIS.ESP.Refresh)
			end
			if PAGE1_APIS.QBAim and PAGE1_APIS.QBAim.Refresh then
				pcall(PAGE1_APIS.QBAim.Refresh)
			end
			refreshActionStatus()
		end,
		onChanged=function()
			syncPage1State()
			requestPlayerAutosave()
			refreshActionStatus()
		end,
	}
end

function addPage1Error(parent,order,title,path)
	local section=makeSection(parent,order,title,"module failed to load")
	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,24),Text=path.." could not be loaded.",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
end

function buildPage1()
	local ctx=makePage1Ctx()

	if Page1HitboxModule and Page1HitboxModule.new then
		local ok,result=pcall(function()
			return Page1HitboxModule.new(ctx,leftCol)
		end)
		if ok then PAGE1_APIS.Hitbox=result else addPage1Error(leftCol,1,"Hitbox",tostring(result)) end
	else
		addPage1Error(leftCol,1,"Hitbox","page-1/hitbox/gui.lua")
	end

	if Page1GravityModule and Page1GravityModule.new then
		local ok,result=pcall(function()
			return Page1GravityModule.new(ctx,leftCol)
		end)
		if ok then PAGE1_APIS.Gravity=result else addPage1Error(leftCol,2,"Gravity",tostring(result)) end
	else
		addPage1Error(leftCol,2,"Gravity","page-1/gravity/gui.lua")
	end

	if Page1SpeedModule and Page1SpeedModule.new then
		local ok,result=pcall(function()
			return Page1SpeedModule.new(ctx,leftCol)
		end)
		if ok then PAGE1_APIS.Speed=result else addPage1Error(leftCol,3,"Speed",tostring(result)) end
	else
		addPage1Error(leftCol,3,"Speed","page-1/speed/gui.lua")
	end

	if Page1GameParamsModule and Page1GameParamsModule.new then
		local ok,result=pcall(function()
			return Page1GameParamsModule.new(ctx,leftCol)
		end)
		if ok then PAGE1_APIS.GameParams=result else addPage1Error(leftCol,4,"Game Params",tostring(result)) end
	else
		addPage1Error(leftCol,4,"Game Params","page-1/game-params/gui.lua")
	end

	if Page1BoostModule and Page1BoostModule.new then
		local ok,result=pcall(function()
			return Page1BoostModule.new(ctx,rightCol)
		end)
		if ok then PAGE1_APIS.Boost=result else addPage1Error(rightCol,2,"Boost",tostring(result)) end
	else
		addPage1Error(rightCol,2,"Boost","page-1/boost/gui.lua")
	end

	if Page1ESPModule and Page1ESPModule.new then
		local ok,result=pcall(function()
			return Page1ESPModule.new(ctx,rightCol)
		end)
		if ok then PAGE1_APIS.ESP=result else addPage1Error(rightCol,3,"ESP",tostring(result)) end
	else
		addPage1Error(rightCol,3,"ESP","page-1/esp/gui.lua")
	end

	if Page1QBAimModule and Page1QBAimModule.new then
		local ok,result=pcall(function()
			return Page1QBAimModule.new(ctx,rightCol)
		end)
		if ok then PAGE1_APIS.QBAim=result else addPage1Error(rightCol,4,"QB Aim",tostring(result)) end
	else
		addPage1Error(rightCol,4,"QB Aim","page-1/qb-aim/gui.lua")
	end

	if Page1TestingModule and Page1TestingModule.new then
		local ok,result=pcall(function()
			return Page1TestingModule.new(ctx,rightCol)
		end)
		if ok then PAGE1_APIS.Testing=result else addPage1Error(rightCol,5,"Testing",tostring(result)) end
	else
		addPage1Error(rightCol,5,"Testing","page-1/testing/gui.lua")
	end

	syncPage1State()
	refreshActionStatus()
end

function clearPage1Column(column)
	if not column then return end

	for _,child in ipairs(column:GetChildren()) do
		if not child:IsA("UIListLayout") then
			child:Destroy()
		end
	end
end

rebuildPage1FromModules=function()
	for _,api in pairs(PAGE1_APIS) do
		if api and api.Destroy then
			pcall(api.Destroy)
		end
	end

	PAGE1_APIS={}
	clearPage1Column(leftCol)
	clearPage1Column(rightCol)
	buildPage1()

	if updateResponsiveLayout then
		pcall(updateResponsiveLayout)
	end
end

buildPage1()

function resetMainPageDefaults()
	PAGE1_STATE.hitboxOn=false
	PAGE1_STATE.sizeX=2.52
	PAGE1_STATE.sizeY=5.4
	PAGE1_STATE.sizeZ=1.41
	PAGE1_STATE.targetTransparency=0.7
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
	PAGE1_STATE.boostForceY=32
	PAGE1_STATE.boostCooldown=5
	PAGE1_STATE.boostChance=100
	PAGE1_STATE.ballDetectionRadius=10
	PAGE1_STATE.actionStatusOn=false
	PAGE1_STATE.qbAimEnabled=false
	PAGE1_STATE.qbAimTeamFilter=true
	PAGE1_STATE.qbAimShowArc=true
	PAGE1_STATE.qbAimLeadDelay=0.38
	PAGE1_STATE.qbAimPeakHeight=14.00
	PAGE1_STATE.testingEnabled=false

	for _,api in pairs(PAGE1_APIS) do
		if api and api.Refresh then
			pcall(api.Refresh)
		end
	end

	syncPage1State()
	requestPlayerAutosave()
end
