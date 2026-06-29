-- hides unused map parts and restores them later.

local mapCleaner={}

local function firstChild(parent)
	if not parent then return nil end
	return parent:GetChildren()[1]
end

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
end

local function gameReplicated()
	local games=workspace:FindFirstChild("Games")
	local gameFolder=firstChild(games)
	return gameFolder and gameFolder:FindFirstChild("Replicated")
end

local function workspaceParent()
	return workspace
end

local targetNames={
	{key="GameSpawn",name="Spawn",parent=gameReplicated},
	{key="GameVoting",name="Voting",parent=gameReplicated},
	{key="WorkspaceSet",name="Set",parent=workspaceParent},
	{key="PinkDiamondStage",name="PinkDiamondStage",parent=workspaceParent},
	{key="Pack",name="Pack",parent=workspaceParent},
	{key="Packs",name="Packs",parent=workspaceParent},
}

local function isTarget(inst)
	if not inst then return false end

	for _,target in ipairs(targetNames) do
		local parent=target.parent()
		if parent and inst.Name==target.name and inst.Parent==parent then
			return true
		end
	end

	return false
end

function mapCleaner.new(app,page)
	local make=app.New
	local colors=app.colors
	local safeDisconnect=app.safeDisconnect
	local makeSection=app.makeSection
	local buildToggleRow=app.buildToggleRow
	local getCurrentModeKey=app.getCurrentModeKey or function() return "mode1" end

	local api={}
	local enabled=false
	local toggle=nil
	local statusLabel=nil
	local workspaceConn=nil
	local removed={}
	local removedSet=setmetatable({}, {__mode="k"})

	local function isGameplay()
		return tostring(getCurrentModeKey() or "mode1")=="mode1"
	end

	local function setStatus(text,color)
		if not statusLabel then return end
		statusLabel.Text=text
		statusLabel.TextColor3=color or colors.muted
	end

	local function removeOne(inst,target,parent)
		if not inst or removedSet[inst] then return false end

		removedSet[inst]=true
		table.insert(removed,{
			key=target.key,
			name=target.name,
			instance=inst,
			parent=parent or inst.Parent,
		})
		inst.Parent=nil
		return true
	end

	local function removeCurrent()
		if not isGameplay() then
			setStatus("game only",colors.muted)
			return
		end

		local changed=0
		for _,target in ipairs(targetNames) do
			local parent=target.parent()
			local inst=parent and parent:FindFirstChild(target.name)
			if inst then
				if removeOne(inst,target,parent) then
					changed=changed+1
				end
			end
		end

		setStatus("removed "..tostring(#removed),changed>0 and colors.green or colors.muted)
	end

	local function restoreRemoved()
		for i=#removed,1,-1 do
			local entry=removed[i]
			local inst=entry and entry.instance
			local target=nil

			for _,candidate in ipairs(targetNames) do
				if candidate.key==entry.key then
					target=candidate
					break
				end
			end

			local fallbackParent=target and target.parent()
			local parent=(entry.parent and entry.parent.Parent and entry.parent) or fallbackParent

			if inst and inst.Parent==nil and parent then
				inst.Parent=parent
			end

			if inst then
				removedSet[inst]=nil
			end

			table.remove(removed,i)
		end
	end

	local function watchWorkspace()
		if workspaceConn then return end

		workspaceConn=workspace.DescendantAdded:Connect(function(inst)
			if not enabled then return end

			task.defer(function()
				if enabled and isTarget(inst) then
					removeCurrent()
				end
			end)
		end)
	end

	local function disconnectWatchers()
		safeDisconnect(workspaceConn)
		workspaceConn=nil
	end

	function api.SetEnabled(state,fire)
		enabled=state and isGameplay() or false

		if toggle then
			toggle.set(enabled)
		end

		if enabled then
			watchWorkspace()
			removeCurrent()
		else
			disconnectWatchers()
			restoreRemoved()
			setStatus(isGameplay() and "map back" or "game only",colors.muted)
		end

		if fire~=false and app.onChanged then
			pcall(app.onChanged,enabled)
		end
	end

	function api.Refresh()
		if enabled and not isGameplay() then
			api.SetEnabled(false,false)
			return
		end

		if toggle then
			toggle.set(enabled)
		end

		if enabled then
			watchWorkspace()
			removeCurrent()
		else
			setStatus(isGameplay() and "" or "game only",colors.muted)
		end
	end

	function api.Destroy()
		enabled=false
		disconnectWatchers()
		restoreRemoved()
		destroyControl(toggle)
		toggle=nil
	end

	local section,sectionControls=makeSection(page,2,"Map Cleaner","",{
		headerToggle={
			startState=enabled,
			onChange=function(state)
				api.SetEnabled(state,true)
			end,
		},
		compact=true,
	})

	toggle=sectionControls and sectionControls.toggle
	if not toggle then
		toggle=buildToggleRow(section,"Map Cleaner",enabled,function(state)
			api.SetEnabled(state,true)
		end)
	end

	api.Refresh()
	return api
end

return mapCleaner
