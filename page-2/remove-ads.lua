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

	local outerGlow=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.new(0.5,0,0.5,0),
		Size=UDim2.fromOffset(30,30),
		BackgroundColor3=THEME.GREEN,
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ZIndex=6,
	},switch)
	New("UICorner",{CornerRadius=UDim.new(1,0)},outerGlow)

	local halo=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.new(0.5,0,0.5,0),
		Size=UDim2.fromOffset(31,31),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ZIndex=8,
	},switch)
	New("UICorner",{CornerRadius=UDim.new(1,0)},halo)
	local haloStroke=New("UIStroke",{
		Color=THEME.GREEN,
		Thickness=1.4,
		Transparency=1,
	},halo)

	local glow=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.new(0.5,0,0.5,0),
		Size=UDim2.fromOffset(20,20),
		BackgroundColor3=THEME.GREEN,
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ZIndex=7,
	},switch)
	New("UICorner",{CornerRadius=UDim.new(1,0)},glow)

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
		local degrees=-88+((i-1)/segmentCount)*360
		local radians=math.rad(degrees)
		local radius=11.5
		local x=math.cos(radians)*radius
		local y=math.sin(radians)*radius

		local base=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.new(0.5,x,0.5,y),
			Size=UDim2.fromOffset(2,5),
			BackgroundColor3=THEME.MUTED,
			BackgroundTransparency=0.48,
			BorderSizePixel=0,
			Rotation=degrees+90,
			ZIndex=9,
		},ringClip)
		New("UICorner",{CornerRadius=UDim.new(1,0)},base)

		local fill=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.new(0.5,x,0.5,y),
			Size=UDim2.fromOffset(2,4),
			BackgroundColor3=THEME.GREEN,
			BackgroundTransparency=1,
			BorderSizePixel=0,
			Rotation=degrees+90,
			ZIndex=10,
		},ringClip)
		New("UICorner",{CornerRadius=UDim.new(1,0)},fill)

		segments[i]={base=base,fill=fill}
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
		local scaled=progress*segmentCount

		for i,segment in ipairs(segments) do
			local visible=math.clamp(scaled-(i-1),0,1)
			segment.fill.BackgroundTransparency=1-(visible*0.94)
			segment.base.BackgroundTransparency=state and 0.62 or 0.48
		end
	end

	local function tween(obj,duration,props,style,direction)
		if obj and obj.Parent then
			TweenService:Create(obj,TweenInfo.new(duration,style or Enum.EasingStyle.Quad,direction or Enum.EasingDirection.Out),props):Play()
		end
	end

	local function paint(animate)
		local accent=THEME.GREEN
		local off=THEME.MUTED

		if fillTween then
			fillTween:Cancel()
			fillTween=nil
		end

		if state then
			if not animate then
				fillValue.Value=1
			end
			glow.BackgroundTransparency=animate and 1 or 0.84
			glow.Size=UDim2.fromOffset(20,20)
			outerGlow.BackgroundTransparency=animate and 1 or 0.93
			outerGlow.Size=UDim2.fromOffset(30,30)
			haloStroke.Transparency=animate and 1 or 0.48
			haloStroke.Thickness=animate and 1.4 or 2

			for _,segment in ipairs(segments) do
				segment.base.BackgroundColor3=off
				segment.fill.BackgroundColor3=accent
			end

			fillTween=TweenService:Create(fillValue,TweenInfo.new(0.44,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Value=1})
			fillTween:Play()
			tween(glow,0.24,{BackgroundTransparency=0.84,Size=UDim2.fromOffset(38,38)})
			tween(outerGlow,0.28,{BackgroundTransparency=0.9,Size=UDim2.fromOffset(44,44)})
			tween(haloStroke,0.22,{Transparency=0.34,Thickness=2.4})
		else
			if not animate then
				fillValue.Value=0
			end
			for _,segment in ipairs(segments) do
				segment.base.BackgroundColor3=off
			end

			fillTween=TweenService:Create(fillValue,TweenInfo.new(0.34,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{Value=0})
			fillTween:Play()
			tween(glow,0.18,{BackgroundTransparency=1,Size=UDim2.fromOffset(20,20)})
			tween(outerGlow,0.2,{BackgroundTransparency=1,Size=UDim2.fromOffset(30,30)})
			tween(haloStroke,0.16,{Transparency=1,Thickness=1.4})
		end

		updateSegments(fillValue.Value)
	end

	fillValue.Changed:Connect(updateSegments)

	local function setState(value,fire,animate)
		local nextState=value and true or false
		local changed=nextState~=state
		state=nextState
		paint(animate and changed)

		if fire and onChange then
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

		if toggle then
			toggle.set(enabled)
		end

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

		if toggle then
			toggle.set(enabled)
		end

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
