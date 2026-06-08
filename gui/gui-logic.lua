local GuiLogic={}

function GuiLogic.new(ctx)
	local New=ctx.New
	local THEME=ctx.THEME
	local UI_STYLE=ctx.UI_STYLE or {}
	local UIS=ctx.UIS
	local TweenService=ctx.TweenService
	local fmtNumber=ctx.fmtNumber
	local BOX_WRAPPERS=ctx.BOX_WRAPPERS or setmetatable({}, {__mode="k"})
	local BUTTON_WRAPPERS=ctx.BUTTON_WRAPPERS or setmetatable({}, {__mode="k"})
	local markThemeRole=ctx.markThemeRole or function() end
	local getUILibRuntimeStyle=ctx.getUILibRuntimeStyle

	local api={}
	local WRAP_INSET=0

	local function currentLib()
		return tostring(UI_STYLE.UILib or "original"):lower()
	end

	local function profile()
		local lib=currentLib()

		if type(getUILibRuntimeStyle)=="function" then
			local ok,style=pcall(getUILibRuntimeStyle,lib)
			if ok and type(style)=="table" then
				return style
			end
		end

		if lib=="windui" then
			return{Shape={WindowRadius=12,SectionRadius=10,ControlRadius=8,SliderRadius=10,SliderHeight=24,SliderStyle="windui"}}
		elseif lib=="rayfield" then
			return{Shape={WindowRadius=6,SectionRadius=5,ControlRadius=4,SliderRadius=4,SliderHeight=26,SliderStyle="rayfield"}}
		elseif lib=="linoria" then
			return{Shape={WindowRadius=3,SectionRadius=2,ControlRadius=2,SliderRadius=2,SliderHeight=22,SliderStyle="thin"}}
		elseif lib=="obsidian" then
			return{Shape={WindowRadius=9,SectionRadius=7,ControlRadius=6,SliderRadius=6,SliderHeight=24,SliderStyle="glow"}}
		elseif lib=="visual" then
			return{Shape={WindowRadius=8,SectionRadius=7,ControlRadius=6,SliderRadius=6,SliderHeight=28,SliderStyle="pill"}}
		end

		return{Shape={WindowRadius=0,SectionRadius=0,ControlRadius=0,SliderRadius=0,SliderHeight=26,SliderStyle="original"}}
	end

	local function shape()
		local style=profile()
		return type(style.Shape)=="table" and style.Shape or {WindowRadius=0,SectionRadius=0,ControlRadius=0,SliderRadius=0,SliderHeight=26,SliderStyle="original"}
	end

	local function components()
		local style=profile()
		return type(style.Components)=="table" and style.Components or {}
	end

	local function componentValue(key,fallback)
		local c=components()
		if c[key]==nil then
			return fallback
		end

		return c[key]
	end

	local function componentNumber(key,fallback)
		local value=tonumber(componentValue(key,fallback))
		if value==nil then
			return fallback
		end

		return value
	end

	local function componentFont(key,fallback)
		return componentValue(key,fallback)
	end

	local function addCorner(obj,role)
		if not obj then return nil end

		obj:SetAttribute("CornerRole",role or "Control")
		return New("UICorner",{CornerRadius=UDim.new(0,0)},obj)
	end

	local function themeColor(role,fallback)
		return THEME[role] or fallback
	end

	local function themeRoleColor(role,fallback)
		if type(role)=="string" and THEME[role] then
			return THEME[role]
		end

		return fallback
	end

	local function luminance(color)
		if not color then
			return 0
		end

		return (color.R*0.2126)+(color.G*0.7152)+(color.B*0.0722)
	end

	local function readableOn(color)
		if luminance(color)<0.48 then
			return Color3.fromRGB(245,245,245)
		end

		return Color3.fromRGB(22,22,22)
	end

	local function createSwitch(parent,startState,onChange,width,height,knobSize,pad,zIndex)
		local c=components()
		local checkbox=tostring(c.ToggleStyle or "switch"):lower()=="checkbox"
		width=width or componentNumber("ToggleWidth",checkbox and 34 or 58)
		height=height or componentNumber("ToggleHeight",checkbox and 22 or 22)
		pad=pad or componentNumber("TogglePad",3)
		zIndex=zIndex or 6

		local onRole=tostring(c.ToggleOnRole or "SLIDER_FILL")
		local offRole=tostring(c.ToggleOffRole or "INPUT")
		local accent=themeRoleColor(onRole,themeColor("SLIDER_FILL",THEME.GREEN or Color3.fromRGB(32,202,106)))
		local input=themeColor("INPUT",THEME.PANEL or Color3.fromRGB(18,18,24))
		local muted=themeColor("MUTED",THEME.MUTED or Color3.fromRGB(145,145,155))
		local strokeColor=themeColor("STROKE",THEME.STROKE or muted)
		local coreSize=knobSize or componentNumber("ToggleKnobSize",math.max(10,math.min(height-8,14)))
		local tickHeight=math.max(6,height-10)
		local onTextColor=readableOn(accent)
		local offStrokeTransparency=componentNumber("ToggleStrokeTransparency",0.50)
		local softInfo=TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		local snapInfo=TweenInfo.new(0.22,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
		local state=startState and true or false
		local hovering=false
		local activeTweens={}

		local wrap=New("Frame",{
			Size=UDim2.fromOffset(width,height),
			BackgroundColor3=input:Lerp(Color3.new(0,0,0),0.10),
			BorderSizePixel=0,
			ClipsDescendants=true,
			ZIndex=zIndex,
			ThemeRole="INPUT",
			CornerRole="Control",
		},parent)
		addCorner(wrap,"Control")

		local wrapStroke=New("UIStroke",{
			Color=strokeColor,
			Thickness=1,
			Transparency=offStrokeTransparency,
		},wrap)
		wrapStroke:SetAttribute("BaseStrokeTransparency",offStrokeTransparency)
		wrapStroke:SetAttribute("StrokeRole","Fixed")

		local fillClip=New("Frame",{
			AnchorPoint=Vector2.new(0,0.5),
			Position=UDim2.fromScale(0,0.5),
			Size=UDim2.new(0,0,1,0),
			BackgroundTransparency=1,
			BorderSizePixel=0,
			ClipsDescendants=true,
			ZIndex=zIndex+1,
		},wrap)

		local fill=New("Frame",{
			AnchorPoint=Vector2.new(0,0.5),
			Position=UDim2.fromScale(0,0.5),
			Size=UDim2.new(1,0,1,0),
			BackgroundColor3=accent,
			BackgroundTransparency=0.18,
			BorderSizePixel=0,
			ZIndex=zIndex+1,
			SkipThemeRole=true,
		},fillClip)
		addCorner(fill,"Control")
		New("UIGradient",{
			Rotation=0,
			Color=ColorSequence.new({
				ColorSequenceKeypoint.new(0,accent:Lerp(Color3.new(0,0,0),0.20)),
				ColorSequenceKeypoint.new(0.55,accent),
				ColorSequenceKeypoint.new(1,accent:Lerp(Color3.new(1,1,1),0.28)),
			}),
		},fill)

		local tickHolder=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=UDim2.new(1,-10,1,0),
			BackgroundTransparency=1,
			BorderSizePixel=0,
			ZIndex=zIndex+2,
		},wrap)

		local ticks={}
		for _,alpha in ipairs({0.25,0.50,0.75}) do
			local tick=New("Frame",{
				AnchorPoint=Vector2.new(0.5,0.5),
				Position=UDim2.fromScale(alpha,0.5),
				Size=UDim2.fromOffset(1,tickHeight),
				BackgroundColor3=muted,
				BackgroundTransparency=0.82,
				BorderSizePixel=0,
				ZIndex=zIndex+2,
				SkipThemeRole=true,
			},tickHolder)
			table.insert(ticks,tick)
		end

		local stateText=New("TextLabel",{
			BackgroundTransparency=1,
			BorderSizePixel=0,
			Position=UDim2.new(0,pad+coreSize+4,0,0),
			Size=UDim2.new(1,-(pad*2+coreSize+6),1,0),
			Text="OFF",
			Font=componentFont("ControlFont",Enum.Font.GothamBold),
			TextSize=componentNumber("ToggleTextSize",9),
			TextColor3=muted,
			TextTransparency=0.20,
			TextXAlignment=Enum.TextXAlignment.Center,
			ZIndex=zIndex+3,
			SkipThemeRole=true,
		},wrap)

		local core=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.new(0,pad+(coreSize/2),0.5,0),
			Size=UDim2.fromOffset(coreSize,coreSize),
			BackgroundColor3=muted,
			BackgroundTransparency=0.08,
			BorderSizePixel=0,
			Rotation=45,
			ZIndex=zIndex+4,
			SkipThemeRole=true,
		},wrap)
		New("UIAspectRatioConstraint",{AspectRatio=1},core)

		local coreStroke=New("UIStroke",{
			Color=strokeColor,
			Thickness=1.2,
			Transparency=0.34,
		},core)
		coreStroke:SetAttribute("StrokeRole","Fixed")

		local coreDot=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=UDim2.fromOffset(math.max(4,coreSize-8),math.max(4,coreSize-8)),
			BackgroundColor3=input,
			BackgroundTransparency=0.16,
			BorderSizePixel=0,
			Rotation=0,
			ZIndex=zIndex+5,
			SkipThemeRole=true,
		},core)
		New("UIAspectRatioConstraint",{AspectRatio=1},coreDot)

		local hit=New("TextButton",{
			BackgroundTransparency=1,
			Text="",
			Size=UDim2.new(1,0,1,0),
			BorderSizePixel=0,
			AutoButtonColor=false,
			ZIndex=zIndex+8,
		},wrap)

		local function cancelTweens()
			for _,tw in ipairs(activeTweens) do
				pcall(function()
					tw:Cancel()
				end)
			end
			table.clear(activeTweens)
		end

		local function tween(object,info,goal)
			local tw=TweenService:Create(object,info,goal)
			table.insert(activeTweens,tw)
			tw:Play()
			return tw
		end

		local function applyVisuals(animate)
			cancelTweens()

			local onX=width-pad-(coreSize/2)
			local offX=pad+(coreSize/2)
			local fillSize=state and UDim2.new(1,0,1,0) or UDim2.new(0,0,1,0)
			local corePos=state and UDim2.new(0,onX,0.5,0) or UDim2.new(0,offX,0.5,0)
			local coreColor=state and accent:Lerp(Color3.new(1,1,1),0.08) or muted
			local bgColor=state and input:Lerp(accent,0.12) or input:Lerp(Color3.new(0,0,0),0.10)
			local strokeTarget=state and accent or (hovering and muted or strokeColor)
			local strokeTransparency=state and 0.22 or (hovering and 0.32 or offStrokeTransparency)
			local dotColor=state and onTextColor or input
			local dotTransparency=state and 0.02 or 0.18
			local text=state and "ON" or "OFF"
			local textPosition=state and UDim2.new(0,pad,0,0) or UDim2.new(0,pad+coreSize+4,0,0)
			local textSize=state and UDim2.new(1,-(pad*2+coreSize+6),1,0) or UDim2.new(1,-(pad*2+coreSize+6),1,0)
			local textColorTarget=state and onTextColor or muted
			local coreRotation=state and 135 or 45
			local coreScale=state and math.min(coreSize+2,height-6) or coreSize

			stateText.Text=text
			wrap:SetAttribute("ThemeRole",state and onRole or offRole)

			if not animate then
				wrap.BackgroundColor3=bgColor
				wrapStroke.Color=strokeTarget
				wrapStroke.Transparency=strokeTransparency
				fillClip.Size=fillSize
				core.Position=corePos
				core.Size=UDim2.fromOffset(coreScale,coreScale)
				core.BackgroundColor3=coreColor
				core.Rotation=coreRotation
				coreStroke.Color=state and accent or strokeColor
				coreStroke.Transparency=state and 0.12 or 0.34
				coreDot.BackgroundColor3=dotColor
				coreDot.BackgroundTransparency=dotTransparency
				stateText.Position=textPosition
				stateText.Size=textSize
				stateText.TextColor3=textColorTarget
				stateText.TextTransparency=state and 0.02 or 0.22
				for _,tick in ipairs(ticks) do
					tick.BackgroundColor3=state and onTextColor or muted
					tick.BackgroundTransparency=state and 0.74 or 0.86
				end
				return
			end

			tween(wrap,softInfo,{BackgroundColor3=bgColor})
			tween(wrapStroke,softInfo,{Color=strokeTarget,Transparency=strokeTransparency})
			tween(fillClip,snapInfo,{Size=fillSize})
			tween(core,snapInfo,{Position=corePos,Size=UDim2.fromOffset(coreScale,coreScale),BackgroundColor3=coreColor,Rotation=coreRotation})
			tween(coreStroke,softInfo,{Color=state and accent or strokeColor,Transparency=state and 0.12 or 0.34})
			tween(coreDot,softInfo,{BackgroundColor3=dotColor,BackgroundTransparency=dotTransparency})
			tween(stateText,softInfo,{Position=textPosition,Size=textSize,TextColor3=textColorTarget,TextTransparency=state and 0.02 or 0.22})

			for _,tick in ipairs(ticks) do
				tween(tick,softInfo,{BackgroundColor3=state and onTextColor or muted,BackgroundTransparency=state and 0.74 or 0.86})
			end
		end

		local function setState(v,fire,animate)
			local nextState=v and true or false
			local changed=nextState~=state
			state=nextState
			applyVisuals(animate~=false)

			if fire and changed and onChange then
				onChange(state)
			end
		end

		hit.MouseButton1Click:Connect(function()
			setState(not state,true,true)
		end)

		hit.MouseEnter:Connect(function()
			hovering=true
			applyVisuals(true)
		end)

		hit.MouseLeave:Connect(function()
			hovering=false
			applyVisuals(true)
		end)

		setState(state,false,false)
		return{set=function(v) setState(v,false,false) end,get=function() return state end,wrap=wrap,knob=core,hit=hit,width=width,height=height}
	end

	local function createHeaderSwitch(parent,startState,onChange,zIndex)
		-- Header/category switch. This version keeps every visual centered inside one
		-- fixed wrapper so it does not drift vertically or horizontally when the
		-- section header changes height.
		local c=components()
		local function headerNumber(key,fallback)
			local value=tonumber(c[key])
			return value~=nil and value or fallback
		end

		local width=headerNumber("HeaderToggleWidth",88)
		local height=headerNumber("HeaderToggleHeight",30)
		local railHeight=headerNumber("HeaderToggleRailHeight",22)
		local indicatorSize=headerNumber("HeaderToggleIndicatorSize",26)
		local outerCoreSize=headerNumber("HeaderToggleOuterCoreSize",22)
		local innerOffSize=headerNumber("HeaderToggleInnerOffSize",11)
		local inactiveOuterCoreSize=headerNumber("HeaderToggleInactiveOuterCoreSize",math.min(outerCoreSize,math.max(innerOffSize+6,railHeight-4)))
		local indicatorInset=headerNumber("HeaderToggleIndicatorInset",4)
		local strokeThickness=headerNumber("HeaderToggleStrokeThickness",1.6)
		local expandedScale=headerNumber("HeaderToggleExpandedScale",1.05)
		local collapsedScale=headerNumber("HeaderToggleCollapsedScale",0.94)
		local z=zIndex or 6
		local scaleInfo=TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		local expandInfo=TweenInfo.new(0.26,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
		local collapseInfo=TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
		local softInfo=TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		local hoverInfo=TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

		local accent=themeColor("SLIDER_FILL",THEME.GREEN or Color3.fromRGB(74,208,128))
		local muted=themeColor("MUTED",THEME.MUTED or Color3.fromRGB(145,145,155))
		local input=themeColor("INPUT",THEME.INPUT or THEME.PANEL or Color3.fromRGB(18,18,24))
		local strokeColor=themeColor("STROKE",THEME.STROKE or muted)
		local dark=input:Lerp(Color3.new(0,0,0),0.25)
		local light=(THEME.TEXT or Color3.fromRGB(245,245,245))
		local state=startState and true or false
		local onPosition=UDim2.new(1,-(indicatorSize/2+indicatorInset),0.5,0)
		local offPosition=UDim2.new(0,indicatorSize/2+indicatorInset,0.5,0)
		local activeInnerSize=headerNumber("HeaderToggleActiveInnerSize",math.max(10,math.floor(outerCoreSize*0.54)))
		local inactiveInnerSize=headerNumber("HeaderToggleInactiveInnerSize",math.min(innerOffSize,math.max(8,math.floor(inactiveOuterCoreSize*0.52))))
		local stateVisuals={
			[true]={
				indicatorPosition=onPosition,
				fillSize=UDim2.new(1,0,1,0),
				fillTransparency=0.08,
				outerCoreSize=UDim2.fromOffset(outerCoreSize,outerCoreSize),
				outerStrokeColor=accent,
				outerStrokeTransparency=0.08,
				innerSize=UDim2.fromOffset(activeInnerSize,activeInnerSize),
				innerRotation=45,
				innerColor=light:Lerp(accent,0.2),
				innerFillTransparency=0.05,
				innerStrokeColor=accent,
				innerStrokeTransparency=0.38,
				glowTransparency=0.8,
				tickColor=accent,
				tickTransparency=0.34,
			},
			[false]={
				indicatorPosition=offPosition,
				fillSize=UDim2.new(0,0,1,0),
				fillTransparency=1,
				outerCoreSize=UDim2.fromOffset(inactiveOuterCoreSize,inactiveOuterCoreSize),
				outerStrokeColor=strokeColor,
				outerStrokeTransparency=0.28,
				innerSize=UDim2.fromOffset(inactiveInnerSize,inactiveInnerSize),
				innerRotation=0,
				innerColor=muted,
				innerFillTransparency=0.14,
				innerStrokeColor=muted,
				innerStrokeTransparency=0.58,
				glowTransparency=1,
				tickColor=muted,
				tickTransparency=0.82,
			},
		}

		local function visualState(enabled)
			return stateVisuals[enabled and true or false]
		end

		local initialVisuals=visualState(state)

		local switch=New("Frame",{
			AnchorPoint=Vector2.new(1,0.5),
			Size=UDim2.fromOffset(width,height),
			BackgroundTransparency=1,
			BorderSizePixel=0,
			ClipsDescendants=false,
			ZIndex=z,
		},parent)

		local rail=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=UDim2.new(1,0,0,railHeight),
			BackgroundColor3=dark,
			BackgroundTransparency=0.04,
			BorderSizePixel=0,
			ClipsDescendants=true,
			ZIndex=z+1,
		},switch)

		local railStroke=New("UIStroke",{
			Color=strokeColor,
			Thickness=1,
			Transparency=0.48,
			LineJoinMode=Enum.LineJoinMode.Miter,
		},rail)
		railStroke:SetAttribute("StrokeRole","Fixed")
		railStroke:SetAttribute("BaseStrokeTransparency",0.48)

		local railFillClip=New("Frame",{
			AnchorPoint=Vector2.new(0,0.5),
			Position=UDim2.fromScale(0,0.5),
			Size=initialVisuals.fillSize,
			BackgroundTransparency=1,
			BorderSizePixel=0,
			ClipsDescendants=true,
			ZIndex=z+2,
		},rail)

		local railFill=New("Frame",{
			AnchorPoint=Vector2.new(0,0.5),
			Position=UDim2.fromScale(0,0.5),
			Size=UDim2.new(1,0,1,0),
			BackgroundColor3=accent,
			BackgroundTransparency=initialVisuals.fillTransparency,
			BorderSizePixel=0,
			ZIndex=z+2,
		},railFillClip)

		New("UIGradient",{
			Rotation=0,
			Color=ColorSequence.new({
				ColorSequenceKeypoint.new(0,accent:Lerp(dark,0.2)),
				ColorSequenceKeypoint.new(0.55,accent),
				ColorSequenceKeypoint.new(1,light:Lerp(accent,0.25)),
			}),
		},railFill)

		local tickHolder=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=UDim2.new(1,-12,1,0),
			BackgroundTransparency=1,
			BorderSizePixel=0,
			ZIndex=z+3,
		},rail)

		local ticks={}
		for i,alpha in ipairs({0.22,0.5,0.78}) do
			local tick=New("Frame",{
				AnchorPoint=Vector2.new(0.5,0.5),
				Position=UDim2.fromScale(alpha,0.5),
				Size=UDim2.fromOffset(1,railHeight-8),
				BackgroundColor3=initialVisuals.tickColor,
				BackgroundTransparency=initialVisuals.tickTransparency,
				BorderSizePixel=0,
				ZIndex=z+3,
			},tickHolder)
			table.insert(ticks,tick)
		end

		local indicator=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=initialVisuals.indicatorPosition,
			Size=UDim2.fromOffset(indicatorSize,indicatorSize),
			BackgroundTransparency=1,
			BorderSizePixel=0,
			ClipsDescendants=false,
			ZIndex=z+5,
		},switch)
		New("UIAspectRatioConstraint",{AspectRatio=1},indicator)

		local indicatorScale=New("UIScale",{
			Scale=1,
		},indicator)

		local outerCore=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=initialVisuals.outerCoreSize,
			BackgroundTransparency=1,
			BorderSizePixel=0,
			Rotation=0,
			ZIndex=z+6,
		},indicator)
		New("UIAspectRatioConstraint",{AspectRatio=1},outerCore)

		local outerStroke=New("UIStroke",{
			Color=initialVisuals.outerStrokeColor,
			Thickness=strokeThickness,
			Transparency=initialVisuals.outerStrokeTransparency,
			LineJoinMode=Enum.LineJoinMode.Miter,
		},outerCore)
		outerStroke:SetAttribute("StrokeRole","Fixed")

		local glowOuter=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=UDim2.fromOffset(outerCoreSize+4,outerCoreSize+4),
			BackgroundTransparency=1,
			BorderSizePixel=0,
			Rotation=initialVisuals.innerRotation,
			ZIndex=z+4,
		},indicator)
		New("UIAspectRatioConstraint",{AspectRatio=1},glowOuter)

		local glowStroke=New("UIStroke",{
			Color=accent,
			Thickness=4,
			Transparency=initialVisuals.glowTransparency,
			LineJoinMode=Enum.LineJoinMode.Miter,
		},glowOuter)
		glowStroke:SetAttribute("StrokeRole","Fixed")
		New("UIGradient",{
			Rotation=45,
			Color=ColorSequence.new({
				ColorSequenceKeypoint.new(0,accent),
				ColorSequenceKeypoint.new(0.5,light),
				ColorSequenceKeypoint.new(1,accent),
			}),
			Transparency=NumberSequence.new({
				NumberSequenceKeypoint.new(0,0.9),
				NumberSequenceKeypoint.new(0.5,0.18),
				NumberSequenceKeypoint.new(1,0.9),
			}),
		},glowStroke)

		local inner=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=initialVisuals.innerSize,
			BackgroundColor3=initialVisuals.innerColor,
			BackgroundTransparency=initialVisuals.innerFillTransparency,
			BorderSizePixel=0,
			Rotation=initialVisuals.innerRotation,
			ZIndex=z+7,
		},indicator)
		New("UIAspectRatioConstraint",{AspectRatio=1},inner)

		local innerStroke=New("UIStroke",{
			Color=initialVisuals.innerStrokeColor,
			Thickness=strokeThickness,
			Transparency=initialVisuals.innerStrokeTransparency,
			LineJoinMode=Enum.LineJoinMode.Miter,
		},inner)
		innerStroke:SetAttribute("StrokeRole","Fixed")

		local hit=New("TextButton",{
			BackgroundTransparency=1,
			BorderSizePixel=0,
			Text="",
			AutoButtonColor=false,
			Size=UDim2.new(1,0,1,0),
			ZIndex=z+10,
		},switch)

		local categoryExpanded=true
		local activeTweens={}
		local scaleTween=nil
		local hoverTween=nil
		local visualTweenCount=0
		local clickConn=nil
		local hoverEnterConn=nil
		local hoverLeaveConn=nil

		local function applyProps(object,props)
			for key,value in pairs(props) do
				object[key]=value
			end
		end

		local function cancelTrackedTweens()
			for _,tw in ipairs(activeTweens) do
				pcall(function()
					tw:Cancel()
				end)
			end
			table.clear(activeTweens)
			visualTweenCount=0
		end

		local function playTrackedTween(object,info,goal)
			local tw=TweenService:Create(object,info,goal)
			table.insert(activeTweens,tw)
			visualTweenCount+=1
			tw.Completed:Connect(function()
				visualTweenCount=math.max(visualTweenCount-1,0)
			end)
			tw:Play()
			return tw
		end

		local function applyExpandedVisuals(animate)
			local targetScale=categoryExpanded and expandedScale or collapsedScale

			if scaleTween then
				scaleTween:Cancel()
				scaleTween=nil
			end

			if not animate then
				indicatorScale.Scale=targetScale
				return
			end

			scaleTween=TweenService:Create(indicatorScale,scaleInfo,{Scale=targetScale})
			scaleTween:Play()
		end

		local function applyVisuals(animate)
			cancelTrackedTweens()

			local visuals=visualState(state)

			if not animate then
				applyProps(indicator,{Position=visuals.indicatorPosition})
				applyProps(outerCore,{Size=visuals.outerCoreSize})
				applyProps(railFillClip,{Size=visuals.fillSize})
				applyProps(railFill,{BackgroundTransparency=visuals.fillTransparency})
				applyProps(outerStroke,{Color=visuals.outerStrokeColor,Transparency=visuals.outerStrokeTransparency})
				applyProps(inner,{
					Size=visuals.innerSize,
					Rotation=visuals.innerRotation,
					BackgroundColor3=visuals.innerColor,
					BackgroundTransparency=visuals.innerFillTransparency,
				})
				applyProps(innerStroke,{
					Color=visuals.innerStrokeColor,
					Thickness=strokeThickness,
					Transparency=visuals.innerStrokeTransparency,
				})
				applyProps(glowOuter,{Rotation=visuals.innerRotation})
				applyProps(glowStroke,{Transparency=visuals.glowTransparency})
				for _,tick in ipairs(ticks) do
					applyProps(tick,{BackgroundColor3=visuals.tickColor,BackgroundTransparency=visuals.tickTransparency})
				end
				return
			end

			local shapeInfo=state and expandInfo or collapseInfo

			playTrackedTween(indicator,shapeInfo,{Position=visuals.indicatorPosition})
			playTrackedTween(outerCore,shapeInfo,{Size=visuals.outerCoreSize})
			playTrackedTween(railFillClip,shapeInfo,{Size=visuals.fillSize})
			playTrackedTween(railFill,softInfo,{BackgroundTransparency=visuals.fillTransparency})
			playTrackedTween(outerStroke,softInfo,{Color=visuals.outerStrokeColor,Transparency=visuals.outerStrokeTransparency})
			playTrackedTween(inner,shapeInfo,{
				Size=visuals.innerSize,
				Rotation=visuals.innerRotation,
				BackgroundColor3=visuals.innerColor,
				BackgroundTransparency=visuals.innerFillTransparency,
			})
			playTrackedTween(innerStroke,softInfo,{
				Color=visuals.innerStrokeColor,
				Thickness=strokeThickness,
				Transparency=visuals.innerStrokeTransparency,
			})
			playTrackedTween(glowOuter,shapeInfo,{Rotation=visuals.innerRotation})
			playTrackedTween(glowStroke,softInfo,{Transparency=visuals.glowTransparency})

			for _,tick in ipairs(ticks) do
				playTrackedTween(tick,softInfo,{BackgroundColor3=visuals.tickColor,BackgroundTransparency=visuals.tickTransparency})
			end
		end

		local function setState(value,fire,animate,force)
			local nextState=value and true or false
			local changed=nextState~=state

			if force and not changed and visualTweenCount>0 then
				return
			end

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

		hoverEnterConn=hit.MouseEnter:Connect(function()
			if hoverTween then
				hoverTween:Cancel()
			end
			hoverTween=TweenService:Create(railStroke,hoverInfo,{Transparency=0.28})
			hoverTween:Play()
		end)

		hoverLeaveConn=hit.MouseLeave:Connect(function()
			if hoverTween then
				hoverTween:Cancel()
			end
			hoverTween=TweenService:Create(railStroke,hoverInfo,{Transparency=0.48})
			hoverTween:Play()
		end)

		applyVisuals(false)
		applyExpandedVisuals(false)

		return{
			set=function(value)
				setState(value,false,false,true)
			end,
			get=function()
				return state
			end,
			setExpanded=function(value,animate)
				categoryExpanded=value and true or false
				applyExpandedVisuals(animate~=false)
			end,
			destroy=function()
				cancelTrackedTweens()
				if scaleTween then
					scaleTween:Cancel()
					scaleTween=nil
				end
				if hoverTween then
					hoverTween:Cancel()
					hoverTween=nil
				end
				if clickConn then clickConn:Disconnect() clickConn=nil end
				if hoverEnterConn then hoverEnterConn:Disconnect() hoverEnterConn=nil end
				if hoverLeaveConn then hoverLeaveConn:Disconnect() hoverLeaveConn=nil end
				if switch then
					switch:Destroy()
				end
			end,
			wrap=switch,
			width=width,
			height=height,
		}
	end

	local function insetSize(size)
		return UDim2.new(size.X.Scale,size.X.Offset-(WRAP_INSET*2),size.Y.Scale,size.Y.Offset-(WRAP_INSET*2))
	end

	local function insetPosition(position)
		return UDim2.new(position.X.Scale,position.X.Offset+WRAP_INSET,position.Y.Scale,position.Y.Offset+WRAP_INSET)
	end

	function api.attachHover(button,normalBg,hoverBg,normalText,hoverText)
		button.MouseEnter:Connect(function()
			if button.BackgroundTransparency<1 then
				button.BackgroundColor3=hoverBg
			end

			if button:IsA("TextButton") or button:IsA("TextLabel") then
				button.TextColor3=hoverText or normalText or THEME.TEXT
			end
		end)

		button.MouseLeave:Connect(function()
			if button.BackgroundTransparency<1 then
				button.BackgroundColor3=normalBg
			end

			if button:IsA("TextButton") or button:IsA("TextLabel") then
				button.TextColor3=normalText or THEME.TEXT
			end
		end)
	end

	function api.wrapTextBox(box,bgColor,strokeThickness)
		local padX=componentNumber("TextBoxPaddingX",4)
		local parent=box.Parent
		local wrap=Instance.new("Frame")

		wrap.Name=box.Name~="" and (box.Name.."_Wrap") or "TextBoxWrap"
		wrap.BackgroundColor3=bgColor or THEME.PANEL
		wrap.BorderSizePixel=0
		wrap.ClipsDescendants=false
		wrap.Active=true
		wrap.Size=insetSize(box.Size)
		wrap.Position=insetPosition(box.Position)
		wrap.AnchorPoint=box.AnchorPoint
		wrap.Visible=box.Visible
		wrap.ZIndex=math.max((box.ZIndex or 2)-1,1)
		wrap.Parent=parent
		markThemeRole(wrap,wrap.BackgroundColor3)
		addCorner(wrap,"Control")

		local stroke=New("UIStroke",{Color=THEME.STROKE,Thickness=math.min(strokeThickness or 1,1),Transparency=componentNumber("ControlStrokeTransparency",0.55)},wrap)
		stroke:SetAttribute("BaseStrokeTransparency",componentNumber("ControlStrokeTransparency",0.55))

		box.Parent=wrap
		box.BackgroundTransparency=1
		box.BorderSizePixel=0
		box.Position=UDim2.new(0,padX,0,0)
		box.Size=UDim2.new(1,-(padX*2),1,0)
		box.AnchorPoint=Vector2.new(0,0)
		box.ZIndex=wrap.ZIndex+1

		BOX_WRAPPERS[box]={wrap=wrap,stroke=stroke}
		return wrap,stroke
	end

	function api.placeWrappedBox(box,position,size)
		local entry=BOX_WRAPPERS[box]
		if not entry then return end
		if size then entry.wrap.Size=insetSize(size) end
		if position then entry.wrap.Position=insetPosition(position) end
	end

	function api.wrapTextButton(button,bgColor,strokeThickness)
		local parent=button.Parent
		local wrap=Instance.new("Frame")

		wrap.Name=button.Name~="" and (button.Name.."_Wrap") or "ButtonWrap"
		wrap.BackgroundColor3=bgColor or THEME.BG
		wrap.BorderSizePixel=0
		wrap.ClipsDescendants=false
		wrap.Active=true
		wrap.Size=insetSize(button.Size)
		wrap.Position=insetPosition(button.Position)
		wrap.AnchorPoint=button.AnchorPoint
		wrap.Visible=button.Visible
		wrap.ZIndex=math.max((button.ZIndex or 2)-1,1)
		wrap.Parent=parent
		markThemeRole(wrap,wrap.BackgroundColor3)
		addCorner(wrap,"Control")

		local stroke=New("UIStroke",{Color=THEME.STROKE,Thickness=math.min(strokeThickness or 1,1),Transparency=componentNumber("ControlStrokeTransparency",0.55)},wrap)
		stroke:SetAttribute("BaseStrokeTransparency",componentNumber("ControlStrokeTransparency",0.55))

		button.Parent=wrap
		button.BackgroundTransparency=1
		button.BorderSizePixel=0
		button.Position=UDim2.new(0,0,0,0)
		button.Size=UDim2.new(1,0,1,0)
		button.AnchorPoint=Vector2.new(0,0)
		button.ZIndex=wrap.ZIndex+1

		BUTTON_WRAPPERS[button]={wrap=wrap,stroke=stroke}
		return wrap,stroke
	end

	function api.placeWrappedButton(button,position,size)
		local entry=BUTTON_WRAPPERS[button]
		if not entry then return end
		if size then entry.wrap.Size=insetSize(size) end
		if position then entry.wrap.Position=insetPosition(position) end
	end

	function api.setWrappedButtonBg(button,color)
		local entry=BUTTON_WRAPPERS[button]
		if entry then
			entry.wrap.BackgroundColor3=color
		else
			button.BackgroundColor3=color
		end
	end

	function api.makeSection(parent,order,titleText,subtitleText,options)
		options=options or {}
		local c=components()
		local sectionMode=tostring(c.SectionMode or "card"):lower()
		local descriptionOnly=options.compact==true or options.headerOnly==true
		local hasBody=not descriptionOnly
		local sec=New("Frame",{BackgroundColor3=themeColor("SECTION",THEME.CARD),BackgroundTransparency=componentNumber("SectionBackgroundTransparency",0),BorderSizePixel=0,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,ZIndex=4,LayoutOrder=order,ThemeRole="SECTION",CornerRole="Section"},parent)

		addCorner(sec,"Section")
		local sectionStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=componentNumber("SectionStrokeTransparency",0.62)},sec)
		sectionStroke:SetAttribute("BaseStrokeTransparency",componentNumber("SectionStrokeTransparency",0.62))
		New("UIPadding",{PaddingTop=UDim.new(0,componentNumber("SectionPaddingY",10)),PaddingLeft=UDim.new(0,componentNumber("SectionPaddingX",12)),PaddingRight=UDim.new(0,componentNumber("SectionPaddingX",12)),PaddingBottom=UDim.new(0,componentNumber("SectionPaddingY",10))},sec)
		New("UIListLayout",{Padding=UDim.new(0,componentNumber("SectionGap",6)),SortOrder=Enum.SortOrder.LayoutOrder},sec)

		local collapsed=false
		local headerToggleWidth=componentNumber("HeaderToggleWidth",88)
		local headerToggleHeight=componentNumber("HeaderToggleHeight",30)
		local headerHeight=componentNumber("SectionHeaderHeight",22)
		if options.headerToggle then
			headerHeight=math.max(headerHeight,headerToggleHeight)
		end

		local header=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,headerHeight),ZIndex=5,LayoutOrder=1},sec)
		local controls={section=sec}
		local headerButtonOptions=options.headerButton or options.headerAction
		local headerButtonWidth=headerButtonOptions and (headerButtonOptions.width or headerButtonOptions.Width or 104) or 0
		local toggleReserve=options.headerToggle and (headerToggleWidth+8) or 0
		local titleReserve=toggleReserve+(headerButtonOptions and (headerButtonWidth+8) or 0)
		local usesPrefix=componentValue("SectionPrefix",true)~=false
		local titleButton=New("TextButton",{BackgroundTransparency=1,Size=UDim2.new(1,-titleReserve,1,0),Text=(usesPrefix and "[-] " or "")..titleText,Font=componentFont("TitleFont",Enum.Font.GothamBold),TextSize=componentNumber("SectionTitleSize",14),TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,ZIndex=5},header)
		local headerRightOffset=0

		if sectionMode=="groupbox" then
			local titleWidth=componentNumber("SectionTitleBoxWidth",140)
			local titleHeight=componentNumber("SectionTitleBoxHeight",componentNumber("SectionHeaderHeight",18))
			titleButton.AnchorPoint=Vector2.new(0.5,0)
			titleButton.Position=UDim2.new(0.5,0,0,componentNumber("SectionTitleOffsetY",-2))
			titleButton.Size=UDim2.fromOffset(titleWidth,titleHeight)
			titleButton.BackgroundColor3=themeColor("SECTION",THEME.CARD)
			titleButton.BackgroundTransparency=componentNumber("SectionTitleBackgroundTransparency",0)
			titleButton.TextXAlignment=Enum.TextXAlignment.Center
			titleButton:SetAttribute("ThemeRole","SECTION")
		elseif sectionMode=="label" then
			titleButton.TextXAlignment=Enum.TextXAlignment.Left
		end

		if options.headerToggle then
			local toggleOptions=options.headerToggle
			controls.toggle=createHeaderSwitch(header,toggleOptions.startState,toggleOptions.onChange,6)
			controls.toggle.wrap.Position=UDim2.new(1,0,0.5,0)
			headerRightOffset=controls.toggle.width+8
		end

		if headerButtonOptions then
			local customBg=headerButtonOptions.backgroundColor or headerButtonOptions.BackgroundColor3
			local normalBg=customBg or (headerButtonOptions.danger and THEME.RED) or themeColor("BUTTON",THEME.BG)
			local hoverBg=headerButtonOptions.hoverBackgroundColor or headerButtonOptions.HoverBackgroundColor3 or (headerButtonOptions.danger and Color3.fromRGB(255,124,118)) or THEME.CARD
			local textColor=headerButtonOptions.textColor or headerButtonOptions.TextColor3 or (headerButtonOptions.danger and Color3.fromRGB(0,0,0)) or THEME.TEXT
			local headerButtonHeight=componentNumber("HeaderButtonHeight",22)
			local button=New("TextButton",{Size=UDim2.fromOffset(headerButtonWidth,headerButtonHeight),Position=UDim2.new(1,-headerRightOffset-headerButtonWidth,0.5,-headerButtonHeight/2),BackgroundColor3=normalBg,BorderSizePixel=0,Text=headerButtonOptions.text or headerButtonOptions.Text or "ACTION",Font=componentFont("ControlFont",Enum.Font.GothamMedium),TextSize=11,TextColor3=textColor,AutoButtonColor=false,ZIndex=6},header)
			local buttonWrap=api.wrapTextButton(button,normalBg,2)
			buttonWrap.BackgroundColor3=normalBg
			if headerButtonOptions.themeRole or headerButtonOptions.ThemeRole then
				buttonWrap:SetAttribute("ThemeRole",headerButtonOptions.themeRole or headerButtonOptions.ThemeRole)
			elseif headerButtonOptions.danger then
				buttonWrap:SetAttribute("ThemeRole","RED")
			elseif not customBg then
				buttonWrap:SetAttribute("ThemeRole","BUTTON")
			end

			button.MouseEnter:Connect(function()
				buttonWrap.BackgroundColor3=hoverBg
			end)

			button.MouseLeave:Connect(function()
				buttonWrap.BackgroundColor3=customBg or (headerButtonOptions.danger and THEME.RED) or themeColor("BUTTON",THEME.BG)
			end)

			button.MouseButton1Click:Connect(function()
				local fn=headerButtonOptions.onClick or headerButtonOptions.OnClick
				if fn then
					fn()
				end
			end)

			controls.headerButton=button
			controls.headerButtonWrap=buttonWrap
		end

		local subtitleLabel=nil
		if subtitleText and subtitleText~="" then
			subtitleLabel=New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,14),Text=subtitleText,Font=componentFont("TextFont",Enum.Font.Gotham),TextSize=componentNumber("SectionSubtitleSize",11),TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=5,LayoutOrder=2},sec)
		end

		local body=nil
		local bodyLayout=nil
		if hasBody then
			body=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,Visible=true,ZIndex=5,LayoutOrder=3,ClipsDescendants=true},sec)
			New("UIPadding",{PaddingTop=UDim.new(0,componentNumber("SectionBodyInset",2)),PaddingLeft=UDim.new(0,componentNumber("SectionBodyInset",2)),PaddingRight=UDim.new(0,componentNumber("SectionBodyInset",2)),PaddingBottom=UDim.new(0,componentNumber("SectionBodyInset",2))},body)
			bodyLayout=New("UIListLayout",{Padding=UDim.new(0,componentNumber("SectionBodyGap",6)),SortOrder=Enum.SortOrder.LayoutOrder},body)
		end
		local bodyTween=nil
		local lastBodyHeight=0

		local function getBodyHeight()
			if not body then return 0 end
			local h=math.max(body.AbsoluteSize.Y,bodyLayout.AbsoluteContentSize.Y,lastBodyHeight)
			return math.max(0,math.floor(h+0.5))
		end

		local function tweenTitle()
			titleButton.TextTransparency=0.18
			TweenService:Create(titleButton,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency=0}):Play()
			TweenService:Create(sec,TweenInfo.new(0.14,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3=collapsed and THEME.PANEL or themeColor("SECTION",THEME.CARD)}):Play()
		end

		local function cancelBodyTween()
			if bodyTween then
				bodyTween:Cancel()
				bodyTween=nil
			end
		end

		local function setSubtitleVisible(visible,animate)
			if not subtitleLabel then return end

			if visible then
				subtitleLabel.Visible=true
			end

			if animate then
				local tween=TweenService:Create(subtitleLabel,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency=visible and 0 or 1})
				tween:Play()
				tween.Completed:Connect(function()
					if subtitleLabel and subtitleLabel.Parent and not visible then
						subtitleLabel.Visible=false
						subtitleLabel.TextTransparency=0
					end
				end)
			else
				subtitleLabel.Visible=visible
				subtitleLabel.TextTransparency=0
			end
		end

		local function collapseBody(animate)
			cancelBodyTween()
			lastBodyHeight=getBodyHeight()
			if body then
				body.Visible=true
				body.AutomaticSize=Enum.AutomaticSize.None
				body.Size=UDim2.new(1,0,0,lastBodyHeight)
			end

			if not animate then
				if body then
					body.Visible=false
					body.Size=UDim2.new(1,0,0,0)
				end
				setSubtitleVisible(false,false)
				return
			end

			setSubtitleVisible(false,true)
			if not body then
				return
			end

			bodyTween=TweenService:Create(body,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{Size=UDim2.new(1,0,0,0)})
			bodyTween:Play()
			bodyTween.Completed:Connect(function()
				if collapsed and body and body.Parent then
					body.Visible=false
					body.Size=UDim2.new(1,0,0,0)
				end
			end)
		end

		local function expandBody(animate)
			cancelBodyTween()
			setSubtitleVisible(true,animate)
			if not body then
				return
			end

			body.Visible=true
			body.AutomaticSize=Enum.AutomaticSize.None
			body.Size=UDim2.new(1,0,0,0)

			local function playExpand()
				local target=math.max(bodyLayout.AbsoluteContentSize.Y+4,lastBodyHeight)
				target=math.max(0,math.floor(target+0.5))
				lastBodyHeight=target

				if not animate then
					body.AutomaticSize=Enum.AutomaticSize.Y
					body.Size=UDim2.new(1,0,0,0)
					return
				end

				bodyTween=TweenService:Create(body,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,0,target)})
				bodyTween:Play()
				bodyTween.Completed:Connect(function()
					if not collapsed and body and body.Parent then
						body.AutomaticSize=Enum.AutomaticSize.Y
						body.Size=UDim2.new(1,0,0,0)
					end
				end)
			end

			task.defer(playExpand)
		end

		local function paint(animate)
			titleButton.Text=(usesPrefix and ((collapsed and "[+] " or "[-] ")..titleText) or titleText)
			if sectionMode=="groupbox" then
				titleButton.Text=titleText
			end

			if controls.toggle and controls.toggle.setExpanded then
				controls.toggle.setExpanded(not collapsed,animate)
			end

			tweenTitle()

			if collapsed then
				collapseBody(animate)
			else
				expandBody(animate)
			end
		end

		titleButton.MouseButton1Click:Connect(function()
			collapsed=not collapsed
			paint(true)
		end)

		sec:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			if body and not collapsed then
				lastBodyHeight=getBodyHeight()
			end
		end)

		paint(false)
		return body or sec,controls
	end

	function api.makeBox(parent,w,txt,placeholder)
		local b=New("TextBox",{Size=UDim2.fromOffset(w,componentNumber("TextBoxHeight",28)),BackgroundColor3=themeColor("INPUT",THEME.PANEL),BorderSizePixel=0,ClearTextOnFocus=false,Text=txt,PlaceholderText=placeholder or "",Font=componentFont("TextFont",Enum.Font.Gotham),TextSize=componentNumber("InputTextSize",13),TextColor3=THEME.TEXT,PlaceholderColor3=THEME.MUTED,ZIndex=6,ThemeRole="INPUT"},parent)
		local wrap,stroke=api.wrapTextBox(b,themeColor("INPUT",THEME.PANEL),2)
		wrap:SetAttribute("ThemeRole","INPUT")

		b.Focused:Connect(function()
			wrap.BackgroundColor3=themeColor("INPUT",THEME.PANEL)
			stroke.Thickness=1
		end)

		b.FocusLost:Connect(function()
			wrap.BackgroundColor3=themeColor("INPUT",THEME.PANEL)
			stroke.Thickness=1
		end)

		return b
	end

	function api.buildSlider(parent,labelText,minVal,maxVal,startVal,decimals,onChange)
		local s=shape()
		local sliderHeight=s.SliderHeight or componentNumber("SliderHeight",26)
		local rowHeight=math.max(componentNumber("SliderRowHeight",38),sliderHeight+10)
		local rounded=(tonumber(s.SliderRadius) or 0)>0
		local valueBoxVisible=componentValue("SliderValueBoxVisible",true)~=false
		local valueBoxWidth=valueBoxVisible and componentNumber("SliderValueBoxWidth",58) or 0
		local valueBoxGap=valueBoxVisible and componentNumber("SliderValueBoxGap",8) or 0
		local labelWidth=componentNumber("SliderLabelWidth",s.SliderStyle=="thin" and 116 or 128)
		local trackGap=componentNumber("SliderTrackGap",8)
		local rightPadding=componentNumber("SliderRightPadding",8)
		local labelX=componentNumber("SliderLabelX",12)
		local labelPlacement=tostring(componentValue("SliderLabelPlacement","above")):lower()
		local labelHeight=componentNumber("SliderLabelHeight",s.SliderStyle=="thin" and 12 or 14)
		local labelY=componentNumber("SliderLabelY",0)
		local controlGap=componentNumber("SliderControlGap",4)
		local bottomPadding=componentNumber("SliderBottomPadding",4)
		local trackLeft=labelX+labelWidth+trackGap
		local trackRight=valueBoxWidth+valueBoxGap+rightPadding
		local trackYScale=0.5
		local trackYOffset=0
		local labelPosition=UDim2.fromOffset(labelX,0)
		local labelSize=UDim2.fromOffset(labelWidth,rowHeight)
		local valueBoxYScale=0.5
		local valueBoxYOffset=0

		if labelPlacement=="above" then
			rowHeight=math.max(rowHeight,labelY+labelHeight+controlGap+sliderHeight+bottomPadding)
			trackLeft=labelX
			trackYScale=0
			trackYOffset=labelY+labelHeight+controlGap+(sliderHeight/2)
			labelPosition=UDim2.fromOffset(labelX,labelY)
			labelSize=UDim2.new(1,-(labelX+rightPadding),0,labelHeight)
			valueBoxYScale=trackYScale
			valueBoxYOffset=trackYOffset
		end

		local containerRole=tostring(componentValue("SliderContainerRole","SECTION"))
		local containerCorner=tostring(componentValue("SliderContainerCornerRole",containerRole=="BUTTON" and "Control" or "Section"))
		local trackRole=tostring(componentValue("SliderTrackRole","SLIDER_BG"))
		local valueRole=tostring(componentValue("SliderValueBoxRole","INPUT"))
		local container=New("Frame",{BackgroundColor3=themeColor(containerRole,themeColor("SECTION",THEME.CARD)),BackgroundTransparency=componentNumber("SliderContainerTransparency",0.12),BorderSizePixel=0,Size=UDim2.new(1,0,0,rowHeight),ZIndex=5,ThemeRole=containerRole,CornerRole=containerCorner},parent)
		addCorner(container,containerCorner)
		local containerStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=componentNumber("SliderContainerStrokeTransparency",0.65)},container)
		containerStroke:SetAttribute("BaseStrokeTransparency",componentNumber("SliderContainerStrokeTransparency",0.65))
		New("TextLabel",{BackgroundTransparency=1,Position=labelPosition,Size=labelSize,Text=labelText,Font=componentFont("ControlFont",s.SliderStyle=="thin" and Enum.Font.Code or Enum.Font.GothamMedium),TextSize=componentNumber("SliderLabelSize",s.SliderStyle=="thin" and 11 or 12),TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=6,Selectable=false},container)

		local track=New("Frame",{AnchorPoint=Vector2.new(0,0.5),Size=UDim2.new(1,-(trackLeft+trackRight),0,sliderHeight),Position=UDim2.new(0,trackLeft,trackYScale,trackYOffset),BackgroundColor3=themeColor(trackRole,THEME.PANEL),BorderSizePixel=0,ClipsDescendants=rounded,ZIndex=6,ThemeRole=trackRole,CornerRole="Slider"},container)
		addCorner(track,"Slider")
		local trackStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=componentNumber("SliderTrackStrokeTransparency",0.55)},track)
		trackStroke:SetAttribute("BaseStrokeTransparency",componentNumber("SliderTrackStrokeTransparency",0.55))

		local fill=New("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=themeColor("SLIDER_FILL",THEME.STROKE),BorderSizePixel=0,ClipsDescendants=rounded,ZIndex=7,ThemeRole="SLIDER_FILL",CornerRole="Slider"},track)
		addCorner(fill,"Slider")

		local knobVisible=componentValue("SliderKnobVisible",false)==true
		local knobWidth=knobVisible and (s.SliderStyle=="windui" and 10 or (s.SliderStyle=="thin" and 2 or 3)) or 0
		local knob=New("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromOffset(knobWidth,sliderHeight),Position=UDim2.new(0,0,0.5,0),BackgroundColor3=themeColor("SLIDER_FILL",THEME.STROKE),BackgroundTransparency=knobVisible and 0 or 1,BorderSizePixel=0,Visible=knobVisible,ZIndex=8,ThemeRole="SLIDER_FILL",CornerRole="Slider"},track)
		if knobVisible then
			addCorner(knob,"Slider")
		end

		local hit=New("TextButton",{BackgroundTransparency=1,Text="",Size=UDim2.new(1,0,1,0),ZIndex=10,AutoButtonColor=false,Selectable=false},track)
		local valueLabel=New("TextLabel",{BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,1,0),Position=UDim2.fromOffset(0,0),Text=fmtNumber(startVal,decimals),Font=componentFont("ControlFont",Enum.Font.GothamMedium),TextSize=componentNumber("SliderValueTextSize",12),TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=9,Selectable=false},track)
		local valueBoxHeight=componentNumber("SliderValueBoxHeight",math.max(componentNumber("TextBoxHeight",24),sliderHeight))
		local valueBox=New("TextBox",{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-rightPadding,valueBoxYScale,valueBoxYOffset),Size=UDim2.fromOffset(math.max(1,valueBoxWidth),valueBoxHeight),BackgroundColor3=themeColor(valueRole,THEME.PANEL),BackgroundTransparency=componentNumber("SliderValueBoxTransparency",0),BorderSizePixel=0,ClearTextOnFocus=false,Text=fmtNumber(startVal,decimals),Font=componentFont("ControlFont",Enum.Font.GothamMedium),TextSize=componentNumber("SliderValueTextSize",12),TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=6,ThemeRole=valueRole,CornerRole="Control",Selectable=false},container)
		valueBox.Visible=valueBoxVisible
		addCorner(valueBox,"Control")
		local valueStrokeTransparency=componentNumber("SliderValueBoxStrokeTransparency",componentNumber("ControlStrokeTransparency",0.65))
		local valueStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=valueStrokeTransparency},valueBox)
		valueStroke:SetAttribute("BaseStrokeTransparency",valueStrokeTransparency)
		local value=startVal
		local dragging=false

		local function roundTo(v,d)
			local m=10^d
			return math.floor(v*m+0.5)/m
		end

		local function setVisual(v)
			local pct=math.clamp((v-minVal)/(maxVal-minVal),0,1)
			fill.Size=UDim2.new(pct,0,1,0)
			if knobVisible then
				knob.Position=UDim2.new(pct,0,0.5,0)
			end
			valueLabel.Text=fmtNumber(v,decimals)
			valueBox.Text=fmtNumber(v,decimals)
		end

		local function valueFromMouseX(mx)
			local absPos=track.AbsolutePosition.X
			local absSize=track.AbsoluteSize.X
			if absSize<=0 then return value end

			local pct=math.clamp((mx-absPos)/absSize,0,1)
			return roundTo(minVal+(maxVal-minVal)*pct,decimals)
		end

		local function setValue(v,fire)
			v=roundTo(math.clamp(tonumber(v) or value,minVal,maxVal),decimals)
			value=v
			setVisual(v)

			if fire and onChange then
				onChange(v)
			end
		end

		local function beginDrag(i)
			if i.UserInputType==Enum.UserInputType.MouseButton1 then
				dragging=true
				valueBox:ReleaseFocus()
				setValue(valueFromMouseX(UIS:GetMouseLocation().X),true)
			end
		end

		hit.InputBegan:Connect(beginDrag)
		track.InputBegan:Connect(beginDrag)
		fill.InputBegan:Connect(beginDrag)
		valueLabel.InputBegan:Connect(beginDrag)

		UIS.InputChanged:Connect(function(i)
			if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
				setValue(valueFromMouseX(UIS:GetMouseLocation().X),true)
			end
		end)

		UIS.InputEnded:Connect(function(i)
			if i.UserInputType==Enum.UserInputType.MouseButton1 then
				dragging=false
			end
		end)

		valueBox.FocusLost:Connect(function()
			setValue(valueBox.Text,true)
		end)

		setValue(startVal,false)
		return{set=function(v) setValue(v,false) end,get=function() return value end,box=valueBox,valueLabel=valueLabel,fill=fill,knob=knob,track=track}
	end

	function api.buildToggleRow(parent,labelText,startState,onChange)
		local c=components()
		local toggleStyle=tostring(c.ToggleStyle or "switch"):lower()
		local toggleW=componentNumber("ToggleWidth",48)
		local toggleH=componentNumber("ToggleHeight",20)
		local rowHeight=componentNumber("ToggleRowHeight",math.max(30,toggleH+8))
		local row=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,rowHeight),ZIndex=5},parent)
		local label=New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-(toggleW+16),1,0),Text=labelText,Font=componentFont("ControlFont",Enum.Font.GothamMedium),TextSize=componentNumber("ToggleLabelSize",12),TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},row)
		if label.Text=="" then
			label.Visible=false
		end

		local control=createSwitch(row,startState,onChange,nil,nil,nil,nil,6)
		if toggleStyle=="checkbox" then
			control.wrap.Position=UDim2.new(0,0,0.5,-control.height/2)
			label.Position=UDim2.fromOffset(control.width+8,0)
			label.Size=UDim2.new(1,-(control.width+8),1,0)
		else
			control.wrap.Position=UDim2.new(1,-control.width,0.5,-control.height/2)
		end
		return control
	end

	api.BOX_WRAPPERS=BOX_WRAPPERS
	api.BUTTON_WRAPPERS=BUTTON_WRAPPERS

	return api
end

return GuiLogic
