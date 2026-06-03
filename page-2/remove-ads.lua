local RemoveAds={}
local TweenService=game:GetService("TweenService")

local function safeDisconnect(conn)
	if conn and typeof(conn)=="RBXScriptConnection" then
		pcall(function()
			conn:Disconnect()
		end)
	end
end

local function firstChild(parent)
	if not parent then return nil end
	local children=parent:GetChildren()
	return children[1]
end

local function createPowerSwitch(New,THEME,parent,startState,onChange)
	local width,height=34,34
	local minimizedSize=16
	local expandedSize=23
	local switch=New("Frame",{
		AnchorPoint=Vector2.new(1,0.5),
		Position=UDim2.new(1,0,0.5,0),
		Size=UDim2.fromOffset(width,height),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ZIndex=7,
	},parent)

	local holder=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.fromOffset(28,28),
		BackgroundColor3=THEME.MUTED,
		BackgroundTransparency=0.9,
		BorderSizePixel=0,
		ZIndex=8,
	},switch)
	New("UICorner",{CornerRadius=UDim.new(0,5)},holder)

	local holderStroke=New("UIStroke",{
		Color=THEME.MUTED,
		Thickness=1,
		Transparency=0.62,
	},holder)

	local glow=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.fromOffset(startState and 30 or 18,startState and 30 or 18),
		BackgroundColor3=THEME.GREEN,
		BackgroundTransparency=startState and 0.84 or 1,
		BorderSizePixel=0,
		Rotation=startState and 45 or 0,
		ZIndex=9,
	},holder)
	New("UICorner",{CornerRadius=UDim.new(0,4)},glow)

	local square=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.fromOffset(startState and expandedSize or minimizedSize,startState and expandedSize or minimizedSize),
		BackgroundColor3=startState and THEME.GREEN or THEME.MUTED,
		BackgroundTransparency=startState and 0 or 0.34,
		BorderSizePixel=0,
		Rotation=startState and 45 or 0,
		ZIndex=10,
	},holder)
	New("UICorner",{CornerRadius=UDim.new(0,3)},square)

	local squareStroke=New("UIStroke",{
		Color=startState and THEME.GREEN or THEME.MUTED,
		Thickness=1,
		Transparency=startState and 0.05 or 0.36,
	},square)

	local hit=New("TextButton",{
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Text="",
		AutoButtonColor=false,
		Size=UDim2.new(1,0,1,0),
		ZIndex=12,
	},switch)

	local state=startState and true or false
	local activeTweens={}
	local clickConn=nil

	local function cancelTweens()
		for _,tw in ipairs(activeTweens) do
			pcall(function()
				tw:Cancel()
			end)
		end
		table.clear(activeTweens)
	end

	local function playTween(object,info,goal)
		local tw=TweenService:Create(object,info,goal)
		table.insert(activeTweens,tw)
		tw:Play()
		return tw
	end

	local function applyVisuals(animate)
		cancelTweens()

		local expanded=state
		local targetSize=expanded and expandedSize or minimizedSize
		local targetRotation=expanded and 45 or 0
		local targetColor=expanded and THEME.GREEN or THEME.MUTED
		local targetSquareTransparency=expanded and 0 or 0.34
		local targetGlowTransparency=expanded and 0.84 or 1
		local targetGlowSize=expanded and 30 or 18
		local targetHolderTransparency=expanded and 0.84 or 0.9
		local targetStrokeTransparency=expanded and 0.26 or 0.62
		local targetSquareStrokeTransparency=expanded and 0.05 or 0.36

		if not animate then
			square.Size=UDim2.fromOffset(targetSize,targetSize)
			square.Rotation=targetRotation
			square.BackgroundColor3=targetColor
			square.BackgroundTransparency=targetSquareTransparency
			squareStroke.Color=targetColor
			squareStroke.Transparency=targetSquareStrokeTransparency
			glow.Size=UDim2.fromOffset(targetGlowSize,targetGlowSize)
			glow.Rotation=targetRotation
			glow.BackgroundTransparency=targetGlowTransparency
			holder.BackgroundColor3=targetColor
			holder.BackgroundTransparency=targetHolderTransparency
			holderStroke.Color=targetColor
			holderStroke.Transparency=targetStrokeTransparency
			return
		end

		local info=expanded
			and TweenInfo.new(0.28,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
			or TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
		local softInfo=TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

		playTween(square,info,{
			Size=UDim2.fromOffset(targetSize,targetSize),
			Rotation=targetRotation,
			BackgroundColor3=targetColor,
			BackgroundTransparency=targetSquareTransparency,
		})

		playTween(squareStroke,softInfo,{
			Color=targetColor,
			Transparency=targetSquareStrokeTransparency,
		})

		playTween(glow,info,{
			Size=UDim2.fromOffset(targetGlowSize,targetGlowSize),
			Rotation=targetRotation,
			BackgroundTransparency=targetGlowTransparency,
		})

		playTween(holder,softInfo,{
			BackgroundColor3=targetColor,
			BackgroundTransparency=targetHolderTransparency,
		})

		playTween(holderStroke,softInfo,{
			Color=targetColor,
			Transparency=targetStrokeTransparency,
		})
	end

	local function setState(value,fire,animate,force)
		local nextState=value and true or false
		local changed=nextState~=state

		-- Avoid repainting when the value is already correct.
		-- This prevents api.SetEnabled -> toggle.set from cancelling the click animation.
		if not changed and not force then
			return
		end

		state=nextState
		applyVisuals((animate~=false) and changed)

		if fire and changed and onChange then
			onChange(state)
		end
	end

	clickConn=hit.MouseButton1Click:Connect(function()
		setState(not state,true,true)
	end)

	applyVisuals(false)

	return{
		set=function(value)
			setState(value,false,true)
		end,
		get=function()
			return state
		end,
		destroy=function()
			cancelTweens()
			safeDisconnect(clickConn)
			if switch then
				switch:Destroy()
			end
		end,
		wrap=switch,
		width=width,
		height=height,
	}
end

function RemoveAds.new(ctx,page)
	local New=ctx.New
	local THEME=ctx.THEME
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
		if toggle and toggle.destroy then
			toggle.destroy()
		end
		toggle=nil
	end

	local function findHeader(section)
		if not section then return nil end

		for _,child in ipairs(section:GetChildren()) do
			if child:IsA("Frame") and child.LayoutOrder==1 then
				return child
			end
		end

		return nil
	end

	local function reserveHeaderSpace(header,width)
		if not header then return end

		for _,child in ipairs(header:GetChildren()) do
			if child:IsA("TextButton") and tostring(child.Text or "")~="" then
				child.Size=UDim2.new(1,-width,1,0)
				return
			end
		end
	end

	local section,sectionControls=makeSection(page,3,"Remove Ads","Gameplay only",{
		compact=true,
	})

	local header=findHeader(sectionControls and sectionControls.section or section)
	if header then
		toggle=createPowerSwitch(New,THEME,header,enabled,function(state)
			api.SetEnabled(state,true)
		end)
		reserveHeaderSpace(header,(toggle.width or 52)+10)
	end

	if not toggle then
		toggle=buildToggleRow(section,"Remove Ads",enabled,function(state)
			api.SetEnabled(state,true)
		end)
	end

	api.Refresh()
	return api
end

return RemoveAds
