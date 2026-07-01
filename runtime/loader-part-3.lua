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
		if api and type(api.Destroy)=="function" then
			pcall(function()
				api.Destroy()
			end)
		end
		env[apiName]=nil
	end
end

function loadDeferredModuleByName(name)
	local env=getfenv()
	return setLoadedModule(name,loadDeferredModule(name,modulePaths[name],rawget(env,moduleGlobalName(name))))
end

function loadDeferredModuleNames(names)
	for _,name in ipairs(names or {}) do
		loadDeferredModuleByName(name)
	end
end

function addRuntimeModuleError(parent,order,title,text)
	table.insert(runtimeBuildErrors,tostring(title)..": "..tostring(text))
	local section=makeSection(parent,order,title,"module did not load")
	make("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text=text,Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.red,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
end

function refreshRuntimeAPIs(apiNames)
	local env=getfenv()
	for _,apiName in ipairs(apiNames or {}) do
		local api=env[apiName]
		if api and type(api.Refresh)=="function" then
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
		addRuntimeModuleError(parent,spec.order or 1,spec.title,"missing module: "..tostring(modulePaths[spec.name] or spec.name))
	end

	return nil
end

ColorsAPI=nil
resetCustomizePageDefaults=function() end

function clearCustomizePage()
	clearRuntimePage(uiSettingsPage,true)
end

function makeCustomizeCtx()
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
		inputService=inputService,
		defaultStyle=getDefaultUIStyle and getDefaultUIStyle() or style,
		screenGui=screenGui,
		ColorsLogicModule=ColorsLogicModule,
		ParamsModule=ParamsModule,
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
			if mainPageApis and mainPageApis.esp and type(mainPageApis.esp.Refresh)=="function" then
				pcall(mainPageApis.esp.Refresh)
			end
			if mainPageApis and mainPageApis.QBAim and type(mainPageApis.QBAim.Refresh)=="function" then
				pcall(mainPageApis.QBAim.Refresh)
			end
			requestPlayerAutosave()
		end,
	}
end

function buildCustomizePage()
	destroyRuntimeAPIs({"ColorsAPI"})
	resetCustomizePageDefaults=function() end
	clearCustomizePage()
	loadDeferredModuleNames(customizeReloadNames)

	ColorsAPI=buildRuntimeModule({name="Colors",api="ColorsAPI",order=1,title="Colors"},makeCustomizeCtx(),uiSettingsPage)
	if ColorsAPI then
		resetCustomizePageDefaults=function()
			if ColorsAPI and ColorsAPI.Reset then
				ColorsAPI.Reset()
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
		lazyPageBuilt.customize=false
		ensureRuntimePageBuilt("customize")
		return
	end

	destroyRuntimeAPIs({"ColorsAPI"})
	resetCustomizePageDefaults=function() end
	clearCustomizePage()
	lazyPageBuilt.customize=false
end

lazyPageBuilders.customize=buildCustomizePage

MapEditorAPI=nil
MaterialsAPI=nil
MapCleanerAPI=nil
AdsAPI=nil
mapApiNames={"MapEditorAPI","MaterialsAPI","MapCleanerAPI","AdsAPI"}
mapPageModules=(UIMapModule and UIMapModule.MapPage and UIMapModule.MapPage.Modules) or {
	{name="MapEditor",api="MapEditorAPI",order=0,title="Map Editor"},
	{name="Materials",api="MaterialsAPI",order=1,title="Anti Material"},
	{name="MapCleaner",api="MapCleanerAPI",order=2,title="Map Cleaner"},
	{name="Ads",api="AdsAPI",order=3,title="Remove Ads"},
}

function clearMapPage()
	clearRuntimePage(mapPage,true)
end

function ensureWorldSettings()
	if mapSettings.SmoothPlastic==nil then
		mapSettings.SmoothPlastic=false
	end

	if type(mapSettings.OriginalMaterials)~="table" then
		mapSettings.OriginalMaterials=setmetatable({}, {__mode="k"})
	end
end

function resetMapRuntimeState()
	if destroyRuntimeAPIs and mapApiNames then
		pcall(destroyRuntimeAPIs,mapApiNames)
	end

	ensureWorldSettings()

	if mapSettings.Conn then
		safeDisconnect(mapSettings.Conn)
		mapSettings.Conn=nil
	end

	for part,material in pairs(mapSettings.OriginalMaterials or {}) do
		if part and part.Parent and part:IsA("BasePart") then
			pcall(function()
				part.Material=material
			end)
		end
	end

	mapSettings.SmoothPlastic=false
	mapSettings.OriginalMaterials=setmetatable({}, {__mode="k"})
	potatoMode=false
end

function makeMapCtx(name)
	local app={
		make=make,
		fusion=FusionModule,
		Services=sharedRuntime,
		schedulerApi=jobRunner,
		StateStore=settingsStore,
		ThemeStore=themeRuntime,
		Janitor=cleanupBags,
		colors=colors,
		makeSection=makeSection,
		buildSlider=buildSlider,
		buildToggleRow=buildToggleRow,
		wrapTextButton=wrapTextButton,
		safeDisconnect=safeDisconnect,
		getCurrentModeKey=function()
			return currentModeKey
		end,
		onChanged=function()
			requestPlayerAutosave()
		end,
	}

	if name=="MapEditor" then
		app.MapEditorLogicModule=MapEditorLogicModule
	elseif name=="Materials" then
		app.mapSettings=mapSettings
		app.MaterialsLogicModule=MaterialsLogicModule
		app.onChanged=function(state)
			potatoMode=state and true or false
			if mapSettings then
				mapSettings.SmoothPlastic=potatoMode
			end
			requestPlayerAutosave()
		end
	elseif name=="MapCleaner" then
		app.MapCleanerLogicModule=MapCleanerLogicModule
	elseif name=="Ads" then
		app.AdsLogicModule=AdsLogicModule
	end

	return app
end

function buildMapPage()
	destroyRuntimeAPIs(mapApiNames)
	clearMapPage()
	ensureWorldSettings()
	loadDeferredModuleNames(mapReloadNames)

	for _,spec in ipairs(mapPageModules) do
		buildRuntimeModule(spec,makeMapCtx(spec.name),mapPage)
	end

	applyUIStrokeTheme()
end

rebuildMapFromModules=function()
	resetMapRuntimeState()

	if getActivePageName and getActivePageName()=="maps" then
		lazyPageBuilt.maps=false
		ensureRuntimePageBuilt("maps")
		return
	end

	clearMapPage()
	lazyPageBuilt.maps=false
end

lazyPageBuilders.maps=buildMapPage

pagesToPreload=loaderPageNames or {"maps","customize","page2","settings","server"}
function buildAllRuntimePages()
	local okAll=true
	local pageCount=#pagesToPreload
	loaderPhaseCurrent=#startupModuleFiles

	for _,pageName in ipairs(pagesToPreload) do
		if ensureRuntimePageBuilt then
			loaderPhaseCurrent=(loaderPhaseCurrent or #startupModuleFiles)+1
			if setLoaderProgress then
				setLoaderProgress("building gui page",loaderPhaseCurrent,loaderStepTotal,false)
			end

			local ok,result=pcall(ensureRuntimePageBuilt,pageName)
			if not ok or result==false then
				okAll=false
				if setLoaderProgress then
					setLoaderProgress("gui page failed",loaderPhaseCurrent,loaderStepTotal,true)
				end
				warn("page build failed:",pageName,ok and result or result)
			end
		end
	end

	if #runtimeBuildErrors>0 then
		okAll=false
		if setLoaderProgress then
			setLoaderProgress("some gui pages failed",loaderStepTotal,loaderStepTotal,true)
		end
	elseif okAll and setLoaderProgress then
		setLoaderProgress("Built all GUI pages.",#startupModuleFiles+pageCount,loaderStepTotal,false)
	end

	return okAll
end
