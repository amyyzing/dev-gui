local WorkspaceModule={}

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

	if type(ws.OriginalMaterials)~="table" then
		ws.OriginalMaterials=setmetatable({},{__mode="k"})
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

function WorkspaceModule.new(ctx,page)
	local New=ctx.New
	local THEME=ctx.THEME
	local makeSection=ctx.makeSection
	local buildToggleRow=ctx.buildToggleRow

	local worldSettings=ensureWorldSettings(ctx)
	local api={}
	local materialToggle=nil
	local statusLabel=nil

	local function setStatus(text)
		if statusLabel then
			statusLabel.Text=text
		end
	end

	function api.SetEnabled(state)
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

			setStatus("Potato PC mode is enabled. Workspace materials are SmoothPlastic.")
		else
			for part,material in pairs(worldSettings.OriginalMaterials) do
				if part and part.Parent and part:IsA("BasePart") then
					part.Material=material
				end
			end

			worldSettings.OriginalMaterials=setmetatable({},{__mode="k"})
			setStatus("Potato PC mode is disabled. Original materials restored.")
		end

		if materialToggle then
			materialToggle.set(worldSettings.SmoothPlastic)
		end

		if ctx.onChanged then
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

		setStatus(worldSettings.SmoothPlastic and "Potato PC mode is enabled. Workspace materials are SmoothPlastic." or "Potato PC mode is disabled. Original materials restored.")
	end

	function api.Destroy()
		api.SetEnabled(false)
	end

	local section=makeSection(page,1,"Workspace","for potato pc players")

	materialToggle=buildToggleRow(section,"Potato PC mode",worldSettings.SmoothPlastic,function(state)
		api.SetEnabled(state)
	end)

	statusLabel=New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,34),
		Text="Potato PC mode is disabled. Original materials restored.",
		Font=Enum.Font.Gotham,
		TextSize=11,
		TextColor3=THEME.MUTED,
		TextWrapped=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextYAlignment=Enum.TextYAlignment.Top,
		ZIndex=6,
	},section)

	api.Refresh()
	return api
end

return WorkspaceModule
