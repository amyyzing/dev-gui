-- HB_RUNTIME_PART_3
-- Runtime chunk 3. Loaded by loader.lua with a shared environment.
function tintSlider(slider, color)
	if not slider then return end
	if slider.fill then
		slider.fill:SetAttribute("ThemeRole",nil)
		slider.fill.BackgroundColor3=color
	end
	if slider.knob then
		slider.knob:SetAttribute("ThemeRole",nil)
		slider.knob.BackgroundColor3=color
	end
end

function clearRuntimePage(parent,keepPadding)
	if not parent then return end

	for _,child in ipairs(parent:GetChildren()) do
		if not child:IsA("UIListLayout") and (not keepPadding or not child:IsA("UIPadding")) then
			child:Destroy()
		end
	end
end

function destroyRuntimeAPIs(apiNames)
	local env=getfenv()
	for _,apiName in ipairs(apiNames or {}) do
		local api=env[apiName]
		if api and api.Destroy then
			pcall(function()
				api.Destroy()
			end)
		end
		env[apiName]=nil
	end
end

function loadDeferredModuleByName(name)
	return setLoadedModule(name,loadDeferredModule(name,MODULE_PATHS[name],getfenv()[moduleGlobalName(name)]))
end

function loadDeferredModuleNames(names)
	for _,name in ipairs(names or {}) do
		loadDeferredModuleByName(name)
	end
end

function addRuntimeModuleError(parent,order,title,text)
	local section=makeSection(parent,order,title,"Remote module failed to load.")
	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text=text,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
end

function refreshRuntimeAPIs(apiNames)
	local env=getfenv()
	for _,apiName in ipairs(apiNames or {}) do
		local api=env[apiName]
		if api and api.Refresh then
			pcall(api.Refresh)
		end
	end
end

function buildRuntimeModule(spec,ctx,parent,...)
	local extra={...}
	local module=getfenv()[moduleGlobalName(spec.name)]
	if module and module.new then
		local ok,result=pcall(function()
			return module.new(ctx,parent,table.unpack(extra))
		end)
		if ok then
			getfenv()[spec.api]=result
			return result
		end
		addRuntimeModuleError(parent,spec.order or 1,spec.title,spec.title.." module failed: "..tostring(result))
	else
		addRuntimeModuleError(parent,spec.order or 1,spec.title,"Missing remote module: "..tostring(MODULE_PATHS[spec.name] or spec.name))
	end

	return nil
end

StrokeColourAPI=nil
resetCustomizePageDefaults=function() end

function clearCustomizePage()
	clearRuntimePage(uiSettingsPage,true)
end

function makeCustomizeCtx()
	return{
		New=New,
		Fusion=FusionModule,
		THEME=THEME,
		UI_STYLE=UI_STYLE,
		UIS=UIS,
		DEFAULT_UI_STYLE=getDefaultUIStyle and getDefaultUIStyle() or UI_STYLE,
		SG=SG,
		StrokeColourLogicModule=StrokeColourLogicModule,
		PrimaryColourModule=PrimaryColourModule,
		PrimaryColourLogicModule=PrimaryColourLogicModule,
		SecondaryColourModule=SecondaryColourModule,
		SecondaryColourLogicModule=SecondaryColourLogicModule,
		makeSection=makeSection,
		buildSlider=buildSlider,
		buildToggleRow=buildToggleRow,
		wrapTextButton=wrapTextButton,
		getUIStrokeColor=getUIStrokeColor,
		getUIStrokeGradientColor=getUIStrokeGradientColor,
		getUIPrimaryColor=getUIPrimaryColor,
		applyUIStrokeTheme=applyUIStrokeTheme,
		applyUIPrimaryTheme=applyUIPrimaryTheme,
		tintSlider=tintSlider,
		onChanged=function()
			applyUIStrokeTheme()
			requestPlayerAutosave()
		end,
	}
end

function buildCustomizePage()
	destroyRuntimeAPIs({"StrokeColourAPI"})
	resetCustomizePageDefaults=function() end
	clearCustomizePage()
	loadDeferredModuleNames(CUSTOMIZE_RELOAD_NAMES)

	StrokeColourAPI=buildRuntimeModule({name="StrokeColour",api="StrokeColourAPI",order=1,title="Stroke Colour"},makeCustomizeCtx(),uiSettingsPage)
	if StrokeColourAPI then
		resetCustomizePageDefaults=function()
			if StrokeColourAPI and StrokeColourAPI.Reset then
				StrokeColourAPI.Reset()
			end
		end
	end

	applyUIStrokeTheme()
	if updateResponsiveLayout then
		pcall(updateResponsiveLayout)
	end
end

rebuildCustomizeFromModules=function()
	if getActivePageName and getActivePageName()=="customize" then
		LAZY_PAGE_BUILT.customize=false
		ensureRuntimePageBuilt("customize")
		return
	end

	destroyRuntimeAPIs({"StrokeColourAPI"})
	resetCustomizePageDefaults=function() end
	clearCustomizePage()
	LAZY_PAGE_BUILT.customize=false
end

LAZY_PAGE_BUILDERS.customize=buildCustomizePage

MapEditorAPI=nil
AntiMaterialAPI=nil
MapCleanerAPI=nil
RemoveAdsAPI=nil
MAP_API_NAMES={"MapEditorAPI","AntiMaterialAPI","MapCleanerAPI","RemoveAdsAPI"}
MAP_MODULE_SPECS={
	{name="MapEditor",api="MapEditorAPI",order=0,title="Map Editor"},
	{name="AntiMaterial",api="AntiMaterialAPI",order=1,title="Anti Material"},
	{name="MapCleaner",api="MapCleanerAPI",order=2,title="Map Cleaner"},
	{name="RemoveAds",api="RemoveAdsAPI",order=3,title="Remove Ads"},
}

function clearMapPage()
	clearRuntimePage(mapPage,true)
end

function ensureWorldSettings()
	if WORLD_SETTINGS.SmoothPlastic==nil then
		WORLD_SETTINGS.SmoothPlastic=false
	end

	if type(WORLD_SETTINGS.OriginalMaterials)~="table" then
		WORLD_SETTINGS.OriginalMaterials=setmetatable({}, {__mode="k"})
	end
end

function makeMapCtx(name)
	local ctx={
		New=New,
		Fusion=FusionModule,
		THEME=THEME,
		makeSection=makeSection,
		buildSlider=buildSlider,
		buildToggleRow=buildToggleRow,
		wrapTextButton=wrapTextButton,
		safeDisconnect=safeDisconnect,
		getCurrentModeKey=function()
			return CURRENT_MODE_KEY
		end,
		onChanged=function()
			requestPlayerAutosave()
		end,
	}

	if name=="MapEditor" then
		ctx.MapEditorLogicModule=MapEditorLogicModule
	elseif name=="AntiMaterial" then
		ctx.WORLD_SETTINGS=WORLD_SETTINGS
		ctx.AntiMaterialLogicModule=AntiMaterialLogicModule
		ctx.onChanged=function(state)
			potatoMode=state and true or false
		end
	elseif name=="MapCleaner" then
		ctx.MapCleanerLogicModule=MapCleanerLogicModule
	elseif name=="RemoveAds" then
		ctx.RemoveAdsLogicModule=RemoveAdsLogicModule
	end

	return ctx
end

function buildMapPage()
	destroyRuntimeAPIs(MAP_API_NAMES)
	clearMapPage()
	ensureWorldSettings()
	loadDeferredModuleNames(MAP_RELOAD_NAMES)

	for _,spec in ipairs(MAP_MODULE_SPECS) do
		buildRuntimeModule(spec,makeMapCtx(spec.name),mapPage)
	end

	applyUIStrokeTheme()
end

rebuildMapFromModules=function()
	if getActivePageName and getActivePageName()=="maps" then
		LAZY_PAGE_BUILT.maps=false
		ensureRuntimePageBuilt("maps")
		return
	end

	destroyRuntimeAPIs(MAP_API_NAMES)
	clearMapPage()
	LAZY_PAGE_BUILT.maps=false
end

LAZY_PAGE_BUILDERS.maps=buildMapPage
