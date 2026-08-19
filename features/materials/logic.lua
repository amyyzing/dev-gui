local materials={}

local function ensureWorldSettings(app)
	local ws=app.mapSettings or app.WorldSettings or {}

	if ws.SmoothPlastic==nil then
		ws.SmoothPlastic=false
	end

	if type(ws.OriginalMaterials)~="table" then
		ws.OriginalMaterials=setmetatable({}, {__mode="k"})
	elseif getmetatable(ws.OriginalMaterials)==nil then
		setmetatable(ws.OriginalMaterials,{__mode="k"})
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

local function applySmoothPlasticToPart(worldSettings,part)
	if not part or not part:IsA("BasePart") then return end

	if worldSettings.OriginalMaterials[part]==nil then
		worldSettings.OriginalMaterials[part]=part.Material
	end

	if part.Material~=Enum.Material.SmoothPlastic then
		part.Material=Enum.Material.SmoothPlastic
	end
end

function materials.new(app,page)
	local safeDisconnect=app.safeDisconnect
	local makeSection=app.makeSection
	local buildToggleRow=app.buildToggleRow

	local worldSettings=ensureWorldSettings(app)
	local api={}
	local materialToggle=nil

	function api.SetEnabled(state,fire)
		worldSettings.SmoothPlastic=state and true or false
		safeDisconnect(worldSettings.Conn)
		worldSettings.Conn=nil

		if worldSettings.SmoothPlastic then
			for _,inst in ipairs(workspace:GetDescendants()) do
				applySmoothPlasticToPart(worldSettings,inst)
			end

			worldSettings.Conn=workspace.DescendantAdded:Connect(function(inst)
				if worldSettings.SmoothPlastic then
					applySmoothPlasticToPart(worldSettings,inst)
				end
			end)
		else
			for part,material in pairs(worldSettings.OriginalMaterials) do
				if part and part.Parent and part:IsA("BasePart") then
					part.Material=material
				end
			end

			worldSettings.OriginalMaterials=setmetatable({}, {__mode="k"})
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
		end
	end

	function api.Destroy()
		api.SetEnabled(false,false)
		destroyControl(materialToggle)
		materialToggle=nil
	end

	local section,sectionControls=makeSection(page,1,"Anti Material","",{
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
		materialToggle=buildToggleRow(section,"SmoothPlastic",worldSettings.SmoothPlastic,function(state)
			api.SetEnabled(state)
		end)
	end

	api.Refresh()
	return api
end

return materials
