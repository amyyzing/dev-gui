local arc={}

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
end

local function isNormalArcBeam(instance)
	if not(instance and instance:IsA("Beam") and instance.Name=="ThrowingArc") then
		return false
	end

	local ancestor=instance.Parent
	while ancestor and ancestor~=workspace do
		if ancestor.Name=="DevGuiClonedCenter" then
			return false
		end
		if ancestor.Name=="Center" then
			return true
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

	local function forceHidden(beam)
		if not(beam and beam.Parent and beam.Enabled) then return end
		beam.Enabled=false
	end

	local function trackBeam(beam)
		if not hidden or records[beam] or not isNormalArcBeam(beam) then return end

		local record={desired=beam.Enabled,connection=nil}
		records[beam]=record
		record.connection=beam:GetPropertyChangedSignal("Enabled"):Connect(function()
			if not hidden or not beam.Enabled then return end
			record.desired=true
			forceHidden(beam)
		end)
		forceHidden(beam)
	end

	local function watchRoot(root)
		if not(root and root.Parent) or trackedRoots[root] then return end
		trackedRoots[root]=true
		for _,descendant in ipairs(root:GetDescendants()) do
			trackBeam(descendant)
		end
		rootConnections[#rootConnections+1]=root.DescendantAdded:Connect(trackBeam)
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

		for beam,record in pairs(records) do
			safeDisconnect(record.connection)
			if beam and beam.Parent then
				pcall(function()
					beam.Enabled=record.desired
				end)
			end
			records[beam]=nil
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
