local AntiMaterial={}

local function safeDisconnect(conn)
	if conn and typeof(conn)=="RBXScriptConnection" then
		pcall(function()
			conn:Disconnect()
		end)
	end
end

local function ensureWorldSettings(ctx)
	local ws=ctx.WORLD_SETTINGS or ctx.WorldSettings or {}

	if ws.SmoothPlastic==nil then
		ws.SmoothPlastic=false
	end

	if type(ws.OriginalMaterials)~="table" or getmetatable(ws.OriginalMaterials)~=nil then
		ws.OriginalMaterials={}
	end

	ctx.WORLD_SETTINGS=ws
	return ws
end

local function applySmoothPlasticToPart(worldSettings,part)
	if not part or not part:IsA("BasePart") then return end

	if worldSettings.OriginalMaterials[part]==nil then
		worldSettings.OriginalMaterials[part]=part.Material
	end

	part.Material=Enum.Material.SmoothPlastic
end

function AntiMaterial.new(ctx,page)
	local THEME=ctx.THEME
	local makeSection=ctx.makeSection
	local buildToggleRow=ctx.buildToggleRow

	local worldSettings=ensureWorldSettings(ctx)
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

			worldSettings.OriginalMaterials={}
		end

		if materialToggle then
			materialToggle.set(worldSettings.SmoothPlastic)
		end

		if fire~=false and ctx.onChanged then
			pcall(ctx.onChanged,worldSettings.SmoothPlastic)
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

return AntiMaterial
