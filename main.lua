local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local TweenService=game:GetService("TweenService")
local RunService=game:GetService("RunService")
local HttpService=game:GetService("HttpService")

local me=Players.LocalPlayer
local guiParent=me:WaitForChild("PlayerGui")

local THEME={BG=Color3.fromRGB(28,28,28), PANEL=Color3.fromRGB(33,33,33), CARD=Color3.fromRGB(38,38,38), ACC=Color3.fromRGB(32,202,106), TEXT=Color3.fromRGB(195,195,195), MUTED=Color3.fromRGB(168,168,168), STROKE=Color3.fromRGB(76,76,76), RED=Color3.fromRGB(254,94,86), BLUE=Color3.fromRGB(21,103,251), GREEN=Color3.fromRGB(32,202,106),}

local UI_STYLE={
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

local UI_WINDOW={W=880, H=540, MinW=560, MinH=360, MaxW=1220, MaxH=820,}

local WORLD_SETTINGS={SmoothPlastic=false, OriginalMaterials=setmetatable({}, {__mode="k"})}

local CURRENT_MODE_LABEL="Gameplay"
local CURRENT_MODE_KEY="mode1"
local uiVisible=true
local toolAlive=true

local hitboxOn=false
local sizeX, sizeY, sizeZ=2.52, 5.4, 1.41
local targetTransparency=0.7
local gravityValue=196.2
local speedEnabled=false
local speedValue=18
local athleticismOn=false
local staminaRegenValue=10
local staminaDepleteValue=10
local jumpPowerValue=53.5
local divePowerValue=1.9
local jumpBoostOn=false
local jumpBoostTradeMode=false
local boostForceY=32
local boostCooldown=5
local boostChance=100
local ballDetectionRadius=10
local potatoMode=false
local actionStatusOn=false

local TOGGLE_UI_KEY=Enum.KeyCode.Unknown
local TOGGLE_HB_KEY=Enum.KeyCode.Unknown
local TOGGLE_JB_KEY=Enum.KeyCode.Unknown
local TOGGLE_AB_KEY=Enum.KeyCode.Unknown
local TOGGLE_ACTION_KEY=Enum.KeyCode.Unknown
local TOGGLE_SPEED_KEY=Enum.KeyCode.Unknown

local DEFAULT_PRESETS={{key=Enum.KeyCode.Unknown, size=Vector3.new(0.1, 0.1, 0.1)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.7, 5.8, 1.65)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(3.1, 5.8, 1.70)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.52, 5.4, 1.41)},}

local PRESETS={{key=Enum.KeyCode.Unknown, size=Vector3.new(0.1, 0.1, 0.1)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.7, 5.8, 1.65)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(3.1, 5.8, 1.70)}, {key=Enum.KeyCode.Unknown, size=Vector3.new(2.52, 5.4, 1.41)},}

local OWNED_PRESETS={}
local UI_MAIN={}

local BOX_WRAPPERS=setmetatable({}, {__mode="k"})
local BUTTON_WRAPPERS=setmetatable({}, {__mode="k"})

local function New(class, props, parent)
	props=props or {}

	if class=="TextLabel" or class=="TextButton" or class=="TextBox" then
		if props.TextColor3==nil then props.TextColor3=THEME.TEXT end
		if props.Font==nil then props.Font=Enum.Font.Gotham end
		props.TextStrokeTransparency=1
		props.TextStrokeColor3=Color3.fromRGB(0, 0, 0)

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

local function safeDisconnect(conn)
	if conn and typeof(conn)=="RBXScriptConnection" then
		pcall(function()
			conn:Disconnect()
		end)
	end
end

local function fmtNumber(n, decimals)
	decimals=decimals or 2
	local s=string.format("%."..decimals.."f", tonumber(n) or 0)
	s=s:gsub("(%..-)0+$", "%1"):gsub("%.$", "")
	return s
end

local function keyCodeToLabel(keyCode)
	if not keyCode or keyCode==Enum.KeyCode.Unknown then
		return"NIL"
	end

	local raw=tostring(keyCode):gsub("Enum.KeyCode%.", "")
	local map={RightControl="RCTRL", LeftControl="LCTRL", RightShift="RSHIFT", LeftShift="LSHIFT", RightAlt="RALT", LeftAlt="LALT", LeftMeta="LWIN", RightMeta="RWIN", PageDown="PGDN", PageUp="PGUP", BackQuote="`", Escape="ESC", Space="SPACE", Pause="PAUSE", Return="ENTER", Delete="DEL", Insert="INS", Up="UP", Down="DOWN", Left="LEFT", Right="RIGHT", KeypadZero="NUM0", KeypadOne="NUM1", KeypadTwo="NUM2", KeypadThree="NUM3", KeypadFour="NUM4", KeypadFive="NUM5", KeypadSix="NUM6", KeypadSeven="NUM7", KeypadEight="NUM8", KeypadNine="NUM9", ButtonA="PAD A", ButtonB="PAD B", ButtonX="PAD X", ButtonY="PAD Y", ButtonL1="LB", ButtonR1="RB", ButtonL2="LT", ButtonR2="RT", ButtonL3="LS", ButtonR3="RS", ButtonStart="START", ButtonSelect="SELECT", DPadUp="DPAD UP", DPadDown="DPAD DOWN", DPadLeft="DPAD LEFT", DPadRight="DPAD RIGHT", Thumbstick1="LSTICK", Thumbstick2="RSTICK",}

	return map[raw] or string.upper(raw)
end

local function parseKeyCodeInput(raw)
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

local function inputToBinding(input)
	local uiType=tostring(input.UserInputType)

	local key=input.KeyCode
	if key and key~=Enum.KeyCode.Unknown then return key end

	if uiType=="Enum.UserInputType.MouseButton1" then return"MouseButton1" end
	if uiType=="Enum.UserInputType.MouseButton2" then return"MouseButton2" end
	if uiType=="Enum.UserInputType.MouseButton3" then return"MouseButton3" end
	if uiType=="Enum.UserInputType.MouseButton4" then return"MouseButton4" end
	if uiType=="Enum.UserInputType.MouseButton5" then return"MouseButton5" end

	local name=uiType:gsub("Enum.UserInputType%.", "")
	if name:match("^Gamepad") then return name end

	return nil
end

local function bindingToLabel(binding)
	if binding==nil or binding==Enum.KeyCode.Unknown then
		return"NIL"
	end

	if type(binding)=="string" then
		local map={MouseButton1="LMB", MouseButton2="RMB", MouseButton3="MMB", MouseButton4="MB4", MouseButton5="MB5", Touch="TOUCH", Gamepad1="PAD1", Gamepad2="PAD2", Gamepad3="PAD3", Gamepad4="PAD4", Gamepad5="PAD5", Gamepad6="PAD6", Gamepad7="PAD7", Gamepad8="PAD8",}
		return map[binding] or string.upper(binding)
	end

	return keyCodeToLabel(binding)
end

local BOT_API={
	Url="https://lint-bot-production.up.railway.app",
	Key="thekeytoheaven",
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

local AUTO_REFRESH_ENABLED=true
local AUTO_REFRESH_INTERVAL=2.5
local AUTO_REFRESH_RELOAD_PATH="main.lua"

local MODULE_PATHS={
	Announcement="announcement.lua",
	GuiLogic="gui/gui-logic.lua",
	MainFrame="gui/mainframe.lua",
	HitboxPreset="page-2/hitbox-preset.lua",
	KeybindSettings="page-2/keybind-settings.lua",
	PresetEditor="page-2/preset-editor.lua",
	Page1Hitbox="page-1/hitbox.lua",
	Page1Gravity="page-1/gravity.lua",
	Page1Speed="page-1/speed.lua",
	Page1GameParams="page-1/game-params.lua",
	Page1Boost="page-1/boost.lua",
	Page1ESP="page-1/esp.lua",
	StrokeColour="page-3/stroke-colour.lua",
	MapEditor="page-4/map-editor.lua",
	Workspace="page-4/workspace.lua",
	RemoveAds="page-4/remove-ads.lua",
	PlayerData="page-5/player-data.lua",
	DataSave="data-save/data-save.lua",
}
local AUTO_REFRESH_WATCH_PATHS={AUTO_REFRESH_RELOAD_PATH}
for _,path in pairs(MODULE_PATHS) do
	table.insert(AUTO_REFRESH_WATCH_PATHS,path)
end

local REMOTE_MODULE_CACHE={}
local REMOTE_MODULE_SOURCES={}
local rebuildPage1FromModules=nil
local rebuildCustomizeFromModules=nil
local rebuildMapFromModules=nil

local function loadModuleFromSource(modulePath,source)
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

local function loadRemoteModule(modulePath)
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

local GuiLogicModule=loadRemoteModule(MODULE_PATHS.GuiLogic)
local MainFrameModule=loadRemoteModule(MODULE_PATHS.MainFrame)
local AnnouncementModule=loadRemoteModule(MODULE_PATHS.Announcement)
local HitboxPresetModule=loadRemoteModule(MODULE_PATHS.HitboxPreset)
local KeybindSettingsModule=loadRemoteModule(MODULE_PATHS.KeybindSettings)
local PresetEditorModule=loadRemoteModule(MODULE_PATHS.PresetEditor)
local Page1HitboxModule=loadRemoteModule(MODULE_PATHS.Page1Hitbox)
local Page1GravityModule=loadRemoteModule(MODULE_PATHS.Page1Gravity)
local Page1SpeedModule=loadRemoteModule(MODULE_PATHS.Page1Speed)
local Page1GameParamsModule=loadRemoteModule(MODULE_PATHS.Page1GameParams)
local Page1BoostModule=loadRemoteModule(MODULE_PATHS.Page1Boost)
local Page1ESPModule=loadRemoteModule(MODULE_PATHS.Page1ESP)
local StrokeColourModule=loadRemoteModule(MODULE_PATHS.StrokeColour)
local MapEditorModule=loadRemoteModule(MODULE_PATHS.MapEditor)
local WorkspaceModule=loadRemoteModule(MODULE_PATHS.Workspace)
local RemoveAdsModule=loadRemoteModule(MODULE_PATHS.RemoveAds)
local PlayerDataModule=loadRemoteModule(MODULE_PATHS.PlayerData)
local DataSaveModule=loadRemoteModule(MODULE_PATHS.DataSave)

local function runLoaderCheck()
	local missing={}

	for name,path in pairs(MODULE_PATHS) do
		if not REMOTE_MODULE_CACHE[path] then
			table.insert(missing,name.." ("..path..")")
		end
	end

	if #missing>0 then
		table.sort(missing)
		warn("Loader check found missing modules:",table.concat(missing,", "))
	else
		warn("Loader check complete: all remote modules loaded.")
	end
end

runLoaderCheck()

local PAGE1_RELOAD_PATHS={
	[MODULE_PATHS.Page1Hitbox]=function(module) Page1HitboxModule=module end,
	[MODULE_PATHS.Page1Gravity]=function(module) Page1GravityModule=module end,
	[MODULE_PATHS.Page1Speed]=function(module) Page1SpeedModule=module end,
	[MODULE_PATHS.Page1GameParams]=function(module) Page1GameParamsModule=module end,
	[MODULE_PATHS.Page1Boost]=function(module) Page1BoostModule=module end,
	[MODULE_PATHS.Page1ESP]=function(module) Page1ESPModule=module end,
}

local function getUIStrokeColor()
	return Color3.fromRGB(math.clamp(math.floor(UI_STYLE.StrokeR+0.5), 0, 255), math.clamp(math.floor(UI_STYLE.StrokeG+0.5), 0, 255), math.clamp(math.floor(UI_STYLE.StrokeB+0.5), 0, 255))
end

local function getUIStrokeGradientColor()
	return Color3.fromRGB(math.clamp(math.floor(UI_STYLE.GradientR+0.5), 0, 255), math.clamp(math.floor(UI_STYLE.GradientG+0.5), 0, 255), math.clamp(math.floor(UI_STYLE.GradientB+0.5), 0, 255))
end

local SG_NAME="HitboxUI_DarkInfluenced_GUIOnly"
local old=guiParent:FindFirstChild(SG_NAME)
if old then old:Destroy() end

local SG=New("ScreenGui", {Name=SG_NAME, ResetOnSpawn=false, ZIndexBehavior=Enum.ZIndexBehavior.Sibling, IgnoreGuiInset=false}, guiParent)
local autoRefreshReloading=false
local liquidStrokeConn=nil
local MainFrame=nil

local function getRemoteSource(modulePath)
	local result=BOT_API.Post("/module/get",{path=modulePath})
	if not result or not result.ok or type(result.source)~="string" then
		return nil,result and result.error or"unknown"
	end

	return result.source
end

local function reloadFromSource(sourcePath,source,changedPath,changedSource)
	if autoRefreshReloading then return end

	local chunk,err=loadstring(source)
	if not chunk then
		warn("Auto-refresh found bad source:",sourcePath,err)
		REMOTE_MODULE_SOURCES[sourcePath]=source
		if changedPath and changedPath~=sourcePath and changedSource then
			REMOTE_MODULE_SOURCES[changedPath]=changedSource
		end
		return
	end

	autoRefreshReloading=true
	toolAlive=false

	task.defer(function()
		local ok,reloadErr=pcall(chunk)
		if not ok then
			warn("Auto-refresh reload failed:",reloadErr)
		end
	end)
end

local function requestAutoRefresh(changedPath,changedSource)
	if changedPath==AUTO_REFRESH_RELOAD_PATH then
		warn("Auto-refreshing script after remote change:",changedPath)
		reloadFromSource(changedPath,changedSource,changedPath,changedSource)
		return
	end

	local module,err=loadModuleFromSource(changedPath,changedSource)
	if not module then
		warn("Auto-refresh found bad module source:",changedPath,err)
		return
	end

	if changedPath==MODULE_PATHS.GuiLogic or changedPath==MODULE_PATHS.MainFrame or changedPath==MODULE_PATHS.Announcement then
		local source,sourceErr=getRemoteSource(AUTO_REFRESH_RELOAD_PATH)
		if not source then
			warn("Auto-refresh detected a GUI module change in "..changedPath..", but "..AUTO_REFRESH_RELOAD_PATH.." could not be fetched:",sourceErr)
			return
		end

		warn("Auto-refreshing script after GUI module change:",changedPath)
		reloadFromSource(AUTO_REFRESH_RELOAD_PATH,source,changedPath,changedSource)
		return
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

		return
	end

	if changedPath==MODULE_PATHS.StrokeColour then
		StrokeColourModule=module

		if rebuildCustomizeFromModules then
			warn("Auto-refreshing customize module after remote change:",changedPath)
			rebuildCustomizeFromModules()
		else
			warn("Auto-refresh cached customize module, rebuild not ready:",changedPath)
		end

		return
	end

	if changedPath==MODULE_PATHS.MapEditor then
		MapEditorModule=module

		if rebuildMapFromModules then
			warn("Auto-refreshing map editor module after remote change:",changedPath)
			rebuildMapFromModules()
		else
			warn("Auto-refresh cached map editor module, rebuild not ready:",changedPath)
		end

		return
	end

	if changedPath==MODULE_PATHS.Workspace then
		WorkspaceModule=module

		if rebuildMapFromModules then
			warn("Auto-refreshing workspace module after remote change:",changedPath)
			rebuildMapFromModules()
		else
			warn("Auto-refresh cached workspace module, rebuild not ready:",changedPath)
		end

		return
	end

	if changedPath==MODULE_PATHS.RemoveAds then
		RemoveAdsModule=module

		if rebuildMapFromModules then
			warn("Auto-refreshing remove ads module after remote change:",changedPath)
			rebuildMapFromModules()
		else
			warn("Auto-refresh cached remove ads module, rebuild not ready:",changedPath)
		end

		return
	end

	warn("Auto-refresh cached module after remote change:",changedPath)
end

local function startAutoRefresh()
	if not AUTO_REFRESH_ENABLED then return end

	task.spawn(function()
		task.wait(AUTO_REFRESH_INTERVAL)

		while toolAlive and SG and SG.Parent and guiParent:FindFirstChild(SG_NAME)==SG do
			for _,path in ipairs(AUTO_REFRESH_WATCH_PATHS) do
				if not toolAlive or not SG.Parent or guiParent:FindFirstChild(SG_NAME)~=SG then
					return
				end

				local source=getRemoteSource(path)
				if source then
					local previous=REMOTE_MODULE_SOURCES[path]
					if previous~=nil and previous~=source then
						requestAutoRefresh(path,source)
						return
					end

					if previous==nil then
						REMOTE_MODULE_SOURCES[path]=source
					end
				end

				task.wait(0.05)
			end

			task.wait(AUTO_REFRESH_INTERVAL)
		end
	end)
end

local function stopLiquidStrokeAnimation()
	safeDisconnect(liquidStrokeConn)
	liquidStrokeConn=nil
end

local function updateLiquidStrokeAnimation()
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

local function applyUIStrokeTheme()
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

local function setUIVisible(state)
	uiVisible=state and true or false
	if SG and SG.Parent then
		SG.Enabled=uiVisible
	end
end

local function requireGuiModule(name,path,module)
	if module and type(module.new)=="function" then
		return module
	end

	error("Loader failed: "..name.." did not load from "..path)
end

GuiLogicModule=requireGuiModule("GuiLogic",MODULE_PATHS.GuiLogic,GuiLogicModule)
MainFrameModule=requireGuiModule("MainFrame",MODULE_PATHS.MainFrame,MainFrameModule)

local GuiLogic=GuiLogicModule.new({
	New=New,
	THEME=THEME,
	UIS=UIS,
	TweenService=TweenService,
	fmtNumber=fmtNumber,
	BOX_WRAPPERS=BOX_WRAPPERS,
	BUTTON_WRAPPERS=BUTTON_WRAPPERS,
})

local attachHover=GuiLogic.attachHover
local wrapTextBox=GuiLogic.wrapTextBox
local placeWrappedBox=GuiLogic.placeWrappedBox
local wrapTextButton=GuiLogic.wrapTextButton
local placeWrappedButton=GuiLogic.placeWrappedButton
local setWrappedButtonBg=GuiLogic.setWrappedButtonBg
local makeSection=GuiLogic.makeSection
local makeBox=GuiLogic.makeBox
local buildSlider=GuiLogic.buildSlider
local buildToggleRow=GuiLogic.buildToggleRow

MainFrame=MainFrameModule.new({
	New=New,
	THEME=THEME,
	UI_WINDOW=UI_WINDOW,
	SG=SG,
	UIS=UIS,
	TweenService=TweenService,
	RunService=RunService,
	safeDisconnect=safeDisconnect,
	wrapTextButton=wrapTextButton,
	attachHover=attachHover,
	getUIStrokeColor=getUIStrokeColor,
	getUIStrokeGradientColor=getUIStrokeGradientColor,
	isAlive=function()
		return toolAlive
	end,
	getModeLabel=function()
		return CURRENT_MODE_LABEL
	end,
})

local root=MainFrame.root
local uiScale=MainFrame.uiScale
local main=MainFrame.main
local header=MainFrame.header
local modeSubtitle=MainFrame.modeSubtitle
local closeBtn=MainFrame.closeBtn
local resetBtn=MainFrame.resetBtn
local pageBar=MainFrame.pageBar
local pageHost=MainFrame.pageHost
local settingsPage=MainFrame.settingsPage
local futurePage=MainFrame.futurePage
local uiSettingsPage=MainFrame.uiSettingsPage
local mapPage=MainFrame.mapPage
local actualSettingsPage=MainFrame.actualSettingsPage
local leftCol=MainFrame.leftCol
local rightCol=MainFrame.rightCol
local footer=MainFrame.footer

local function setActivePage(name)
	if MainFrame and MainFrame.SetActivePage then
		MainFrame.SetActivePage(name)
	end
end

local function getActivePageName()
	if MainFrame and MainFrame.GetActivePageName then
		return MainFrame.GetActivePageName()
	end

	return "main"
end

local updateResponsiveLayout=function()
	if MainFrame and MainFrame.UpdateResponsiveLayout then
		MainFrame.UpdateResponsiveLayout()
	end
end

local refreshFooterResetButton=function()
	if MainFrame and MainFrame.RefreshFooterResetButton then
		MainFrame.RefreshFooterResetButton()
	end
end

local AnnouncementAPI=nil
local resetKeybindPresetPageDefaults=function() end

local DataSaveAPI=nil
local requestPlayerAutosave=function()
	if DataSaveAPI and DataSaveAPI.Schedule then
		DataSaveAPI.Schedule()
	end
end

local function makeLocalPresetCode(name)
	local base=string.upper(string.sub(string.gsub(tostring(name or ""),"[^%w]",""),1,3))
	if base=="" then base="GUI" end
	return base..tostring(math.random(100,999))
end

local function setPresetSizeFromDataSave(index,x,y,z)
	if DataSaveAPI and DataSaveAPI.SetPresetSize then
		return DataSaveAPI.SetPresetSize(index,x,y,z)
	end

	local preset=PRESETS[index]
	if not preset then return false,"missing preset" end

	local oldSize=preset.size or Vector3.new(1,1,1)
	preset.size=Vector3.new(
		math.clamp(tonumber(x) or oldSize.X,0.1,50),
		math.clamp(tonumber(y) or oldSize.Y,0.1,50),
		math.clamp(tonumber(z) or oldSize.Z,0.1,50)
	)

	requestPlayerAutosave()
	return true,preset.size
end

local function setPresetKeyFromDataSave(index,binding)
	if DataSaveAPI and DataSaveAPI.SetPresetKey then
		return DataSaveAPI.SetPresetKey(index,binding)
	end

	local preset=PRESETS[index]
	if not preset then return false,"missing preset" end

	preset.key=binding or Enum.KeyCode.Unknown
	requestPlayerAutosave()
	return true,preset.key
end

local function resetPresetFromDataSave(index)
	if DataSaveAPI and DataSaveAPI.ResetPreset then
		return DataSaveAPI.ResetPreset(index)
	end

	local preset=PRESETS[index]
	local default=DEFAULT_PRESETS[index]
	if not preset or not default then return false,"missing preset" end

	preset.key=default.key
	preset.size=default.size
	requestPlayerAutosave()
	return true,preset
end

local function applyPresetEditorFromDataSave(editor)
	if DataSaveAPI and DataSaveAPI.ApplyPresetEditor then
		return DataSaveAPI.ApplyPresetEditor(editor)
	end

	for i=1,4 do
		local item=editor and editor[i]
		if item and PRESETS[i] then
			PRESETS[i].key=item.key or item.Key or item.binding or item.Binding or Enum.KeyCode.Unknown
			PRESETS[i].size=Vector3.new(tonumber(item.x or item.X) or 1,tonumber(item.y or item.Y) or 1,tonumber(item.z or item.Z) or 1)
		end
	end

	requestPlayerAutosave()
	return true
end

local function createOwnedPresetFromDataSave(name,editor)
	if DataSaveAPI and DataSaveAPI.CreateOwnedPreset then
		return DataSaveAPI.CreateOwnedPreset(name,editor)
	end

	local cleanName=tostring(name or ""):gsub("^%s*(.-)%s*$","%1")
	if cleanName=="" then return false,"Name cannot be empty." end

	local preset={Code=makeLocalPresetCode(cleanName),Name=cleanName,Data={PresetEditor=editor or {}}}
	table.insert(OWNED_PRESETS,preset)
	requestPlayerAutosave()
	return true,preset
end

local function equipOwnedPresetFromDataSave(preset)
	if DataSaveAPI and DataSaveAPI.EquipOwnedPreset then
		return DataSaveAPI.EquipOwnedPreset(preset)
	end

	local data=preset and (preset.Data or preset.data) or {}
	local editor=data.PresetEditor or data.presetEditor
	if not editor and preset then
		editor=preset.presetEditor or preset.PresetEditor
	end

	return applyPresetEditorFromDataSave(editor or {})
end

local function deleteOwnedPresetFromDataSave(code,index)
	if DataSaveAPI and DataSaveAPI.DeleteOwnedPreset then
		return DataSaveAPI.DeleteOwnedPreset(code,index)
	end

	for i=#OWNED_PRESETS,1,-1 do
		if tostring(OWNED_PRESETS[i].Code or OWNED_PRESETS[i].code or "")==tostring(code or "") then
			table.remove(OWNED_PRESETS,i)
			return true
		end
	end

	if index and OWNED_PRESETS[index] then
		table.remove(OWNED_PRESETS,index)
	end

	return true
end

local PAGE1_STATE={
	hitboxOn=hitboxOn,
	sizeX=sizeX,
	sizeY=sizeY,
	sizeZ=sizeZ,
	targetTransparency=targetTransparency,
	gravityValue=gravityValue,
	speedEnabled=speedEnabled,
	speedValue=speedValue,
	athleticismOn=athleticismOn,
	staminaRegenValue=staminaRegenValue,
	staminaDepleteValue=staminaDepleteValue,
	jumpPowerValue=jumpPowerValue,
	divePowerValue=divePowerValue,
	jumpBoostOn=jumpBoostOn,
	jumpBoostTradeMode=jumpBoostTradeMode,
	boostForceY=boostForceY,
	boostCooldown=boostCooldown,
	boostChance=boostChance,
	ballDetectionRadius=ballDetectionRadius,
	actionStatusOn=actionStatusOn,
}

local function syncPage1State()
	hitboxOn=PAGE1_STATE.hitboxOn
	sizeX=PAGE1_STATE.sizeX
	sizeY=PAGE1_STATE.sizeY
	sizeZ=PAGE1_STATE.sizeZ
	targetTransparency=PAGE1_STATE.targetTransparency
	gravityValue=PAGE1_STATE.gravityValue
	speedEnabled=PAGE1_STATE.speedEnabled
	speedValue=PAGE1_STATE.speedValue
	athleticismOn=PAGE1_STATE.athleticismOn
	staminaRegenValue=PAGE1_STATE.staminaRegenValue
	staminaDepleteValue=PAGE1_STATE.staminaDepleteValue
	jumpPowerValue=PAGE1_STATE.jumpPowerValue
	divePowerValue=PAGE1_STATE.divePowerValue
	jumpBoostOn=PAGE1_STATE.jumpBoostOn
	jumpBoostTradeMode=PAGE1_STATE.jumpBoostTradeMode
	boostForceY=PAGE1_STATE.boostForceY
	boostCooldown=PAGE1_STATE.boostCooldown
	boostChance=PAGE1_STATE.boostChance
	ballDetectionRadius=PAGE1_STATE.ballDetectionRadius
	actionStatusOn=PAGE1_STATE.actionStatusOn
end

local PAGE1_APIS={}
local refreshActionStatus=function() end

local function makePage1Ctx()
	return{
		New=New,
		THEME=THEME,
		State=PAGE1_STATE,
		makeSection=makeSection,
		buildSlider=buildSlider,
		buildToggleRow=buildToggleRow,
		fmtNumber=fmtNumber,
		inputToBinding=inputToBinding,
		getCurrentModeKey=function() return CURRENT_MODE_KEY end,
		getHitboxToggleKey=function() return TOGGLE_HB_KEY end,
		getSpeedToggleKey=function() return TOGGLE_SPEED_KEY end,
		getJumpBoostToggleKey=function() return TOGGLE_JB_KEY end,
		getAlwaysBoostToggleKey=function() return TOGGLE_AB_KEY end,
		getESPToggleKey=function() return TOGGLE_ACTION_KEY end,
		refreshESPStatus=function(state,available)
			PAGE1_STATE.actionStatusOn=state and available~=false
			actionStatusOn=PAGE1_STATE.actionStatusOn
			refreshActionStatus()
		end,
		setCurrentMode=function(key,label)
			CURRENT_MODE_KEY=tostring(key or"mode1")
			CURRENT_MODE_LABEL=tostring(label or"Gameplay")
			if modeSubtitle then
				modeSubtitle.Text=CURRENT_MODE_LABEL.." loaded"
			end
			if PAGE1_APIS.GameParams and PAGE1_APIS.GameParams.Refresh then
				pcall(PAGE1_APIS.GameParams.Refresh)
			end
			if PAGE1_APIS.ESP and PAGE1_APIS.ESP.Refresh then
				pcall(PAGE1_APIS.ESP.Refresh)
			end
			refreshActionStatus()
		end,
		onChanged=function()
			syncPage1State()
			requestPlayerAutosave()
			refreshActionStatus()
		end,
	}
end

local function addPage1Error(parent,order,title,path)
	local section=makeSection(parent,order,title,"module failed to load")
	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,24),Text=path.." could not be loaded.",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
end

local function buildPage1()
	local ctx=makePage1Ctx()

	if Page1HitboxModule and Page1HitboxModule.new then
		local ok,result=pcall(function()
			return Page1HitboxModule.new(ctx,leftCol)
		end)
		if ok then PAGE1_APIS.Hitbox=result else addPage1Error(leftCol,1,"Hitbox",tostring(result)) end
	else
		addPage1Error(leftCol,1,"Hitbox","page-1/hitbox.lua")
	end

	if Page1GravityModule and Page1GravityModule.new then
		local ok,result=pcall(function()
			return Page1GravityModule.new(ctx,leftCol)
		end)
		if ok then PAGE1_APIS.Gravity=result else addPage1Error(leftCol,2,"Gravity",tostring(result)) end
	else
		addPage1Error(leftCol,2,"Gravity","page-1/gravity.lua")
	end

	if Page1SpeedModule and Page1SpeedModule.new then
		local ok,result=pcall(function()
			return Page1SpeedModule.new(ctx,leftCol)
		end)
		if ok then PAGE1_APIS.Speed=result else addPage1Error(leftCol,3,"Speed",tostring(result)) end
	else
		addPage1Error(leftCol,3,"Speed","page-1/speed.lua")
	end

	if Page1GameParamsModule and Page1GameParamsModule.new then
		local ok,result=pcall(function()
			return Page1GameParamsModule.new(ctx,rightCol)
		end)
		if ok then PAGE1_APIS.GameParams=result else addPage1Error(rightCol,1,"Game Params",tostring(result)) end
	else
		addPage1Error(rightCol,1,"Game Params","page-1/game-params.lua")
	end

	if Page1BoostModule and Page1BoostModule.new then
		local ok,result=pcall(function()
			return Page1BoostModule.new(ctx,rightCol)
		end)
		if ok then PAGE1_APIS.Boost=result else addPage1Error(rightCol,2,"Boost",tostring(result)) end
	else
		addPage1Error(rightCol,2,"Boost","page-1/boost.lua")
	end

	if Page1ESPModule and Page1ESPModule.new then
		local ok,result=pcall(function()
			return Page1ESPModule.new(ctx,rightCol)
		end)
		if ok then PAGE1_APIS.ESP=result else addPage1Error(rightCol,3,"ESP",tostring(result)) end
	else
		addPage1Error(rightCol,3,"ESP","page-1/esp.lua")
	end

	syncPage1State()
	refreshActionStatus()
end

local function clearPage1Column(column)
	if not column then return end

	for _,child in ipairs(column:GetChildren()) do
		if not child:IsA("UIListLayout") then
			child:Destroy()
		end
	end
end

rebuildPage1FromModules=function()
	for _,api in pairs(PAGE1_APIS) do
		if api and api.Destroy then
			pcall(api.Destroy)
		end
	end

	PAGE1_APIS={}
	clearPage1Column(leftCol)
	clearPage1Column(rightCol)
	buildPage1()

	if updateResponsiveLayout then
		pcall(updateResponsiveLayout)
	end
end

buildPage1()

local function resetMainPageDefaults()
	PAGE1_STATE.hitboxOn=false
	PAGE1_STATE.sizeX=2.52
	PAGE1_STATE.sizeY=5.4
	PAGE1_STATE.sizeZ=1.41
	PAGE1_STATE.targetTransparency=0.7
	PAGE1_STATE.gravityValue=196.2
	PAGE1_STATE.speedEnabled=false
	PAGE1_STATE.speedValue=18
	PAGE1_STATE.athleticismOn=false
	PAGE1_STATE.staminaRegenValue=10
	PAGE1_STATE.staminaDepleteValue=10
	PAGE1_STATE.jumpPowerValue=53.5
	PAGE1_STATE.divePowerValue=1.9
	PAGE1_STATE.jumpBoostOn=false
	PAGE1_STATE.jumpBoostTradeMode=false
	PAGE1_STATE.boostForceY=32
	PAGE1_STATE.boostCooldown=5
	PAGE1_STATE.boostChance=100
	PAGE1_STATE.ballDetectionRadius=10
	PAGE1_STATE.actionStatusOn=false

	for _,api in pairs(PAGE1_APIS) do
		if api and api.Refresh then
			pcall(api.Refresh)
		end
	end

	syncPage1State()
	requestPlayerAutosave()
end

local function tintSlider(slider, color)
	if slider.fill then slider.fill.BackgroundColor3=color end
	if slider.knob then slider.knob.BackgroundColor3=color end
end

local StrokeColourAPI=nil
local resetCustomizePageDefaults=function() end

local function clearCustomizePage()
	if not uiSettingsPage then return end

	for _,child in ipairs(uiSettingsPage:GetChildren()) do
		if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
			child:Destroy()
		end
	end
end

local function buildCustomizePage()
	if StrokeColourAPI and StrokeColourAPI.Destroy then
		pcall(function()
			StrokeColourAPI.Destroy()
		end)
	end

	StrokeColourAPI=nil
	resetCustomizePageDefaults=function() end

	clearCustomizePage()

	if StrokeColourModule and StrokeColourModule.new then
		local ok,result=pcall(function()
			return StrokeColourModule.new({
				New=New,
				THEME=THEME,
				UI_STYLE=UI_STYLE,

				DEFAULT_UI_STYLE={
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
				},

				SG=SG,

				makeSection=makeSection,
				buildSlider=buildSlider,
				buildToggleRow=buildToggleRow,
				wrapTextButton=wrapTextButton,

				getUIStrokeColor=getUIStrokeColor,
				getUIStrokeGradientColor=getUIStrokeGradientColor,
				applyUIStrokeTheme=applyUIStrokeTheme,
				tintSlider=tintSlider,

				onChanged=function()
					applyUIStrokeTheme()
					requestPlayerAutosave()
				end,
			},uiSettingsPage)
		end)

		if ok then
			StrokeColourAPI=result

			resetCustomizePageDefaults=function()
				if StrokeColourAPI and StrokeColourAPI.Reset then
					StrokeColourAPI.Reset()
				end
			end
		else
			warn("Stroke colour module failed:",result)

			local fallbackSection=makeSection(uiSettingsPage,1,"Stroke Colour","Remote module failed to load.")
			New("TextLabel",{
				BackgroundTransparency=1,
				Size=UDim2.new(1,0,0,22),
				Text="page-3/stroke-colour.lua failed: "..tostring(result),
				Font=Enum.Font.Gotham,
				TextSize=12,
				TextColor3=THEME.RED,
				TextXAlignment=Enum.TextXAlignment.Left,
				ZIndex=6,
			},fallbackSection)
		end
	else
		warn("Missing remote module: page-3/stroke-colour.lua")

		local fallbackSection=makeSection(uiSettingsPage,1,"Stroke Colour","Remote module failed to load.")
		New("TextLabel",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,0,22),
			Text="Missing page-3/stroke-colour.lua",
			Font=Enum.Font.Gotham,
			TextSize=12,
			TextColor3=THEME.RED,
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=6,
		},fallbackSection)
	end

	applyUIStrokeTheme()

	if updateResponsiveLayout then
		pcall(updateResponsiveLayout)
	end
end

rebuildCustomizeFromModules=function()
	buildCustomizePage()
end

buildCustomizePage()

local MapEditorAPI=nil
local WorkspaceAPI=nil
local RemoveAdsAPI=nil

local function clearMapPage()
	if not mapPage then return end

	for _,child in ipairs(mapPage:GetChildren()) do
		if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
			child:Destroy()
		end
	end
end

local function buildMapPage()
	if MapEditorAPI and MapEditorAPI.Destroy then
		pcall(function()
			MapEditorAPI.Destroy()
		end)
	end

	if WorkspaceAPI and WorkspaceAPI.Destroy then
		pcall(function()
			WorkspaceAPI.Destroy()
		end)
	end

	if RemoveAdsAPI and RemoveAdsAPI.Destroy then
		pcall(function()
			RemoveAdsAPI.Destroy()
		end)
	end

	MapEditorAPI=nil
	WorkspaceAPI=nil
	RemoveAdsAPI=nil
	clearMapPage()

	if WORLD_SETTINGS.SmoothPlastic==nil then
		WORLD_SETTINGS.SmoothPlastic=false
	end

	if type(WORLD_SETTINGS.OriginalMaterials)~="table" then
		WORLD_SETTINGS.OriginalMaterials=setmetatable({}, {__mode="k"})
	end

	if MapEditorModule and MapEditorModule.new then
		local ok,result=pcall(function()
			return MapEditorModule.new({
				New=New,
				THEME=THEME,
				makeSection=makeSection,
				buildSlider=buildSlider,
				buildToggleRow=buildToggleRow,
				wrapTextButton=wrapTextButton,
			},mapPage)
		end)

		if ok then
			MapEditorAPI=result
		else
			warn("Map editor module failed:",result)
		end
	end

	if WorkspaceModule and WorkspaceModule.new then
		local ok,result=pcall(function()
			return WorkspaceModule.new({
				New=New,
				THEME=THEME,
				WORLD_SETTINGS=WORLD_SETTINGS,

				makeSection=makeSection,
				buildToggleRow=buildToggleRow,

				onChanged=function(state)
					potatoMode=state and true or false
				end,
			},mapPage)
		end)

		if ok then
			WorkspaceAPI=result
		else
			local section=makeSection(mapPage,1,"Workspace","Remote module failed to load.")
			New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Workspace module failed: "..tostring(result),Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
		end
	else
		local section=makeSection(mapPage,1,"Workspace","Remote module failed to load.")
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Missing remote module: page-4/workspace.lua",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
	end

	if RemoveAdsModule and RemoveAdsModule.new then
		local ok,result=pcall(function()
			return RemoveAdsModule.new({
				New=New,
				THEME=THEME,
				makeSection=makeSection,
				buildToggleRow=buildToggleRow,
				getCurrentModeKey=function()
					return CURRENT_MODE_KEY
				end,
				onChanged=function()
					requestPlayerAutosave()
				end,
			},mapPage)
		end)

		if ok then
			RemoveAdsAPI=result
		else
			local section=makeSection(mapPage,2,"Remove Ads","Remote module failed to load.")
			New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Remove Ads module failed: "..tostring(result),Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
		end
	else
		local section=makeSection(mapPage,2,"Remove Ads","Remote module failed to load.")
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Missing remote module: page-4/remove-ads.lua",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
	end

	applyUIStrokeTheme()
end

rebuildMapFromModules=function()
	buildMapPage()
end

buildMapPage()

local refreshPage2UI=function() end
local PAGE2_EXPANDED_OWNED={}
local PlayerDataAPI=nil

local function showConfirmModal(titleText, bodyText, yesText, onYes)
	local modal=New("Frame", {BackgroundColor3=Color3.fromRGB(0, 0, 0), BackgroundTransparency=0.25, BorderSizePixel=0, Size=UDim2.new(1, 0, 1, 0), ZIndex=100}, SG)

	local box=New("Frame", {AnchorPoint=Vector2.new(0.5, 0.5), Position=UDim2.new(0.5, 0, 0.5, 0), Size=UDim2.fromOffset(390, 170), BackgroundColor3=THEME.BG, BorderSizePixel=0, ZIndex=101}, modal)

	New("UIStroke", {Color=THEME.STROKE, Thickness=2, Transparency=0}, box)

	New("TextLabel", {BackgroundTransparency=1, Position=UDim2.fromOffset(16, 14), Size=UDim2.new(1, -32, 0, 24), Text=titleText, Font=Enum.Font.GothamMedium, TextSize=14, TextColor3=THEME.TEXT, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=102}, box)

	New("TextLabel", {BackgroundTransparency=1, Position=UDim2.fromOffset(16, 48), Size=UDim2.new(1, -32, 0, 54), Text=bodyText, Font=Enum.Font.Gotham, TextSize=12, TextWrapped=true, TextColor3=THEME.MUTED, TextXAlignment=Enum.TextXAlignment.Left, TextYAlignment=Enum.TextYAlignment.Top, ZIndex=102}, box)

	local function modalButton(text, x)
		local b=New("TextButton", {Position=UDim2.fromOffset(x, 120), Size=UDim2.fromOffset(104, 30), BackgroundColor3=THEME.BG, BorderSizePixel=0, Text=text, Font=Enum.Font.Gotham, TextSize=12, TextColor3=THEME.TEXT, AutoButtonColor=false, ZIndex=102}, box)

		local wrap=wrapTextButton(b, THEME.BG, 2)

		b.MouseEnter:Connect(function()
			wrap.BackgroundColor3=Color3.fromRGB(43,43,43)
		end)

		b.MouseLeave:Connect(function()
			wrap.BackgroundColor3=THEME.PANEL
		end)

		return b
	end

	local no=modalButton("CANCEL", 160)
	local yes=modalButton(yesText or"YES", 274)

	no.MouseButton1Click:Connect(function()
		modal:Destroy()
	end)

	yes.MouseButton1Click:Connect(function()
		modal:Destroy()
		if onYes then onYes() end
	end)
end

local function refreshSettingsPage()
	if WorkspaceAPI and WorkspaceAPI.Refresh then
		pcall(function()
			WorkspaceAPI.Refresh()
		end)
	end

	if RemoveAdsAPI and RemoveAdsAPI.Refresh then
		pcall(function()
			RemoveAdsAPI.Refresh()
		end)
	end
end

local function buildActualSettingsPage()
	if PlayerDataModule and PlayerDataModule.new then
		local ok,result=pcall(function()
			return PlayerDataModule.new({
				New=New,
				THEME=THEME,
				SG=SG,
				BOT_API=BOT_API,
				playerId=tostring(me.UserId),
				me=me,

				makeSection=makeSection,
				wrapTextButton=wrapTextButton,
				showConfirmModal=showConfirmModal,

				OWNED_PRESETS=OWNED_PRESETS,
				expandedOwned=PAGE2_EXPANDED_OWNED,

				resetMainPageDefaults=resetMainPageDefaults,
				resetCustomizePageDefaults=resetCustomizePageDefaults,
				resetKeybindPresetPageDefaults=function()
					if resetKeybindPresetPageDefaults then
						resetKeybindPresetPageDefaults()
					end
				end,
				refreshPage2UI=function()
					if refreshPage2UI then refreshPage2UI() end
				end,
				rebuildOwnedList=function()
					if refreshPage2UI then refreshPage2UI() end
				end,
				refreshSettingsPage=refreshSettingsPage,
			},actualSettingsPage,{
				Workspace=WorkspaceAPI,
			})
		end)

		if ok then
			PlayerDataAPI=result
		else
			local section=makeSection(actualSettingsPage,1,"Player Data","Remote module failed to load.")
			New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Player Data module failed: "..tostring(result),Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
		end
	else
		local section=makeSection(actualSettingsPage,1,"Player Data","Remote module failed to load.")
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Missing remote module: page-5/player-data.lua",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)
	end

	refreshSettingsPage()
end

buildActualSettingsPage()

local activeCapture=nil

local function addPage2Error(parent,text)
	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text=text,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},parent)
end

local function buildPage2()
	local page2Wrap=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,ZIndex=4,LayoutOrder=1},futurePage)

	New("UIListLayout",{FillDirection=Enum.FillDirection.Vertical,Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},page2Wrap)

	local ownedSection=makeSection(page2Wrap,1,"Hitbox Presets","Your saved presets")
	local editorSection=makeSection(page2Wrap,2,"Preset Editor","edit hotkeys and hitbox sizes and save (maybe?)")
	local bindSection=makeSection(page2Wrap,3,"Keybind Settings","click a bind, then press the next input")

	local page2Ctx={
		New=New,
		THEME=THEME,
		SG=SG,
		PRESETS=PRESETS,
		DEFAULT_PRESETS=DEFAULT_PRESETS,
		OWNED_PRESETS=OWNED_PRESETS,
		expandedOwned=PAGE2_EXPANDED_OWNED,
		fmtNumber=fmtNumber,
		bindingToLabel=bindingToLabel,
		parseKeyCodeInput=parseKeyCodeInput,
		inputToBinding=inputToBinding,
		wrapTextButton=wrapTextButton,
		wrapTextBox=wrapTextBox,
		placeWrappedBox=placeWrappedBox,
		placeWrappedButton=placeWrappedButton,
		setWrappedButtonBg=setWrappedButtonBg,
		makeBox=makeBox,
		BOT_API=BOT_API,
		playerId=tostring(me.UserId),
		requestPlayerAutosave=requestPlayerAutosave,
		setPresetSize=setPresetSizeFromDataSave,
		setPresetKey=setPresetKeyFromDataSave,
		resetPreset=resetPresetFromDataSave,
		applyPresetEditor=applyPresetEditorFromDataSave,
		createOwnedPreset=createOwnedPresetFromDataSave,
		equipOwnedPreset=equipOwnedPresetFromDataSave,
		deleteOwnedPreset=deleteOwnedPresetFromDataSave,
		State={},
		Bindings={
			{label="Toggle open / hide GUI",get=function() return TOGGLE_UI_KEY end,set=function(v) TOGGLE_UI_KEY=v; requestPlayerAutosave() end},
			{label="Hitbox Toggle",get=function() return TOGGLE_HB_KEY end,set=function(v) TOGGLE_HB_KEY=v; requestPlayerAutosave() end},
			{label="Jump Boost Toggle",get=function() return TOGGLE_JB_KEY end,set=function(v) TOGGLE_JB_KEY=v; requestPlayerAutosave() end},
			{label="Always Boost Toggle",get=function() return TOGGLE_AB_KEY end,set=function(v) TOGGLE_AB_KEY=v; requestPlayerAutosave() end},
			{label="ESP Toggle",get=function() return TOGGLE_ACTION_KEY end,set=function(v) TOGGLE_ACTION_KEY=v; requestPlayerAutosave() end},
			{label="Speed Toggle",get=function() return TOGGLE_SPEED_KEY end,set=function(v) TOGGLE_SPEED_KEY=v; requestPlayerAutosave() end},
		},
	}

	local hitboxPresets=nil
	local keybindSettings=nil
	local presetEditor=nil

	if HitboxPresetModule and type(HitboxPresetModule.new)=="function" then
		local ok,result=pcall(function()
			return HitboxPresetModule.new(page2Ctx,ownedSection)
		end)
		if ok then
			hitboxPresets=result
		else
			addPage2Error(ownedSection,"Hitbox Presets failed: "..tostring(result))
		end
	else
		addPage2Error(ownedSection,"Missing remote module: page-2/hitbox-preset.lua")
	end

	if KeybindSettingsModule and type(KeybindSettingsModule.new)=="function" then
		local ok,result=pcall(function()
			return KeybindSettingsModule.new(page2Ctx,bindSection)
		end)
		if ok then
			keybindSettings=result
		else
			addPage2Error(bindSection,"Keybind Settings failed: "..tostring(result))
		end
	else
		addPage2Error(bindSection,"Missing remote module: page-2/keybind-settings.lua")
	end

	if PresetEditorModule and type(PresetEditorModule.new)=="function" then
		if not keybindSettings then
			addPage2Error(editorSection,"Preset Editor needs keybind-settings.lua to load first.")
		else
			local ok,result=pcall(function()
				return PresetEditorModule.new(page2Ctx,editorSection,keybindSettings,hitboxPresets)
			end)
			if ok then
				presetEditor=result
			else
				addPage2Error(editorSection,"Preset Editor failed: "..tostring(result))
			end
		end
	else
		addPage2Error(editorSection,"Missing remote module: page-2/preset-editor.lua")
	end

	refreshPage2UI=function()
		if hitboxPresets and hitboxPresets.Refresh then pcall(hitboxPresets.Refresh) end
		if keybindSettings and keybindSettings.Refresh then pcall(keybindSettings.Refresh) end
		if presetEditor and presetEditor.Refresh then pcall(presetEditor.Refresh) end
	end

	local function refreshAll()
		refreshPage2UI()
	end

	if hitboxPresets and hitboxPresets.SetRefreshAll then hitboxPresets.SetRefreshAll(refreshAll) end
	if keybindSettings and keybindSettings.SetRefreshAll then keybindSettings.SetRefreshAll(refreshAll) end
	if presetEditor and presetEditor.SetRefreshAll then presetEditor.SetRefreshAll(refreshAll) end

	refreshPage2UI()
end

buildPage2()
refreshFooterResetButton()

resetKeybindPresetPageDefaults=function()
	TOGGLE_UI_KEY=Enum.KeyCode.Unknown
	TOGGLE_HB_KEY=Enum.KeyCode.Unknown
	TOGGLE_JB_KEY=Enum.KeyCode.Unknown
	TOGGLE_AB_KEY=Enum.KeyCode.Unknown
	TOGGLE_ACTION_KEY=Enum.KeyCode.Unknown
	TOGGLE_SPEED_KEY=Enum.KeyCode.Unknown

	if DataSaveAPI and DataSaveAPI.ResetPresetEditor then
		DataSaveAPI.ResetPresetEditor(true)
	else
		for i=1,4 do
			PRESETS[i].key=DEFAULT_PRESETS[i].key
			PRESETS[i].size=DEFAULT_PRESETS[i].size
		end
	end

	activeCapture=nil

	if refreshPage2UI then
		refreshPage2UI()
	end

	requestPlayerAutosave()
end

resetBtn.MouseButton1Click:Connect(function()
	local activePageName=getActivePageName()

	if activePageName=="main" then
		resetMainPageDefaults()
	elseif activePageName=="page2" then
		resetKeybindPresetPageDefaults()
	elseif activePageName=="customize" then
		resetCustomizePageDefaults()
	end

	refreshActionStatus()
	requestPlayerAutosave()
end)

local function shutdownTool()
	if not toolAlive then return end
	toolAlive=false

	if AnnouncementAPI and AnnouncementAPI.Destroy then
		pcall(function()
			AnnouncementAPI.Destroy()
		end)
	end

	if SG and SG.Parent then
		SG:Destroy()
	end
end

closeBtn.MouseButton1Click:Connect(shutdownTool)

local function applyHitboxPreset(index)
	local preset=PRESETS[index]
	if not preset or not preset.size then return end

	local size=preset.size
	PAGE1_STATE.sizeX=size.X
	PAGE1_STATE.sizeY=size.Y
	PAGE1_STATE.sizeZ=size.Z

	if PAGE1_APIS.Hitbox and PAGE1_APIS.Hitbox.SetHitboxSize then
		pcall(function()
			PAGE1_APIS.Hitbox.SetHitboxSize(size.X,size.Y,size.Z,true)
		end)
	elseif PAGE1_APIS.Hitbox and PAGE1_APIS.Hitbox.Refresh then
		syncPage1State()
		pcall(PAGE1_APIS.Hitbox.Refresh)
		requestPlayerAutosave()
	else
		syncPage1State()
		requestPlayerAutosave()
	end
end

UIS.InputBegan:Connect(function(inp, processed)
	if activeCapture then
		local cap=activeCapture

		if inp.KeyCode==Enum.KeyCode.Escape then
			activeCapture=nil
			if refreshPage2UI then refreshPage2UI() end
			return
		end

		local binding=inputToBinding(inp)
		if binding~=nil then
			cap.setter(binding)
		end

		activeCapture=nil

		if refreshPage2UI then
			refreshPage2UI()
		end

		return
	end

	if processed then return end

	local bind=inputToBinding(inp)
	if bind~=nil and bind==TOGGLE_UI_KEY and TOGGLE_UI_KEY~=Enum.KeyCode.Unknown then
		setUIVisible(not uiVisible)
	end

	if bind~=nil and bind==TOGGLE_ACTION_KEY and TOGGLE_ACTION_KEY~=Enum.KeyCode.Unknown then
		if not(PAGE1_APIS.ESP and PAGE1_APIS.ESP.SetESPState) then
			if CURRENT_MODE_KEY=="mode1" then
				PAGE1_STATE.actionStatusOn=not PAGE1_STATE.actionStatusOn
				syncPage1State()
				refreshActionStatus()
				requestPlayerAutosave()
			else
				PAGE1_STATE.actionStatusOn=false
				syncPage1State()
				refreshActionStatus()
			end
		end
	end

	if bind~=nil then
		for i,preset in ipairs(PRESETS) do
			if preset.key and preset.key~=Enum.KeyCode.Unknown and bind==preset.key then
				applyHitboxPreset(i)
				break
			end
		end
	end
end)

local function getPersistentValue(name,default)
	if name=="CURRENT_MODE_KEY" then return CURRENT_MODE_KEY end
	if name=="CURRENT_MODE_LABEL" then return CURRENT_MODE_LABEL end
	if PAGE1_STATE[name]~=nil then return PAGE1_STATE[name] end
	if name=="TOGGLE_UI_KEY" then return TOGGLE_UI_KEY end
	if name=="TOGGLE_HB_KEY" then return TOGGLE_HB_KEY end
	if name=="TOGGLE_JB_KEY" then return TOGGLE_JB_KEY end
	if name=="TOGGLE_AB_KEY" then return TOGGLE_AB_KEY end
	if name=="TOGGLE_ACTION_KEY" then return TOGGLE_ACTION_KEY end
	if name=="TOGGLE_SPEED_KEY" then return TOGGLE_SPEED_KEY end
	return default
end

local function setPersistentValue(name,value)
	if name=="CURRENT_MODE_KEY" then CURRENT_MODE_KEY=tostring(value or "mode1") return end
	if name=="CURRENT_MODE_LABEL" then CURRENT_MODE_LABEL=tostring(value or "Gameplay") return end
	if PAGE1_STATE[name]~=nil then PAGE1_STATE[name]=value; syncPage1State(); return end
	if name=="TOGGLE_UI_KEY" then TOGGLE_UI_KEY=value return end
	if name=="TOGGLE_HB_KEY" then TOGGLE_HB_KEY=value return end
	if name=="TOGGLE_JB_KEY" then TOGGLE_JB_KEY=value return end
	if name=="TOGGLE_AB_KEY" then TOGGLE_AB_KEY=value return end
	if name=="TOGGLE_ACTION_KEY" then TOGGLE_ACTION_KEY=value return end
	if name=="TOGGLE_SPEED_KEY" then TOGGLE_SPEED_KEY=value return end
end

local function refreshAllUI()
	for _,api in pairs(PAGE1_APIS) do
		if api and api.Refresh then pcall(api.Refresh) end
	end

	syncPage1State()

	if StrokeColourAPI and StrokeColourAPI.Refresh then pcall(StrokeColourAPI.Refresh) end
	if MapEditorAPI and MapEditorAPI.Refresh then pcall(MapEditorAPI.Refresh) end
	if WorkspaceAPI and WorkspaceAPI.Refresh then pcall(WorkspaceAPI.Refresh) end
	if RemoveAdsAPI and RemoveAdsAPI.Refresh then pcall(RemoveAdsAPI.Refresh) end
	if refreshPage2UI then pcall(refreshPage2UI) end
	if applyUIStrokeTheme then pcall(applyUIStrokeTheme) end
	if updateResponsiveLayout then pcall(updateResponsiveLayout) end
	if refreshActionStatus then pcall(refreshActionStatus) end
end

if DataSaveModule and DataSaveModule.new then
	local ok,result=pcall(function()
		return DataSaveModule.new({
			BOT_API=BOT_API,
			me=me,
			playerId=tostring(me.UserId),
			toolAlive=toolAlive,

			State=PAGE1_STATE,
			Get=getPersistentValue,
			Set=setPersistentValue,

			PRESETS=PRESETS,
			DEFAULT_PRESETS=DEFAULT_PRESETS,
			OWNED_PRESETS=OWNED_PRESETS,
			expandedOwned=PAGE2_EXPANDED_OWNED,

			UI_STYLE=UI_STYLE,
			UI_WINDOW=UI_WINDOW,
			WORLD_SETTINGS=WORLD_SETTINGS,
			root=root,

			RefreshAll=refreshAllUI,
			refreshPage2UI=function() if refreshPage2UI then refreshPage2UI() end end,
			rebuildOwnedList=function() if refreshPage2UI then refreshPage2UI() end end,
			refreshSettingsPage=refreshSettingsPage,
			applyUIStrokeTheme=applyUIStrokeTheme,
			updateResponsiveLayout=updateResponsiveLayout,
			refreshActionStatus=refreshActionStatus,

			setHitboxSize=function(x,y,z) PAGE1_STATE.sizeX=x; PAGE1_STATE.sizeY=y; PAGE1_STATE.sizeZ=z; syncPage1State() end,
			setTransparency=function(v) PAGE1_STATE.targetTransparency=v; syncPage1State() end,
			setGravity=function(v) PAGE1_STATE.gravityValue=v; syncPage1State() end,
			setHitboxLock=function(v) PAGE1_STATE.hitboxOn=v and true or false; syncPage1State() end,
			setSpeedValue=function(v) PAGE1_STATE.speedValue=v; syncPage1State() end,
			setSpeedState=function(v) PAGE1_STATE.speedEnabled=v and true or false; syncPage1State() end,
			setAthleticism=function(v) PAGE1_STATE.athleticismOn=v and true or false; syncPage1State() end,
			setStaminaRegenValue=function(v) PAGE1_STATE.staminaRegenValue=v; syncPage1State() end,
			setStaminaDepleteValue=function(v) PAGE1_STATE.staminaDepleteValue=v; syncPage1State() end,
			setJumpPowerValue=function(v) PAGE1_STATE.jumpPowerValue=v; syncPage1State() end,
			setDivePowerValue=function(v) PAGE1_STATE.divePowerValue=v; syncPage1State() end,
			setJumpBoostState=function(v) PAGE1_STATE.jumpBoostOn=v and true or false; syncPage1State() end,
		})
	end)

	if ok then
		DataSaveAPI=result
	else
		warn("DataSave module failed:",result)
	end
else
	warn("Missing remote module: data-save/data-save.lua")
end

if DataSaveAPI then
	pcall(function()
		DataSaveAPI.Load()
		DataSaveAPI.LoadOwnedPresets()
	end)
	refreshAllUI()
end

if AnnouncementModule and AnnouncementModule.new then
	local ok,result=pcall(function()
		return AnnouncementModule.new({
			New=New,
			THEME=THEME,
			SG=SG,
			BOT_API=BOT_API,
			playerId=tostring(me.UserId),
			wrapTextButton=wrapTextButton,
			safeDisconnect=safeDisconnect,
		})
	end)

	if ok then
		AnnouncementAPI=result
	else
		warn("Announcement module failed:",result)
	end
else
	warn("Missing remote module: announcement.lua")
end

setActivePage("main")
applyUIStrokeTheme()
refreshAllUI()
refreshActionStatus()
modeSubtitle.Text=CURRENT_MODE_LABEL.." loaded"
startAutoRefresh()
