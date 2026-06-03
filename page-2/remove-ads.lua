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
	local switchBaseSize=34
	local switchExpandedSize=44
	local categoryExpandedScale=1.22
	local holderSize=32
	local outerCoreSize=24
	local innerOffSize=10
	local strokeThickness=2
	local glowNearThickness=4
	local glowFarThickness=7

	local accent=THEME.GREEN or Color3.fromRGB(74,208,128)
	local muted=THEME.MUTED or Color3.fromRGB(150,150,160)
	local white=THEME.WHITE or THEME.TEXT or Color3.fromRGB(245,245,245)
	local dark=THEME.BACKGROUND or THEME.DARK or Color3.fromRGB(12,14,18)
	local inactiveFill=muted:Lerp(dark,0.18)
	local outerInactive=muted:Lerp(white,0.28)

	local switch=New("Frame",{
		AnchorPoint=Vector2.new(1,0.5),
		Position=UDim2.new(1,0,0.5,0),
		Size=UDim2.fromOffset(switchExpandedSize,switchExpandedSize),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ClipsDescendants=false,
		ZIndex=7,
	},parent)

	New("UIAspectRatioConstraint",{
		AspectRatio=1,
	},switch)

	New("UISizeConstraint",{
		MinSize=Vector2.new(switchBaseSize,switchBaseSize),
		MaxSize=Vector2.new(switchExpandedSize,switchExpandedSize),
	},switch)

	local holder=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.fromOffset(holderSize,holderSize),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ClipsDescendants=false,
		ZIndex=8,
	},switch)

	New("UIAspectRatioConstraint",{
		AspectRatio=1,
	},holder)

	local holderScale=New("UIScale",{
		Scale=categoryExpandedScale,
	},holder)

	local outerCore=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.fromOffset(outerCoreSize,outerCoreSize),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Rotation=0,
		ZIndex=9,
	},holder)

	New("UICorner",{
		CornerRadius=UDim.new(0,2),
	},outerCore)

	New("UIAspectRatioConstraint",{
		AspectRatio=1,
	},outerCore)

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

	local innerGlowFar=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.fromOffset(startState and outerCoreSize or innerOffSize,startState and outerCoreSize or innerOffSize),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Rotation=startState and 45 or 0,
		ZIndex=10,
	},holder)

	New("UICorner",{
		CornerRadius=UDim.new(0,2),
	},innerGlowFar)

	New("UIAspectRatioConstraint",{
		AspectRatio=1,
	},innerGlowFar)

	New("UISizeConstraint",{
		MinSize=Vector2.new(innerOffSize,innerOffSize),
		MaxSize=Vector2.new(outerCoreSize,outerCoreSize),
	},innerGlowFar)

	local innerGlowFarStroke=New("UIStroke",{
		Color=accent,
		Thickness=glowFarThickness,
		Transparency=startState and 0.78 or 1,
		LineJoinMode=Enum.LineJoinMode.Miter,
	},innerGlowFar)

	local innerGlowFarGradient=New("UIGradient",{
		Rotation=0,
		Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,accent),
			ColorSequenceKeypoint.new(0.5,white),
			ColorSequenceKeypoint.new(1,accent),
		}),
		Transparency=NumberSequence.new({
			NumberSequenceKeypoint.new(0,0.86),
			NumberSequenceKeypoint.new(0.5,0.14),
			NumberSequenceKeypoint.new(1,0.86),
		}),
	},innerGlowFarStroke)

	local innerGlowNear=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.fromOffset(startState and outerCoreSize or innerOffSize,startState and outerCoreSize or innerOffSize),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Rotation=startState and 45 or 0,
		ZIndex=11,
	},holder)

	New("UICorner",{
		CornerRadius=UDim.new(0,2),
	},innerGlowNear)

	New("UIAspectRatioConstraint",{
		AspectRatio=1,
	},innerGlowNear)

	New("UISizeConstraint",{
		MinSize=Vector2.new(innerOffSize,innerOffSize),
		MaxSize=Vector2.new(outerCoreSize,outerCoreSize),
	},innerGlowNear)

	local innerGlowNearStroke=New("UIStroke",{
		Color=accent,
		Thickness=glowNearThickness,
		Transparency=startState and 0.58 or 1,
		LineJoinMode=Enum.LineJoinMode.Miter,
	},innerGlowNear)

	local innerGlowNearGradient=New("UIGradient",{
		Rotation=180,
		Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,accent),
			ColorSequenceKeypoint.new(0.6,white),
			ColorSequenceKeypoint.new(1,accent),
		}),
		Transparency=NumberSequence.new({
			NumberSequenceKeypoint.new(0,0.74),
			NumberSequenceKeypoint.new(0.5,0.08),
			NumberSequenceKeypoint.new(1,0.74),
		}),
	},innerGlowNearStroke)

	local innerSquare=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.fromScale(0.5,0.5),
		Size=UDim2.fromOffset(startState and outerCoreSize or innerOffSize,startState and outerCoreSize or innerOffSize),
		BackgroundColor3=startState and accent or inactiveFill,
		BackgroundTransparency=startState and 1 or 0.04,
		BorderSizePixel=0,
		Rotation=startState and 45 or 0,
		ZIndex=12,
	},holder)

	New("UICorner",{
		CornerRadius=UDim.new(0,2),
	},innerSquare)

	New("UIAspectRatioConstraint",{
		AspectRatio=1,
	},innerSquare)

	New("UISizeConstraint",{
		MinSize=Vector2.new(innerOffSize,innerOffSize),
		MaxSize=Vector2.new(outerCoreSize,outerCoreSize),
	},innerSquare)

	local innerStroke=New("UIStroke",{
		Color=startState and accent or muted,
		Thickness=strokeThickness,
		Transparency=startState and 0.02 or 1,
		LineJoinMode=Enum.LineJoinMode.Miter,
	},innerSquare)

	local innerStrokeGradient=New("UIGradient",{
		Rotation=0,
		Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,accent),
			ColorSequenceKeypoint.new(0.75,accent),
			ColorSequenceKeypoint.new(1,white),
		}),
	},innerStroke)

	local hit=New("TextButton",{
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Text="",
		AutoButtonColor=false,
		Size=UDim2.new(1,0,1,0),
		ZIndex=20,
	},switch)

	local state=startState and true or false
	local categoryExpanded=true
	local activeTweens={}
	local clickConn=nil
	local glowConn=nil
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

	local function setGradientColors(activeColor,highlightColor)
		innerGlowFarGradient.Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,activeColor),
			ColorSequenceKeypoint.new(0.5,highlightColor),
			ColorSequenceKeypoint.new(1,activeColor),
		})

		innerGlowNearGradient.Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,activeColor),
			ColorSequenceKeypoint.new(0.6,highlightColor),
			ColorSequenceKeypoint.new(1,activeColor),
		})

		innerStrokeGradient.Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,activeColor),
			ColorSequenceKeypoint.new(0.75,activeColor),
			ColorSequenceKeypoint.new(1,highlightColor),
		})
	end

	local function applyVisuals(animate)
		cancelTweens()

		local scale=categoryExpanded and categoryExpandedScale or 1
		local targetSwitchSize=categoryExpanded and switchExpandedSize or switchBaseSize
		local targetInnerSize=state and outerCoreSize or innerOffSize
		local targetInnerRotation=state and 45 or 0
		local targetInnerColor=state and accent or inactiveFill
		local targetOuterColor=state and white or outerInactive
		local targetFillTransparency=state and 1 or 0.04
		local targetInnerStrokeTransparency=state and 0.02 or 1
		local targetOuterStrokeTransparency=state and 0.02 or 0.18
		local targetGlowNearTransparency=state and 0.58 or 1
		local targetGlowFarTransparency=state and 0.78 or 1

		setGradientColors(accent,white)
		innerGlowFarGradient.Enabled=state
		innerGlowNearGradient.Enabled=state
		innerStrokeGradient.Enabled=state

		if not animate then
			switch.Size=UDim2.fromOffset(targetSwitchSize,targetSwitchSize)
			holderScale.Scale=scale
			outerCore.Size=UDim2.fromOffset(outerCoreSize,outerCoreSize)
			outerCore.Rotation=0
			outerStroke.Color=targetOuterColor
			outerStroke.Transparency=targetOuterStrokeTransparency
			innerGlowFar.Size=UDim2.fromOffset(targetInnerSize,targetInnerSize)
			innerGlowFar.Rotation=targetInnerRotation
			innerGlowFarStroke.Color=accent
			innerGlowFarStroke.Transparency=targetGlowFarTransparency
			innerGlowNear.Size=UDim2.fromOffset(targetInnerSize,targetInnerSize)
			innerGlowNear.Rotation=targetInnerRotation
			innerGlowNearStroke.Color=accent
			innerGlowNearStroke.Transparency=targetGlowNearTransparency
			innerSquare.Size=UDim2.fromOffset(targetInnerSize,targetInnerSize)
			innerSquare.Rotation=targetInnerRotation
			innerSquare.BackgroundColor3=targetInnerColor
			innerSquare.BackgroundTransparency=targetFillTransparency
			innerStroke.Color=accent
			innerStroke.Transparency=targetInnerStrokeTransparency
			return
		end

		local toggleInfo=state
			and TweenInfo.new(0.32,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
			or TweenInfo.new(0.24,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
		local scaleInfo=TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		local softInfo=TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

		playTween(switch,scaleInfo,{
			Size=UDim2.fromOffset(targetSwitchSize,targetSwitchSize),
		})

		playTween(holderScale,scaleInfo,{
			Scale=scale,
		})

		playTween(outerCore,scaleInfo,{
			Size=UDim2.fromOffset(outerCoreSize,outerCoreSize),
			Rotation=0,
		})

		playTween(outerStroke,softInfo,{
			Color=targetOuterColor,
			Transparency=targetOuterStrokeTransparency,
		})

		playTween(innerGlowFar,toggleInfo,{
			Size=UDim2.fromOffset(targetInnerSize,targetInnerSize),
			Rotation=targetInnerRotation,
		})

		playTween(innerGlowNear,toggleInfo,{
			Size=UDim2.fromOffset(targetInnerSize,targetInnerSize),
			Rotation=targetInnerRotation,
		})

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

		playTween(innerGlowFarStroke,softInfo,{
			Color=accent,
			Transparency=targetGlowFarTransparency,
		})

		playTween(innerGlowNearStroke,softInfo,{
			Color=accent,
			Transparency=targetGlowNearTransparency,
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

	glowConn=RunService.RenderStepped:Connect(function(dt)
		if not switch or not switch.Parent then return end

		if state then
			glowRotation=(glowRotation+(dt*90))%360
			innerGlowFarGradient.Rotation=glowRotation
			innerGlowNearGradient.Rotation=(360-glowRotation)%360
			innerStrokeGradient.Rotation=(glowRotation*0.75)%360
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
			safeDisconnect(glowConn)
			if switch then
				switch:Destroy()
			end
		end,
		wrap=switch,
		width=switchExpandedSize,
		height=switchExpandedSize,
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
