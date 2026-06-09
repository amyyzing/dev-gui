-- HB_RUNTIME_PART_4
-- Runtime chunk 4. Loaded by loader.lua with a shared environment.
refreshPage2UI=function() end
PAGE2_EXPANDED_OWNED={}
PAGE2_APIS={}
PlayerDataAPI=nil
DiscordAPI=nil

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
	local modal=New("Frame", {BackgroundColor3=Color3.fromRGB(0, 0, 0), BackgroundTransparency=0.25, BorderSizePixel=0, Size=UDim2.new(1, 0, 1, 0), ZIndex=100}, SG)

	local box=New("Frame", {AnchorPoint=Vector2.new(0.5, 0.5), Position=UDim2.new(0.5, 0, 0.5, 0), Size=UDim2.fromOffset(390, 170), BackgroundColor3=THEME.SECTION or THEME.BG, BorderSizePixel=0, ZIndex=101, ThemeRole="SECTION", CornerRole="Section"}, modal)
	New("UICorner", {CornerRadius=UDim.new(0, 0)}, box)

	New("UIStroke", {Color=THEME.STROKE, Thickness=2, Transparency=0}, box)

	New("TextLabel", {BackgroundTransparency=1, Position=UDim2.fromOffset(16, 14), Size=UDim2.new(1, -32, 0, 24), Text=titleText, Font=Enum.Font.GothamMedium, TextSize=14, TextColor3=THEME.TEXT, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=102}, box)

	New("TextLabel", {BackgroundTransparency=1, Position=UDim2.fromOffset(16, 48), Size=UDim2.new(1, -32, 0, 54), Text=bodyText, Font=Enum.Font.Gotham, TextSize=12, TextWrapped=true, TextColor3=THEME.MUTED, TextXAlignment=Enum.TextXAlignment.Left, TextYAlignment=Enum.TextYAlignment.Top, ZIndex=102}, box)

	local function modalButton(text, x, danger)
		local normalBg=danger and THEME.RED or (THEME.BUTTON or THEME.BG)
		local hoverBg=danger and Color3.fromRGB(255,124,118) or THEME.CARD
		local leaveBg=danger and THEME.RED or (THEME.BUTTON or THEME.BG)
		local textColor=danger and Color3.fromRGB(0,0,0) or THEME.TEXT
		local b=New("TextButton", {Position=UDim2.fromOffset(x, 120), Size=UDim2.fromOffset(104, 30), BackgroundColor3=normalBg, BorderSizePixel=0, Text=text, Font=Enum.Font.Gotham, TextSize=12, TextColor3=textColor, AutoButtonColor=false, ZIndex=102}, box)

		local wrap=wrapTextButton(b, normalBg, 2)
		wrap.BackgroundColor3=normalBg
		if danger then
			wrap:SetAttribute("ThemeRole","RED")
		else
			wrap:SetAttribute("ThemeRole","BUTTON")
		end
		wrap:SetAttribute("CornerRole","Control")

		b.MouseEnter:Connect(function()
			wrap.BackgroundColor3=hoverBg
		end)

		b.MouseLeave:Connect(function()
			wrap.BackgroundColor3=leaveBg
		end)

		return b
	end

	local danger=options and options.danger==true
	local no=modalButton("CANCEL", 160, false)
	local yes=modalButton(yesText or"YES", 274, danger)

	no.MouseButton1Click:Connect(function()
		modal:Destroy()
	end)

	yes.MouseButton1Click:Connect(function()
		modal:Destroy()
		if onYes then onYes() end
	end)
end

function refreshSettingsPage()
	if AntiMaterialAPI and AntiMaterialAPI.Refresh then
		pcall(function()
			AntiMaterialAPI.Refresh()
		end)
	end

	if MapCleanerAPI and MapCleanerAPI.Refresh then
		pcall(function()
			MapCleanerAPI.Refresh()
		end)
	end

	if RemoveAdsAPI and RemoveAdsAPI.Refresh then
		pcall(function()
			RemoveAdsAPI.Refresh()
		end)
	end

	if DiscordAPI and DiscordAPI.Refresh then
		pcall(function()
			DiscordAPI.Refresh()
		end)
	end
end

function buildUpdateSection()
	local section=makeSection(actualSettingsPage,1,"Update","Reload latest GUI build")
	local normalBg=THEME.BUTTON or THEME.BG
	local hoverBg=THEME.CARD
	local button=New("TextButton",{
		BackgroundColor3=normalBg,
		BorderSizePixel=0,
		Size=UDim2.new(1,-20,0,30),
		Position=UDim2.fromOffset(10,0),
		Text="UPDATE GUI",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		AutoButtonColor=false,
		ZIndex=6,
	},section)

	local wrap=wrapTextButton(button,normalBg,2)
	wrap.BackgroundColor3=normalBg
	wrap:SetAttribute("ThemeRole","BUTTON")
	wrap:SetAttribute("CornerRole","Control")

	button.Size=UDim2.new(1,0,1,0)
	button.Position=UDim2.fromOffset(0,0)

	button.MouseEnter:Connect(function()
		wrap.BackgroundColor3=hoverBg
	end)

	button.MouseLeave:Connect(function()
		wrap.BackgroundColor3=normalBg
	end)

	local busy=false
	button.Activated:Connect(function()
		if busy then return end
		busy=true
		button.Text="UPDATING..."
		if MainFrame and MainFrame.ShowToast then
			MainFrame.ShowToast("Updating GUI...", "info", 1.2)
		end

		task.spawn(function()
			local ok,result=pcall(refreshRemoteModulesNow)
			if ok and result~=false then
				return
			end

			warn("Manual refresh failed:",ok and "refresh returned false" or result)
			if MainFrame and MainFrame.ShowToast then
				MainFrame.ShowToast("Update failed. Run /update, then try again.", "error", 3)
			end
			if button and button.Parent then
				button.Text="UPDATE FAILED"
			end

			task.wait(1.2)
			if button and button.Parent then
				button.Text="UPDATE GUI"
			end
			busy=false
		end)
	end)
end

function buildActualSettingsPage()
	PlayerDataLogicModule=loadDeferredModule("PlayerDataLogic",MODULE_PATHS.PlayerDataLogic,PlayerDataLogicModule)
	PlayerDataModule=loadDeferredModule("PlayerData",MODULE_PATHS.PlayerData,PlayerDataModule)
	DiscordLogicModule=loadDeferredModule("DiscordLogic",MODULE_PATHS.DiscordLogic,DiscordLogicModule)
	DiscordModule=loadDeferredModule("Discord",MODULE_PATHS.Discord,DiscordModule)

	buildUpdateSection()

	if PlayerDataModule and PlayerDataModule.new then
		local ok,result=pcall(function()
			return PlayerDataModule.new({
				New=New,
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
			},actualSettingsPage,{
				Workspace=AntiMaterialAPI,
				AntiMaterial=AntiMaterialAPI,
				MapCleaner=MapCleanerAPI,
			})
		end)

		if ok then
			PlayerDataAPI=result
		else
			local section=makeSection(actualSettingsPage,1,"Player Data","Remote module failed to load.")
			New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Player Data module failed: "..tostring(result),Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
		end
	else
		local section=makeSection(actualSettingsPage,1,"Player Data","Remote module failed to load.")
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Missing remote module: page-6/player-data/gui.lua",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
	end

	if DiscordModule and DiscordModule.new then
		local ok,result=pcall(function()
			return DiscordModule.new({
				New=New,
				THEME=THEME,
				BOT_API=BOT_API,
				DiscordLogicModule=DiscordLogicModule,
				makeSection=makeSection,
				wrapTextButton=wrapTextButton,
			},actualSettingsPage)
		end)

		if ok then
			DiscordAPI=result
		else
			local section=makeSection(actualSettingsPage,3,"Discord","Remote module failed to load.")
			New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Discord module failed: "..tostring(result),Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
		end
	else
		local section=makeSection(actualSettingsPage,3,"Discord","Remote module failed to load.")
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Missing remote module: page-6/discord/gui.lua",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
	end

	refreshSettingsPage()
end

LAZY_PAGE_BUILDERS.settings=buildActualSettingsPage

function clearActualSettingsPage()
	for _,child in ipairs(actualSettingsPage:GetChildren()) do
		if not child:IsA("UIListLayout") then
			child:Destroy()
		end
	end
end

rebuildSettingsFromModules=function()
	if PlayerDataAPI and PlayerDataAPI.Destroy then
		pcall(function()
			PlayerDataAPI.Destroy()
		end)
	end

	if DiscordAPI and DiscordAPI.Destroy then
		pcall(function()
			DiscordAPI.Destroy()
		end)
	end

	PlayerDataAPI=nil
	DiscordAPI=nil
	clearActualSettingsPage()
	LAZY_PAGE_BUILT.settings=false

	if getActivePageName and getActivePageName()=="settings" then
		ensureRuntimePageBuilt("settings")
	end
end

activeCapture=nil

function addPage2Error(parent,text)
	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text=text,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},parent)
end

function buildPage2()
	destroyPage2APIs()

	HitboxPresetLogicModule=loadDeferredModule("HitboxPresetLogic",MODULE_PATHS.HitboxPresetLogic,HitboxPresetLogicModule)
	HitboxPresetModule=loadDeferredModule("HitboxPreset",MODULE_PATHS.HitboxPreset,HitboxPresetModule)
	KeybindSettingsLogicModule=loadDeferredModule("KeybindSettingsLogic",MODULE_PATHS.KeybindSettingsLogic,KeybindSettingsLogicModule)
	KeybindSettingsModule=loadDeferredModule("KeybindSettings",MODULE_PATHS.KeybindSettings,KeybindSettingsModule)
	PresetEditorLogicModule=loadDeferredModule("PresetEditorLogic",MODULE_PATHS.PresetEditorLogic,PresetEditorLogicModule)
	PresetEditorModule=loadDeferredModule("PresetEditor",MODULE_PATHS.PresetEditor,PresetEditorModule)

	local page2Wrap=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,ZIndex=4,LayoutOrder=1},futurePage)

	New("UIListLayout",{FillDirection=Enum.FillDirection.Vertical,Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},page2Wrap)

	local ownedSection=makeSection(page2Wrap,1,"Hitbox Presets","Your saved presets")
	local editorSection=makeSection(page2Wrap,2,"Preset Editor","edit hotkeys and hitbox sizes and save (maybe?)")
	local bindSection=makeSection(page2Wrap,3,"Keybind Settings","keyboard, controller, and mouse buttons are supported")

	local page2Ctx={
		New=New,
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
		equipOwnedPreset=equipOwnedPresetFromDataSave,
		deleteOwnedPreset=deleteOwnedPresetFromDataSave,
		State={},
		Bindings={
			{label="Toggle open / hide GUI",get=function() return TOGGLE_UI_KEY end,set=function(v) TOGGLE_UI_KEY=v; requestPlayerAutosave() end},
			{label="Hitbox Toggle",get=function() return TOGGLE_HB_KEY end,set=function(v) TOGGLE_HB_KEY=v; requestPlayerAutosave() end},
			{label="Jump Boost Toggle",get=function() return TOGGLE_JB_KEY end,set=function(v) TOGGLE_JB_KEY=v; requestPlayerAutosave() end},
			{label="Always Boost Toggle",get=function() return TOGGLE_AB_KEY end,set=function(v) TOGGLE_AB_KEY=v; requestPlayerAutosave() end},
			{label="ESP Toggle",get=function() return TOGGLE_ACTION_KEY end,set=function(v) TOGGLE_ACTION_KEY=v; requestPlayerAutosave() end},
			{label="Speed Toggle",get=function() return TOGGLE_SPEED_KEY end,set=function(v) TOGGLE_SPEED_KEY=v; requestPlayerAutosave() end},
			{label="QB Aim Lock Receiver",get=function() return QB_AIM_LOCK_KEY end,set=function(v) QB_AIM_LOCK_KEY=v; requestPlayerAutosave() end},
			{label="QB Aim Throw",get=function() return QB_AIM_THROW_KEY end,set=function(v) QB_AIM_THROW_KEY=v; requestPlayerAutosave() end},
			{label="QB Aim Toggle",get=function() return QB_AIM_TOGGLE_KEY end,set=function(v) QB_AIM_TOGGLE_KEY=v; requestPlayerAutosave() end},
		},
	}

	local hitboxPresets=nil
	local keybindSettings=nil
	local presetEditor=nil

	if HitboxPresetModule and type(HitboxPresetModule.new)=="function" then
		local ok,result=pcall(function()
			return HitboxPresetModule.new(page2Ctx,ownedSection)
		end)
		if ok then
			hitboxPresets=result
		else
			addPage2Error(ownedSection,"Hitbox Presets failed: "..tostring(result))
		end
	else
		addPage2Error(ownedSection,"Missing remote module: page-5/hitbox-preset/gui.lua")
	end

	if KeybindSettingsModule and type(KeybindSettingsModule.new)=="function" then
		local ok,result=pcall(function()
			return KeybindSettingsModule.new(page2Ctx,bindSection)
		end)
		if ok then
			keybindSettings=result
		else
			addPage2Error(bindSection,"Keybind Settings failed: "..tostring(result))
		end
	else
		addPage2Error(bindSection,"Missing remote module: page-5/keybind-settings/gui.lua")
	end

	if PresetEditorModule and type(PresetEditorModule.new)=="function" then
		if not keybindSettings then
			addPage2Error(editorSection,"Preset Editor needs keybind-settings/gui.lua to load first.")
		else
			local ok,result=pcall(function()
				return PresetEditorModule.new(page2Ctx,editorSection,keybindSettings,hitboxPresets)
			end)
			if ok then
				presetEditor=result
			else
				addPage2Error(editorSection,"Preset Editor failed: "..tostring(result))
			end
		end
	else
		addPage2Error(editorSection,"Missing remote module: page-5/preset-editor/gui.lua")
	end

	refreshPage2UI=function()
		if hitboxPresets and hitboxPresets.Refresh then pcall(hitboxPresets.Refresh) end
		if keybindSettings and keybindSettings.Refresh then pcall(keybindSettings.Refresh) end
		if presetEditor and presetEditor.Refresh then pcall(presetEditor.Refresh) end
	end

	local function refreshAll()
		refreshPage2UI()
	end

	if hitboxPresets and hitboxPresets.SetRefreshAll then hitboxPresets.SetRefreshAll(refreshAll) end
	if keybindSettings and keybindSettings.SetRefreshAll then keybindSettings.SetRefreshAll(refreshAll) end
	if presetEditor and presetEditor.SetRefreshAll then presetEditor.SetRefreshAll(refreshAll) end

	PAGE2_APIS.hitboxPresets=hitboxPresets
	PAGE2_APIS.keybindSettings=keybindSettings
	PAGE2_APIS.presetEditor=presetEditor

	refreshPage2UI()
end

function clearPage2()
	destroyPage2APIs()
	if not futurePage then return end

	for _,child in ipairs(futurePage:GetChildren()) do
		if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
			child:Destroy()
		end
	end
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
	TOGGLE_SPEED_KEY=Enum.KeyCode.Unknown
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

resetBtn.MouseButton1Click:Connect(function()
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
end)
