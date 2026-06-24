-- Standalone QB throw keybind GUI.
-- No loader/API/module fetch. This only lets you bind a key/button that fires
-- the game's normal ThrowBall remote toward your current mouse position.

local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local TweenService=game:GetService("TweenService")
local Workspace=game:GetService("Workspace")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local CoreGui=game:GetService("CoreGui")

local LP=Players.LocalPlayer
local REMOTE_DISPLAY_POWER=100
local THROW_ANIMATION_NAME="UF_QuarterbackThrow"
local THROW_ANIMATION_SPEED=1.35
local THROW_ANIMATION_RELEASE_WAIT=0.26666666666666666
local THROW_INPUT_COOLDOWN=0.85
local RUNTIME_KEY="StandaloneQBThrowKeybindGui"

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
local throwInProgress=false
local lastThrowAt=-math.huge
local statusLabel=nil
local keyButton=nil

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

local function setStatus(text,color)
	if statusLabel then
		statusLabel.Text=tostring(text or "")
		if color then
			statusLabel.TextColor3=color
		end
	end
end

local function root(character)
	if not character then return nil end
	return character:FindFirstChild("HumanoidRootPart")
		or character:FindFirstChild("UpperTorso")
		or character:FindFirstChild("Torso")
		or character.PrimaryPart
end

local function getHeldBall()
	local character=Workspace:FindFirstChild(LP.Name) or LP.Character
	local characterRoot=root(character)
	if not(character and characterRoot) then return nil end

	local function looksLikeFootball(inst,container)
		while inst and inst~=container do
			if tostring(inst.Name):lower():find("football",1,true) then
				return true
			end
			inst=inst.Parent
		end

		return false
	end

	local function findBallPart(container,maxDistance)
		if not container then return nil end

		local direct=container:FindFirstChild("Football")
		if direct then
			if direct:IsA("BasePart") and (direct.Position-characterRoot.Position).Magnitude<=maxDistance then
				return direct
			end

			if direct:IsA("Model") or direct:IsA("Folder") or direct:IsA("Tool") then
				for _,descendant in ipairs(direct:GetDescendants()) do
					if descendant:IsA("BasePart") and (descendant.Position-characterRoot.Position).Magnitude<=maxDistance then
						return descendant
					end
				end
			end
		end

		for _,descendant in ipairs(container:GetDescendants()) do
			if descendant:IsA("BasePart") and looksLikeFootball(descendant,container) and (descendant.Position-characterRoot.Position).Magnitude<=maxDistance then
				return descendant
			end
		end

		return nil
	end

	return findBallPart(character,35) or findBallPart(character:FindFirstChild("GAMEOBJECTS"),35)
end

local function firstModelOrFolder(container)
	if not container then return nil end

	for _,child in ipairs(container:GetChildren()) do
		if child:IsA("Model") or child:IsA("Folder") then
			return child
		end
	end

	return nil
end

local function getModeKey()
	local miniGames=Workspace:FindFirstChild("MiniGames")
	local miniCount=miniGames and #miniGames:GetChildren() or 0
	if miniCount>1 then return "mode2" end
	if miniCount==1 then return "mode3" end

	local games=Workspace:FindFirstChild("Games")
	if games and #games:GetChildren()>0 then return "mode1" end

	local replicatedMiniGames=ReplicatedStorage:FindFirstChild("MiniGames")
	local replicatedMiniCount=replicatedMiniGames and #replicatedMiniGames:GetChildren() or 0
	if replicatedMiniCount>1 then return "mode2" end
	if replicatedMiniCount==1 then return "mode3" end

	local replicatedGames=ReplicatedStorage:FindFirstChild("Games")
	if replicatedGames and #replicatedGames:GetChildren()>0 then return "mode1" end

	return "mode1"
end

local function getGameReEvent()
	local games=Workspace:FindFirstChild("Games")
	if games then
		for _,gameFolder in ipairs(games:GetChildren()) do
			local replicated=gameFolder:FindFirstChild("Replicated")
			local playersFolder=replicated and replicated:FindFirstChild("Players")
			local reEvent=gameFolder:FindFirstChild("ReEvent") or (replicated and replicated:FindFirstChild("ReEvent"))

			if playersFolder and playersFolder:FindFirstChild(LP.Name) and reEvent and reEvent:IsA("RemoteEvent") then
				return reEvent
			end
		end
	end

	local replicatedGames=ReplicatedStorage:FindFirstChild("Games")
	if replicatedGames then
		for _,gameFolder in ipairs(replicatedGames:GetChildren()) do
			local replicated=gameFolder:FindFirstChild("Replicated")
			local reEvent=gameFolder:FindFirstChild("ReEvent") or (replicated and replicated:FindFirstChild("ReEvent"))
			if reEvent and reEvent:IsA("RemoteEvent") then
				return reEvent
			end
		end
	end

	return nil
end

local function getSquadsReEvent()
	local containers={}
	local function add(container)
		if container then
			containers[#containers+1]=container
		end
	end

	add(ReplicatedStorage:FindFirstChild("MiniGames"))
	add(Workspace:FindFirstChild("MiniGames"))
	add((Workspace:FindFirstChild("Games") or nil) and Workspace.Games:FindFirstChild("MiniGames"))
	add((ReplicatedStorage:FindFirstChild("Games") or nil) and ReplicatedStorage.Games:FindFirstChild("MiniGames"))

	for _,container in ipairs(containers) do
		local miniGame=firstModelOrFolder(container)
		local reEvent=miniGame and miniGame:FindFirstChild("ReEvent")
		if reEvent and reEvent:IsA("RemoteEvent") then
			return reEvent
		end
	end

	return nil
end

local function getThrowRemote()
	local modeKey=getModeKey()
	if modeKey=="mode1" then
		return getGameReEvent(),"Gameplay"
	elseif modeKey=="mode3" then
		return getSquadsReEvent(),"Squads"
	end

	return nil,"Unsupported mode"
end

local function getGlobalMechanics()
	local globals=(type(getgenv)=="function" and getgenv()) or _G or {}
	if type(globals)=="table" then
		local mechanics=rawget(globals,"Mechanics")
		if type(mechanics)=="table" and type(mechanics.PlayAnimation)=="function" then
			return mechanics
		end

		local variables=rawget(globals,"Variables")
		if type(variables)=="table" and type(variables.Mechanics)=="table" and type(variables.Mechanics.PlayAnimation)=="function" then
			return variables.Mechanics
		end
	end

	return nil
end

local function findThrowAnimation()
	local containers={
		ReplicatedStorage,
		LP:FindFirstChild("PlayerScripts"),
		LP.Character,
	}

	for _,container in ipairs(containers) do
		local animation=container and container:FindFirstChild(THROW_ANIMATION_NAME,true)
		if animation and animation:IsA("Animation") and animation.AnimationId~="" then
			return animation
		end
	end

	return nil
end

local function playLocalThrowAnimation()
	local character=LP.Character or Workspace:FindFirstChild(LP.Name)
	local humanoid=character and character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return false end

	local animation=findThrowAnimation()
	if not animation then return false end

	local animator=humanoid:FindFirstChildOfClass("Animator")
	if not animator then
		animator=Instance.new("Animator")
		animator.Parent=humanoid
	end

	local ok,track=pcall(function()
		return animator:LoadAnimation(animation)
	end)
	if not(ok and track) then return false end

	pcall(function()
		track.Priority=Enum.AnimationPriority.Action
	end)
	track:Play(0.05,1,THROW_ANIMATION_SPEED)
	return true
end

local function playThrowAnimation()
	if not getHeldBall() then return false end

	local mechanics=getGlobalMechanics()
	if mechanics then
		local ok=pcall(function()
			mechanics:PlayAnimation(THROW_ANIMATION_NAME,THROW_ANIMATION_SPEED)
		end)
		if ok then return true end
	end

	return playLocalThrowAnimation()
end

local function mouseTarget()
	local mouse=LP:GetMouse()
	if mouse and mouse.Hit then
		return mouse.Hit.Position
	end

	local camera=Workspace.CurrentCamera
	if camera then
		return camera.CFrame.Position+camera.CFrame.LookVector*1000
	end

	return nil
end

local function throwAtMouse()
	if throwInProgress or os.clock()-lastThrowAt<THROW_INPUT_COOLDOWN then
		setStatus("Throw already in progress",Color3.fromRGB(255,185,85))
		return
	end

	if not getHeldBall() then
		setStatus("No ball held",Color3.fromRGB(255,105,105))
		return
	end

	local target=mouseTarget()
	if not target then
		setStatus("No mouse target",Color3.fromRGB(255,105,105))
		return
	end

	local reEvent,modeText=getThrowRemote()
	if not reEvent then
		setStatus(modeText=="Unsupported mode" and "Park mode unsupported" or "Throw remote missing",Color3.fromRGB(255,105,105))
		return
	end

	throwInProgress=true
	setStatus("Release queued...",Color3.fromRGB(255,225,160))
	playThrowAnimation()

	task.delay(THROW_ANIMATION_RELEASE_WAIT,function()
		local ok,err=pcall(function()
			reEvent:FireServer("Mechanics","ThrowBall",{
				Target=target,
				AutoThrow=false,
				Power=REMOTE_DISPLAY_POWER,
			})
		end)

		throwInProgress=false
		lastThrowAt=os.clock()

		if ok then
			setStatus(modeText.." throw sent",Color3.fromRGB(120,255,170))
		else
			setStatus("Throw failed: "..tostring(err),Color3.fromRGB(255,105,105))
		end
	end)
end

local function new(class,props,parent)
	local obj=Instance.new(class)
	for key,value in pairs(props or {}) do
		obj[key]=value
	end
	obj.Parent=parent
	return obj
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
		AnchorPoint=Vector2.new(0,0),
		Position=UDim2.fromOffset(80,180),
		Size=UDim2.fromOffset(320,170),
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
		Size=UDim2.new(1,-28,0,18),
		Font=Enum.Font.Gotham,
		Text="No aim lock. Fires toward current mouse position.",
		TextColor3=Color3.fromRGB(165,165,165),
		TextSize=11,
		TextXAlignment=Enum.TextXAlignment.Left,
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
		Position=UDim2.fromOffset(14,68),
		Size=UDim2.fromOffset(120,20),
		Font=Enum.Font.GothamMedium,
		Text="Throw key",
		TextColor3=Color3.fromRGB(225,225,225),
		TextSize=12,
		TextXAlignment=Enum.TextXAlignment.Left,
	},panel)

	keyButton=new("TextButton",{
		Position=UDim2.fromOffset(138,64),
		Size=UDim2.fromOffset(166,30),
		BackgroundColor3=Color3.fromRGB(30,30,30),
		BorderSizePixel=0,
		Font=Enum.Font.GothamBold,
		Text=bindingToLabel(currentBinding),
		TextColor3=Color3.fromRGB(238,238,238),
		TextSize=12,
		AutoButtonColor=false,
	},panel)

	local throwButton=new("TextButton",{
		Position=UDim2.fromOffset(14,106),
		Size=UDim2.fromOffset(140,32),
		BackgroundColor3=Color3.fromRGB(38,38,38),
		BorderSizePixel=0,
		Font=Enum.Font.GothamBold,
		Text="THROW NOW",
		TextColor3=Color3.fromRGB(238,238,238),
		TextSize=12,
		AutoButtonColor=false,
	},panel)

	statusLabel=new("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(164,106),
		Size=UDim2.new(1,-178,0,32),
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
		throwAtMouse()
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
		throwAtMouse()
	end
end)

if type(runtimeOwner)=="table" then
	rawset(runtimeOwner,RUNTIME_KEY,api)
end

setStatus("Ready - key is "..bindingToLabel(currentBinding),Color3.fromRGB(170,255,190))
