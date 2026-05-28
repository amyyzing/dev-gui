local WorkspaceModule={}

local originals=setmetatable({},{__mode="k"})

local function save(obj,props)
	if originals[obj] then return end

	local data={}
	for _,prop in ipairs(props) do
		local ok,value=pcall(function()
			return obj[prop]
		end)

		if ok then
			data[prop]=value
		end
	end

	originals[obj]=data
end

local function restoreOne(obj)
	local data=originals[obj]
	if not data then return end

	for prop,value in pairs(data) do
		pcall(function()
			obj[prop]=value
		end)
	end

	originals[obj]=nil
end

local function applyPotatoTo(obj)
	if obj:IsA("BasePart") then
		save(obj,{"Material","Reflectance","CastShadow"})
		pcall(function()
			obj.Material=Enum.Material.SmoothPlastic
			obj.Reflectance=0
			obj.CastShadow=false
		end)
	elseif obj:IsA("Decal") or obj:IsA("Texture") then
		save(obj,{"Transparency"})
		pcall(function()
			obj.Transparency=1
		end)
	elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
		save(obj,{"Enabled"})
		pcall(function()
			obj.Enabled=false
		end)
	end
end

function WorkspaceModule.new(ctx,page)
	local New=ctx.New
	local THEME=ctx.THEME
	local makeSection=ctx.makeSection
	local buildToggleRow=ctx.buildToggleRow

	local api={}
	local enabled=false
	local descendantConn=nil
	local statusLabel=nil
	local toggle=nil

	local state=ctx.State or {}
	ctx.State=state

	local targetWorkspace=ctx.Workspace or workspace

	local function setStatus(text)
		if statusLabel then
			statusLabel.Text=text
		end
	end

	function api.Apply()
		for _,obj in ipairs(targetWorkspace:GetDescendants()) do
			applyPotatoTo(obj)
		end

		if not descendantConn then
			descendantConn=targetWorkspace.DescendantAdded:Connect(function(obj)
				if enabled then
					task.defer(function()
						if obj and obj.Parent then
							applyPotatoTo(obj)
						end
					end)
				end
			end)
		end

		setStatus("Potato PC mode is enabled.")
	end

	function api.Restore()
		for obj,_ in pairs(originals) do
			if obj and obj.Parent then
				restoreOne(obj)
			else
				originals[obj]=nil
			end
		end

		if descendantConn then
			descendantConn:Disconnect()
			descendantConn=nil
		end

		setStatus("Potato PC mode is disabled.")
	end

	function api.SetEnabled(value)
		enabled=value and true or false
		state.potatoMode=enabled
		ctx.potatoMode=enabled

		if enabled then
			api.Apply()
		else
			api.Restore()
		end

		if toggle then
			toggle.set(enabled)
		end
	end

	function api.GetEnabled()
		return enabled
	end

	function api.Refresh()
		if toggle then
			toggle.set(enabled)
		end

		setStatus(enabled and "Potato PC mode is enabled." or "Potato PC mode is disabled.")
	end

	function api.Destroy()
		api.Restore()
	end

	local section=makeSection(page,1,"Workspace","for potato pc players")

	toggle=buildToggleRow(section,"Potato PC mode",state.potatoMode or ctx.potatoMode or false,function(value)
		api.SetEnabled(value)
	end)

	statusLabel=New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,34),
		Text="Potato PC mode is disabled.",
		Font=Enum.Font.Gotham,
		TextSize=11,
		TextColor3=THEME.MUTED,
		TextWrapped=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextYAlignment=Enum.TextYAlignment.Top,
		ZIndex=6,
	},section)

	api.SetEnabled(state.potatoMode or ctx.potatoMode or false)
	api.Refresh()

	return api
end

return WorkspaceModule
