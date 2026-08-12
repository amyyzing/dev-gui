guiLogic=GuiLogicModule.new({
	make=make,
	fusion=FusionModule,
	colors=colors,
	style=style,
	inputService=inputService,
	TweenService=TweenService,
	fmtNumber=fmtNumber,
	boxWrappers=boxWrappers,
	buttonWrappers=buttonWrappers,
	markThemeRole=markThemeRole,
	getUILibRuntimeStyle=getUILibRuntimeStyle,
})

attachHover=guiLogic.attachHover
wrapTextBox=guiLogic.wrapTextBox
placeWrappedBox=guiLogic.placeWrappedBox
wrapTextButton=guiLogic.wrapTextButton
placeWrappedButton=guiLogic.placeWrappedButton
setWrappedButtonBg=guiLogic.setWrappedButtonBg
makeSection=guiLogic.makeSection
makeBox=guiLogic.makeBox
buildSlider=guiLogic.buildSlider
buildToggleLabel=guiLogic.buildToggleLabel
buildToggleRow=guiLogic.buildToggleRow
objectLocalPointer=guiLogic.objectLocalPointer
hitboxOriginals=hitboxOriginals or {
	Transparency=setmetatable({}, {__mode="k"}),
	Size=setmetatable({}, {__mode="k"}),
}

description=DescriptionModule or {}
rawMakeSection=makeSection
function makeSection(parent,order,titleText,subtitleText,options)
	if description and type(description.Section)=="function" then
		local ok,newTitle,newSubtitle=pcall(description.Section,titleText,subtitleText)
		if ok then
			titleText=newTitle
			subtitleText=newSubtitle
		end
	end

	return rawMakeSection(parent,order,titleText,subtitleText,options)
end

lazyPageBuilders={}
lazyPageBuilt={}
function ensureRuntimePageBuilt(name)
	name=tostring(name or "main")
	local builder=lazyPageBuilders[name]
	if not builder or lazyPageBuilt[name] then
		if refreshRuntimePageControls then
			pcall(refreshRuntimePageControls,name,false)
		end
		return true
	end

	lazyPageBuilt[name]=true
	local built=false
	local ok,err=pcall(builder)
	if not ok then
		lazyPageBuilt[name]=false
		warn("page build failed:",name,err)
	else
		built=true
	end

	if refreshRuntimePageControls then
		pcall(refreshRuntimePageControls,name,built)
	end

	return ok and built
end

mainFrame=MainFrameModule.new({
	make=make,
	fusion=FusionModule,
	colors=colors,
	description=description,
	windowState=windowState,
	uiProfile=getCurrentUILibProfile and getCurrentUILibProfile() or nil,
	uiMap=UIMapModule,
	getCurrentUILibProfile=getCurrentUILibProfile,
	screenGui=screenGui,
	inputService=inputService,
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
		return currentModeLabel
	end,
	onPageActivated=ensureRuntimePageBuilt,
})

root=mainFrame.root
uiScale=mainFrame.uiScale
main=mainFrame.main
header=mainFrame.header
modeSubtitle=mainFrame.modeSubtitle
closeBtn=mainFrame.closeBtn
resetBtn=mainFrame.resetBtn
pageBar=mainFrame.pageBar
pageHost=mainFrame.pageHost
settingsPage=mainFrame.settingsPage
futurePage=mainFrame.futurePage
uiSettingsPage=mainFrame.uiSettingsPage
mapPage=mainFrame.mapPage
serverPage=mainFrame.serverPage
actualSettingsPage=mainFrame.actualSettingsPage
leftCol=mainFrame.leftCol
rightCol=mainFrame.rightCol
footer=mainFrame.footer

function getMainDescriptionText()
	if description and type(description.Get)=="function" then
		local ok,value=pcall(description.Get,"Main.Description",currentModeLabel.." loaded")
		if ok and value~=nil then
			return value
		end
	end

	return currentModeLabel.." loaded"
end

function setActivePage(name)
	if mainFrame and type(mainFrame.SetActivePage)=="function" then
		mainFrame.SetActivePage(name)
	end
end

function getActivePageName()
	if mainFrame and type(mainFrame.GetActivePageName)=="function" then
		return mainFrame.GetActivePageName()
	end

	return "main"
end

updateResponsiveLayout=function()
	if mainFrame and type(mainFrame.UpdateResponsiveLayout)=="function" then
		mainFrame.UpdateResponsiveLayout()
	end
end

refreshFooterResetButton=function()
	if mainFrame and type(mainFrame.RefreshFooterResetButton)=="function" then
		mainFrame.RefreshFooterResetButton()
	end
end

AnnouncementAPI=nil
playerSessionId=nil
playerSessionHeartbeatStarted=false
sendPlayerSessionUpdate=function() end
resetKeybindPresetPageDefaults=function() end

DataSaveAPI=nil
requestPlayerAutosave=function()
	if DataSaveAPI and type(DataSaveAPI.Schedule)=="function" then
		DataSaveAPI.Schedule()
	end
end

function makeLocalPresetCode(name)
	local base=string.upper(string.sub(string.gsub(tostring(name or ""),"[^%w]",""),1,3))
	if base=="" then base="GUI" end
	return base..tostring(math.random(100,999))
end

function setPresetSizeFromDataSave(index,x,y,z)
	if DataSaveAPI and type(DataSaveAPI.SetPresetSize)=="function" then
		return DataSaveAPI.SetPresetSize(index,x,y,z)
	end

	local preset=hitboxPresets[index]
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
	if DataSaveAPI and type(DataSaveAPI.SetPresetKey)=="function" then
		return DataSaveAPI.SetPresetKey(index,binding)
	end

	local preset=hitboxPresets[index]
	if not preset then return false,"missing preset" end

	preset.key=binding or Enum.KeyCode.Unknown
	requestPlayerAutosave()
	return true,preset.key
end

function resetPresetFromDataSave(index)
	if DataSaveAPI and type(DataSaveAPI.ResetPreset)=="function" then
		return DataSaveAPI.ResetPreset(index)
	end

	local preset=hitboxPresets[index]
	local default=defaultHitboxPresets[index]
	if not preset or not default then return false,"missing preset" end

	preset.key=default.key
	preset.size=default.size
	requestPlayerAutosave()
	return true,preset
end

function applyPresetEditorFromDataSave(editor)
	if DataSaveAPI and type(DataSaveAPI.ApplyPresetEditor)=="function" then
		return DataSaveAPI.ApplyPresetEditor(editor)
	end

	for i=1,4 do
		local item=editor and editor[i]
		if item and hitboxPresets[i] then
			hitboxPresets[i].key=item.key or item.Key or item.binding or item.Binding or Enum.KeyCode.Unknown
			hitboxPresets[i].size=Vector3.new(tonumber(item.x or item.X) or 1,tonumber(item.y or item.Y) or 1,tonumber(item.z or item.Z) or 1)
		end
	end

	requestPlayerAutosave()
	return true
end

function createOwnedPresetFromDataSave(name,editor)
	if DataSaveAPI and type(DataSaveAPI.CreateOwnedPreset)=="function" then
		return DataSaveAPI.CreateOwnedPreset(name,editor)
	end

	local cleanName=tostring(name or ""):gsub("^%s*(.-)%s*$","%1")
	if cleanName=="" then return false,"name missing" end

	local preset={Code=makeLocalPresetCode(cleanName),Name=cleanName,Data={presetEditor=editor or {}}}
	table.insert(savedPresets,preset)
	requestPlayerAutosave()
	return true,preset
end

function importOwnedPresetFromDataSave(code)
	if DataSaveAPI and type(DataSaveAPI.ImportOwnedPreset)=="function" then
		return DataSaveAPI.ImportOwnedPreset(code)
	end

	return false,"preset import missing"
end

function equipOwnedPresetFromDataSave(preset)
	if DataSaveAPI and type(DataSaveAPI.EquipOwnedPreset)=="function" then
		return DataSaveAPI.EquipOwnedPreset(preset)
	end

	local data=preset and (preset.Data or preset.data) or {}
	local editor=data.presetEditor or data.PresetEditor
	if not editor and preset then
		editor=preset.presetEditor or preset.PresetEditor
	end

	return applyPresetEditorFromDataSave(editor or {})
end

function deleteOwnedPresetFromDataSave(code,index)
	if DataSaveAPI and type(DataSaveAPI.DeleteOwnedPreset)=="function" then
		return DataSaveAPI.DeleteOwnedPreset(code,index)
	end

	for i=#savedPresets,1,-1 do
		if tostring(savedPresets[i].Code or savedPresets[i].code or "")==tostring(code or "") then
			table.remove(savedPresets,i)
			return true
		end
	end

	if index and savedPresets[index] then
		table.remove(savedPresets,index)
	end

	return true
end

mainPageDefaults={
	hitboxOn=false,
	sizeX=2.52,
	sizeY=5.4,
	sizeZ=1.41,
	targetTransparency=0.7,
	gravityEnabled=false,
	gravityValue=196.2,
	speedEnabled=false,
	speedValue=18,
	gameParamsEnabled=true,
	paramsSelectedPage="speed",
	speedParamsEnabled=false,
	gravityJumpParamsEnabled=false,
	staminaParamsEnabled=false,
	speedSettingEnabled=false,
	diveSettingEnabled=false,
	gravitySettingEnabled=false,
	jumpPowerSettingEnabled=false,
	staminaRegenSettingEnabled=false,
	staminaDepleteSettingEnabled=false,
	staminaRegenValue=10,
	staminaDepleteValue=10,
	jumpPowerValue=53.5,
	divePowerValue=1.9,
	jumpBoostOn=false,
	jumpBoostTradeMode=false,
	boostForceY=32,
	boostCooldown=5,
	boostChance=100,
	ballDetectionRadius=10,
	actionStatusOn=false,
	qbAimEnabled=false,
	qbAimTeamFilter=true,
	qbAimShowArc=true,
	qbAimSafeArc=false,
	qbAimTargetHighlight=true,
	qbAimLeadDelay=0.38,
	qbAimPeakHeight=14.00,
	qbAimQBDrift=0,
	qbAimQBYDrift=0,
	testingEnabled=false,
	testingWREnabled=true,
	testingQBEnabled=true,
}

mainPageState={}
for key,default in pairs(mainPageDefaults) do
	local value=getfenv()[key]
	mainPageState[key]=value~=nil and value or default
end

function syncMainState()
	local env=getfenv()
	for key in pairs(mainPageDefaults) do
		env[key]=mainPageState[key]
	end
end

function refreshRuntimePageControls(name,forceTheme)
	name=tostring(name or "main")

	if name=="main" then
		syncMainState()
		for _,api in pairs(mainPageApis) do
			if api and type(api.Refresh)=="function" then
				pcall(api.Refresh)
			end
		end
		syncMainState()
		if refreshActionStatus then
			pcall(refreshActionStatus)
		end
	elseif name=="maps" then
		if refreshRuntimeAPIs and mapApiNames then
			pcall(refreshRuntimeAPIs,mapApiNames)
		end
	elseif name=="customize" then
		if ColorsAPI and type(ColorsAPI.Refresh)=="function" then
			pcall(ColorsAPI.Refresh)
		end
	elseif name=="page2" then
		if refreshPage2UI then
			pcall(refreshPage2UI)
		end
	elseif name=="settings" then
		if PlayerDataAPI and type(PlayerDataAPI.Refresh)=="function" then
			pcall(PlayerDataAPI.Refresh)
		end
		if DiscordAPI and type(DiscordAPI.Refresh)=="function" then
			pcall(DiscordAPI.Refresh)
		end
	end

	if forceTheme and applyUIStrokeTheme then
		pcall(applyUIStrokeTheme)
	end
	if updateResponsiveLayout then
		pcall(updateResponsiveLayout)
	end
end

mainPageApis={}
refreshActionStatus=function() end

function makeMainCtx()
	return{
		make=make,
		fusion=FusionModule,
		Services=sharedRuntime,
		schedulerApi=jobRunner,
		StateStore=settingsStore,
		ThemeStore=themeRuntime,
		Janitor=cleanupBags,
		colors=colors,
		style=style,
		State=mainPageState,
		makeSection=makeSection,
		buildSlider=buildSlider,
		buildToggleLabel=buildToggleLabel,
		buildToggleRow=buildToggleRow,
		objectLocalPointer=objectLocalPointer,
		hitboxOriginals=hitboxOriginals,
		fmtNumber=fmtNumber,
		safeDisconnect=safeDisconnect,
		inputToBinding=inputToBinding,
		HitboxLogicModule=HitboxLogicModule,
		ParamsLogicModule=ParamsLogicModule,
		BoostLogicModule=BoostLogicModule,
		ESPLogicModule=ESPLogicModule,
		ESPDefenseLogicModule=ESPDefenseLogicModule,
		ESPOffenseLogicModule=ESPOffenseLogicModule,
		QBInterceptionModule=QBInterceptionModule,
		QBAimMathModule=QBAimMathModule,
		QBAimLogicModule=QBAimLogicModule,
		TestingLogicModule=TestingLogicModule,
		getCurrentModeKey=function() return currentModeKey end,
		getHitboxToggleKey=function() return hitboxToggleKey end,
		getJumpBoostToggleKey=function() return boostToggleKey end,
		getAlwaysBoostToggleKey=function() return alwaysBoostToggleKey end,
		getESPToggleKey=function() return espToggleKey end,
		getQBAimLockKey=function() return qbAimLockKey end,
		getQBAimThrowKey=function() return qbAimThrowKey end,
		getQBAimToggleKey=function() return qbAimToggleKey end,
		description=description,
		ESPDefenseModule=ESPDefenseLogicModule,
		ESPOffenseModule=ESPOffenseLogicModule,
		refreshESPStatus=function(state,available)
			mainPageState.actionStatusOn=state and available~=false
			actionStatusOn=mainPageState.actionStatusOn
			refreshActionStatus()
		end,
		setCurrentMode=function(key,label)
			currentModeKey=tostring(key or"mode1")
			currentModeLabel=tostring(label or"Gameplay")
			if mainFrame and type(mainFrame.RefreshText)=="function" then
				mainFrame.RefreshText(description)
			elseif modeSubtitle then
				modeSubtitle.Text=getMainDescriptionText()
			end
			if mainPageApis.GameParams and type(mainPageApis.GameParams.Refresh)=="function" then
				pcall(mainPageApis.GameParams.Refresh)
			end
			if mainPageApis.ESP and type(mainPageApis.ESP.Refresh)=="function" then
				pcall(mainPageApis.ESP.Refresh)
			end
			if mainPageApis.QBAim and type(mainPageApis.QBAim.Refresh)=="function" then
				pcall(mainPageApis.QBAim.Refresh)
			end
			refreshActionStatus()
		end,
		onChanged=function()
			syncMainState()
			requestPlayerAutosave()
			refreshActionStatus()
		end,
	}
end

function addMainError(parent,order,title,path)
	table.insert(runtimeBuildErrors,"Main/"..tostring(title)..": "..tostring(path))
	local section=makeSection(parent,order,title,"module did not load")
	make("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,24),Text=path.." did not load.",Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.red,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
end

mainPageModules=(getUIMapPageModules and getUIMapPageModules("main","MainPage")) or (UIMapModule and UIMapModule.MainPage and UIMapModule.MainPage.Modules) or {
	{api="Hitbox",name="Hitbox",column="left",order=1,title="Hitbox"},
	{api="GameParams",name="Params",column="left",order=2,title="Game Params"},
	{api="Boost",name="Boost",column="right",order=2,title="Boost"},
	{api="ESP",name="ESP",column="right",order=3,title="ESP"},
	{api="QBAim",name="QBAim",column="right",order=4,title="QB Aim"},
	{api="Testing",name="Testing",column="right",order=5,title="Testing"},
}

function getMainColumn(name)
	return name=="left" and leftCol or rightCol
end

function buildMainModule(spec,app)
	local parent=getMainColumn(spec.column)
	local env=getfenv()
	local featureModule=rawget(env,moduleGlobalName(spec.name))
	if featureModule and type(featureModule.new)=="function" then
		local ok,result=pcall(function()
			return featureModule.new(app,parent)
		end)
		if ok then
			mainPageApis[spec.api]=result
		else
			addMainError(parent,spec.order,spec.title,tostring(result))
		end
	else
		addMainError(parent,spec.order,spec.title,modulePaths[spec.name] or tostring(spec.name))
	end
end

function buildMain()
	local app=makeMainCtx()

	for _,spec in ipairs(mainPageModules) do
		buildMainModule(spec,app)
	end

	syncMainState()
	refreshActionStatus()
end

function clearMainColumn(column)
	if not column then return end

	for _,child in ipairs(column:GetChildren()) do
		if not child:IsA("UIListLayout") then
			child:Destroy()
		end
	end
end

rebuildMainFromModules=function()
	for _,api in pairs(mainPageApis) do
		if api and type(api.Destroy)=="function" then
			pcall(api.Destroy)
		end
	end

	mainPageApis={}
	clearMainColumn(leftCol)
	clearMainColumn(rightCol)
	buildMain()

	if updateResponsiveLayout then
		pcall(updateResponsiveLayout)
	end
end

buildMain()

function resetMainPageDefaults()
	for key,value in pairs(mainPageDefaults) do
		mainPageState[key]=value
	end

	for _,api in pairs(mainPageApis) do
		if api and type(api.Refresh)=="function" then
			pcall(api.Refresh)
		end
	end

	syncMainState()
	requestPlayerAutosave()
end
