-- Runtime chunk 4. Loaded by loader.lua with a shared environment.
refreshPage2UI=function() end
PAGE2_EXPANDED_OWNED={}
PlayerDataAPI=nil
DiscordAPI=nil

function showConfirmModal(titleText, bodyText, yesText, onYes)
	local modal=New("Frame", {BackgroundColor3=Color3.fromRGB(0, 0, 0), BackgroundTransparency=0.25, BorderSizePixel=0, Size=UDim2.new(1, 0, 1, 0), ZIndex=100}, SG)

	local box=New("Frame", {AnchorPoint=Vector2.new(0.5, 0.5), Position=UDim2.new(0.5, 0, 0.5, 0), Size=UDim2.fromOffset(390, 170), BackgroundColor3=THEME.BG, BorderSizePixel=0, ZIndex=101}, modal)

	New("UIStroke", {Color=THEME.STROKE, Thickness=2, Transparency=0}, box)

	New("TextLabel", {BackgroundTransparency=1, Position=UDim2.fromOffset(16, 14), Size=UDim2.new(1, -32, 0, 24), Text=titleText, Font=Enum.Font.GothamMedium, TextSize=14, TextColor3=THEME.TEXT, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=102}, box)

	New("TextLabel", {BackgroundTransparency=1, Position=UDim2.fromOffset(16, 48), Size=UDim2.new(1, -32, 0, 54), Text=bodyText, Font=Enum.Font.Gotham, TextSize=12, TextWrapped=true, TextColor3=THEME.MUTED, TextXAlignment=Enum.TextXAlignment.Left, TextYAlignment=Enum.TextYAlignment.Top, ZIndex=102}, box)

	local function modalButton(text, x)
		local b=New("TextButton", {Position=UDim2.fromOffset(x, 120), Size=UDim2.fromOffset(104, 30), BackgroundColor3=THEME.BG, BorderSizePixel=0, Text=text, Font=Enum.Font.Gotham, TextSize=12, TextColor3=THEME.TEXT, AutoButtonColor=false, ZIndex=102}, box)

		local wrap=wrapTextButton(b, THEME.BG, 2)

		b.MouseEnter:Connect(function()
			wrap.BackgroundColor3=Color3.fromRGB(43,43,43)
		end)

		b.MouseLeave:Connect(function()
			wrap.BackgroundColor3=THEME.PANEL
		end)

		return b
	end

	local no=modalButton("CANCEL", 160)
	local yes=modalButton(yesText or"YES", 274)

	no.MouseButton1Click:Connect(function()
		modal:Destroy()
	end)

	yes.MouseButton1Click:Connect(function()
		modal:Destroy()
		if onYes then onYes() end
	end)
end

function refreshSettingsPage()
	if WorkspaceAPI and WorkspaceAPI.Refresh then
		pcall(function()
			WorkspaceAPI.Refresh()
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

function buildActualSettingsPage()
	if PlayerDataModule and PlayerDataModule.new then
		local ok,result=pcall(function()
			return PlayerDataModule.new({
				New=New,
				THEME=THEME,
				SG=SG,
				BOT_API=BOT_API,
				playerId=tostring(me.UserId),
				me=me,

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
				Workspace=WorkspaceAPI,
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
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Missing remote module: page-5/player-data.lua",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
	end

	if DiscordModule and DiscordModule.new then
		local ok,result=pcall(function()
			return DiscordModule.new({
				New=New,
				THEME=THEME,
				BOT_API=BOT_API,
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
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Missing remote module: page-5/discord.lua",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
	end

	refreshSettingsPage()
end

buildActualSettingsPage()

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
	buildActualSettingsPage()
end

activeCapture=nil

function addPage2Error(parent,text)
	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text=text,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},parent)
end

function buildPage2()
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
		addPage2Error(ownedSection,"Missing remote module: page-2/hitbox-preset.lua")
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
		addPage2Error(bindSection,"Missing remote module: page-2/keybind-settings.lua")
	end

	if PresetEditorModule and type(PresetEditorModule.new)=="function" then
		if not keybindSettings then
			addPage2Error(editorSection,"Preset Editor needs keybind-settings.lua to load first.")
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
		addPage2Error(editorSection,"Missing remote module: page-2/preset-editor.lua")
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

	refreshPage2UI()
end

buildPage2()
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
