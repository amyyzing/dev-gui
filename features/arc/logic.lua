local arc={}

local arcRootNames={
	Center=true,
	BallMarker=true,
	LandingMarker=true,
	BallMarker_BallTrackingUX=true,
	LandingMarker_BallTrackingUX=true,
}

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
end

local function hiddenVisualProperty(instance)
	if instance:IsA("BasePart") or instance:IsA("Decal") or instance:IsA("Texture") then
		return "Transparency",1
	end
	if instance:IsA("Beam") or instance:IsA("Trail") or instance:IsA("ParticleEmitter") then
		return "Transparency",NumberSequence.new(1)
	end
	if instance:IsA("Smoke") then
		return "Opacity",0
	end
	if instance:IsA("Attachment") or instance:IsA("GuiObject")
		or instance:IsA("GuiBase3d") or instance:IsA("ForceField") then
		return "Visible",false
	end
	if instance:IsA("Fire") or instance:IsA("Sparkles") or instance:IsA("Highlight")
		or instance:IsA("Light")
		or instance:IsA("BillboardGui") or instance:IsA("SurfaceGui") then
		return "Enabled",false
	end
	return nil,nil
end

local function isNormalArcVisual(instance)
	if not instance then return false end

	local ancestor=instance
	while ancestor and ancestor~=workspace do
		if ancestor.Name=="DevGuiClonedCenter" then
			return false
		end
		if arcRootNames[ancestor.Name] then
			return ancestor.Parent and ancestor.Parent.Name=="Local"
		end
		ancestor=ancestor.Parent
	end

	return false
end

function arc.new(app,page)
	local makeSection=app.makeSection
	local buildToggleRow=app.buildToggleRow
	local safeDisconnect=app.safeDisconnect
	local state=app.state or{}
	local api={}
	local toggle=nil
	local hidden=state.Hidden==true
	local rootConnections={}
	local trackedRoots=setmetatable({},{__mode="k"})
	local records=setmetatable({},{__mode="k"})

	local function forceHidden(instance,record)
		if not(instance and instance.Parent and record) then return end
		pcall(function()
			instance[record.property]=record.hidden
		end)
	end

	local function trackVisual(instance)
		if not hidden or records[instance] or not isNormalArcVisual(instance) then return end
		local property,hiddenValue=hiddenVisualProperty(instance)
		if not property then return end

		local ok,desired=pcall(function()
			return instance[property]
		end)
		if not ok then return end

		local record={property=property,hidden=hiddenValue,desired=desired,connection=nil}
		records[instance]=record
		record.connection=instance:GetPropertyChangedSignal(property):Connect(function()
			if not hidden then return end
			local readOk,current=pcall(function()
				return instance[property]
			end)
			if not readOk or current==hiddenValue then return end
			record.desired=current
			forceHidden(instance,record)
		end)
		forceHidden(instance,record)
	end

	local function watchRoot(root)
		if not(root and root.Parent) or trackedRoots[root] then return end
		trackedRoots[root]=true
		for _,descendant in ipairs(root:GetDescendants()) do
			trackVisual(descendant)
		end
		rootConnections[#rootConnections+1]=root.DescendantAdded:Connect(trackVisual)
	end

	local function startHiding()
		watchRoot(workspace:FindFirstChild("Games"))
		watchRoot(workspace:FindFirstChild("MiniGames"))
		if not rootConnections.workspace then
			rootConnections.workspace=workspace.ChildAdded:Connect(function(child)
				if child.Name=="Games" or child.Name=="MiniGames" then
					watchRoot(child)
				end
			end)
		end
	end

	local function stopHiding()
		for key,connection in pairs(rootConnections) do
			safeDisconnect(connection)
			rootConnections[key]=nil
		end
		table.clear(trackedRoots)

		for instance,record in pairs(records) do
			safeDisconnect(record.connection)
			if instance and instance.Parent then
				pcall(function()
					instance[record.property]=record.desired
				end)
			end
			records[instance]=nil
		end
	end

	function api.SetHidden(value,fire)
		hidden=value and true or false
		state.Hidden=hidden
		if hidden then
			startHiding()
		else
			stopHiding()
		end

		if toggle then
			toggle.set(hidden)
		end
		if fire~=false and app.onChanged then
			pcall(app.onChanged,hidden)
		end
	end

	function api.GetHidden()
		return hidden
	end

	function api.Refresh()
		api.SetHidden(state.Hidden==true,false)
	end

	function api.Destroy()
		hidden=false
		stopHiding()
		destroyControl(toggle)
		toggle=nil
	end

	local section,controls=makeSection(page,1,"Hide Arc","",{
		headerToggle={
			startState=hidden,
			onChange=function(value)
				api.SetHidden(value,true)
			end,
		},
		compact=true,
	})

	toggle=controls and controls.toggle
	if not toggle then
		toggle=buildToggleRow(section,"hide arc",hidden,function(value)
			api.SetHidden(value,true)
		end)
	end

	api.Refresh()
	return api
end

return arc
