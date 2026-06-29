-- HB_RUNTIME_PART_4
-- boot step 4: feature modules and page wiring.

refreshPage2UI=function() end
PAGE2_EXPANDED_OWNED={}
PAGE2_APIS={}
PlayerDataAPI=nil
ResetPositionAPI=nil
DiscordAPI=nil
SETTINGS_CONNECTIONS={}

function trackSettingsConnection(connection)
	if connection then
		table.insert(SETTINGS_CONNECTIONS,connection)
		if trackRuntimeConnection then
			trackRuntimeConnection(connection)
		end
	end

	return connection
end

function disconnectSettingsConnections()
	for _,connection in ipairs(SETTINGS_CONNECTIONS) do
		safeDisconnect(connection)
		if untrackRuntimeConnection then
			untrackRuntimeConnection(connection)
		end
	end
	table.clear(SETTINGS_CONNECTIONS)
end

function settingsHoverColor(base)
	base=base or THEME.BUTTON or THEME.PANEL or THEME.BG
	local lum=(base.R*0.2126)+(base.G*0.7152)+(base.B*0.0722)
	local toward=lum<0.55 and Color3.new(1,1,1) or Color3.new(0,0,0)
	return base:Lerp(toward,0.08)
end

function settingsButtonBaseColor(danger)
	return danger and THEME.RED or (THEME.BUTTON or THEME.BG)
end

function destroyPage2APIs()
	for key,api in pairs(PAGE2_APIS) do
		if api and api.Destroy then
			pcall(function()
				api.Destroy()
			end)
		end
		PAGE2_APIS[key]=nil
	end

	refreshPage2UI=function() end
end

function showConfirmModal(titleText, bodyText, yesText, onYes, options)
	local GuiService=game:GetService("GuiService")
	local previousSelection=GuiService.SelectedObject
	local modal=New("Frame", {BackgroundColor3=Color3.fromRGB(0, 0, 0), BackgroundTransparency=0.25, BorderSizePixel=0, Size=UDim2.new(1, 0, 1, 0), ZIndex=100}, SG)
	local modalConnections={}
	local closed=false
	local function connectModal(signal,fn)
		local connection=signal:Connect(fn)
		table.insert(modalConnections,connection)
		if trackRuntimeConnection then
			trackRuntimeConnection(connection)
		end
		return connection
	end
	local function closeModal()
		if closed then return end
		closed=true

		for _,connection in ipairs(modalConnections) do
			safeDisconnect(connection)
			if untrackRuntimeConnection then
				untrackRuntimeConnection(connection)
			end
		end
		table.clear(modalConnections)
		if modal and modal.Parent then
			modal:Destroy()
		end
		if previousSelection and previousSelection.Parent then
			GuiService.SelectedObject=previousSelection
		end
	end

	local box=New("Frame", {AnchorPoint=Vector2.new(0.5, 0.5), Position=UDim2.new(0.5, 0, 0.5, 0), Size=UDim2.fromOffset(390, 170), BackgroundColor3=THEME.SECTION or THEME.BG, BorderSizePixel=0, ZIndex=101, ThemeRole="SECTION", CornerRole="Section"}, modal)
	New("UICorner", {CornerRadius=UDim.new(0, 0)}, box)

	New("UIStroke", {Color=THEME.STROKE, Thickness=2, Transparency=0}, box)

	New("TextLabel", {BackgroundTransparency=1, Position=UDim2.fromOffset(16, 14), Size=UDim2.new(1, -32, 0, 24), Text=titleText, Font=Enum.Font.GothamMedium, TextSize=14, TextColor3=THEME.TEXT, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=102}, box)

	New("TextLabel", {BackgroundTransparency=1, Position=UDim2.fromOffset(16, 48), Size=UDim2.new(1, -32, 0, 54), Text=bodyText, Font=Enum.Font.Gotham, TextSize=12, TextWrapped=true, TextColor3=THEME.MUTED, TextXAlignment=Enum.TextXAlignment.Left, TextYAlignment=Enum.TextYAlignment.Top, ZIndex=102}, box)

	local function modalButton(text, x, danger)
		local normalBg=settingsButtonBaseColor(danger)
		local textColor=danger and Color3.fromRGB(0,0,0) or THEME.TEXT
		local b=New("TextButton", {Position=UDim2.fromOffset(x, 120), Size=UDim2.fromOffset(104, 30), BackgroundColor3=normalBg, BorderSizePixel=0, Text=text, Font=Enum.Font.Gotham, TextSize=12, TextColor3=textColor, SkipTextRole=danger, AutoButtonColor=false, Selectable=true, ZIndex=102}, box)

		local wrap=wrapTextButton(b, normalBg, 2)
		wrap.BackgroundColor3=normalBg
		if danger then
			wrap:SetAttribute("ThemeRole","RED")
		else
			wrap:SetAttribute("ThemeRole","BUTTON")
		end
		wrap:SetAttribute("CornerRole","Control")

		connectModal(b.MouseEnter,function()
			wrap.BackgroundColor3=settingsHoverColor(settingsButtonBaseColor(danger))
		end)

		connectModal(b.MouseLeave,function()
			wrap.BackgroundColor3=settingsButtonBaseColor(danger)
		end)

		return b
	end

	local danger=options and options.danger==true
	local no=modalButton("CANCEL", 160, false)
	local yes=modalButton(yesText or"YES", 274, danger)

	connectModal(no.Activated,closeModal)

	connectModal(yes.Activated,function()
		closeModal()
		if onYes then onYes() end
	end)

	connectModal(UIS.InputBegan,function(input,processed)
		if processed then return end
		if input.KeyCode==Enum.KeyCode.Escape or input.KeyCode==Enum.KeyCode.ButtonB then
			closeModal()
		end
	end)

	task.defer(function()
		if yes and yes.Parent then
			GuiService.SelectedObject=yes
		end
	end)
end

function refreshSettingsPage()
	refreshRuntimeAPIs({"PlayerDataAPI","ResetPositionAPI","DiscordAPI"})
end

function buildUpdateSection()
	local section=makeSection(actualSettingsPage,1,"Update","")
	local normalBg=settingsButtonBaseColor(false)
	local button=New("TextButton",{
		BackgroundColor3=normalBg,
		BorderSizePixel=0,
		Size=UDim2.new(1,-20,0,30),
		Position=UDim2.fromOffset(10,0),
		Text="update gui",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		AutoButtonColor=false,
		Selectable=true,
		ZIndex=6,
	},section)

	local wrap=wrapTextButton(button,normalBg,2)
	wrap.BackgroundColor3=normalBg
	wrap:SetAttribute("ThemeRole","BUTTON")
	wrap:SetAttribute("CornerRole","Control")

	button.Size=UDim2.new(1,0,1,0)
	button.Position=UDim2.fromOffset(0,0)

	trackSettingsConnection(button.MouseEnter:Connect(function()
		wrap.BackgroundColor3=settingsHoverColor(settingsButtonBaseColor(false))
	end))

	trackSettingsConnection(button.MouseLeave:Connect(function()
		wrap.BackgroundColor3=settingsButtonBaseColor(false)
	end))

	local busy=false
	trackSettingsConnection(button.Activated:Connect(function()
		if busy then return end
		busy=true
		button.Text="updating"
		if MainFrame and MainFrame.ShowToast then
			MainFrame.ShowToast("updating gui", "info", 1.2)
		end

		task.spawn(function()
			local ok,result=pcall(refreshRemoteModulesNow)
			if ok and result~=false then
				return
			end

			warn("update failed:",ok and "refresh returned false" or result)
			if MainFrame and MainFrame.ShowToast then
				MainFrame.ShowToast("update failed. run /update then try again.", "error", 3)
			end
			if button and button.Parent then
				button.Text="update failed"
			end

			task.wait(1.2)
			if button and button.Parent then
				button.Text="update gui"
			end
			busy=false
		end)
	end))
end

function makePlayerDataCtx()
	return{
		New=New,
		Fusion=FusionModule,
		Services=RuntimeServices,
		Scheduler=RuntimeScheduler,
		StateStore=RuntimeStateStore,
		ThemeStore=RuntimeThemeStore,
		Janitor=RuntimeJanitor,
		THEME=THEME,
		SG=SG,
		BOT_API=BOT_API,
		playerId=tostring(me.UserId),
		me=me,
		PlayerDataLogicModule=PlayerDataLogicModule,
		makeSection=makeSection,
		wrapTextButton=wrapTextButton,
		showConfirmModal=showConfirmModal,
		OWNED_PRESETS=OWNED_PRESETS,
		expandedOwned=PAGE2_EXPANDED_OWNED,
		resetMainPageDefaults=resetMainPageDefaults,
		resetCustomizePageDefaults=resetCustomizePageDefaults,
		resetKeybindPresetPageDefaults=function()
			if resetKeybindPresetPageDefaults then
				resetKeybindPresetPageDefaults()
			end
		end,
		refreshPage2UI=function()
			if refreshPage2UI then refreshPage2UI() end
		end,
		rebuildOwnedList=function()
			if refreshPage2UI then refreshPage2UI() end
		end,
		refreshSettingsPage=refreshSettingsPage,
	}
end

function makeDiscordCtx()
	return{
		New=New,
		Fusion=FusionModule,
		Services=RuntimeServices,
		Scheduler=RuntimeScheduler,
		StateStore=RuntimeStateStore,
		ThemeStore=RuntimeThemeStore,
		Janitor=RuntimeJanitor,
		THEME=THEME,
		BOT_API=BOT_API,
		DiscordLogicModule=DiscordLogicModule,
		makeSection=makeSection,
		wrapTextButton=wrapTextButton,
	}
end

function makeResetPositionCtx()
	return{
		New=New,
		Fusion=FusionModule,
		Services=RuntimeServices,
		Scheduler=RuntimeScheduler,
		StateStore=RuntimeStateStore,
		ThemeStore=RuntimeThemeStore,
		Janitor=RuntimeJanitor,
		THEME=THEME,
		MainFrame=MainFrame,
		root=root,
		ResetPositionLogicModule=ResetPositionLogicModule,
		makeSection=makeSection,
		wrapTextButton=wrapTextButton,
		scheduleSave=function()
			if DataSaveAPI and DataSaveAPI.Schedule then
				DataSaveAPI.Schedule()
			end
		end,
	}
end

function buildActualSettingsPage()
	loadDeferredModuleNames(SETTINGS_RELOAD_NAMES)
	buildUpdateSection()

	ResetPositionAPI=buildRuntimeModule({name="ResetPosition",api="ResetPositionAPI",order=2,title="GUI Position"},makeResetPositionCtx(),actualSettingsPage)
	PlayerDataAPI=buildRuntimeModule({name="PlayerData",api="PlayerDataAPI",order=3,title="Player Data"},makePlayerDataCtx(),actualSettingsPage,{
		Workspace=AntiMaterialAPI,
		AntiMaterial=AntiMaterialAPI,
		MapCleaner=MapCleanerAPI,
	})
	DiscordAPI=buildRuntimeModule({name="Discord",api="DiscordAPI",order=4,title="Discord"},makeDiscordCtx(),actualSettingsPage)
	refreshSettingsPage()
end

LAZY_PAGE_BUILDERS.settings=buildActualSettingsPage

function clearActualSettingsPage()
	disconnectSettingsConnections()
	clearRuntimePage(actualSettingsPage,false)
end

rebuildSettingsFromModules=function()
	destroyRuntimeAPIs({"PlayerDataAPI","ResetPositionAPI","DiscordAPI"})
	clearActualSettingsPage()
	LAZY_PAGE_BUILT.settings=false

	if getActivePageName and getActivePageName()=="settings" then
		ensureRuntimePageBuilt("settings")
	end
end

activeCapture=nil

function addPage2Error(parent,text)
	table.insert(RUNTIME_BUILD_ERRORS,"Keybinds: "..tostring(text))
	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text=text,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},parent)
end

PAGE2_BINDING_SPECS={
	{label="TOGGLE OPEN / HIDE GUI",key="TOGGLE_UI_KEY"},
	{label="HITBOX TOGGLE",key="TOGGLE_HB_KEY"},
	{label="JUMP BOOST TOGGLE",key="TOGGLE_JB_KEY"},
	{label="ALWAYS BOOST TOGGLE",key="TOGGLE_AB_KEY"},
	{label="ESP TOGGLE",key="TOGGLE_ACTION_KEY"},
	{label="QB AIM LOCK RECEIVER",key="QB_AIM_LOCK_KEY"},
	{label="QB AIM THROW",key="QB_AIM_THROW_KEY"},
	{label="QB AIM TOGGLE",key="QB_AIM_TOGGLE_KEY"},
}

PAGE2_SECTION_SPECS={
	owned={order=1,title="Hitbox Presets",subtitle="Your saved presets"},
	editor={order=2,title="Preset Editor",subtitle="edit hotkeys and hitbox sizes and save (maybe?)"},
	bind={order=3,title="Keybind Settings",subtitle=""},
}

PAGE2_MODULE_SPECS={
	{api="hitboxPresets",name="HitboxPreset",section="owned",title="Hitbox Presets"},
	{api="keybindSettings",name="KeybindSettings",section="bind",title="Keybind Settings"},
	{api="presetEditor",name="PresetEditor",section="editor",title="Preset Editor",requires="keybindSettings",extras=function(apis) return apis.keybindSettings,apis.hitboxPresets end},
}

function makePage2Bindings()
	local bindings={}
	for _,spec in ipairs(PAGE2_BINDING_SPECS) do
		local key=spec.key
		local label=spec.label
		table.insert(bindings,{
			label=label,
			get=function()
				return getfenv()[key]
			end,
			set=function(value)
				getfenv()[key]=value
				requestPlayerAutosave()
			end,
		})
	end

	return bindings
end

function makePage2Ctx()
	return{
		New=New,
		Fusion=FusionModule,
		Services=RuntimeServices,
		Scheduler=RuntimeScheduler,
		StateStore=RuntimeStateStore,
		ThemeStore=RuntimeThemeStore,
		Janitor=RuntimeJanitor,
		THEME=THEME,
		SG=SG,
		PRESETS=PRESETS,
		DEFAULT_PRESETS=DEFAULT_PRESETS,
		OWNED_PRESETS=OWNED_PRESETS,
		expandedOwned=PAGE2_EXPANDED_OWNED,
		fmtNumber=fmtNumber,
		bindingToLabel=bindingToLabel,
		parseKeyCodeInput=parseKeyCodeInput,
		inputToBinding=inputToBinding,
		wrapTextButton=wrapTextButton,
		wrapTextBox=wrapTextBox,
		placeWrappedBox=placeWrappedBox,
		placeWrappedButton=placeWrappedButton,
		setWrappedButtonBg=setWrappedButtonBg,
		makeBox=makeBox,
		HitboxPresetLogicModule=HitboxPresetLogicModule,
		KeybindSettingsLogicModule=KeybindSettingsLogicModule,
		PresetEditorLogicModule=PresetEditorLogicModule,
		BOT_API=BOT_API,
		playerId=tostring(me.UserId),
		requestPlayerAutosave=requestPlayerAutosave,
		setPresetSize=setPresetSizeFromDataSave,
		setPresetKey=setPresetKeyFromDataSave,
		resetPreset=resetPresetFromDataSave,
		applyPresetEditor=applyPresetEditorFromDataSave,
		createOwnedPreset=createOwnedPresetFromDataSave,
		importOwnedPreset=importOwnedPresetFromDataSave,
		equipOwnedPreset=equipOwnedPresetFromDataSave,
		deleteOwnedPreset=deleteOwnedPresetFromDataSave,
		State={},
		Bindings=makePage2Bindings(),
	}
end

function buildPage2Module(spec,app,sections)
	if spec.requires and not PAGE2_APIS[spec.requires] then
		addPage2Error(sections[spec.section],spec.title.." needs "..tostring(spec.requires).." first.")
		return nil
	end

	local env=getfenv()
	local featureModule=rawget(env,moduleGlobalName(spec.name))
	if not featureModule then
		featureModule=loadDeferredModuleByName(spec.name)
	end

	if not(featureModule and type(featureModule.new)=="function") then
		addPage2Error(sections[spec.section],"missing module: "..tostring(MODULE_PATHS[spec.name] or spec.name))
		return nil
	end

	local extra={nil,nil}
	if spec.extras then
		extra={spec.extras(PAGE2_APIS)}
	end
	local ok,result=pcall(function()
		return featureModule.new(app,sections[spec.section],table.unpack(extra))
	end)
	if ok then
		PAGE2_APIS[spec.api]=result
		return result
	end

	addPage2Error(sections[spec.section],spec.title.." failed: "..tostring(result))
	return nil
end

function buildPage2()
	destroyPage2APIs()
	loadDeferredModuleNames(PAGE2_RELOAD_NAMES)

	local page2Wrap=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,ZIndex=4,LayoutOrder=1},futurePage)
	New("UIListLayout",{FillDirection=Enum.FillDirection.Vertical,Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},page2Wrap)

	local sections={}
	for key,spec in pairs(PAGE2_SECTION_SPECS) do
		sections[key]=makeSection(page2Wrap,spec.order,spec.title,spec.subtitle)
	end

	local page2Ctx=makePage2Ctx()
	for _,spec in ipairs(PAGE2_MODULE_SPECS) do
		buildPage2Module(spec,page2Ctx,sections)
	end

	refreshPage2UI=function()
		for _,api in pairs(PAGE2_APIS) do
			if api and api.Refresh then pcall(api.Refresh) end
		end
	end

	local function refreshAll()
		refreshPage2UI()
	end

	for _,api in pairs(PAGE2_APIS) do
		if api and api.SetRefreshAll then api.SetRefreshAll(refreshAll) end
	end

	refreshPage2UI()
end

function clearPage2()
	destroyPage2APIs()
	clearRuntimePage(futurePage,true)
end

rebuildPage2FromModules=function()
	activeCapture=nil
	clearPage2()
	LAZY_PAGE_BUILT.page2=false
	if getActivePageName and getActivePageName()=="page2" then
		ensureRuntimePageBuilt("page2")
	end
	if refreshFooterResetButton then pcall(refreshFooterResetButton) end
	if applyUIStrokeTheme then pcall(applyUIStrokeTheme) end
end

LAZY_PAGE_BUILDERS.page2=buildPage2
refreshFooterResetButton()

resetKeybindPresetPageDefaults=function()
	TOGGLE_UI_KEY=Enum.KeyCode.Unknown
	TOGGLE_HB_KEY=Enum.KeyCode.Unknown
	TOGGLE_JB_KEY=Enum.KeyCode.Unknown
	TOGGLE_AB_KEY=Enum.KeyCode.Unknown
	TOGGLE_ACTION_KEY=Enum.KeyCode.Unknown
	QB_AIM_LOCK_KEY=Enum.KeyCode.H
	QB_AIM_THROW_KEY=Enum.KeyCode.T
	QB_AIM_TOGGLE_KEY=Enum.KeyCode.P

	if DataSaveAPI and DataSaveAPI.ResetPresetEditor then
		DataSaveAPI.ResetPresetEditor(true)
	else
		for i=1,4 do
			PRESETS[i].key=DEFAULT_PRESETS[i].key
			PRESETS[i].size=DEFAULT_PRESETS[i].size
		end
	end

	activeCapture=nil

	if refreshPage2UI then
		refreshPage2UI()
	end

	requestPlayerAutosave()
end

trackRuntimeConnection(resetBtn.Activated:Connect(function()
	local activePageName=getActivePageName()

	if activePageName=="main" then
		resetMainPageDefaults()
	elseif activePageName=="page2" then
		resetKeybindPresetPageDefaults()
	elseif activePageName=="customize" then
		resetCustomizePageDefaults()
	end

	refreshActionStatus()
	requestPlayerAutosave()
end))
