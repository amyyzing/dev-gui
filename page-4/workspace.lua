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
	local statusBadge=nil
	local statusBadgeText=nil

	local function setStatus(text,enabled)
		if statusLabel then
			statusLabel.Text=text
		end

		if statusBadge then
			statusBadge.BackgroundColor3=enabled and THEME.GREEN or THEME.BG
		end

		if statusBadgeText then
			statusBadgeText.Text=enabled and "ON" or "OFF"
			statusBadgeText.TextColor3=enabled and Color3.fromRGB(0,0,0) or THEME.MUTED
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

			setStatus("Workspace materials are being forced to SmoothPlastic.",true)
		else
			for part,material in pairs(worldSettings.OriginalMaterials) do
				if part and part.Parent and part:IsA("BasePart") then
					part.Material=material
				end
			end

			worldSettings.OriginalMaterials=setmetatable({},{__mode="k"})
			setStatus("Original workspace materials are being used.",false)
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

		setStatus(worldSettings.SmoothPlastic and "Workspace materials are being forced to SmoothPlastic." or "Original workspace materials are being used.",worldSettings.SmoothPlastic)
	end

	function api.Destroy()
		api.SetEnabled(false)
	end

	local section=makeSection(page,1,"Workspace","Performance")

	local statusRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,34),
		ZIndex=5,
	},section)

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,-60,1,0),
		Text="Material Override",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},statusRow)

	statusBadge=New("Frame",{
		Size=UDim2.fromOffset(48,22),
		Position=UDim2.new(1,-48,0.5,-11),
		BackgroundColor3=THEME.BG,
		BorderSizePixel=0,
		ZIndex=6,
	},statusRow)

	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},statusBadge)

	statusBadgeText=New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,1,0),
		Text="OFF",
		Font=Enum.Font.GothamMedium,
		TextSize=11,
		TextColor3=THEME.MUTED,
		TextXAlignment=Enum.TextXAlignment.Center,
		ZIndex=7,
	},statusBadge)

	materialToggle=buildToggleRow(section,"SmoothPlastic",worldSettings.SmoothPlastic,function(state)
		api.SetEnabled(state)
	end)

	statusLabel=New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,30),
		Text="Original workspace materials are being used.",
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
