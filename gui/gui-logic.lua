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
		local s=shape()
		local c=components()
		local toggleStyle=tostring(c.ToggleStyle or "switch"):lower()
		local checkbox=toggleStyle=="checkbox"
		local rounded=(tonumber(s.ControlRadius) or 0)>0 and not checkbox
		width=width or componentNumber("ToggleWidth",48)
		height=height or componentNumber("ToggleHeight",20)
		knobSize=knobSize or componentNumber("ToggleKnobSize",16)
		pad=pad or componentNumber("TogglePad",2)
		zIndex=zIndex or 6

		local wrap=New("Frame",{Size=UDim2.fromOffset(width,height),BackgroundColor3=themeColor("INPUT",Color3.fromRGB(0,0,0)),BorderSizePixel=0,ClipsDescendants=rounded or toggleStyle=="pill",ZIndex=zIndex,ThemeRole="INPUT",CornerRole="Control"},parent)
		addCorner(wrap,"Control")
		local wrapStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=componentNumber("ToggleStrokeTransparency",0.58)},wrap)
		wrapStroke:SetAttribute("BaseStrokeTransparency",componentNumber("ToggleStrokeTransparency",0.58))

		local knob=New("Frame",{Size=UDim2.fromOffset(knobSize,knobSize),Position=UDim2.fromOffset(pad,pad),BackgroundColor3=readableOn(themeColor("INPUT",Color3.fromRGB(0,0,0))),BorderSizePixel=0,ClipsDescendants=rounded or toggleStyle=="pill",ZIndex=zIndex+1,SkipThemeRole=true,CornerRole="Control"},wrap)
		addCorner(knob,"Control")
		local knobStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=componentNumber("ToggleStrokeTransparency",0.58)},knob)
		knobStroke:SetAttribute("BaseStrokeTransparency",componentNumber("ToggleStrokeTransparency",0.58))
		local hit=New("TextButton",{BackgroundTransparency=1,Text="",Size=UDim2.new(1,0,1,0),BorderSizePixel=0,AutoButtonColor=false,ZIndex=zIndex+2},wrap)

		local state=startState and true or false

		local function paint()
			local ti=TweenInfo.new(0.12,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
			local onRole=tostring(c.ToggleOnRole or "SLIDER_FILL")
			local offRole=tostring(c.ToggleOffRole or "RED")
			local bg=state and themeRoleColor(onRole,themeColor("SLIDER_FILL",THEME.GREEN)) or themeRoleColor(offRole,THEME.RED)
			local pos=state and UDim2.fromOffset(width-knobSize-pad,pad) or UDim2.fromOffset(pad,pad)
			local knobBg=readableOn(bg)

			if checkbox then
				bg=themeColor("INPUT",Color3.fromRGB(0,0,0))
				pos=UDim2.fromOffset(pad,pad)
				knobBg=state and themeRoleColor(onRole,themeColor("SLIDER_FILL",THEME.GREEN)) or bg
				knob.Visible=state
			elseif toggleStyle=="block" then
				bg=state and bg or themeColor("INPUT",Color3.fromRGB(0,0,0))
				pos=state and UDim2.fromOffset(width-knobSize-pad,pad) or UDim2.fromOffset(pad,pad)
				knobBg=state and readableOn(bg) or themeColor("MUTED",Color3.fromRGB(180,180,180))
			end

			wrap:SetAttribute("ThemeRole",state and (checkbox and "INPUT" or onRole) or ((toggleStyle=="block" or checkbox) and "INPUT" or offRole))
			knob:SetAttribute("ThemeRole",nil)

			TweenService:Create(wrap,ti,{BackgroundColor3=bg}):Play()
			TweenService:Create(knob,ti,{Position=pos,BackgroundColor3=knobBg}):Play()
		end

		local function setState(v,fire)
			state=v and true or false
			paint()

			if fire and onChange then
				onChange(state)
			end
		end

		hit.InputBegan:Connect(function(i)
			if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
				setState(not state,true)
			end
		end)

		setState(state,false)
		return{set=function(v) setState(v,false) end,get=function() return state end,wrap=wrap,knob=knob,hit=hit,width=width,height=height}
	end

	local function createHeaderSwitch(parent,startState,onChange,zIndex)
		local width,height=34,34
		local minimizedSize=16
		local expandedSize=23
		zIndex=zIndex or 6

		local switch=New("Frame",{
			AnchorPoint=Vector2.new(1,0.5),
			Size=UDim2.fromOffset(width,height),
			BackgroundTransparency=1,
			BorderSizePixel=0,
			ZIndex=zIndex,
		},parent)

		local holder=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=UDim2.fromOffset(28,28),
			BackgroundColor3=THEME.MUTED,
			BackgroundTransparency=0.9,
			BorderSizePixel=0,
			ZIndex=zIndex+1,
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
			ZIndex=zIndex+2,
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
			ZIndex=zIndex+3,
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
			ZIndex=zIndex+4,
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
				if clickConn then
					clickConn:Disconnect()
					clickConn=nil
				end

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
		local headerToggleWidth=34
		local headerToggleHeight=34
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
			controls.toggle.wrap.Position=UDim2.new(1,-controls.toggle.width,0.5,-controls.toggle.height/2)
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
