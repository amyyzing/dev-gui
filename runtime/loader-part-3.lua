-- HB_RUNTIME_PART_3
-- boot step 3: map editor page and shared runtime services.

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
	local env=getfenv()
	return setLoadedModule(name,loadDeferredModule(name,MODULE_PATHS[name],rawget(env,moduleGlobalName(name))))
end

function loadDeferredModuleNames(names)
	for _,name in ipairs(names or {}) do
		loadDeferredModuleByName(name)
	end
end

function addRuntimeModuleError(parent,order,title,text)
	table.insert(RUNTIME_BUILD_ERRORS,tostring(title)..": "..tostring(text))
	local section=makeSection(parent,order,title,"module did not load")
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

function buildRuntimeModule(spec,app,parent,...)
	local extra={...}
	local env=getfenv()
	local featureModule=rawget(env,moduleGlobalName(spec.name))
	if not featureModule then
		featureModule=loadDeferredModuleByName(spec.name)
	end

	if featureModule and featureModule.new then
		local ok,result=pcall(function()
			return featureModule.new(app,parent,table.unpack(extra))
		end)
		if ok then
			getfenv()[spec.api]=result
			return result
		end
		addRuntimeModuleError(parent,spec.order or 1,spec.title,spec.title.." module failed: "..tostring(result))
	else
		addRuntimeModuleError(parent,spec.order or 1,spec.title,"missing module: "..tostring(MODULE_PATHS[spec.name] or spec.name))
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
		Services=RuntimeServices,
		Scheduler=RuntimeScheduler,
		StateStore=RuntimeStateStore,
		ThemeStore=RuntimeThemeStore,
		Janitor=RuntimeJanitor,
		THEME=THEME,
		UI_STYLE=UI_STYLE,
		UIS=UIS,
		DEFAULT_UI_STYLE=getDefaultUIStyle and getDefaultUIStyle() or UI_STYLE,
		SG=SG,
		StrokeColourLogicModule=StrokeColourLogicModule,
		Page1GameParamsModule=Page1GameParamsModule,
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
			if PAGE1_APIS and PAGE1_APIS.ESP and PAGE1_APIS.ESP.Refresh then
				pcall(PAGE1_APIS.ESP.Refresh)
			end
			if PAGE1_APIS and PAGE1_APIS.QBAim and PAGE1_APIS.QBAim.Refresh then
				pcall(PAGE1_APIS.QBAim.Refresh)
			end
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

function resetMapRuntimeState()
	if destroyRuntimeAPIs and MAP_API_NAMES then
		pcall(destroyRuntimeAPIs,MAP_API_NAMES)
	end

	ensureWorldSettings()

	if WORLD_SETTINGS.Conn then
		safeDisconnect(WORLD_SETTINGS.Conn)
		WORLD_SETTINGS.Conn=nil
	end

	for part,material in pairs(WORLD_SETTINGS.OriginalMaterials or {}) do
		if part and part.Parent and part:IsA("BasePart") then
			pcall(function()
				part.Material=material
			end)
		end
	end

	WORLD_SETTINGS.SmoothPlastic=false
	WORLD_SETTINGS.OriginalMaterials=setmetatable({}, {__mode="k"})
	potatoMode=false
end

function makeMapCtx(name)
	local app={
		New=New,
		Fusion=FusionModule,
		Services=RuntimeServices,
		Scheduler=RuntimeScheduler,
		StateStore=RuntimeStateStore,
		ThemeStore=RuntimeThemeStore,
		Janitor=RuntimeJanitor,
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
		app.MapEditorLogicModule=MapEditorLogicModule
	elseif name=="AntiMaterial" then
		app.WORLD_SETTINGS=WORLD_SETTINGS
		app.AntiMaterialLogicModule=AntiMaterialLogicModule
		app.onChanged=function(state)
			potatoMode=state and true or false
			if WORLD_SETTINGS then
				WORLD_SETTINGS.SmoothPlastic=potatoMode
			end
			requestPlayerAutosave()
		end
	elseif name=="MapCleaner" then
		app.MapCleanerLogicModule=MapCleanerLogicModule
	elseif name=="RemoveAds" then
		app.RemoveAdsLogicModule=RemoveAdsLogicModule
	end

	return app
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
	resetMapRuntimeState()

	if getActivePageName and getActivePageName()=="maps" then
		LAZY_PAGE_BUILT.maps=false
		ensureRuntimePageBuilt("maps")
		return
	end

	clearMapPage()
	LAZY_PAGE_BUILT.maps=false
end

LAZY_PAGE_BUILDERS.maps=buildMapPage

PRELOAD_RUNTIME_PAGE_NAMES=LOADER_PAGE_BUILD_NAMES or {"maps","customize","page2","settings","server"}
function buildAllRuntimePages()
	local okAll=true
	local pageCount=#PRELOAD_RUNTIME_PAGE_NAMES
	loaderPhaseCurrent=#STARTUP_MODULE_PATHS

	for _,pageName in ipairs(PRELOAD_RUNTIME_PAGE_NAMES) do
		if ensureRuntimePageBuilt then
			loaderPhaseCurrent=(loaderPhaseCurrent or #STARTUP_MODULE_PATHS)+1
			if setLoaderProgress then
				setLoaderProgress("Building interface page.",loaderPhaseCurrent,LOADER_TOTAL,false)
			end

			local ok,result=pcall(ensureRuntimePageBuilt,pageName)
			if not ok or result==false then
				okAll=false
				if setLoaderProgress then
					setLoaderProgress("gui page failed",loaderPhaseCurrent,LOADER_TOTAL,true)
				end
				warn("page build failed:",pageName,ok and result or result)
			end
		end
	end

	if #RUNTIME_BUILD_ERRORS>0 then
		okAll=false
		if setLoaderProgress then
			setLoaderProgress("some gui pages failed",LOADER_TOTAL,LOADER_TOTAL,true)
		end
	elseif okAll and setLoaderProgress then
		setLoaderProgress("Built all GUI pages.",#STARTUP_MODULE_PATHS+pageCount,LOADER_TOTAL,false)
	end

	return okAll
end
