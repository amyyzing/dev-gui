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
	local segmentCount=32
	local switch=New("Frame",{
		AnchorPoint=Vector2.new(1,0.5),
		Position=UDim2.new(1,0,0.5,0),
		Size=UDim2.fromOffset(width,height),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ZIndex=7,
	},parent)

	local ringClip=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.new(0.5,0,0.5,0),
		Size=UDim2.fromOffset(28,28),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ClipsDescendants=true,
		ZIndex=9,
	},switch)

	local fillValue=Instance.new("NumberValue")
	fillValue.Name="FillProgress"
	fillValue.Parent=switch
	fillValue.Value=startState and 1 or 0

	local fillTween=nil
	local segments={}

	for i=1,segmentCount do
		local alpha=(i-1)/segmentCount
		local degrees=-90+(alpha*360)
		local radians=math.rad(degrees)
		local radius=11.5
		local x=math.cos(radians)*radius
		local y=math.sin(radians)*radius

		-- The old version used the segment's Y position as revealStart.
		-- That made left/right segments reveal together. This uses circular order instead.
		local revealStart=alpha

		local base=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.new(0.5,x,0.5,y),
			Size=UDim2.fromOffset(2,5),
			BackgroundColor3=THEME.MUTED,
			BackgroundTransparency=0.48,
			BorderSizePixel=0,
			ClipsDescendants=true,
			Rotation=degrees+90,
			ZIndex=9,
		},ringClip)
		New("UICorner",{CornerRadius=UDim.new(1,0)},base)

		local fill=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=UDim2.new(1,0,1,0),
			BackgroundColor3=THEME.GREEN,
			BackgroundTransparency=1,
			BorderSizePixel=0,
			ZIndex=10,
		},base)
		New("UICorner",{CornerRadius=UDim.new(1,0)},fill)

		segments[i]={base=base,fill=fill,revealStart=revealStart}
	end

	local hit=New("TextButton",{
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Text="",
		AutoButtonColor=false,
		Size=UDim2.new(1,0,1,0),
		ZIndex=12,
	},switch)

	local state=startState and true or false

	local function updateSegments(progress)
		progress=math.clamp(tonumber(progress) or 0,0,1)

		-- A small feather keeps each segment from popping in too harshly.
		local revealBand=1/segmentCount

		for _,segment in ipairs(segments) do
			local visible=math.clamp((progress-segment.revealStart)/revealBand,0,1)
			segment.fill.BackgroundTransparency=1-(visible*0.94)
			segment.base.BackgroundTransparency=state and 0.62 or 0.48
		end
	end

	local function paint(animate)
		local accent=THEME.GREEN
		local off=THEME.MUTED
		local target=state and 1 or 0

		if fillTween then
			fillTween:Cancel()
			fillTween=nil
		end

		for _,segment in ipairs(segments) do
			segment.base.BackgroundColor3=off
			segment.fill.BackgroundColor3=accent
		end

		if not animate then
			fillValue.Value=target
			updateSegments(target)
			return
		end

		local duration=state and 0.44 or 0.34
		local direction=state and Enum.EasingDirection.Out or Enum.EasingDirection.InOut

		fillTween=TweenService:Create(
			fillValue,
			TweenInfo.new(duration,Enum.EasingStyle.Quad,direction),
			{Value=target}
		)
		fillTween:Play()
	end

	local fillChangedConn=fillValue.Changed:Connect(updateSegments)

	local function setState(value,fire,animate,force)
		local nextState=value and true or false
		local changed=nextState~=state

		-- Avoid repainting when the value is already correct.
		-- This prevents api.SetEnabled -> toggle.set from cancelling the click animation.
		if not changed and not force then
			return
		end

		state=nextState
		paint((animate~=false) and changed)

		if fire and changed and onChange then
			onChange(state)
		end
	end

	hit.MouseButton1Click:Connect(function()
		setState(not state,true,true)
	end)

	paint(false)

	return{
		set=function(value)
			setState(value,false,true)
		end,
		get=function()
			return state
		end,
		destroy=function()
			if fillTween then
				fillTween:Cancel()
				fillTween=nil
			end
			safeDisconnect(fillChangedConn)
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
