local Players=game:GetService("Players")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local TweenService=game:GetService("TweenService")
local UserInputService=game:GetService("UserInputService")
local RunService=game:GetService("RunService")

local player=Players.LocalPlayer
local playerGui=player:WaitForChild("PlayerGui")
local sourceRoot=ReplicatedStorage:WaitForChild("GuiSource")

local THEME={
	BG=Color3.fromRGB(28,28,28),
	PANEL=Color3.fromRGB(33,33,33),
	CARD=Color3.fromRGB(38,38,38),
	ACC=Color3.fromRGB(32,202,106),
	TEXT=Color3.fromRGB(195,195,195),
	MUTED=Color3.fromRGB(168,168,168),
	STROKE=Color3.fromRGB(76,76,76),
	RED=Color3.fromRGB(254,94,86),
	BLUE=Color3.fromRGB(21,103,251),
	GREEN=Color3.fromRGB(32,202,106),
	STROKE_SOFT=Color3.fromRGB(64,64,64),
	TOPBAR=Color3.fromRGB(30,30,30),
	SECTION=Color3.fromRGB(35,35,35),
	BUTTON=Color3.fromRGB(42,42,42),
	INPUT=Color3.fromRGB(26,26,26),
	SLIDER_BG=Color3.fromRGB(24,24,24),
	SLIDER_FILL=Color3.fromRGB(32,202,106),
}

local UI_STYLE={
	PrimaryR=28,
	PrimaryG=28,
	PrimaryB=28,
	StrokeR=76,
	StrokeG=76,
	StrokeB=76,
	GradientR=45,
	GradientG=45,
	GradientB=45,
	StrokeGradient=false,
	LiquidStroke=false,
	LiquidStrokeSpeed=1,
	LiquidStrokeDirection="Right",
	StrokeThickness=1,
	StrokeTransparency=0.84,
	CornerRadius=0,
	UILib="original",
}

local UI_WINDOW={}
local BOX_WRAPPERS=setmetatable({}, {__mode="k"})
local BUTTON_WRAPPERS=setmetatable({}, {__mode="k"})
local THEMED_GUI_OBJECTS=setmetatable({}, {__mode="k"})
local THEMED_TEXT_OBJECTS=setmetatable({}, {__mode="k"})
local THEMED_STROKES=setmetatable({}, {__mode="k"})
local THEMED_CORNERS=setmetatable({}, {__mode="k"})

local PAGE1_STATE={
	hitboxOn=false,
	sizeX=2.52,
	sizeY=5.4,
	sizeZ=1.41,
	targetTransparency=0.7,
	gravityEnabled=false,
	gravityValue=196.2,
	speedEnabled=false,
	speedValue=18,
	gameParamsEnabled=false,
	paramsSelectedPage="speed",
	speedParamsEnabled=true,
	gravityJumpParamsEnabled=true,
	staminaParamsEnabled=true,
	staminaRegenValue=10,
	staminaDepleteValue=10,
	jumpPowerValue=53.5,
	divePowerValue=1.9,
	jumpBoostOn=false,
	jumpBoostTradeMode=false,
	boostForceY=32,
	boostCooldown=5,
	boostChance=100,
	ballDetectionRadius=10,
	actionStatusOn=false,
	qbAimEnabled=false,
	qbAimTeamFilter=true,
	qbAimShowArc=true,
	qbAimLeadDelay=0.38,
	qbAimPeakHeight=14.00,
	qbAimQBDrift=0.04,
	qbAimQBYDrift=0.04,
	testingEnabled=false,
}

local function moduleAt(path)
	local node=sourceRoot
	for segment in string.gmatch(path,"[^/]+") do
		node=node:WaitForChild(segment)
	end
	return require(node)
end

local FusionModule=moduleAt("gui/fusion")

local function colorClose(a,b)
	if not(a and b) then return false end
	return math.abs(a.R-b.R)<0.002 and math.abs(a.G-b.G)<0.002 and math.abs(a.B-b.B)<0.002
end

local function registerThemeObject(obj)
	if not obj then return end

	if obj:IsA("GuiObject") then
		THEMED_GUI_OBJECTS[obj]=true
	end

	if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
		THEMED_TEXT_OBJECTS[obj]=true
	elseif obj:IsA("UIStroke") then
		THEMED_STROKES[obj]=true
	elseif obj:IsA("UICorner") then
		THEMED_CORNERS[obj]=true
	end
end

local function markThemeRole(obj,color)
	if not(obj and color) then return end
	registerThemeObject(obj)
	local role=nil

	for name,value in pairs(THEME) do
		if colorClose(color,value) then
			role=name
			break
		end
	end

	if role then
		obj:SetAttribute("ThemeRole",role)
	end
end

local function markThemeTextRole(obj,color)
	if not(obj and color) then return end
	registerThemeObject(obj)

	if colorClose(color,THEME.TEXT) then
		obj:SetAttribute("ThemeTextRole","TEXT")
	elseif colorClose(color,THEME.MUTED) then
		obj:SetAttribute("ThemeTextRole","MUTED")
	elseif colorClose(color,THEME.RED) then
		obj:SetAttribute("ThemeTextRole","RED")
	elseif colorClose(color,THEME.GREEN) then
		obj:SetAttribute("ThemeTextRole","GREEN")
	elseif colorClose(color,THEME.BLUE) then
		obj:SetAttribute("ThemeTextRole","BLUE")
	end
end

local function New(class,props,parent)
	props=props or {}
	local skipThemeRole=props.SkipThemeRole
	local forcedThemeRole=props.ThemeRole
	local forcedTextRole=props.TextRole
	local forcedStrokeRole=props.StrokeRole
	local forcedCornerRole=props.CornerRole

	props.SkipThemeRole=nil
	props.ThemeRole=nil
	props.TextRole=nil
	props.StrokeRole=nil
	props.CornerRole=nil

	if props.Active==nil and (class=="Frame" or class=="ScrollingFrame" or class=="TextButton" or class=="TextBox") then
		props.Active=true
	end

	if class=="TextLabel" or class=="TextButton" or class=="TextBox" then
		props.TextColor3=props.TextColor3 or THEME.TEXT
		props.Font=props.Font or Enum.Font.Gotham
		props.TextStrokeTransparency=1
		props.TextStrokeColor3=Color3.fromRGB(0,0,0)
		props.TextYAlignment=props.TextYAlignment or Enum.TextYAlignment.Center
	end

	local obj=nil
	if FusionModule and type(FusionModule.New)=="function" then
		local ok,result=pcall(function()
			return FusionModule.New(class)(props)
		end)
		if ok and typeof(result)=="Instance" then
			obj=result
		else
			warn("Fusion New failed; using Instance.new fallback:",class,result)
		end
	end

	if not obj then
		obj=Instance.new(class)
		for k,v in pairs(props) do
			obj[k]=v
		end
	end
	if parent~=nil then
		obj.Parent=parent
	end
	registerThemeObject(obj)

	if forcedThemeRole then
		obj:SetAttribute("ThemeRole",forcedThemeRole)
	elseif not skipThemeRole and props.BackgroundColor3 then
		markThemeRole(obj,props.BackgroundColor3)
	end

	if forcedTextRole and (class=="TextLabel" or class=="TextButton" or class=="TextBox") then
		obj:SetAttribute("ThemeTextRole",forcedTextRole)
	elseif class=="TextLabel" or class=="TextButton" or class=="TextBox" then
		markThemeTextRole(obj,props.TextColor3)
	end

	if forcedCornerRole then
		obj:SetAttribute("CornerRole",forcedCornerRole)
	end

	if forcedStrokeRole then
		obj:SetAttribute("StrokeRole",forcedStrokeRole)
	end

	return obj
end

local function safeDisconnect(conn)
	if conn and typeof(conn)=="RBXScriptConnection" then
		pcall(function()
			conn:Disconnect()
		end)
	end
end

local function fmtNumber(n,decimals)
	decimals=decimals or 2
	local s=string.format("%."..decimals.."f",tonumber(n) or 0)
	s=s:gsub("(%..-)0+$","%1"):gsub("%.$","")
	return s
end

local function inputToBinding(input)
	local key=input.KeyCode
	if key and key~=Enum.KeyCode.Unknown then
		return key
	end

	local userInputType=tostring(input.UserInputType):gsub("Enum.UserInputType%.","")
	if userInputType=="MouseButton1" then return "MouseButton1" end
	if userInputType=="MouseButton2" then return "MouseButton2" end
	if userInputType=="MouseButton3" then return "MouseButton3" end
	if userInputType:match("^Gamepad") then return userInputType end
	return nil
end

local UILibOriginalProfile={
	Id="original",
	Name="Original",
	Style={
		Primary=THEME.BG,
		Stroke=THEME.STROKE,
		Gradient=Color3.fromRGB(45,45,45),
		GradientOn=false,
		StrokeThickness=1,
		StrokeTransparency=0.84,
	},
	Shape={
		WindowRadius=0,
		SectionRadius=0,
		ControlRadius=0,
		SliderRadius=0,
		SliderHeight=26,
		SliderStyle="original",
		WindowStrokeTransparency=0.62,
		SectionStrokeTransparency=0.92,
		ControlStrokeTransparency=0.9,
		SliderStrokeTransparency=0.9,
		AccentStrokeTransparency=0.72,
	},
	Components={
		TextFont=Enum.Font.Gotham,
		TitleFont=Enum.Font.GothamBold,
		ControlFont=Enum.Font.GothamMedium,
		SectionPrefix=true,
		SectionPaddingX=12,
		SectionPaddingY=10,
		SectionGap=6,
		SectionHeaderHeight=22,
		SectionTitleSize=14,
		SectionSubtitleSize=11,
		SectionBackgroundTransparency=0,
		SectionStrokeTransparency=0.84,
		SectionBodyInset=2,
		SectionBodyGap=6,
		SliderRowHeight=48,
		SliderValueBoxWidth=58,
		SliderValueBoxVisible=true,
		SliderContainerTransparency=1,
		SliderContainerStrokeTransparency=1,
		SliderLabelX=12,
		SliderRightPadding=8,
		ToggleWidth=48,
		ToggleHeight=20,
		ToggleStyle="switch",
		TextBoxHeight=28,
		ButtonHeight=30,
		ControlStrokeTransparency=0.78,
	},
	MainFrame={
		Window={W=880,H=540,MinW=560,MinH=360,MaxW=1220,MaxH=820,StartY=80,MinimizedH=68},
		Layout={RootPadding=8,MainGap=8,PageGap=8,ColumnGap=8,FooterGap=8,HeaderHeight=52,PageBarHeight=30,PageTabWidth=106,PageTabHeight=28,FooterHeight=34,TopButtonSize=28,TopButtonGap=6,TopButtonOuter=10},
	},
}

local function getUILibRuntimeStyle()
	return UILibOriginalProfile
end

local function getCurrentUILibProfile()
	return UILibOriginalProfile
end

local function getUIStrokeColor()
	return Color3.fromRGB(UI_STYLE.StrokeR,UI_STYLE.StrokeG,UI_STYLE.StrokeB)
end

local function getUIStrokeGradientColor()
	return Color3.fromRGB(UI_STYLE.GradientR,UI_STYLE.GradientG,UI_STYLE.GradientB)
end

local function getUIPrimaryColor()
	return Color3.fromRGB(UI_STYLE.PrimaryR,UI_STYLE.PrimaryG,UI_STYLE.PrimaryB)
end

local old=playerGui:FindFirstChild("HitboxUI_RojoPreview")
if old then
	old:Destroy()
end

local screenGui=New("ScreenGui",{
	Name="HitboxUI_RojoPreview",
	ResetOnSpawn=false,
	ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
	IgnoreGuiInset=true,
	DisplayOrder=1000,
},playerGui)

local Description=moduleAt("gui/description")
local GuiLogicModule=moduleAt("gui/gui-logic")
local MainFrameModule=moduleAt("gui/mainframe")

local Page1HitboxLogicModule=moduleAt("page-1/hitbox/logic")
local Page1HitboxModule=moduleAt("page-1/hitbox/gui")
local Page1GameParamsLogicModule=moduleAt("page-1/game-params/logic")
local Page1GameParamsModule=moduleAt("page-1/game-params/gui")
local Page1BoostLogicModule=moduleAt("page-1/boost/logic")
local Page1BoostModule=moduleAt("page-1/boost/gui")
local Page1ESPLogicModule=moduleAt("page-1/esp/logic")
local Page1ESPModule=moduleAt("page-1/esp/gui")
local Page1ESPDefenseLogicModule=moduleAt("page-1/esp-defense/logic")
local Page1ESPOffenseLogicModule=moduleAt("page-1/esp-offense/logic")
local Page1QBAimLogicModule=moduleAt("page-1/qb-aim/logic")
local Page1QBAimModule=moduleAt("page-1/qb-aim/gui")
local Page1TestingLogicModule=moduleAt("page-1/testing/logic")
local Page1TestingModule=moduleAt("page-1/testing/gui")

local GuiLogic=GuiLogicModule.new({
	New=New,
	Fusion=FusionModule,
	THEME=THEME,
	UI_STYLE=UI_STYLE,
	UserInputService=UserInputService,
	UIS=UserInputService,
	TweenService=TweenService,
	fmtNumber=fmtNumber,
	BOX_WRAPPERS=BOX_WRAPPERS,
	BUTTON_WRAPPERS=BUTTON_WRAPPERS,
	markThemeRole=markThemeRole,
	getUILibRuntimeStyle=getUILibRuntimeStyle,
})

local makeSection=GuiLogic.makeSection
local buildSlider=GuiLogic.buildSlider
local buildToggleRow=GuiLogic.buildToggleRow
local wrapTextButton=GuiLogic.wrapTextButton
local attachHover=GuiLogic.attachHover

local currentModeKey="mode1"
local currentModeLabel="Gameplay"
local pageApis={}
local mainFrame=nil

local function getMainDescriptionText()
	if Description and type(Description.Get)=="function" then
		local ok,value=pcall(Description.Get,"Main.Description",currentModeLabel.." loaded")
		if ok and value~=nil then
			return value
		end
	end

	return currentModeLabel.." loaded"
end

mainFrame=MainFrameModule.new({
	New=New,
	Fusion=FusionModule,
	THEME=THEME,
	Description=Description,
	UI_WINDOW=UI_WINDOW,
	UI_PROFILE=getCurrentUILibProfile(),
	getCurrentUILibProfile=getCurrentUILibProfile,
	SG=screenGui,
	UIS=UserInputService,
	TweenService=TweenService,
	RunService=RunService,
	safeDisconnect=safeDisconnect,
	wrapTextButton=wrapTextButton,
	attachHover=attachHover,
	getUIPrimaryColor=getUIPrimaryColor,
	getUIStrokeColor=getUIStrokeColor,
	getUIStrokeGradientColor=getUIStrokeGradientColor,
	isAlive=function()
		return screenGui.Parent~=nil
	end,
	getModeLabel=function()
		return currentModeLabel
	end,
	onPageActivated=function() end,
})

local function syncPage1State()
	for _,api in pairs(pageApis) do
		if api and api.Refresh then
			pcall(api.Refresh)
		end
	end
end

local function makePage1Ctx()
	return{
		New=New,
		Fusion=FusionModule,
		THEME=THEME,
		State=PAGE1_STATE,
		makeSection=makeSection,
		buildSlider=buildSlider,
		buildToggleRow=buildToggleRow,
		HITBOX_ORIGINALS={
			Transparency=setmetatable({}, {__mode="k"}),
			Size=setmetatable({}, {__mode="k"}),
		},
		fmtNumber=fmtNumber,
		safeDisconnect=safeDisconnect,
		inputToBinding=inputToBinding,
		Page1HitboxLogicModule=Page1HitboxLogicModule,
		Page1GameParamsLogicModule=Page1GameParamsLogicModule,
		Page1BoostLogicModule=Page1BoostLogicModule,
		Page1ESPLogicModule=Page1ESPLogicModule,
		Page1ESPDefenseLogicModule=Page1ESPDefenseLogicModule,
		Page1ESPOffenseLogicModule=Page1ESPOffenseLogicModule,
		Page1QBAimLogicModule=Page1QBAimLogicModule,
		Page1TestingLogicModule=Page1TestingLogicModule,
		getCurrentModeKey=function() return currentModeKey end,
		getHitboxToggleKey=function() return Enum.KeyCode.Unknown end,
		getSpeedToggleKey=function() return Enum.KeyCode.Unknown end,
		getJumpBoostToggleKey=function() return Enum.KeyCode.Unknown end,
		getAlwaysBoostToggleKey=function() return Enum.KeyCode.Unknown end,
		getESPToggleKey=function() return Enum.KeyCode.Unknown end,
		getQBAimLockKey=function() return Enum.KeyCode.H end,
		getQBAimThrowKey=function() return Enum.KeyCode.T end,
		getQBAimToggleKey=function() return Enum.KeyCode.P end,
		Description=Description,
		ESPDefenseModule=Page1ESPDefenseLogicModule,
		ESPOffenseModule=Page1ESPOffenseLogicModule,
		refreshESPStatus=function(state,available)
			PAGE1_STATE.actionStatusOn=state and available~=false
		end,
		setCurrentMode=function(key,label)
			currentModeKey=tostring(key or "mode1")
			currentModeLabel=tostring(label or "Gameplay")
			if mainFrame and mainFrame.modeSubtitle then
				mainFrame.modeSubtitle.Text=getMainDescriptionText()
			end
			syncPage1State()
		end,
		onChanged=function()
			syncPage1State()
		end,
	}
end

local function addPage1Error(parent,order,title,message)
	local section=makeSection(parent,order,title,"Studio preview module error")
	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,34),
		Text=tostring(message),
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextWrapped=true,
		TextColor3=THEME.RED,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},section)
end

local function mount(name,module,parent,order,title)
	if module and module.new then
		local ok,result=pcall(function()
			return module.new(makePage1Ctx(),parent)
		end)
		if ok then
			pageApis[name]=result
			return
		end

		addPage1Error(parent,order,title,result)
		return
	end

	addPage1Error(parent,order,title,"missing module")
end

mount("Hitbox",Page1HitboxModule,mainFrame.leftCol,1,"Hitbox")
mount("GameParams",Page1GameParamsModule,mainFrame.leftCol,2,"Game Params")
mount("Boost",Page1BoostModule,mainFrame.rightCol,2,"Boost")
mount("ESP",Page1ESPModule,mainFrame.rightCol,3,"ESP")
mount("QBAim",Page1QBAimModule,mainFrame.rightCol,4,"QB Aim")
mount("Testing",Page1TestingModule,mainFrame.rightCol,5,"Testing")

if mainFrame.SetActivePage then
	mainFrame.SetActivePage("main")
end

if mainFrame.UpdateResponsiveLayout then
	mainFrame.UpdateResponsiveLayout()
end

print("Rojo GUI preview loaded. Use Play Solo to inspect the rendered GUI.")
