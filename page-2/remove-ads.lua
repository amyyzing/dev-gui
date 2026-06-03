local RemoveAds={}
local TweenService=game:GetService("TweenService")
local RunService=game:GetService("RunService")

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
	-- Category-wide visual toggle.
	-- The full rail spans the header, while the clickable hitbox stays on the right side
	-- so the left title/description area can still be used by the category expander.
	local reservedWidth=142
	local indicatorBoxSize=46
	local outerCoreSize=28
	local innerOffSize=12
	local categoryExpandedScale=1.14
	local categoryCollapsedScale=1
	local strokeThickness=2
	local glowNearThickness=4
	local glowFarThickness=7

	local accent=THEME.GREEN or Color3.fromRGB(74,208,128)
	local muted=THEME.MUTED or Color3.fromRGB(150,150,160)
	local white=THEME.WHITE or THEME.TEXT or Color3.fromRGB(245,245,245)
	local dark=THEME.BACKGROUND or THEME.DARK or Color3.fromRGB(12,14,18)
	local railOff=muted:Lerp(dark,0.42)
	local inactiveFill=muted:Lerp(dark,0.18)
	local outerInactive=muted:Lerp(white,0.30)
	local shadowColor=accent:Lerp(dark,0.18)

	local switch=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.new(1,-8,1,-2),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ClipsDescendants=false,
		ZIndex=7,
	},parent)

	local wideScale=New("UIScale",{
		Scale=1,
	},switch)

	local halo=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.new(1,-2,1,-4),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ZIndex=7,
	},switch)

	local haloStroke=New("UIStroke",{
		Color=accent,
		Thickness=1,
		Transparency=startState and 0.76 or 1,
		LineJoinMode=Enum.LineJoinMode.Miter,
	},halo)

	local haloGradient=New("UIGradient",{
		Rotation=0,
		Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,accent),
			ColorSequenceKeypoint.new(0.45,white),
			ColorSequenceKeypoint.new(1,accent),
		}),
		Transparency=NumberSequence.new({
			NumberSequenceKeypoint.new(0,0.95),
			NumberSequenceKeypoint.new(0.55,0.28),
			NumberSequenceKeypoint.new(1,0.95),
		}),
	},haloStroke)

	local railRoot=New("Frame",{
		AnchorPoint=Vector2.new(0,0.5),
		Position=UDim2.new(0,12,0.5,0),
		Size=UDim2.new(1,-reservedWidth,1,-12),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ClipsDescendants=false,
		ZIndex=8,
	},switch)

	local railScale=New("UIScale",{
		Scale=1,
	},railRoot)

	local railBase=New("Frame",{
		AnchorPoint=Vector2.new(0,0.5),
		Position=UDim2.fromScale(0,0.5),
		Size=UDim2.new(1,0,0,2),
		BackgroundColor3=railOff,
		BackgroundTransparency=0.42,
		BorderSizePixel=0,
		ZIndex=8,
	},railRoot)

	local railActiveClip=New("Frame",{
		AnchorPoint=Vector2.new(0,0.5),
		Position=UDim2.fromScale(0,0.5),
		Size=startState and UDim2.new(1,0,0,3) or UDim2.new(0,0,0,3),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ClipsDescendants=true,
		ZIndex=9,
	},railRoot)

	local railActive=New("Frame",{
		AnchorPoint=Vector2.new(0,0.5),
		Position=UDim2.fromScale(0,0.5),
		Size=UDim2.new(1,0,1,0),
		BackgroundColor3=accent,
		BackgroundTransparency=startState and 0.04 or 1,
		BorderSizePixel=0,
		ZIndex=9,
	},railActiveClip)

	local railGradient=New("UIGradient",{
		Rotation=0,
		Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,accent),
			ColorSequenceKeypoint.new(0.55,white),
			ColorSequenceKeypoint.new(1,accent),
		}),
	},railActive)

	local ticks={}
	for i,alpha in ipairs({0.18,0.38,0.58,0.78}) do
		local tick=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(alpha,0.5),
			Size=UDim2.fromOffset(2,8),
			BackgroundColor3=startState and accent or railOff,
			BackgroundTransparency=startState and 0.18 or 0.72,
			BorderSizePixel=0,
			ZIndex=10,
		},railRoot)
		table.insert(ticks,tick)
	end

	local indicator=New("Frame",{
		AnchorPoint=Vector2.new(1,0.5),
		Position=UDim2.new(1,-8,0.5,0),
		Size=UDim2.fromOffset(indicatorBoxSize,indicatorBoxSize),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ClipsDescendants=false,
		ZIndex=12,
	},switch)

	New("UIAspectRatioConstraint",{
		AspectRatio=1,
	},indicator)

	New("UISizeConstraint",{
		MinSize=Vector2.new(34,34),
		MaxSize=Vector2.new(indicatorBoxSize,indicatorBoxSize),
	},indicator)

	local indicatorScale=New("UIScale",{
		Scale=categoryExpandedScale,
	},indicator)

	local glowFar=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.fromOffset(startState and outerCoreSize or innerOffSize,startState and outerCoreSize or innerOffSize),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Rotation=startState and 45 or 0,
		ZIndex=12,
	},indicator)

	New("UIAspectRatioConstraint",{AspectRatio=1},glowFar)
	New("UISizeConstraint",{
		MinSize=Vector2.new(innerOffSize,innerOffSize),
		MaxSize=Vector2.new(outerCoreSize,outerCoreSize),
	},glowFar)

	local glowFarStroke=New("UIStroke",{
		Color=shadowColor,
		Thickness=glowFarThickness,
		Transparency=startState and 0.78 or 1,
		LineJoinMode=Enum.LineJoinMode.Miter,
	},glowFar)

	local glowFarGradient=New("UIGradient",{
		Rotation=0,
		Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,accent),
			ColorSequenceKeypoint.new(0.52,white),
			ColorSequenceKeypoint.new(1,accent),
		}),
		Transparency=NumberSequence.new({
			NumberSequenceKeypoint.new(0,0.88),
			NumberSequenceKeypoint.new(0.5,0.12),
			NumberSequenceKeypoint.new(1,0.88),
		}),
	},glowFarStroke)

	local glowNear=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.fromOffset(startState and outerCoreSize or innerOffSize,startState and outerCoreSize or innerOffSize),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Rotation=startState and 45 or 0,
		ZIndex=13,
	},indicator)

	New("UIAspectRatioConstraint",{AspectRatio=1},glowNear)
	New("UISizeConstraint",{
		MinSize=Vector2.new(innerOffSize,innerOffSize),
		MaxSize=Vector2.new(outerCoreSize,outerCoreSize),
	},glowNear)

	local glowNearStroke=New("UIStroke",{
		Color=accent,
		Thickness=glowNearThickness,
		Transparency=startState and 0.55 or 1,
		LineJoinMode=Enum.LineJoinMode.Miter,
	},glowNear)

	local glowNearGradient=New("UIGradient",{
		Rotation=180,
		Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,accent),
			ColorSequenceKeypoint.new(0.58,white),
			ColorSequenceKeypoint.new(1,accent),
		}),
		Transparency=NumberSequence.new({
			NumberSequenceKeypoint.new(0,0.72),
			NumberSequenceKeypoint.new(0.52,0.05),
			NumberSequenceKeypoint.new(1,0.72),
		}),
	},glowNearStroke)

	local outerCore=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.fromOffset(outerCoreSize,outerCoreSize),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Rotation=0,
		ZIndex=14,
	},indicator)

	New("UIAspectRatioConstraint",{AspectRatio=1},outerCore)
	New("UISizeConstraint",{
		MinSize=Vector2.new(outerCoreSize,outerCoreSize),
		MaxSize=Vector2.new(outerCoreSize,outerCoreSize),
	},outerCore)

	local outerStroke=New("UIStroke",{
		Color=startState and white or outerInactive,
		Thickness=strokeThickness,
		Transparency=startState and 0.02 or 0.18,
		LineJoinMode=Enum.LineJoinMode.Miter,
	},outerCore)

	local innerSquare=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.fromOffset(startState and outerCoreSize or innerOffSize,startState and outerCoreSize or innerOffSize),
		BackgroundColor3=startState and accent or inactiveFill,
		BackgroundTransparency=startState and 1 or 0.03,
		BorderSizePixel=0,
		Rotation=startState and 45 or 0,
		ZIndex=15,
	},indicator)

	New("UIAspectRatioConstraint",{AspectRatio=1},innerSquare)
	New("UISizeConstraint",{
		MinSize=Vector2.new(innerOffSize,innerOffSize),
		MaxSize=Vector2.new(outerCoreSize,outerCoreSize),
	},innerSquare)

	local innerStroke=New("UIStroke",{
		Color=startState and accent or muted,
		Thickness=strokeThickness,
		Transparency=startState and 0.01 or 1,
		LineJoinMode=Enum.LineJoinMode.Miter,
	},innerSquare)

	local innerStrokeGradient=New("UIGradient",{
		Rotation=0,
		Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,accent),
			ColorSequenceKeypoint.new(0.72,accent),
			ColorSequenceKeypoint.new(1,white),
		}),
	},innerStroke)

	local hit=New("TextButton",{
		AnchorPoint=Vector2.new(1,0.5),
		Position=UDim2.new(1,0,0.5,0),
		Size=UDim2.new(0,reservedWidth,1,0),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Text="",
		AutoButtonColor=false,
		ZIndex=30,
	},switch)

	local state=startState and true or false
	local categoryExpanded=true
	local activeTweens={}
	local clickConn=nil
	local glowConn=nil
	local hoverConnA=nil
	local hoverConnB=nil
	local hovering=false
	local glowRotation=0

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

		local expanded=categoryExpanded
		local scale=expanded and categoryExpandedScale or categoryCollapsedScale
		local railScaleTarget=expanded and 1.02 or 1
		local targetInnerSize=state and outerCoreSize or innerOffSize
		local targetInnerRotation=state and 45 or 0
		local targetInnerColor=state and accent or inactiveFill
		local targetOuterColor=state and white or outerInactive
		local targetFillTransparency=state and 1 or 0.03
		local targetInnerStrokeTransparency=state and 0.01 or 1
		local targetOuterStrokeTransparency=state and 0.02 or 0.18
		local targetGlowNearTransparency=state and 0.55 or 1
		local targetGlowFarTransparency=state and 0.78 or 1
		local targetHaloTransparency=state and (hovering and 0.64 or 0.76) or (hovering and 0.88 or 1)
		local railActiveSize=state and UDim2.new(1,0,0,3) or UDim2.new(0,0,0,3)
		local railActiveTransparency=state and 0.04 or 1
		local railBaseTransparency=state and 0.22 or 0.42
		local railBaseColor=state and accent:Lerp(dark,0.55) or railOff
		local tickColor=state and accent or railOff
		local tickTransparency=state and 0.18 or 0.72

		glowFarGradient.Enabled=state
		glowNearGradient.Enabled=state
		innerStrokeGradient.Enabled=state
		railGradient.Enabled=state
		haloGradient.Enabled=state or hovering

		if not animate then
			wideScale.Scale=1
			railScale.Scale=railScaleTarget
			indicatorScale.Scale=scale
			haloStroke.Transparency=targetHaloTransparency
			railBase.BackgroundColor3=railBaseColor
			railBase.BackgroundTransparency=railBaseTransparency
			railActiveClip.Size=railActiveSize
			railActive.BackgroundTransparency=railActiveTransparency
			for _,tick in ipairs(ticks) do
				tick.BackgroundColor3=tickColor
				tick.BackgroundTransparency=tickTransparency
			end
			outerStroke.Color=targetOuterColor
			outerStroke.Transparency=targetOuterStrokeTransparency
			glowFar.Size=UDim2.fromOffset(targetInnerSize,targetInnerSize)
			glowFar.Rotation=targetInnerRotation
			glowFarStroke.Transparency=targetGlowFarTransparency
			glowNear.Size=UDim2.fromOffset(targetInnerSize,targetInnerSize)
			glowNear.Rotation=targetInnerRotation
			glowNearStroke.Transparency=targetGlowNearTransparency
			innerSquare.Size=UDim2.fromOffset(targetInnerSize,targetInnerSize)
			innerSquare.Rotation=targetInnerRotation
			innerSquare.BackgroundColor3=targetInnerColor
			innerSquare.BackgroundTransparency=targetFillTransparency
			innerStroke.Color=accent
			innerStroke.Transparency=targetInnerStrokeTransparency
			return
		end

		local toggleInfo=state
			and TweenInfo.new(0.34,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
			or TweenInfo.new(0.24,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
		local scaleInfo=TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		local softInfo=TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

		playTween(railScale,scaleInfo,{Scale=railScaleTarget})
		playTween(indicatorScale,scaleInfo,{Scale=scale})
		playTween(haloStroke,softInfo,{Transparency=targetHaloTransparency})
		playTween(railBase,softInfo,{
			BackgroundColor3=railBaseColor,
			BackgroundTransparency=railBaseTransparency,
		})
		playTween(railActiveClip,toggleInfo,{Size=railActiveSize})
		playTween(railActive,softInfo,{BackgroundTransparency=railActiveTransparency})

		for _,tick in ipairs(ticks) do
			playTween(tick,softInfo,{
				BackgroundColor3=tickColor,
				BackgroundTransparency=tickTransparency,
			})
		end

		playTween(outerStroke,softInfo,{
			Color=targetOuterColor,
			Transparency=targetOuterStrokeTransparency,
		})

		playTween(glowFar,toggleInfo,{
			Size=UDim2.fromOffset(targetInnerSize,targetInnerSize),
			Rotation=targetInnerRotation,
		})
		playTween(glowNear,toggleInfo,{
			Size=UDim2.fromOffset(targetInnerSize,targetInnerSize),
			Rotation=targetInnerRotation,
		})
		playTween(glowFarStroke,softInfo,{Transparency=targetGlowFarTransparency})
		playTween(glowNearStroke,softInfo,{Transparency=targetGlowNearTransparency})

		playTween(innerSquare,toggleInfo,{
			Size=UDim2.fromOffset(targetInnerSize,targetInnerSize),
			Rotation=targetInnerRotation,
			BackgroundColor3=targetInnerColor,
			BackgroundTransparency=targetFillTransparency,
		})
		playTween(innerStroke,softInfo,{
			Color=accent,
			Transparency=targetInnerStrokeTransparency,
		})
	end

	local function setState(value,fire,animate,force)
		local nextState=value and true or false
		local changed=nextState~=state

		if not changed and not force then
			return
		end

		state=nextState
		applyVisuals((animate~=false) and changed)

		if fire and changed and onChange then
			onChange(state)
		end
	end

	local function setCategoryExpanded(value,animate)
		local nextExpanded=value and true or false
		if nextExpanded==categoryExpanded then
			return
		end

		categoryExpanded=nextExpanded
		applyVisuals(animate~=false)
	end

	clickConn=hit.MouseButton1Click:Connect(function()
		setState(not state,true,true)
	end)

	hoverConnA=hit.MouseEnter:Connect(function()
		hovering=true
		applyVisuals(true)
	end)

	hoverConnB=hit.MouseLeave:Connect(function()
		hovering=false
		applyVisuals(true)
	end)

	glowConn=RunService.RenderStepped:Connect(function(dt)
		if not switch or not switch.Parent then return end

		if state then
			glowRotation=(glowRotation+(dt*92))%360
			glowFarGradient.Rotation=glowRotation
			glowNearGradient.Rotation=(360-glowRotation)%360
			innerStrokeGradient.Rotation=(glowRotation*0.75)%360
			railGradient.Offset=Vector2.new(math.sin(os.clock()*2.4)*0.18,0)
			haloGradient.Rotation=(glowRotation*0.55)%360
		elseif hovering then
			glowRotation=(glowRotation+(dt*34))%360
			haloGradient.Rotation=(glowRotation*0.45)%360
		end
	end)

	applyVisuals(false)

	return{
		set=function(value)
			setState(value,false,true)
		end,
		get=function()
			return state
		end,
		setExpanded=function(value,animate)
			setCategoryExpanded(value,animate)
		end,
		getExpanded=function()
			return categoryExpanded
		end,
		destroy=function()
			cancelTweens()
			safeDisconnect(clickConn)
			safeDisconnect(hoverConnA)
			safeDisconnect(hoverConnB)
			safeDisconnect(glowConn)
			if switch then
				switch:Destroy()
			end
		end,
		wrap=switch,
		width=reservedWidth,
		height=indicatorBoxSize,
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
	local categoryConns={}

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

	local function disconnectCategoryWatchers()
		for _,conn in ipairs(categoryConns) do
			safeDisconnect(conn)
		end
		table.clear(categoryConns)
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

	local function findHeaderButton(header)
		if not header then return nil end

		for _,child in ipairs(header:GetChildren()) do
			if child:IsA("TextButton") and tostring(child.Text or "")~="" then
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

	local function readHeaderExpanded(headerButton)
		if not headerButton then return nil end
		local text=tostring(headerButton.Text or "")

		if text:match("^%s*%[%-%]") then
			return true
		end

		if text:match("^%s*%[%+%]") then
			return false
		end

		return nil
	end

	local function readControlsExpanded(controls)
		if type(controls)~="table" then
			return nil
		end

		for _,key in ipairs({"expanded","Expanded","isExpanded","IsExpanded","open","Open"}) do
			local value=controls[key]

			if type(value)=="boolean" then
				return value
			end

			if type(value)=="function" then
				local ok,result=pcall(value)
				if ok and type(result)=="boolean" then
					return result
				end
			end

			if typeof(value)=="Instance" and value:IsA("BoolValue") then
				return value.Value
			end
		end

		for _,key in ipairs({"content","Content","body","Body","container","Container","holder","Holder"}) do
			local value=controls[key]
			if typeof(value)=="Instance" and value:IsA("GuiObject") then
				return value.Visible
			end
		end

		return nil
	end

	local function readCategoryExpanded(headerButton,controls)
		if ctx.getCategoryExpanded then
			local ok,result=pcall(ctx.getCategoryExpanded)
			if ok and type(result)=="boolean" then
				return result
			end
		end

		if ctx.isCategoryExpanded~=nil then
			if type(ctx.isCategoryExpanded)=="function" then
				local ok,result=pcall(ctx.isCategoryExpanded)
				if ok and type(result)=="boolean" then
					return result
				end
			elseif type(ctx.isCategoryExpanded)=="boolean" then
				return ctx.isCategoryExpanded
			end
		end

		local fromControls=readControlsExpanded(controls)
		if fromControls~=nil then
			return fromControls
		end

		local fromHeader=readHeaderExpanded(headerButton)
		if fromHeader~=nil then
			return fromHeader
		end

		return true
	end

	local function bindCategoryExpansion(headerButton,controls)
		if not toggle or not toggle.setExpanded then
			return
		end

		local function sync(animate)
			if toggle and toggle.setExpanded then
				toggle.setExpanded(readCategoryExpanded(headerButton,controls),animate~=false)
			end
		end

		sync(false)

		if headerButton then
			table.insert(categoryConns,headerButton:GetPropertyChangedSignal("Text"):Connect(function()
				sync(true)
			end))

			table.insert(categoryConns,headerButton.MouseButton1Click:Connect(function()
				task.defer(function()
					sync(true)
				end)
			end))
		end

		if type(controls)=="table" then
			for _,key in ipairs({"expanded","Expanded","isExpanded","IsExpanded","open","Open"}) do
				local value=controls[key]
				if typeof(value)=="Instance" and value:IsA("BoolValue") then
					table.insert(categoryConns,value.Changed:Connect(function()
						sync(true)
					end))
				end
			end

			for _,key in ipairs({"content","Content","body","Body","container","Container","holder","Holder"}) do
				local value=controls[key]
				if typeof(value)=="Instance" and value:IsA("GuiObject") then
					table.insert(categoryConns,value:GetPropertyChangedSignal("Visible"):Connect(function()
						sync(true)
					end))
				end
			end
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

	function api.SetCategoryExpanded(expanded,animate)
		if toggle and toggle.setExpanded then
			toggle.setExpanded(expanded,animate~=false)
		end
	end

	function api.Destroy()
		enabled=false
		disconnectCategoryWatchers()
		disconnectWatchers()
		restoreAds()

		if toggle and toggle.destroy then
			toggle.destroy()
		end

		toggle=nil
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

		local headerButton=findHeaderButton(header)
		bindCategoryExpansion(headerButton,sectionControls)
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
