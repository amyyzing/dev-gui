refreshPage2UI=function() end
expandedOwnedPresets={}
keybindPageApis={}
PlayerDataAPI=nil
ResetGuiAPI=nil
DiscordAPI=nil
settingsConnections={}

function trackSettingsConnection(connection)
	if connection then
		table.insert(settingsConnections,connection)
		if trackRuntimeConnection then
			trackRuntimeConnection(connection)
		end
	end

	return connection
end

function disconnectSettingsConnections()
	for _,connection in ipairs(settingsConnections) do
		safeDisconnect(connection)
		if untrackRuntimeConnection then
			untrackRuntimeConnection(connection)
		end
	end
	table.clear(settingsConnections)
end

function settingsHoverColor(base)
	base=base or colors.button or colors.panel or colors.bg
	local lum=(base.R*0.2126)+(base.G*0.7152)+(base.B*0.0722)
	local toward=lum<0.55 and Color3.new(1,1,1) or Color3.new(0,0,0)
	return base:Lerp(toward,0.08)
end

function settingsButtonBaseColor(danger)
	return danger and colors.red or (colors.button or colors.bg)
end

function destroyPage2APIs()
	for key,api in pairs(keybindPageApis) do
		if api and type(api.Destroy)=="function" then
			pcall(function()
				api.Destroy()
			end)
		end
		keybindPageApis[key]=nil
	end

	refreshPage2UI=function() end
end

function showConfirmModal(titleText, bodyText, yesText, onYes, options)
	local GuiService=game:GetService("GuiService")
	local previousSelection=GuiService.SelectedObject
	local modal=make("Frame", {BackgroundColor3=Color3.fromRGB(0, 0, 0), BackgroundTransparency=0.25, BorderSizePixel=0, Size=UDim2.new(1, 0, 1, 0), ZIndex=100}, screenGui)
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

	local box=make("Frame", {AnchorPoint=Vector2.new(0.5, 0.5), Position=UDim2.new(0.5, 0, 0.5, 0), Size=UDim2.fromOffset(390, 170), BackgroundColor3=colors.section or colors.bg, BorderSizePixel=0, ZIndex=101, ThemeRole="SECTION", CornerRole="Section"}, modal)
	make("UICorner", {CornerRadius=UDim.new(0, 0)}, box)

	make("UIStroke", {Color=colors.stroke, Thickness=2, Transparency=0}, box)

	make("TextLabel", {BackgroundTransparency=1, Position=UDim2.fromOffset(16, 14), Size=UDim2.new(1, -32, 0, 24), Text=titleText, Font=Enum.Font.GothamMedium, TextSize=14, TextColor3=colors.text, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=102}, box)

	make("TextLabel", {BackgroundTransparency=1, Position=UDim2.fromOffset(16, 48), Size=UDim2.new(1, -32, 0, 54), Text=bodyText, Font=Enum.Font.Gotham, TextSize=12, TextWrapped=true, TextColor3=colors.muted, TextXAlignment=Enum.TextXAlignment.Left, TextYAlignment=Enum.TextYAlignment.Top, ZIndex=102}, box)

	local function modalButton(text, x, danger)
		local normalBg=settingsButtonBaseColor(danger)
		local textColor=danger and Color3.fromRGB(0,0,0) or colors.text
		local b=make("TextButton", {Position=UDim2.fromOffset(x, 120), Size=UDim2.fromOffset(104, 30), BackgroundColor3=normalBg, BorderSizePixel=0, Text=text, Font=Enum.Font.Gotham, TextSize=12, TextColor3=textColor, SkipTextRole=danger, AutoButtonColor=false, Selectable=true, ZIndex=102}, box)

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

	connectModal(inputService.InputBegan,function(input,processed)
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
	refreshRuntimeAPIs({"PlayerDataAPI","ResetGuiAPI","DiscordAPI"})
end

function buildUpdateSection()
	local section=makeSection(actualSettingsPage,1,"Update","")
	local normalBg=settingsButtonBaseColor(false)
	local button=make("TextButton",{
		BackgroundColor3=normalBg,
		BorderSizePixel=0,
		Size=UDim2.new(1,-20,0,30),
		Position=UDim2.fromOffset(10,0),
		Text="update gui",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=colors.text,
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
		if mainFrame and mainFrame.ShowToast then
			mainFrame.ShowToast("updating gui", "info", 1.2)
		end

		task.spawn(function()
			local ok,result=pcall(refreshRemoteModulesNow)
			if ok and result~=false then
				return
			end

			warn("update failed:",ok and "refresh returned false" or result)
			if mainFrame and mainFrame.ShowToast then
				mainFrame.ShowToast("update failed. run /update then try again.", "error", 3)
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
		me=me,
		PlayerDataLogicModule=PlayerDataLogicModule,
		makeSection=makeSection,
		wrapTextButton=wrapTextButton,
		showConfirmModal=showConfirmModal,
		savedPresets=savedPresets,
		expandedOwned=expandedOwnedPresets,
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
		make=make,
		fusion=FusionModule,
		Services=sharedRuntime,
		schedulerApi=jobRunner,
		StateStore=settingsStore,
		ThemeStore=themeRuntime,
		Janitor=cleanupBags,
		colors=colors,
		botApi=botApi,
		DiscordLogicModule=DiscordLogicModule,
		makeSection=makeSection,
		wrapTextButton=wrapTextButton,
	}
end

function makeResetGuiCtx()
	return{
		make=make,
		fusion=FusionModule,
		Services=sharedRuntime,
		schedulerApi=jobRunner,
		StateStore=settingsStore,
		ThemeStore=themeRuntime,
		Janitor=cleanupBags,
		colors=colors,
		mainFrame=mainFrame,
		root=root,
		ResetGuiLogicModule=ResetGuiLogicModule,
		makeSection=makeSection,
		wrapTextButton=wrapTextButton,
		scheduleSave=function()
			if DataSaveAPI and type(DataSaveAPI.Schedule)=="function" then
				DataSaveAPI.Schedule()
			end
		end,
	}
end

function buildActualSettingsPage()
	loadDeferredModuleNames(settingsReloadNames)
	buildUpdateSection()

	local settingsModules=(getUIMapPageModules and getUIMapPageModules("settings","SettingsPage")) or (UIMapModule and UIMapModule.SettingsPage and UIMapModule.SettingsPage.Modules) or {
		{name="ResetGui",api="ResetGuiAPI",order=2,title="GUI Position"},
		{name="PlayerData",api="PlayerDataAPI",order=3,title="Player Data"},
		{name="Discord",api="DiscordAPI",order=4,title="Discord"},
	}

	for _,spec in ipairs(settingsModules) do
		if spec.name=="ResetGui" then
			ResetGuiAPI=buildRuntimeModule(spec,makeResetGuiCtx(),actualSettingsPage)
		elseif spec.name=="PlayerData" then
			PlayerDataAPI=buildRuntimeModule(spec,makePlayerDataCtx(),actualSettingsPage,{
				Workspace=MaterialsAPI,
				materials=MaterialsAPI,
				mapCleaner=MapCleanerAPI,
			})
		elseif spec.name=="Discord" then
			DiscordAPI=buildRuntimeModule(spec,makeDiscordCtx(),actualSettingsPage)
		end
	end

	refreshSettingsPage()
end

lazyPageBuilders.settings=buildActualSettingsPage

function clearActualSettingsPage()
	disconnectSettingsConnections()
	clearRuntimePage(actualSettingsPage,false)
end

rebuildSettingsFromModules=function()
	destroyRuntimeAPIs({"PlayerDataAPI","ResetGuiAPI","DiscordAPI"})
	clearActualSettingsPage()
	lazyPageBuilt.settings=false

	if getActivePageName and getActivePageName()=="settings" then
		ensureRuntimePageBuilt("settings")
	end
end

activeCapture=nil

function addPage2Error(parent,text)
	table.insert(runtimeBuildErrors,"Keybinds: "..tostring(text))
	make("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text=text,Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.red,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},parent)
end

keybindRows={
	{label="TOGGLE OPEN / HIDE GUI",key="uiToggleKey"},
	{label="HITBOX TOGGLE",key="hitboxToggleKey"},
	{label="JUMP BOOST TOGGLE",key="boostToggleKey"},
	{label="ALWAYS BOOST TOGGLE",key="alwaysBoostToggleKey"},
	{label="ESP TOGGLE",key="espToggleKey"},
	{label="QB AIM LOCK RECEIVER",key="qbAimLockKey"},
	{label="QB AIM THROW",key="qbAimThrowKey"},
	{label="QB AIM TOGGLE",key="qbAimToggleKey"},
}

keybindSections=(getUIMapPageCategories and getUIMapPageCategories("page2","KeybindPage")) or (UIMapModule and UIMapModule.KeybindPage and UIMapModule.KeybindPage.Sections) or {
	owned={order=1,title="Hitbox Presets",subtitle="Your saved presets"},
	editor={order=2,title="Preset Editor",subtitle="edit hotkeys and hitbox sizes and save (maybe?)"},
	bind={order=3,title="Keybind Settings",subtitle=""},
}

keybindPageModules=(getUIMapPageModules and getUIMapPageModules("page2","KeybindPage")) or (UIMapModule and UIMapModule.KeybindPage and UIMapModule.KeybindPage.Modules) or {
	{api="hitboxPresets",name="HitboxPresets",section="owned",title="Hitbox Presets"},
	{api="keybinds",name="Keybinds",section="bind",title="Keybind Settings"},
	{api="presetEditor",name="PresetEditor",section="editor",title="Preset Editor",requires="keybinds",extras=function(apis) return apis.keybinds,apis.hitboxPresets end},
}

function makePage2Bindings()
	local bindings={}
	for _,spec in ipairs(keybindRows) do
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
		make=make,
		fusion=FusionModule,
		Services=sharedRuntime,
		schedulerApi=jobRunner,
		StateStore=settingsStore,
		ThemeStore=themeRuntime,
		Janitor=cleanupBags,
		colors=colors,
		screenGui=screenGui,
		hitboxPresets=hitboxPresets,
		defaultHitboxPresets=defaultHitboxPresets,
		savedPresets=savedPresets,
		expandedOwned=expandedOwnedPresets,
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
		HitboxPresetsLogicModule=HitboxPresetsLogicModule,
		KeybindsLogicModule=KeybindsLogicModule,
		PresetEditorLogicModule=PresetEditorLogicModule,
		botApi=botApi,
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
	if spec.requires and not keybindPageApis[spec.requires] then
		addPage2Error(sections[spec.section],spec.title.." needs "..tostring(spec.requires).." first.")
		return nil
	end

	local env=getfenv()
	local featureModule=rawget(env,moduleGlobalName(spec.name))
	if not featureModule then
		featureModule=loadDeferredModuleByName(spec.name)
	end

	if not(featureModule and type(featureModule.new)=="function") then
		addPage2Error(sections[spec.section],"missing module: "..tostring(modulePaths[spec.name] or spec.name))
		return nil
	end

	local extra={nil,nil}
	if spec.extras=="keybindPresetEditor" then
		extra={keybindPageApis.keybinds,keybindPageApis.hitboxPresets}
	elseif spec.extras then
		extra={spec.extras(keybindPageApis)}
	end
	local ok,result=pcall(function()
		return featureModule.new(app,sections[spec.section],table.unpack(extra))
	end)
	if ok then
		keybindPageApis[spec.api]=result
		return result
	end

	addPage2Error(sections[spec.section],spec.title.." failed: "..tostring(result))
	return nil
end

function buildPage2()
	destroyPage2APIs()
	loadDeferredModuleNames(pageTwoReloadNames)

	local page2Wrap=make("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,ZIndex=4,LayoutOrder=1},futurePage)
	make("UIListLayout",{FillDirection=Enum.FillDirection.Vertical,Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},page2Wrap)

	local sections={}
	for key,spec in pairs(keybindSections) do
		sections[key]=makeSection(page2Wrap,spec.order,spec.title,spec.subtitle)
	end

	local page2Ctx=makePage2Ctx()
	for _,spec in ipairs(keybindPageModules) do
		buildPage2Module(spec,page2Ctx,sections)
	end

	refreshPage2UI=function()
		for _,api in pairs(keybindPageApis) do
			if api and type(api.Refresh)=="function" then pcall(api.Refresh) end
		end
	end

	local function refreshAll()
		refreshPage2UI()
	end

	for _,api in pairs(keybindPageApis) do
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
	lazyPageBuilt.page2=false
	if getActivePageName and getActivePageName()=="page2" then
		ensureRuntimePageBuilt("page2")
	end
	if refreshFooterResetButton then pcall(refreshFooterResetButton) end
	if applyUIStrokeTheme then pcall(applyUIStrokeTheme) end
end

lazyPageBuilders.page2=buildPage2
refreshFooterResetButton()

resetKeybindPresetPageDefaults=function()
	uiToggleKey=Enum.KeyCode.Unknown
	hitboxToggleKey=Enum.KeyCode.Unknown
	boostToggleKey=Enum.KeyCode.Unknown
	alwaysBoostToggleKey=Enum.KeyCode.Unknown
	espToggleKey=Enum.KeyCode.Unknown
	qbAimLockKey=Enum.KeyCode.H
	qbAimThrowKey=Enum.KeyCode.T
	qbAimToggleKey=Enum.KeyCode.P

	if DataSaveAPI and type(DataSaveAPI.ResetPresetEditor)=="function" then
		DataSaveAPI.ResetPresetEditor(true)
	else
		for i=1,4 do
			hitboxPresets[i].key=defaultHitboxPresets[i].key
			hitboxPresets[i].size=defaultHitboxPresets[i].size
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
