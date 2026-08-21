Players=game:GetService("Players")
inputService=game:GetService("UserInputService")
TweenService=game:GetService("TweenService")
RunService=game:GetService("RunService")
HttpService=game:GetService("HttpService")
Workspace=game:GetService("Workspace")

local function makeTheme(id,name,primary,stroke,gradient,shape,tones)
	return{
		Id=id,
		Name=name,
		Shape=shape,
		Tones=tones,
		Components={
			TextFont=Enum.Font.Gotham,
			TitleFont=Enum.Font.GothamBold,
			ControlFont=Enum.Font.GothamMedium,
			SectionPrefix=true,
		},
		Defaults={
			PrimaryR=primary[1],PrimaryG=primary[2],PrimaryB=primary[3],
			StrokeR=stroke[1],StrokeG=stroke[2],StrokeB=stroke[3],
			GradientR=gradient[1],GradientG=gradient[2],GradientB=gradient[3],
			StrokeGradient=false,
			LiquidStroke=false,
			LiquidStrokeSpeed=1,
			LiquidStrokeDirection="Right",
			StrokeThickness=1,
			StrokeTransparency=0.84,
			CornerRadius=shape.WindowRadius,
			UILib=id,
		},
	}
end

local squareShape={
	WindowRadius=0,SectionRadius=0,ControlRadius=0,SliderRadius=0,
	SliderHeight=24,SliderStyle="original",WindowStrokeTransparency=0.66,
	SectionStrokeTransparency=0.92,ControlStrokeTransparency=0.9,
	SliderStrokeTransparency=0.9,AccentStrokeTransparency=0.62,
}

local function exactTheme(id,name,primary,accent,secondary,palette)
	local theme=makeTheme(id,name,primary,accent,secondary,squareShape,nil)
	theme.Theme={}
	for role,value in pairs(palette) do
		theme.Theme[role]=Color3.fromRGB(value[1],value[2],value[3])
	end
	return theme
end

devThemes={
	raycast=exactTheme("raycast","Raycast",{16,16,16},{255,99,99},{207,47,152},{
		bg={16,16,16},topbar={16,16,16},panel={20,20,20},card={21,21,21},section={20,20,20},
		button={21,21,21},input={21,21,21},sliderBg={21,21,21},sliderFill={255,99,99},
		text={254,254,254},muted={102,102,102},stroke={255,99,99},softStroke={40,40,40},
	}),
	everforest=exactTheme("everforest","Everforest",{253,246,227},{147,178,89},{223,105,186},{
		bg={253,246,227},topbar={253,246,227},panel={253,246,227},card={239,235,212},section={239,235,212},
		button={239,235,212},input={253,246,227},sliderBg={239,235,212},sliderFill={147,178,89},
		text={92,106,114},muted={147,159,145},stroke={147,178,89},softStroke={224,220,199},
	}),
	proof=exactTheme("proof","Proof",{245,243,237},{61,117,93},{95,106,194},{
		bg={245,243,237},topbar={239,237,230},panel={239,237,230},card={245,243,237},section={239,237,230},
		button={239,237,230},input={245,243,237},sliderBg={239,237,230},sliderFill={61,117,93},
		text={47,49,45},muted={75,77,72},stroke={61,117,93},softStroke={122,118,109},
	}),
	linear=exactTheme("linear","Linear",{15,15,17},{96,106,204},{194,161,255},{
		bg={15,15,17},topbar={15,18,25},panel={10,12,17},card={23,24,29},section={23,24,29},
		button={15,18,25},input={23,24,29},sliderBg={23,24,29},sliderFill={96,106,204},
		text={227,228,230},muted={99,107,123},stroke={96,106,204},softStroke={99,107,123},
	}),
	material=exactTheme("material","Material",{33,33,33},{128,203,196},{199,146,234},{
		bg={33,33,33},topbar={33,33,33},panel={33,33,33},card={43,43,43},section={43,43,43},
		button={43,43,43},input={43,43,43},sliderBg={43,43,43},sliderFill={128,203,196},
		text={238,255,255},muted={103,103,103},stroke={128,203,196},softStroke={97,97,97},
	}),
	absolutely=exactTheme("absolutely","Absolutely",{45,45,43},{204,125,94},{204,125,94},{
		bg={45,45,43},topbar={55,55,53},panel={55,55,53},card={45,45,43},section={55,55,53},
		button={55,55,53},input={45,45,43},sliderBg={55,55,53},sliderFill={204,125,94},
		text={249,249,247},muted={178,178,176},stroke={204,125,94},softStroke={178,178,176},
	}),
}

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
	bg=Color3.fromRGB(16,16,16),
	panel=Color3.fromRGB(20,20,20),
	card=Color3.fromRGB(21,21,21),
	accent=Color3.fromRGB(255,99,99),
	text=Color3.fromRGB(254,254,254),
	muted=Color3.fromRGB(102,102,102),
	stroke=Color3.fromRGB(255,99,99),
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

local headerArtUrls={
	raycast="https://raw.githubusercontent.com/amyyzing/dev-gui/main/assets/headers/raycast.png",
	everforest="https://raw.githubusercontent.com/amyyzing/dev-gui/main/assets/headers/everforest.png",
	proof="https://raw.githubusercontent.com/amyyzing/dev-gui/main/assets/headers/proof.png",
	linear="https://raw.githubusercontent.com/amyyzing/dev-gui/main/assets/headers/linear.png",
	material="https://raw.githubusercontent.com/amyyzing/dev-gui/main/assets/headers/material.png",
	absolutely="https://raw.githubusercontent.com/amyyzing/dev-gui/main/assets/headers/absolutely.png",
}
local headerArtCache={}

function getHeaderArt(id)
	id=tostring(id or "raycast"):lower()
	if headerArtCache[id] then
		return headerArtCache[id]
	end

	local url=headerArtUrls[id]
	local assetFn=getcustomasset or getsynasset
	if not url or type(writefile)~="function" or type(assetFn)~="function" then
		return nil
	end

	local path="dev_gui_header_"..id.."_1.png"
	local exists=type(isfile)=="function" and isfile(path)
	if not exists then
		local ok,data=pcall(function()
			return game:HttpGet(url,true)
		end)
		if not ok or type(data)~="string" or #data<8 then
			return nil
		end
		local wrote=pcall(writefile,path,data)
		if not wrote then
			return nil
		end
	end

	local ok,asset=pcall(assetFn,path)
	if ok and type(asset)=="string" then
		headerArtCache[id]=asset
		return asset
	end
	return nil
end

style={}

windowState={}

mapSettings={SmoothPlastic=false, OriginalMaterials={}}

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
boostBypassCooldown=false
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
qbAimTargetHighlight=true
qbAimLeadDelay=0.38
qbAimPeakHeight=14.2
qbAimThrowDelay=0.1

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
		else
			table.insert(runtimeConnections,connection)
		end
	end

	return connection
end

function untrackRuntimeConnection(connection)
	if runtimeScope and runtimeScope.remove then
		runtimeScope:remove(connection,false)
	end

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
	runtimeScope=nil

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
	local skipTranslation=properties.SkipTranslation
	local forcedThemeRole=properties.ThemeRole
	local forcedTextRole=properties.TextRole
	local forcedStrokeRole=properties.StrokeRole
	local forcedCornerRole=properties.CornerRole
	local isTextClass=class=="TextLabel" or class=="TextButton" or class=="TextBox"

	properties.SkipThemeRole=nil
	properties.SkipTextRole=nil
	properties.SkipTranslation=nil
	properties.ThemeRole=nil
	properties.TextRole=nil
	properties.StrokeRole=nil
	properties.CornerRole=nil

	if forcedCornerRole and class~="UICorner" and class~="UIStroke" and class~="UIGradient" then
		properties.ClipsDescendants=true
	end

	if properties.Active==nil and (class=="Frame" or class=="ScrollingFrame" or class=="TextButton" or class=="TextBox") then
		properties.Active=true
	end

	if isTextClass then
		if properties.TextColor3==nil then properties.TextColor3=colors.text end
		if properties.Font==nil then properties.Font=Enum.Font.Gotham end
		properties.TextStrokeTransparency=1
		properties.TextStrokeColor3=Color3.fromRGB(0, 0, 0)
		if properties.TextYAlignment==nil then properties.TextYAlignment=Enum.TextYAlignment.Center end
		if not skipTranslation and properties.Text~=nil then properties.Text=translateUIText(properties.Text) end
		if not skipTranslation and properties.PlaceholderText~=nil then properties.PlaceholderText=translateUIText(properties.PlaceholderText) end

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
	if class=="UIStroke" and parent and parent:GetAttribute("NoStroke")==true then
		instance.Enabled=false
		instance.Transparency=1
	end
	if class=="UICorner" and parent and parent:IsA("GuiObject") then
		parent.ClipsDescendants=true
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

function getModuleSource()
	if type(bootModuleSource)=="table" then
		local value=bootModuleSource.Id or bootModuleSource.id
		if type(value)=="string" and value~="" then return value end
	end
	if type(bootApi)=="table" and type(bootApi.Source)=="string" and bootApi.Source~="" then
		return bootApi.Source
	end
	return "dev-gui"
end

appModuleSource={id=getModuleSource()}

trustedApiUrl="https://dev-gui-api-production.up.railway.app"

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
	Source=appModuleSource.id,
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
	if (path=="/module/get" or path=="/module/batch" or path=="/module/manifest") and body.source==nil then
		body.source=botApi.Source
	end
	if (path=="/module/get" or path=="/module/batch" or path=="/module/manifest") and body.fresh==true and body.cacheBust==nil then
		body.cacheBust=tostring(os.clock())..":"..tostring(path)
	end

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

-- Keep the source split explicit:
-- app layout, UI maps, pages, and descriptions live in /gui;
-- reusable styling/building blocks live in /495-ui-library.
local function normalizePlatformName(value)
	value=tostring(value or "pc"):lower()
	if value=="mobile" then
		return "mobile"
	end
	return "pc"
end

runtimePlatform=normalizePlatformName(rawget(getfenv(),"bootPlatform"))
uiLibraryConfig=rawget(getfenv(),"bootUiLibrary")
if type(uiLibraryConfig)~="table" then
	uiLibraryConfig={}
end
uiLibrarySource={
	id="ui-library",
	owner=tostring(uiLibraryConfig.Owner or uiLibraryConfig.owner or "amyyzing"),
	repo=tostring(uiLibraryConfig.Repo or uiLibraryConfig.repo or "495-ui-library"),
	branch=tostring(uiLibraryConfig.Branch or uiLibraryConfig.branch or "main"),
}

modulePaths={
	CoreScope="core/scope.lua",
	CoreSignal="core/signal.lua",
	CoreScheduler="core/scheduler.lua",
	CorePlayerCache="core/player-cache.lua",
	CoreBallTracker="core/ball-tracker.lua",
	StateStore="state/store.lua",
	DesignTokens="design/tokens.lua",
	DesignThemeResolver="design/resolver.lua",
	DesignThemeRaycast="design/themes/raycast.lua",
	DesignThemeEverforest="design/themes/everforest.lua",
	DesignThemeProof="design/themes/proof.lua",
	DesignThemeLinear="design/themes/linear.lua",
	DesignThemeMaterial="design/themes/material.lua",
	DesignThemeAbsolutely="design/themes/absolutely.lua",
	Announcement="announcement.lua",
	GuiFusion="gui/fusion.lua",
	GuiLogic="features/colors/gui.lua",
	UILibraryMap="gui/library-map.lua",
	UIMap="gui/"..runtimePlatform..".luau",
	MainFrame="platforms/"..runtimePlatform.."/gui/mainframe.lua",
	Description="gui/description.lua",
	HitboxPresets="features/hitbox-presets/gui.lua",
	HitboxPresetsLogic="features/hitbox-presets/logic.lua",
	Keybinds="features/keybinds/gui.lua",
	KeybindsLogic="features/keybinds/logic.lua",
	PresetEditor="features/preset-editor/gui.lua",
	PresetEditorLogic="features/preset-editor/logic.lua",
	Hitbox="features/hitbox/gui.lua",
	HitboxLogic="features/hitbox/logic.lua",
	Params="features/params/gui.lua",
	ParamsLogic="features/params/logic.lua",
	Boost="features/boost/gui.lua",
	BoostLogic="features/boost/logic.lua",
	ESP="features/esp/gui.lua",
	ESPLogic="features/esp/logic.lua",
	ESPDefense="features/esp-defense/gui.lua",
	ESPDefenseLogic="features/esp-defense/logic.lua",
	ESPOffense="features/esp-offense/gui.lua",
	ESPOffenseLogic="features/esp-offense/logic.lua",
	QBAim="features/qb-aim/gui.lua",
	QBInterception="features/qb-aim/interception.lua",
	QBAimMath="features/qb-aim/math.lua",
	QBAimLogic="features/qb-aim/logic.lua",
	Testing="features/testing/gui.lua",
	TestingLogic="features/testing/logic.lua",
	Arc="features/arc/gui.lua",
	ArcLogic="features/arc/logic.lua",
	Colors="features/colors/gui.lua",
	ColorsLogic="features/colors/logic.lua",
	MapEditor="features/map-editor/gui.lua",
	MapEditorLogic="features/map-editor/logic.lua",
	Materials="features/materials/gui.lua",
	MaterialsLogic="features/materials/logic.lua",
	MapCleaner="features/map-cleaner/gui.lua",
	MapCleanerLogic="features/map-cleaner/logic.lua",
	Ads="features/ads/gui.lua",
	AdsLogic="features/ads/logic.lua",
	PlayerData="features/data/gui.lua",
	PlayerDataLogic="features/data/logic.lua",
	ResetGui="features/reset-gui/gui.lua",
	ResetGuiLogic="features/reset-gui/logic.lua",
	Discord="features/discord/gui.lua",
	DiscordLogic="features/discord/logic.lua",
	DiscordController="features/discord/core.lua",
	DiscordView="features/discord/view.lua",
	DataSave="data-save/data-save.lua",
	DumpConnections="dump/conn.lua",
	DumpLifecycle="dump/life.lua",
	DumpInput="dump/input.lua",
	DumpApiService="dump/api.lua",
	DumpModuleLoaderService="dump/load.lua",
	DumpPersistenceService="dump/save.lua",
	DumpUIAdapter="dump/lib.lua",
	DumpUICreate="dump/create.lua",
	DumpSyntax="dump/ui.lua",
	Dump="dump/init.lua",
}

local uiLibraryModulePaths={
	"design/resolver.lua",
	"design/themes/absolutely.lua",
	"design/themes/everforest.lua",
	"design/themes/linear.lua",
	"design/themes/material.lua",
	"design/themes/proof.lua",
	"design/themes/raycast.lua",
	"design/tokens.lua",
	"gui/fusion.lua",
	"gui/library-map.lua",
}

externalModuleFiles={}
for _,modulePath in ipairs(uiLibraryModulePaths) do
	externalModuleFiles[modulePath]=uiLibrarySource
end

moduleGlobalNames={
	CoreScope="CoreScope",
	CoreSignal="CoreSignal",
	CoreScheduler="CoreScheduler",
	CorePlayerCache="CorePlayerCache",
	CoreBallTracker="CoreBallTracker",
	StateStore="StateStore",
	DesignTokens="DesignTokens",
	DesignThemeResolver="DesignThemeResolver",
	DesignThemeRaycast="DesignThemeRaycast",
	DesignThemeEverforest="DesignThemeEverforest",
	DesignThemeProof="DesignThemeProof",
	DesignThemeLinear="DesignThemeLinear",
	DesignThemeMaterial="DesignThemeMaterial",
	DesignThemeAbsolutely="DesignThemeAbsolutely",
	GuiFusion="FusionModule",
	Dump="Dump",
}
startupModuleNames={
	"CoreScope","CoreSignal","CoreScheduler","CorePlayerCache","CoreBallTracker",
	"StateStore","DesignTokens","DesignThemeResolver","DesignThemeRaycast","DesignThemeEverforest","DesignThemeProof","DesignThemeLinear","DesignThemeMaterial","DesignThemeAbsolutely",
	"GuiFusion","GuiLogic","UILibraryMap",
	"DumpConnections","DumpLifecycle","DumpInput","DumpApiService","DumpModuleLoaderService","DumpPersistenceService","DumpUIAdapter","DumpUICreate","DumpSyntax","Dump",
	"UIMap","MainFrame","Description","Announcement",
	"HitboxLogic","Hitbox","ParamsLogic","Params","BoostLogic","Boost",
	"ESPDefenseLogic","ESPDefense","ESPOffenseLogic","ESPOffense","ESPLogic","ESP",
	"QBInterception","QBAimMath","QBAimLogic","QBAim","TestingLogic","Testing",
	"DataSave",
}
optionalModuleNames={"CorePlayerCache","CoreBallTracker"}
mapReloadNames={"MapEditorLogic","MapEditor","MaterialsLogic","Materials","MapCleanerLogic","MapCleaner","AdsLogic","Ads"}
serverReloadNames={"ArcLogic","Arc"}
customizeReloadNames={"ColorsLogic","Colors"}
pageTwoReloadNames={"HitboxPresetsLogic","HitboxPresets","KeybindsLogic","Keybinds","PresetEditorLogic","PresetEditor"}
settingsReloadNames={"PlayerDataLogic","PlayerData","ResetGuiLogic","ResetGui","DiscordController","DiscordView","DiscordLogic","Discord"}

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
			setLoadedModule(name,loadedModule)
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

moduleCache={}
moduleSources={}
bundledModuleFactories=rawget(getfenv(),"bootBundledModules")
if type(bundledModuleFactories)~="table" then
	bundledModuleFactories=nil
end
if type(runtimeSourcesFromLoader)=="table" then
	for path,source in pairs(runtimeSourcesFromLoader) do
		moduleSources[path]=source
	end
end
rebuildMainFromModules=nil
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

	return true,nil
end

function loadModuleFromSource(modulePath,source)
	local verified,verifyErr=verifyRemoteModuleSource(modulePath,source)
	if not verified then
		moduleSources[modulePath]=false
		return nil,verifyErr
	end

	local chunk,err=loadstring(source,"@"..modulePath)
	if not chunk then
		moduleSources[modulePath]=source
		return nil,err
	end

	if setfenv then
		setfenv(chunk,getfenv())
	end

	local loadedOk,loadedModule=xpcall(chunk,function(err)
		if debug and type(debug.traceback)=="function" then
			return debug.traceback(tostring(err),2)
		end

		return tostring(err)
	end)
	if not loadedOk then
		moduleSources[modulePath]=source
		return nil,loadedModule
	end

	moduleSources[modulePath]=source
	moduleCache[modulePath]=loadedModule
	return loadedModule,nil
end

function getExternalModuleSource(modulePath)
	return externalModuleFiles and externalModuleFiles[modulePath] or nil
end

function isExternalModulePath(modulePath)
	return getExternalModuleSource(modulePath)~=nil
end

function fetchExternalModule(modulePath)
	local source=getExternalModuleSource(modulePath)
	if not source then
		return nil,"not external"
	end

	local result=botApi.Post("/module/get",{
		path=modulePath,
		source=source.id or "ui-library",
	})
	if not(result and result.ok and type(result.source)=="string") then
		return nil,result and result.error or "external module missing"
	end

	return result.source,nil
end

function loadBundledModule(modulePath)
	local factory=bundledModuleFactories and bundledModuleFactories[modulePath]
	if type(factory)~="function" then
		return nil,"not bundled"
	end

	if setfenv then
		setfenv(factory,getfenv())
	end
	local ok,loadedModule=xpcall(factory,function(err)
		if debug and type(debug.traceback)=="function" then
			return debug.traceback(tostring(err),2)
		end
		return tostring(err)
	end)
	if not ok then
		return nil,loadedModule
	end

	moduleCache[modulePath]=loadedModule
	moduleSources[modulePath]="bundled"
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

	if bundledModuleFactories and bundledModuleFactories[modulePath] then
		local loadedModule,bundleError=loadBundledModule(modulePath)
		if loadedModule~=nil then
			return loadedModule
		end
		warn("bundled module broke while loading:",modulePath,bundleError)
	end

	local moduleSource=nil
	local loadError=nil

	if isExternalModulePath(modulePath) then
		moduleSource,loadError=fetchExternalModule(modulePath)
	else
		local result=botApi.Post("/module/get",{path=modulePath})
		if result and result.ok then
			moduleSource=result.source
		else
			loadError=result and result.error or "unknown"
		end
	end

	if type(moduleSource)~="string" then
		moduleSources[modulePath]=false
		if optionalModuleFileSet[modulePath] then
			warn("optional module missing:",modulePath,loadError or"unknown")
		else
			warn("module load failed:",modulePath,loadError or"unknown")
		end
		return nil
	end

	local loadedModule,err=loadModuleFromSource(modulePath,moduleSource)
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

	setLoaderProgress("loading files...",0.2,loaderStepTotal,false)

	local pendingPaths={}
	for _,modulePath in ipairs(paths) do
		if not moduleCache[modulePath] then
			table.insert(pendingPaths,modulePath)
		end
	end

	if #pendingPaths==0 then
		return true,nil
	end

	if bundledModuleFactories then
		local failed=0
		for index,modulePath in ipairs(pendingPaths) do
			local loadedModule=loadRemoteModule(modulePath)
			if loadedModule~=nil then
				setLoadedModuleByPath(modulePath,loadedModule)
			elseif not optionalModuleFileSet[modulePath] then
				failed=failed+1
			end
			if index%8==0 or index==#pendingPaths then
				setLoaderProgress("registering bundled modules",math.min(index,loaderStepTotal),loaderStepTotal,failed>0)
			end
		end
		return failed==0,failed>0 and "bundled module failed" or nil
	end

	local apiPaths={}
	local externalPaths={}
	for _,modulePath in ipairs(pendingPaths) do
		if isExternalModulePath(modulePath) then
			table.insert(externalPaths,modulePath)
		else
			table.insert(apiPaths,modulePath)
		end
	end

	local result={ok=true,modules={},errors={}}
	if #apiPaths>0 then
		result=botApi.Post("/module/batch",{paths=apiPaths})
		if not(result and result.ok and type(result.modules)=="table") then
			return false,result and result.error or "module batch missing"
		end
	end

	local externalResult={ok=true,modules={},errors={}}
	if #externalPaths>0 then
		externalResult=botApi.Post("/module/batch",{
			paths=externalPaths,
			source=uiLibrarySource.id or "ui-library",
		})
		if not(externalResult and externalResult.ok and type(externalResult.modules)=="table") then
			return false,externalResult and externalResult.error or "external module batch missing"
		end
	end

	local loaded=#paths-#pendingPaths
	local failed=0

	for index,modulePath in ipairs(pendingPaths) do
		local loadedModule=nil
		local err=nil
		local batchResult=isExternalModulePath(modulePath) and externalResult or result
		local item=batchResult.modules and batchResult.modules[modulePath]

		if item and type(item.source)=="string" then
			loadedModule,err=loadModuleFromSource(modulePath,item.source)
		else
			err=batchResult.errors and batchResult.errors[modulePath] or "batch module missing"
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

		if index%8==0 or index==#pendingPaths then
			local processed=(#paths-#pendingPaths)+index
			setLoaderProgress("module batch loaded ("..tostring(loaded).."/"..tostring(#paths)..")",math.min(processed,loaderStepTotal),loaderStepTotal,failed>0)
		end
	end

	return failed==0,nil
end

function loadUIMapForStructure()
	if not UILibraryMapModule then
		local ok,result=pcall(loadRemoteModule,modulePaths.UILibraryMap)
		if ok and type(result)=="table" then
			UILibraryMapModule=result
		end
	end

	if not UIMapModule then
		local ok,result=pcall(loadRemoteModule,modulePaths.UIMap)
		if ok and type(result)=="table" then
			UIMapModule=result
		end
	end
end

function callUIMap(method,...)
	if UIMapModule and type(UIMapModule[method])=="function" then
		local ok,result=pcall(UIMapModule[method],...)
		if ok and type(result)=="table" then
			return result
		end
	end

	return nil
end

function getUIMapLoaderGui()
	local result=callUIMap("GetLoaderGui")
	if result then
		return result
	end

	return UIMapModule and (UIMapModule.LoaderGui or UIMapModule.Loader or {}) or {}
end

function getUIMapMainBackgroundGui()
	local result=callUIMap("GetMainBackgroundGui")
	if result then
		return result
	end

	return UIMapModule and (UIMapModule.MainBackgroundGui or UIMapModule.MainBackground or {}) or {}
end

function getUIMapPages()
	local result=callUIMap("GetPages")
	if result then
		return result
	end

	if UIMapModule and UIMapModule.PageStructure and type(UIMapModule.PageStructure.Tabs)=="table" then
		return UIMapModule.PageStructure.Tabs
	end

	return UIMapModule and UIMapModule.Pages or nil
end

function getUIMapPageModules(pageId,legacyKey)
	local result=callUIMap("GetPageModules",pageId)
	if result then
		return result
	end

	local page=callUIMap("GetPage",pageId)
	if page and type(page.Modules)=="table" then
		return page.Modules
	end

	if UIMapModule and UIMapModule.PageStructure and UIMapModule.PageStructure.Pages then
		page=UIMapModule.PageStructure.Pages[tostring(pageId or "")]
		if page and type(page.Modules)=="table" then
			return page.Modules
		end
	end

	local legacy=UIMapModule and UIMapModule[legacyKey]
	return legacy and legacy.Modules or nil
end

function getUIMapPageCategories(pageId,legacyKey)
	local result=callUIMap("GetPageCategories",pageId)
	if result then
		return result
	end

	local legacy=UIMapModule and UIMapModule[legacyKey]
	return legacy and legacy.Sections or nil
end

loadUIMapForStructure()

do
	local background=getUIMapMainBackgroundGui()
	local shell=type(background.Shell)=="table" and background.Shell or {}
	local shellModule=type(shell.Module)=="string" and shell.Module or nil
	if shellModule and shellModule~="" and shellModule~=modulePaths.MainFrame then
		local oldPath=modulePaths.MainFrame
		modulePaths.MainFrame=shellModule
		allowedModuleFiles[shellModule]=true
		startupModuleFileSet[oldPath]=nil
		startupModuleFileSet[shellModule]=true
		deferredModuleFileSet[shellModule]=nil

		for index,path in ipairs(startupModuleFiles) do
			if path==oldPath then
				startupModuleFiles[index]=shellModule
			end
		end
	end
end

local runtimeBootConfig=rawget(getfenv(),"bootConfig")
if type(runtimeBootConfig)~="table" then runtimeBootConfig={} end
screenGuiName=tostring(runtimeBootConfig.ScreenGuiName or "DevGuiUI")
for _,existingName in ipairs({screenGuiName}) do
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

loaderGuiMap=getUIMapLoaderGui()
loaderText=type(loaderGuiMap.Text)=="table" and loaderGuiMap.Text or {}
loaderBoxConfig=type(loaderGuiMap.Box)=="table" and loaderGuiMap.Box or {}
loaderBoxW=tonumber(loaderBoxConfig.W) or 480
loaderBoxH=tonumber(loaderBoxConfig.H) or 320
loaderPageNames=type(loaderGuiMap.PreloadPages)=="table" and loaderGuiMap.PreloadPages or {"maps","customize","page2","settings","server"}
loaderStepTotal=#startupModuleFiles+#loaderPageNames+4

local loaderRaycast=devThemes.raycast.Theme
local loaderColors={
	bg=loaderRaycast.bg,
	topbar=loaderRaycast.topbar,
	panel=loaderRaycast.panel,
	text=loaderRaycast.text,
	muted=loaderRaycast.muted,
	stroke=loaderRaycast.stroke,
	accent=loaderRaycast.sliderFill,
	secondary=Color3.fromRGB(207,47,152),
	error=Color3.fromRGB(254,94,86),
}

loaderCurrent=0
loaderPhaseCurrent=#startupModuleFiles
loaderPhaseItems={}
loaderPhaseNames=type(loaderGuiMap.Phases)=="table" and loaderGuiMap.Phases or {"setup","modules","gui","ready"}
loaderOverlay=make("Frame",{
	Name="Loader",
	BackgroundColor3=loaderColors.bg,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	Size=UDim2.new(1,0,1,0),
	ZIndex=loaderLayer,
},screenGui)

loaderBackdropA=make("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,-112,0.5,-66),
	Size=UDim2.fromOffset(2,2),
	BackgroundColor3=loaderColors.accent,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=loaderLayer,
},loaderOverlay)
make("UICorner",{CornerRadius=UDim.new(0,0)},loaderBackdropA)

loaderBackdropB=make("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,128,0.5,82),
	Size=UDim2.fromOffset(2,2),
	BackgroundColor3=loaderColors.secondary,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=loaderLayer,
},loaderOverlay)
make("UICorner",{CornerRadius=UDim.new(0,0)},loaderBackdropB)

loaderBox=make("Frame",{
	AnchorPoint=Vector2.new(0.5,0.5),
	Position=UDim2.new(0.5,0,0.5,0),
	Size=UDim2.fromOffset(loaderBoxW,loaderBoxH),
	BackgroundColor3=loaderColors.bg,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=loaderLayer+1,
},loaderOverlay)

local loaderScale=0.92
if runtimePlatform=="mobile" then
	local camera=workspace.CurrentCamera
	local viewport=camera and camera.ViewportSize or Vector2.new(1920,1080)
	loaderScale=math.min(1,(viewport.X-16)/loaderBoxW,(viewport.Y-16)/loaderBoxH)
end
loaderBoxScale=make("UIScale",{Scale=math.max(0.72,loaderScale)},loaderBox)
loaderBoxStroke=make("UIStroke",{Color=loaderColors.stroke,Thickness=1,Transparency=1},loaderBox)
loaderBoxGradient=make("UIGradient",{
	Color=ColorSequence.new({
		ColorSequenceKeypoint.new(0,loaderColors.topbar),
		ColorSequenceKeypoint.new(1,loaderColors.bg),
	}),
	Rotation=90,
},loaderBox)
make("UIPadding",{PaddingTop=UDim.new(0,20),PaddingLeft=UDim.new(0,18),PaddingRight=UDim.new(0,18),PaddingBottom=UDim.new(0,20)},loaderBox)

loaderAccent=make("Frame",{
	BackgroundColor3=loaderColors.accent,
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
	BackgroundColor3=loaderColors.panel,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=loaderLayer+2,
},loaderBox)
make("UICorner",{CornerRadius=UDim.new(0,0)},loaderPercentPill)
loaderPercentPillStroke=make("UIStroke",{Color=loaderColors.stroke,Thickness=1,Transparency=1},loaderPercentPill)

local titleText=make("TextLabel",{
	BackgroundTransparency=1,
	Position=UDim2.fromOffset(0,16),
	Size=UDim2.new(1,-88,0,24),
	Text=tostring(loaderText.Title or "untitled gui"),
	Font=Enum.Font.GothamMedium,
	TextSize=16,
	TextColor3=loaderColors.text,
	TextTransparency=1,
	TextXAlignment=Enum.TextXAlignment.Left,
	ZIndex=loaderLayer+2,
},loaderBox)

local subtitleText=make("TextLabel",{
	BackgroundTransparency=1,
	Position=UDim2.fromOffset(0,42),
	Size=UDim2.new(1,-88,0,18),
	Text=tostring(loaderText.Subtitle or "loading files and gui"),
	Font=Enum.Font.Gotham,
	TextSize=11,
	TextColor3=loaderColors.muted,
	TextTransparency=1,
	TextXAlignment=Enum.TextXAlignment.Left,
	ZIndex=loaderLayer+2,
},loaderBox)

loaderStatus=make("TextLabel",{
	BackgroundTransparency=1,
	Position=UDim2.fromOffset(0,84),
	Size=UDim2.new(1,0,0,46),
	Text=tostring(loaderText.InitialStatus or "loading modules..."),
	Font=Enum.Font.Gotham,
	TextSize=12,
	TextColor3=loaderColors.muted,
	TextTransparency=1,
	TextWrapped=true,
	TextXAlignment=Enum.TextXAlignment.Left,
	ZIndex=loaderLayer+2,
},loaderBox)

loaderTrack=make("Frame",{
	Position=UDim2.fromOffset(0,148),
	Size=UDim2.new(1,0,0,12),
	BackgroundColor3=loaderColors.panel,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ClipsDescendants=true,
	ZIndex=loaderLayer+2,
},loaderBox)
make("UICorner",{CornerRadius=UDim.new(0,0)},loaderTrack)

loaderTrackStroke=make("UIStroke",{Color=loaderColors.stroke,Thickness=1,Transparency=1},loaderTrack)

loaderFill=make("Frame",{
	Size=UDim2.new(0,0,1,0),
	BackgroundColor3=loaderColors.accent,
	BackgroundTransparency=1,
	BorderSizePixel=0,
	ZIndex=loaderLayer+3,
},loaderTrack)
make("UICorner",{CornerRadius=UDim.new(0,0)},loaderFill)

loaderFillGlow=make("Frame",{
	Size=UDim2.new(0,0,1,0),
	BackgroundColor3=loaderColors.accent,
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
	Size=UDim2.fromOffset(loaderBoxW,loaderBoxH),
	BackgroundColor3=loaderColors.accent,
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
	TextColor3=loaderColors.text,
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

local phaseGap=8
local phaseWidth=math.max(54,math.floor((loaderBoxW-36-(phaseGap*3))/4))
for index,name in ipairs(loaderPhaseNames) do
	local item=make("Frame",{
		BackgroundColor3=loaderColors.panel,
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
		BackgroundColor3=loaderColors.muted,
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
		TextColor3=loaderColors.muted,
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
	local activeColor=isProblem and loaderColors.error or loaderColors.accent

	for index,item in ipairs(loaderPhaseItems) do
		local completed=index<activeIndex
		local active=index==activeIndex
		local itemBg=active and activeColor or loaderColors.panel
		local dotBg=(completed or active) and activeColor or loaderColors.muted
		local textColor=(completed or active) and loaderColors.text or loaderColors.muted
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
	loaderStatus.TextColor3=isProblem and loaderColors.error or loaderColors.muted
	loaderPercent.Text=math.floor(pct*100+0.5).."%"
	loaderFill.BackgroundColor3=isProblem and loaderColors.error or loaderColors.accent
	loaderFillGlow.BackgroundColor3=isProblem and loaderColors.error or loaderColors.accent
	if loaderPercentPillStroke then
		TweenService:Create(loaderPercentPillStroke,TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Color=isProblem and loaderColors.error or loaderColors.stroke,Transparency=isProblem and 0.08 or 0.35}):Play()
	end
	TweenService:Create(loaderFill,TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(pct,0,1,0)}):Play()
	TweenService:Create(loaderFillGlow,TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(pct,0,1,0)}):Play()
	setLoaderPhase(loaderPhaseFromStatus(text,current,total),isProblem)

	if loaderAccent then
		loaderAccent.BackgroundColor3=isProblem and loaderColors.error or loaderColors.accent
	end

	if loaderPulse then
		loaderPulse.BackgroundColor3=isProblem and loaderColors.error or loaderColors.accent
		loaderPulse.BackgroundTransparency=0.95
		loaderPulse.Size=UDim2.fromOffset(loaderBoxW,loaderBoxH)
		TweenService:Create(loaderPulse,TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
			BackgroundTransparency=1,
			Size=UDim2.fromOffset(loaderBoxW+60,loaderBoxH+54),
		}):Play()
	end

	if isProblem and loaderBoxStroke then
		TweenService:Create(loaderBoxStroke,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Color=loaderColors.error,Transparency=0}):Play()
	else
		TweenService:Create(loaderBoxStroke,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Color=loaderColors.stroke,Transparency=0}):Play()
	end
end

function finishLoader()
	if not loaderOverlay or not loaderOverlay.Parent then return end

	titleText.Text=tostring(loaderText.ReadyTitle or "ready")
	subtitleText.Text=tostring(loaderText.ReadySubtitle or "")
	setLoaderProgress(tostring(loaderText.ReadyStatus or "all loaded"),loaderStepTotal,loaderStepTotal,false)

	loaderAlive=false
	if mainFrame and type(mainFrame.RevealFromLoader)=="function" then
		mainFrame.RevealFromLoader()
	end
	local tweenInfo=TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
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

	task.delay(0.2,function()
		if loaderOverlay then
			loaderOverlay:Destroy()
			loaderOverlay=nil
		end
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
		warn("module missing:",name,path)
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
			local function run(elapsed,dt)
				fn(elapsed,dt)
			end

			local handle
			if kind=="RenderStepped" then
				if interval>0 and scheduler.everyRender then
					handle=scheduler:everyRender(key,interval,run)
				else
					handle=scheduler:onRender(key,0,run)
				end
			else
				if interval>0 and scheduler.every then
					handle=scheduler:every(key,interval,run)
				else
					handle=scheduler:onHeartbeat(key,0,run)
				end
			end

			handles[key]={handle=handle}
			return true
		end

		function jobRunner.SetEnabled(kind,id,enabled)
			local entry=handles[schedulerKey(kind,id)]
			if entry and entry.handle and entry.handle.setEnabled then
				entry.handle:setEnabled(enabled)
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
			raycast=DesignThemeRaycast,
			everforest=DesignThemeEverforest,
			proof=DesignThemeProof,
			linear=DesignThemeLinear,
			material=DesignThemeMaterial,
			absolutely=DesignThemeAbsolutely
		}
	}

	function themeRuntime.Resolve(id,overrides)
		local theme=themeRuntime.Themes and themeRuntime.Themes[tostring(id or "raycast"):lower()]
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

local styleColorDefaults={Stroke={255,99,99},Gradient={207,47,152},Primary={16,16,16}}

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

function getDefaultUILibProfile()
	if UIMapModule and type(UIMapModule.GetDefaultProfile)=="function" then
		return UIMapModule.GetDefaultProfile()
	end

	return UIMapModule and UIMapModule.Profiles and UIMapModule.Profiles.raycast or devThemes.raycast
end

function getDefaultUILibId()
	return tostring(UIMapModule and UIMapModule.DefaultProfileId or "raycast")
end

function getUILibRuntimeStyle(id)
	if UIMapModule and type(UIMapModule.GetProfile)=="function" then
		return UIMapModule.GetProfile(id)
	end

	return getDefaultUILibProfile()
end

function getCurrentUILibProfile()
	return getUILibRuntimeStyle(style and style.UILib or getDefaultUILibId())
end

function getDefaultUIStyle()
	if UIMapModule and type(UIMapModule.GetDefaultStyle)=="function" then
		return UIMapModule.GetDefaultStyle()
	end

	local defaults=getDefaultUILibProfile().Defaults or {}
	local result={}

	for k,v in pairs(defaults) do
		result[k]=v
	end

	result.UILib=tostring(result.UILib or "raycast")
	return result
end

function getDefaultUIWindow()
	if UIMapModule and type(UIMapModule.GetDefaultWindow)=="function" then
		return UIMapModule.GetDefaultWindow()
	end

	local profile=getDefaultUILibProfile()
	local window=profile.mainFrame and profile.mainFrame.Window or {}
	local result={}

	for k,v in pairs(window) do
		result[k]=v
	end

	return result
end

function applyDefaultUIStyleFields(targetStyle,force)
	targetStyle=targetStyle or style
	local defaults=getDefaultUIStyle()

	for k,v in pairs(defaults) do
		if force or targetStyle[k]==nil then
			targetStyle[k]=v
		end
	end

	targetStyle.UILib=getDefaultUILibId()

	return targetStyle
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

	local libId=tostring(style.UILib or "raycast"):lower()
	local libStyle=getUILibRuntimeStyle(libId)
	local libTheme=libStyle and libStyle.Theme or {}

	if style.UseThemePalette~=false then
		for role,color in pairs(libTheme) do
			colors[role]=color
		end
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

local function isFixedLoaderThemeInstance(instance)
	return loaderOverlay and (instance==loaderOverlay or instance:IsDescendantOf(loaderOverlay))
end

function applyUIPrimaryTheme()
	refreshThemePalette()

	if not screenGui then return end

	for _,instance in ipairs(screenGui:GetDescendants()) do
		if not isFixedLoaderThemeInstance(instance) then
			if instance:IsA("GuiObject") then
				local role=instance:GetAttribute("ThemeRole")
				if role and colors[role] then
					instance.BackgroundColor3=colors[role]
				end
			end

			if instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
				local skipTextRole=instance:GetAttribute("SkipTextRole")
				local textRole=instance:GetAttribute("ThemeTextRole")
				if not textRole and not skipTextRole then
					textRole="TEXT"
					instance:SetAttribute("ThemeTextRole",textRole)
				end
				if textRole and colors[textRole] and not skipTextRole then
					instance.TextColor3=colors[textRole]
				end
			end
		end
	end
end

liquidStrokeConn=nil
mainFrame=nil
applyUIStrokeTheme=nil

function destroyKnownGuiResidue()
	local guiNames={screenGuiName or "DevGuiUI"}
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
		DevGuiClonedCenter=true,
		DevGuiPreviewC1Marker=true,
		DevGuiPreviewC3InfoAnchor=true,
		DevGuiTestingC1Marker=true,
		DevGuiTestingC1GroundMarker=true,
		DevGuiQBAimTargetHighlight=true,
		DevGuiESPHighlight=true,
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

function cleanupForManualReload(skipResidueScan)
	if type(getgenv)=="function" then
		local envOk,env=pcall(getgenv)
		if envOk and type(env)=="table" then
			env.DEV_GUI_RUNTIME_CLEANUP=nil
		end
	end

	if DataSaveAPI and type(DataSaveAPI.SaveNow)=="function" then
		pcall(DataSaveAPI.SaveNow)
	end

	toolAlive=false
	if DataSaveAPI and type(DataSaveAPI.Destroy)=="function" then
		pcall(function()
			DataSaveAPI.Destroy()
		end)
	end
	DataSaveAPI=nil

	if mainPageApis then
		for key,api in pairs(mainPageApis) do
			if api and type(api.Destroy)=="function" then
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
			"ColorsAPI",
			"MapEditorAPI",
			"MaterialsAPI",
			"MapCleanerAPI",
			"AdsAPI",
			"PlayerDataAPI",
			"ResetGuiAPI",
			"DiscordAPI",
			"ArcAPI",
		})
	end

	if AnnouncementAPI and type(AnnouncementAPI.Destroy)=="function" then
		pcall(function()
			AnnouncementAPI.Destroy()
		end)
	end

	if mainFrame and type(mainFrame.Destroy)=="function" then
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

	if not skipResidueScan then
		destroyKnownGuiResidue()
	end
end

if type(getgenv)=="function" then
	local envOk,env=pcall(getgenv)
	if envOk and type(env)=="table" then
		env.DEV_GUI_RUNTIME_CLEANUP=function()
			cleanupForManualReload()
		end
	end
end

function refreshRemoteModulesNow()
	local result=botApi.Post("/module/get",{
		path=manualReloadPath,
		fresh=true,
	})
	if not result or not result.ok or type(result.source)~="string" then
		warn("update failed:",result and result.error or "unknown")
		return false
	end

	local verified,verifyErr=verifyRemoteModuleSource(manualReloadPath,result.source)
	if not verified then
		warn("update blocked:",verifyErr)
		return false
	end

	local chunk,err=loadstring(result.source,"@"..manualReloadPath)
	if not chunk then
		warn("update compile failed:",err)
		return false
	end

	warn("reloading gui")
	cleanupForManualReload()
	task.defer(function()
		local bootConfig=nil
		local previousDevelopment=nil
		if type(getgenv)=="function" then
			local envOk,env=pcall(getgenv)
			if envOk and type(env)=="table" then
				bootConfig=rawget(env,"DEV_GUI_BOOT_CONFIG")
				if type(bootConfig)~="table" then
					bootConfig={}
					env.DEV_GUI_BOOT_CONFIG=bootConfig
				end
				previousDevelopment=bootConfig.Development
				bootConfig.Development=true
				env.DEV_GUI_BUNDLE_CACHE=nil
			end
		end
		local ok,reloadErr=pcall(chunk)
		if bootConfig then bootConfig.Development=previousDevelopment end
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
	local globalName=tostring(runtimeBootConfig.RefreshGlobalName or "devGuiRefreshModules")
	_G[globalName]=refresh

	if type(getgenv)=="function" then
		local ok,env=pcall(getgenv)
		if ok and type(env)=="table" then
			env[globalName]=refresh
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
		elseif instance:IsDescendantOf(screenGui) and not isFixedLoaderThemeInstance(instance) then
			local strokeParent=instance.Parent
			if strokeParent and strokeParent:GetAttribute("NoStroke")==true then
				instance.Transparency=1
				pcall(function() instance.Enabled=false end)
			else
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

GuiLogicModule=requireGuiModule("GuiLogic",modulePaths.GuiLogic,GuiLogicModule)
MainFrameModule=requireGuiModule("MainFrame",modulePaths.MainFrame,MainFrameModule)
