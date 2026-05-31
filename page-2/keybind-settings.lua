local KeybindSettings={}

local UIS=game:GetService("UserInputService")
local ContextActionService=game:GetService("ContextActionService")

local function inputToBinding(input)
	local uiType=tostring(input.UserInputType)
	local key=input.KeyCode
	if key and key~=Enum.KeyCode.Unknown then return key end

	if uiType=="Enum.UserInputType.MouseButton1" then return"MouseButton1" end
	if uiType=="Enum.UserInputType.MouseButton2" then return"MouseButton2" end
	if uiType=="Enum.UserInputType.MouseButton3" then return"MouseButton3" end
	if uiType=="Enum.UserInputType.MouseButton4" then return"MouseButton4" end
	if uiType=="Enum.UserInputType.MouseButton5" then return"MouseButton5" end

	local name=uiType:gsub("Enum.UserInputType%.","")
	if name:match("^Gamepad") then return name end

	return nil
end

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
	local wrapTextButton=ctx.wrapTextButton
	local placeWrappedButton=ctx.placeWrappedButton
	local setWrappedButtonBg=ctx.setWrappedButtonBg

	local api={}
	local bindRows={}
	local activeCapture=nil
	local refreshAll=nil
	local inputConn=nil
	local sideButtonActionName="KeybindSideButtonCapture_"..tostring(math.random(100000,999999))
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
		local binding=(ctx.inputToBinding or inputToBinding)(input)
		if binding==nil then return false end
		return finishCapture(binding)
	end

	function api.MakeBindButton(parent,x,y,w)
		local btn=New("TextButton",{BackgroundColor3=THEME.BG,BorderSizePixel=0,Position=UDim2.fromOffset(x,y),Size=UDim2.fromOffset(w or 122,28),Text="NIL",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.TEXT,AutoButtonColor=false,ZIndex=6},parent)
		local wrap=wrapTextButton(btn,THEME.BG,2)

		btn.MouseEnter:Connect(function()
			if activeCapture and activeCapture.button==btn then return end
			wrap.BackgroundColor3=Color3.fromRGB(43,43,43)
		end)

		btn.MouseLeave:Connect(function()
			if activeCapture and activeCapture.button==btn then return end
			wrap.BackgroundColor3=THEME.PANEL
		end)

		return btn
	end

	local function setButtonCaptureState(btn,waiting)
		btn.Text=waiting and"PRESS..." or btn.Text
		setWrappedButtonBg(btn,THEME.BG)
		btn.TextColor3=THEME.TEXT
	end

	function api.StartCapture(btn,getter,setter)
		if activeCapture and activeCapture.button and activeCapture.button~=btn then
			setWrappedButtonBg(activeCapture.button,THEME.BG)
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
		local row=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,28),ZIndex=5},bindSection)

		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-224,1,0),Text=label,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},row)

		local btn=api.MakeBindButton(row,0,0,94)
		placeWrappedButton(btn,UDim2.new(1,-216,0,0))

		local mb4=api.MakeBindButton(row,0,0,54)
		placeWrappedButton(mb4,UDim2.new(1,-114,0,0))
		mb4.Text="MB4"

		local mb5=api.MakeBindButton(row,0,0,54)
		placeWrappedButton(mb5,UDim2.new(1,-54,0,0))
		mb5.Text="MB5"

		btn.MouseButton1Click:Connect(function()
			if os.clock()<suppressMouseButton1ClickUntil then
				return
			end

			if activeCapture and activeCapture.button==btn then
				finishCapture("MouseButton1")
				return
			end

			api.StartCapture(btn,getter,setter)
		end)

		mb4.MouseButton1Click:Connect(function()
			activeCapture=nil
			setter("MouseButton4")
			requestRefresh()
		end)

		mb5.MouseButton1Click:Connect(function()
			activeCapture=nil
			setter("MouseButton5")
			requestRefresh()
		end)

		btn.InputBegan:Connect(function(input)
			if not(activeCapture and activeCapture.button==btn) then return end

			api.CaptureInput(input)
		end)

		table.insert(bindRows,{button=btn,getter=getter})
		return btn
	end

	function api.Refresh()
		for _,item in ipairs(bindRows) do
			if not(activeCapture and activeCapture.button==item.button) then
				item.button.Text=bindingToLabel(item.getter())
				setWrappedButtonBg(item.button,THEME.BG)
				item.button.TextColor3=THEME.TEXT
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

	ContextActionService:BindActionAtPriority(sideButtonActionName,function(_,inputState,input)
		if inputState~=Enum.UserInputState.Begin or not activeCapture then
			return Enum.ContextActionResult.Pass
		end

		local binding=inputToBinding(input)
		if binding=="MouseButton4" or binding=="MouseButton5" then
			api.CaptureInput(input)
			return Enum.ContextActionResult.Sink
		end

		return Enum.ContextActionResult.Pass
	end,false,Enum.ContextActionPriority.High.Value+1100,Enum.UserInputType.MouseButton4,Enum.UserInputType.MouseButton5)

	function api.Destroy()
		if inputConn then
			inputConn:Disconnect()
			inputConn=nil
		end
		pcall(function()
			ContextActionService:UnbindAction(sideButtonActionName)
		end)
		activeCapture=nil
	end

	api.Build()
	return api
end

return KeybindSettings
