-- Runtime chunk 3. Loaded by loader.lua with a shared environment.
function tintSlider(slider, color)
	if slider.fill then slider.fill.BackgroundColor3=color end
	if slider.knob then slider.knob.BackgroundColor3=color end
end

StrokeColourAPI=nil
resetCustomizePageDefaults=function() end

function clearCustomizePage()
	if not uiSettingsPage then return end

	for _,child in ipairs(uiSettingsPage:GetChildren()) do
		if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
			child:Destroy()
		end
	end
end

function buildCustomizePage()
	if StrokeColourAPI and StrokeColourAPI.Destroy then
		pcall(function()
			StrokeColourAPI.Destroy()
		end)
	end

	StrokeColourAPI=nil
	resetCustomizePageDefaults=function() end

	clearCustomizePage()

	if StrokeColourModule and StrokeColourModule.new then
		local ok,result=pcall(function()
			return StrokeColourModule.new({
				New=New,
				THEME=THEME,
				UI_STYLE=UI_STYLE,

				DEFAULT_UI_STYLE={
					StrokeR=76,
					StrokeG=76,
					StrokeB=76,

					GradientR=45,
					GradientG=45,
					GradientB=45,

					StrokeGradient=false,
					LiquidStroke=false,

					LiquidStrokeSpeed=1,
					LiquidStrokeDirection="Right",

					StrokeThickness=1,
					StrokeTransparency=0.25,
					CornerRadius=8,
				},

				SG=SG,

				makeSection=makeSection,
				buildSlider=buildSlider,
				buildToggleRow=buildToggleRow,
				wrapTextButton=wrapTextButton,

				getUIStrokeColor=getUIStrokeColor,
				getUIStrokeGradientColor=getUIStrokeGradientColor,
				applyUIStrokeTheme=applyUIStrokeTheme,
				tintSlider=tintSlider,

				onChanged=function()
					applyUIStrokeTheme()
					requestPlayerAutosave()
				end,
			},uiSettingsPage)
		end)

		if ok then
			StrokeColourAPI=result

			resetCustomizePageDefaults=function()
				if StrokeColourAPI and StrokeColourAPI.Reset then
					StrokeColourAPI.Reset()
				end
			end
		else
			warn("Stroke colour module failed:",result)

			local fallbackSection=makeSection(uiSettingsPage,1,"Stroke Colour","Remote module failed to load.")
			New("TextLabel",{
				BackgroundTransparency=1,
				Size=UDim2.new(1,0,0,22),
				Text="page-3/stroke-colour.lua failed: "..tostring(result),
				Font=Enum.Font.Gotham,
				TextSize=12,
				TextColor3=THEME.RED,
				TextXAlignment=Enum.TextXAlignment.Left,
				ZIndex=6,
			},fallbackSection)
		end
	else
		warn("Missing remote module: page-3/stroke-colour.lua")

		local fallbackSection=makeSection(uiSettingsPage,1,"Stroke Colour","Remote module failed to load.")
		New("TextLabel",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,0,22),
			Text="Missing page-3/stroke-colour.lua",
			Font=Enum.Font.Gotham,
			TextSize=12,
			TextColor3=THEME.RED,
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=6,
		},fallbackSection)
	end

	applyUIStrokeTheme()

	if updateResponsiveLayout then
		pcall(updateResponsiveLayout)
	end
end

rebuildCustomizeFromModules=function()
	buildCustomizePage()
end

buildCustomizePage()

MapEditorAPI=nil
WorkspaceAPI=nil
RemoveAdsAPI=nil

function clearMapPage()
	if not mapPage then return end

	for _,child in ipairs(mapPage:GetChildren()) do
		if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
			child:Destroy()
		end
	end
end

function buildMapPage()
	if MapEditorAPI and MapEditorAPI.Destroy then
		pcall(function()
			MapEditorAPI.Destroy()
		end)
	end

	if WorkspaceAPI and WorkspaceAPI.Destroy then
		pcall(function()
			WorkspaceAPI.Destroy()
		end)
	end

	if RemoveAdsAPI and RemoveAdsAPI.Destroy then
		pcall(function()
			RemoveAdsAPI.Destroy()
		end)
	end

	MapEditorAPI=nil
	WorkspaceAPI=nil
	RemoveAdsAPI=nil
	clearMapPage()

	if WORLD_SETTINGS.SmoothPlastic==nil then
		WORLD_SETTINGS.SmoothPlastic=false
	end

	if type(WORLD_SETTINGS.OriginalMaterials)~="table" then
		WORLD_SETTINGS.OriginalMaterials=setmetatable({}, {__mode="k"})
	end

	if MapEditorModule and MapEditorModule.new then
		local ok,result=pcall(function()
			return MapEditorModule.new({
				New=New,
				THEME=THEME,
				makeSection=makeSection,
				buildSlider=buildSlider,
				buildToggleRow=buildToggleRow,
				wrapTextButton=wrapTextButton,
			},mapPage)
		end)

		if ok then
			MapEditorAPI=result
		else
			warn("Map editor module failed:",result)
		end
	end

	if WorkspaceModule and WorkspaceModule.new then
		local ok,result=pcall(function()
			return WorkspaceModule.new({
				New=New,
				THEME=THEME,
				WORLD_SETTINGS=WORLD_SETTINGS,

				makeSection=makeSection,
				buildToggleRow=buildToggleRow,

				onChanged=function(state)
					potatoMode=state and true or false
				end,
			},mapPage)
		end)

		if ok then
			WorkspaceAPI=result
		else
			local section=makeSection(mapPage,1,"Workspace","Remote module failed to load.")
			New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Workspace module failed: "..tostring(result),Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
		end
	else
		local section=makeSection(mapPage,1,"Workspace","Remote module failed to load.")
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Missing remote module: page-4/workspace.lua",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
	end

	if RemoveAdsModule and RemoveAdsModule.new then
		local ok,result=pcall(function()
			return RemoveAdsModule.new({
				New=New,
				THEME=THEME,
				makeSection=makeSection,
				buildToggleRow=buildToggleRow,
				getCurrentModeKey=function()
					return CURRENT_MODE_KEY
				end,
				onChanged=function()
					requestPlayerAutosave()
				end,
			},mapPage)
		end)

		if ok then
			RemoveAdsAPI=result
		else
			local section=makeSection(mapPage,2,"Remove Ads","Remote module failed to load.")
			New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Remove Ads module failed: "..tostring(result),Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
		end
	else
		local section=makeSection(mapPage,2,"Remove Ads","Remote module failed to load.")
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Missing remote module: page-4/remove-ads.lua",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
	end

	applyUIStrokeTheme()
end

rebuildMapFromModules=function()
	buildMapPage()
end

buildMapPage()
