local dataSave={}

local httpService=game:GetService("HttpService")

local defaultStyleValues={
	PrimaryR=16,
	PrimaryG=16,
	PrimaryB=16,
	StrokeR=255,
	StrokeG=99,
	StrokeB=99,
	GradientR=207,
	GradientG=47,
	GradientB=152,
	StrokeGradient=false,
	LiquidStroke=false,
	LiquidStrokeSpeed=1,
	LiquidStrokeDirection="Right",
	StrokeThickness=1,
	StrokeTransparency=0.84,
	CornerRadius=0,
	UILib="raycast",
	ThemePanelExpanded=false,
	ColoursPanelExpanded=false,
	HighlightPanelExpanded=false,
	HighlightSelectedMode="espOffense",
	HighlightSelectedState="open",
	ESPOffenseCustomColor=false,
	ESPDefenseCustomColor=false,
	QBAimHighlightCustomColor=false,
	ESPOffenseOpenCustomColor=false,
	ESPOffenseClosedCustomColor=false,
	ESPDefenseHolderCustomColor=false,
	ESPDefenseOpenCustomColor=false,
	ESPDefenseClosedCustomColor=false,
	ESPOffenseFillR=32,
	ESPOffenseFillG=202,
	ESPOffenseFillB=106,
	ESPOffenseOutlineR=32,
	ESPOffenseOutlineG=202,
	ESPOffenseOutlineB=106,
	ESPOffenseFillTransparency=0.5,
	ESPOffenseOutlineTransparency=0,
	ESPOffenseOpenFillR=32,
	ESPOffenseOpenFillG=202,
	ESPOffenseOpenFillB=106,
	ESPOffenseOpenOutlineR=32,
	ESPOffenseOpenOutlineG=202,
	ESPOffenseOpenOutlineB=106,
	ESPOffenseOpenFillTransparency=0.5,
	ESPOffenseOpenOutlineTransparency=0,
	ESPOffenseClosedFillR=254,
	ESPOffenseClosedFillG=94,
	ESPOffenseClosedFillB=86,
	ESPOffenseClosedOutlineR=254,
	ESPOffenseClosedOutlineG=94,
	ESPOffenseClosedOutlineB=86,
	ESPOffenseClosedFillTransparency=0.5,
	ESPOffenseClosedOutlineTransparency=0,
	ESPDefenseFillR=32,
	ESPDefenseFillG=202,
	ESPDefenseFillB=106,
	ESPDefenseOutlineR=32,
	ESPDefenseOutlineG=202,
	ESPDefenseOutlineB=106,
	ESPDefenseFillTransparency=0.5,
	ESPDefenseOutlineTransparency=0,
	ESPDefenseHolderFillR=21,
	ESPDefenseHolderFillG=103,
	ESPDefenseHolderFillB=251,
	ESPDefenseHolderOutlineR=21,
	ESPDefenseHolderOutlineG=103,
	ESPDefenseHolderOutlineB=251,
	ESPDefenseHolderFillTransparency=0.45,
	ESPDefenseHolderOutlineTransparency=0,
	ESPDefenseOpenFillR=32,
	ESPDefenseOpenFillG=202,
	ESPDefenseOpenFillB=106,
	ESPDefenseOpenOutlineR=32,
	ESPDefenseOpenOutlineG=202,
	ESPDefenseOpenOutlineB=106,
	ESPDefenseOpenFillTransparency=0.5,
	ESPDefenseOpenOutlineTransparency=0,
	ESPDefenseClosedFillR=254,
	ESPDefenseClosedFillG=94,
	ESPDefenseClosedFillB=86,
	ESPDefenseClosedOutlineR=254,
	ESPDefenseClosedOutlineG=94,
	ESPDefenseClosedOutlineB=86,
	ESPDefenseClosedFillTransparency=0.5,
	ESPDefenseClosedOutlineTransparency=0,
	QBAimHighlightFillR=21,
	QBAimHighlightFillG=103,
	QBAimHighlightFillB=251,
	QBAimHighlightOutlineR=32,
	QBAimHighlightOutlineG=202,
	QBAimHighlightOutlineB=106,
	QBAimHighlightFillTransparency=0.65,
	QBAimHighlightOutlineTransparency=0,
}

local validThemes={raycast=true,everforest=true,proof=true,linear=true,material=true,absolutely=true}

local function themeId(value)
	local id=tostring(value or ""):lower()
	if id=="catppuccin" then id="everforest" end
	if id=="dracula" then id="proof" end
	return validThemes[id] and id or "raycast"
end

local themeColorFields={"PrimaryR","PrimaryG","PrimaryB","StrokeR","StrokeG","StrokeB","GradientR","GradientG","GradientB"}
local oldThemeColors={
	raycast={17,17,20,255,90,163,124,92,255},
	catppuccin={30,30,46,203,166,247,137,180,250},
	everforest={253,246,227,141,161,1,53,167,124},
	dracula={40,42,54,189,147,249,255,121,198},
	linear={16,16,20,94,106,210,138,143,152},
	material={18,18,18,3,218,198,187,134,252},
	absolutely={9,9,12,168,85,247,236,72,153},
}

local function migrateThemeColors(style,rawId,themes)
	local raw=tostring(rawId or ""):lower()
	local id=themeId(raw)
	local old=oldThemeColors[raw] or oldThemeColors[id]
	local defaults=themes and themes[id] and themes[id].Defaults
	if not old or not defaults then return id end

	for i,field in ipairs(themeColorFields) do
		if tonumber(style[field])~=old[i] then return id end
	end

	for _,field in ipairs(themeColorFields) do
		style[field]=defaults[field]
	end
	return id
end

local styleNumberFields={
	{"primaryR","PrimaryR",0,255,16},
	{"primaryG","PrimaryG",0,255,16},
	{"primaryB","PrimaryB",0,255,16},
	{"strokeR","StrokeR",0,255,255},
	{"strokeG","StrokeG",0,255,99},
	{"strokeB","StrokeB",0,255,99},
	{"gradientR","GradientR",0,255,207},
	{"gradientG","GradientG",0,255,47},
	{"gradientB","GradientB",0,255,152},
	{"liquidStrokeSpeed","LiquidStrokeSpeed",0,2,1},
	{"strokeThickness","StrokeThickness",0,8,1},
	{"strokeTransparency","StrokeTransparency",0,1,0.55},
	{"espOffenseFillR","ESPOffenseFillR",0,255,32},
	{"espOffenseFillG","ESPOffenseFillG",0,255,202},
	{"espOffenseFillB","ESPOffenseFillB",0,255,106},
	{"espOffenseOutlineR","ESPOffenseOutlineR",0,255,32},
	{"espOffenseOutlineG","ESPOffenseOutlineG",0,255,202},
	{"espOffenseOutlineB","ESPOffenseOutlineB",0,255,106},
	{"espOffenseFillTransparency","ESPOffenseFillTransparency",0,1,0.5},
	{"espOffenseOutlineTransparency","ESPOffenseOutlineTransparency",0,1,0},
	{"espOffenseOpenFillR","ESPOffenseOpenFillR",0,255,32},
	{"espOffenseOpenFillG","ESPOffenseOpenFillG",0,255,202},
	{"espOffenseOpenFillB","ESPOffenseOpenFillB",0,255,106},
	{"espOffenseOpenOutlineR","ESPOffenseOpenOutlineR",0,255,32},
	{"espOffenseOpenOutlineG","ESPOffenseOpenOutlineG",0,255,202},
	{"espOffenseOpenOutlineB","ESPOffenseOpenOutlineB",0,255,106},
	{"espOffenseOpenFillTransparency","ESPOffenseOpenFillTransparency",0,1,0.5},
	{"espOffenseOpenOutlineTransparency","ESPOffenseOpenOutlineTransparency",0,1,0},
	{"espOffenseClosedFillR","ESPOffenseClosedFillR",0,255,254},
	{"espOffenseClosedFillG","ESPOffenseClosedFillG",0,255,94},
	{"espOffenseClosedFillB","ESPOffenseClosedFillB",0,255,86},
	{"espOffenseClosedOutlineR","ESPOffenseClosedOutlineR",0,255,254},
	{"espOffenseClosedOutlineG","ESPOffenseClosedOutlineG",0,255,94},
	{"espOffenseClosedOutlineB","ESPOffenseClosedOutlineB",0,255,86},
	{"espOffenseClosedFillTransparency","ESPOffenseClosedFillTransparency",0,1,0.5},
	{"espOffenseClosedOutlineTransparency","ESPOffenseClosedOutlineTransparency",0,1,0},
	{"espDefenseFillR","ESPDefenseFillR",0,255,32},
	{"espDefenseFillG","ESPDefenseFillG",0,255,202},
	{"espDefenseFillB","ESPDefenseFillB",0,255,106},
	{"espDefenseOutlineR","ESPDefenseOutlineR",0,255,32},
	{"espDefenseOutlineG","ESPDefenseOutlineG",0,255,202},
	{"espDefenseOutlineB","ESPDefenseOutlineB",0,255,106},
	{"espDefenseFillTransparency","ESPDefenseFillTransparency",0,1,0.5},
	{"espDefenseOutlineTransparency","ESPDefenseOutlineTransparency",0,1,0},
	{"espDefenseHolderFillR","ESPDefenseHolderFillR",0,255,21},
	{"espDefenseHolderFillG","ESPDefenseHolderFillG",0,255,103},
	{"espDefenseHolderFillB","ESPDefenseHolderFillB",0,255,251},
	{"espDefenseHolderOutlineR","ESPDefenseHolderOutlineR",0,255,21},
	{"espDefenseHolderOutlineG","ESPDefenseHolderOutlineG",0,255,103},
	{"espDefenseHolderOutlineB","ESPDefenseHolderOutlineB",0,255,251},
	{"espDefenseHolderFillTransparency","ESPDefenseHolderFillTransparency",0,1,0.45},
	{"espDefenseHolderOutlineTransparency","ESPDefenseHolderOutlineTransparency",0,1,0},
	{"espDefenseOpenFillR","ESPDefenseOpenFillR",0,255,32},
	{"espDefenseOpenFillG","ESPDefenseOpenFillG",0,255,202},
	{"espDefenseOpenFillB","ESPDefenseOpenFillB",0,255,106},
	{"espDefenseOpenOutlineR","ESPDefenseOpenOutlineR",0,255,32},
	{"espDefenseOpenOutlineG","ESPDefenseOpenOutlineG",0,255,202},
	{"espDefenseOpenOutlineB","ESPDefenseOpenOutlineB",0,255,106},
	{"espDefenseOpenFillTransparency","ESPDefenseOpenFillTransparency",0,1,0.5},
	{"espDefenseOpenOutlineTransparency","ESPDefenseOpenOutlineTransparency",0,1,0},
	{"espDefenseClosedFillR","ESPDefenseClosedFillR",0,255,254},
	{"espDefenseClosedFillG","ESPDefenseClosedFillG",0,255,94},
	{"espDefenseClosedFillB","ESPDefenseClosedFillB",0,255,86},
	{"espDefenseClosedOutlineR","ESPDefenseClosedOutlineR",0,255,254},
	{"espDefenseClosedOutlineG","ESPDefenseClosedOutlineG",0,255,94},
	{"espDefenseClosedOutlineB","ESPDefenseClosedOutlineB",0,255,86},
	{"espDefenseClosedFillTransparency","ESPDefenseClosedFillTransparency",0,1,0.5},
	{"espDefenseClosedOutlineTransparency","ESPDefenseClosedOutlineTransparency",0,1,0},
	{"qbAimHighlightFillR","QBAimHighlightFillR",0,255,21},
	{"qbAimHighlightFillG","QBAimHighlightFillG",0,255,103},
	{"qbAimHighlightFillB","QBAimHighlightFillB",0,255,251},
	{"qbAimHighlightOutlineR","QBAimHighlightOutlineR",0,255,32},
	{"qbAimHighlightOutlineG","QBAimHighlightOutlineG",0,255,202},
	{"qbAimHighlightOutlineB","QBAimHighlightOutlineB",0,255,106},
	{"qbAimHighlightFillTransparency","QBAimHighlightFillTransparency",0,1,0.65},
	{"qbAimHighlightOutlineTransparency","QBAimHighlightOutlineTransparency",0,1,0},
}

local styleBoolFields={
	{"strokeGradient","StrokeGradient"},
	{"liquidStroke","LiquidStroke"},
	{"espOffenseCustomColor","ESPOffenseCustomColor"},
	{"espDefenseCustomColor","ESPDefenseCustomColor"},
	{"qbAimHighlightCustomColor","QBAimHighlightCustomColor"},
	{"espOffenseOpenCustomColor","ESPOffenseOpenCustomColor"},
	{"espOffenseClosedCustomColor","ESPOffenseClosedCustomColor"},
	{"espDefenseHolderCustomColor","ESPDefenseHolderCustomColor"},
	{"espDefenseOpenCustomColor","ESPDefenseOpenCustomColor"},
	{"espDefenseClosedCustomColor","ESPDefenseClosedCustomColor"},
}

local refreshHookNames={
	"RefreshAll",
	"applyUIStrokeTheme",
	"refreshSettingsUI",
	"refreshActualSettingsUI",
	"refreshSpeedUI",
	"refreshHitboxReadout",
	"refreshPage2UI",
	"updateResponsiveLayout",
}

local rootVersion=3

local function cloneRoot()
	return{
		version=rootVersion,
		modes={},
	}
end

local function trim(s)
	return tostring(s or ""):gsub("^%s*(.-)%s*$","%1")
end

local function clampNumber(value,min,max,fallback)
	local n=tonumber(value)
	if not n then return fallback end
	return math.clamp(n,min,max)
end

local function getDefaultUIStyle(app)
	if app and type(app.getDefaultUIStyle)=="function" then
		local ok,result=pcall(app.getDefaultUIStyle)
		if ok and type(result)=="table" then
			local copy={}
			for key,value in pairs(result) do
				copy[key]=value
			end

			copy.UILib=tostring(copy.UILib or defaultStyleValues.UILib)
			return copy
		end
	end

	local copy={}
	for key,value in pairs(defaultStyleValues) do
		copy[key]=value
	end

	return copy
end

local function clampStaminaDeplete(value)
	local n=tonumber(value)
	if not n then return 10 end
	return math.clamp(math.floor(math.abs(n)+0.5),0,50)
end

local function isEnumItem(v)
	return typeof and typeof(v)=="EnumItem"
end

local function encodeBinding(binding)
	if binding==nil or binding==Enum.KeyCode.Unknown then
		return{type="Nil",name="NIL"}
	end

	if type(binding)=="string" then
		return{type="UserInputType",name=binding}
	end

	if isEnumItem(binding) then
		local raw=tostring(binding)

		if raw:find("Enum.KeyCode.",1,true) then
			return{
				type="KeyCode",
				name=raw:gsub("Enum.KeyCode%.",""),
			}
		end

		if raw:find("Enum.UserInputType.",1,true) then
			return{
				type="UserInputType",
				name=raw:gsub("Enum.UserInputType%.",""),
			}
		end
	end

	return{type="Nil",name="NIL"}
end

local function decodeBinding(binding)
	if binding==nil then
		return Enum.KeyCode.Unknown
	end

	if binding==Enum.KeyCode.Unknown then
		return Enum.KeyCode.Unknown
	end

	if isEnumItem(binding) then
		return binding
	end

	if type(binding)=="string" then
		if binding=="NIL" then
			return Enum.KeyCode.Unknown
		end

		binding=binding:gsub("^Enum%.UserInputType%.","")
		binding=binding:gsub("^Enum%.KeyCode%.","")

		if binding=="MouseButton1" or binding=="MouseButton2" or binding=="MouseButton3" then
			return binding
		end

		local ok,key=pcall(function()
			return Enum.KeyCode[binding]
		end)

		if ok and key then
			return key
		end

		return Enum.KeyCode.Unknown
	end

	if type(binding)~="table" then
		return Enum.KeyCode.Unknown
	end

	local rawType=tostring(binding.type or binding.Type or "Nil")
	local rawName=tostring(binding.name or binding.Name or "NIL")

	if rawType=="KeyCode" then
		local ok,key=pcall(function()
			return Enum.KeyCode[rawName]
		end)

		if ok and key then
			return key
		end
	end

	if rawType=="UserInputType" then
		if rawName=="MouseButton1" or rawName=="MouseButton2" or rawName=="MouseButton3" then
			return rawName
		end

		return Enum.KeyCode.Unknown
	end

	return Enum.KeyCode.Unknown
end

local function encodePresetEditor(presetEditor)
	if type(presetEditor)~="table" then return {} end

	local output={}

	for i=1,4 do
		local item=presetEditor[i] or {}

		output[i]={
			x=clampNumber(item.x or item.X,0.1,50,1),
			y=clampNumber(item.y or item.Y,0.1,50,1),
			z=clampNumber(item.z or item.Z,0.1,50,1),
			key=encodeBinding(decodeBinding(item.key or item.Key or item.binding or item.Binding)),
		}
	end

	return output
end

local function dropMapSettings(root)
	for _,settings in pairs(root.modes or {}) do
		if type(settings)=="table" then
			settings.workspace=nil
			settings.Workspace=nil
		end
	end
	return root
end

local function cloneSettings(value)
	if type(value)~="table" then return value end

	local copy={}
	for key,item in pairs(value) do
		copy[key]=cloneSettings(item)
	end
	return copy
end

local function normalizeRoot(raw)
	if type(raw)~="table" then
		return cloneRoot()
	end

	if type(raw.modes)=="table" then
		if (tonumber(raw.version) or 2)<rootVersion and type(raw.modes.mode1)=="table" then
			for _,modeKey in ipairs({"mode2","mode3"}) do
				if type(raw.modes[modeKey])~="table" then
					raw.modes[modeKey]=cloneSettings(raw.modes.mode1)
				end
			end
		end
		raw.version=rootVersion
		return dropMapSettings(raw)
	end

	local legacy=cloneSettings(raw)
	return dropMapSettings({
		version=rootVersion,
		modes={
			mode1=cloneSettings(legacy),
			mode2=cloneSettings(legacy),
			mode3=cloneSettings(legacy),
		},
	})
end

local function getValue(app,name,default)
	local state=app.State or app.state

	if state and state[name]~=nil then
		return state[name]
	end

	if app[name]~=nil then
		return app[name]
	end

	if app.Get then
		local ok,value=pcall(app.Get,name,default)
		if ok and value~=nil then
			return value
		end
	end

	return default
end

local function hasAnyKey(t)
	if type(t)~="table" then return false end
	for _ in pairs(t) do
		return true
	end
	return false
end

local function setValue(app,name,value)
	local state=app.State or app.state

	if app.Set then
		local ok=pcall(app.Set,name,value)
		if ok then return end
	end

	if app.Setters and app.Setters[name] then
		local ok=pcall(app.Setters[name],value)
		if ok then return end
	end

	if state then
		state[name]=value
	end

	app[name]=value
end

local function applyValue(app,setterName,stateName,value)
	local setter=app[setterName]
	if setter then
		local ok=pcall(setter,value)
		if ok then return end
	end

	setValue(app,stateName,value)
end

local function applyBoolean(app,setterName,stateName,value)
	if value~=nil then
		applyValue(app,setterName,stateName,value and true or false)
	end
end

local function applyClamped(app,setterName,stateName,value,min,max,fallback,clampFn)
	if value~=nil then
		applyValue(app,setterName,stateName,(clampFn or clampNumber)(value,min,max,fallback))
	end
end

local function setBoolean(app,stateName,value)
	if value~=nil then
		setValue(app,stateName,value and true or false)
	end
end

local function setClamped(app,stateName,value,min,max,fallback)
	if value~=nil then
		setValue(app,stateName,clampNumber(value,min,max,fallback))
	end
end

local function getModeKey(app)
	if type(app.getCurrentModeKey)=="function" then
		local ok,modeKey=pcall(app.getCurrentModeKey)
		if ok and modeKey then
			return tostring(modeKey)
		end
	end

	return tostring(getValue(app,"CURRENT_MODE_KEY",app.currentModeKey or "mode1"))
end

local function getPlayerId(app)
	if app.playerId then return tostring(app.playerId) end
	if app.me and app.me.UserId then return tostring(app.me.UserId) end

	local lp=game:GetService("Players").LocalPlayer
	return lp and tostring(lp.UserId) or ""
end

local function collectPresetEditor(app)
	local output={}
	local presets=app.hitboxPresets or {}

	for i=1,4 do
		local p=presets[i] or {}
		local size=p.size or Vector3.new(1,1,1)

		output[i]={
			x=size.X,
			y=size.Y,
			z=size.Z,
			key=encodeBinding(p.key),
		}
	end

	return output
end

local function collectUIStylePayload(uiStyle,defaultUIStyle)
	local payload={}

	for _,field in ipairs(styleNumberFields) do
		payload[field[1]]=uiStyle[field[2]]
	end

	for _,field in ipairs(styleBoolFields) do
		payload[field[1]]=uiStyle[field[2]] and true or false
	end

	payload.liquidStrokeDirection=uiStyle.LiquidStrokeDirection
	payload.cornerRadius=0
	payload.uiLib=themeId(uiStyle.UILib or defaultUIStyle.UILib)
	payload.themePanelExpanded=uiStyle.ThemePanelExpanded and true or false
	payload.coloursPanelExpanded=uiStyle.ColoursPanelExpanded and true or false
	payload.highlightPanelExpanded=uiStyle.HighlightPanelExpanded and true or false
	payload.highlightSelectedMode=tostring(uiStyle.HighlightSelectedMode or defaultUIStyle.HighlightSelectedMode or "espOffense")
	payload.highlightSelectedState=tostring(uiStyle.HighlightSelectedState or defaultUIStyle.HighlightSelectedState or "open")

	return payload
end

local function applyPresetEditor(app,presetEditor)
	if type(presetEditor)~="table" then return end

	local presets=app.hitboxPresets or {}

	for i=1,4 do
		local item=presetEditor[i] or {}
		local current=presets[i]

		if current then
			local oldSize=current.size or Vector3.new(1,1,1)
			local x=clampNumber(item.x or item.X,0.1,50,oldSize.X)
			local y=clampNumber(item.y or item.Y,0.1,50,oldSize.Y)
			local z=clampNumber(item.z or item.Z,0.1,50,oldSize.Z)

			current.size=Vector3.new(x,y,z)
			current.key=decodeBinding(item.key or item.Key or item.binding or item.Binding)
		end
	end
end

local function normalizePreset(preset)
	if type(preset)~="table" then return nil end

	local code=tostring(preset.Code or preset.code or "")
	if code=="" then return nil end

	local name=tostring(preset.Name or preset.name or "Unnamed")
	local editor=preset.presetEditor or preset.PresetEditor

	if not editor then
		local data=preset.Data or preset.data or {}
		editor=data.presetEditor or data.PresetEditor or {}
	end

	local normalizedEditor={}

	for i=1,4 do
		local item=editor[i] or {}

		normalizedEditor[i]={
			x=clampNumber(item.x or item.X,0.1,50,1),
			y=clampNumber(item.y or item.Y,0.1,50,1),
			z=clampNumber(item.z or item.Z,0.1,50,1),
			key=decodeBinding(item.key or item.Key or item.binding or item.Binding),
		}
	end

	return{
		Code=code,
		Name=name,
		Data={
			presetEditor=normalizedEditor,
		},
		CreatedAt=preset.createdAt or preset.CreatedAt,
		UpdatedAt=preset.updatedAt or preset.UpdatedAt,
		OwnerPlayerId=preset.ownerPlayerId or preset.OwnerPlayerId,
	}
end

local function clearArray(t)
	if type(t)~="table" then return end
	table.clear(t)
end

local function makeLocalCode(name)
	local base=string.upper(string.sub(string.gsub(tostring(name or ""),"[^%w]",""),1,3))
	if base=="" then base="GUI" end
	return base..tostring(math.random(100,999))
end

function dataSave.new(app)
	app=app or {}

	local api={}
	local root=normalizeRoot(app.playerSettingsRoot)
	local loading=false
	local autosaveQueued=false
	local autosaveDelay=app.autosaveDelay or 1.25
	local autosaveLastPayload=nil
	local autosaveInFlightPayload=nil
	local autosaveToken=0
	local destroyed=false
	local defaultSettings=nil

	local function isAlive()
		if destroyed then
			return false
		end

		if type(app.isToolAlive)=="function" then
			local ok,result=pcall(app.isToolAlive)
			return ok and result~=false
		end

		return app.toolAlive~=false
	end

	function api.IsLoading()
		return loading
	end

	function api.SetLoading(value)
		loading=value and true or false
		app.playerSettingsLoading=loading
	end

	function api.GetRoot()
		root=normalizeRoot(root)
		app.playerSettingsRoot=root
		return root
	end

	function api.SetRoot(nextRoot)
		root=normalizeRoot(nextRoot)
		app.playerSettingsRoot=root
		return root
	end

	function api.GetSavedSettingsForCurrentMode()
		local r=api.GetRoot()
		return r.modes[getModeKey(app)] or defaultSettings or {}
	end

	function api.BuildRootForSave(currentSettings)
		local r=api.GetRoot()
		local modeKey=getModeKey(app)

		r.version=rootVersion
		r.lastMode=modeKey
		r.updatedAt=os.time()
		r.modes[modeKey]=currentSettings

		app.playerSettingsRoot=r
		return r
	end

	function api.Collect()
		if app.collectPlayerSettingsForApi then
			local ok,result=pcall(app.collectPlayerSettingsForApi)
			if ok and type(result)=="table" then
				return result
			end
		end

		local rootFrame=app.root
		local pos=rootFrame and rootFrame.Position or UDim2.new(0.5,0,0,80)

		local uiStyle=app.style or {}
		local defaultUIStyle=getDefaultUIStyle(app)
		local uiWindow=app.windowState or {}

		return{
			version=1,
			mode=getModeKey(app),

			hitbox={
				x=getValue(app,"sizeX",2.52),
				y=getValue(app,"sizeY",5.4),
				z=getValue(app,"sizeZ",1.41),
				transparency=getValue(app,"targetTransparency",0.7),
				enabled=getValue(app,"hitboxOn",false),
			},

			gravity=getValue(app,"gravityValue",196.2),
			gravityEnabled=getValue(app,"gravityEnabled",false),

			speed={
				enabled=getValue(app,"speedEnabled",false),
				value=getValue(app,"speedValue",18),
			},

			gameParams={
				enabled=getValue(app,"gameParamsEnabled",true),
				selectedPage=getValue(app,"paramsSelectedPage","speed"),
				speedEnabled=getValue(app,"speedParamsEnabled",false),
				gravityJumpEnabled=getValue(app,"gravityJumpParamsEnabled",false),
				staminaEnabled=getValue(app,"staminaParamsEnabled",false),
				speedSettingEnabled=getValue(app,"speedSettingEnabled",false),
				diveSettingEnabled=getValue(app,"diveSettingEnabled",false),
				gravitySettingEnabled=getValue(app,"gravitySettingEnabled",false),
				jumpPowerSettingEnabled=getValue(app,"jumpPowerSettingEnabled",false),
				staminaRegenSettingEnabled=getValue(app,"staminaRegenSettingEnabled",false),
				staminaDepleteSettingEnabled=getValue(app,"staminaDepleteSettingEnabled",false),
				staminaRegen=getValue(app,"staminaRegenValue",10),
				staminaDeplete=getValue(app,"staminaDepleteValue",10),
				jumpPower=getValue(app,"jumpPowerValue",53.5),
				divePower=getValue(app,"divePowerValue",1.9),
			},

			boost={
				enabled=getValue(app,"jumpBoostOn",false),
				always=getValue(app,"jumpBoostTradeMode",false),
				bypassCooldown=getValue(app,"boostBypassCooldown",false),
				forceY=getValue(app,"boostForceY",32),
				cooldown=getValue(app,"boostCooldown",5),
				chance=getValue(app,"boostChance",100),
				radius=getValue(app,"ballDetectionRadius",10),
			},

			jpv={
				pull=getValue(app,"jpvPullValue",1),
				maxDistance=getValue(app,"jpvMaxDistance",10),
			},

			stickyHead={
				range=getValue(app,"stickyHeadRange",10),
				smoothness=getValue(app,"stickyHeadSmoothness",12),
				strength=getValue(app,"stickyHeadStrength",12),
			},

			esp={
				enabled=getValue(app,"actionStatusOn",false),
			},

			qbAim={
				enabled=getValue(app,"qbAimEnabled",false),
				teamFilter=getValue(app,"qbAimTeamFilter",true),
				showArc=getValue(app,"qbAimShowArc",true),
				targetHighlight=getValue(app,"qbAimTargetHighlight",true),
				leadDelay=getValue(app,"qbAimLeadDelay",0.38),
				peakHeight=getValue(app,"qbAimPeakHeight",14.2),
				throwDelay=getValue(app,"qbAimThrowDelay",0.1),
			},

			testing={
				enabled=getValue(app,"testingEnabled",false),
				wr=getValue(app,"testingWREnabled",true),
				qb=getValue(app,"testingQBEnabled",true),
			},

			keybinds={
				toggleUI=encodeBinding(getValue(app,"uiToggleKey",Enum.KeyCode.Unknown)),
				toggleHitbox=encodeBinding(getValue(app,"hitboxToggleKey",Enum.KeyCode.Unknown)),
				toggleJumpBoost=encodeBinding(getValue(app,"boostToggleKey",Enum.KeyCode.Unknown)),
				toggleAlwaysBoost=encodeBinding(getValue(app,"alwaysBoostToggleKey",Enum.KeyCode.Unknown)),
				toggleESP=encodeBinding(getValue(app,"espToggleKey",Enum.KeyCode.Unknown)),
				toggleActionStatus=encodeBinding(getValue(app,"espToggleKey",Enum.KeyCode.Unknown)),
				qbAimLock=encodeBinding(getValue(app,"qbAimLockKey",Enum.KeyCode.H)),
				qbAimThrow=encodeBinding(getValue(app,"qbAimThrowKey",Enum.KeyCode.T)),
				qbAimToggle=encodeBinding(getValue(app,"qbAimToggleKey",Enum.KeyCode.P)),
				autoSTToggle=encodeBinding(getValue(app,"autoSTKey",Enum.KeyCode.V)),
				jpvToggle=encodeBinding(getValue(app,"jpvKey",Enum.KeyCode.Unknown)),
				stickyHeadToggle=encodeBinding(getValue(app,"stickyHeadKey",Enum.KeyCode.Unknown)),
			},

			presetEditor=collectPresetEditor(app),
			uiStyle=collectUIStylePayload(uiStyle,defaultUIStyle),

			window={
				w=uiWindow.W,
				h=uiWindow.H,
				posXScale=pos.X.Scale,
				posXOffset=pos.X.Offset,
				posYScale=pos.Y.Scale,
				posYOffset=pos.Y.Offset,
			},
		}
	end

	defaultSettings=api.Collect()

	function api.Apply(settings)
		if app.applySavedPlayerSettings then
			local ok=pcall(app.applySavedPlayerSettings,settings)
			if ok then return end
		end

		if type(settings)~="table" then
			settings={}
		end

		api.SetLoading(true)

		if app.applyCurrentModeLocalDefaults then
			pcall(app.applyCurrentModeLocalDefaults)
		end

		local hitbox=settings.hitbox or {}
		local hx=clampNumber(hitbox.x or hitbox.X,0.1,50,getValue(app,"sizeX",2.52))
		local hy=clampNumber(hitbox.y or hitbox.Y,0.1,50,getValue(app,"sizeY",5.4))
		local hz=clampNumber(hitbox.z or hitbox.Z,0.1,50,getValue(app,"sizeZ",1.41))

		if app.setHitboxSize then
			pcall(app.setHitboxSize,hx,hy,hz)
		else
			setValue(app,"sizeX",hx)
			setValue(app,"sizeY",hy)
			setValue(app,"sizeZ",hz)
		end

		applyClamped(app,"setTransparency","targetTransparency",hitbox.transparency,0,1,getValue(app,"targetTransparency",0.7))
		applyBoolean(app,"setHitboxLock","hitboxOn",hitbox.enabled)
		applyClamped(app,"setGravity","gravityValue",settings.gravity,0,1000,196.2)
		applyBoolean(app,"setGravityState","gravityEnabled",settings.gravityEnabled)

		local speed=settings.speed or {}
		applyClamped(app,"setSpeedValue","speedValue",speed.value,0,100,18)
		applyBoolean(app,"setSpeedState","speedEnabled",speed.enabled)

		local gameParams=settings.gameParams or {}
		if gameParams.selectedPage~=nil then
			applyValue(app,"setParamsSelectedPage","paramsSelectedPage",gameParams.selectedPage)
		end
		local legacyGameParamsEnabled=gameParams.enabled
		local speedParamsEnabled=gameParams.speedEnabled
		local gravityJumpParamsEnabled=gameParams.gravityJumpEnabled
		local staminaParamsEnabled=gameParams.staminaEnabled
		if speedParamsEnabled==nil then speedParamsEnabled=legacyGameParamsEnabled end
		if gravityJumpParamsEnabled==nil then gravityJumpParamsEnabled=legacyGameParamsEnabled end
		if staminaParamsEnabled==nil then staminaParamsEnabled=legacyGameParamsEnabled end
		applyBoolean(app,"setSpeedParamsState","speedParamsEnabled",speedParamsEnabled)
		applyBoolean(app,"setGravityJumpParamsState","gravityJumpParamsEnabled",gravityJumpParamsEnabled)
		applyBoolean(app,"setStaminaParamsState","staminaParamsEnabled",staminaParamsEnabled)
		local diveSettingEnabled=gameParams.diveEnabled
		if diveSettingEnabled==nil then diveSettingEnabled=gameParams.diveSettingEnabled end
		local jumpPowerSettingEnabled=gameParams.jumpPowerEnabled
		if jumpPowerSettingEnabled==nil then jumpPowerSettingEnabled=gameParams.jumpPowerSettingEnabled end
		local staminaRegenSettingEnabled=gameParams.staminaRegenEnabled
		if staminaRegenSettingEnabled==nil then staminaRegenSettingEnabled=gameParams.staminaRegenSettingEnabled end
		local staminaDepleteSettingEnabled=gameParams.staminaDepleteEnabled
		if staminaDepleteSettingEnabled==nil then staminaDepleteSettingEnabled=gameParams.staminaDepleteSettingEnabled end
		applyBoolean(app,"setSpeedSettingState","speedSettingEnabled",gameParams.speedSettingEnabled)
		applyBoolean(app,"setDiveSettingState","diveSettingEnabled",diveSettingEnabled)
		applyBoolean(app,"setGravitySettingState","gravitySettingEnabled",gameParams.gravitySettingEnabled)
		applyBoolean(app,"setJumpPowerSettingState","jumpPowerSettingEnabled",jumpPowerSettingEnabled)
		applyBoolean(app,"setStaminaRegenSettingState","staminaRegenSettingEnabled",staminaRegenSettingEnabled)
		applyBoolean(app,"setStaminaDepleteSettingState","staminaDepleteSettingEnabled",staminaDepleteSettingEnabled)
		if legacyGameParamsEnabled~=nil or speedParamsEnabled~=nil or gravityJumpParamsEnabled~=nil or staminaParamsEnabled~=nil then
			applyBoolean(app,"setGameParamsState","gameParamsEnabled",true)
		end
		applyClamped(app,"setStaminaRegenValue","staminaRegenValue",gameParams.staminaRegen,0,50,10)
		applyClamped(app,"setStaminaDepleteValue","staminaDepleteValue",gameParams.staminaDeplete,0,50,10,clampStaminaDeplete)
		applyClamped(app,"setJumpPowerValue","jumpPowerValue",gameParams.jumpPower,0,300,53.5)
		applyClamped(app,"setDivePowerValue","divePowerValue",gameParams.divePower,0,15,1.9)

		local boost=settings.boost or {}
		applyBoolean(app,"setJumpBoostState","jumpBoostOn",boost.enabled)
		setBoolean(app,"jumpBoostTradeMode",boost.always)
		applyBoolean(app,"setBoostBypassCooldown","boostBypassCooldown",boost.bypassCooldown)
		setClamped(app,"boostForceY",boost.forceY,10,100,32)
		setClamped(app,"boostCooldown",boost.cooldown,0,60,5)
		setClamped(app,"boostChance",boost.chance,0,100,100)
		setClamped(app,"ballDetectionRadius",boost.radius,1,50,10)

		local jpv=settings.jpv or {}
		applyClamped(app,"setJPVPullValue","jpvPullValue",jpv.pull,0.01,2,1)
		applyClamped(app,"setJPVMaxDistance","jpvMaxDistance",jpv.maxDistance,1,50,10)

		local stickyHead=settings.stickyHead or {}
		applyClamped(app,"setStickyHeadRange","stickyHeadRange",stickyHead.range,1,50,10)
		applyClamped(app,"setStickyHeadSmoothness","stickyHeadSmoothness",stickyHead.smoothness,1,100,12)
		applyClamped(app,"setStickyHeadStrength","stickyHeadStrength",stickyHead.strength,1,100,12)

		local esp=settings.esp or {}
		applyBoolean(app,"setESPState","actionStatusOn",esp.enabled)

		local qbAim=settings.qbAim or {}
		applyBoolean(app,"setQBAimState","qbAimEnabled",qbAim.enabled)
		applyBoolean(app,"setQBAimTeamFilter","qbAimTeamFilter",qbAim.teamFilter)
		applyBoolean(app,"setQBAimShowArc","qbAimShowArc",qbAim.showArc)
		applyBoolean(app,"setQBAimTargetHighlight","qbAimTargetHighlight",qbAim.targetHighlight)
		applyClamped(app,"setQBAimLeadDelay","qbAimLeadDelay",qbAim.leadDelay,0,1.5,0.38)
		applyClamped(app,"setQBAimPeakHeight","qbAimPeakHeight",qbAim.peakHeight,8,20,14.2)
		applyClamped(app,"setQBAimThrowDelay","qbAimThrowDelay",qbAim.throwDelay,0,0.5,0.1)

		local testing=settings.testing or {}
		applyBoolean(app,"setTestingState","testingEnabled",testing.enabled)
		applyBoolean(app,"setTestingWRState","testingWREnabled",testing.wr)
		applyBoolean(app,"setTestingQBState","testingQBEnabled",testing.qb)

		local keybinds=settings.keybinds or {}
		local keyMap={
			toggleUI="uiToggleKey",
			toggleHitbox="hitboxToggleKey",
			toggleJumpBoost="boostToggleKey",
			toggleAlwaysBoost="alwaysBoostToggleKey",
			qbAimLock="qbAimLockKey",
			qbAimThrow="qbAimThrowKey",
			qbAimToggle="qbAimToggleKey",
			autoSTToggle="autoSTKey",
			jpvToggle="jpvKey",
			stickyHeadToggle="stickyHeadKey",
		}

		for savedName,stateName in pairs(keyMap) do
			if keybinds[savedName]~=nil then
				setValue(app,stateName,decodeBinding(keybinds[savedName]))
			end
		end
		if keybinds.toggleESP~=nil then
			setValue(app,"espToggleKey",decodeBinding(keybinds.toggleESP))
		elseif keybinds.toggleActionStatus~=nil then
			setValue(app,"espToggleKey",decodeBinding(keybinds.toggleActionStatus))
		end

		applyPresetEditor(app,settings.presetEditor or settings.PresetEditor)

		local uiStyle=type(settings.uiStyle)=="table" and settings.uiStyle or {}
		local hasSavedUIStyle=hasAnyKey(uiStyle)

		local defaultUIStyle=getDefaultUIStyle(app)
		if app.style then
			for key,value in pairs(defaultUIStyle) do
				if not hasSavedUIStyle or app.style[key]==nil then
					app.style[key]=value
				end
			end

			for _,field in ipairs(styleNumberFields) do
				local savedKey,styleKey,min,max,fallback=field[1],field[2],field[3],field[4],field[5]
				if uiStyle[savedKey]~=nil then
					app.style[styleKey]=clampNumber(uiStyle[savedKey],min,max,app.style[styleKey] or fallback)
				end
			end

			for _,field in ipairs(styleBoolFields) do
				if uiStyle[field[1]]~=nil then
					app.style[field[2]]=uiStyle[field[1]] and true or false
				end
			end

			if uiStyle.liquidStrokeDirection~=nil then app.style.LiquidStrokeDirection=tostring(uiStyle.liquidStrokeDirection) end
			local themeExpanded=uiStyle.themePanelExpanded
			if themeExpanded==nil then themeExpanded=uiStyle.ThemePanelExpanded end
			if themeExpanded~=nil then app.style.ThemePanelExpanded=themeExpanded and true or false end

			local coloursExpanded=uiStyle.coloursPanelExpanded
			if coloursExpanded==nil then coloursExpanded=uiStyle.ColorsPanelExpanded end
			if coloursExpanded==nil then coloursExpanded=uiStyle.ColoursPanelExpanded end
			if coloursExpanded~=nil then app.style.ColoursPanelExpanded=coloursExpanded and true or false end

			local highlightExpanded=uiStyle.highlightPanelExpanded
			if highlightExpanded==nil then highlightExpanded=uiStyle.HighlightPanelExpanded end
			if highlightExpanded~=nil then app.style.HighlightPanelExpanded=highlightExpanded and true or false end

			if uiStyle.highlightSelectedMode~=nil then
				app.style.HighlightSelectedMode=tostring(uiStyle.highlightSelectedMode)
			elseif uiStyle.HighlightSelectedMode~=nil then
				app.style.HighlightSelectedMode=tostring(uiStyle.HighlightSelectedMode)
			end

			if uiStyle.highlightSelectedState~=nil then
				app.style.HighlightSelectedState=tostring(uiStyle.highlightSelectedState)
			elseif uiStyle.HighlightSelectedState~=nil then
				app.style.HighlightSelectedState=tostring(uiStyle.HighlightSelectedState)
			end

			local savedTheme=uiStyle.uiLib or uiStyle.UILib or defaultUIStyle.UILib
			app.style.UILib=migrateThemeColors(app.style,savedTheme,app.themes)
			app.style.CornerRadius=0
		end

		local window=settings.window or {}
		if app.windowState then
			if window.w~=nil then app.windowState.W=clampNumber(window.w,app.windowState.MinW or 560,app.windowState.MaxW or 1220,app.windowState.W or 880) end
			if window.h~=nil then app.windowState.H=clampNumber(window.h,app.windowState.MinH or 360,app.windowState.MaxH or 820,app.windowState.H or 540) end
		end

		if app.root and window.posXScale~=nil then
			app.root.Position=UDim2.new(
				tonumber(window.posXScale) or app.root.Position.X.Scale,
				tonumber(window.posXOffset) or app.root.Position.X.Offset,
				tonumber(window.posYScale) or app.root.Position.Y.Scale,
				tonumber(window.posYOffset) or app.root.Position.Y.Offset
			)
		end

		api.SetLoading(false)

		for _,hookName in ipairs(refreshHookNames) do
			if app[hookName] then
				pcall(app[hookName])
			end
		end
	end

	function api.SaveNow()
		if loading or app.playerSettingsLoading then return false,"loading" end
		if not isAlive() then return false,"tool not alive" end
		if not app.botApi or not app.botApi.Post then return false,"bot api missing" end

		local currentSettings=api.Collect()
		local settingsRoot=api.BuildRootForSave(currentSettings)

		local ok,encoded=pcall(function()
			return httpService:JSONEncode(settingsRoot)
		end)
		local payloadKey=ok and encoded or nil

		if payloadKey and (payloadKey==autosaveLastPayload or payloadKey==autosaveInFlightPayload) then
			return true,"unchanged"
		end

		autosaveInFlightPayload=payloadKey

		task.spawn(function()
			local response=app.botApi.Post("/player/save",{
				playerId=getPlayerId(app),
				settings=settingsRoot,
			})

			if not response or not response.ok then
				warn("settings save failed:",response and response.error or "unknown")
			elseif payloadKey then
				autosaveLastPayload=payloadKey
			end

			if autosaveInFlightPayload==payloadKey then
				autosaveInFlightPayload=nil
			end
		end)

		return true,"queued"
	end

	function api.Schedule()
		if loading or app.playerSettingsLoading then return end
		if not isAlive() then return end
		if autosaveQueued then return end

		autosaveQueued=true
		autosaveToken=autosaveToken+1
		local token=autosaveToken

		task.delay(autosaveDelay,function()
			if destroyed or token~=autosaveToken then
				return
			end
			autosaveQueued=false
			api.SaveNow()
		end)
	end

	function api.Destroy()
		if destroyed then return end
		destroyed=true
		autosaveToken=autosaveToken+1
		autosaveQueued=false
	end

	function api.SetPresetSize(index,x,y,z,skipSave)
		local presets=app.hitboxPresets or {}
		local i=tonumber(index)
		local preset=i and presets[i]

		if not preset then
			return false,"missing preset"
		end

		local oldSize=preset.size or Vector3.new(1,1,1)
		local nx=clampNumber(x,0.1,50,oldSize.X)
		local ny=clampNumber(y,0.1,50,oldSize.Y)
		local nz=clampNumber(z,0.1,50,oldSize.Z)

		preset.size=Vector3.new(nx,ny,nz)

		if skipSave~=true then
			api.Schedule()
		end

		return true,preset.size
	end

	function api.SetPresetKey(index,binding,skipSave)
		local presets=app.hitboxPresets or {}
		local i=tonumber(index)
		local preset=i and presets[i]

		if not preset then
			return false,"missing preset"
		end

		preset.key=decodeBinding(binding)

		if skipSave~=true then
			api.Schedule()
		end

		return true,preset.key
	end

	function api.ResetPreset(index,skipSave)
		local presets=app.hitboxPresets or {}
		local defaults=app.defaultHitboxPresets or {}
		local i=tonumber(index)
		local preset=i and presets[i]
		local default=i and defaults[i]

		if not preset or not default then
			return false,"missing preset"
		end

		preset.key=default.key or Enum.KeyCode.Unknown
		preset.size=default.size or Vector3.new(1,1,1)

		if skipSave~=true then
			api.Schedule()
		end

		return true,preset
	end

	function api.ResetPresetEditor(skipSave)
		for i=1,4 do
			api.ResetPreset(i,true)
		end

		if skipSave~=true then
			api.Schedule()
		end

		if app.refreshPage2UI then pcall(app.refreshPage2UI) end
		return true
	end

	function api.ApplyPresetEditor(presetEditor,skipSave)
		applyPresetEditor(app,presetEditor)

		if skipSave~=true then
			api.Schedule()
		end

		if app.refreshPage2UI then pcall(app.refreshPage2UI) end
		return true
	end

	function api.CreateOwnedPreset(name,presetEditor)
		local cleanName=trim(name)
		if cleanName=="" then
			return false,"name missing"
		end

		local editorForApi=encodePresetEditor(presetEditor or collectPresetEditor(app))
		local preset=nil

		if app.botApi and app.botApi.Post then
			local response=app.botApi.Post("/preset/create",{
				playerId=getPlayerId(app),
				name=cleanName,
				presetEditor=editorForApi,
			})

			if not response or not response.ok then
				return false,response and response.error or "save failed"
			end

			preset=normalizePreset(response.preset or {
				code=response.code,
				name=cleanName,
				presetEditor=editorForApi,
			})
		else
			preset=normalizePreset({
				code=makeLocalCode(cleanName),
				name=cleanName,
				presetEditor=editorForApi,
			})
		end

		if not preset then
			return false,"preset save broke"
		end

		if app.savedPresets then
			table.insert(app.savedPresets,preset)
		end

		if app.refreshPage2UI then pcall(app.refreshPage2UI) end
		if app.rebuildOwnedList then pcall(app.rebuildOwnedList) end

		return true,preset
	end

	function api.ImportOwnedPreset(code)
		local cleanCode=trim(code)
		if cleanCode=="" then
			return false,"paste a preset code"
		end

		if not(app.botApi and app.botApi.Post) then
			return false,"preset import needs bot"
		end

		local response=app.botApi.Post("/preset/load",{
			playerId=getPlayerId(app),
			code=cleanCode,
		})

		if not response or not response.ok then
			return false,response and response.error or "import failed"
		end

		if response.presets and type(response.presets)=="table" and app.savedPresets then
			clearArray(app.savedPresets)

			for _,rawPreset in ipairs(response.presets) do
				local normalized=normalizePreset(rawPreset)
				if normalized then
					table.insert(app.savedPresets,normalized)
				end
			end
		else
			local preset=normalizePreset(response.preset or response.Preset or response)
			if not preset then
				return false,"preset data broke"
			end

			if app.savedPresets then
				local replaced=false
				for index,owned in ipairs(app.savedPresets) do
					if tostring(owned.Code or owned.code or "")==tostring(preset.Code or preset.code or "") then
						app.savedPresets[index]=preset
						replaced=true
						break
					end
				end

				if not replaced then
					table.insert(app.savedPresets,preset)
				end
			end

			if app.expandedOwned then
				app.expandedOwned[tostring(preset.Code or preset.code or cleanCode)]=true
			end
		end

		if app.refreshPage2UI then pcall(app.refreshPage2UI) end
		if app.rebuildOwnedList then pcall(app.rebuildOwnedList) end

		return true,response
	end

	function api.EquipOwnedPreset(preset)
		local normalized=normalizePreset(preset)
		if not normalized then
			return false,"bad preset"
		end

		api.ApplyPresetEditor(normalized.Data.presetEditor,true)

		if app.botApi and app.botApi.Post then
			task.spawn(function()
				local response=app.botApi.Post("/preset/equip",{
					playerId=getPlayerId(app),
					code=normalized.Code,
				})

				if not response or not response.ok then
					warn("preset equip failed:",response and response.error or "unknown")
				end
			end)
		end

		api.Schedule()
		if app.refreshPage2UI then pcall(app.refreshPage2UI) end

		return true,normalized
	end

	function api.DeleteOwnedPreset(code,index)
		local response=nil
		local usedApi=false

		if app.botApi and app.botApi.Post then
			usedApi=true
			response=app.botApi.Post("/preset/delete",{
				playerId=getPlayerId(app),
				code=code,
			})
		end

		if response and response.ok and type(response.presets)=="table" and app.savedPresets then
			clearArray(app.savedPresets)

			for _,rawPreset in ipairs(response.presets) do
				local normalized=normalizePreset(rawPreset)
				if normalized then
					table.insert(app.savedPresets,normalized)
				end
			end
		elseif usedApi then
			warn("preset delete failed:",response and response.error or "unknown")
			return false,response and response.error or "delete failed"
		elseif app.savedPresets then
			local removed=false

			for i=#app.savedPresets,1,-1 do
				local preset=app.savedPresets[i]
				if tostring(preset.Code or preset.code or "")==tostring(code or "") then
					table.remove(app.savedPresets,i)
					removed=true
				end
			end

			if not removed and index and app.savedPresets[index] then
				table.remove(app.savedPresets,index)
			end
		end

		if app.expandedOwned then
			app.expandedOwned[tostring(code or "")]=nil
		end

		if app.refreshPage2UI then pcall(app.refreshPage2UI) end
		if app.rebuildOwnedList then pcall(app.rebuildOwnedList) end

		return true
	end

	function api.Load()
		if not app.botApi or not app.botApi.Post then
			api.Apply(api.GetSavedSettingsForCurrentMode())
			return false,"bot api missing"
		end

		local response=app.botApi.Post("/player/load",{
			playerId=getPlayerId(app),
		})

		if not response or not response.ok then
			warn("settings load failed:",response and response.error or "unknown")
			api.Apply(api.GetSavedSettingsForCurrentMode())
			return false,response and response.error or "unknown"
		end

		api.SetRoot(response.settings or {})
		api.Apply(api.GetSavedSettingsForCurrentMode())

		return true,response
	end

	function api.SetMode(modeKey,applyNow)
		if modeKey then
			setValue(app,"CURRENT_MODE_KEY",tostring(modeKey))
		end

		if applyNow~=false then
			api.Apply(api.GetSavedSettingsForCurrentMode())
		end
	end

	function api.LoadOwnedPresets()
		if not app.botApi or not app.botApi.Post then
			return false,"bot api missing"
		end

		local response=app.botApi.Post("/preset/list-owned",{
			playerId=getPlayerId(app),
		})

		if not response or not response.ok then
			warn("presets load failed:",response and response.error or "unknown")
			return false,response and response.error or "unknown"
		end

		if app.savedPresets then
			clearArray(app.savedPresets)

			for _,preset in ipairs(response.presets or {}) do
				local normalized=normalizePreset(preset)
				if normalized then
					table.insert(app.savedPresets,normalized)
				end
			end
		end

		if app.rebuildOwnedList then pcall(app.rebuildOwnedList) end
		if app.refreshPage2UI then pcall(app.refreshPage2UI) end

		return true,response
	end

	api.EncodeBinding=encodeBinding
	api.DecodeBinding=decodeBinding
	api.EncodePresetEditor=encodePresetEditor
	api.NormalizeRoot=normalizeRoot
	api.NormalizePreset=normalizePreset
	api.CollectPresetEditor=function()
		return collectPresetEditor(app)
	end

	app.dataSave=api
	app.requestPlayerAutosave=function()
		api.Schedule()
	end

	return api
end

return dataSave
