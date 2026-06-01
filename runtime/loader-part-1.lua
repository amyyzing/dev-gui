-- Runtime chunk 1. Loaded by loader.lua with a shared environment.
Players=game:GetService("Players")
UIS=game:GetService("UserInputService")
TweenService=game:GetService("TweenService")
RunService=game:GetService("RunService")
HttpService=game:GetService("HttpService")

me=Players.LocalPlayer
guiParent=me:WaitForChild("PlayerGui")

THEME={BG=Color3.fromRGB(28,28,28), PANEL=Color3.fromRGB(33,33,33), CARD=Color3.fromRGB(38,38,38), ACC=Color3.fromRGB(32,202,106), TEXT=Color3.fromRGB(195,195,195), MUTED=Color3.fromRGB(168,168,168), STROKE=Color3.fromRGB(76,76,76), RED=Color3.fromRGB(254,94,86), BLUE=Color3.fromRGB(21,103,251), GREEN=Color3.fromRGB(32,202,106),}

UI_STYLE={
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
	StrokeTransparency=0.25,
	CornerRadius=8,
}

UI_WINDOW={W=880, H=540, MinW=560, MinH=360, MaxW=1220, MaxH=820,}

WORLD_SETTINGS={SmoothPlastic=false, OriginalMaterials=setmetatable({}, {__mode="k"})}

CURRENT_MODE_LABEL="Gameplay"
CURRENT_MODE_KEY="mode1"
uiVisible=true
toolAlive=true

hitboxOn=false
sizeX, sizeY, sizeZ=2.52, 5.4, 1.41
targetTransparency=0.7
gravityValue=196.2
speedEnabled=false
speedValue=18
athleticismOn=false
staminaRegenValue=10
staminaDepleteValue=10
jumpPowerValue=53.5
divePowerValue=1.9
jumpBoostOn=false
jumpBoostTradeMode=false
boostForceY=32
boostCooldown=5
boostChance=100
ballDetectionRadius=10
potatoMode=false
actionStatusOn=false

TOGGLE_UI_KEY=Enum.KeyCode.Unknown
TOGGLE_HB_KEY=Enum.KeyCode.Unknown
TOGGLE_JB_KEY=Enum.KeyCode.Unknown
TOGGLE_AB_KEY=Enum.KeyCode.Unknown
TOGGLE_ACTION_KEY=Enum.KeyCode.Unknown
TOGGLE_SPEED_KEY=Enum.KeyCode.Unknown
QB_AIM_LOCK_KEY=Enum.KeyCode.H
QB_AIM_THROW_KEY=Enum.KeyCode.T
QB_AIM_TOGGLE_KEY=Enum.KeyCode.P
qbAimTeamFilter=true
qbAimShowArc=true
qbAimLeadDelay=0.75

DEFAULT_PRESETS={{key=Enum.KeyCode.Unknown, size=Vector3.new(0.1, 0.1, 0.1)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.7, 5.8, 1.65)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(3.1, 5.8, 1.70)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.52, 5.4, 1.41)},}

PRESETS={{key=Enum.KeyCode.Unknown, size=Vector3.new(0.1, 0.1, 0.1)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.7, 5.8, 1.65)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(3.1, 5.8, 1.70)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.52, 5.4, 1.41)},}

OWNED_PRESETS={}
UI_MAIN={}

BOX_WRAPPERS=setmetatable({}, {__mode="k"})
BUTTON_WRAPPERS=setmetatable({}, {__mode="k"})

function colorClose(a,b)
	if not(a and b) then return false end
	return math.abs(a.R-b.R)<0.002 and math.abs(a.G-b.G)<0.002 and math.abs(a.B-b.B)<0.002
end

function markThemeRole(obj,color)
	if not(obj and color) then return end
	if obj:IsA("TextButton") and obj.Text=="" then return end

	local role=nil
	if colorClose(color,THEME.BG) then
		role="BG"
	elseif colorClose(color,THEME.PANEL) then
		role="PANEL"
	elseif colorClose(color,THEME.CARD) then
		role="CARD"
	elseif colorClose(color,THEME.TEXT) then
		role="TEXT"
	elseif colorClose(color,THEME.MUTED) then
		role="MUTED"
	elseif colorClose(color,THEME.GREEN) then
		role="GREEN"
	elseif colorClose(color,THEME.RED) then
		role="RED"
	elseif colorClose(color,THEME.BLUE) then
		role="BLUE"
	end

	if role then
		obj:SetAttribute("ThemeRole",role)
	end
end

function markThemeTextRole(obj,color)
	if not(obj and color) then return end

	local role=nil
	if colorClose(color,THEME.TEXT) then
		role="TEXT"
	elseif colorClose(color,THEME.MUTED) then
		role="MUTED"
	elseif colorClose(color,THEME.RED) then
		role="RED"
	elseif colorClose(color,THEME.GREEN) then
		role="GREEN"
	elseif colorClose(color,THEME.BLUE) then
		role="BLUE"
	end

	if role then
		obj:SetAttribute("ThemeTextRole",role)
	end
end

function translateUIText(value)
	if type(value)~="string" then
		return value
	end

	local description=Description or DescriptionModule
	if description and type(description.Text)=="function" then
		local ok,result=pcall(description.Text,value)
		if ok and result~=nil then
			return result
		end
	end

	return value
end

function New(class, props, parent)
	props=props or {}
	local skipThemeRole=props.SkipThemeRole
	local forcedThemeRole=props.ThemeRole
	local forcedTextRole=props.TextRole

	props.SkipThemeRole=nil
	props.ThemeRole=nil
	props.TextRole=nil

	if props.Active==nil and (class=="Frame" or class=="ScrollingFrame" or class=="TextButton" or class=="TextBox") then
		props.Active=true
	end

	if class=="TextLabel" or class=="TextButton" or class=="TextBox" then
		if props.TextColor3==nil then props.TextColor3=THEME.TEXT end
		if props.Font==nil then props.Font=Enum.Font.Gotham end
		props.TextStrokeTransparency=1
		props.TextStrokeColor3=Color3.fromRGB(0, 0, 0)
		if props.TextYAlignment==nil then props.TextYAlignment=Enum.TextYAlignment.Center end
		if props.Text~=nil then props.Text=translateUIText(props.Text) end
		if props.PlaceholderText~=nil then props.PlaceholderText=translateUIText(props.PlaceholderText) end

		if class=="TextBox" then
			props.TextSize=props.TextSize or 13
			props.TextScaled=false
			props.TextWrapped=false
			props.TextYAlignment=Enum.TextYAlignment.Center
		end
	end

	local obj=Instance.new(class)
	for k, v in pairs(props) do
		obj[k]=v
	end
	obj.Parent=parent

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

	if class=="TextBox" then
		obj.Focused:Connect(function()
			obj.TextSize=13
			obj.TextScaled=false
			obj.TextWrapped=false
			obj.TextYAlignment=Enum.TextYAlignment.Center
		end)

		obj.FocusLost:Connect(function()
			obj.TextSize=13
			obj.TextScaled=false
			obj.TextWrapped=false
			obj.TextYAlignment=Enum.TextYAlignment.Center
		end)
	end

	return obj
end

function safeDisconnect(conn)
	if conn and typeof(conn)=="RBXScriptConnection" then
		pcall(function()
			conn:Disconnect()
		end)
	end
end

function fmtNumber(n, decimals)
	decimals=decimals or 2
	local s=string.format("%."..decimals.."f", tonumber(n) or 0)
	s=s:gsub("(%..-)0+$", "%1"):gsub("%.$", "")
	return s
end

function keyCodeToLabel(keyCode)
	if not keyCode or keyCode==Enum.KeyCode.Unknown then
		return"NIL"
	end

	local raw=tostring(keyCode):gsub("Enum.KeyCode%.", "")
	local map={RightControl="RCTRL", LeftControl="LCTRL", RightShift="RSHIFT", LeftShift="LSHIFT", RightAlt="RALT", LeftAlt="LALT", LeftMeta="LWIN", RightMeta="RWIN", PageDown="PGDN", PageUp="PGUP", BackQuote="`", Escape="ESC", Space="SPACE", Pause="PAUSE", Return="ENTER", Delete="DEL", Insert="INS", Up="UP", Down="DOWN", Left="LEFT", Right="RIGHT", KeypadZero="NUM0", KeypadOne="NUM1", KeypadTwo="NUM2", KeypadThree="NUM3", KeypadFour="NUM4", KeypadFive="NUM5", KeypadSix="NUM6", KeypadSeven="NUM7", KeypadEight="NUM8", KeypadNine="NUM9", ButtonA="PAD A", ButtonB="PAD B", ButtonX="PAD X", ButtonY="PAD Y", ButtonL1="LB", ButtonR1="RB", ButtonL2="LT", ButtonR2="RT", ButtonL3="LS", ButtonR3="RS", ButtonStart="START", ButtonSelect="SELECT", DPadUp="DPAD UP", DPadDown="DPAD DOWN", DPadLeft="DPAD LEFT", DPadRight="DPAD RIGHT", Thumbstick1="LSTICK", Thumbstick2="RSTICK",}

	return map[raw] or string.upper(raw)
end

function parseKeyCodeInput(raw)
	if raw==nil then return nil end

	local cleaned=tostring(raw):gsub("^%s+", ""):gsub("%s+$", "")
	if cleaned=="" then return nil end

	local compact=cleaned:gsub("[%s_%-%.]+", "")
	local upper=compact:upper()

	if upper=="NIL" or upper=="NONE" or upper=="UNBOUND" then
		return Enum.KeyCode.Unknown
	end

	local map={RCTRL="RightControl", RIGHTCTRL="RightControl", RIGHTCONTROL="RightControl", LCTRL="LeftControl", LEFTCTRL="LeftControl", LEFTCONTROL="LeftControl", RSHIFT="RightShift", RIGHTSHIFT="RightShift", LSHIFT="LeftShift", LEFTSHIFT="LeftShift", ESC="Escape", ESCAPE="Escape", SPACE="Space", SPACEBAR="Space", ENTER="Return", RETURN="Return", PGDN="PageDown", PAGEDOWN="PageDown", PGUP="PageUp", PAGEUP="PageUp", PAUSE="Pause", BREAK="Pause", PAUSEBREAK="Pause", NUM0="KeypadZero", NUMPAD0="KeypadZero", NUM1="KeypadOne", NUMPAD1="KeypadOne", NUM2="KeypadTwo", NUMPAD2="KeypadTwo", NUM3="KeypadThree", NUMPAD3="KeypadThree", NUM4="KeypadFour", NUMPAD4="KeypadFour", NUM5="KeypadFive", NUMPAD5="KeypadFive", NUM6="KeypadSix", NUMPAD6="KeypadSix", NUM7="KeypadSeven", NUMPAD7="KeypadSeven", NUM8="KeypadEight", NUMPAD8="KeypadEight", NUM9="KeypadNine", NUMPAD9="KeypadNine", ["`"]="BackQuote",}

	local enumName=map[upper] or compact
	if #enumName==1 then enumName=enumName:upper() end

	local ok, keyCode=pcall(function()
		return Enum.KeyCode[enumName]
	end)

	if ok and keyCode then return keyCode end
	return nil
end

function inputToBinding(input)
	local uiType=tostring(input.UserInputType)

	local key=input.KeyCode
	if key and key~=Enum.KeyCode.Unknown then return key end

	if uiType=="Enum.UserInputType.MouseButton1" then return"MouseButton1" end
	if uiType=="Enum.UserInputType.MouseButton2" then return"MouseButton2" end
	if uiType=="Enum.UserInputType.MouseButton3" then return"MouseButton3" end

	local name=uiType:gsub("Enum.UserInputType%.", "")
	if name:match("^Gamepad") then return name end

	return nil
end

function bindingToLabel(binding)
	if binding==nil or binding==Enum.KeyCode.Unknown then
		return"NIL"
	end

	if type(binding)=="string" then
		local map={MouseButton1="LMB", MouseButton2="RMB", MouseButton3="MMB", Touch="TOUCH", Gamepad1="PAD1", Gamepad2="PAD2", Gamepad3="PAD3", Gamepad4="PAD4", Gamepad5="PAD5", Gamepad6="PAD6", Gamepad7="PAD7", Gamepad8="PAD8",}
		return map[binding] or string.upper(binding)
	end

	return keyCodeToLabel(binding)
end

function getApiKey()
	return table.concat({"the","key","to","heaven"})
end

BOT_API={
	Url="https://lint-bot-production.up.railway.app",
	Key=getApiKey(),
}

function BOT_API.GetRequestFunction()
	if typeof(syn)=="table" and type(syn.request)=="function" then return syn.request end
	if type(request)=="function" then return request end
	if type(http_request)=="function" then return http_request end
	if typeof(http)=="table" and type(http.request)=="function" then return http.request end
	if typeof(fluxus)=="table" and type(fluxus.request)=="function" then return fluxus.request end
	return nil
end

function BOT_API.Post(path,body)
	local requestFn=BOT_API.GetRequestFunction()
	if not requestFn then
		return{ok=false,error="No client HTTP request function found."}
	end

	body=body or{}
	body.apiKey=BOT_API.Key

	local ok,response=pcall(function()
		return requestFn({
			Url=BOT_API.Url..path,
			Method="POST",
			Headers={
				["Content-Type"]="application/json",
			},
			Body=HttpService:JSONEncode(body),
		})
	end)

	if not ok then
		return{ok=false,error=tostring(response)}
	end

	local raw=response and(response.Body or response.body)
	if not raw then
		return{ok=false,error="Empty response from API."}
	end

	local decodeOk,decoded=pcall(function()
		return HttpService:JSONDecode(raw)
	end)

	if not decodeOk then
		return{ok=false,error="Could not decode API response: "..tostring(raw)}
	end

	return decoded
end

AUTO_REFRESH_ENABLED=true
AUTO_REFRESH_INTERVAL=0.65
AUTO_REFRESH_RELOAD_PATH="loader.lua"

MODULE_PATHS={
	Announcement="announcement.lua",
	GuiLogic="gui/gui-logic.lua",
	MainFrame="gui/mainframe.lua",
	AutoRefresh="gui/auto-refresh.lua",
	Description="gui/description.lua",
	HitboxPreset="page-5/hitbox-preset.lua",
	KeybindSettings="page-5/keybind-settings.lua",
	PresetEditor="page-5/preset-editor.lua",
	Page1Hitbox="page-1/hitbox.lua",
	Page1Gravity="page-1/gravity.lua",
	Page1Speed="page-1/speed.lua",
	Page1GameParams="page-1/game-params.lua",
	Page1Boost="page-1/boost.lua",
	Page1ESP="page-1/esp.lua",
	Page1ESPDefense="page-1/esp-defense.lua",
	Page1ESPOffense="page-1/esp-offense.lua",
	Page1QBAim="page-1/qb-aim.lua",
	StrokeColour="page-4/stroke-colour.lua",
	MapEditor="page-2/map-editor.lua",
	AntiMaterial="page-2/anti-material.lua",
	MapCleaner="page-2/map-cleaner.lua",
	RemoveAds="page-2/remove-ads.lua",
	PlayerData="page-6/player-data.lua",
	Discord="page-6/discord.lua",
	DataSave="data-save/data-save.lua",
}
AUTO_REFRESH_WATCH_PATHS={AUTO_REFRESH_RELOAD_PATH}
for _,path in pairs(MODULE_PATHS) do
	table.insert(AUTO_REFRESH_WATCH_PATHS,path)
end
APP_RUNTIME_PATH_SET={}
if type(APP_RUNTIME_PATHS)=="table" then
	for _,path in ipairs(APP_RUNTIME_PATHS) do
		APP_RUNTIME_PATH_SET[path]=true
		table.insert(AUTO_REFRESH_WATCH_PATHS,path)
	end
end

REMOTE_MODULE_CACHE={}
REMOTE_MODULE_SOURCES={}
if type(APP_RUNTIME_SOURCES)=="table" then
	for path,source in pairs(APP_RUNTIME_SOURCES) do
		REMOTE_MODULE_SOURCES[path]=source
	end
end
rebuildPage1FromModules=nil
rebuildCustomizeFromModules=nil
rebuildMapFromModules=nil
rebuildSettingsFromModules=nil
rebuildPage2FromModules=nil

function loadModuleFromSource(modulePath,source)
	local chunk,err=loadstring(source)
	if not chunk then
		REMOTE_MODULE_SOURCES[modulePath]=source
		return nil,err
	end

	local ok,module=pcall(chunk)
	if not ok then
		REMOTE_MODULE_SOURCES[modulePath]=source
		return nil,module
	end

	REMOTE_MODULE_SOURCES[modulePath]=source
	REMOTE_MODULE_CACHE[modulePath]=module
	return module,nil
end

function loadRemoteModule(modulePath)
	if REMOTE_MODULE_CACHE[modulePath] then
		return REMOTE_MODULE_CACHE[modulePath]
	end

	local result=BOT_API.Post("/module/get",{path=modulePath})
	if not result or not result.ok then
		REMOTE_MODULE_SOURCES[modulePath]=false
		warn("Failed to load remote module:",modulePath,result and result.error or"unknown")
		return nil
	end

	local module,err=loadModuleFromSource(modulePath,result.source)
	if not module then
		warn("Remote module failed while loading:",modulePath,err)
		return nil
	end

	return module
end

SG_NAME="1"
for _,existingName in ipairs({"HitboxUI_DarkInfluenced_GUIOnly",SG_NAME}) do
	old=guiParent:FindFirstChild(existingName)
	if old then old:Destroy() end
end

SG=New("ScreenGui", {Name=SG_NAME, ResetOnSpawn=false, ZIndexBehavior=Enum.ZIndexBehavior.Sibling, IgnoreGuiInset=true, DisplayOrder=1000}, guiParent)
LOADER_Z=10000

LOADER_TOTAL=0
for _ in pairs(MODULE_PATHS) do
	LOADER_TOTAL+=1
end

loaderCurrent=0
loaderOverlay=New("Frame",{
	Name="Loader",
	BackgroundColor3=Color3.fromRGB(16,16,16),
	BackgroundTransparency=1,
	BorderSizePixel=0,
	Size=UDim2.new(1,0,1,0),
	ZIndex=LOADER_Z,
},SG)

loaderBox=New("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,0,0.5,0),
	Size=UDim2.fromOffset(430,150),
	BackgroundColor3=THEME.BG,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=LOADER_Z+1,
},loaderOverlay)

loaderBoxStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=1},loaderBox)
New("UIPadding",{PaddingTop=UDim.new(0,16),PaddingLeft=UDim.new(0,18),PaddingRight=UDim.new(0,18),PaddingBottom=UDim.new(0,16)},loaderBox)

loaderTitle=New("TextLabel",{
	BackgroundTransparency=1,
	Size=UDim2.new(1,0,0,26),
	Text="Loading GUI",
	Font=Enum.Font.GothamMedium,
	TextSize=16,
	TextColor3=THEME.TEXT,
	TextTransparency=1,
	TextXAlignment=Enum.TextXAlignment.Left,
	ZIndex=LOADER_Z+2,
},loaderBox)

loaderStatus=New("TextLabel",{
	BackgroundTransparency=1,
	Position=UDim2.fromOffset(0,34),
	Size=UDim2.new(1,0,0,34),
	Text="Preparing remote modules...",
	Font=Enum.Font.Gotham,
	TextSize=12,
	TextColor3=THEME.MUTED,
	TextTransparency=1,
	TextWrapped=true,
	TextXAlignment=Enum.TextXAlignment.Left,
	ZIndex=LOADER_Z+2,
},loaderBox)

loaderTrack=New("Frame",{
	Position=UDim2.fromOffset(0,82),
	Size=UDim2.new(1,0,0,10),
	BackgroundColor3=THEME.PANEL,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=LOADER_Z+2,
},loaderBox)

loaderTrackStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=1},loaderTrack)

loaderFill=New("Frame",{
	Size=UDim2.new(0,0,1,0),
	BackgroundColor3=THEME.GREEN,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=LOADER_Z+3,
},loaderTrack)

loaderPercent=New("TextLabel",{
	BackgroundTransparency=1,
	Position=UDim2.fromOffset(0,100),
	Size=UDim2.new(1,0,0,18),
	Text="0%",
	Font=Enum.Font.Gotham,
	TextSize=11,
	TextColor3=THEME.MUTED,
	TextTransparency=1,
	TextXAlignment=Enum.TextXAlignment.Left,
	ZIndex=LOADER_Z+2,
},loaderBox)

function showLoader()
	if not loaderOverlay or not loaderOverlay.Parent then return end

	local ti=TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
	TweenService:Create(loaderOverlay,ti,{BackgroundTransparency=0}):Play()
	TweenService:Create(loaderBox,ti,{BackgroundTransparency=0}):Play()
	TweenService:Create(loaderBoxStroke,ti,{Transparency=0}):Play()
	TweenService:Create(loaderTitle,ti,{TextTransparency=0}):Play()
	TweenService:Create(loaderStatus,ti,{TextTransparency=0}):Play()
	TweenService:Create(loaderPercent,ti,{TextTransparency=0}):Play()
	TweenService:Create(loaderTrack,ti,{BackgroundTransparency=0}):Play()
	TweenService:Create(loaderTrackStroke,ti,{Transparency=0}):Play()
	TweenService:Create(loaderFill,ti,{BackgroundTransparency=0}):Play()
end

showLoader()

function setLoaderProgress(text,current,total,isProblem)
	if not loaderOverlay or not loaderOverlay.Parent then return end

	current=math.clamp(tonumber(current) or 0,0,tonumber(total) or LOADER_TOTAL)
	total=math.max(tonumber(total) or LOADER_TOTAL,1)

	local pct=math.clamp(current/total,0,1)
	loaderStatus.Text=tostring(text or "Loading...")
	loaderStatus.TextColor3=isProblem and THEME.RED or THEME.MUTED
	loaderPercent.Text=math.floor(pct*100+0.5).."%"
	loaderFill.BackgroundColor3=isProblem and THEME.RED or THEME.GREEN
	TweenService:Create(loaderFill,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(pct,0,1,0)}):Play()
	task.wait()
end

function finishLoader()
	if not loaderOverlay or not loaderOverlay.Parent then return end

	loaderTitle.Text="Welcome, "..me.Name.."!"
	setLoaderProgress("Everything is loaded and up to date.",LOADER_TOTAL,LOADER_TOTAL,false)

	task.delay(1.2,function()
		if not loaderOverlay or not loaderOverlay.Parent then return end

		local ti=TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		TweenService:Create(loaderOverlay,ti,{BackgroundTransparency=1}):Play()

		for _,obj in ipairs(loaderOverlay:GetDescendants()) do
			if obj:IsA("TextLabel") or obj:IsA("TextButton") then
				TweenService:Create(obj,ti,{TextTransparency=1}):Play()
			elseif obj:IsA("Frame") then
				TweenService:Create(obj,ti,{BackgroundTransparency=1}):Play()
			elseif obj:IsA("UIStroke") then
				TweenService:Create(obj,ti,{Transparency=1}):Play()
			end
		end

		task.delay(0.24,function()
			if loaderOverlay then
				loaderOverlay:Destroy()
				loaderOverlay=nil
			end
		end)
	end)
end

function closeAfterAutoRefreshError(message,path)
	if not(SG and SG.Parent) then return end

	local overlay=New("Frame",{
		Name="RefreshError",
		BackgroundColor3=Color3.fromRGB(0,0,0),
		BackgroundTransparency=0.08,
		BorderSizePixel=0,
		Size=UDim2.new(1,0,1,0),
		ZIndex=LOADER_Z+20,
	},SG)

	local box=New("Frame",{
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.new(0.5,0,0.5,0),
		Size=UDim2.fromOffset(410,128),
		BackgroundColor3=THEME.BG,
		BorderSizePixel=0,
		ZIndex=LOADER_Z+21,
	},overlay)
	New("UIStroke",{Color=THEME.RED,Thickness=1,Transparency=0},box)
	New("UIPadding",{PaddingTop=UDim.new(0,16),PaddingLeft=UDim.new(0,18),PaddingRight=UDim.new(0,18),PaddingBottom=UDim.new(0,16)},box)

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,24),
		Text="Closing... encountered error",
		Font=Enum.Font.GothamMedium,
		TextSize=16,
		TextColor3=THEME.RED,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=LOADER_Z+22,
	},box)

	New("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(0,34),
		Size=UDim2.new(1,0,0,48),
		Text=tostring(path or message or "Auto-refresh failed."),
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=THEME.MUTED,
		TextWrapped=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextYAlignment=Enum.TextYAlignment.Top,
		ZIndex=LOADER_Z+22,
	},box)

	task.delay(1.35,function()
		if shutdownTool then
			pcall(shutdownTool)
		else
			toolAlive=false
			if SG and SG.Parent then
				SG:Destroy()
			end
		end
	end)
end

function loadRemoteModuleStep(name,path)
	loaderCurrent+=1
	setLoaderProgress("Fetching "..path,loaderCurrent-0.35,LOADER_TOTAL,false)
	local module=loadRemoteModule(path)
	setLoaderProgress((module and "Loaded " or "Missing ")..path,loaderCurrent,LOADER_TOTAL,not module)
	return module
end

GuiLogicModule=loadRemoteModuleStep("GuiLogic",MODULE_PATHS.GuiLogic)
MainFrameModule=loadRemoteModuleStep("MainFrame",MODULE_PATHS.MainFrame)
AutoRefreshModule=loadRemoteModuleStep("AutoRefresh",MODULE_PATHS.AutoRefresh)
DescriptionModule=loadRemoteModuleStep("Description",MODULE_PATHS.Description)
AnnouncementModule=loadRemoteModuleStep("Announcement",MODULE_PATHS.Announcement)
HitboxPresetModule=loadRemoteModuleStep("HitboxPreset",MODULE_PATHS.HitboxPreset)
KeybindSettingsModule=loadRemoteModuleStep("KeybindSettings",MODULE_PATHS.KeybindSettings)
PresetEditorModule=loadRemoteModuleStep("PresetEditor",MODULE_PATHS.PresetEditor)
Page1HitboxModule=loadRemoteModuleStep("Page1Hitbox",MODULE_PATHS.Page1Hitbox)
Page1GravityModule=loadRemoteModuleStep("Page1Gravity",MODULE_PATHS.Page1Gravity)
Page1SpeedModule=loadRemoteModuleStep("Page1Speed",MODULE_PATHS.Page1Speed)
Page1GameParamsModule=loadRemoteModuleStep("Page1GameParams",MODULE_PATHS.Page1GameParams)
Page1BoostModule=loadRemoteModuleStep("Page1Boost",MODULE_PATHS.Page1Boost)
Page1ESPModule=loadRemoteModuleStep("Page1ESP",MODULE_PATHS.Page1ESP)
Page1ESPDefenseModule=loadRemoteModuleStep("Page1ESPDefense",MODULE_PATHS.Page1ESPDefense)
Page1ESPOffenseModule=loadRemoteModuleStep("Page1ESPOffense",MODULE_PATHS.Page1ESPOffense)
Page1QBAimModule=loadRemoteModuleStep("Page1QBAim",MODULE_PATHS.Page1QBAim)
StrokeColourModule=loadRemoteModuleStep("StrokeColour",MODULE_PATHS.StrokeColour)
MapEditorModule=loadRemoteModuleStep("MapEditor",MODULE_PATHS.MapEditor)
AntiMaterialModule=loadRemoteModuleStep("AntiMaterial",MODULE_PATHS.AntiMaterial)
MapCleanerModule=loadRemoteModuleStep("MapCleaner",MODULE_PATHS.MapCleaner)
RemoveAdsModule=loadRemoteModuleStep("RemoveAds",MODULE_PATHS.RemoveAds)
PlayerDataModule=loadRemoteModuleStep("PlayerData",MODULE_PATHS.PlayerData)
DiscordModule=loadRemoteModuleStep("Discord",MODULE_PATHS.Discord)
DataSaveModule=loadRemoteModuleStep("DataSave",MODULE_PATHS.DataSave)

function runLoaderCheck()
	local missing={}

	for name,path in pairs(MODULE_PATHS) do
		if not REMOTE_MODULE_CACHE[path] then
			table.insert(missing,name.." ("..path..")")
		end
	end

	if #missing>0 then
		table.sort(missing)
		warn("Loader check found missing modules:",table.concat(missing,", "))
		setLoaderProgress("Missing modules: "..table.concat(missing,", "),LOADER_TOTAL,LOADER_TOTAL,true)
	else
		warn("Loader check complete: all remote modules loaded.")
		setLoaderProgress("Verified remote modules.",LOADER_TOTAL,LOADER_TOTAL,false)
	end
end

runLoaderCheck()

PAGE1_RELOAD_PATHS={
	[MODULE_PATHS.Page1Hitbox]=function(module) Page1HitboxModule=module end,
	[MODULE_PATHS.Page1Gravity]=function(module) Page1GravityModule=module end,
	[MODULE_PATHS.Page1Speed]=function(module) Page1SpeedModule=module end,
	[MODULE_PATHS.Page1GameParams]=function(module) Page1GameParamsModule=module end,
	[MODULE_PATHS.Page1Boost]=function(module) Page1BoostModule=module end,
	[MODULE_PATHS.Page1ESP]=function(module) Page1ESPModule=module end,
	[MODULE_PATHS.Page1ESPDefense]=function(module) Page1ESPDefenseModule=module end,
	[MODULE_PATHS.Page1ESPOffense]=function(module) Page1ESPOffenseModule=module end,
	[MODULE_PATHS.Page1QBAim]=function(module) Page1QBAimModule=module end,
}

function getUIStrokeColor()
	return Color3.fromRGB(math.clamp(math.floor(UI_STYLE.StrokeR+0.5), 0, 255), math.clamp(math.floor(UI_STYLE.StrokeG+0.5), 0, 255), math.clamp(math.floor(UI_STYLE.StrokeB+0.5), 0, 255))
end

function getUIStrokeGradientColor()
	return Color3.fromRGB(math.clamp(math.floor(UI_STYLE.GradientR+0.5), 0, 255), math.clamp(math.floor(UI_STYLE.GradientG+0.5), 0, 255), math.clamp(math.floor(UI_STYLE.GradientB+0.5), 0, 255))
end

function getUIPrimaryColor()
	return Color3.fromRGB(math.clamp(math.floor((UI_STYLE.PrimaryR or 28)+0.5),0,255),math.clamp(math.floor((UI_STYLE.PrimaryG or 28)+0.5),0,255),math.clamp(math.floor((UI_STYLE.PrimaryB or 28)+0.5),0,255))
end

function refreshThemePalette()
	local primary=getUIPrimaryColor()
	local lum=(primary.R*0.2126)+(primary.G*0.7152)+(primary.B*0.0722)
	local toward=lum<0.52 and Color3.new(1,1,1) or Color3.new(0,0,0)
	local away=lum<0.52 and Color3.new(0,0,0) or Color3.new(1,1,1)

	THEME.BG=primary
	THEME.PANEL=primary:Lerp(toward,lum<0.52 and 0.07 or 0.09)
	THEME.CARD=primary:Lerp(toward,lum<0.52 and 0.12 or 0.16)
	THEME.TEXT=lum<0.58 and Color3.fromRGB(226,226,226) or Color3.fromRGB(24,24,24)
	THEME.MUTED=lum<0.58 and Color3.fromRGB(168,168,168) or Color3.fromRGB(82,82,82)
	THEME.ACC=THEME.GREEN

	if lum>=0.72 then
		THEME.PANEL=primary:Lerp(away,0.04)
		THEME.CARD=primary:Lerp(away,0.08)
	end
end

function applyUIPrimaryTheme()
	refreshThemePalette()

	if not SG then return end

	for _,obj in ipairs(SG:GetDescendants()) do
		local role=obj:GetAttribute("ThemeRole")
		if role and THEME[role] and obj:IsA("GuiObject") then
			obj.BackgroundColor3=THEME[role]
		end

		local textRole=obj:GetAttribute("ThemeTextRole")
		if textRole and THEME[textRole] and (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then
			obj.TextColor3=THEME[textRole]
		end
	end
end

liquidStrokeConn=nil
MainFrame=nil
AutoRefreshAPI=nil
applyUIStrokeTheme=nil

function reapplyThemeAfterAutoRefresh()
	task.defer(function()
		if applyUIStrokeTheme then pcall(applyUIStrokeTheme) end
		if MainFrame and MainFrame.UpdateResponsiveLayout then pcall(MainFrame.UpdateResponsiveLayout) end
	end)
end

function runAutoRefreshStep(label,fn,...)
	if not fn then return end

	local ok,err=pcall(fn,...)
	if not ok then
		error("Auto-refresh "..tostring(label).." failed: "..tostring(err))
	end
end

function applyAutoRefreshModuleChange(changedPath,module)
	if changedPath==MODULE_PATHS.Description then
		DescriptionModule=module
		Description=module

		if MainFrame and MainFrame.RefreshText then
			runAutoRefreshStep("main text refresh",MainFrame.RefreshText,Description)
		end

		runAutoRefreshStep("page 1 rebuild",rebuildPage1FromModules)
		runAutoRefreshStep("customize rebuild",rebuildCustomizeFromModules)
		runAutoRefreshStep("map rebuild",rebuildMapFromModules)
		runAutoRefreshStep("settings rebuild",rebuildSettingsFromModules)
		runAutoRefreshStep("keybind rebuild",rebuildPage2FromModules)
		runAutoRefreshStep("ui refresh",refreshAllUI)
		reapplyThemeAfterAutoRefresh()
		return true
	end

	local applyPage1Module=PAGE1_RELOAD_PATHS[changedPath]
	if applyPage1Module then
		applyPage1Module(module)

		if rebuildPage1FromModules then
			warn("Auto-refreshing page module after remote change:",changedPath)
			rebuildPage1FromModules()
		else
			warn("Auto-refresh cached page module, rebuild not ready:",changedPath)
		end

		reapplyThemeAfterAutoRefresh()
		return true
	end

	if changedPath==MODULE_PATHS.StrokeColour then
		StrokeColourModule=module
		if rebuildCustomizeFromModules then
			warn("Auto-refreshing customize module after remote change:",changedPath)
			rebuildCustomizeFromModules()
		else
			warn("Auto-refresh cached customize module, rebuild not ready:",changedPath)
		end
		reapplyThemeAfterAutoRefresh()
		return true
	end

	if changedPath==MODULE_PATHS.MapEditor or changedPath==MODULE_PATHS.AntiMaterial or changedPath==MODULE_PATHS.MapCleaner or changedPath==MODULE_PATHS.RemoveAds then
		if changedPath==MODULE_PATHS.MapEditor then
			MapEditorModule=module
		elseif changedPath==MODULE_PATHS.AntiMaterial then
			AntiMaterialModule=module
		elseif changedPath==MODULE_PATHS.MapCleaner then
			MapCleanerModule=module
		else
			RemoveAdsModule=module
		end

		if rebuildMapFromModules then
			warn("Auto-refreshing map module after remote change:",changedPath)
			rebuildMapFromModules()
		else
			warn("Auto-refresh cached map module, rebuild not ready:",changedPath)
		end
		reapplyThemeAfterAutoRefresh()
		return true
	end

	if changedPath==MODULE_PATHS.PlayerData or changedPath==MODULE_PATHS.Discord then
		if changedPath==MODULE_PATHS.PlayerData then
			PlayerDataModule=module
		else
			DiscordModule=module
		end

		if rebuildSettingsFromModules then
			warn("Auto-refreshing settings module after remote change:",changedPath)
			rebuildSettingsFromModules()
		else
			warn("Auto-refresh cached settings module, rebuild not ready:",changedPath)
		end

		reapplyThemeAfterAutoRefresh()
		return true
	end

	return false
end

function startAutoRefresh()
	if not AUTO_REFRESH_ENABLED then return end
	if not(AutoRefreshModule and AutoRefreshModule.new) then
		warn("Missing remote module: gui/auto-refresh.lua")
		return
	end

	AutoRefreshAPI=AutoRefreshModule.new({
		BOT_API=BOT_API,
		enabled=AUTO_REFRESH_ENABLED,
		interval=AUTO_REFRESH_INTERVAL,
		reloadPath=AUTO_REFRESH_RELOAD_PATH,
		watchPaths=AUTO_REFRESH_WATCH_PATHS,
		sources=REMOTE_MODULE_SOURCES,
		loadModuleFromSource=loadModuleFromSource,
		setToolAlive=function(value)
			toolAlive=value and true or false
		end,
		alive=function()
			return toolAlive and SG and SG.Parent and guiParent:FindFirstChild(SG_NAME)==SG
		end,
		shouldReloadMain=function(changedPath)
			return APP_RUNTIME_PATH_SET[changedPath] or changedPath==MODULE_PATHS.GuiLogic or changedPath==MODULE_PATHS.MainFrame or changedPath==MODULE_PATHS.Announcement or changedPath==MODULE_PATHS.AutoRefresh
		end,
		applyModuleChange=applyAutoRefreshModuleChange,
		onError=closeAfterAutoRefreshError,
	})

	AutoRefreshAPI.Start()
end

function stopLiquidStrokeAnimation()
	safeDisconnect(liquidStrokeConn)
	liquidStrokeConn=nil
end

function updateLiquidStrokeAnimation()
	if not UI_STYLE.LiquidStroke then
		stopLiquidStrokeAnimation()
		return
	end

	local speed=tonumber(UI_STYLE.LiquidStrokeSpeed) or 1
	if speed<=0 then
		stopLiquidStrokeAnimation()
		return
	end

	if liquidStrokeConn then
		return
	end

	local t=0
	local elapsed=0

	liquidStrokeConn=RunService.RenderStepped:Connect(function(dt)
		if not toolAlive or not SG or not SG.Parent or not UI_STYLE.LiquidStroke then
			stopLiquidStrokeAnimation()
			return
		end

		local currentSpeed=tonumber(UI_STYLE.LiquidStrokeSpeed) or 1
		if currentSpeed<=0 then
			stopLiquidStrokeAnimation()
			return
		end

		t=(t+(dt*42*currentSpeed))%360
		elapsed+=dt

		if elapsed<0.03 then
			return
		end

		elapsed=0

		local direction=tostring(UI_STYLE.LiquidStrokeDirection or "Right")
		local wave=math.sin(math.rad(t*2))*0.25

		for _,obj in ipairs(SG:GetDescendants()) do
			if obj:IsA("UIGradient") and obj.Name=="StrokeGradient" then
				if direction=="Right" then
					obj.Rotation=0
					obj.Offset=Vector2.new(wave,0)

				elseif direction=="Left" then
					obj.Rotation=0
					obj.Offset=Vector2.new(-wave,0)

				elseif direction=="Down" then
					obj.Rotation=90
					obj.Offset=Vector2.new(0,wave)

				elseif direction=="Up" then
					obj.Rotation=90
					obj.Offset=Vector2.new(0,-wave)

				elseif direction=="SpinCW" then
					obj.Offset=Vector2.new(0,0)
					obj.Rotation=t

				elseif direction=="SpinCCW" then
					obj.Offset=Vector2.new(0,0)
					obj.Rotation=-t

				else
					obj.Rotation=t
					obj.Offset=Vector2.new(wave,0)
				end
			end
		end
	end)
end

applyUIStrokeTheme=function()
	applyUIPrimaryTheme()

	local color=getUIStrokeColor()
	local color2=getUIStrokeGradientColor()
	THEME.STROKE=color

	if not SG then return end

	for _,obj in ipairs(SG:GetDescendants()) do
		if obj:IsA("UIStroke") then
			obj.Color=color
			obj.Thickness=math.clamp(tonumber(UI_STYLE.StrokeThickness) or obj.Thickness,0,8)
			obj.Transparency=math.clamp(tonumber(UI_STYLE.StrokeTransparency) or obj.Transparency,0,1)

			pcall(function()
				obj.LineJoinMode=Enum.LineJoinMode.Round
			end)

			local gradient=obj:FindFirstChild("StrokeGradient")

			if UI_STYLE.StrokeGradient or UI_STYLE.LiquidStroke then
				if not gradient then
					gradient=Instance.new("UIGradient")
					gradient.Name="StrokeGradient"
					gradient.Parent=obj
				end

				if UI_STYLE.LiquidStroke then
					gradient.Color=ColorSequence.new({
						ColorSequenceKeypoint.new(0,color),
						ColorSequenceKeypoint.new(0.45,color2),
						ColorSequenceKeypoint.new(0.55,color2),
						ColorSequenceKeypoint.new(1,color),
					})
				else
					gradient.Rotation=0
					gradient.Offset=Vector2.new(0,0)
					gradient.Color=ColorSequence.new({
						ColorSequenceKeypoint.new(0,color),
						ColorSequenceKeypoint.new(1,color2),
					})
				end
			else
				if gradient then
					gradient:Destroy()
				end
			end

		elseif obj:IsA("UICorner") then
			obj.CornerRadius=UDim.new(0,math.clamp(tonumber(UI_STYLE.CornerRadius) or 8,0,24))
		end
	end

	if MainFrame and MainFrame.RefreshTheme then
		pcall(function()
			MainFrame.RefreshTheme()
		end)
	end

	updateLiquidStrokeAnimation()
end

function setUIVisible(state)
	uiVisible=state and true or false
	if SG and SG.Parent then
		SG.Enabled=uiVisible
	end
end

function requireGuiModule(name,path,module)
	if module and type(module.new)=="function" then
		return module
	end

	error("Loader failed: "..name.." did not load from "..path)
end

GuiLogicModule=requireGuiModule("GuiLogic",MODULE_PATHS.GuiLogic,GuiLogicModule)
MainFrameModule=requireGuiModule("MainFrame",MODULE_PATHS.MainFrame,MainFrameModule)
