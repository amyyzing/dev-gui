local RemoveAds={}

local function firstChild(parent)
	if not parent then return nil end
	local children=parent:GetChildren()
	return children[1]
end

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
end

function RemoveAds.new(ctx,page)
	local THEME=ctx.THEME
	local safeDisconnect=ctx.safeDisconnect
	local makeSection=ctx.makeSection
	local buildToggleRow=ctx.buildToggleRow
	local getCurrentModeKey=ctx.getCurrentModeKey or function() return "mode1" end

	local api={}
	local enabled=false
	local toggle=nil
	local statusLabel=nil
	local adsChildConn=nil
	local workspaceConn=nil
	local trackedAdsFolder=nil
	local removed={}
	local removedSet=setmetatable({}, {__mode="k"})

	local function isGameplay()
		return tostring(getCurrentModeKey() or "mode1")=="mode1"
	end

	local function getAdsFolder(ignoreMode)
		if not ignoreMode and not isGameplay() then
			return nil
		end

		local games=workspace:FindFirstChild("Games")
		local gameFolder=firstChild(games)
		local replicated=gameFolder and gameFolder:FindFirstChild("Replicated")
		local ads=replicated and replicated:FindFirstChild("Ads")

		if ads then
			return ads
		end

		return nil
	end

	local function setStatus(text,color)
		if not statusLabel then return end
		statusLabel.Text=text
		statusLabel.TextColor3=color or THEME.MUTED
	end

	local function syncToggleVisual(value)
		if not toggle then return end

		if toggle.get and toggle.get()==(value and true or false) then
			return
		end

		if toggle.set then
			toggle.set(value)
		end
	end

	local function removeInstance(inst,parent)
		if not inst or not inst:IsA("Model") or removedSet[inst] then
			return
		end

		removedSet[inst]=true
		table.insert(removed,{
			instance=inst,
			parent=parent or inst.Parent,
		})

		inst.Parent=nil
	end

	local function removeCurrentAds()
		local ads=getAdsFolder(false)
		if not ads then
			setStatus(isGameplay() and "Ads folder not found." or "Gameplay only.",THEME.MUTED)
			return
		end

		for _,child in ipairs(ads:GetChildren()) do
			removeInstance(child,ads)
		end

		setStatus("Removed "..tostring(#removed).." ad model(s).",THEME.GREEN)
	end

	local function restoreAds()
		local fallbackParent=getAdsFolder(true)

		for i=#removed,1,-1 do
			local entry=removed[i]
			local inst=entry and entry.instance
			local parent=(entry and entry.parent and entry.parent.Parent and entry.parent) or fallbackParent

			if inst and parent and inst.Parent==nil then
				inst.Parent=parent
			end

			if inst then
				removedSet[inst]=nil
			end

			table.remove(removed,i)
		end
	end

	local function disconnectWatchers()
		safeDisconnect(adsChildConn)
		safeDisconnect(workspaceConn)
		adsChildConn=nil
		workspaceConn=nil
		trackedAdsFolder=nil
	end

	local function watchAdsFolder()
		local ads=getAdsFolder(false)

		if ads~=trackedAdsFolder then
			safeDisconnect(adsChildConn)
			adsChildConn=nil
			trackedAdsFolder=ads

			if ads then
				adsChildConn=ads.ChildAdded:Connect(function(child)
					if enabled and child:IsA("Model") then
						task.defer(function()
							removeInstance(child,ads)
							setStatus("Removed "..tostring(#removed).." ad model(s).",THEME.GREEN)
						end)
					end
				end)
			end
		end

		if not workspaceConn then
			workspaceConn=workspace.DescendantAdded:Connect(function(inst)
				if not enabled then return end

				if inst.Name=="Ads" then
					task.defer(function()
						watchAdsFolder()
						removeCurrentAds()
					end)
				elseif inst:IsA("Model") and inst.Parent and inst.Parent.Name=="Ads" then
					local parent=inst.Parent
					task.defer(function()
						removeInstance(inst,parent)
						setStatus("Removed "..tostring(#removed).." ad model(s).",THEME.GREEN)
					end)
				end
			end)
		end
	end

	function api.SetEnabled(state,fire)
		enabled=state and isGameplay() or false
		syncToggleVisual(enabled)

		if enabled then
			watchAdsFolder()
			removeCurrentAds()
		else
			disconnectWatchers()
			restoreAds()
			setStatus(isGameplay() and "Ads restored." or "Gameplay only.",THEME.MUTED)
		end

		if fire~=false and ctx.onChanged then
			pcall(ctx.onChanged,enabled)
		end
	end

	function api.Refresh()
		if enabled and not isGameplay() then
			api.SetEnabled(false,false)
			return
		end

		syncToggleVisual(enabled)

		if enabled then
			watchAdsFolder()
			removeCurrentAds()
		else
			setStatus(isGameplay() and "" or "Gameplay only.",THEME.MUTED)
		end
	end

	function api.Destroy()
		enabled=false
		disconnectWatchers()
		restoreAds()
		destroyControl(toggle)
		toggle=nil
	end

	local section,sectionControls=makeSection(page,3,"Remove Ads","Gameplay only",{
		compact=true,
		headerToggle={
			startState=enabled,
			onChange=function(state)
				api.SetEnabled(state,true)
			end,
		},
	})

	toggle=sectionControls and sectionControls.toggle

	if not toggle then
		toggle=buildToggleRow(section,"Remove Ads",enabled,function(state)
			api.SetEnabled(state,true)
		end)
	end

	api.Refresh()
	return api
end

return RemoveAds
