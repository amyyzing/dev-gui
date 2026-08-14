local materials={}

local lighting=game:GetService("Lighting")

local effectClasses={
	ParticleEmitter=true,
	Trail=true,
	Smoke=true,
	Fire=true,
	Sparkles=true,
	PointLight=true,
	SpotLight=true,
	SurfaceLight=true,
	BloomEffect=true,
	BlurEffect=true,
	ColorCorrectionEffect=true,
	DepthOfFieldEffect=true,
	SunRaysEffect=true,
}

local function ensureWorldSettings(app)
	local ws=app.mapSettings or app.WorldSettings or{}

	if ws.SmoothPlastic==nil then
		ws.SmoothPlastic=false
	end

	if type(ws.OriginalMaterials)~="table" then
		ws.OriginalMaterials=setmetatable({}, {__mode="k"})
	elseif getmetatable(ws.OriginalMaterials)==nil then
		setmetatable(ws.OriginalMaterials,{__mode="k"})
	end

	if type(ws.OriginalVisuals)~="table" then
		ws.OriginalVisuals=setmetatable({}, {__mode="k"})
	elseif getmetatable(ws.OriginalVisuals)==nil then
		setmetatable(ws.OriginalVisuals,{__mode="k"})
	end

	app.mapSettings=ws
	return ws
end

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
end

local function setOptimizedProperty(worldSettings,instance,property,value)
	local ok,current=pcall(function()
		return instance[property]
	end)
	if not ok or current==value then return end

	local original=worldSettings.OriginalVisuals[instance]
	if not original then
		original={}
		worldSettings.OriginalVisuals[instance]=original
	end
	if original[property]==nil then
		original[property]=current
	end

	pcall(function()
		instance[property]=value
	end)
end

local function optimizeInstance(worldSettings,instance)
	if instance:IsA("BasePart") then
		if worldSettings.OriginalMaterials[instance]==nil then
			worldSettings.OriginalMaterials[instance]=instance.Material
		end
		setOptimizedProperty(worldSettings,instance,"Material",Enum.Material.SmoothPlastic)
		setOptimizedProperty(worldSettings,instance,"Reflectance",0)
		setOptimizedProperty(worldSettings,instance,"CastShadow",false)
		if instance:IsA("MeshPart") then
			setOptimizedProperty(worldSettings,instance,"RenderFidelity",Enum.RenderFidelity.Performance)
		end
	elseif effectClasses[instance.ClassName] then
		setOptimizedProperty(worldSettings,instance,"Enabled",false)
	end
end

local function optimizeWorld(worldSettings)
	for _,instance in ipairs(workspace:GetDescendants()) do
		optimizeInstance(worldSettings,instance)
	end
	for _,instance in ipairs(lighting:GetDescendants()) do
		optimizeInstance(worldSettings,instance)
	end

	setOptimizedProperty(worldSettings,lighting,"GlobalShadows",false)
	local terrain=workspace:FindFirstChildOfClass("Terrain")
	if terrain then
		setOptimizedProperty(worldSettings,terrain,"Decoration",false)
	end
end

local function restoreWorld(worldSettings)
	for instance,properties in pairs(worldSettings.OriginalVisuals) do
		if instance and (instance.Parent or instance==lighting or instance==workspace.Terrain) then
			for property,value in pairs(properties) do
				pcall(function()
					instance[property]=value
				end)
			end
		end
	end

	for part,material in pairs(worldSettings.OriginalMaterials) do
		if part and part.Parent and part:IsA("BasePart") then
			pcall(function()
				part.Material=material
			end)
		end
	end

	worldSettings.OriginalVisuals=setmetatable({}, {__mode="k"})
	worldSettings.OriginalMaterials=setmetatable({}, {__mode="k"})
end

function materials.new(app,page)
	local safeDisconnect=app.safeDisconnect
	local makeSection=app.makeSection
	local buildToggleRow=app.buildToggleRow

	local worldSettings=ensureWorldSettings(app)
	local api={}
	local materialToggle=nil
	local active=false

	local function disconnectWatchers()
		safeDisconnect(worldSettings.Conn)
		safeDisconnect(worldSettings.LightingConn)
		worldSettings.Conn=nil
		worldSettings.LightingConn=nil
	end

	function api.SetEnabled(state,fire)
		worldSettings.SmoothPlastic=state and true or false

		if worldSettings.SmoothPlastic then
			if not active then
				optimizeWorld(worldSettings)
			end

			if not worldSettings.Conn then
				worldSettings.Conn=workspace.DescendantAdded:Connect(function(instance)
					if worldSettings.SmoothPlastic then
						optimizeInstance(worldSettings,instance)
					end
				end)
			end
			if not worldSettings.LightingConn then
				worldSettings.LightingConn=lighting.DescendantAdded:Connect(function(instance)
					if worldSettings.SmoothPlastic then
						optimizeInstance(worldSettings,instance)
					end
				end)
			end
			active=true
		else
			disconnectWatchers()
			restoreWorld(worldSettings)
			active=false
		end

		if materialToggle then
			materialToggle.set(worldSettings.SmoothPlastic)
		end

		if fire~=false and app.onChanged then
			pcall(app.onChanged,worldSettings.SmoothPlastic)
		end
	end

	function api.GetEnabled()
		return worldSettings.SmoothPlastic and true or false
	end

	function api.Refresh()
		if materialToggle then
			materialToggle.set(worldSettings.SmoothPlastic)
		end

		if worldSettings.SmoothPlastic then
			api.SetEnabled(true,false)
		elseif active then
			api.SetEnabled(false,false)
		end
	end

	function api.Destroy()
		api.SetEnabled(false,false)
		destroyControl(materialToggle)
		materialToggle=nil
	end

	local section,sectionControls=makeSection(page,1,"Performance Mode","",{
		headerToggle={
			startState=worldSettings.SmoothPlastic,
			onChange=function(state)
				api.SetEnabled(state)
			end,
		},
		compact=true,
	})

	materialToggle=sectionControls and sectionControls.toggle
	if not materialToggle then
		materialToggle=buildToggleRow(section,"Performance Mode",worldSettings.SmoothPlastic,function(state)
			api.SetEnabled(state)
		end)
	end

	api.Refresh()
	return api
end

return materials
