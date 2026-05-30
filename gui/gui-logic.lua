local GuiLogic={}

function GuiLogic.new(ctx)
	local New=ctx.New
	local THEME=ctx.THEME
	local UIS=ctx.UIS
	local TweenService=ctx.TweenService
	local fmtNumber=ctx.fmtNumber
	local BOX_WRAPPERS=ctx.BOX_WRAPPERS or setmetatable({}, {__mode="k"})
	local BUTTON_WRAPPERS=ctx.BUTTON_WRAPPERS or setmetatable({}, {__mode="k"})

	local api={}
	local WRAP_INSET=0

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
		wrap.Size=insetSize(box.Size)
		wrap.Position=insetPosition(box.Position)
		wrap.AnchorPoint=box.AnchorPoint
		wrap.Visible=box.Visible
		wrap.ZIndex=math.max((box.ZIndex or 2)-1,1)
		wrap.Parent=parent

		local stroke=New("UIStroke",{Color=THEME.STROKE,Thickness=strokeThickness or 2,Transparency=0},wrap)

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
		wrap.Size=insetSize(button.Size)
		wrap.Position=insetPosition(button.Position)
		wrap.AnchorPoint=button.AnchorPoint
		wrap.Visible=button.Visible
		wrap.ZIndex=math.max((button.ZIndex or 2)-1,1)
		wrap.Parent=parent

		local stroke=New("UIStroke",{Color=THEME.STROKE,Thickness=strokeThickness or 2,Transparency=0},wrap)

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

	function api.makeSection(parent,order,titleText,subtitleText)
		local sec=New("Frame",{BackgroundColor3=THEME.CARD,BorderSizePixel=0,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,ZIndex=4,LayoutOrder=order},parent)

		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},sec)
		New("UIPadding",{PaddingTop=UDim.new(0,10),PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,12),PaddingBottom=UDim.new(0,10)},sec)
		New("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},sec)

		local collapsed=false
		local titleButton=New("TextButton",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,20),Text="[-] "..titleText,Font=Enum.Font.GothamMedium,TextSize=14,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,ZIndex=5,LayoutOrder=1},sec)

		local subtitleLabel=nil
		if subtitleText and subtitleText~="" then
			subtitleLabel=New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,14),Text=subtitleText,Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=5,LayoutOrder=2},sec)
		end

		local body=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,ZIndex=5,LayoutOrder=3,ClipsDescendants=true},sec)
		New("UIPadding",{PaddingTop=UDim.new(0,2),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,2),PaddingBottom=UDim.new(0,2)},body)
		local bodyLayout=New("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},body)
		local bodyTween=nil
		local lastBodyHeight=0

		local function getBodyHeight()
			local h=math.max(body.AbsoluteSize.Y,bodyLayout.AbsoluteContentSize.Y,lastBodyHeight)
			return math.max(0,math.floor(h+0.5))
		end

		local function tweenTitle()
			titleButton.TextTransparency=0.18
			TweenService:Create(titleButton,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency=0}):Play()
			TweenService:Create(sec,TweenInfo.new(0.14,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3=collapsed and THEME.PANEL or THEME.CARD}):Play()
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
			body.Visible=true
			body.AutomaticSize=Enum.AutomaticSize.None
			body.Size=UDim2.new(1,0,0,lastBodyHeight)

			if not animate then
				body.Visible=false
				body.Size=UDim2.new(1,0,0,0)
				setSubtitleVisible(false,false)
				return
			end

			setSubtitleVisible(false,true)
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
			body.Visible=true
			body.AutomaticSize=Enum.AutomaticSize.None
			body.Size=UDim2.new(1,0,0,0)
			setSubtitleVisible(true,animate)

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
			if not collapsed then
				lastBodyHeight=getBodyHeight()
			end
		end)

		paint(false)
		return body
	end

	function api.makeBox(parent,w,txt,placeholder)
		local b=New("TextBox",{Size=UDim2.fromOffset(w,28),BackgroundColor3=THEME.PANEL,BorderSizePixel=0,ClearTextOnFocus=false,Text=txt,PlaceholderText=placeholder or "",Font=Enum.Font.Gotham,TextSize=13,TextColor3=THEME.TEXT,PlaceholderColor3=THEME.MUTED,ZIndex=6},parent)
		local wrap,stroke=api.wrapTextBox(b,THEME.PANEL,2)

		b.Focused:Connect(function()
			wrap.BackgroundColor3=Color3.fromRGB(43,43,43)
			stroke.Thickness=2
		end)

		b.FocusLost:Connect(function()
			wrap.BackgroundColor3=THEME.PANEL
			stroke.Thickness=2
		end)

		return b
	end

	function api.buildSlider(parent,labelText,minVal,maxVal,startVal,decimals,onChange)
		local container=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,32),ZIndex=5},parent)
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.fromOffset(28,32),Text=labelText,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},container)

		local valueLabel=New("TextBox",{BackgroundColor3=THEME.BG,BorderSizePixel=0,ClearTextOnFocus=true,Size=UDim2.fromOffset(72,28),Position=UDim2.new(1,-72,0.5,-14),Text=fmtNumber(startVal,decimals),Font=Enum.Font.Gotham,TextSize=13,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=6},container)
		local valueWrap,valueStroke=api.wrapTextBox(valueLabel,THEME.BG,2)

		local track=New("Frame",{Size=UDim2.new(1,-118,0,8),Position=UDim2.new(0,34,0.5,-4),BackgroundColor3=THEME.BG,BorderSizePixel=0,ZIndex=6},container)
		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},track)

		local fill=New("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=Color3.fromRGB(45,45,45),BorderSizePixel=0,ZIndex=7},track)
		local knob=New("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromOffset(14,14),Position=UDim2.new(0,0,0.5,0),BackgroundColor3=THEME.MUTED,BorderSizePixel=0,ZIndex=8},track)
		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},knob)

		local hit=New("TextButton",{BackgroundTransparency=1,Text="",Size=UDim2.new(1,0,1,8),Position=UDim2.new(0,0,-0.5,-4),ZIndex=9,AutoButtonColor=false},track)
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

		hit.InputBegan:Connect(function(i)
			if i.UserInputType==Enum.UserInputType.MouseButton1 then
				dragging=true
				setValue(valueFromMouseX(UIS:GetMouseLocation().X),true)
			end
		end)

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

		valueLabel.Focused:Connect(function()
			valueWrap.BackgroundColor3=Color3.fromRGB(43,43,43)
			valueStroke.Thickness=2
		end)

		valueLabel.FocusLost:Connect(function()
			valueWrap.BackgroundColor3=THEME.BG
			valueStroke.Thickness=2

			local n=tonumber(valueLabel.Text)
			if n then
				setValue(n,true)
			else
				valueLabel.Text=fmtNumber(value,decimals)
			end
		end)

		setValue(startVal,false)
		return{set=function(v) setValue(v,false) end,get=function() return value end,box=valueLabel,fill=fill,knob=knob,track=track}
	end

	function api.buildToggleRow(parent,labelText,startState,onChange)
		local row=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,30),ZIndex=5},parent)
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-64,1,0),Text=labelText,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},row)

		local wrap=New("Frame",{Size=UDim2.fromOffset(48,20),Position=UDim2.new(1,-48,0.5,-10),BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,ClipsDescendants=false,ZIndex=6},row)
		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},wrap)

		local knob=New("Frame",{Size=UDim2.fromOffset(16,16),Position=UDim2.fromOffset(2,2),BackgroundColor3=THEME.TEXT,BorderSizePixel=0,ClipsDescendants=false,ZIndex=7},wrap)
		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},knob)

		local state=startState and true or false

		local function paint()
			local ti=TweenInfo.new(0.12,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
			local bg=state and THEME.GREEN or THEME.CARD
			local pos=state and UDim2.new(1,-18,0,2) or UDim2.fromOffset(2,2)

			TweenService:Create(wrap,ti,{BackgroundColor3=bg}):Play()
			TweenService:Create(knob,ti,{Position=pos,BackgroundColor3=THEME.TEXT}):Play()
		end

		local function setState(v,fire)
			state=v and true or false
			paint()

			if fire and onChange then
				onChange(state)
			end
		end

		wrap.InputBegan:Connect(function(i)
			if i.UserInputType==Enum.UserInputType.MouseButton1 then
				setState(not state,true)
			end
		end)

		knob.InputBegan:Connect(function(i)
			if i.UserInputType==Enum.UserInputType.MouseButton1 then
				setState(not state,true)
			end
		end)

		setState(state,false)
		return{set=function(v) setState(v,false) end,get=function() return state end}
	end

	api.BOX_WRAPPERS=BOX_WRAPPERS
	api.BUTTON_WRAPPERS=BUTTON_WRAPPERS

	return api
end

return GuiLogic
