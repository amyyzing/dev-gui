local Players=game:GetService("Players")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local TweenService=game:GetService("TweenService")
local UserInputService=game:GetService("UserInputService")
local RunService=game:GetService("RunService")

local player=Players.LocalPlayer
local playerGui=player:WaitForChild("PlayerGui")
local sourceRoot=ReplicatedStorage:WaitForChild("GuiSource")
local screenGui=nil
local mainFrame=nil

local THEME={
	BG=Color3.fromRGB(12,12,12),
	PANEL=Color3.fromRGB(24,24,24),
	CARD=Color3.fromRGB(31,31,31),
	ACC=Color3.fromRGB(32,202,106),
	TEXT=Color3.fromRGB(238,238,238),
	MUTED=Color3.fromRGB(182,180,180),
	STROKE=Color3.fromRGB(182,180,180),
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
	PrimaryR=12,
	PrimaryG=12,
	PrimaryB=12,
	StrokeR=182,
	StrokeG=180,
	StrokeB=180,
	GradientR=182,
	GradientG=180,
	GradientB=180,
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
	gameParamsEnabled=true,
	paramsSelectedPage="speed",
	speedParamsEnabled=false,
	gravityJumpParamsEnabled=false,
	staminaParamsEnabled=false,
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
	qbAimSafeArc=true,
	qbAimLeadDelay=0.38,
	qbAimPeakHeight=14.00,
	testingEnabled=false,
}

local DEFAULT_PRESETS={
	{key=Enum.KeyCode.Unknown,size=Vector3.new(0.1,0.1,0.1)},
	{key=Enum.KeyCode.Unknown,size=Vector3.new(2.7,5.8,1.65)},
	{key=Enum.KeyCode.Unknown,size=Vector3.new(3.1,5.8,1.7)},
	{key=Enum.KeyCode.Unknown,size=Vector3.new(2.52,5.4,1.41)},
}

local PRESETS={
	{key=Enum.KeyCode.Unknown,size=Vector3.new(0.1,0.1,0.1)},
	{key=Enum.KeyCode.Unknown,size=Vector3.new(2.7,5.8,1.65)},
	{key=Enum.KeyCode.Unknown,size=Vector3.new(3.1,5.8,1.7)},
	{key=Enum.KeyCode.Unknown,size=Vector3.new(2.52,5.4,1.41)},
}

local OWNED_PRESETS={}
local PAGE2_EXPANDED_OWNED={}
local WORLD_SETTINGS={
	SmoothPlastic=false,
	OriginalMaterials=setmetatable({}, {__mode="k"}),
}

local RuntimeJanitor={
	new=function()
		return{
			Add=function(_,item) return item end,
			Cleanup=function() end,
			Destroy=function() end,
		}
	end,
}

local RuntimeScheduler={
	Register=function() return false end,
	SetEnabled=function() end,
	Unregister=function() end,
	Count=function() return 0 end,
}

local RuntimeStateStore={
	dirty=false,
	Get=function(_,_,default) return default end,
	Set=function(_,_,value) return value end,
}

local RuntimeThemeStore={
	Apply=function() end,
	RefreshObject=function() end,
}

local RuntimeServices={
	Janitor=RuntimeJanitor,
	Scheduler=RuntimeScheduler,
	StateStore=RuntimeStateStore,
	ThemeStore=RuntimeThemeStore,
}

local BOT_API={
	Post=function()
		return{ok=false,error="Studio preview is offline."}
	end,
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

local function markThemeTextRole(obj,color,defaultRole)
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
	elseif defaultRole then
		obj:SetAttribute("ThemeTextRole",defaultRole)
	end
end

local function New(class,props,parent)
	props=props or {}
	local skipThemeRole=props.SkipThemeRole
	local skipTextRole=props.SkipTextRole
	local forcedThemeRole=props.ThemeRole
	local forcedTextRole=props.TextRole
	local forcedStrokeRole=props.StrokeRole
	local forcedCornerRole=props.CornerRole
	local isTextClass=class=="TextLabel" or class=="TextButton" or class=="TextBox"

	props.SkipThemeRole=nil
	props.SkipTextRole=nil
	props.ThemeRole=nil
	props.TextRole=nil
	props.StrokeRole=nil
	props.CornerRole=nil

	if props.Active==nil and (class=="Frame" or class=="ScrollingFrame" or class=="TextButton" or class=="TextBox") then
		props.Active=true
	end

	if isTextClass then
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

	if skipTextRole and isTextClass then
		obj:SetAttribute("SkipTextRole",true)
	end

	if forcedTextRole and isTextClass then
		obj:SetAttribute("ThemeTextRole",forcedTextRole)
	elseif isTextClass and not skipTextRole then
		markThemeTextRole(obj,props.TextColor3,"TEXT")
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

local function keyCodeToLabel(keyCode)
	if not keyCode or keyCode==Enum.KeyCode.Unknown then
		return "NIL"
	end

	local raw=tostring(keyCode):gsub("Enum.KeyCode%.","")
	local map={
		RightControl="RCTRL",LeftControl="LCTRL",RightShift="RSHIFT",LeftShift="LSHIFT",
		RightAlt="RALT",LeftAlt="LALT",PageDown="PGDN",PageUp="PGUP",
		BackQuote="`",Escape="ESC",Space="SPACE",Return="ENTER",Delete="DEL",Insert="INS",
		Up="UP",Down="DOWN",Left="LEFT",Right="RIGHT",
		KeypadZero="NUM0",KeypadOne="NUM1",KeypadTwo="NUM2",KeypadThree="NUM3",
		KeypadFour="NUM4",KeypadFive="NUM5",KeypadSix="NUM6",KeypadSeven="NUM7",
		KeypadEight="NUM8",KeypadNine="NUM9",
		ButtonA="PAD A",ButtonB="PAD B",ButtonX="PAD X",ButtonY="PAD Y",
		ButtonL1="LB",ButtonR1="RB",ButtonL2="LT",ButtonR2="RT",
		ButtonL3="LS",ButtonR3="RS",ButtonStart="START",ButtonSelect="SELECT",
		DPadUp="DPAD UP",DPadDown="DPAD DOWN",DPadLeft="DPAD LEFT",DPadRight="DPAD RIGHT",
		Thumbstick1="LSTICK",Thumbstick2="RSTICK",
	}

	return map[raw] or string.upper(raw)
end

local function bindingToLabel(binding)
	if binding==nil or binding==Enum.KeyCode.Unknown then
		return "NIL"
	end

	if type(binding)=="string" then
		local map={MouseButton1="LMB",MouseButton2="RMB",MouseButton3="MMB",Touch="TOUCH"}
		return map[binding] or string.upper(binding)
	end

	return keyCodeToLabel(binding)
end

local function parseKeyCodeInput(raw)
	if raw==nil then return nil end
	local cleaned=tostring(raw):gsub("^%s+",""):gsub("%s+$","")
	if cleaned=="" then return nil end
	local compact=cleaned:gsub("[%s_%-%.]+","")
	local upper=compact:upper()
	if upper=="NIL" or upper=="NONE" or upper=="UNBOUND" then
		return Enum.KeyCode.Unknown
	end

	local map={
		RCTRL="RightControl",RIGHTCTRL="RightControl",RIGHTCONTROL="RightControl",
		LCTRL="LeftControl",LEFTCTRL="LeftControl",LEFTCONTROL="LeftControl",
		RSHIFT="RightShift",RIGHTSHIFT="RightShift",LSHIFT="LeftShift",LEFTSHIFT="LeftShift",
		ESC="Escape",ESCAPE="Escape",SPACE="Space",SPACEBAR="Space",
		ENTER="Return",RETURN="Return",PGDN="PageDown",PAGEDOWN="PageDown",
		PGUP="PageUp",PAGEUP="PageUp",NUM0="KeypadZero",NUMPAD0="KeypadZero",
		NUM1="KeypadOne",NUMPAD1="KeypadOne",NUM2="KeypadTwo",NUMPAD2="KeypadTwo",
		NUM3="KeypadThree",NUMPAD3="KeypadThree",NUM4="KeypadFour",NUMPAD4="KeypadFour",
		NUM5="KeypadFive",NUMPAD5="KeypadFive",NUM6="KeypadSix",NUMPAD6="KeypadSix",
		NUM7="KeypadSeven",NUMPAD7="KeypadSeven",NUM8="KeypadEight",NUMPAD8="KeypadEight",
		NUM9="KeypadNine",NUMPAD9="KeypadNine",["`"]="BackQuote",
	}

	local enumName=map[upper] or compact
	if #enumName==1 then enumName=enumName:upper() end
	local ok,keyCode=pcall(function()
		return Enum.KeyCode[enumName]
	end)
	return ok and keyCode or nil
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

local function refreshThemePalette()
	local primary=getUIPrimaryColor()
	local lum=(primary.R*0.2126)+(primary.G*0.7152)+(primary.B*0.0722)
	local toward=lum<0.52 and Color3.new(1,1,1) or Color3.new(0,0,0)
	local away=lum<0.52 and Color3.new(0,0,0) or Color3.new(1,1,1)

	if lum<=0.16 then
		THEME.TEXT=Color3.fromRGB(248,248,248)
		THEME.MUTED=Color3.fromRGB(184,184,184)
	elseif lum>=0.78 then
		THEME.TEXT=Color3.fromRGB(10,10,10)
		THEME.MUTED=Color3.fromRGB(60,60,60)
	elseif lum<0.58 then
		THEME.TEXT=Color3.fromRGB(236,238,246)
		THEME.MUTED=Color3.fromRGB(176,176,184)
	else
		THEME.TEXT=Color3.fromRGB(20,22,28)
		THEME.MUTED=Color3.fromRGB(76,76,82)
	end

	THEME.BG=primary
	THEME.PANEL=primary:Lerp(toward,lum<0.52 and 0.07 or 0.09)
	THEME.CARD=primary:Lerp(toward,lum<0.52 and 0.12 or 0.16)
	if lum>=0.72 then
		THEME.PANEL=primary:Lerp(away,0.04)
		THEME.CARD=primary:Lerp(away,0.08)
	end
	THEME.TOPBAR=THEME.BG
	THEME.SECTION=THEME.CARD
	THEME.BUTTON=THEME.PANEL
	THEME.INPUT=THEME.PANEL
	THEME.SLIDER_BG=THEME.PANEL
	THEME.SLIDER_FILL=getUIStrokeColor()
	THEME.STROKE=getUIStrokeColor()
	THEME.STROKE_SOFT=THEME.CARD:Lerp(toward,lum<0.52 and 0.18 or 0.12)
	THEME.ACC=THEME.SLIDER_FILL
end

local function applyUIPrimaryTheme()
	refreshThemePalette()

	for obj in pairs(THEMED_GUI_OBJECTS) do
		if not obj.Parent then
			THEMED_GUI_OBJECTS[obj]=nil
		elseif obj:IsDescendantOf(screenGui) then
			local role=obj:GetAttribute("ThemeRole")
			if role and THEME[role] then
				obj.BackgroundColor3=THEME[role]
			end
		end
	end

	for obj in pairs(THEMED_TEXT_OBJECTS) do
		if not obj.Parent then
			THEMED_TEXT_OBJECTS[obj]=nil
		elseif obj:IsDescendantOf(screenGui) and not obj:GetAttribute("SkipTextRole") then
			local role=obj:GetAttribute("ThemeTextRole") or "TEXT"
			obj:SetAttribute("ThemeTextRole",role)
			if THEME[role] then
				obj.TextColor3=THEME[role]
			end
		end
	end
end

local function strokeTransparencyForRole(role,baseTransparency,styleTransparency)
	local roleTransparency=0.82
	if role=="Window" then
		roleTransparency=0.62
	elseif role=="Section" then
		roleTransparency=0.92
	elseif role=="Control" then
		roleTransparency=0.9
	elseif role=="Slider" then
		roleTransparency=0.9
	elseif role=="Accent" then
		roleTransparency=0.72
	elseif role=="Hidden" then
		roleTransparency=1
	end

	if role=="Slider" then
		return math.clamp(baseTransparency,0,1)
	elseif role=="Window" or role=="Accent" then
		return math.clamp(math.max(baseTransparency,roleTransparency),0,1)
	end

	return math.clamp(math.max(baseTransparency,styleTransparency,roleTransparency),0,1)
end

local function resolveStrokeRole(stroke)
	local explicit=stroke:GetAttribute("StrokeRole")
	if explicit then return explicit end
	local parent=stroke.Parent
	local themeRole=parent and parent:GetAttribute("ThemeRole") or nil
	local cornerRole=parent and parent:GetAttribute("CornerRole") or nil
	if cornerRole=="Window" then
		return "Window"
	elseif themeRole=="SLIDER_FILL" or themeRole=="RED" or themeRole=="GREEN" or themeRole=="BLUE" then
		return "Accent"
	elseif themeRole=="SLIDER_BG" or cornerRole=="Slider" then
		return "Slider"
	elseif themeRole=="SECTION" or themeRole=="TOPBAR" or cornerRole=="Section" then
		return "Section"
	elseif themeRole=="BUTTON" or themeRole=="INPUT" or cornerRole=="Control" then
		return "Control"
	end
	return "Control"
end

local applyUIStrokeTheme
applyUIStrokeTheme=function()
	applyUIPrimaryTheme()
	local color=getUIStrokeColor()
	local strokeHideTransparency=0.86

	for obj in pairs(THEMED_STROKES) do
		if not obj.Parent then
			THEMED_STROKES[obj]=nil
		elseif obj:IsDescendantOf(screenGui) then
			local role=resolveStrokeRole(obj)
			if role~="Fixed" then
				local accentRole=role=="Window" or role=="Accent"
				local softColor=THEME.STROKE_SOFT or color
				obj.Color=accentRole and color or softColor
				obj.Thickness=math.clamp(tonumber(UI_STYLE.StrokeThickness) or obj.Thickness,0,8)
				if obj:GetAttribute("BaseStrokeTransparency")==nil then
					obj:SetAttribute("BaseStrokeTransparency",obj.Transparency)
				end
				local baseTransparency=tonumber(obj:GetAttribute("BaseStrokeTransparency")) or obj.Transparency
				local styleTransparency=tonumber(UI_STYLE.StrokeTransparency) or 0.84
				obj.Transparency=strokeTransparencyForRole(role,baseTransparency,styleTransparency)
				pcall(function()
					obj.Enabled=obj.Transparency<strokeHideTransparency and obj.Thickness>0
				end)
				pcall(function()
					obj.LineJoinMode=Enum.LineJoinMode.Miter
				end)
			end
		end
	end

	for obj in pairs(THEMED_CORNERS) do
		if not obj.Parent then
			THEMED_CORNERS[obj]=nil
		elseif obj:IsDescendantOf(screenGui) then
			obj.CornerRadius=UDim.new(0,0)
		end
	end

	if mainFrame and mainFrame.RefreshTheme then
		pcall(function()
			mainFrame.RefreshTheme()
		end)
	end
end

local old=playerGui:FindFirstChild("HitboxUI_RojoPreview")
if old then
	old:Destroy()
end

screenGui=New("ScreenGui",{
	Name="HitboxUI_RojoPreview",
	ResetOnSpawn=false,
	ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
	IgnoreGuiInset=true,
	DisplayOrder=1000,
},playerGui)

local Description=moduleAt("gui/description")
local GuiLogicModule=moduleAt("gui/gui-logic")
local MainFrameModule=moduleAt("gui/mainframe")

local Page1HitboxLogicModule=moduleAt("features/hitbox/logic")
local Page1HitboxModule=moduleAt("features/hitbox/gui")
local Page1GameParamsLogicModule=moduleAt("features/game-params/logic")
local Page1GameParamsModule=moduleAt("features/game-params/gui")
local Page1BoostLogicModule=moduleAt("features/boost/logic")
local Page1BoostModule=moduleAt("features/boost/gui")
local Page1ESPLogicModule=moduleAt("features/esp/logic")
local Page1ESPModule=moduleAt("features/esp/gui")
local Page1ESPDefenseLogicModule=moduleAt("features/esp-defense/logic")
local Page1ESPOffenseLogicModule=moduleAt("features/esp-offense/logic")
local Page1QBAimMathModule=moduleAt("features/qb-aim/math")
local Page1QBAimLogicModule=moduleAt("features/qb-aim/logic")
local Page1QBAimModule=moduleAt("features/qb-aim/gui")
local Page1TestingLogicModule=moduleAt("features/testing/logic")
local Page1TestingModule=moduleAt("features/testing/gui")
local StrokeColourLogicModule=moduleAt("features/stroke-colour/logic")
local StrokeColourModule=moduleAt("features/stroke-colour/gui")
local MapEditorLogicModule=moduleAt("features/map-editor/logic")
local MapEditorModule=moduleAt("features/map-editor/gui")
local AntiMaterialLogicModule=moduleAt("features/anti-material/logic")
local AntiMaterialModule=moduleAt("features/anti-material/gui")
local MapCleanerLogicModule=moduleAt("features/map-cleaner/logic")
local MapCleanerModule=moduleAt("features/map-cleaner/gui")
local RemoveAdsLogicModule=moduleAt("features/remove-ads/logic")
local RemoveAdsModule=moduleAt("features/remove-ads/gui")
local HitboxPresetLogicModule=moduleAt("features/hitbox-preset/logic")
local HitboxPresetModule=moduleAt("features/hitbox-preset/gui")
local KeybindSettingsLogicModule=moduleAt("features/keybind-settings/logic")
local KeybindSettingsModule=moduleAt("features/keybind-settings/gui")
local PresetEditorLogicModule=moduleAt("features/preset-editor/logic")
local PresetEditorModule=moduleAt("features/preset-editor/gui")
local PlayerDataLogicModule=moduleAt("features/player-data/logic")
local PlayerDataModule=moduleAt("features/player-data/gui")
local ResetPositionLogicModule=moduleAt("features/reset-position/logic")
local ResetPositionModule=moduleAt("features/reset-position/gui")
local DiscordLogicModule=moduleAt("features/discord/logic")
local DiscordModule=moduleAt("features/discord/gui")

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
local wrapTextBox=GuiLogic.wrapTextBox
local placeWrappedBox=GuiLogic.placeWrappedBox
local placeWrappedButton=GuiLogic.placeWrappedButton
local setWrappedButtonBg=GuiLogic.setWrappedButtonBg
local makeBox=GuiLogic.makeBox
local objectLocalPointer=GuiLogic.objectLocalPointer

local rawMakeSection=makeSection
makeSection=function(parent,order,titleText,subtitleText,options)
	if Description and type(Description.Section)=="function" then
		local ok,newTitle,newSubtitle=pcall(Description.Section,titleText,subtitleText)
		if ok then
			titleText=newTitle
			subtitleText=newSubtitle
		end
	end
	return rawMakeSection(parent,order,titleText,subtitleText,options)
end

local currentModeKey="mode1"
local currentModeLabel="Gameplay"
local pageApis={}

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
		Services=RuntimeServices,
		Scheduler=RuntimeScheduler,
		StateStore=RuntimeStateStore,
		ThemeStore=RuntimeThemeStore,
		Janitor=RuntimeJanitor,
		THEME=THEME,
		UI_STYLE=UI_STYLE,
		State=PAGE1_STATE,
		makeSection=makeSection,
		buildSlider=buildSlider,
		buildToggleRow=buildToggleRow,
		objectLocalPointer=objectLocalPointer,
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
		Page1QBAimMathModule=Page1QBAimMathModule,
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

local function clearPage(page)
	if not page then return end
	for _,child in ipairs(page:GetChildren()) do
		if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
			child:Destroy()
		end
	end
end

local function addPageError(parent,order,title,message)
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

local function buildRuntimeModule(spec,ctx,parent,...)
	if spec.module and spec.module.new then
		local extra={...}
		local ok,result=pcall(function()
			return spec.module.new(ctx,parent,table.unpack(extra))
		end)
		if ok then
			pageApis[spec.api]=result
			return result
		end
		addPageError(parent,spec.order or 1,spec.title,tostring(result))
	else
		addPageError(parent,spec.order or 1,spec.title,"missing module")
	end
	return nil
end

local function requestPlayerAutosave() end

local function makeBaseCtx()
	return{
		New=New,
		Fusion=FusionModule,
		Services=RuntimeServices,
		Scheduler=RuntimeScheduler,
		StateStore=RuntimeStateStore,
		ThemeStore=RuntimeThemeStore,
		Janitor=RuntimeJanitor,
		THEME=THEME,
		UI_STYLE=UI_STYLE,
		UIS=UserInputService,
		SG=screenGui,
		makeSection=makeSection,
		buildSlider=buildSlider,
		buildToggleRow=buildToggleRow,
		wrapTextButton=wrapTextButton,
		wrapTextBox=wrapTextBox,
		placeWrappedBox=placeWrappedBox,
		placeWrappedButton=placeWrappedButton,
		setWrappedButtonBg=setWrappedButtonBg,
		makeBox=makeBox,
		objectLocalPointer=objectLocalPointer,
		fmtNumber=fmtNumber,
		safeDisconnect=safeDisconnect,
		inputToBinding=inputToBinding,
		bindingToLabel=bindingToLabel,
		parseKeyCodeInput=parseKeyCodeInput,
		getUIStrokeColor=getUIStrokeColor,
		getUIStrokeGradientColor=getUIStrokeGradientColor,
		getUIPrimaryColor=getUIPrimaryColor,
		applyUIStrokeTheme=applyUIStrokeTheme,
		applyUIPrimaryTheme=applyUIPrimaryTheme,
		onChanged=function()
			applyUIStrokeTheme()
		end,
	}
end

local function buildServerPage()
	clearPage(mainFrame.serverPage)
	local section=makeSection(mainFrame.serverPage,1,"Server","Studio preview only")
	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,22),
		Text="Server tools are disabled in the Studio GUI preview.",
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=THEME.MUTED,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},section)
end

local function buildMapPage()
	clearPage(mainFrame.mapPage)
	local specs={
		{module=MapEditorModule,logic=MapEditorLogicModule,api="MapEditor",order=0,title="Map Editor"},
		{module=AntiMaterialModule,logic=AntiMaterialLogicModule,api="AntiMaterial",order=1,title="Anti Material"},
		{module=MapCleanerModule,logic=MapCleanerLogicModule,api="MapCleaner",order=2,title="Map Cleaner"},
		{module=RemoveAdsModule,logic=RemoveAdsLogicModule,api="RemoveAds",order=3,title="Remove Ads"},
	}

	for _,spec in ipairs(specs) do
		local ctx=makeBaseCtx()
		ctx.WORLD_SETTINGS=WORLD_SETTINGS
		ctx.getCurrentModeKey=function() return currentModeKey end
		if spec.api=="MapEditor" then
			ctx.MapEditorLogicModule=spec.logic
		elseif spec.api=="AntiMaterial" then
			ctx.AntiMaterialLogicModule=spec.logic
		elseif spec.api=="MapCleaner" then
			ctx.MapCleanerLogicModule=spec.logic
		elseif spec.api=="RemoveAds" then
			ctx.RemoveAdsLogicModule=spec.logic
		end
		buildRuntimeModule(spec,ctx,mainFrame.mapPage)
	end
end

local function buildCustomizePage()
	clearPage(mainFrame.uiSettingsPage)
	local ctx=makeBaseCtx()
	ctx.DEFAULT_UI_STYLE=UI_STYLE
	ctx.StrokeColourLogicModule=StrokeColourLogicModule
	ctx.Page1GameParamsModule=Page1GameParamsModule
	ctx.tintSlider=function(slider,color)
		if slider and slider.fill then
			slider.fill:SetAttribute("ThemeRole",nil)
			slider.fill.BackgroundColor3=color
		end
	end
	buildRuntimeModule({module=StrokeColourModule,api="StrokeColour",order=1,title="Stroke Colour"},ctx,mainFrame.uiSettingsPage)
end

local TOGGLE_UI_KEY=Enum.KeyCode.Unknown
local TOGGLE_HB_KEY=Enum.KeyCode.Unknown
local TOGGLE_JB_KEY=Enum.KeyCode.Unknown
local TOGGLE_AB_KEY=Enum.KeyCode.Unknown
local TOGGLE_ACTION_KEY=Enum.KeyCode.Unknown
local TOGGLE_SPEED_KEY=Enum.KeyCode.Unknown
local QB_AIM_LOCK_KEY=Enum.KeyCode.H
local QB_AIM_THROW_KEY=Enum.KeyCode.T
local QB_AIM_TOGGLE_KEY=Enum.KeyCode.P

local function makeLocalPresetCode(name)
	local base=string.upper(string.sub(string.gsub(tostring(name or ""),"[^%w]",""),1,3))
	if base=="" then base="GUI" end
	return base..tostring(math.random(100,999))
end

local function applyPresetEditor(editor)
	for i=1,4 do
		local item=editor and editor[i]
		if item and PRESETS[i] then
			PRESETS[i].key=item.key or item.Key or item.binding or item.Binding or Enum.KeyCode.Unknown
			PRESETS[i].size=Vector3.new(tonumber(item.x or item.X) or 1,tonumber(item.y or item.Y) or 1,tonumber(item.z or item.Z) or 1)
		end
	end
	return true
end

local function buildKeybindsPage()
	clearPage(mainFrame.futurePage)
	local page2Wrap=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,ZIndex=4,LayoutOrder=1},mainFrame.futurePage)
	New("UIListLayout",{FillDirection=Enum.FillDirection.Vertical,Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},page2Wrap)

	local sections={
		owned=makeSection(page2Wrap,1,"Hitbox Presets","Your saved presets"),
		editor=makeSection(page2Wrap,2,"Preset Editor","Edit preset sizes and bindings"),
		bind=makeSection(page2Wrap,3,"Keybind Settings","Keyboard, mouse, and controller shortcuts"),
	}

	local bindings={
		{label="Toggle open / hide GUI",get=function() return TOGGLE_UI_KEY end,set=function(v) TOGGLE_UI_KEY=v end},
		{label="Hitbox Toggle",get=function() return TOGGLE_HB_KEY end,set=function(v) TOGGLE_HB_KEY=v end},
		{label="Jump Boost Toggle",get=function() return TOGGLE_JB_KEY end,set=function(v) TOGGLE_JB_KEY=v end},
		{label="Always Boost Toggle",get=function() return TOGGLE_AB_KEY end,set=function(v) TOGGLE_AB_KEY=v end},
		{label="ESP Toggle",get=function() return TOGGLE_ACTION_KEY end,set=function(v) TOGGLE_ACTION_KEY=v end},
		{label="Speed Toggle",get=function() return TOGGLE_SPEED_KEY end,set=function(v) TOGGLE_SPEED_KEY=v end},
		{label="QB Aim Lock Receiver",get=function() return QB_AIM_LOCK_KEY end,set=function(v) QB_AIM_LOCK_KEY=v end},
		{label="QB Aim Throw",get=function() return QB_AIM_THROW_KEY end,set=function(v) QB_AIM_THROW_KEY=v end},
		{label="QB Aim Toggle",get=function() return QB_AIM_TOGGLE_KEY end,set=function(v) QB_AIM_TOGGLE_KEY=v end},
	}

	local ctx=makeBaseCtx()
	ctx.PRESETS=PRESETS
	ctx.DEFAULT_PRESETS=DEFAULT_PRESETS
	ctx.OWNED_PRESETS=OWNED_PRESETS
	ctx.expandedOwned=PAGE2_EXPANDED_OWNED
	ctx.HitboxPresetLogicModule=HitboxPresetLogicModule
	ctx.KeybindSettingsLogicModule=KeybindSettingsLogicModule
	ctx.PresetEditorLogicModule=PresetEditorLogicModule
	ctx.BOT_API=BOT_API
	ctx.playerId=tostring(player.UserId)
	ctx.requestPlayerAutosave=requestPlayerAutosave
	ctx.setPresetSize=function(index,x,y,z)
		local preset=PRESETS[index]
		if not preset then return false,"missing preset" end
		preset.size=Vector3.new(tonumber(x) or preset.size.X,tonumber(y) or preset.size.Y,tonumber(z) or preset.size.Z)
		return true,preset.size
	end
	ctx.setPresetKey=function(index,binding)
		local preset=PRESETS[index]
		if not preset then return false,"missing preset" end
		preset.key=binding or Enum.KeyCode.Unknown
		return true,preset.key
	end
	ctx.resetPreset=function(index)
		if PRESETS[index] and DEFAULT_PRESETS[index] then
			PRESETS[index].key=DEFAULT_PRESETS[index].key
			PRESETS[index].size=DEFAULT_PRESETS[index].size
			return true,PRESETS[index]
		end
		return false,"missing preset"
	end
	ctx.applyPresetEditor=applyPresetEditor
	ctx.createOwnedPreset=function(name,editor)
		local cleanName=tostring(name or ""):gsub("^%s*(.-)%s*$","%1")
		if cleanName=="" then return false,"Name cannot be empty." end
		local preset={Code=makeLocalPresetCode(cleanName),Name=cleanName,Data={PresetEditor=editor or {}}}
		table.insert(OWNED_PRESETS,preset)
		return true,preset
	end
	ctx.equipOwnedPreset=function(preset)
		local data=preset and (preset.Data or preset.data) or {}
		return applyPresetEditor(data.PresetEditor or data.presetEditor or {})
	end
	ctx.deleteOwnedPreset=function(code,index)
		for i=#OWNED_PRESETS,1,-1 do
			if tostring(OWNED_PRESETS[i].Code or "")==tostring(code or "") then
				table.remove(OWNED_PRESETS,i)
				return true
			end
		end
		if index and OWNED_PRESETS[index] then table.remove(OWNED_PRESETS,index) end
		return true
	end
	ctx.State={}
	ctx.Bindings=bindings

	local hitboxPresets=buildRuntimeModule({module=HitboxPresetModule,api="HitboxPreset",order=1,title="Hitbox Presets"},ctx,sections.owned)
	local keybindSettings=buildRuntimeModule({module=KeybindSettingsModule,api="KeybindSettings",order=3,title="Keybind Settings"},ctx,sections.bind)
	buildRuntimeModule({module=PresetEditorModule,api="PresetEditor",order=2,title="Preset Editor"},ctx,sections.editor,keybindSettings,hitboxPresets)
end

local function showConfirmModal(titleText,bodyText,yesText,onYes,options)
	local modal=New("Frame",{BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=0.25,BorderSizePixel=0,Size=UDim2.new(1,0,1,0),ZIndex=100},screenGui)
	local box=New("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset(390,170),BackgroundColor3=THEME.SECTION or THEME.BG,BorderSizePixel=0,ZIndex=101,ThemeRole="SECTION",CornerRole="Section"},modal)
	New("UIStroke",{Color=THEME.STROKE,Thickness=2,Transparency=0},box)
	New("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,14),Size=UDim2.new(1,-32,0,24),Text=titleText,Font=Enum.Font.GothamMedium,TextSize=14,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=102},box)
	New("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,48),Size=UDim2.new(1,-32,0,54),Text=bodyText,Font=Enum.Font.Gotham,TextSize=12,TextWrapped=true,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,ZIndex=102},box)
	local function makeButton(text,x,danger,fn)
		local bg=danger and THEME.RED or (THEME.BUTTON or THEME.BG)
		local btn=New("TextButton",{Position=UDim2.fromOffset(x,120),Size=UDim2.fromOffset(104,30),BackgroundColor3=bg,BorderSizePixel=0,Text=text,Font=Enum.Font.Gotham,TextSize=12,TextColor3=danger and Color3.fromRGB(0,0,0) or THEME.TEXT,SkipTextRole=danger,AutoButtonColor=false,Selectable=true,ZIndex=102},box)
		local wrap=wrapTextButton(btn,bg,2)
		wrap:SetAttribute("ThemeRole",danger and "RED" or "BUTTON")
		btn.Activated:Connect(function()
			if modal and modal.Parent then modal:Destroy() end
			if fn then fn() end
		end)
	end
	makeButton("CANCEL",160,false)
	makeButton(yesText or "YES",274,options and options.danger==true,onYes)
	applyUIStrokeTheme()
end

local function buildSettingsPage()
	clearPage(mainFrame.actualSettingsPage)
	local updateSection=makeSection(mainFrame.actualSettingsPage,1,"Update","Reload latest GUI build")
	local updateButton=New("TextButton",{BackgroundColor3=THEME.BUTTON or THEME.BG,BorderSizePixel=0,Size=UDim2.new(1,-20,0,30),Position=UDim2.fromOffset(10,0),Text="STUDIO PREVIEW READY",Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=THEME.TEXT,AutoButtonColor=false,Selectable=true,ZIndex=6,ThemeRole="BUTTON"},updateSection)
	wrapTextButton(updateButton,THEME.BUTTON or THEME.BG,2)

	local ctx=makeBaseCtx()
	ctx.BOT_API=BOT_API
	ctx.playerId=tostring(player.UserId)
	ctx.me=player
	ctx.OWNED_PRESETS=OWNED_PRESETS
	ctx.expandedOwned=PAGE2_EXPANDED_OWNED
	ctx.showConfirmModal=showConfirmModal
	ctx.resetMainPageDefaults=function()
		for key,value in pairs({
			hitboxOn=false,
			gravityEnabled=false,
			speedEnabled=false,
			gameParamsEnabled=true,
			qbAimEnabled=false,
			testingEnabled=false,
		}) do
			PAGE1_STATE[key]=value
		end
		syncPage1State()
	end
	ctx.resetCustomizePageDefaults=function()
		UI_STYLE.PrimaryR=12
		UI_STYLE.PrimaryG=12
		UI_STYLE.PrimaryB=12
		UI_STYLE.StrokeR=182
		UI_STYLE.StrokeG=180
		UI_STYLE.StrokeB=180
		applyUIStrokeTheme()
	end
	ctx.resetKeybindPresetPageDefaults=function()
		TOGGLE_UI_KEY=Enum.KeyCode.Unknown
		TOGGLE_HB_KEY=Enum.KeyCode.Unknown
		TOGGLE_JB_KEY=Enum.KeyCode.Unknown
		TOGGLE_AB_KEY=Enum.KeyCode.Unknown
		TOGGLE_ACTION_KEY=Enum.KeyCode.Unknown
		TOGGLE_SPEED_KEY=Enum.KeyCode.Unknown
		QB_AIM_LOCK_KEY=Enum.KeyCode.H
		QB_AIM_THROW_KEY=Enum.KeyCode.T
		QB_AIM_TOGGLE_KEY=Enum.KeyCode.P
	end
	ctx.refreshPage2UI=function()
		for _,api in pairs(pageApis) do
			if api and api.Refresh then pcall(api.Refresh) end
		end
	end
	ctx.refreshSettingsPage=function()
		for _,name in ipairs({"PlayerData","ResetPosition","Discord"}) do
			local api=pageApis[name]
			if api and api.Refresh then pcall(api.Refresh) end
		end
	end

	local resetCtx=makeBaseCtx()
	resetCtx.MainFrame=mainFrame
	resetCtx.root=mainFrame.root
	resetCtx.ResetPositionLogicModule=ResetPositionLogicModule
	resetCtx.scheduleSave=requestPlayerAutosave
	buildRuntimeModule({module=ResetPositionModule,api="ResetPosition",order=2,title="GUI Position"},resetCtx,mainFrame.actualSettingsPage)

	ctx.PlayerDataLogicModule=PlayerDataLogicModule
	buildRuntimeModule({module=PlayerDataModule,api="PlayerData",order=3,title="Player Data"},ctx,mainFrame.actualSettingsPage,{})

	local discordCtx=makeBaseCtx()
	discordCtx.BOT_API=BOT_API
	discordCtx.DiscordLogicModule=DiscordLogicModule
	buildRuntimeModule({module=DiscordModule,api="Discord",order=4,title="Discord"},discordCtx,mainFrame.actualSettingsPage)
end

buildServerPage()
buildMapPage()
buildCustomizePage()
buildKeybindsPage()
buildSettingsPage()
applyUIStrokeTheme()

if mainFrame.SetActivePage then
	mainFrame.SetActivePage("main")
end

if mainFrame.UpdateResponsiveLayout then
	mainFrame.UpdateResponsiveLayout()
end

print("Rojo GUI preview loaded. Use Play Solo to inspect the rendered GUI.")
