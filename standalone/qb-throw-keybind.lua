-- Standalone QB throw keybind GUI.
-- No loader/API/module fetch and no custom throw remote payload.
-- Pressing the bound key sends the same native left-click input the game uses,
-- so the game keeps control of power, target, animation timing, and release state.

local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local TweenService=game:GetService("TweenService")
local CoreGui=game:GetService("CoreGui")

local LP=Players.LocalPlayer
local RUNTIME_KEY="StandaloneQBThrowKeybindGui"
local CLICK_COOLDOWN=0.18

local runtimeOwner=(type(getgenv)=="function" and getgenv()) or _G
if type(runtimeOwner)=="table" then
	local old=rawget(runtimeOwner,RUNTIME_KEY)
	if old and type(old.Destroy)=="function" then
		pcall(function()
			old:Destroy()
		end)
	end
end

local connections={}
local screenGui=nil
local currentBinding=Enum.KeyCode.T
local capturing=false
local lastClickAt=-math.huge
local statusLabel=nil
local keyButton=nil

local VirtualInputManager=nil
pcall(function()
	VirtualInputManager=game:GetService("VirtualInputManager")
end)

local function connect(signal,fn)
	local conn=signal:Connect(fn)
	connections[#connections+1]=conn
	return conn
end

local function disconnectAll()
	for _,conn in ipairs(connections) do
		pcall(function()
			conn:Disconnect()
		end)
	end
	table.clear(connections)
end

local function new(className,props,parent)
	local obj=Instance.new(className)
	for key,value in pairs(props or {}) do
		obj[key]=value
	end
	obj.Parent=parent
	return obj
end

local function setStatus(text,color)
	if statusLabel then
		statusLabel.Text=tostring(text or "")
		if color then
			statusLabel.TextColor3=color
		end
	end
end

local function keyCodeToLabel(key)
	if key==nil or key==Enum.KeyCode.Unknown then
		return "NIL"
	end

	local name=tostring(key):gsub("Enum.KeyCode%.","")
	local short={
		LeftControl="LCTRL",
		RightControl="RCTRL",
		LeftShift="LSHIFT",
		RightShift="RSHIFT",
		BackQuote="`",
		Return="ENTER",
		Space="SPACE",
	}

	return short[name] or string.upper(name)
end

local function bindingToLabel(binding)
	if binding==nil or binding==Enum.KeyCode.Unknown then
		return "NIL"
	end

	if type(binding)=="string" then
		local map={
			MouseButton1="LMB",
			MouseButton2="RMB",
			MouseButton3="MMB",
			Touch="TOUCH",
			Gamepad1="PAD1",
			Gamepad2="PAD2",
			Gamepad3="PAD3",
			Gamepad4="PAD4",
			Gamepad5="PAD5",
			Gamepad6="PAD6",
			Gamepad7="PAD7",
			Gamepad8="PAD8",
		}
		return map[binding] or string.upper(binding)
	end

	return keyCodeToLabel(binding)
end

local function inputToBinding(input)
	local key=input.KeyCode
	if key and key~=Enum.KeyCode.Unknown then
		return key
	end

	if input.UserInputType==Enum.UserInputType.MouseButton1 then return "MouseButton1" end
	if input.UserInputType==Enum.UserInputType.MouseButton2 then return "MouseButton2" end
	if input.UserInputType==Enum.UserInputType.MouseButton3 then return "MouseButton3" end
	if input.UserInputType==Enum.UserInputType.Touch then return "Touch" end

	local name=tostring(input.UserInputType):gsub("Enum.UserInputType%.","")
	if name:match("^Gamepad") then
		return name
	end

	return nil
end

local function bindingMatches(input,binding)
	if binding==nil or binding==Enum.KeyCode.Unknown then
		return false
	end

	local incoming=inputToBinding(input)
	return incoming~=nil and incoming==binding
end

local function sendNativeClick()
	if os.clock()-lastClickAt<CLICK_COOLDOWN then
		return false,"Click cooldown"
	end

	lastClickAt=os.clock()

	if type(mouse1click)=="function" then
		local ok,err=pcall(mouse1click)
		if ok then
			return true,"mouse1click"
		end
		return false,tostring(err)
	end

	if type(mouse1press)=="function" and type(mouse1release)=="function" then
		local ok,err=pcall(function()
			mouse1press()
			task.wait()
			mouse1release()
		end)
		if ok then
			return true,"mouse1press"
		end
		return false,tostring(err)
	end

	if VirtualInputManager then
		local pos=UIS:GetMouseLocation()
		local ok,err=pcall(function()
			VirtualInputManager:SendMouseButtonEvent(pos.X,pos.Y,0,true,game,0)
			task.wait()
			VirtualInputManager:SendMouseButtonEvent(pos.X,pos.Y,0,false,game,0)
		end)
		if ok then
			return true,"VirtualInputManager"
		end
		return false,tostring(err)
	end

	return false,"No native click method available"
end

local function triggerThrowInput()
	if currentBinding=="MouseButton1" then
		setStatus("LMB already uses the game's throw input",Color3.fromRGB(255,225,160))
		return
	end

	local ok,method=sendNativeClick()
	if ok then
		setStatus("Native throw input sent: "..method,Color3.fromRGB(150,255,180))
	else
		setStatus("Input failed: "..method,Color3.fromRGB(255,105,105))
	end
end

local function buildGui()
	local parent=LP:FindFirstChildOfClass("PlayerGui") or LP:WaitForChild("PlayerGui",5) or CoreGui

	screenGui=new("ScreenGui",{
		Name="StandaloneQBThrowKeybind",
		ResetOnSpawn=false,
		IgnoreGuiInset=true,
		ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
	},parent)

	pcall(function()
		screenGui.DisplayOrder=999999
	end)

	local panel=new("Frame",{
		Position=UDim2.fromOffset(80,180),
		Size=UDim2.fromOffset(330,164),
		BackgroundColor3=Color3.fromRGB(14,14,14),
		BorderSizePixel=0,
		Active=true,
	},screenGui)

	new("UIStroke",{
		Color=Color3.fromRGB(185,185,185),
		Transparency=0.35,
		Thickness=1,
	},panel)

	local title=new("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(14,12),
		Size=UDim2.new(1,-58,0,20),
		Font=Enum.Font.GothamBold,
		Text="QB Throw Keybind",
		TextColor3=Color3.fromRGB(238,238,238),
		TextSize=14,
		TextXAlignment=Enum.TextXAlignment.Left,
	},panel)

	new("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(14,34),
		Size=UDim2.new(1,-28,0,34),
		Font=Enum.Font.Gotham,
		Text="Sends the game's normal click throw. Power and target stay native.",
		TextColor3=Color3.fromRGB(165,165,165),
		TextSize=11,
		TextWrapped=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextYAlignment=Enum.TextYAlignment.Top,
	},panel)

	local close=new("TextButton",{
		AnchorPoint=Vector2.new(1,0),
		Position=UDim2.new(1,-10,0,10),
		Size=UDim2.fromOffset(28,24),
		BackgroundColor3=Color3.fromRGB(32,32,32),
		BorderSizePixel=0,
		Font=Enum.Font.GothamBold,
		Text="X",
		TextColor3=Color3.fromRGB(238,238,238),
		TextSize=12,
		AutoButtonColor=false,
	},panel)

	new("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(14,76),
		Size=UDim2.fromOffset(120,20),
		Font=Enum.Font.GothamMedium,
		Text="Throw key",
		TextColor3=Color3.fromRGB(225,225,225),
		TextSize=12,
		TextXAlignment=Enum.TextXAlignment.Left,
	},panel)

	keyButton=new("TextButton",{
		Position=UDim2.fromOffset(138,72),
		Size=UDim2.fromOffset(176,30),
		BackgroundColor3=Color3.fromRGB(30,30,30),
		BorderSizePixel=0,
		Font=Enum.Font.GothamBold,
		Text=bindingToLabel(currentBinding),
		TextColor3=Color3.fromRGB(238,238,238),
		TextSize=12,
		AutoButtonColor=false,
	},panel)

	local throwButton=new("TextButton",{
		Position=UDim2.fromOffset(14,116),
		Size=UDim2.fromOffset(140,32),
		BackgroundColor3=Color3.fromRGB(38,38,38),
		BorderSizePixel=0,
		Font=Enum.Font.GothamBold,
		Text="SEND CLICK",
		TextColor3=Color3.fromRGB(238,238,238),
		TextSize=12,
		AutoButtonColor=false,
	},panel)

	statusLabel=new("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(164,112),
		Size=UDim2.new(1,-178,0,40),
		Font=Enum.Font.Gotham,
		Text="Ready",
		TextColor3=Color3.fromRGB(170,255,190),
		TextSize=11,
		TextWrapped=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextYAlignment=Enum.TextYAlignment.Center,
	},panel)

	local dragStart=nil
	local panelStart=nil
	connect(title.InputBegan,function(input)
		if input.UserInputType~=Enum.UserInputType.MouseButton1 and input.UserInputType~=Enum.UserInputType.Touch then
			return
		end

		dragStart=input.Position
		panelStart=panel.Position
	end)

	connect(UIS.InputChanged,function(input)
		if not dragStart then return end
		if input.UserInputType~=Enum.UserInputType.MouseMovement and input.UserInputType~=Enum.UserInputType.Touch then
			return
		end

		local delta=input.Position-dragStart
		panel.Position=UDim2.new(panelStart.X.Scale,panelStart.X.Offset+delta.X,panelStart.Y.Scale,panelStart.Y.Offset+delta.Y)
	end)

	connect(UIS.InputEnded,function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
			dragStart=nil
			panelStart=nil
		end
	end)

	local function buttonHover(button,normal,hover)
		connect(button.MouseEnter,function()
			TweenService:Create(button,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3=hover}):Play()
		end)
		connect(button.MouseLeave,function()
			TweenService:Create(button,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3=normal}):Play()
		end)
	end

	buttonHover(close,Color3.fromRGB(32,32,32),Color3.fromRGB(70,32,32))
	buttonHover(keyButton,Color3.fromRGB(30,30,30),Color3.fromRGB(48,48,48))
	buttonHover(throwButton,Color3.fromRGB(38,38,38),Color3.fromRGB(54,54,54))

	connect(keyButton.Activated,function()
		capturing=true
		keyButton.Text="PRESS..."
		setStatus("Press a key/button. Esc cancels. Backspace clears.",Color3.fromRGB(255,225,160))
	end)

	connect(throwButton.Activated,function()
		triggerThrowInput()
	end)

	local api
	api={
		Destroy=function()
			disconnectAll()
			if screenGui then
				screenGui:Destroy()
				screenGui=nil
			end
			if type(runtimeOwner)=="table" and rawget(runtimeOwner,RUNTIME_KEY)==api then
				rawset(runtimeOwner,RUNTIME_KEY,nil)
			end
		end,
	}

	connect(close.Activated,function()
		api:Destroy()
	end)

	return api
end

local api=buildGui()

connect(UIS.InputBegan,function(input,processed)
	if capturing then
		if input.KeyCode==Enum.KeyCode.Escape then
			capturing=false
			keyButton.Text=bindingToLabel(currentBinding)
			setStatus("Capture cancelled",Color3.fromRGB(220,220,220))
			return
		end

		if input.KeyCode==Enum.KeyCode.Backspace or input.KeyCode==Enum.KeyCode.Delete then
			currentBinding=Enum.KeyCode.Unknown
			capturing=false
			keyButton.Text=bindingToLabel(currentBinding)
			setStatus("Throw key cleared",Color3.fromRGB(220,220,220))
			return
		end

		local binding=inputToBinding(input)
		if binding then
			currentBinding=binding
			capturing=false
			keyButton.Text=bindingToLabel(currentBinding)
			setStatus("Throw key set to "..bindingToLabel(currentBinding),Color3.fromRGB(170,255,190))
		end

		return
	end

	if processed or UIS:GetFocusedTextBox() then
		return
	end

	if bindingMatches(input,currentBinding) then
		triggerThrowInput()
	end
end)

if type(runtimeOwner)=="table" then
	rawset(runtimeOwner,RUNTIME_KEY,api)
end

setStatus("Ready - key is "..bindingToLabel(currentBinding),Color3.fromRGB(170,255,190))
