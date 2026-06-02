-- HB_RUNTIME_PART_1
-- Runtime chunk 1. Loaded by loader.lua with a shared environment.
Players=game:GetService("Players")
UIS=game:GetService("UserInputService")
TweenService=game:GetService("TweenService")
RunService=game:GetService("RunService")
HttpService=game:GetService("HttpService")

me=Players.LocalPlayer
guiParent=me:WaitForChild("PlayerGui")

THEME={BG=Color3.fromRGB(28,28,28), PANEL=Color3.fromRGB(33,33,33), CARD=Color3.fromRGB(38,38,38), ACC=Color3.fromRGB(32,202,106), TEXT=Color3.fromRGB(195,195,195), MUTED=Color3.fromRGB(168,168,168), STROKE=Color3.fromRGB(76,76,76), RED=Color3.fromRGB(254,94,86), BLUE=Color3.fromRGB(21,103,251), GREEN=Color3.fromRGB(32,202,106),}

UI_STYLE={}

UI_WINDOW={}

WORLD_SETTINGS={SmoothPlastic=false, OriginalMaterials=setmetatable({}, {__mode="k"})}

CURRENT_MODE_LABEL="Gameplay"
CURRENT_MODE_KEY="mode1"
uiVisible=true
toolAlive=true

hitboxOn=false
sizeX, sizeY, sizeZ=2.52, 5.4, 1.41
targetTransparency=0.7
gravityEnabled=false
gravityValue=196.2
speedEnabled=false
speedValue=18
gameParamsEnabled=false
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
qbAimEnabled=false

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
	elseif colorClose(color,THEME.STROKE) then
		role="STROKE"
	elseif colorClose(color,THEME.GREEN) then
		role="GREEN"
	elseif colorClose(color,THEME.RED) then
		role="RED"
	elseif colorClose(color,THEME.BLUE) then
		role="BLUE"
	elseif THEME.STROKE_SOFT and colorClose(color,THEME.STROKE_SOFT) then
		role="STROKE_SOFT"
	elseif THEME.TOPBAR and colorClose(color,THEME.TOPBAR) then
		role="TOPBAR"
	elseif THEME.SECTION and colorClose(color,THEME.SECTION) then
		role="SECTION"
	elseif THEME.BUTTON and colorClose(color,THEME.BUTTON) then
		role="BUTTON"
	elseif THEME.INPUT and colorClose(color,THEME.INPUT) then
		role="INPUT"
	elseif THEME.SLIDER_BG and colorClose(color,THEME.SLIDER_BG) then
		role="SLIDER_BG"
	elseif THEME.SLIDER_FILL and colorClose(color,THEME.SLIDER_FILL) then
		role="SLIDER_FILL"
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

	if forcedCornerRole then
		obj:SetAttribute("CornerRole",forcedCornerRole)
	end

	if forcedStrokeRole then
		obj:SetAttribute("StrokeRole",forcedStrokeRole)
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
	if type(BOOT_BOT_API)=="table" and type(BOOT_BOT_API.Key)=="string" then
		return BOOT_BOT_API.Key
	end

	return nil
end

TRUSTED_API_URL="https://lint-bot-production.up.railway.app"

API_ALLOWED_PATHS={
	["/module/get"]=true,
	["/player/save"]=true,
	["/player/load"]=true,
	["/player/wipe"]=true,
	["/player/session"]=true,
	["/player/log"]=true,
	["/preset/create"]=true,
	["/preset/equip"]=true,
	["/preset/delete"]=true,
	["/preset/list-owned"]=true,
	["/invite-link/get"]=true,
	["/announcement/latest"]=true,
	["/announcement/seen"]=true,
}

BOT_API={
	Url=TRUSTED_API_URL,
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
	if type(path)~="string" or not API_ALLOWED_PATHS[path] then
		return{ok=false,error="API path blocked: "..tostring(path)}
	end

	if BOT_API.Url~=TRUSTED_API_URL then
		return{ok=false,error="API URL verification failed."}
	end

	if type(BOT_API.Key)~="string" or BOT_API.Key=="" then
		return{ok=false,error="API key verification failed."}
	end

	if path=="/module/get" and isAllowedModulePath and not isAllowedModulePath(body and body.path) then
		return{ok=false,error="Module path blocked: "..tostring(body and body.path)}
	end

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
AUTO_REFRESH_INTERVAL=0.25
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
	PrimaryColour="page-4/primary.lua",
	SecondaryColour="page-4/secondary.lua",
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
MODULE_PATH_SET={}
for _,path in pairs(MODULE_PATHS) do
	MODULE_PATH_SET[path]=true
end
MODULE_PATH_SET[AUTO_REFRESH_RELOAD_PATH]=true
for path in pairs(APP_RUNTIME_PATH_SET) do
	MODULE_PATH_SET[path]=true
end
OPTIONAL_MODULE_PATH_SET={
	[MODULE_PATHS.PrimaryColour]=true,
	[MODULE_PATHS.SecondaryColour]=true,
}
MAX_REMOTE_MODULE_BYTES=300000
REMOTE_MODULE_MARKERS={[AUTO_REFRESH_RELOAD_PATH]="HB_LOADER_V2"}

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
rebuildDataSaveFromModule=nil

function isAllowedModulePath(modulePath)
	return type(modulePath)=="string" and MODULE_PATH_SET[modulePath]==true
end

function verifyRemoteModuleSource(modulePath,source)
	if not isAllowedModulePath(modulePath) then
		return false,"Module path is not allowed: "..tostring(modulePath)
	end

	if type(source)~="string" or source=="" then
		return false,"Module source missing: "..tostring(modulePath)
	end

	if #source>MAX_REMOTE_MODULE_BYTES then
		return false,"Module source too large: "..tostring(modulePath)
	end

	local marker=(type(APP_RUNTIME_MARKERS)=="table" and APP_RUNTIME_MARKERS[modulePath]) or REMOTE_MODULE_MARKERS[modulePath]
	if marker and not source:find(marker,1,true) then
		return false,"Module marker verification failed: "..tostring(modulePath)
	end

	return true,nil
end

function loadModuleFromSource(modulePath,source)
	local verified,verifyErr=verifyRemoteModuleSource(modulePath,source)
	if not verified then
		REMOTE_MODULE_SOURCES[modulePath]=false
		return nil,verifyErr
	end

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
	if not isAllowedModulePath(modulePath) then
		warn("Blocked remote module path:",modulePath)
		return nil
	end

	if REMOTE_MODULE_CACHE[modulePath] then
		return REMOTE_MODULE_CACHE[modulePath]
	end

	local result=BOT_API.Post("/module/get",{path=modulePath})
	if not result or not result.ok then
		REMOTE_MODULE_SOURCES[modulePath]=false
		if OPTIONAL_MODULE_PATH_SET[modulePath] then
			warn("Optional remote module unavailable:",modulePath,result and result.error or"unknown")
		else
			warn("Failed to load remote module:",modulePath,result and result.error or"unknown")
		end
		return nil
	end

	local module,err=loadModuleFromSource(modulePath,result.source)
	if not module then
		warn("Remote module failed while loading:",modulePath,err)
		return nil
	end

	return module
end

SG_NAME="HitboxUI"
for _,existingName in ipairs({"HitboxUI_DarkInfluenced_GUIOnly","1",SG_NAME}) do
	old=guiParent:FindFirstChild(existingName)
	if old then old:Destroy() end
end

SG=New("ScreenGui", {Name=SG_NAME, ResetOnSpawn=false, ZIndexBehavior=Enum.ZIndexBehavior.Sibling, IgnoreGuiInset=true, DisplayOrder=1000}, guiParent)
LOADER_Z=10000
loaderAlive=true

function playLoaderKeyframes(sequence,asynchronous)
	local function run()
		for _,step in ipairs(sequence or {}) do
			if not loaderAlive then return end

			if type(step)=="number" then
				task.wait(step)
			elseif type(step)=="function" then
				pcall(step)
			elseif type(step)=="table" then
				local instance=step[1]
				local direction=step[2] or Enum.EasingDirection.Out
				local style=step[3] or Enum.EasingStyle.Quad
				local duration=tonumber(step[4]) or 0.15
				local properties=step[5] or {}

				if instance and instance.Parent then
					local tween=TweenService:Create(instance,TweenInfo.new(duration,style,direction),properties)
					tween:Play()
					tween.Completed:Wait()
				end
			end
		end
	end

	if asynchronous then
		task.spawn(run)
	else
		run()
	end
end

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

loaderBackdropA=New("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,-160,0.5,-96),
	Size=UDim2.fromOffset(2,2),
	BackgroundColor3=THEME.GREEN,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=LOADER_Z,
},loaderOverlay)

loaderBackdropB=New("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,180,0.5,94),
	Size=UDim2.fromOffset(2,2),
	BackgroundColor3=THEME.BLUE,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=LOADER_Z,
},loaderOverlay)

loaderBox=New("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,0,0.5,0),
	Size=UDim2.fromOffset(430,150),
	BackgroundColor3=THEME.BG,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=LOADER_Z+1,
},loaderOverlay)

loaderBoxScale=New("UIScale",{Scale=0.92},loaderBox)
loaderBoxStroke=New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=1},loaderBox)
New("UIPadding",{PaddingTop=UDim.new(0,16),PaddingLeft=UDim.new(0,18),PaddingRight=UDim.new(0,18),PaddingBottom=UDim.new(0,16)},loaderBox)

loaderAccent=New("Frame",{
	BackgroundColor3=THEME.GREEN,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	Position=UDim2.new(0,0,0,0),
	Size=UDim2.new(0,0,0,2),
	ZIndex=LOADER_Z+2,
},loaderBox)

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

loaderScan=New("Frame",{
	BackgroundColor3=Color3.fromRGB(255,255,255),
	BackgroundTransparency=1,
	BorderSizePixel=0,
	Position=UDim2.new(0,-72,0,0),
	Size=UDim2.fromOffset(72,10),
	ZIndex=LOADER_Z+4,
},loaderTrack)

New("UIGradient",{
	Transparency=NumberSequence.new({
		NumberSequenceKeypoint.new(0,1),
		NumberSequenceKeypoint.new(0.45,0.34),
		NumberSequenceKeypoint.new(1,1),
	}),
},loaderScan)

loaderPulse=New("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,0,0.5,0),
	Size=UDim2.fromOffset(430,150),
	BackgroundColor3=THEME.GREEN,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=LOADER_Z,
},loaderOverlay)

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

	playLoaderKeyframes({
		{loaderOverlay,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.18,{BackgroundTransparency=0}},
	},true)

	playLoaderKeyframes({
		function()
			if loaderBoxScale then loaderBoxScale.Scale=0.92 end
			if loaderAccent then loaderAccent.Size=UDim2.new(0,0,0,2) end
		end,
		{loaderBackdropA,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.24,{BackgroundTransparency=0.92,Size=UDim2.fromOffset(520,260)}},
		{loaderBackdropB,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.24,{BackgroundTransparency=0.94,Size=UDim2.fromOffset(460,220)}},
		{loaderBox,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.18,{BackgroundTransparency=0}},
		{loaderBoxScale,Enum.EasingDirection.Out,Enum.EasingStyle.Back,0.22,{Scale=1}},
	},true)

	local ti=TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
	TweenService:Create(loaderBoxStroke,ti,{Transparency=0}):Play()
	TweenService:Create(loaderTitle,ti,{TextTransparency=0}):Play()
	TweenService:Create(loaderStatus,ti,{TextTransparency=0}):Play()
	TweenService:Create(loaderPercent,ti,{TextTransparency=0}):Play()
	TweenService:Create(loaderTrack,ti,{BackgroundTransparency=0}):Play()
	TweenService:Create(loaderTrackStroke,ti,{Transparency=0}):Play()
	TweenService:Create(loaderFill,ti,{BackgroundTransparency=0}):Play()
	TweenService:Create(loaderAccent,TweenInfo.new(0.34,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency=0,Size=UDim2.new(1,0,0,2)}):Play()

	task.spawn(function()
		while loaderAlive and loaderOverlay and loaderOverlay.Parent and loaderScan and loaderScan.Parent do
			loaderScan.Position=UDim2.new(0,-72,0,0)
			loaderScan.BackgroundTransparency=0.74
			local scanTween=TweenService:Create(loaderScan,TweenInfo.new(0.9,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position=UDim2.new(1,72,0,0)})
			scanTween:Play()
			scanTween.Completed:Wait()
			task.wait(0.1)
		end
	end)
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

	if loaderAccent then
		loaderAccent.BackgroundColor3=isProblem and THEME.RED or THEME.GREEN
	end

	if loaderPulse then
		loaderPulse.BackgroundColor3=isProblem and THEME.RED or THEME.GREEN
		loaderPulse.BackgroundTransparency=0.94
		loaderPulse.Size=UDim2.fromOffset(410,132)
		TweenService:Create(loaderPulse,TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
			BackgroundTransparency=1,
			Size=UDim2.fromOffset(470,170),
		}):Play()
	end

	if isProblem and loaderBoxStroke then
		TweenService:Create(loaderBoxStroke,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Color=THEME.RED,Transparency=0}):Play()
	else
		TweenService:Create(loaderBoxStroke,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Color=THEME.STROKE,Transparency=0}):Play()
	end
end

function finishLoader()
	if not loaderOverlay or not loaderOverlay.Parent then return end

	loaderTitle.Text="Welcome, "..me.Name.."!"
	setLoaderProgress("Everything is loaded and up to date.",LOADER_TOTAL,LOADER_TOTAL,false)

	playLoaderKeyframes({
		{loaderPulse,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.18,{BackgroundTransparency=0.88,Size=UDim2.fromOffset(520,190)}},
		{loaderPulse,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.28,{BackgroundTransparency=1,Size=UDim2.fromOffset(620,240)}},
	},true)

	task.delay(0.48,function()
		if not loaderOverlay or not loaderOverlay.Parent then return end
		loaderAlive=false

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
PrimaryColourModule=loadRemoteModuleStep("PrimaryColour",MODULE_PATHS.PrimaryColour)
SecondaryColourModule=loadRemoteModuleStep("SecondaryColour",MODULE_PATHS.SecondaryColour)
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
		if not OPTIONAL_MODULE_PATH_SET[path] and not REMOTE_MODULE_CACHE[path] then
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

local function fallbackOriginalUILibProfile()
	return{
		Id="original",
		Name="Original",
		Style={
			Primary=Color3.fromRGB(28,28,28),
			Stroke=Color3.fromRGB(76,76,76),
			Gradient=Color3.fromRGB(45,45,45),
			GradientOn=false,
			StrokeThickness=1,
			StrokeTransparency=0.72,
		},
		Theme={},
		Shape={WindowRadius=0,SectionRadius=0,ControlRadius=0,SliderRadius=0,SliderHeight=26,SliderStyle="original",WindowStrokeTransparency=0.42,SectionStrokeTransparency=0.84,ControlStrokeTransparency=0.78,SliderStrokeTransparency=0.78,AccentStrokeTransparency=0.58},
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
			SectionStrokeTransparency=0.62,
			SectionBodyInset=2,
			SectionBodyGap=6,
			SliderLabelPlacement="above",
			SliderRowHeight=48,
			SliderTrackWidth=172,
			SliderLabelWidth=150,
			SliderLabelHeight=14,
			SliderLabelY=2,
			SliderControlGap=4,
			SliderBottomPadding=6,
			SliderValueBoxWidth=58,
			SliderValueBoxVisible=true,
			SliderContainerTransparency=0.12,
			SliderContainerStrokeTransparency=0.65,
			SliderLabelX=12,
			SliderRightPadding=8,
			ToggleWidth=48,
			ToggleHeight=20,
			ToggleKnobSize=16,
			TogglePad=2,
			ToggleStyle="switch",
			ToggleOffRole="RED",
			ToggleStrokeTransparency=0.72,
			TextBoxHeight=28,
			ButtonHeight=30,
			ControlStrokeTransparency=0.55,
		},
		Defaults={PrimaryR=28,PrimaryG=28,PrimaryB=28,StrokeR=76,StrokeG=76,StrokeB=76,GradientR=45,GradientG=45,GradientB=45,StrokeGradient=false,LiquidStroke=false,LiquidStrokeSpeed=1,LiquidStrokeDirection="Right",StrokeThickness=1,StrokeTransparency=0.72,CornerRadius=0,UILib="original",ThemePanelExpanded=false,ColoursPanelExpanded=false},
		MainFrame={
			Window={W=880,H=540,MinW=560,MinH=360,MaxW=1220,MaxH=820,StartY=80,MinimizedH=68},
			Layout={RootPadding=8,MainGap=8,PageGap=8,ColumnGap=8,FooterGap=8,HeaderHeight=52,PageBarHeight=30,PageTabWidth=106,PageTabHeight=28,PageHostReserve=156,FooterHeight=34,TopButtonSize=28,TopButtonGap=6,TopButtonOuter=10,FabSize=42},
		},
	}
end

UILibOriginalModule=fallbackOriginalUILibProfile()

local function tableField(module,key,base)
	if type(module)=="table" and type(module[key])=="table" then
		return module[key]
	end

	return base and base[key] or {}
end

local function normalizeUILibProfile(module,base)
	base=base or fallbackOriginalUILibProfile()
	module=type(module)=="table" and module or {}

	return{
		Id=tostring(module.Id or base.Id or "original"):lower(),
		Name=module.Name or base.Name or "Original",
		Style=tableField(module,"Style",base),
		Theme=tableField(module,"Theme",base),
		Shape=tableField(module,"Shape",base),
		Components=tableField(module,"Components",base),
		Tones=tableField(module,"Tones",base),
		Defaults=tableField(module,"Defaults",base),
		MainFrame=tableField(module,"MainFrame",base),
	}
end

function getDefaultUILibProfile()
	return normalizeUILibProfile(UILibOriginalModule,fallbackOriginalUILibProfile())
end

function getDefaultUILibId()
	local profile=getDefaultUILibProfile()
	return tostring(profile.Id or "original"):lower()
end

function getUILibRuntimeStyle(id)
	return getDefaultUILibProfile()
end

function getCurrentUILibProfile()
	return getUILibRuntimeStyle(UI_STYLE and UI_STYLE.UILib or getDefaultUILibId())
end

function getDefaultUIStyle()
	local defaults=(getDefaultUILibProfile() or {}).Defaults or fallbackOriginalUILibProfile().Defaults
	local result={}

	for k,v in pairs(defaults) do
		result[k]=v
	end

	result.UILib=tostring(result.UILib or getDefaultUILibId())
	return result
end

function getDefaultUIWindow()
	local profile=getDefaultUILibProfile() or fallbackOriginalUILibProfile()
	local mainFrame=type(profile.MainFrame)=="table" and profile.MainFrame or {}
	local window=type(mainFrame.Window)=="table" and mainFrame.Window or fallbackOriginalUILibProfile().MainFrame.Window
	local result={}

	for k,v in pairs(window) do
		result[k]=v
	end

	return result
end

function applyDefaultUIStyleFields(style,force)
	style=style or UI_STYLE
	local defaults=getDefaultUIStyle()

	for k,v in pairs(defaults) do
		if force or style[k]==nil then
			style[k]=v
		end
	end

	style.UILib=getDefaultUILibId()

	return style
end

function applyDefaultUIWindowFields(window,force)
	window=window or UI_WINDOW
	local defaults=getDefaultUIWindow()

	for k,v in pairs(defaults) do
		if force or window[k]==nil then
			window[k]=v
		end
	end

	return window
end

applyDefaultUIStyleFields(UI_STYLE,false)
applyDefaultUIWindowFields(UI_WINDOW,false)

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

	THEME.TOPBAR=THEME.BG
	THEME.SECTION=THEME.CARD
	THEME.BUTTON=THEME.PANEL
	THEME.INPUT=THEME.PANEL
	THEME.SLIDER_BG=THEME.PANEL
	THEME.SLIDER_FILL=THEME.STROKE
	THEME.STROKE_SOFT=THEME.CARD:Lerp(toward,lum<0.52 and 0.18 or 0.12)

	local libId=tostring(UI_STYLE.UILib or "original"):lower()
	local libStyle=getUILibRuntimeStyle(libId)
	local libTheme=libStyle and libStyle.Theme or {}

	for role,color in pairs(libTheme) do
		THEME[role]=color
	end

	local tones=libStyle and libStyle.Tones
	if type(tones)=="table" and tones.topbar~=nil then
		local accent=getUIStrokeColor()
		local function surface(amount)
			if amount>=0 then
				return primary:Lerp(toward,amount)
			end

			return primary:Lerp(away,-amount)
		end

		THEME.BG=surface(0)
		THEME.TOPBAR=surface(tones.topbar)
		THEME.PANEL=surface(tones.panel)
		THEME.CARD=surface(tones.card)
		THEME.SECTION=surface(tones.section)
		THEME.BUTTON=surface(tones.button)
		THEME.INPUT=surface(tones.input)
		THEME.SLIDER_BG=tones.sliderAccent and accent:Lerp(primary,tones.sliderBlend or 0.5) or surface(tones.sliderBg)
		THEME.SLIDER_FILL=accent
		THEME.STROKE_SOFT=surface(tones.strokeSoft)

		local textLum=(THEME.BG.R*0.2126)+(THEME.BG.G*0.7152)+(THEME.BG.B*0.0722)
		THEME.TEXT=textLum<0.58 and Color3.fromRGB(236,238,246) or Color3.fromRGB(20,22,28)
		THEME.MUTED=textLum<0.58 and THEME.TEXT:Lerp(THEME.BG,0.42) or THEME.TEXT:Lerp(THEME.BG,0.5)
	end

	THEME.ACC=THEME.SLIDER_FILL or THEME.GREEN
	UI_STYLE.CornerRadius=(libStyle.Shape and libStyle.Shape.WindowRadius) or 0
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
	if resetRuntimeEffectsBeforeAutoRefresh then
		local ok,err=pcall(resetRuntimeEffectsBeforeAutoRefresh,changedPath)
		if not ok then
			warn("Auto-refresh effect reset failed:",err)
		end
	end

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

	if changedPath==MODULE_PATHS.StrokeColour or changedPath==MODULE_PATHS.PrimaryColour or changedPath==MODULE_PATHS.SecondaryColour then
		if changedPath==MODULE_PATHS.StrokeColour then
			StrokeColourModule=module
		elseif changedPath==MODULE_PATHS.PrimaryColour then
			PrimaryColourModule=module
		else
			SecondaryColourModule=module
		end

		if applyDefaultUIStyleFields then
			applyDefaultUIStyleFields(UI_STYLE,false)
		end
		if applyDefaultUIWindowFields then
			applyDefaultUIWindowFields(UI_WINDOW,false)
		end

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

	if changedPath==MODULE_PATHS.DataSave then
		DataSaveModule=module

		if rebuildDataSaveFromModule then
			warn("Auto-refreshing data-save module after remote change:",changedPath)
			rebuildDataSaveFromModule(false)
		else
			warn("Auto-refresh cached data-save module, rebuild not ready:",changedPath)
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
		getRemoteSource=function(path)
			local result=BOT_API.Post("/module/get",{path=path})
			if not result or not result.ok or type(result.source)~="string" then
				return nil,result and result.error or "unknown"
			end

			local verified,verifyErr=verifyRemoteModuleSource(path,result.source)
			if not verified then
				return nil,verifyErr
			end

			return result.source,nil
		end,
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
		optionalPaths=OPTIONAL_MODULE_PATH_SET,
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
	local color=getUIStrokeColor()
	local color2=getUIStrokeGradientColor()
	THEME.STROKE=color
	applyUIPrimaryTheme()

	if not SG then return end

	local libShape=(getUILibRuntimeStyle(UI_STYLE.UILib) or {}).Shape or {}
	local function getStrokeRole(stroke)
		local explicit=stroke:GetAttribute("StrokeRole")
		if explicit then
			return explicit
		end

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

	local function strokeRoleRadius(role)
		if role=="Window" then
			return tonumber(libShape.WindowRadius) or 0
		elseif role=="Section" then
			return tonumber(libShape.SectionRadius) or 0
		elseif role=="Slider" then
			return tonumber(libShape.SliderRadius) or 0
		elseif role=="Control" or role=="Accent" then
			return tonumber(libShape.ControlRadius) or 0
		end

		return 0
	end

	local function getRoleStrokeTransparency(role,baseTransparency,styleTransparency)
		local roleTransparency=0.82

		if role=="Window" then
			roleTransparency=libShape.WindowStrokeTransparency or 0.42
		elseif role=="Section" then
			roleTransparency=libShape.SectionStrokeTransparency or 0.86
		elseif role=="Control" then
			roleTransparency=libShape.ControlStrokeTransparency or 0.82
		elseif role=="Slider" then
			roleTransparency=libShape.SliderStrokeTransparency or 0.8
		elseif role=="Accent" then
			roleTransparency=libShape.AccentStrokeTransparency or 0.58
		elseif role=="Hidden" then
			roleTransparency=1
		end

		if role=="Window" or role=="Accent" then
			return math.clamp(math.max(baseTransparency,roleTransparency),0,1)
		end

		return math.clamp(math.max(baseTransparency,styleTransparency,roleTransparency),0,1)
	end

	for _,obj in ipairs(SG:GetDescendants()) do
		if obj:IsA("UIStroke") then
			local role=getStrokeRole(obj)
			if role~="Fixed" then
				local accentRole=role=="Window" or role=="Accent"
				local softColor=THEME.STROKE_SOFT or (THEME.CARD and THEME.CARD:Lerp(THEME.TEXT or color,0.12)) or color

				obj.Color=accentRole and color or softColor
				obj.Thickness=math.clamp(tonumber(UI_STYLE.StrokeThickness) or obj.Thickness,0,8)
				if obj:GetAttribute("BaseStrokeTransparency")==nil then
					obj:SetAttribute("BaseStrokeTransparency",obj.Transparency)
				end

				local baseTransparency=tonumber(obj:GetAttribute("BaseStrokeTransparency")) or obj.Transparency
				local styleTransparency=tonumber(UI_STYLE.StrokeTransparency) or 0.72
				obj.Transparency=getRoleStrokeTransparency(role,baseTransparency,styleTransparency)

				pcall(function()
					obj.LineJoinMode=strokeRoleRadius(role)>0 and Enum.LineJoinMode.Round or Enum.LineJoinMode.Miter
				end)

				local gradient=obj:FindFirstChild("StrokeGradient")

				if (UI_STYLE.StrokeGradient or UI_STYLE.LiquidStroke) and accentRole then
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
			end

		elseif obj:IsA("UICorner") then
			local shape=(getUILibRuntimeStyle(UI_STYLE.UILib) or {}).Shape or {}
			local role=obj.Parent and obj.Parent:GetAttribute("CornerRole") or "Control"
			local radius=shape.ControlRadius or 0

			if role=="Window" then
				radius=shape.WindowRadius or radius
			elseif role=="Section" then
				radius=shape.SectionRadius or radius
			elseif role=="Slider" then
				radius=shape.SliderRadius or radius
			end

			obj.CornerRadius=UDim.new(0,radius)
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
