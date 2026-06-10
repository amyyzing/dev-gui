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
testingEnabled=false

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
qbAimCatchAhead=8.0
qbAimLeadDelay=8.0
qbAimPeakHeight=14.00

DEFAULT_PRESETS={{key=Enum.KeyCode.Unknown, size=Vector3.new(0.1, 0.1, 0.1)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.7, 5.8, 1.65)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(3.1, 5.8, 1.70)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.52, 5.4, 1.41)},}

PRESETS={{key=Enum.KeyCode.Unknown, size=Vector3.new(0.1, 0.1, 0.1)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.7, 5.8, 1.65)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(3.1, 5.8, 1.70)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.52, 5.4, 1.41)},}

OWNED_PRESETS={}
UI_MAIN={}

BOX_WRAPPERS=setmetatable({}, {__mode="k"})
BUTTON_WRAPPERS=setmetatable({}, {__mode="k"})
THEMED_GUI_OBJECTS=setmetatable({}, {__mode="k"})
THEMED_TEXT_OBJECTS=setmetatable({}, {__mode="k"})
THEMED_STROKES=setmetatable({}, {__mode="k"})
THEMED_CORNERS=setmetatable({}, {__mode="k"})
LIQUID_STROKE_GRADIENTS=setmetatable({}, {__mode="k"})
RUNTIME_CONNECTIONS={}

function trackRuntimeConnection(conn)
	if conn then
		table.insert(RUNTIME_CONNECTIONS,conn)
	end

	return conn
end

function untrackRuntimeConnection(conn)
	for index=#RUNTIME_CONNECTIONS,1,-1 do
		if RUNTIME_CONNECTIONS[index]==conn then
			table.remove(RUNTIME_CONNECTIONS,index)
			return
		end
	end
end

function disconnectRuntimeConnections()
	for _,conn in ipairs(RUNTIME_CONNECTIONS) do
		if typeof(conn)=="RBXScriptConnection" then
			pcall(function()
				conn:Disconnect()
			end)
		elseif type(conn)=="function" then
			pcall(conn)
		end
	end

	table.clear(RUNTIME_CONNECTIONS)
end

function registerThemeObject(obj)
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

function colorClose(a,b)
	if not(a and b) then return false end
	return math.abs(a.R-b.R)<0.002 and math.abs(a.G-b.G)<0.002 and math.abs(a.B-b.B)<0.002
end

local THEME_ROLE_NAMES={"BG","PANEL","CARD","TEXT","MUTED","STROKE","GREEN","RED","BLUE","STROKE_SOFT","TOPBAR","SECTION","BUTTON","INPUT","SLIDER_BG","SLIDER_FILL"}
local THEME_TEXT_ROLE_NAMES={"TEXT","MUTED","RED","GREEN","BLUE"}

local function findThemeRole(color,roles)
	for _,role in ipairs(roles) do
		if THEME[role] and colorClose(color,THEME[role]) then
			return role
		end
	end
end

function markThemeRole(obj,color)
	if not(obj and color) then return end
	registerThemeObject(obj)
	if obj:IsA("TextButton") and obj.Text=="" then return end

	local role=findThemeRole(color,THEME_ROLE_NAMES)
	if role then
		obj:SetAttribute("ThemeRole",role)
	end
end

function markThemeTextRole(obj,color)
	if not(obj and color) then return end
	registerThemeObject(obj)

	local role=findThemeRole(color,THEME_TEXT_ROLE_NAMES)
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
		for k, v in pairs(props) do
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

	if class=="TextBox" then
		trackRuntimeConnection(obj.Focused:Connect(function()
			obj.TextSize=13
			obj.TextScaled=false
			obj.TextWrapped=false
			obj.TextYAlignment=Enum.TextYAlignment.Center
		end))

		trackRuntimeConnection(obj.FocusLost:Connect(function()
			obj.TextSize=13
			obj.TextScaled=false
			obj.TextWrapped=false
			obj.TextYAlignment=Enum.TextYAlignment.Center
		end))
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
	["/module/batch"]=true,
	["/module/manifest"]=true,
	["/player/save"]=true,
	["/player/load"]=true,
	["/player/wipe"]=true,
	["/player/session"]=true,
	["/player/log"]=true,
	["/preset/create"]=true,
	["/preset/equip"]=true,
	["/preset/delete"]=true,
	["/preset/load"]=true,
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

	if (path=="/module/manifest" or path=="/module/batch") and isAllowedModulePath and type(body)=="table" and type(body.paths)=="table" then
		for _,modulePath in ipairs(body.paths) do
			if not isAllowedModulePath(modulePath) then
				return{ok=false,error="Module path blocked: "..tostring(modulePath)}
			end
		end
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

MANUAL_REFRESH_RELOAD_PATH="loader.lua"

MODULE_PATHS={
	Announcement="announcement.lua",
	GuiFusion="gui/fusion.lua",
	GuiLogic="gui/gui-logic.lua",
	MainFrame="gui/mainframe.lua",
	Description="gui/description.lua",
	HitboxPreset="page-5/hitbox-preset/gui.lua",
	HitboxPresetLogic="page-5/hitbox-preset/logic.lua",
	KeybindSettings="page-5/keybind-settings/gui.lua",
	KeybindSettingsLogic="page-5/keybind-settings/logic.lua",
	PresetEditor="page-5/preset-editor/gui.lua",
	PresetEditorLogic="page-5/preset-editor/logic.lua",
	Page1Hitbox="page-1/hitbox/gui.lua",
	Page1HitboxLogic="page-1/hitbox/logic.lua",
	Page1Gravity="page-1/gravity/gui.lua",
	Page1GravityLogic="page-1/gravity/logic.lua",
	Page1Speed="page-1/speed/gui.lua",
	Page1SpeedLogic="page-1/speed/logic.lua",
	Page1GameParams="page-1/game-params/gui.lua",
	Page1GameParamsLogic="page-1/game-params/logic.lua",
	Page1Boost="page-1/boost/gui.lua",
	Page1BoostLogic="page-1/boost/logic.lua",
	Page1ESP="page-1/esp/gui.lua",
	Page1ESPLogic="page-1/esp/logic.lua",
	Page1ESPDefense="page-1/esp-defense/gui.lua",
	Page1ESPDefenseLogic="page-1/esp-defense/logic.lua",
	Page1ESPOffense="page-1/esp-offense/gui.lua",
	Page1ESPOffenseLogic="page-1/esp-offense/logic.lua",
	Page1QBAim="page-1/qb-aim/gui.lua",
	Page1QBAimLogic="page-1/qb-aim/logic.lua",
	Page1Testing="page-1/testing/gui.lua",
	Page1TestingLogic="page-1/testing/logic.lua",
	PrimaryColour="page-4/primary/gui.lua",
	PrimaryColourLogic="page-4/primary/logic.lua",
	SecondaryColour="page-4/secondary/gui.lua",
	SecondaryColourLogic="page-4/secondary/logic.lua",
	StrokeColour="page-4/stroke-colour/gui.lua",
	StrokeColourLogic="page-4/stroke-colour/logic.lua",
	MapEditor="page-2/map-editor/gui.lua",
	MapEditorLogic="page-2/map-editor/logic.lua",
	AntiMaterial="page-2/anti-material/gui.lua",
	AntiMaterialLogic="page-2/anti-material/logic.lua",
	MapCleaner="page-2/map-cleaner/gui.lua",
	MapCleanerLogic="page-2/map-cleaner/logic.lua",
	RemoveAds="page-2/remove-ads/gui.lua",
	RemoveAdsLogic="page-2/remove-ads/logic.lua",
	PlayerData="page-6/player-data/gui.lua",
	PlayerDataLogic="page-6/player-data/logic.lua",
	Discord="page-6/discord/gui.lua",
	DiscordLogic="page-6/discord/logic.lua",
	DataSave="data-save/data-save.lua",
}
MODULE_GLOBAL_NAMES={GuiFusion="FusionModule"}
STARTUP_MODULE_NAMES={"GuiFusion","GuiLogic","MainFrame","Description","Announcement","Page1HitboxLogic","Page1Hitbox","Page1GravityLogic","Page1Gravity","Page1SpeedLogic","Page1Speed","Page1GameParamsLogic","Page1GameParams","Page1BoostLogic","Page1Boost","Page1ESPDefenseLogic","Page1ESPDefense","Page1ESPOffenseLogic","Page1ESPOffense","Page1ESPLogic","Page1ESP","Page1QBAimLogic","Page1QBAim","Page1TestingLogic","Page1Testing","DataSave"}
OPTIONAL_MODULE_NAMES={"PrimaryColour","SecondaryColour"}
MAP_RELOAD_NAMES={"MapEditorLogic","MapEditor","AntiMaterialLogic","AntiMaterial","MapCleanerLogic","MapCleaner","RemoveAdsLogic","RemoveAds"}
CUSTOMIZE_RELOAD_NAMES={"StrokeColourLogic","StrokeColour"}
PAGE2_RELOAD_NAMES={"HitboxPresetLogic","HitboxPreset","KeybindSettingsLogic","KeybindSettings","PresetEditorLogic","PresetEditor"}
SETTINGS_RELOAD_NAMES={"PlayerDataLogic","PlayerData","DiscordLogic","Discord"}

function moduleGlobalName(name)
	return MODULE_GLOBAL_NAMES[name] or (tostring(name).."Module")
end

function setLoadedModule(name,module)
	getfenv()[moduleGlobalName(name)]=module
	return module
end

function modulePathsFromNames(names)
	local paths={}

	for _,name in ipairs(names or {}) do
		local path=MODULE_PATHS[name]
		if path then
			table.insert(paths,path)
		end
	end

	return paths
end

APP_RUNTIME_PATH_SET={}
if type(APP_RUNTIME_PATHS)=="table" then
	for _,path in ipairs(APP_RUNTIME_PATHS) do
		APP_RUNTIME_PATH_SET[path]=true
	end
end
MODULE_PATH_SET={}
for _,path in pairs(MODULE_PATHS) do
	MODULE_PATH_SET[path]=true
end
MODULE_PATH_SET[MANUAL_REFRESH_RELOAD_PATH]=true
for path in pairs(APP_RUNTIME_PATH_SET) do
	MODULE_PATH_SET[path]=true
end
STARTUP_MODULE_PATHS=modulePathsFromNames(STARTUP_MODULE_NAMES)
STARTUP_MODULE_PATH_SET={}
for _,path in ipairs(STARTUP_MODULE_PATHS) do
	STARTUP_MODULE_PATH_SET[path]=true
end
DEFERRED_MODULE_PATH_SET={}
for _,path in pairs(MODULE_PATHS) do
	if not STARTUP_MODULE_PATH_SET[path] then
		DEFERRED_MODULE_PATH_SET[path]=true
	end
end
OPTIONAL_MODULE_PATH_SET={}
for _,path in ipairs(modulePathsFromNames(OPTIONAL_MODULE_NAMES)) do
	OPTIONAL_MODULE_PATH_SET[path]=true
end
MAX_REMOTE_MODULE_BYTES=300000
REMOTE_MODULE_MARKERS={[MANUAL_REFRESH_RELOAD_PATH]="HB_LOADER_V2"}

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

function loadRemoteModuleBatch(paths)
	if type(paths)~="table" or #paths==0 then
		return false,"No module paths requested."
	end

	setLoaderProgress("Fetching remote module batch...",0.2,LOADER_TOTAL,false)

	local result=BOT_API.Post("/module/batch",{paths=paths})
	if not(result and result.ok and type(result.modules)=="table") then
		return false,result and result.error or "Module batch unavailable."
	end

	local loaded=0
	local failed=0

	for index,modulePath in ipairs(paths) do
		local item=result.modules[modulePath]
		local module=nil
		local err=nil

		if item and type(item.source)=="string" then
			module,err=loadModuleFromSource(modulePath,item.source)
		else
			err=result.errors and result.errors[modulePath] or "Module source missing from batch."
		end

		if module then
			loaded+=1
		else
			failed+=1
			REMOTE_MODULE_SOURCES[modulePath]=false
			if OPTIONAL_MODULE_PATH_SET[modulePath] then
				warn("Optional batched module unavailable:",modulePath,err)
			else
				warn("Batched module failed while loading:",modulePath,err)
			end
		end

		if index%8==0 or index==#paths then
			setLoaderProgress("Loaded remote module batch ("..tostring(loaded).."/"..tostring(#paths)..")",math.min(index,LOADER_TOTAL),LOADER_TOTAL,failed>0)
		end
	end

	return loaded>0,nil
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

LOADER_TOTAL=#STARTUP_MODULE_PATHS

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
	Position=UDim2.new(0.5,-44,0.5,-28),
	Size=UDim2.fromOffset(2,2),
	BackgroundColor3=THEME.GREEN,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=LOADER_Z,
},loaderOverlay)
New("UICorner",{CornerRadius=UDim.new(1,0)},loaderBackdropA)

loaderBackdropB=New("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,52,0.5,34),
	Size=UDim2.fromOffset(2,2),
	BackgroundColor3=THEME.BLUE,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=LOADER_Z,
},loaderOverlay)
New("UICorner",{CornerRadius=UDim.new(1,0)},loaderBackdropB)

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
	ClipsDescendants=true,
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
		{loaderBackdropA,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.24,{BackgroundTransparency=0.965,Size=UDim2.fromOffset(360,170)}},
		{loaderBackdropB,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.24,{BackgroundTransparency=0.972,Size=UDim2.fromOffset(320,150)}},
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

function loadRemoteModuleStep(name,path)
	loaderCurrent+=1
	local cached=REMOTE_MODULE_CACHE[path]
	if cached then
		setLoaderProgress("Loaded cached "..path,loaderCurrent,LOADER_TOTAL,false)
		return cached
	end

	setLoaderProgress("Fetching "..path,loaderCurrent-0.35,LOADER_TOTAL,false)
	local module=loadRemoteModule(path)
	setLoaderProgress((module and "Loaded " or "Missing ")..path,loaderCurrent,LOADER_TOTAL,not module)
	return module
end

function loadRemoteModuleStepByName(name)
	local path=MODULE_PATHS[name]
	if not path then
		warn("Missing module path for:",name)
		return nil
	end

	return setLoadedModule(name,loadRemoteModuleStep(name,path))
end

function loadDeferredModule(name,path,current)
	if current~=nil then
		return current
	end

	local module=loadRemoteModule(path)
	if not module and not OPTIONAL_MODULE_PATH_SET[path] then
		warn("Deferred module unavailable:",name,path)
	end
	return module
end

local batchLoaded,batchErr=loadRemoteModuleBatch(STARTUP_MODULE_PATHS)
if not batchLoaded then
	warn("Module batch unavailable; falling back to individual loads:",batchErr)
end

for _,name in ipairs(STARTUP_MODULE_NAMES) do
	loadRemoteModuleStepByName(name)
end

function runLoaderCheck()
	local missing={}

	for name,path in pairs(MODULE_PATHS) do
		if STARTUP_MODULE_PATH_SET[path] and not OPTIONAL_MODULE_PATH_SET[path] and not REMOTE_MODULE_CACHE[path] then
			table.insert(missing,name.." ("..path..")")
		end
	end

	if #missing>0 then
		table.sort(missing)
		warn("Loader check found missing modules:",table.concat(missing,", "))
		setLoaderProgress("Missing modules: "..table.concat(missing,", "),LOADER_TOTAL,LOADER_TOTAL,true)
	else
		warn("Loader check complete: startup modules loaded. Deferred tabs load on demand.")
		setLoaderProgress("Verified startup modules.",LOADER_TOTAL,LOADER_TOTAL,false)
	end
end

runLoaderCheck()

local function styleByte(name,fallback)
	return math.clamp(math.floor((tonumber(UI_STYLE[name]) or fallback)+0.5),0,255)
end

local STYLE_COLOR_DEFAULTS={Stroke={76,76,76},Gradient={45,45,45},Primary={28,28,28}}

local function styleColor(prefix,defaults)
	return Color3.fromRGB(
		styleByte(prefix.."R",defaults[1]),
		styleByte(prefix.."G",defaults[2]),
		styleByte(prefix.."B",defaults[3])
	)
end

function getUIStrokeColor()
	return styleColor("Stroke",STYLE_COLOR_DEFAULTS.Stroke)
end

function getUIStrokeGradientColor()
	return styleColor("Gradient",STYLE_COLOR_DEFAULTS.Gradient)
end

function getUIPrimaryColor()
	return styleColor("Primary",STYLE_COLOR_DEFAULTS.Primary)
end

UILibOriginalModule={
	Id="original",
	Name="Original",
	Style={
		Primary=Color3.fromRGB(28,28,28),
		Stroke=Color3.fromRGB(76,76,76),
		Gradient=Color3.fromRGB(45,45,45),
		GradientOn=false,
		StrokeThickness=1,
		StrokeTransparency=0.84,
	},
	Theme={},
	Shape={WindowRadius=0,SectionRadius=0,ControlRadius=0,SliderRadius=0,SliderHeight=26,SliderStyle="original",WindowStrokeTransparency=0.62,SectionStrokeTransparency=0.92,ControlStrokeTransparency=0.9,SliderStrokeTransparency=0.9,AccentStrokeTransparency=0.72},
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
	Defaults={PrimaryR=28,PrimaryG=28,PrimaryB=28,StrokeR=76,StrokeG=76,StrokeB=76,GradientR=45,GradientG=45,GradientB=45,StrokeGradient=false,LiquidStroke=false,LiquidStrokeSpeed=1,LiquidStrokeDirection="Right",StrokeThickness=1,StrokeTransparency=0.84,CornerRadius=0,UILib="original",ThemePanelExpanded=false,ColoursPanelExpanded=false},
	MainFrame={
		Window={W=880,H=540,MinW=560,MinH=360,MaxW=1220,MaxH=820,StartY=80,MinimizedH=68},
		Layout={RootPadding=8,MainGap=8,PageGap=8,ColumnGap=8,FooterGap=8,HeaderHeight=52,PageBarHeight=30,PageTabWidth=106,PageTabHeight=28,FooterHeight=34,TopButtonSize=28,TopButtonGap=6,TopButtonOuter=10},
	},
}

function getDefaultUILibProfile()
	return UILibOriginalModule
end

function getDefaultUILibId()
	return "original"
end

function getUILibRuntimeStyle(id)
	return UILibOriginalModule
end

function getCurrentUILibProfile()
	return UILibOriginalModule
end

function getDefaultUIStyle()
	local defaults=UILibOriginalModule.Defaults
	local result={}

	for k,v in pairs(defaults) do
		result[k]=v
	end

	result.UILib=tostring(result.UILib or "original")
	return result
end

function getDefaultUIWindow()
	local window=UILibOriginalModule.MainFrame.Window
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

	for obj in pairs(THEMED_GUI_OBJECTS) do
		if not obj.Parent then
			THEMED_GUI_OBJECTS[obj]=nil
		elseif obj:IsDescendantOf(SG) then
			local role=obj:GetAttribute("ThemeRole")
			if role and THEME[role] then
				obj.BackgroundColor3=THEME[role]
			end
		end
	end

	for obj in pairs(THEMED_TEXT_OBJECTS) do
		if not obj.Parent then
			THEMED_TEXT_OBJECTS[obj]=nil
		elseif obj:IsDescendantOf(SG) then
			local textRole=obj:GetAttribute("ThemeTextRole")
			if textRole and THEME[textRole] then
				obj.TextColor3=THEME[textRole]
			end
		end
	end
end

liquidStrokeConn=nil
MainFrame=nil
applyUIStrokeTheme=nil

function refreshRemoteModulesNow()
	local result=BOT_API.Post("/module/get",{path=MANUAL_REFRESH_RELOAD_PATH})
	if not result or not result.ok or type(result.source)~="string" then
		warn("Manual update failed:",result and result.error or "unknown")
		return false
	end

	local verified,verifyErr=verifyRemoteModuleSource(MANUAL_REFRESH_RELOAD_PATH,result.source)
	if not verified then
		warn("Manual update rejected:",verifyErr)
		return false
	end

	local chunk,err=loadstring(result.source)
	if not chunk then
		warn("Manual update compile failed:",err)
		return false
	end

	warn("Reloading GUI from fresh loader source.")
	toolAlive=false
	if stopLiquidStrokeAnimation then
		pcall(stopLiquidStrokeAnimation)
	end
	if disconnectRuntimeConnections then
		disconnectRuntimeConnections()
	end
	task.defer(function()
		local ok,reloadErr=pcall(chunk)
		if not ok then
			warn("Manual update runtime failed:",reloadErr)
		end
	end)

	return true
end

function exposeManualModuleRefresh()
	local refresh=function()
		return refreshRemoteModulesNow()
	end
	_G.HB_REFRESH_MODULES=refresh

	if type(getgenv)=="function" then
		local ok,env=pcall(getgenv)
		if ok and type(env)=="table" then
			env.HB_REFRESH_MODULES=refresh
		end
	end
end

function initManualRefresh()
	exposeManualModuleRefresh()
end

function stopLiquidStrokeAnimation()
	safeDisconnect(liquidStrokeConn)
	if untrackRuntimeConnection then
		untrackRuntimeConnection(liquidStrokeConn)
	end
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

	liquidStrokeConn=trackRuntimeConnection(RunService.RenderStepped:Connect(function(dt)
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

		for obj in pairs(LIQUID_STROKE_GRADIENTS) do
			if not obj.Parent then
				LIQUID_STROKE_GRADIENTS[obj]=nil
			elseif obj:IsDescendantOf(SG) and obj:IsA("UIGradient") and obj.Name=="StrokeGradient" then
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
	end))
end

local function resolveStrokeRole(stroke)
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

local function strokeRoleRadius(role,shape)
	if role=="Window" then
		return tonumber(shape.WindowRadius) or 0
	elseif role=="Section" then
		return tonumber(shape.SectionRadius) or 0
	elseif role=="Slider" then
		return tonumber(shape.SliderRadius) or 0
	elseif role=="Control" or role=="Accent" then
		return tonumber(shape.ControlRadius) or 0
	end

	return 0
end

local function strokeTransparencyForRole(role,shape,baseTransparency,styleTransparency)
	local roleTransparency=0.82

	if role=="Window" then
		roleTransparency=shape.WindowStrokeTransparency or 0.62
	elseif role=="Section" then
		roleTransparency=shape.SectionStrokeTransparency or 0.92
	elseif role=="Control" then
		roleTransparency=shape.ControlStrokeTransparency or 0.9
	elseif role=="Slider" then
		roleTransparency=shape.SliderStrokeTransparency or 0.9
	elseif role=="Accent" then
		roleTransparency=shape.AccentStrokeTransparency or 0.72
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

applyUIStrokeTheme=function()
	local color=getUIStrokeColor()
	local color2=getUIStrokeGradientColor()
	local strokeHideTransparency=0.86
	THEME.STROKE=color
	applyUIPrimaryTheme()

	if not SG then return end

	local libShape=(getUILibRuntimeStyle(UI_STYLE.UILib) or {}).Shape or {}

	for obj in pairs(THEMED_STROKES) do
		if not obj.Parent then
			THEMED_STROKES[obj]=nil
		elseif obj:IsDescendantOf(SG) then
			local role=resolveStrokeRole(obj)
			if role~="Fixed" then
				local accentRole=role=="Window" or role=="Accent"
				local softColor=THEME.STROKE_SOFT or (THEME.CARD and THEME.CARD:Lerp(THEME.TEXT or color,0.12)) or color

				obj.Color=accentRole and color or softColor
				obj.Thickness=math.clamp(tonumber(UI_STYLE.StrokeThickness) or obj.Thickness,0,8)
				if obj:GetAttribute("BaseStrokeTransparency")==nil then
					obj:SetAttribute("BaseStrokeTransparency",obj.Transparency)
				end

				local baseTransparency=tonumber(obj:GetAttribute("BaseStrokeTransparency")) or obj.Transparency
				local styleTransparency=tonumber(UI_STYLE.StrokeTransparency) or 0.84
				obj.Transparency=strokeTransparencyForRole(role,libShape,baseTransparency,styleTransparency)
				pcall(function()
					obj.Enabled=obj.Transparency<strokeHideTransparency and obj.Thickness>0
				end)

				pcall(function()
					obj.LineJoinMode=strokeRoleRadius(role,libShape)>0 and Enum.LineJoinMode.Round or Enum.LineJoinMode.Miter
				end)

				local gradient=obj:FindFirstChild("StrokeGradient")

				if (UI_STYLE.StrokeGradient or UI_STYLE.LiquidStroke) and accentRole then
					if not gradient then
						gradient=Instance.new("UIGradient")
						gradient.Name="StrokeGradient"
						gradient.Parent=obj
					end
					LIQUID_STROKE_GRADIENTS[gradient]=true

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
						LIQUID_STROKE_GRADIENTS[gradient]=nil
						gradient:Destroy()
					end
				end
			end
		end
	end

	for obj in pairs(THEMED_CORNERS) do
		if not obj.Parent then
			THEMED_CORNERS[obj]=nil
		elseif obj:IsDescendantOf(SG) then
			local role=obj.Parent and obj.Parent:GetAttribute("CornerRole") or "Control"
			obj.CornerRadius=UDim.new(0,strokeRoleRadius(role,libShape))
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
