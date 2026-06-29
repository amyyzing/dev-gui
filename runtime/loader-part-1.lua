-- HB_RUNTIME_PART_1
-- boot step 1: services, theme defaults, loader screen, and module fetch.

Players=game:GetService("Players")
inputService=game:GetService("UserInputService")
TweenService=game:GetService("TweenService")
RunService=game:GetService("RunService")
HttpService=game:GetService("HttpService")
Workspace=game:GetService("Workspace")

me=Players.LocalPlayer
guiParent=me:WaitForChild("PlayerGui")

colorNames={
	["BG"]="bg",
	["PANEL"]="panel",
	["CARD"]="card",
	["ACC"]="accent",
	["TEXT"]="text",
	["MUTED"]="muted",
	["STROKE"]="stroke",
	["STROKE_SOFT"]="softStroke",
	["TOPBAR"]="topbar",
	["SECTION"]="section",
	["BUTTON"]="button",
	["INPUT"]="input",
	["SLIDER_BG"]="sliderBg",
	["SLIDER_FILL"]="sliderFill",
	["RED"]="red",
	["BLUE"]="blue",
	["GREEN"]="green",
}

colors=setmetatable({
	bg=Color3.fromRGB(12,12,12),
	panel=Color3.fromRGB(24,24,24),
	card=Color3.fromRGB(31,31,31),
	accent=Color3.fromRGB(32,202,106),
	text=Color3.fromRGB(238,238,238),
	muted=Color3.fromRGB(182,180,180),
	stroke=Color3.fromRGB(182,180,180),
	red=Color3.fromRGB(254,94,86),
	blue=Color3.fromRGB(21,103,251),
	green=Color3.fromRGB(32,202,106),
},{
	__index=function(t,key)
		local alias=colorNames[key]
		if alias then
			return rawget(t,alias)
		end
	end,
	__newindex=function(t,key,value)
		rawset(t,colorNames[key] or key,value)
	end,
})

style={}

windowState={}

mapSettings={SmoothPlastic=false, OriginalMaterials=setmetatable({}, {__mode="k"})}

currentModeLabel="Gameplay"
currentModeKey="mode1"
uiVisible=true
toolAlive=true

hitboxOn=false
sizeX, sizeY, sizeZ=2.52, 5.4, 1.41
targetTransparency=0.7
gravityEnabled=false
gravityValue=196.2
speedEnabled=false
speedValue=18
gameParamsEnabled=true
paramsSelectedPage="speed"
speedParamsEnabled=false
gravityJumpParamsEnabled=false
staminaParamsEnabled=false
speedSettingEnabled=false
diveSettingEnabled=false
gravitySettingEnabled=false
jumpPowerSettingEnabled=false
staminaRegenSettingEnabled=false
staminaDepleteSettingEnabled=false
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
testingWREnabled=true
testingQBEnabled=true

uiToggleKey=Enum.KeyCode.Unknown
hitboxToggleKey=Enum.KeyCode.Unknown
boostToggleKey=Enum.KeyCode.Unknown
alwaysBoostToggleKey=Enum.KeyCode.Unknown
espToggleKey=Enum.KeyCode.Unknown
qbAimLockKey=Enum.KeyCode.H
qbAimThrowKey=Enum.KeyCode.T
qbAimToggleKey=Enum.KeyCode.P
qbAimTeamFilter=true
qbAimShowArc=true
qbAimSafeArc=true
qbAimTargetHighlight=true
qbAimLeadDelay=0.38
qbAimPeakHeight=14.00
qbAimQBDrift=0
qbAimQBYDrift=0

defaultHitboxPresets={{key=Enum.KeyCode.Unknown, size=Vector3.new(0.1, 0.1, 0.1)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.7, 5.8, 1.65)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(3.1, 5.8, 1.70)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.52, 5.4, 1.41)}}

hitboxPresets={{key=Enum.KeyCode.Unknown, size=Vector3.new(0.1, 0.1, 0.1)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.7, 5.8, 1.65)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(3.1, 5.8, 1.70)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.52, 5.4, 1.41)}}

savedPresets={}
mainUi={}

boxWrappers=setmetatable({}, {__mode="k"})
buttonWrappers=setmetatable({}, {__mode="k"})
themeObjects=setmetatable({}, {__mode="k"})
themeTextObjects=setmetatable({}, {__mode="k"})
themeStrokes=setmetatable({}, {__mode="k"})
themeCorners=setmetatable({}, {__mode="k"})
strokeGradients=setmetatable({}, {__mode="k"})
runtimeConnections={}
runtimeJobs={}
runtimeJobOrder={}
runtimeJobConnections={}
runtimeBuildErrors={}
runtimeScope=nil

function trackRuntimeConnection(connection)
	if connection then
		if runtimeScope and runtimeScope.add then
			runtimeScope:add(connection)
		end
		table.insert(runtimeConnections,connection)
	end

	return connection
end

function untrackRuntimeConnection(connection)
	for index=#runtimeConnections,1,-1 do
		if runtimeConnections[index]==connection then
			table.remove(runtimeConnections,index)
			return
		end
	end
end

function disconnectRuntimeConnections()
	if runtimeScope and runtimeScope.destroy then
		pcall(function()
			runtimeScope:destroy()
		end)
	end

	for _,connection in ipairs(runtimeConnections) do
		if typeof(connection)=="RBXScriptConnection" then
			pcall(function()
				connection:Disconnect()
			end)
		elseif type(connection)=="function" then
			pcall(connection)
		end
	end

	table.clear(runtimeConnections)
	table.clear(runtimeJobs)
	table.clear(runtimeJobOrder)
	table.clear(runtimeJobConnections)

	if CoreScope and CoreScope.new then
		runtimeScope=CoreScope.new("runtime",function(err,scopeName)
			warn("cleanup failed:",scopeName,err)
		end)
	end
end

function registerThemeObject(instance)
	if not instance then return end

	if instance:IsA("GuiObject") then
		themeObjects[instance]=true
	end

	if instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
		themeTextObjects[instance]=true
	elseif instance:IsA("UIStroke") then
		themeStrokes[instance]=true
	elseif instance:IsA("UICorner") then
		themeCorners[instance]=true
	end
end

function colorClose(a,b)
	if not(a and b) then return false end
	return math.abs(a.R-b.R)<0.002 and math.abs(a.G-b.G)<0.002 and math.abs(a.B-b.B)<0.002
end

local themeRoleNames={"BG","PANEL","CARD","TEXT","MUTED","STROKE","GREEN","RED","BLUE","STROKE_SOFT","TOPBAR","SECTION","BUTTON","INPUT","SLIDER_BG","SLIDER_FILL"}
local themeTextRoleNames={"TEXT","MUTED","RED","GREEN","BLUE"}

local function findThemeRole(color,roles)
	for _,role in ipairs(roles) do
		if colors[role] and colorClose(color,colors[role]) then
			return role
		end
	end
end

function markThemeRole(instance,color)
	if not(instance and color) then return end
	registerThemeObject(instance)
	if instance:IsA("TextButton") and instance.Text=="" then return end

	local role=findThemeRole(color,themeRoleNames)
	if role then
		instance:SetAttribute("ThemeRole",role)
	end
end

function markThemeTextRole(instance,color,defaultRole)
	if not(instance and color) then return end
	registerThemeObject(instance)

	local role=findThemeRole(color,themeTextRoleNames)
	if role or defaultRole then
		instance:SetAttribute("ThemeTextRole",role or defaultRole)
	end
end

function translateUIText(value)
	if type(value)~="string" then
		return value
	end

	local description=description or DescriptionModule
	if description and type(description.Text)=="function" then
		local ok,result=pcall(description.Text,value)
		if ok and result~=nil then
			return result
		end
	end

	return value
end

function make(class, properties, parent)
	properties=properties or {}
	local skipThemeRole=properties.SkipThemeRole
	local skipTextRole=properties.SkipTextRole
	local forcedThemeRole=properties.ThemeRole
	local forcedTextRole=properties.TextRole
	local forcedStrokeRole=properties.StrokeRole
	local forcedCornerRole=properties.CornerRole
	local isTextClass=class=="TextLabel" or class=="TextButton" or class=="TextBox"

	properties.SkipThemeRole=nil
	properties.SkipTextRole=nil
	properties.ThemeRole=nil
	properties.TextRole=nil
	properties.StrokeRole=nil
	properties.CornerRole=nil

	if properties.Active==nil and (class=="Frame" or class=="ScrollingFrame" or class=="TextButton" or class=="TextBox") then
		properties.Active=true
	end

	if isTextClass then
		if properties.TextColor3==nil then properties.TextColor3=colors.text end
		if properties.Font==nil then properties.Font=Enum.Font.Gotham end
		properties.TextStrokeTransparency=1
		properties.TextStrokeColor3=Color3.fromRGB(0, 0, 0)
		if properties.TextYAlignment==nil then properties.TextYAlignment=Enum.TextYAlignment.Center end
		if properties.Text~=nil then properties.Text=translateUIText(properties.Text) end
		if properties.PlaceholderText~=nil then properties.PlaceholderText=translateUIText(properties.PlaceholderText) end

		if class=="TextBox" then
			properties.TextSize=properties.TextSize or 13
			properties.TextScaled=false
			properties.TextWrapped=false
			properties.TextYAlignment=Enum.TextYAlignment.Center
		end
	end

	local instance=nil
	if FusionModule and type(FusionModule.New)=="function" then
		local ok,result=pcall(function()
			return FusionModule.New(class)(properties)
		end)
		if ok and typeof(result)=="Instance" then
			instance=result
		else
			warn("ui create failed, using backup:",class,result)
		end
	end

	if not instance then
		instance=Instance.new(class)
		for k, v in pairs(properties) do
			instance[k]=v
		end
	end
	if parent~=nil then
		instance.Parent=parent
	end
	registerThemeObject(instance)

	if forcedThemeRole then
		instance:SetAttribute("ThemeRole",forcedThemeRole)
	elseif not skipThemeRole and properties.BackgroundColor3 then
		markThemeRole(instance,properties.BackgroundColor3)
	end

	if skipTextRole and isTextClass then
		instance:SetAttribute("SkipTextRole",true)
	end

	if forcedTextRole and isTextClass then
		instance:SetAttribute("ThemeTextRole",forcedTextRole)
	elseif isTextClass and not skipTextRole then
		markThemeTextRole(instance,properties.TextColor3,"TEXT")
	end

	if forcedCornerRole then
		instance:SetAttribute("CornerRole",forcedCornerRole)
	end

	if forcedStrokeRole then
		instance:SetAttribute("StrokeRole",forcedStrokeRole)
	end

	if class=="TextBox" then
		trackRuntimeConnection(instance.Focused:Connect(function()
			instance.TextSize=13
			instance.TextScaled=false
			instance.TextWrapped=false
			instance.TextYAlignment=Enum.TextYAlignment.Center
		end))

		trackRuntimeConnection(instance.FocusLost:Connect(function()
			instance.TextSize=13
			instance.TextScaled=false
			instance.TextWrapped=false
			instance.TextYAlignment=Enum.TextYAlignment.Center
		end))
	end

	return instance
end

function safeDisconnect(connection)
	if connection and typeof(connection)=="RBXScriptConnection" then
		pcall(function()
			connection:Disconnect()
		end)
	end
end

cleanupBags={new=function()
	return{Add=function(_,item) return item end,Cleanup=function() end,Destroy=function() end}
end}
jobRunner={Register=function() return false end,SetEnabled=function() end,Unregister=function() end,Count=function() return 0 end,Stats=function() return{} end,ResetStats=function() end}
settingsStore={dirty=false,Get=function(_,_,default) return default end,Set=function(_,_,value) return value end}
themeRuntime={Apply=function() end,RefreshObject=function() end}
playerTracker={getPlayers=function() return Players:GetPlayers() end,getCharacter=function(_,player) return player and (Workspace:FindFirstChild(player.Name) or player.Character) or nil end,getRoot=function(self,player) local character=self:getCharacter(player) return character and (character.PrimaryPart or character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")) or nil end,getTeamId=function(_,player) local replicated=player and player:FindFirstChild("Replicated") local teamValue=replicated and replicated:FindFirstChild("TeamID") local ok,value=pcall(function() return teamValue and teamValue.Value end) return ok and value and tostring(value) or nil end}
ballTracker={getHeldBall=function() return nil end,getFootballPartFromPlayer=function() return nil end,getCarrier=function() return nil end}
sharedRuntime={Janitor=cleanupBags,schedulerApi=jobRunner,StateStore=settingsStore,ThemeStore=themeRuntime,playerCacheApi=playerTracker,ballTrackerApi=ballTracker}

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
	local map={RightControl="RCTRL", LeftControl="LCTRL", RightShift="RSHIFT", LeftShift="LSHIFT", RightAlt="RALT", LeftAlt="LALT", LeftMeta="LWIN", RightMeta="RWIN", PageDown="PGDN", PageUp="PGUP", BackQuote="`", Escape="ESC", Space="SPACE", Pause="PAUSE", Return="ENTER", Delete="DEL", Insert="INS", Up="UP", Down="DOWN", Left="LEFT", Right="RIGHT", KeypadZero="NUM0", KeypadOne="NUM1", KeypadTwo="NUM2", KeypadThree="NUM3", KeypadFour="NUM4", KeypadFive="NUM5", KeypadSix="NUM6", KeypadSeven="NUM7", KeypadEight="NUM8", KeypadNine="NUM9", ButtonA="PAD A", ButtonB="PAD B", ButtonX="PAD X", ButtonY="PAD Y", ButtonL1="LB", ButtonR1="RB", ButtonL2="LT", ButtonR2="RT", ButtonL3="LS", ButtonR3="RS", ButtonStart="START", ButtonSelect="SELECT", DPadUp="DPAD UP", DPadDown="DPAD DOWN", DPadLeft="DPAD LEFT", DPadRight="DPAD RIGHT", Thumbstick1="LSTICK", Thumbstick2="RSTICK"}

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

	local map={RCTRL="RightControl", RIGHTCTRL="RightControl", RIGHTCONTROL="RightControl", LCTRL="LeftControl", LEFTCTRL="LeftControl", LEFTCONTROL="LeftControl", RSHIFT="RightShift", RIGHTSHIFT="RightShift", LSHIFT="LeftShift", LEFTSHIFT="LeftShift", ESC="Escape", ESCAPE="Escape", SPACE="Space", SPACEBAR="Space", ENTER="Return", RETURN="Return", PGDN="PageDown", PAGEDOWN="PageDown", PGUP="PageUp", PAGEUP="PageUp", PAUSE="Pause", BREAK="Pause", PAUSEBREAK="Pause", NUM0="KeypadZero", NUMPAD0="KeypadZero", NUM1="KeypadOne", NUMPAD1="KeypadOne", NUM2="KeypadTwo", NUMPAD2="KeypadTwo", NUM3="KeypadThree", NUMPAD3="KeypadThree", NUM4="KeypadFour", NUMPAD4="KeypadFour", NUM5="KeypadFive", NUMPAD5="KeypadFive", NUM6="KeypadSix", NUMPAD6="KeypadSix", NUM7="KeypadSeven", NUMPAD7="KeypadSeven", NUM8="KeypadEight", NUMPAD8="KeypadEight", NUM9="KeypadNine", NUMPAD9="KeypadNine", ["`"]="BackQuote"}

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
		local map={MouseButton1="LMB", MouseButton2="RMB", MouseButton3="MMB", Touch="TOUCH", Gamepad1="PAD1", Gamepad2="PAD2", Gamepad3="PAD3", Gamepad4="PAD4", Gamepad5="PAD5", Gamepad6="PAD6", Gamepad7="PAD7", Gamepad8="PAD8"}
		return map[binding] or string.upper(binding)
	end

	return keyCodeToLabel(binding)
end

function getApiKey()
	if type(bootApi)=="table" and type(bootApi.Key)=="string" then
		return bootApi.Key
	end

	return nil
end

trustedApiUrl="https://lint-bot-production.up.railway.app"

allowedApiPaths={
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

botApi={
	Url=trustedApiUrl,
	Key=getApiKey(),
}

function botApi.GetRequestFunction()
	if typeof(syn)=="table" and type(syn.request)=="function" then return syn.request end
	if type(request)=="function" then return request end
	if type(http_request)=="function" then return http_request end
	if typeof(http)=="table" and type(http.request)=="function" then return http.request end
	if typeof(fluxus)=="table" and type(fluxus.request)=="function" then return fluxus.request end
	return nil
end

function botApi.Post(path,body)
	if type(path)~="string" or not allowedApiPaths[path] then
		return{ok=false,error="api path blocked: "..tostring(path)}
	end

	if botApi.Url~=trustedApiUrl then
		return{ok=false,error="api url failed"}
	end

	if type(botApi.Key)~="string" or botApi.Key=="" then
		return{ok=false,error="api key failed"}
	end

	if path=="/module/get" and isAllowedModulePath and not isAllowedModulePath(body and body.path) then
		return{ok=false,error="module path blocked: "..tostring(body and body.path)}
	end

	if (path=="/module/manifest" or path=="/module/batch") and isAllowedModulePath and type(body)=="table" and type(body.paths)=="table" then
		for _,modulePath in ipairs(body.paths) do
			if not isAllowedModulePath(modulePath) then
				return{ok=false,error="module path blocked: "..tostring(modulePath)}
			end
		end
	end

	local requestFn=botApi.GetRequestFunction()
	if not requestFn then
		return{ok=false,error="no http request found"}
	end

	body=body or{}
	body.apiKey=botApi.Key

	local ok,response=pcall(function()
		return requestFn({
			Url=botApi.Url..path,
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
		return{ok=false,error="api sent nothing"}
	end

	local decodeOk,decoded=pcall(function()
		return HttpService:JSONDecode(raw)
	end)

	if not decodeOk then
		return{ok=false,error="api decode failed: "..tostring(raw)}
	end

	return decoded
end

manualReloadPath="loader.lua"

modulePaths={
	CoreScope="core/scope.lua",
	CoreSignal="core/signal.lua",
	CoreScheduler="core/scheduler.lua",
	CorePlayerCache="core/player-cache.lua",
	CoreBallTracker="core/ball-tracker.lua",
	StateStore="state/store.lua",
	DesignTokens="design/tokens.lua",
	DesignThemeResolver="design/resolver.lua",
	DesignThemeDark="design/themes/dark.lua",
	DesignThemeLight="design/themes/light.lua",
	DesignThemeMidnight="design/themes/midnight.lua",
	DesignThemeCrimson="design/themes/crimson.lua",
	DesignThemeEvergreen="design/themes/evergreen.lua",
	DesignThemeSakura="design/themes/sakura.lua",
	announcement="announcement.lua",
	GuiFusion="gui/fusion.lua",
	guiLogic="gui/gui-logic.lua",
	mainFrame="gui/mainframe.lua",
	description="gui/description.lua",
	hitboxPreset="features/hitbox-preset/gui.lua",
	HitboxPresetLogic="features/hitbox-preset/logic.lua",
	keybindSettings="features/keybind-settings/gui.lua",
	KeybindSettingsLogic="features/keybind-settings/logic.lua",
	presetEditor="features/preset-editor/gui.lua",
	PresetEditorLogic="features/preset-editor/logic.lua",
	Page1Hitbox="features/hitbox/gui.lua",
	Page1HitboxLogic="features/hitbox/logic.lua",
	Page1GameParams="features/game-params/gui.lua",
	Page1GameParamsLogic="features/game-params/logic.lua",
	Page1Boost="features/boost/gui.lua",
	Page1BoostLogic="features/boost/logic.lua",
	Page1ESP="features/esp/gui.lua",
	Page1ESPLogic="features/esp/logic.lua",
	Page1ESPDefense="features/esp-defense/gui.lua",
	Page1ESPDefenseLogic="features/esp-defense/logic.lua",
	Page1ESPOffense="features/esp-offense/gui.lua",
	Page1ESPOffenseLogic="features/esp-offense/logic.lua",
	Page1QBAim="features/qb-aim/gui.lua",
	Page1QBAimMath="features/qb-aim/math.lua",
	Page1QBAimLogic="features/qb-aim/logic.lua",
	Page1Testing="features/testing/gui.lua",
	Page1TestingLogic="features/testing/logic.lua",
	strokeColour="features/stroke-colour/gui.lua",
	StrokeColourLogic="features/stroke-colour/logic.lua",
	mapEditor="features/map-editor/gui.lua",
	MapEditorLogic="features/map-editor/logic.lua",
	antiMaterial="features/anti-material/gui.lua",
	AntiMaterialLogic="features/anti-material/logic.lua",
	mapCleaner="features/map-cleaner/gui.lua",
	MapCleanerLogic="features/map-cleaner/logic.lua",
	removeAds="features/remove-ads/gui.lua",
	RemoveAdsLogic="features/remove-ads/logic.lua",
	playerData="features/player-data/gui.lua",
	PlayerDataLogic="features/player-data/logic.lua",
	resetPosition="features/reset-position/gui.lua",
	ResetPositionLogic="features/reset-position/logic.lua",
	discord="features/discord/gui.lua",
	DiscordLogic="features/discord/logic.lua",
	dataSave="data-save/data-save.lua",
}
moduleGlobalNames={
	CoreScope="CoreScope",
	CoreSignal="CoreSignal",
	CoreScheduler="CoreScheduler",
	CorePlayerCache="CorePlayerCache",
	CoreBallTracker="CoreBallTracker",
	StateStore="StateStore",
	DesignTokens="DesignTokens",
	DesignThemeResolver="DesignThemeResolver",
	DesignThemeDark="DesignThemeDark",
	DesignThemeLight="DesignThemeLight",
	DesignThemeMidnight="DesignThemeMidnight",
	DesignThemeCrimson="DesignThemeCrimson",
	DesignThemeEvergreen="DesignThemeEvergreen",
	DesignThemeSakura="DesignThemeSakura",
	GuiFusion="FusionModule"
}
startupModuleNames={
	"CoreScope","CoreSignal","CoreScheduler","CorePlayerCache","CoreBallTracker",
	"StateStore","DesignTokens","DesignThemeResolver","DesignThemeDark","DesignThemeLight","DesignThemeMidnight","DesignThemeCrimson","DesignThemeEvergreen","DesignThemeSakura",
	"GuiFusion","GuiLogic","MainFrame","Description","Announcement",
	"Page1HitboxLogic","Page1Hitbox","Page1GameParamsLogic","Page1GameParams","Page1BoostLogic","Page1Boost",
	"Page1ESPDefenseLogic","Page1ESPDefense","Page1ESPOffenseLogic","Page1ESPOffense","Page1ESPLogic","Page1ESP",
	"Page1QBAimMath","Page1QBAimLogic","Page1QBAim","Page1TestingLogic","Page1Testing",
	"MapEditorLogic","MapEditor","AntiMaterialLogic","AntiMaterial","MapCleanerLogic","MapCleaner","RemoveAdsLogic","RemoveAds",
	"StrokeColourLogic","StrokeColour",
	"HitboxPresetLogic","HitboxPreset","KeybindSettingsLogic","KeybindSettings","PresetEditorLogic","PresetEditor",
	"PlayerDataLogic","PlayerData","ResetPositionLogic","ResetPosition","DiscordLogic","Discord",
	"DataSave",
}
optionalModuleNames={"CorePlayerCache","CoreBallTracker"}
mapReloadNames={"MapEditorLogic","MapEditor","AntiMaterialLogic","AntiMaterial","MapCleanerLogic","MapCleaner","RemoveAdsLogic","RemoveAds"}
customizeReloadNames={"StrokeColourLogic","StrokeColour"}
pageTwoReloadNames={"HitboxPresetLogic","HitboxPreset","KeybindSettingsLogic","KeybindSettings","PresetEditorLogic","PresetEditor"}
settingsReloadNames={"PlayerDataLogic","PlayerData","ResetPositionLogic","ResetPosition","DiscordLogic","Discord"}

function moduleGlobalName(name)
	return moduleGlobalNames[name] or (tostring(name).."Module")
end

function setLoadedModule(name,loadedModule)
	getfenv()[moduleGlobalName(name)]=loadedModule
	return loadedModule
end

function setLoadedModuleByPath(path,loadedModule)
	for name,modulePath in pairs(modulePaths) do
		if modulePath==path then
			return setLoadedModule(name,loadedModule)
		end
	end

	return loadedModule
end

function modulePathsFromNames(names)
	local paths={}

	for _,name in ipairs(names or {}) do
		local path=modulePaths[name]
		if path then
			table.insert(paths,path)
		end
	end

	return paths
end

runtimeFileSet={}
if type(runtimeFilesFromLoader)=="table" then
	for _,path in ipairs(runtimeFilesFromLoader) do
		runtimeFileSet[path]=true
	end
end
allowedModuleFiles={}
for _,path in pairs(modulePaths) do
	allowedModuleFiles[path]=true
end
allowedModuleFiles[manualReloadPath]=true
for path in pairs(runtimeFileSet) do
	allowedModuleFiles[path]=true
end
startupModuleFiles=modulePathsFromNames(startupModuleNames)
startupModuleFileSet={}
for _,path in ipairs(startupModuleFiles) do
	startupModuleFileSet[path]=true
end
deferredModuleFileSet={}
for _,path in pairs(modulePaths) do
	if not startupModuleFileSet[path] then
		deferredModuleFileSet[path]=true
	end
end
optionalModuleFileSet={}
for _,path in ipairs(modulePathsFromNames(optionalModuleNames)) do
	optionalModuleFileSet[path]=true
end
maxModuleBytes=300000
moduleMarkers={[manualReloadPath]="HB_LOADER_V3"}

moduleCache={}
moduleSources={}
if type(runtimeSourcesFromLoader)=="table" then
	for path,source in pairs(runtimeSourcesFromLoader) do
		moduleSources[path]=source
	end
end
rebuildPage1FromModules=nil
rebuildCustomizeFromModules=nil
rebuildMapFromModules=nil
rebuildSettingsFromModules=nil
rebuildPage2FromModules=nil
rebuildDataSaveFromModule=nil

function isAllowedModulePath(modulePath)
	return type(modulePath)=="string" and allowedModuleFiles[modulePath]==true
end

function verifyRemoteModuleSource(modulePath,source)
	if not isAllowedModulePath(modulePath) then
		return false,"module path blocked: "..tostring(modulePath)
	end

	if type(source)~="string" or source=="" then
		return false,"module missing: "..tostring(modulePath)
	end

	if #source>maxModuleBytes then
		return false,"module too big: "..tostring(modulePath)
	end

	local marker=(type(runtimeMarkersFromLoader)=="table" and runtimeMarkersFromLoader[modulePath]) or moduleMarkers[modulePath]
	if marker and not source:find(marker,1,true) then
		return false,"module marker failed: "..tostring(modulePath)
	end

	return true,nil
end

function loadModuleFromSource(modulePath,source)
	local verified,verifyErr=verifyRemoteModuleSource(modulePath,source)
	if not verified then
		moduleSources[modulePath]=false
		return nil,verifyErr
	end

	local chunk,err=loadstring(source)
	if not chunk then
		moduleSources[modulePath]=source
		return nil,err
	end

	if setfenv then
		setfenv(chunk,getfenv())
	end

	local loadedOk,loadedModule=pcall(chunk)
	if not loadedOk then
		moduleSources[modulePath]=source
		return nil,loadedModule
	end

	moduleSources[modulePath]=source
	moduleCache[modulePath]=loadedModule
	return loadedModule,nil
end

function loadRemoteModule(modulePath)
	if not isAllowedModulePath(modulePath) then
		warn("module path blocked:",modulePath)
		return nil
	end

	if moduleCache[modulePath] then
		return moduleCache[modulePath]
	end

	local result=botApi.Post("/module/get",{path=modulePath})
	if not result or not result.ok then
		moduleSources[modulePath]=false
		if optionalModuleFileSet[modulePath] then
			warn("optional module missing:",modulePath,result and result.error or"unknown")
		else
			warn("module load failed:",modulePath,result and result.error or"unknown")
		end
		return nil
	end

	local loadedModule,err=loadModuleFromSource(modulePath,result.source)
	if not loadedModule then
		warn("module broke while loading:",modulePath,err)
		return nil
	end

	return loadedModule
end

function loadRemoteModuleBatch(paths)
	if type(paths)~="table" or #paths==0 then
		return false,"no module paths"
	end

	setLoaderProgress("Fetching remote module batch...",0.2,loaderStepTotal,false)

	local result=botApi.Post("/module/batch",{paths=paths})
	if not(result and result.ok and type(result.modules)=="table") then
		return false,result and result.error or "module batch missing"
	end

	local loaded=0
	local failed=0

	for index,modulePath in ipairs(paths) do
		local item=result.modules[modulePath]
		local loadedModule=nil
		local err=nil

		if item and type(item.source)=="string" then
			loadedModule,err=loadModuleFromSource(modulePath,item.source)
		else
			err=result.errors and result.errors[modulePath] or "batch module missing"
		end

		if loadedModule then
			setLoadedModuleByPath(modulePath,loadedModule)
			loaded=loaded+1
		else
			moduleSources[modulePath]=false
			if optionalModuleFileSet[modulePath] then
				warn("optional batch module missing:",modulePath,err)
			else
				failed=failed+1
				warn("batch module failed:",modulePath,err)
			end
		end

		if index%8==0 or index==#paths then
			setLoaderProgress("module batch loaded ("..tostring(loaded).."/"..tostring(#paths)..")",math.min(index,loaderStepTotal),loaderStepTotal,failed>0)
		end
	end

	return failed==0,nil
end

screenGuiName="HitboxUI"
for _,existingName in ipairs({"HitboxUI_DarkInfluenced_GUIOnly","1",screenGuiName}) do
	old=guiParent:FindFirstChild(existingName)
	if old then old:Destroy() end
end

screenGui=make("ScreenGui", {Name=screenGuiName, ResetOnSpawn=false, ZIndexBehavior=Enum.ZIndexBehavior.Sibling, IgnoreGuiInset=true, DisplayOrder=1000}, guiParent)
loaderLayer=10000
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

loaderPageNames={"maps","customize","page2","settings","server"}
loaderStepTotal=#startupModuleFiles+#loaderPageNames+4

loaderCurrent=0
loaderPhaseCurrent=#startupModuleFiles
loaderPhaseItems={}
loaderPhaseNames={"setup","modules","gui","ready"}
loaderOverlay=make("Frame",{
	Name="Loader",
	BackgroundColor3=Color3.fromRGB(8,10,18),
	BackgroundTransparency=1,
	BorderSizePixel=0,
	Size=UDim2.new(1,0,1,0),
	ZIndex=loaderLayer,
},screenGui)

loaderBackdropA=make("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,-112,0.5,-66),
	Size=UDim2.fromOffset(2,2),
	BackgroundColor3=colors.green,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=loaderLayer,
},loaderOverlay)
make("UICorner",{CornerRadius=UDim.new(0,0)},loaderBackdropA)

loaderBackdropB=make("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,128,0.5,82),
	Size=UDim2.fromOffset(2,2),
	BackgroundColor3=colors.blue,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=loaderLayer,
},loaderOverlay)
make("UICorner",{CornerRadius=UDim.new(0,0)},loaderBackdropB)

loaderBox=make("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,0,0.5,0),
	Size=UDim2.fromOffset(480,320),
	BackgroundColor3=colors.bg,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=loaderLayer+1,
},loaderOverlay)

loaderBoxScale=make("UIScale",{Scale=0.92},loaderBox)
loaderBoxStroke=make("UIStroke",{Color=colors.stroke,Thickness=1,Transparency=1},loaderBox)
loaderBoxGradient=make("UIGradient",{
	Color=ColorSequence.new({
		ColorSequenceKeypoint.new(0,colors.topbar or colors.bg),
		ColorSequenceKeypoint.new(1,colors.bg),
	}),
	Rotation=90,
},loaderBox)
make("UIPadding",{PaddingTop=UDim.new(0,20),PaddingLeft=UDim.new(0,18),PaddingRight=UDim.new(0,18),PaddingBottom=UDim.new(0,20)},loaderBox)

loaderAccent=make("Frame",{
	BackgroundColor3=colors.green,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	Position=UDim2.new(0,0,0,0),
	Size=UDim2.new(0,0,0,2),
	ZIndex=loaderLayer+2,
},loaderBox)

loaderPercentPill=make("Frame",{
	AnchorPoint=Vector2.new(1,0),
	Position=UDim2.new(1,0,0,18),
	Size=UDim2.fromOffset(70,24),
	BackgroundColor3=colors.panel,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=loaderLayer+2,
},loaderBox)
make("UICorner",{CornerRadius=UDim.new(0,0)},loaderPercentPill)
loaderPercentPillStroke=make("UIStroke",{Color=colors.stroke,Thickness=1,Transparency=1},loaderPercentPill)

local titleText=make("TextLabel",{
	BackgroundTransparency=1,
	Position=UDim2.fromOffset(0,16),
	Size=UDim2.new(1,-88,0,24),
	Text="untitled gui",
	Font=Enum.Font.GothamMedium,
	TextSize=16,
	TextColor3=colors.text,
	TextTransparency=1,
	TextXAlignment=Enum.TextXAlignment.Left,
	ZIndex=loaderLayer+2,
},loaderBox)

local subtitleText=make("TextLabel",{
	BackgroundTransparency=1,
	Position=UDim2.fromOffset(0,42),
	Size=UDim2.new(1,-88,0,18),
	Text="loading files and gui",
	Font=Enum.Font.Gotham,
	TextSize=11,
	TextColor3=colors.muted,
	TextTransparency=1,
	TextXAlignment=Enum.TextXAlignment.Left,
	ZIndex=loaderLayer+2,
},loaderBox)

loaderStatus=make("TextLabel",{
	BackgroundTransparency=1,
	Position=UDim2.fromOffset(0,84),
	Size=UDim2.new(1,0,0,46),
	Text="loading modules...",
	Font=Enum.Font.Gotham,
	TextSize=12,
	TextColor3=colors.muted,
	TextTransparency=1,
	TextWrapped=true,
	TextXAlignment=Enum.TextXAlignment.Left,
	ZIndex=loaderLayer+2,
},loaderBox)

loaderTrack=make("Frame",{
	Position=UDim2.fromOffset(0,148),
	Size=UDim2.new(1,0,0,12),
	BackgroundColor3=colors.panel,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ClipsDescendants=true,
	ZIndex=loaderLayer+2,
},loaderBox)
make("UICorner",{CornerRadius=UDim.new(0,0)},loaderTrack)

loaderTrackStroke=make("UIStroke",{Color=colors.stroke,Thickness=1,Transparency=1},loaderTrack)

loaderFill=make("Frame",{
	Size=UDim2.new(0,0,1,0),
	BackgroundColor3=colors.green,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=loaderLayer+3,
},loaderTrack)
make("UICorner",{CornerRadius=UDim.new(0,0)},loaderFill)

loaderFillGlow=make("Frame",{
	Size=UDim2.new(0,0,1,0),
	BackgroundColor3=colors.green,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=loaderLayer+2,
},loaderTrack)
make("UICorner",{CornerRadius=UDim.new(0,0)},loaderFillGlow)

loaderScan=make("Frame",{
	BackgroundColor3=Color3.fromRGB(255,255,255),
	BackgroundTransparency=1,
	BorderSizePixel=0,
	Position=UDim2.new(0,-72,0,0),
	Size=UDim2.fromOffset(72,12),
	ZIndex=loaderLayer+4,
},loaderTrack)

make("UIGradient",{
	Transparency=NumberSequence.new({
		NumberSequenceKeypoint.new(0,1),
		NumberSequenceKeypoint.new(0.45,0.34),
		NumberSequenceKeypoint.new(1,1),
	}),
},loaderScan)

loaderPulse=make("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,0,0.5,0),
	Size=UDim2.fromOffset(480,320),
	BackgroundColor3=colors.green,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=loaderLayer,
},loaderOverlay)
make("UICorner",{CornerRadius=UDim.new(0,0)},loaderPulse)

loaderPercent=make("TextLabel",{
	BackgroundTransparency=1,
	Size=UDim2.new(1,0,1,0),
	Text="0%",
	Font=Enum.Font.GothamMedium,
	TextSize=12,
	TextColor3=colors.text,
	TextTransparency=1,
	TextXAlignment=Enum.TextXAlignment.Center,
	ZIndex=loaderLayer+3,
},loaderPercentPill)

loaderPhaseRow=make("Frame",{
	BackgroundTransparency=1,
	Position=UDim2.fromOffset(0,190),
	Size=UDim2.new(1,0,0,42),
	ZIndex=loaderLayer+2,
},loaderBox)

local phaseWidth=104
local phaseGap=8
for index,name in ipairs(loaderPhaseNames) do
	local item=make("Frame",{
		BackgroundColor3=colors.panel,
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Position=UDim2.fromOffset((index-1)*(phaseWidth+phaseGap),0),
		Size=UDim2.fromOffset(phaseWidth,42),
		ZIndex=loaderLayer+2,
	},loaderPhaseRow)
	make("UICorner",{CornerRadius=UDim.new(0,0)},item)
	local dot=make("Frame",{
		AnchorPoint=Vector2.new(0,0.5),
		Position=UDim2.fromOffset(12,21),
		Size=UDim2.fromOffset(8,8),
		BackgroundColor3=colors.muted,
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ZIndex=loaderLayer+3,
	},item)
	make("UICorner",{CornerRadius=UDim.new(0,0)},dot)
	local label=make("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(30,0),
		Size=UDim2.new(1,-38,1,0),
		Text=name,
		Font=Enum.Font.Gotham,
		TextSize=11,
		TextColor3=colors.muted,
		TextTransparency=1,
		SkipTextRole=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=loaderLayer+3,
	},item)
	loaderPhaseItems[index]={Frame=item,Dot=dot,Label=label}
end

local function tweenLoader(instance,properties,duration,style,direction)
	if not instance or not instance.Parent then return end
	local tween=TweenService:Create(instance,TweenInfo.new(duration or 0.16,style or Enum.EasingStyle.Quad,direction or Enum.EasingDirection.Out),properties)
	tween:Play()
	return tween
end

local function loaderPhaseFromStatus(text,current,total)
	text=tostring(text or ""):lower()
	if text:find("runtime ready",1,true) or text:find("everything is loaded",1,true) then
		return 4
	elseif text:find("restored",1,true) or text:find("binding",1,true) or text:find("applying theme",1,true) then
		return 3
	elseif text:find("building page",1,true) or text:find("interface",1,true) or text:find("built all gui",1,true) or text:find("gui build",1,true) then
		return 3
	elseif text:find("verified",1,true) or text:find("validate",1,true) then
		return 2
	elseif text:find("module",1,true) or text:find("fetch",1,true) or text:find("cached",1,true) then
		return 2
	end

	local pct=(tonumber(current) or 0)/math.max(tonumber(total) or loaderStepTotal,1)
	if pct>=0.94 then return 4 end
	if pct>=0.46 then return 3 end
	if pct>=0.12 then return 2 end
	return 1
end

local function setLoaderPhase(activeIndex,isProblem)
	activeIndex=math.clamp(tonumber(activeIndex) or 1,1,#loaderPhaseNames)
	local activeColor=isProblem and colors.red or colors.green

	for index,item in ipairs(loaderPhaseItems) do
		local completed=index<activeIndex
		local active=index==activeIndex
		local itemBg=active and activeColor or colors.panel
		local dotBg=(completed or active) and activeColor or colors.muted
		local textColor=(completed or active) and colors.text or colors.muted
		local bgTransparency=active and 0.08 or 0.36
		local dotTransparency=(completed or active) and 0 or 0.42

		tweenLoader(item.Frame,{BackgroundColor3=itemBg,BackgroundTransparency=bgTransparency},0.14)
		tweenLoader(item.Dot,{BackgroundColor3=dotBg,BackgroundTransparency=dotTransparency},0.14)
		tweenLoader(item.Label,{TextColor3=textColor,TextTransparency=0},0.14)
	end
end

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
		{loaderBackdropA,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.24,{BackgroundTransparency=0.955,Size=UDim2.fromOffset(430,360)}},
		{loaderBackdropB,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.24,{BackgroundTransparency=0.968,Size=UDim2.fromOffset(390,300)}},
		{loaderBox,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.18,{BackgroundTransparency=0}},
		{loaderBoxScale,Enum.EasingDirection.Out,Enum.EasingStyle.Back,0.22,{Scale=1}},
	},true)

	local tweenInfo=TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
	TweenService:Create(loaderBoxStroke,tweenInfo,{Transparency=0.08}):Play()
	TweenService:Create(titleText,tweenInfo,{TextTransparency=0}):Play()
	TweenService:Create(subtitleText,tweenInfo,{TextTransparency=0}):Play()
	TweenService:Create(loaderStatus,tweenInfo,{TextTransparency=0}):Play()
	TweenService:Create(loaderPercent,tweenInfo,{TextTransparency=0}):Play()
	TweenService:Create(loaderPercentPill,tweenInfo,{BackgroundTransparency=0.18}):Play()
	TweenService:Create(loaderPercentPillStroke,tweenInfo,{Transparency=0.35}):Play()
	TweenService:Create(loaderTrack,tweenInfo,{BackgroundTransparency=0.12}):Play()
	TweenService:Create(loaderTrackStroke,tweenInfo,{Transparency=0.35}):Play()
	TweenService:Create(loaderFill,tweenInfo,{BackgroundTransparency=0}):Play()
	TweenService:Create(loaderFillGlow,tweenInfo,{BackgroundTransparency=0.78}):Play()
	TweenService:Create(loaderAccent,TweenInfo.new(0.34,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency=0,Size=UDim2.new(1,0,0,2)}):Play()
	setLoaderPhase(1,false)

	task.spawn(function()
		while loaderAlive and loaderOverlay and loaderOverlay.Parent and loaderScan and loaderScan.Parent do
			loaderScan.Position=UDim2.new(0,-72,0,0)
			loaderScan.BackgroundTransparency=0.68
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

	current=math.clamp(tonumber(current) or 0,0,tonumber(total) or loaderStepTotal)
	total=math.max(tonumber(total) or loaderStepTotal,1)

	local pct=math.clamp(current/total,0,1)
	loaderStatus.Text=tostring(text or "loading...")
	loaderStatus.TextColor3=isProblem and colors.red or colors.muted
	loaderPercent.Text=math.floor(pct*100+0.5).."%"
	loaderFill.BackgroundColor3=isProblem and colors.red or colors.green
	loaderFillGlow.BackgroundColor3=isProblem and colors.red or colors.green
	if loaderPercentPillStroke then
		TweenService:Create(loaderPercentPillStroke,TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Color=isProblem and colors.red or colors.stroke,Transparency=isProblem and 0.08 or 0.35}):Play()
	end
	TweenService:Create(loaderFill,TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(pct,0,1,0)}):Play()
	TweenService:Create(loaderFillGlow,TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(pct,0,1,0)}):Play()
	setLoaderPhase(loaderPhaseFromStatus(text,current,total),isProblem)

	if loaderAccent then
		loaderAccent.BackgroundColor3=isProblem and colors.red or colors.green
	end

	if loaderPulse then
		loaderPulse.BackgroundColor3=isProblem and colors.red or colors.green
		loaderPulse.BackgroundTransparency=0.95
		loaderPulse.Size=UDim2.fromOffset(480,320)
		TweenService:Create(loaderPulse,TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
			BackgroundTransparency=1,
			Size=UDim2.fromOffset(540,374),
		}):Play()
	end

	if isProblem and loaderBoxStroke then
		TweenService:Create(loaderBoxStroke,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Color=colors.red,Transparency=0}):Play()
	else
		TweenService:Create(loaderBoxStroke,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Color=colors.stroke,Transparency=0}):Play()
	end
end

function finishLoader()
	if not loaderOverlay or not loaderOverlay.Parent then return end

	titleText.Text="ready"
	subtitleText.Text=""
	setLoaderProgress("all loaded",loaderStepTotal,loaderStepTotal,false)

	playLoaderKeyframes({
		{loaderPulse,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.18,{BackgroundTransparency=0.88,Size=UDim2.fromOffset(540,374)}},
		{loaderPulse,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.28,{BackgroundTransparency=1,Size=UDim2.fromOffset(620,430)}},
	},true)

	task.delay(0.48,function()
		if not loaderOverlay or not loaderOverlay.Parent then return end
		loaderAlive=false

		local tweenInfo=TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		TweenService:Create(loaderOverlay,tweenInfo,{BackgroundTransparency=1}):Play()

		for _,instance in ipairs(loaderOverlay:GetDescendants()) do
			if instance:IsA("TextLabel") or instance:IsA("TextButton") then
				TweenService:Create(instance,tweenInfo,{TextTransparency=1}):Play()
			elseif instance:IsA("Frame") then
				TweenService:Create(instance,tweenInfo,{BackgroundTransparency=1}):Play()
			elseif instance:IsA("UIStroke") then
				TweenService:Create(instance,tweenInfo,{Transparency=1}):Play()
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
	loaderCurrent=loaderCurrent+1
	local cached=moduleCache[path]
	if cached then
		setLoaderProgress("cached module loaded",loaderCurrent,loaderStepTotal,false)
		return cached
	end

	setLoaderProgress("Fetching required module.",loaderCurrent-0.35,loaderStepTotal,false)
	local loadedModule=loadRemoteModule(path)
	setLoaderProgress(loadedModule and "module loaded" or "module missing",loaderCurrent,loaderStepTotal,not loadedModule)
	return loadedModule
end

function loadRemoteModuleStepByName(name)
	local path=modulePaths[name]
	if not path then
		warn("module path missing:",name)
		return nil
	end

	return setLoadedModule(name,loadRemoteModuleStep(name,path))
end

function loadDeferredModule(name,path,current)
	if current~=nil then
		return current
	end

	local loadedModule=loadRemoteModule(path)
	if not loadedModule and not optionalModuleFileSet[path] then
		warn("deferred module missing:",name,path)
	end
	return loadedModule
end

local batchLoaded,batchErr=loadRemoteModuleBatch(startupModuleFiles)
if not batchLoaded then
	warn("batch missing, loading one by one:",batchErr)
end

for _,name in ipairs(startupModuleNames) do
	loadRemoteModuleStepByName(name)
end

function installRuntimeArchitecture()
	if CoreScope and CoreScope.new then
		runtimeScope=runtimeScope or CoreScope.new("runtime",function(err,scopeName)
			warn("cleanup failed:",scopeName,err)
		end)

		cleanupBags={}
		cleanupBags.__index=cleanupBags

		function cleanupBags.new(name)
			return setmetatable({_scope=CoreScope.new(name or "janitor",function(err,scopeName)
				warn("janitor cleanup failed:",scopeName,err)
			end)},cleanupBags)
		end

		function cleanupBags:Add(item)
			return self._scope:add(item)
		end

		function cleanupBags:Cleanup()
			self._scope:cleanup()
		end

		function cleanupBags:Destroy()
			self._scope:destroy()
		end
	end

	if CoreScheduler and CoreScheduler.new then
		local scheduler=CoreScheduler.new(RunService,runtimeScope)
		local handles={}

		jobRunner={}

		local function schedulerKey(kind,id)
			return tostring(kind or "Heartbeat")..":"..tostring(id or "")
		end

		function jobRunner.Register(kind,id,interval,fn)
			kind=tostring(kind or "Heartbeat")
			id=tostring(id or "")
			interval=math.max(tonumber(interval) or 0,0)

			if id=="" or type(fn)~="function" then
				return false
			end

			jobRunner.Unregister(kind,id)

			local key=schedulerKey(kind,id)
			local state={enabled=true,elapsed=0}
			local function run(dt)
				if not state.enabled then
					return
				end

				state.elapsed=state.elapsed+(dt or 0)
				if state.elapsed<interval then
					return
				end

				local elapsed=state.elapsed
				state.elapsed=0
				local ok,err=pcall(fn,elapsed,dt)
				if not ok then
					warn("scheduler job failed:",id,err)
				end
			end

			local handle
			if kind=="RenderStepped" then
				handle=scheduler:onRender(key,0,run,runtimeScope)
			else
				handle=scheduler:onHeartbeat(key,0,run,runtimeScope)
			end

			handles[key]={handle=handle,state=state}
			return true
		end

		function jobRunner.SetEnabled(kind,id,enabled)
			local entry=handles[schedulerKey(kind,id)]
			if entry then
				entry.state.enabled=enabled and true or false
			end
		end

		function jobRunner.Unregister(kind,id)
			local key=schedulerKey(kind,id)
			local entry=handles[key]
			if entry then
				if entry.handle and entry.handle.cancel then
					entry.handle:cancel()
				end
				handles[key]=nil
			end
		end

		function jobRunner.Count()
			local count=0
			for _ in pairs(handles) do
				count=count+1
			end
			return count
		end

		function jobRunner.Stats()
			if scheduler and scheduler.stats then
				return scheduler:stats()
			end
			return{}
		end

		function jobRunner.ResetStats()
			if scheduler and scheduler.resetStats then
				scheduler:resetStats()
			end
		end

		function jobRunner.Destroy()
			for key,entry in pairs(handles) do
				if entry.handle and entry.handle.cancel then
					entry.handle:cancel()
				end
				handles[key]=nil
			end
			scheduler:destroy()
		end
	end

	if CorePlayerCache and CorePlayerCache.new then
		playerTracker=CorePlayerCache.new(Players,Workspace,runtimeScope)
	end

	if CoreBallTracker and CoreBallTracker.new then
		ballTracker=CoreBallTracker.new(Players,Workspace,playerTracker,runtimeScope)
	end

	if StateStore and StateStore.new then
		local store=StateStore.new()
		settingsStore={dirty=false,storeApi=store}

		function settingsStore.CreateSlice(config)
			return store:createSlice(config)
		end

		function settingsStore.GetSlice(name)
			return store:getSlice(name)
		end

		function settingsStore.Snapshot()
			return store:snapshot()
		end

		function settingsStore.Get(bucket,key,default)
			local root=getfenv()[bucket]
			if type(root)=="table" and root[key]~=nil then
				return root[key]
			end
			return default
		end

		function settingsStore.Set(bucket,key,value)
			local env=getfenv()
			env[bucket]=type(env[bucket])=="table" and env[bucket] or {}
			env[bucket][key]=value
			settingsStore.dirty=true
			if requestPlayerAutosave then
				requestPlayerAutosave()
			end
			return value
		end
	end

	themeRuntime={
		designTokens=DesignTokens,
		themeResolver=DesignThemeResolver,
		Themes={
			dark=DesignThemeDark,
			light=DesignThemeLight,
			midnight=DesignThemeMidnight,
			crimson=DesignThemeCrimson,
			evergreen=DesignThemeEvergreen,
			sakura=DesignThemeSakura
		}
	}

	function themeRuntime.Resolve(id,overrides)
		local theme=themeRuntime.Themes and themeRuntime.Themes[tostring(id or "dark"):lower()]
		if DesignThemeResolver and DesignThemeResolver.resolve and theme then
			return DesignThemeResolver.resolve(theme,overrides)
		end
		return nil
	end

	function themeRuntime.Apply()
		if applyUIStrokeTheme then
			pcall(applyUIStrokeTheme)
		end
	end

	function themeRuntime.RefreshObject(instance)
		if instance and registerThemeObject then
			registerThemeObject(instance)
		end
	end

	sharedRuntime={
		Janitor=cleanupBags,
		schedulerApi=jobRunner,
		StateStore=settingsStore,
		ThemeStore=themeRuntime,
		playerCacheApi=playerTracker,
		ballTrackerApi=ballTracker
	}
end

installRuntimeArchitecture()

function runLoaderCheck()
	local missing={}

	for name,path in pairs(modulePaths) do
		if startupModuleFileSet[path] and not optionalModuleFileSet[path] and not moduleCache[path] then
			table.insert(missing,name.." ("..path..")")
		end
	end

	if #missing>0 then
		table.sort(missing)
		warn("missing modules:",table.concat(missing,", "))
		setLoaderProgress("modules missing. press update, then run again.",loaderStepTotal,loaderStepTotal,true)
		return false
	else
		warn("loader check done: all modules loaded")
		setLoaderProgress("Verified startup modules.",#startupModuleFiles,loaderStepTotal,false)
		return true
	end
end

modulesLoadedAtBoot=runLoaderCheck()

local function styleByte(name,fallback)
	return math.clamp(math.floor((tonumber(style[name]) or fallback)+0.5),0,255)
end

local styleColorDefaults={Stroke={182,180,180},Gradient={182,180,180},Primary={12,12,12}}

local function styleColor(prefix,defaults)
	return Color3.fromRGB(
		styleByte(prefix.."R",defaults[1]),
		styleByte(prefix.."G",defaults[2]),
		styleByte(prefix.."B",defaults[3])
	)
end

function getUIStrokeColor()
	return styleColor("Stroke",styleColorDefaults.Stroke)
end

function getUIStrokeGradientColor()
	return styleColor("Gradient",styleColorDefaults.Gradient)
end

function getUIPrimaryColor()
	return styleColor("Primary",styleColorDefaults.Primary)
end

UILibOriginalModule={
	Id="original",
	Name="Original",
	Style={
		Primary=Color3.fromRGB(12,12,12),
		Stroke=Color3.fromRGB(182,180,180),
		Gradient=Color3.fromRGB(182,180,180),
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
	Defaults={
		PrimaryR=12,PrimaryG=12,PrimaryB=12,StrokeR=182,StrokeG=180,StrokeB=180,GradientR=182,GradientG=180,GradientB=180,
		StrokeGradient=false,LiquidStroke=false,LiquidStrokeSpeed=1,LiquidStrokeDirection="Right",StrokeThickness=1,StrokeTransparency=0.84,CornerRadius=0,UILib="original",
		ThemePanelExpanded=false,ColoursPanelExpanded=false,HighlightPanelExpanded=false,HighlightSelectedMode="espOffense",HighlightSelectedState="open",
		ESPOffenseCustomColor=false,ESPDefenseCustomColor=false,QBAimHighlightCustomColor=false,
		ESPOffenseOpenCustomColor=false,ESPOffenseClosedCustomColor=false,
		ESPDefenseHolderCustomColor=false,ESPDefenseOpenCustomColor=false,ESPDefenseClosedCustomColor=false,
		ESPOffenseFillR=32,ESPOffenseFillG=202,ESPOffenseFillB=106,ESPOffenseOutlineR=32,ESPOffenseOutlineG=202,ESPOffenseOutlineB=106,ESPOffenseFillTransparency=0.5,ESPOffenseOutlineTransparency=0,
		ESPOffenseOpenFillR=32,ESPOffenseOpenFillG=202,ESPOffenseOpenFillB=106,ESPOffenseOpenOutlineR=32,ESPOffenseOpenOutlineG=202,ESPOffenseOpenOutlineB=106,ESPOffenseOpenFillTransparency=0.5,ESPOffenseOpenOutlineTransparency=0,
		ESPOffenseClosedFillR=254,ESPOffenseClosedFillG=94,ESPOffenseClosedFillB=86,ESPOffenseClosedOutlineR=254,ESPOffenseClosedOutlineG=94,ESPOffenseClosedOutlineB=86,ESPOffenseClosedFillTransparency=0.5,ESPOffenseClosedOutlineTransparency=0,
		ESPDefenseFillR=32,ESPDefenseFillG=202,ESPDefenseFillB=106,ESPDefenseOutlineR=32,ESPDefenseOutlineG=202,ESPDefenseOutlineB=106,ESPDefenseFillTransparency=0.5,ESPDefenseOutlineTransparency=0,
		ESPDefenseHolderFillR=21,ESPDefenseHolderFillG=103,ESPDefenseHolderFillB=251,ESPDefenseHolderOutlineR=21,ESPDefenseHolderOutlineG=103,ESPDefenseHolderOutlineB=251,ESPDefenseHolderFillTransparency=0.45,ESPDefenseHolderOutlineTransparency=0,
		ESPDefenseOpenFillR=32,ESPDefenseOpenFillG=202,ESPDefenseOpenFillB=106,ESPDefenseOpenOutlineR=32,ESPDefenseOpenOutlineG=202,ESPDefenseOpenOutlineB=106,ESPDefenseOpenFillTransparency=0.5,ESPDefenseOpenOutlineTransparency=0,
		ESPDefenseClosedFillR=254,ESPDefenseClosedFillG=94,ESPDefenseClosedFillB=86,ESPDefenseClosedOutlineR=254,ESPDefenseClosedOutlineG=94,ESPDefenseClosedOutlineB=86,ESPDefenseClosedFillTransparency=0.5,ESPDefenseClosedOutlineTransparency=0,
		QBAimHighlightFillR=21,QBAimHighlightFillG=103,QBAimHighlightFillB=251,QBAimHighlightOutlineR=32,QBAimHighlightOutlineG=202,QBAimHighlightOutlineB=106,QBAimHighlightFillTransparency=0.65,QBAimHighlightOutlineTransparency=0,
	},
	mainFrame={
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
	local window=UILibOriginalModule.mainFrame.Window
	local result={}

	for k,v in pairs(window) do
		result[k]=v
	end

	return result
end

function applyDefaultUIStyleFields(style,force)
	style=style or style
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
	window=window or windowState
	local defaults=getDefaultUIWindow()

	for k,v in pairs(defaults) do
		if force or window[k]==nil then
			window[k]=v
		end
	end

	return window
end

applyDefaultUIStyleFields(style,false)
applyDefaultUIWindowFields(windowState,false)

function refreshThemePalette()
	local primary=getUIPrimaryColor()
	local lum=(primary.R*0.2126)+(primary.G*0.7152)+(primary.B*0.0722)
	local toward=lum<0.52 and Color3.new(1,1,1) or Color3.new(0,0,0)
	local away=lum<0.52 and Color3.new(0,0,0) or Color3.new(1,1,1)
	local function applyReadableText(surfaceLum)
		if surfaceLum<=0.16 then
			colors.text=Color3.fromRGB(248,248,248)
			colors.muted=Color3.fromRGB(184,184,184)
		elseif surfaceLum>=0.78 then
			colors.text=Color3.fromRGB(10,10,10)
			colors.muted=Color3.fromRGB(60,60,60)
		elseif surfaceLum<0.58 then
			colors.text=Color3.fromRGB(236,238,246)
			colors.muted=Color3.fromRGB(176,176,184)
		else
			colors.text=Color3.fromRGB(20,22,28)
			colors.muted=Color3.fromRGB(76,76,82)
		end
	end

	colors.bg=primary
	colors.panel=primary:Lerp(toward,lum<0.52 and 0.07 or 0.09)
	colors.card=primary:Lerp(toward,lum<0.52 and 0.12 or 0.16)
	applyReadableText(lum)
	colors.accent=colors.green

	if lum>=0.72 then
		colors.panel=primary:Lerp(away,0.04)
		colors.card=primary:Lerp(away,0.08)
	end

	colors.topbar=colors.bg
	colors.section=colors.card
	colors.button=colors.panel
	colors.input=colors.panel
	colors.sliderBg=colors.panel
	colors.sliderFill=colors.stroke
	colors.softStroke=colors.card:Lerp(toward,lum<0.52 and 0.18 or 0.12)

	local libId=tostring(style.UILib or "original"):lower()
	local libStyle=getUILibRuntimeStyle(libId)
	local libTheme=libStyle and libStyle.Theme or {}

	for role,color in pairs(libTheme) do
		colors[role]=color
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

		colors.bg=surface(0)
		colors.topbar=surface(tones.topbar)
		colors.panel=surface(tones.panel)
		colors.card=surface(tones.card)
		colors.section=surface(tones.section)
		colors.button=surface(tones.button)
		colors.input=surface(tones.input)
		colors.sliderBg=tones.sliderAccent and accent:Lerp(primary,tones.sliderBlend or 0.5) or surface(tones.sliderBg)
		colors.sliderFill=accent
		colors.softStroke=surface(tones.strokeSoft)

		local textLum=(colors.bg.R*0.2126)+(colors.bg.G*0.7152)+(colors.bg.B*0.0722)
		applyReadableText(textLum)
	end

	colors.accent=colors.sliderFill or colors.green
	style.CornerRadius=(libStyle.Shape and libStyle.Shape.WindowRadius) or 0
end

function applyUIPrimaryTheme()
	refreshThemePalette()

	if not screenGui then return end

	for instance in pairs(themeObjects) do
		if not instance.Parent then
			themeObjects[instance]=nil
		elseif instance:IsDescendantOf(screenGui) then
			local role=instance:GetAttribute("ThemeRole")
			if role and colors[role] then
				instance.BackgroundColor3=colors[role]
			end
		end
	end

	for instance in pairs(themeTextObjects) do
		if not instance.Parent then
			themeTextObjects[instance]=nil
		elseif instance:IsDescendantOf(screenGui) then
			local textRole=instance:GetAttribute("ThemeTextRole")
			if not textRole and not instance:GetAttribute("SkipTextRole") then
				textRole="TEXT"
				instance:SetAttribute("ThemeTextRole",textRole)
			end
			if textRole and colors[textRole] and not instance:GetAttribute("SkipTextRole") then
				instance.TextColor3=colors[textRole]
			end
		end
	end
end

liquidStrokeConn=nil
mainFrame=nil
applyUIStrokeTheme=nil

function destroyKnownGuiResidue()
	local guiNames={"HitboxUI_DarkInfluenced_GUIOnly","1",screenGuiName or "HitboxUI"}
	local parents={guiParent}

	for _,parent in ipairs(parents) do
		if parent then
			for _,name in ipairs(guiNames) do
				local existing=parent:FindFirstChild(name)
				if existing then
					pcall(function()
						existing:Destroy()
					end)
				end
			end
		end
	end

	local residueNames={
		ClonedCenter=true,
		PreviewC1Marker=true,
		PreviewC3InfoAnchor=true,
		TestingC1Marker=true,
		TestingC1GroundMarker=true,
		QBAimTargetHighlight=true,
		MyESPHighlight=true,
	}

	for _,container in ipairs({Workspace,guiParent}) do
		if container then
			for _,descendant in ipairs(container:GetDescendants()) do
				if residueNames[descendant.Name] then
					pcall(function()
						descendant:Destroy()
					end)
				end
			end
		end
	end
end

function cleanupForManualReload()
	toolAlive=false

	if mainPageApis then
		for key,api in pairs(mainPageApis) do
			if api and api.Destroy then
				pcall(function()
					api.Destroy()
				end)
			end
			mainPageApis[key]=nil
		end
	end

	if resetMapRuntimeState then
		pcall(resetMapRuntimeState)
	end

	if destroyPage2APIs then
		pcall(destroyPage2APIs)
	end

	if destroyRuntimeAPIs then
		pcall(destroyRuntimeAPIs,{
			"StrokeColourAPI",
			"MapEditorAPI",
			"AntiMaterialAPI",
			"MapCleanerAPI",
			"RemoveAdsAPI",
			"PlayerDataAPI",
			"ResetPositionAPI",
			"DiscordAPI",
		})
	end

	if AnnouncementAPI and AnnouncementAPI.Destroy then
		pcall(function()
			AnnouncementAPI.Destroy()
		end)
	end

	if mainFrame and mainFrame.Destroy then
		pcall(function()
			mainFrame.Destroy()
		end)
	end

	if disconnectSettingsConnections then
		pcall(disconnectSettingsConnections)
	end

	if stopLiquidStrokeAnimation then
		pcall(stopLiquidStrokeAnimation)
	end

	if disconnectRuntimeConnections then
		pcall(disconnectRuntimeConnections)
	end

	destroyKnownGuiResidue()
end

function refreshRemoteModulesNow()
	local result=botApi.Post("/module/get",{path=manualReloadPath})
	if not result or not result.ok or type(result.source)~="string" then
		warn("update failed:",result and result.error or "unknown")
		return false
	end

	local verified,verifyErr=verifyRemoteModuleSource(manualReloadPath,result.source)
	if not verified then
		warn("update blocked:",verifyErr)
		return false
	end

	local chunk,err=loadstring(result.source)
	if not chunk then
		warn("update compile failed:",err)
		return false
	end

	warn("reloading gui")
	cleanupForManualReload()
	task.defer(function()
		local ok,reloadErr=pcall(chunk)
		if not ok then
			warn("update run failed:",reloadErr)
		end
	end)

	return true
end

function exposeManualModuleRefresh()
	local refresh=function()
		return refreshRemoteModulesNow()
	end
	_G.refreshModules=refresh

	if type(getgenv)=="function" then
		local ok,env=pcall(getgenv)
		if ok and type(env)=="table" then
			env.refreshModules=refresh
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
	if not style.LiquidStroke then
		stopLiquidStrokeAnimation()
		return
	end

	local speed=tonumber(style.LiquidStrokeSpeed) or 1
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
		if not toolAlive or not screenGui or not screenGui.Parent or not style.LiquidStroke then
			stopLiquidStrokeAnimation()
			return
		end

		local currentSpeed=tonumber(style.LiquidStrokeSpeed) or 1
		if currentSpeed<=0 then
			stopLiquidStrokeAnimation()
			return
		end

		t=(t+(dt*42*currentSpeed))%360
		elapsed=elapsed+dt

		if elapsed<0.03 then
			return
		end

		elapsed=0

		local direction=tostring(style.LiquidStrokeDirection or "Right")
		local wave=math.sin(math.rad(t*2))*0.25

		for instance in pairs(strokeGradients) do
			if not instance.Parent then
				strokeGradients[instance]=nil
			elseif instance:IsDescendantOf(screenGui) and instance:IsA("UIGradient") and instance.Name=="StrokeGradient" then
				if direction=="Right" then
					instance.Rotation=0
					instance.Offset=Vector2.new(wave,0)

				elseif direction=="Left" then
					instance.Rotation=0
					instance.Offset=Vector2.new(-wave,0)

				elseif direction=="Down" then
					instance.Rotation=90
					instance.Offset=Vector2.new(0,wave)

				elseif direction=="Up" then
					instance.Rotation=90
					instance.Offset=Vector2.new(0,-wave)

				elseif direction=="SpinCW" then
					instance.Offset=Vector2.new(0,0)
					instance.Rotation=t

				elseif direction=="SpinCCW" then
					instance.Offset=Vector2.new(0,0)
					instance.Rotation=-t

				else
					instance.Rotation=t
					instance.Offset=Vector2.new(wave,0)
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
	local color2=color
	local strokeHideTransparency=0.86
	style.StrokeGradient=false
	colors.stroke=color
	applyUIPrimaryTheme()

	if not screenGui then return end

	local libShape=(getUILibRuntimeStyle(style.UILib) or {}).Shape or {}

	for instance in pairs(themeStrokes) do
		if not instance.Parent then
			themeStrokes[instance]=nil
		elseif instance:IsDescendantOf(screenGui) then
			local role=resolveStrokeRole(instance)
			if role~="Fixed" then
				local accentRole=role=="Window" or role=="Accent"
				local softColor=colors.softStroke or (colors.card and colors.card:Lerp(colors.text or color,0.12)) or color

				instance.Color=accentRole and color or softColor
				instance.Thickness=math.clamp(tonumber(style.StrokeThickness) or instance.Thickness,0,8)
				if instance:GetAttribute("BaseStrokeTransparency")==nil then
					instance:SetAttribute("BaseStrokeTransparency",instance.Transparency)
				end

				local baseTransparency=tonumber(instance:GetAttribute("BaseStrokeTransparency")) or instance.Transparency
				local styleTransparency=tonumber(style.StrokeTransparency) or 0.84
				instance.Transparency=strokeTransparencyForRole(role,libShape,baseTransparency,styleTransparency)
				pcall(function()
					instance.Enabled=instance.Transparency<strokeHideTransparency and instance.Thickness>0
				end)

				pcall(function()
					instance.LineJoinMode=strokeRoleRadius(role,libShape)>0 and Enum.LineJoinMode.Round or Enum.LineJoinMode.Miter
				end)

				local gradient=instance:FindFirstChild("StrokeGradient")

				if style.LiquidStroke and accentRole then
					if not gradient then
						gradient=Instance.new("UIGradient")
						gradient.Name="StrokeGradient"
						gradient.Parent=instance
					end
					strokeGradients[gradient]=true

					if style.LiquidStroke then
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
						strokeGradients[gradient]=nil
						gradient:Destroy()
					end
				end
			end
		end
	end

	for instance in pairs(themeCorners) do
		if not instance.Parent then
			themeCorners[instance]=nil
		elseif instance:IsDescendantOf(screenGui) then
			local role=instance.Parent and instance.Parent:GetAttribute("CornerRole") or "Control"
			instance.CornerRadius=UDim.new(0,strokeRoleRadius(role,libShape))
		end
	end

	if mainFrame and mainFrame.RefreshTheme then
		pcall(function()
			mainFrame.RefreshTheme()
		end)
	end

	updateLiquidStrokeAnimation()
end

function setUIVisible(state)
	uiVisible=state and true or false
	if screenGui and screenGui.Parent then
		screenGui.Enabled=uiVisible
	end
end

function requireGuiModule(name,path,loadedModule)
	if loadedModule and type(loadedModule.new)=="function" then
		return loadedModule
	end

	error("loader failed: "..name.." did not load: "..path)
end

GuiLogicModule=requireGuiModule("GuiLogic",modulePaths.guiLogic,GuiLogicModule)
MainFrameModule=requireGuiModule("MainFrame",modulePaths.mainFrame,MainFrameModule)
