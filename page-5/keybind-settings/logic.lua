local KeybindSettings={}

local UIS=game:GetService("UserInputService")
local TweenService=game:GetService("TweenService")
local TextService=game:GetService("TextService")

local function defaultBindingRows(ctx)
	local state=ctx.State or {}
	ctx.State=state
	local function ensure(name)
		if state[name]==nil then state[name]=Enum.KeyCode.Unknown end
	end
	ensure("TOGGLE_UI_KEY")
	ensure("TOGGLE_HB_KEY")
	ensure("TOGGLE_JB_KEY")
	ensure("TOGGLE_AB_KEY")
	ensure("TOGGLE_ACTION_KEY")
	ensure("TOGGLE_SPEED_KEY")
	return{
		{label="Toggle open / hide GUI",key="TOGGLE_UI_KEY"},
		{label="Hitbox Toggle",key="TOGGLE_HB_KEY"},
		{label="Jump Boost Toggle",key="TOGGLE_JB_KEY"},
		{label="Always Boost Toggle",key="TOGGLE_AB_KEY"},
		{label="ESP Toggle",key="TOGGLE_ACTION_KEY"},
		{label="Speed Toggle",key="TOGGLE_SPEED_KEY"},
	}
end

local function getBinding(ctx,item)
	if item.get then return item.get() end
	if item.key and ctx.State then return ctx.State[item.key] end
	return Enum.KeyCode.Unknown
end

local function setBinding(ctx,item,value)
	if item.set then
		item.set(value)
	elseif item.key and ctx.State then
		ctx.State[item.key]=value
	end
end

function KeybindSettings.new(ctx,bindSection)
	local New=ctx.New
	local THEME=ctx.THEME
	local bindingToLabel=ctx.bindingToLabel
	local inputToBinding=ctx.inputToBinding
	local wrapTextButton=ctx.wrapTextButton
	local placeWrappedButton=ctx.placeWrappedButton
	local setWrappedButtonBg=ctx.setWrappedButtonBg

	local api={}
	local bindRows={}
	local activeCapture=nil
	local refreshAll=nil
	local inputConn=nil
	local suppressMouseButton1ClickUntil=0

	function api.GetActiveCapture()
		return activeCapture
	end

	function api.SetRefreshAll(fn)
		refreshAll=fn
	end

	local function requestRefresh()
		api.Refresh()
		if refreshAll then refreshAll() end
	end

	local function finishCapture(binding)
		if not activeCapture then return false end

		local cap=activeCapture
		if binding~=nil then
			if binding=="MouseButton1" then
				suppressMouseButton1ClickUntil=os.clock()+0.25
			end

			cap.setter(binding)
		end

		activeCapture=nil
		requestRefresh()
		return true
	end

	function api.ShouldSuppressMouseButton1Click()
		return os.clock()<suppressMouseButton1ClickUntil
	end

	function api.CaptureInput(input)
		local binding=inputToBinding(input)
		if binding==nil then return false end
		return finishCapture(binding)
	end

	function api.MakeBindButton(parent,x,y,w)
		local normalBg=THEME.BUTTON or THEME.BG
		local btn=New("TextButton",{BackgroundColor3=normalBg,BorderSizePixel=0,Position=UDim2.fromOffset(x,y),Size=UDim2.fromOffset(w or 122,28),Text="NIL",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.TEXT,AutoButtonColor=false,ZIndex=6,ThemeRole="BUTTON"},parent)
		local wrap=wrapTextButton(btn,normalBg,2)
		wrap:SetAttribute("ThemeRole","BUTTON")

		btn.MouseEnter:Connect(function()
			if activeCapture and activeCapture.button==btn then return end
			wrap.BackgroundColor3=THEME.CARD
		end)

		btn.MouseLeave:Connect(function()
			if activeCapture and activeCapture.button==btn then return end
			wrap.BackgroundColor3=THEME.BUTTON or THEME.BG
		end)

		return btn
	end

	local function setButtonCaptureState(btn,waiting)
		btn.Text=waiting and"PRESS..." or btn.Text
		setWrappedButtonBg(btn,THEME.BUTTON or THEME.BG)
		btn.TextColor3=THEME.TEXT
	end

	function api.StartCapture(btn,getter,setter)
		if activeCapture and activeCapture.button and activeCapture.button~=btn then
			setWrappedButtonBg(activeCapture.button,THEME.BUTTON or THEME.BG)
			activeCapture.button.TextColor3=THEME.TEXT
			if activeCapture.getter then
				activeCapture.button.Text=bindingToLabel(activeCapture.getter())
			end
		end

		activeCapture={button=btn,getter=getter,setter=setter}
		setButtonCaptureState(btn,true)
	end

	function api.CancelCapture()
		activeCapture=nil
		requestRefresh()
	end

	function api.AddBindRow(label,getter,setter)
		local row=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,30),ZIndex=5},bindSection)

		local labelButton=New("TextButton",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,-138,1,0),
			Position=UDim2.fromOffset(0,0),
			Text=label,
			Font=Enum.Font.GothamMedium,
			TextSize=12,
			TextColor3=THEME.TEXT,
			TextXAlignment=Enum.TextXAlignment.Left,
			AutoButtonColor=false,
			ZIndex=6,
			TextRole="TEXT",
		},row)

		local strike=New("Frame",{
			AnchorPoint=Vector2.new(0,0.5),
			BackgroundColor3=THEME.STROKE or THEME.GREEN,
			BackgroundTransparency=0.18,
			BorderSizePixel=0,
			Position=UDim2.new(0,0,0.5,0),
			Size=UDim2.new(0,0,0,1),
			ZIndex=7,
			ThemeRole="STROKE",
		},labelButton)

		local hoverTween=nil
		local function strikeWidth()
			local measured=TextService:GetTextSize(
				tostring(labelButton.Text or ""),
				labelButton.TextSize,
				labelButton.Font,
				Vector2.new(1000,math.max(labelButton.AbsoluteSize.Y,30))
			).X

			if labelButton.AbsoluteSize.X>0 then
				measured=math.min(measured,labelButton.AbsoluteSize.X)
			end

			return math.max(0,math.floor(measured+0.5))
		end

		local function tweenLabel(props)
			if hoverTween then
				hoverTween:Cancel()
			end
			hoverTween=TweenService:Create(labelButton,TweenInfo.new(0.14,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),props)
			hoverTween:Play()
		end

		labelButton.MouseEnter:Connect(function()
			strike.BackgroundColor3=THEME.STROKE or THEME.GREEN
			tweenLabel({TextColor3=THEME.STROKE or THEME.GREEN})
			TweenService:Create(strike,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
				Size=UDim2.fromOffset(strikeWidth(),1),
				BackgroundTransparency=0.08,
			}):Play()
		end)

		labelButton.MouseLeave:Connect(function()
			tweenLabel({TextColor3=THEME.TEXT})
			TweenService:Create(strike,TweenInfo.new(0.14,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
				Size=UDim2.fromOffset(0,1),
				BackgroundTransparency=0.18,
			}):Play()
		end)

		labelButton.Activated:Connect(function()
			if activeCapture then
				activeCapture=nil
			end
			setter(Enum.KeyCode.Unknown)
			requestRefresh()
		end)

		local btn=api.MakeBindButton(row,0,0,122)
		placeWrappedButton(btn,UDim2.new(1,-122,0.5,-14))

		btn.Activated:Connect(function()
			if os.clock()<suppressMouseButton1ClickUntil then
				return
			end

			if activeCapture and activeCapture.button==btn then
				finishCapture("MouseButton1")
				return
			end

			api.StartCapture(btn,getter,setter)
		end)

		btn.InputBegan:Connect(function(input)
			if not(activeCapture and activeCapture.button==btn) then return end

			api.CaptureInput(input)
		end)

		table.insert(bindRows,{button=btn,getter=getter,label=labelButton,strike=strike})
		return btn
	end

	function api.Refresh()
		for _,item in ipairs(bindRows) do
			if not(activeCapture and activeCapture.button==item.button) then
				item.button.Text=bindingToLabel(item.getter())
				setWrappedButtonBg(item.button,THEME.BUTTON or THEME.BG)
				item.button.TextColor3=THEME.TEXT
			end

			if item.label then
				item.label.TextColor3=THEME.TEXT
			end

			if item.strike then
				item.strike.BackgroundColor3=THEME.STROKE or THEME.GREEN
			end
		end
	end

	function api.Build(rows)
		rows=rows or ctx.Bindings or defaultBindingRows(ctx)
		for _,item in ipairs(rows) do
			api.AddBindRow(item.label,function()
				return getBinding(ctx,item)
			end,function(v)
				setBinding(ctx,item,v)
			end)
		end
		api.Refresh()
	end

	inputConn=UIS.InputBegan:Connect(function(inp)
		if not activeCapture then return end

		if inp.KeyCode==Enum.KeyCode.Escape then
			activeCapture=nil
			requestRefresh()
			return
		end

		if inp.KeyCode==Enum.KeyCode.Backspace or inp.KeyCode==Enum.KeyCode.Delete then
			finishCapture(Enum.KeyCode.Unknown)
			return
		end

		api.CaptureInput(inp)
	end)

	function api.Destroy()
		if inputConn then
			inputConn:Disconnect()
			inputConn=nil
		end
		activeCapture=nil
	end

	api.Build()
	return api
end

return KeybindSettings
