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

	local function shape()
		local lib=currentLib()

		if type(getUILibRuntimeStyle)=="function" then
			local ok,style=pcall(getUILibRuntimeStyle,lib)
			if ok and type(style)=="table" and type(style.Shape)=="table" then
				return style.Shape
			end
		end

		if lib=="windui" then
			return{WindowRadius=12,SectionRadius=10,ControlRadius=8,SliderRadius=10,SliderHeight=24,SliderStyle="windui"}
		elseif lib=="rayfield" then
			return{WindowRadius=6,SectionRadius=5,ControlRadius=4,SliderRadius=4,SliderHeight=26,SliderStyle="rayfield"}
		elseif lib=="linoria" then
			return{WindowRadius=3,SectionRadius=2,ControlRadius=2,SliderRadius=2,SliderHeight=22,SliderStyle="thin"}
		elseif lib=="obsidian" then
			return{WindowRadius=9,SectionRadius=7,ControlRadius=6,SliderRadius=6,SliderHeight=24,SliderStyle="glow"}
		elseif lib=="visual" then
			return{WindowRadius=8,SectionRadius=7,ControlRadius=6,SliderRadius=6,SliderHeight=28,SliderStyle="pill"}
		end

		return{WindowRadius=0,SectionRadius=0,ControlRadius=0,SliderRadius=0,SliderHeight=26,SliderStyle="original"}
	end

	local function addCorner(obj,role)
		if not obj then return nil end

		obj:SetAttribute("CornerRole",role or "Control")
		return New("UICorner",{CornerRadius=UDim.new(0,0)},obj)
	end

	local function themeColor(role,fallback)
		return THEME[role] or fallback
	end

	local function createSwitch(parent,startState,onChange,width,height,knobSize,pad,zIndex)
		width=width or 48
		height=height or 20
		knobSize=knobSize or 16
		pad=pad or 2
		zIndex=zIndex or 6

		local wrap=New("Frame",{Size=UDim2.fromOffset(width,height),BackgroundColor3=themeColor("INPUT",Color3.fromRGB(0,0,0)),BorderSizePixel=0,ClipsDescendants=false,ZIndex=zIndex,ThemeRole="INPUT",CornerRole="Control"},parent)
		addCorner(wrap,"Control")
		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.58},wrap)

		local knob=New("Frame",{Size=UDim2.fromOffset(knobSize,knobSize),Position=UDim2.fromOffset(pad,pad),BackgroundColor3=THEME.STROKE,BorderSizePixel=0,ClipsDescendants=false,ZIndex=zIndex+1,ThemeRole="STROKE",CornerRole="Control"},wrap)
		addCorner(knob,"Control")
		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.55},knob)
		local hit=New("TextButton",{BackgroundTransparency=1,Text="",Size=UDim2.new(1,0,1,0),BorderSizePixel=0,AutoButtonColor=false,ZIndex=zIndex+2},wrap)

		local state=startState and true or false

		local function paint()
			local ti=TweenInfo.new(0.12,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
			local bg=state and themeColor("SLIDER_FILL",THEME.GREEN) or THEME.RED
			local pos=state and UDim2.fromOffset(width-knobSize-pad,pad) or UDim2.fromOffset(pad,pad)
			wrap:SetAttribute("ThemeRole",state and "SLIDER_FILL" or "RED")

			TweenService:Create(wrap,ti,{BackgroundColor3=bg}):Play()
			TweenService:Create(knob,ti,{Position=pos,BackgroundColor3=THEME.STROKE}):Play()
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
		return{set=function(v) setState(v,false) end,get=function() return state end,wrap=wrap,knob=knob,hit=hit}
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

		local stroke=New("UIStroke",{Color=THEME.STROKE,Thickness=math.min(strokeThickness or 1,1),Transparency=0.55},wrap)

		box.Parent=wrap
		box.BackgroundTransparency=1
		box.BorderSizePixel=0
		box.Position=UDim2.new(0,4,0,0)
		box.Size=UDim2.new(1,-8,1,0)
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

		local stroke=New("UIStroke",{Color=THEME.STROKE,Thickness=math.min(strokeThickness or 1,1),Transparency=0.55},wrap)

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
		local descriptionOnly=options.compact==true or options.headerOnly==true
		local hasBody=not descriptionOnly
		local sec=New("Frame",{BackgroundColor3=themeColor("SECTION",THEME.CARD),BorderSizePixel=0,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,ZIndex=4,LayoutOrder=order,ThemeRole="SECTION",CornerRole="Section"},parent)

		addCorner(sec,"Section")
		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.62},sec)
		New("UIPadding",{PaddingTop=UDim.new(0,10),PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,12),PaddingBottom=UDim.new(0,10)},sec)
		New("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},sec)

		local collapsed=false
		local header=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),ZIndex=5,LayoutOrder=1},sec)
		local controls={section=sec}
		local headerButtonOptions=options.headerButton or options.headerAction
		local headerButtonWidth=headerButtonOptions and (headerButtonOptions.width or headerButtonOptions.Width or 104) or 0
		local titleReserve=(options.headerToggle and 58 or 0)+(headerButtonOptions and (headerButtonWidth+8) or 0)
		local titleButton=New("TextButton",{BackgroundTransparency=1,Size=UDim2.new(1,-titleReserve,1,0),Text="[-] "..titleText,Font=Enum.Font.GothamBold,TextSize=14,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,ZIndex=5},header)
		local headerRightOffset=0

		if options.headerToggle then
			local toggleOptions=options.headerToggle
			controls.toggle=createSwitch(header,toggleOptions.startState,toggleOptions.onChange,48,20,16,2,6)
			controls.toggle.wrap.Position=UDim2.new(1,-48,0.5,-10)
			headerRightOffset=56
		end

		if headerButtonOptions then
			local customBg=headerButtonOptions.backgroundColor or headerButtonOptions.BackgroundColor3
			local normalBg=customBg or (headerButtonOptions.danger and THEME.RED) or themeColor("BUTTON",THEME.BG)
			local hoverBg=headerButtonOptions.hoverBackgroundColor or headerButtonOptions.HoverBackgroundColor3 or (headerButtonOptions.danger and Color3.fromRGB(255,124,118)) or THEME.CARD
			local textColor=headerButtonOptions.textColor or headerButtonOptions.TextColor3 or (headerButtonOptions.danger and Color3.fromRGB(0,0,0)) or THEME.TEXT
			local button=New("TextButton",{Size=UDim2.fromOffset(headerButtonWidth,22),Position=UDim2.new(1,-headerRightOffset-headerButtonWidth,0.5,-11),BackgroundColor3=normalBg,BorderSizePixel=0,Text=headerButtonOptions.text or headerButtonOptions.Text or "ACTION",Font=Enum.Font.GothamMedium,TextSize=11,TextColor3=textColor,AutoButtonColor=false,ZIndex=6},header)
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
			subtitleLabel=New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,14),Text=subtitleText,Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=5,LayoutOrder=2},sec)
		end

		local body=nil
		local bodyLayout=nil
		if hasBody then
			body=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,Visible=true,ZIndex=5,LayoutOrder=3,ClipsDescendants=true},sec)
			New("UIPadding",{PaddingTop=UDim.new(0,2),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,2),PaddingBottom=UDim.new(0,2)},body)
			bodyLayout=New("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},body)
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
			titleButton.Text=(collapsed and "[+] " or "[-] ")..titleText
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
		local b=New("TextBox",{Size=UDim2.fromOffset(w,28),BackgroundColor3=themeColor("INPUT",THEME.PANEL),BorderSizePixel=0,ClearTextOnFocus=false,Text=txt,PlaceholderText=placeholder or "",Font=Enum.Font.Gotham,TextSize=13,TextColor3=THEME.TEXT,PlaceholderColor3=THEME.MUTED,ZIndex=6,ThemeRole="INPUT"},parent)
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
		local sliderHeight=s.SliderHeight or 26
		local rowHeight=math.max(38,sliderHeight+14)
		local trackWidth=s.SliderStyle=="thin" and 180 or 206
		local labelReserve=trackWidth+28

		local container=New("Frame",{BackgroundColor3=themeColor("SECTION",THEME.CARD),BackgroundTransparency=0.12,BorderSizePixel=0,Size=UDim2.new(1,0,0,rowHeight),ZIndex=5,ThemeRole="SECTION",CornerRole="Section"},parent)
		addCorner(container,"Section")
		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.65},container)
		New("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(12,0),Size=UDim2.new(1,-labelReserve,1,0),Text=labelText,Font=s.SliderStyle=="thin" and Enum.Font.Code or Enum.Font.GothamMedium,TextSize=s.SliderStyle=="thin" and 11 or 12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},container)

		local track=New("Frame",{AnchorPoint=Vector2.new(1,0.5),Size=UDim2.fromOffset(trackWidth,sliderHeight),Position=UDim2.new(1,-8,0.5,0),BackgroundColor3=themeColor("SLIDER_BG",THEME.PANEL),BorderSizePixel=0,ZIndex=6,ThemeRole="SLIDER_BG",CornerRole="Slider"},container)
		addCorner(track,"Slider")
		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.55},track)

		local fill=New("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=themeColor("SLIDER_FILL",THEME.STROKE),BorderSizePixel=0,ZIndex=7,ThemeRole="SLIDER_FILL",CornerRole="Slider"},track)
		addCorner(fill,"Slider")

		local knobWidth=s.SliderStyle=="windui" and 10 or (s.SliderStyle=="thin" and 2 or 3)
		local knob=New("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromOffset(knobWidth,sliderHeight),Position=UDim2.new(0,0,0.5,0),BackgroundColor3=themeColor("SLIDER_FILL",THEME.STROKE),BorderSizePixel=0,ZIndex=8,ThemeRole="SLIDER_FILL",CornerRole="Slider"},track)
		addCorner(knob,"Slider")

		local hit=New("TextButton",{BackgroundTransparency=1,Text="",Size=UDim2.new(1,0,1,0),ZIndex=10,AutoButtonColor=false},track)
		local valueLabel=New("TextLabel",{BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,1,0),Position=UDim2.fromOffset(0,0),Text=fmtNumber(startVal,decimals),Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=9},track)
		local value=startVal
		local dragging=false

		local function roundTo(v,d)
			local m=10^d
			return math.floor(v*m+0.5)/m
		end

		local function setVisual(v)
			local pct=math.clamp((v-minVal)/(maxVal-minVal),0,1)
			fill.Size=UDim2.new(pct,0,1,0)
			knob.Position=UDim2.new(pct,0,0.5,0)
			valueLabel.Text=fmtNumber(v,decimals)
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

		setValue(startVal,false)
		return{set=function(v) setValue(v,false) end,get=function() return value end,box=valueLabel,fill=fill,knob=knob,track=track}
	end

	function api.buildToggleRow(parent,labelText,startState,onChange)
		local row=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,30),ZIndex=5},parent)
		local label=New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-64,1,0),Text=labelText,Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},row)
		if label.Text=="" then
			label.Visible=false
		end

		local control=createSwitch(row,startState,onChange,48,20,16,2,6)
		control.wrap.Position=UDim2.new(1,-48,0.5,-10)
		return control
	end

	api.BOX_WRAPPERS=BOX_WRAPPERS
	api.BUTTON_WRAPPERS=BUTTON_WRAPPERS

	return api
end

return GuiLogic
