local GuiLogic={}

function GuiLogic.new(ctx)
	local New=ctx.New
	local Fusion=ctx.Fusion
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

	local function makeFusionValue(initial)
		if type(Fusion)=="table" and type(Fusion.Value)=="function" then
			return Fusion.Value(initial)
		end
		return nil
	end

	local function destroyFusionValue(value)
		if value and type(value.Destroy)=="function" then
			pcall(function()
				value:Destroy()
			end)
		elseif value and type(value.destroy)=="function" then
			pcall(function()
				value:destroy()
			end)
		end
	end

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

	local function createSwitch(parent,startState,onChange,width,height,_knobSize,_pad,zIndex)
		local c=components()
		local checkbox=tostring(c.ToggleStyle or "switch"):lower()=="checkbox"
		width=width or componentNumber("ToggleWidth",checkbox and 34 or 58)
		height=height or componentNumber("ToggleHeight",checkbox and 22 or 22)
		zIndex=zIndex or 6

		local onRole=tostring(c.ToggleOnRole or "SLIDER_FILL")
		local accent=themeRoleColor(onRole,themeColor("SLIDER_FILL",THEME.GREEN or Color3.fromRGB(32,202,106)))
		local input=themeColor("SLIDER_BG",themeColor("INPUT",THEME.PANEL or Color3.fromRGB(18,18,24)))
		local muted=themeColor("MUTED",THEME.MUTED or Color3.fromRGB(145,145,155))
		local tickHeight=math.max(6,height-10)
		local softInfo=TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		local snapInfo=TweenInfo.new(0.22,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
		local state=startState and true or false
		local stateValue=makeFusionValue(state)
		local activeTweens={}
		local connections={}

		local function connect(signal,fn)
			local conn=signal:Connect(fn)
			table.insert(connections,conn)
			return conn
		end

		local wrap=New("Frame",{
			Size=UDim2.fromOffset(width,height),
			BackgroundColor3=input,
			BorderSizePixel=0,
			ClipsDescendants=true,
			ZIndex=zIndex,
			ThemeRole="SLIDER_BG",
			CornerRole="Control",
		},parent)
		addCorner(wrap,"Control")

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
			ThemeRole=onRole,
		},fillClip)
		addCorner(fill,"Control")

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
				Visible=false,
				ZIndex=zIndex+2,
				SkipThemeRole=true,
			},tickHolder)
			table.insert(ticks,tick)
		end

		local hit=New("TextButton",{
			BackgroundTransparency=1,
			Text="",
			Size=UDim2.new(1,0,1,0),
			BorderSizePixel=0,
			AutoButtonColor=false,
			Selectable=true,
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

			local currentAccent=themeRoleColor(onRole,themeColor("SLIDER_FILL",THEME.GREEN or Color3.fromRGB(32,202,106)))
			local currentBg=themeColor("SLIDER_BG",themeColor("INPUT",THEME.PANEL or Color3.fromRGB(18,18,24)))
			local currentMuted=themeColor("MUTED",THEME.MUTED or Color3.fromRGB(145,145,155))
			local onTextColor=readableOn(currentAccent)
			local fillSize=state and UDim2.new(1,0,1,0) or UDim2.new(0,0,1,0)
			local fillTransparency=state and 0.18 or 1
			local bgColor=currentBg

			wrap:SetAttribute("ThemeRole","SLIDER_BG")

			if not animate then
				wrap.BackgroundColor3=bgColor
				fillClip.Size=fillSize
				fill.BackgroundColor3=currentAccent
				fill.BackgroundTransparency=fillTransparency
				for _,tick in ipairs(ticks) do
					tick.BackgroundColor3=state and onTextColor or currentMuted
					tick.BackgroundTransparency=state and 0.74 or 0.86
				end
				return
			end

			tween(wrap,softInfo,{BackgroundColor3=bgColor})
			tween(fillClip,snapInfo,{Size=fillSize})
			tween(fill,softInfo,{BackgroundColor3=currentAccent,BackgroundTransparency=fillTransparency})

			for _,tick in ipairs(ticks) do
				tween(tick,softInfo,{BackgroundColor3=state and onTextColor or currentMuted,BackgroundTransparency=state and 0.74 or 0.86})
			end
		end

		local function setState(v,fire,animate)
			local nextState=v and true or false
			local changed=nextState~=state
			state=nextState
			if stateValue then
				stateValue:set(state)
			end
			applyVisuals(animate~=false)

			if fire and changed and onChange then
				onChange(state)
			end
		end

		connect(hit.Activated,function()
			setState(not state,true,true)
		end)

		local function destroySwitch()
			cancelTweens()
			destroyFusionValue(stateValue)
			for _,conn in ipairs(connections) do
				pcall(function()
					conn:Disconnect()
				end)
			end
			table.clear(connections)
			if wrap then
				wrap:Destroy()
			end
		end

		setState(state,false,false)
		return{set=function(v) setState(v,false,false) end,get=function() return state end,Destroy=destroySwitch,destroy=destroySwitch,stateValue=stateValue,wrap=wrap,knob=fill,hit=hit,width=width,height=height}
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
		local z=zIndex or 6
		local expandInfo=TweenInfo.new(0.26,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
		local collapseInfo=TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
		local softInfo=TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

		local state=startState and true or false
		local stateValue=makeFusionValue(state)
		local function visualState(enabled)
			local currentAccent=themeColor("SLIDER_FILL",THEME.GREEN or Color3.fromRGB(74,208,128))
			local currentMuted=themeColor("MUTED",THEME.MUTED or Color3.fromRGB(145,145,155))
			local currentBg=themeColor("SLIDER_BG",themeColor("INPUT",THEME.INPUT or THEME.PANEL or Color3.fromRGB(18,18,24)))

			if enabled then
				return{
					fillSize=UDim2.new(1,0,1,0),
					fillTransparency=0.08,
					fillColor=currentAccent,
					bgColor=currentBg,
					tickColor=currentAccent,
					tickTransparency=0.34,
				}
			end

			return{
				fillSize=UDim2.new(0,0,1,0),
				fillTransparency=1,
				fillColor=currentAccent,
				bgColor=currentBg,
				tickColor=currentMuted,
				tickTransparency=0.86,
			}
		end

		local initialVisuals=visualState(state)

		local switch=New("Frame",{
			AnchorPoint=Vector2.new(1,0.5),
			Size=UDim2.fromOffset(width,height),
			BackgroundTransparency=1,
			BorderSizePixel=0,
			ClipsDescendants=true,
			ZIndex=z,
		},parent)

		local rail=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=UDim2.new(1,0,0,railHeight),
			BackgroundColor3=initialVisuals.bgColor,
			BackgroundTransparency=0.04,
			BorderSizePixel=0,
			ClipsDescendants=true,
			ZIndex=z+1,
			ThemeRole="SLIDER_BG",
		},switch)

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
			BackgroundColor3=initialVisuals.fillColor,
			BackgroundTransparency=initialVisuals.fillTransparency,
			BorderSizePixel=0,
			ZIndex=z+2,
			ThemeRole="SLIDER_FILL",
		},railFillClip)

		local tickHolder=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=UDim2.new(1,-12,1,0),
			BackgroundTransparency=1,
			BorderSizePixel=0,
			ZIndex=z+3,
		},rail)

		local ticks={}
		for _,alpha in ipairs({0.22,0.5,0.78}) do
			local tick=New("Frame",{
				AnchorPoint=Vector2.new(0.5,0.5),
				Position=UDim2.fromScale(alpha,0.5),
				Size=UDim2.fromOffset(1,railHeight-8),
				BackgroundColor3=initialVisuals.tickColor,
				BackgroundTransparency=initialVisuals.tickTransparency,
				BorderSizePixel=0,
				Visible=false,
				ZIndex=z+3,
			},tickHolder)
			table.insert(ticks,tick)
		end

		local hit=New("TextButton",{
			BackgroundTransparency=1,
			BorderSizePixel=0,
			Text="",
			AutoButtonColor=false,
			Selectable=true,
			Size=UDim2.new(1,0,1,0),
			ZIndex=z+10,
		},switch)

		local categoryExpanded=true
		local expandedValue=makeFusionValue(categoryExpanded)
		local activeTweens={}
		local visualTweenCount=0
		local clickConn=nil
		local destroyed=false

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

		local function applyExpandedVisuals(_animate)
			if expandedValue then
				expandedValue:set(categoryExpanded)
			end
		end

		local function applyVisuals(animate)
			cancelTrackedTweens()

			local visuals=visualState(state)

			if not animate then
				applyProps(rail,{BackgroundColor3=visuals.bgColor})
				applyProps(railFillClip,{Size=visuals.fillSize})
				applyProps(railFill,{BackgroundColor3=visuals.fillColor,BackgroundTransparency=visuals.fillTransparency})
				for _,tick in ipairs(ticks) do
					applyProps(tick,{BackgroundColor3=visuals.tickColor,BackgroundTransparency=visuals.tickTransparency})
				end
				return
			end

			local shapeInfo=state and expandInfo or collapseInfo

			playTrackedTween(rail,softInfo,{BackgroundColor3=visuals.bgColor})
			playTrackedTween(railFillClip,shapeInfo,{Size=visuals.fillSize})
			playTrackedTween(railFill,softInfo,{BackgroundColor3=visuals.fillColor,BackgroundTransparency=visuals.fillTransparency})

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
			if stateValue then
				stateValue:set(state)
			end
			applyVisuals((animate~=false) and changed)

			if fire and changed and onChange then
				onChange(state)
			end
		end

		clickConn=hit.Activated:Connect(function()
			setState(not state,true,true)
		end)

		applyVisuals(false)
		applyExpandedVisuals(false)

		local function destroyHeaderSwitch()
			if destroyed then return end
			destroyed=true
			cancelTrackedTweens()
			destroyFusionValue(stateValue)
			destroyFusionValue(expandedValue)
			if clickConn then clickConn:Disconnect() clickConn=nil end
			if switch then
				switch:Destroy()
			end
		end

		return{
			set=function(value)
				setState(value,false,false,true)
			end,
			get=function()
				return state
			end,
			stateValue=stateValue,
			setExpanded=function(value,animate)
				categoryExpanded=value and true or false
				applyExpandedVisuals(animate~=false)
			end,
			expandedValue=expandedValue,
			Destroy=destroyHeaderSwitch,
			destroy=destroyHeaderSwitch,
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

		local strokeTransparency=componentNumber("ControlStrokeTransparency",0.78)
		local stroke=New("UIStroke",{Color=THEME.STROKE,Thickness=math.min(strokeThickness or 1,1),Transparency=strokeTransparency},wrap)
		stroke:SetAttribute("BaseStrokeTransparency",strokeTransparency)

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

		local strokeTransparency=componentNumber("ControlStrokeTransparency",0.78)
		local stroke=New("UIStroke",{Color=THEME.STROKE,Thickness=math.min(strokeThickness or 1,1),Transparency=strokeTransparency},wrap)
		stroke:SetAttribute("BaseStrokeTransparency",strokeTransparency)

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
		local sec=New("Frame",{BackgroundColor3=themeColor("SECTION",THEME.CARD),BackgroundTransparency=componentNumber("SectionBackgroundTransparency",0),BorderSizePixel=0,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,ClipsDescendants=true,ZIndex=4,LayoutOrder=order,ThemeRole="SECTION",CornerRole="Section"},parent)

		addCorner(sec,"Section")
		local sectionStrokeTransparency=componentNumber("SectionStrokeTransparency",0.84)
		local sectionStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=sectionStrokeTransparency},sec)
		sectionStroke:SetAttribute("BaseStrokeTransparency",sectionStrokeTransparency)
		New("UIPadding",{PaddingTop=UDim.new(0,componentNumber("SectionPaddingY",10)),PaddingLeft=UDim.new(0,componentNumber("SectionPaddingX",12)),PaddingRight=UDim.new(0,componentNumber("SectionPaddingX",12)),PaddingBottom=UDim.new(0,componentNumber("SectionPaddingY",10))},sec)
		New("UIListLayout",{Padding=UDim.new(0,componentNumber("SectionGap",6)),SortOrder=Enum.SortOrder.LayoutOrder},sec)

		local collapsed=false
		local headerToggleWidth=componentNumber("HeaderToggleWidth",88)
		local headerToggleHeight=componentNumber("HeaderToggleHeight",30)
		local headerHeight=componentNumber("SectionHeaderHeight",22)
		if options.headerToggle then
			headerHeight=math.max(headerHeight,headerToggleHeight)
		end

		local header=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,headerHeight),ClipsDescendants=true,ZIndex=5,LayoutOrder=1},sec)
		local controls={section=sec}
		local sectionConnections={}
		local sectionDestroyed=false
		local function connectSection(signal,fn)
			local conn=signal:Connect(fn)
			table.insert(sectionConnections,conn)
			return conn
		end
		local function disconnectSectionConnections()
			for _,conn in ipairs(sectionConnections) do
				pcall(function()
					conn:Disconnect()
				end)
			end
			table.clear(sectionConnections)
		end
		local headerButtonOptions=options.headerButton or options.headerAction
		local headerButtonWidth=headerButtonOptions and (headerButtonOptions.width or headerButtonOptions.Width or 104) or 0
		local toggleReserve=options.headerToggle and (headerToggleWidth+8) or 0
		local titleReserve=toggleReserve+(headerButtonOptions and (headerButtonWidth+8) or 0)
		local usesPrefix=componentValue("SectionPrefix",true)~=false
		local titleButton=New("TextButton",{BackgroundTransparency=1,Size=UDim2.new(1,-titleReserve,1,0),Text=(usesPrefix and "[-] " or "")..titleText,Font=componentFont("TitleFont",Enum.Font.GothamBold),TextSize=componentNumber("SectionTitleSize",14),TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,Selectable=true,ZIndex=5},header)
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
			local button=New("TextButton",{Size=UDim2.fromOffset(headerButtonWidth,headerButtonHeight),Position=UDim2.new(1,-headerRightOffset-headerButtonWidth,0.5,-headerButtonHeight/2),BackgroundColor3=normalBg,BorderSizePixel=0,Text=headerButtonOptions.text or headerButtonOptions.Text or "ACTION",Font=componentFont("ControlFont",Enum.Font.GothamMedium),TextSize=11,TextColor3=textColor,AutoButtonColor=false,Selectable=true,ZIndex=6},header)
			local buttonWrap=api.wrapTextButton(button,normalBg,2)
			buttonWrap.BackgroundColor3=normalBg
			if headerButtonOptions.themeRole or headerButtonOptions.ThemeRole then
				buttonWrap:SetAttribute("ThemeRole",headerButtonOptions.themeRole or headerButtonOptions.ThemeRole)
			elseif headerButtonOptions.danger then
				buttonWrap:SetAttribute("ThemeRole","RED")
			elseif not customBg then
				buttonWrap:SetAttribute("ThemeRole","BUTTON")
			end

			connectSection(button.MouseEnter,function()
				buttonWrap.BackgroundColor3=hoverBg
			end)

			connectSection(button.MouseLeave,function()
				buttonWrap.BackgroundColor3=customBg or (headerButtonOptions.danger and THEME.RED) or themeColor("BUTTON",THEME.BG)
			end)

			connectSection(button.Activated,function()
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

		local function destroySection()
			if sectionDestroyed then return end
			sectionDestroyed=true
			cancelBodyTween()

			if controls.toggle and controls.toggle.Destroy then
				pcall(controls.toggle.Destroy)
			end

			disconnectSectionConnections()
		end

		controls.Destroy=destroySection
		controls.destroy=destroySection
		connectSection(sec.Destroying,destroySection)

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

		connectSection(titleButton.Activated,function()
			collapsed=not collapsed
			paint(true)
		end)

		connectSection(sec:GetPropertyChangedSignal("AbsoluteSize"),function()
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
		local boxConnections={}
		local function connectBox(signal,fn)
			local conn=signal:Connect(fn)
			table.insert(boxConnections,conn)
			return conn
		end
		local function cleanupBox()
			for _,conn in ipairs(boxConnections) do
				pcall(function()
					conn:Disconnect()
				end)
			end
			table.clear(boxConnections)
		end

		connectBox(b.Focused,function()
			wrap.BackgroundColor3=themeColor("INPUT",THEME.PANEL)
			stroke.Thickness=1
		end)

		connectBox(b.FocusLost,function()
			wrap.BackgroundColor3=themeColor("INPUT",THEME.PANEL)
			stroke.Thickness=1
		end)

		connectBox(b.Destroying,cleanupBox)

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
		local trackRole=tostring(componentValue("SliderTrackRole","INPUT"))
		local valueRole=tostring(componentValue("SliderValueBoxRole","INPUT"))
		local sliderTweenInfo=TweenInfo.new(componentNumber("SliderTweenTime",0.14),Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		local sliderGlowInfo=TweenInfo.new(componentNumber("SliderGlowTweenTime",0.16),Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		local sliderGlowIdleTransparency=componentNumber("SliderGlowIdleTransparency",0.84)
		local sliderGlowActiveTransparency=componentNumber("SliderGlowActiveTransparency",0.52)
		local sliderGlowStrokeIdleTransparency=componentNumber("SliderGlowStrokeIdleTransparency",0.72)
		local sliderGlowStrokeActiveTransparency=componentNumber("SliderGlowStrokeActiveTransparency",0.24)
		local sliderFillTransparency=componentNumber("SliderFillTransparency",0)
		local sliderTrackTransparency=componentNumber("SliderTrackTransparency",0.04)
		local container=New("Frame",{BackgroundColor3=themeColor(containerRole,themeColor("SECTION",THEME.CARD)),BackgroundTransparency=componentNumber("SliderContainerTransparency",1),BorderSizePixel=0,Size=UDim2.new(1,0,0,rowHeight),ZIndex=5,ThemeRole=containerRole,CornerRole=containerCorner},parent)
		addCorner(container,containerCorner)
		local containerStrokeTransparency=componentNumber("SliderContainerStrokeTransparency",1)
		local containerStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=containerStrokeTransparency},container)
		containerStroke:SetAttribute("BaseStrokeTransparency",containerStrokeTransparency)
		New("TextLabel",{BackgroundTransparency=1,Position=labelPosition,Size=labelSize,Text=labelText,Font=componentFont("ControlFont",s.SliderStyle=="thin" and Enum.Font.Code or Enum.Font.GothamMedium),TextSize=componentNumber("SliderLabelSize",s.SliderStyle=="thin" and 11 or 12),TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=6,Selectable=false},container)

		local track=New("Frame",{AnchorPoint=Vector2.new(0,0.5),Size=UDim2.new(1,-(trackLeft+trackRight),0,sliderHeight),Position=UDim2.new(0,trackLeft,trackYScale,trackYOffset),BackgroundColor3=themeColor(trackRole,THEME.PANEL),BackgroundTransparency=sliderTrackTransparency,BorderSizePixel=0,ClipsDescendants=true,ZIndex=6,ThemeRole=trackRole,CornerRole="Slider"},container)
		addCorner(track,"Slider")
		local trackStrokeTransparency=componentNumber("SliderTrackStrokeTransparency",0.78)
		local trackStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=trackStrokeTransparency},track)
		trackStroke:SetAttribute("BaseStrokeTransparency",trackStrokeTransparency)

		local fillGlow=New("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=themeColor("SLIDER_FILL",THEME.STROKE),BackgroundTransparency=sliderGlowIdleTransparency,BorderSizePixel=0,ClipsDescendants=true,ZIndex=7,ThemeRole="SLIDER_FILL",CornerRole="Slider"},track)
		addCorner(fillGlow,"Slider")

		local fill=New("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=themeColor("SLIDER_FILL",THEME.STROKE),BackgroundTransparency=sliderFillTransparency,BorderSizePixel=0,ClipsDescendants=true,ZIndex=8,ThemeRole="SLIDER_FILL",CornerRole="Slider"},track)
		addCorner(fill,"Slider")
		local fillStroke=New("UIStroke",{Color=themeColor("SLIDER_FILL",THEME.STROKE),Thickness=componentNumber("SliderGlowStrokeThickness",2),Transparency=sliderGlowStrokeIdleTransparency},fill)
		fillStroke:SetAttribute("StrokeRole","Accent")
		fillStroke:SetAttribute("BaseStrokeTransparency",sliderGlowStrokeIdleTransparency)

		local knobVisible=componentValue("SliderKnobVisible",false)==true
		local knobWidth=knobVisible and (s.SliderStyle=="windui" and 10 or (s.SliderStyle=="thin" and 2 or 3)) or 0
		local knob=New("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromOffset(knobWidth,sliderHeight),Position=UDim2.new(0,0,0.5,0),BackgroundColor3=themeColor("SLIDER_FILL",THEME.STROKE),BackgroundTransparency=knobVisible and 0 or 1,BorderSizePixel=0,Visible=knobVisible,ZIndex=9,ThemeRole="SLIDER_FILL",CornerRole="Slider"},track)
		if knobVisible then
			addCorner(knob,"Slider")
		end

		local hit=New("TextButton",{BackgroundTransparency=1,Text="",Size=UDim2.new(1,0,1,0),ZIndex=12,AutoButtonColor=false,Selectable=true},track)
		local valueLabel=New("TextLabel",{BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,1,0),Position=UDim2.fromOffset(0,0),Text=fmtNumber(startVal,decimals),Font=componentFont("ControlFont",Enum.Font.GothamMedium),TextSize=componentNumber("SliderValueTextSize",12),TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=11,Selectable=false},track)
		local valueBoxHeight=componentNumber("SliderValueBoxHeight",math.max(componentNumber("TextBoxHeight",24),sliderHeight))
		local valueBox=New("TextBox",{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-rightPadding,valueBoxYScale,valueBoxYOffset),Size=UDim2.fromOffset(math.max(1,valueBoxWidth),valueBoxHeight),BackgroundColor3=themeColor(valueRole,THEME.PANEL),BackgroundTransparency=componentNumber("SliderValueBoxTransparency",0),BorderSizePixel=0,ClearTextOnFocus=false,Text=fmtNumber(startVal,decimals),Font=componentFont("ControlFont",Enum.Font.GothamMedium),TextSize=componentNumber("SliderValueTextSize",12),TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=6,ThemeRole=valueRole,CornerRole="Control",Selectable=true},container)
		valueBox.Visible=valueBoxVisible
		addCorner(valueBox,"Control")
		local valueStrokeTransparency=componentNumber("SliderValueBoxStrokeTransparency",componentNumber("ControlStrokeTransparency",0.78))
		local valueStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=valueStrokeTransparency},valueBox)
		valueStroke:SetAttribute("BaseStrokeTransparency",valueStrokeTransparency)
		local value=startVal
		local valueState=makeFusionValue(value)
		local dragging=false
		local dragInputType=nil
		local sliderDestroyed=false
		local fillTween=nil
		local fillGlowTween=nil
		local fillGlowFadeTween=nil
		local fillStrokeTween=nil
		local knobTween=nil
		local glowSerial=0
		local connections={}

		local function connect(signal,fn)
			local conn=signal:Connect(fn)
			table.insert(connections,conn)
			return conn
		end

		local function roundTo(v,d)
			local m=10^d
			return math.floor(v*m+0.5)/m
		end

		local function cancelSliderTweens()
			if fillTween then
				fillTween:Cancel()
				fillTween=nil
			end
			if fillGlowTween then
				fillGlowTween:Cancel()
				fillGlowTween=nil
			end
			if fillGlowFadeTween then
				fillGlowFadeTween:Cancel()
				fillGlowFadeTween=nil
			end
			if fillStrokeTween then
				fillStrokeTween:Cancel()
				fillStrokeTween=nil
			end
			if knobTween then
				knobTween:Cancel()
				knobTween=nil
			end
		end

		local function setVisual(v,animate)
			local pct=math.clamp((v-minVal)/(maxVal-minVal),0,1)
			local fillSize=UDim2.new(pct,0,1,0)
			local knobPosition=UDim2.new(pct,0,0.5,0)

			if animate then
				cancelSliderTweens()
				fillTween=TweenService:Create(fill,sliderTweenInfo,{Size=fillSize})
				fillGlowTween=TweenService:Create(fillGlow,sliderTweenInfo,{Size=fillSize,BackgroundTransparency=sliderGlowActiveTransparency})
				fillStrokeTween=TweenService:Create(fillStroke,sliderGlowInfo,{Transparency=sliderGlowStrokeActiveTransparency})
				fillTween:Play()
				fillGlowTween:Play()
				fillStrokeTween:Play()

				if knobVisible then
					knobTween=TweenService:Create(knob,sliderTweenInfo,{Position=knobPosition})
					knobTween:Play()
				end

				glowSerial+=1
				local thisGlow=glowSerial
				task.delay(0.18,function()
					if sliderDestroyed or thisGlow~=glowSerial or not fillGlow.Parent then
						return
					end
					fillGlowFadeTween=TweenService:Create(fillGlow,sliderGlowInfo,{BackgroundTransparency=sliderGlowIdleTransparency})
					fillGlowFadeTween:Play()
					fillStrokeTween=TweenService:Create(fillStroke,sliderGlowInfo,{Transparency=sliderGlowStrokeIdleTransparency})
					fillStrokeTween:Play()
				end)
			else
				cancelSliderTweens()
				fill.Size=fillSize
				fillGlow.Size=fillSize
				fillGlow.BackgroundTransparency=sliderGlowIdleTransparency
				fillStroke.Transparency=sliderGlowStrokeIdleTransparency
			end

			if knobVisible then
				knob.Position=knobPosition
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

		local function valueFromInput(input)
			if input and input.Position then
				return valueFromMouseX(input.Position.X)
			end

			return valueFromMouseX(UIS:GetMouseLocation().X)
		end

		local function setValue(v,fire)
			v=roundTo(math.clamp(tonumber(v) or value,minVal,maxVal),decimals)
			value=v
			if valueState then
				valueState:set(value)
			end
			setVisual(v,fire~=false)

			if fire and onChange then
				onChange(v)
			end
		end

		local function keyboardStep()
			local step=10^(-(tonumber(decimals) or 0))
			if UIS:IsKeyDown(Enum.KeyCode.LeftShift) or UIS:IsKeyDown(Enum.KeyCode.RightShift) then
				step*=10
			elseif UIS:IsKeyDown(Enum.KeyCode.LeftControl) or UIS:IsKeyDown(Enum.KeyCode.RightControl) then
				step/=10
			end

			return math.max(step,10^-4)
		end

		local function handleStep(input)
			if input.KeyCode==Enum.KeyCode.Left or input.KeyCode==Enum.KeyCode.Down or input.KeyCode==Enum.KeyCode.DPadLeft or input.KeyCode==Enum.KeyCode.DPadDown then
				setValue(value-keyboardStep(),true)
				return true
			elseif input.KeyCode==Enum.KeyCode.Right or input.KeyCode==Enum.KeyCode.Up or input.KeyCode==Enum.KeyCode.DPadRight or input.KeyCode==Enum.KeyCode.DPadUp then
				setValue(value+keyboardStep(),true)
				return true
			end

			return false
		end

		local function beginDrag(i)
			if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
				dragging=true
				dragInputType=i.UserInputType
				valueBox:ReleaseFocus()
				setValue(valueFromInput(i),true)
			end
		end

		local function handleInputBegan(input)
			if handleStep(input) then
				return
			end

			beginDrag(input)
		end

		connect(hit.InputBegan,handleInputBegan)
		connect(track.InputBegan,handleInputBegan)
		connect(fill.InputBegan,handleInputBegan)
		connect(valueLabel.InputBegan,handleInputBegan)

		connect(UIS.InputChanged,function(i)
			if not dragging then
				return
			end

			if dragInputType==Enum.UserInputType.Touch then
				if i.UserInputType==Enum.UserInputType.Touch then
					setValue(valueFromInput(i),true)
				end
			elseif i.UserInputType==Enum.UserInputType.MouseMovement then
				setValue(valueFromInput(i),true)
			end
		end)

		connect(UIS.InputEnded,function(i)
			if i.UserInputType==dragInputType or i.UserInputType==Enum.UserInputType.MouseButton1 then
				dragging=false
				dragInputType=nil
			end
		end)

		connect(valueBox.FocusLost,function()
			setValue(valueBox.Text,true)
		end)

		local function destroySlider()
			sliderDestroyed=true
			dragging=false
			dragInputType=nil
			cancelSliderTweens()
			destroyFusionValue(valueState)
			for _,conn in ipairs(connections) do
				pcall(function()
					conn:Disconnect()
				end)
			end
			table.clear(connections)
		end

		setValue(startVal,false)
		return{set=function(v) setValue(v,false) end,get=function() return value end,Destroy=destroySlider,destroy=destroySlider,valueState=valueState,box=valueBox,valueLabel=valueLabel,fill=fill,fillGlow=fillGlow,knob=knob,track=track}
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
