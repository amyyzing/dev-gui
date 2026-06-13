local DataSave={}

local HttpService=game:GetService("HttpService")

local FALLBACK_UI_STYLE={
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
	ThemePanelExpanded=false,
	ColoursPanelExpanded=false,
}

local UI_STYLE_NUMBER_FIELDS={
	{"primaryR","PrimaryR",0,255,28},
	{"primaryG","PrimaryG",0,255,28},
	{"primaryB","PrimaryB",0,255,28},
	{"strokeR","StrokeR",0,255,255},
	{"strokeG","StrokeG",0,255,255},
	{"strokeB","StrokeB",0,255,255},
	{"gradientR","GradientR",0,255,255},
	{"gradientG","GradientG",0,255,255},
	{"gradientB","GradientB",0,255,255},
	{"liquidStrokeSpeed","LiquidStrokeSpeed",0,2,1},
	{"strokeThickness","StrokeThickness",0,8,1},
	{"strokeTransparency","StrokeTransparency",0,1,0.55},
}

local UI_STYLE_BOOL_FIELDS={
	{"strokeGradient","StrokeGradient"},
	{"liquidStroke","LiquidStroke"},
}

local APPLY_REFRESH_HOOKS={
	"RefreshAll",
	"applyUIStrokeTheme",
	"refreshSettingsUI",
	"refreshActualSettingsUI",
	"refreshSpeedUI",
	"refreshHitboxReadout",
	"refreshPage2UI",
	"updateResponsiveLayout",
}

local function cloneRoot()
	return{
		version=2,
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

local function getDefaultUIStyle(ctx)
	if ctx and type(ctx.getDefaultUIStyle)=="function" then
		local ok,result=pcall(ctx.getDefaultUIStyle)
		if ok and type(result)=="table" then
			local copy={}
			for key,value in pairs(result) do
				copy[key]=value
			end

			copy.UILib=tostring(copy.UILib or FALLBACK_UI_STYLE.UILib)
			return copy
		end
	end

	local copy={}
	for key,value in pairs(FALLBACK_UI_STYLE) do
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

local function normalizeRoot(raw)
	if type(raw)~="table" then
		return cloneRoot()
	end

	if type(raw.modes)=="table" then
		raw.version=raw.version or 2
		return raw
	end

	return{
		version=2,
		modes={
			mode1=raw,
		},
	}
end

local function getValue(ctx,name,default)
	local state=ctx.State or ctx.state

	if state and state[name]~=nil then
		return state[name]
	end

	if ctx[name]~=nil then
		return ctx[name]
	end

	if ctx.Get then
		local ok,value=pcall(ctx.Get,name,default)
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

local function setValue(ctx,name,value)
	local state=ctx.State or ctx.state

	if ctx.Set then
		local ok=pcall(ctx.Set,name,value)
		if ok then return end
	end

	if ctx.Setters and ctx.Setters[name] then
		local ok=pcall(ctx.Setters[name],value)
		if ok then return end
	end

	if state then
		state[name]=value
	end

	ctx[name]=value
end

local function applyValue(ctx,setterName,stateName,value)
	local setter=ctx[setterName]
	if setter then
		local ok=pcall(setter,value)
		if ok then return end
	end

	setValue(ctx,stateName,value)
end

local function applyBoolean(ctx,setterName,stateName,value)
	if value~=nil then
		applyValue(ctx,setterName,stateName,value and true or false)
	end
end

local function applyClamped(ctx,setterName,stateName,value,min,max,fallback,clampFn)
	if value~=nil then
		applyValue(ctx,setterName,stateName,(clampFn or clampNumber)(value,min,max,fallback))
	end
end

local function setBoolean(ctx,stateName,value)
	if value~=nil then
		setValue(ctx,stateName,value and true or false)
	end
end

local function setClamped(ctx,stateName,value,min,max,fallback)
	if value~=nil then
		setValue(ctx,stateName,clampNumber(value,min,max,fallback))
	end
end

local function getModeKey(ctx)
	return tostring(getValue(ctx,"CURRENT_MODE_KEY",ctx.CURRENT_MODE_KEY or "mode1"))
end

local function getPlayerId(ctx)
	if ctx.playerId then return tostring(ctx.playerId) end
	if ctx.me and ctx.me.UserId then return tostring(ctx.me.UserId) end

	local lp=game:GetService("Players").LocalPlayer
	return lp and tostring(lp.UserId) or ""
end

local function collectPresetEditor(ctx)
	local output={}
	local presets=ctx.PRESETS or {}

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

	for _,field in ipairs(UI_STYLE_NUMBER_FIELDS) do
		payload[field[1]]=uiStyle[field[2]]
	end

	for _,field in ipairs(UI_STYLE_BOOL_FIELDS) do
		payload[field[1]]=uiStyle[field[2]] and true or false
	end

	payload.liquidStrokeDirection=uiStyle.LiquidStrokeDirection
	payload.cornerRadius=0
	payload.uiLib=tostring(uiStyle.UILib or "")~="" and uiStyle.UILib or defaultUIStyle.UILib or "original"
	payload.themePanelExpanded=uiStyle.ThemePanelExpanded and true or false
	payload.coloursPanelExpanded=uiStyle.ColoursPanelExpanded and true or false

	return payload
end

local function applyPresetEditor(ctx,presetEditor)
	if type(presetEditor)~="table" then return end

	local presets=ctx.PRESETS or {}

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
		editor=data.PresetEditor or data.presetEditor or {}
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
			PresetEditor=normalizedEditor,
		},
		CreatedAt=preset.createdAt or preset.CreatedAt,
		UpdatedAt=preset.updatedAt or preset.UpdatedAt,
		OwnerPlayerId=preset.ownerPlayerId or preset.OwnerPlayerId,
	}
end

local function clearArray(t)
	if type(t)~="table" then return end
	for i=#t,1,-1 do
		table.remove(t,i)
	end
end

local function makeLocalCode(name)
	local base=string.upper(string.sub(string.gsub(tostring(name or ""),"[^%w]",""),1,3))
	if base=="" then base="GUI" end
	return base..tostring(math.random(100,999))
end

function DataSave.new(ctx)
	ctx=ctx or {}

	local api={}
	local root=normalizeRoot(ctx.PLAYER_SETTINGS_ROOT)
	local loading=false
	local autosaveQueued=false
	local autosaveDelay=ctx.autosaveDelay or 0.8
	local autosaveLastPayload=nil

	function api.IsLoading()
		return loading
	end

	function api.SetLoading(value)
		loading=value and true or false
		ctx.PLAYER_SETTINGS_LOADING=loading
	end

	function api.GetRoot()
		root=normalizeRoot(root)
		ctx.PLAYER_SETTINGS_ROOT=root
		return root
	end

	function api.SetRoot(nextRoot)
		root=normalizeRoot(nextRoot)
		ctx.PLAYER_SETTINGS_ROOT=root
		return root
	end

	function api.GetSavedSettingsForCurrentMode()
		local r=api.GetRoot()
		return r.modes[getModeKey(ctx)] or {}
	end

	function api.BuildRootForSave(currentSettings)
		local r=api.GetRoot()
		local modeKey=getModeKey(ctx)

		r.version=2
		r.lastMode=modeKey
		r.updatedAt=os.time()
		r.modes[modeKey]=currentSettings

		ctx.PLAYER_SETTINGS_ROOT=r
		return r
	end

	function api.Collect()
		if ctx.collectPlayerSettingsForApi then
			local ok,result=pcall(ctx.collectPlayerSettingsForApi)
			if ok and type(result)=="table" then
				return result
			end
		end

		local rootFrame=ctx.root
		local pos=rootFrame and rootFrame.Position or UDim2.new(0.5,0,0,80)

		local uiStyle=ctx.UI_STYLE or {}
		local defaultUIStyle=getDefaultUIStyle(ctx)
		local uiWindow=ctx.UI_WINDOW or {}
		local worldSettings=ctx.WORLD_SETTINGS or {}

		return{
			version=1,
			mode=getModeKey(ctx),

			hitbox={
				x=getValue(ctx,"sizeX",2.52),
				y=getValue(ctx,"sizeY",5.4),
				z=getValue(ctx,"sizeZ",1.41),
				transparency=getValue(ctx,"targetTransparency",0.7),
				enabled=getValue(ctx,"hitboxOn",false),
			},

			gravity=getValue(ctx,"gravityValue",196.2),
			gravityEnabled=getValue(ctx,"gravityEnabled",false),

			speed={
				enabled=getValue(ctx,"speedEnabled",false),
				value=getValue(ctx,"speedValue",18),
			},

			gameParams={
				enabled=getValue(ctx,"gameParamsEnabled",false),
				selectedPage=getValue(ctx,"paramsSelectedPage","speed"),
				speedEnabled=getValue(ctx,"speedParamsEnabled",true),
				gravityJumpEnabled=getValue(ctx,"gravityJumpParamsEnabled",true),
				staminaEnabled=getValue(ctx,"staminaParamsEnabled",true),
				staminaRegen=getValue(ctx,"staminaRegenValue",10),
				staminaDeplete=getValue(ctx,"staminaDepleteValue",10),
				jumpPower=getValue(ctx,"jumpPowerValue",53.5),
				divePower=getValue(ctx,"divePowerValue",1.9),
			},

			boost={
				enabled=getValue(ctx,"jumpBoostOn",false),
				always=getValue(ctx,"jumpBoostTradeMode",false),
				forceY=getValue(ctx,"boostForceY",32),
				cooldown=getValue(ctx,"boostCooldown",5),
				chance=getValue(ctx,"boostChance",100),
				radius=getValue(ctx,"ballDetectionRadius",10),
			},

			esp={
				enabled=getValue(ctx,"actionStatusOn",false),
			},

			qbAim={
				enabled=getValue(ctx,"qbAimEnabled",false),
				teamFilter=getValue(ctx,"qbAimTeamFilter",true),
				showArc=getValue(ctx,"qbAimShowArc",true),
				leadDelay=getValue(ctx,"qbAimLeadDelay",0.38),
				peakHeight=getValue(ctx,"qbAimPeakHeight",14.00),
				qbDrift=getValue(ctx,"qbAimQBDrift",0.04),
				qbYDrift=getValue(ctx,"qbAimQBYDrift",getValue(ctx,"qbAimQBDrift",0.04)),
			},

			testing={
				enabled=getValue(ctx,"testingEnabled",false),
			},

			keybinds={
				toggleUI=encodeBinding(getValue(ctx,"TOGGLE_UI_KEY",Enum.KeyCode.Unknown)),
				toggleHitbox=encodeBinding(getValue(ctx,"TOGGLE_HB_KEY",Enum.KeyCode.Unknown)),
				toggleJumpBoost=encodeBinding(getValue(ctx,"TOGGLE_JB_KEY",Enum.KeyCode.Unknown)),
				toggleAlwaysBoost=encodeBinding(getValue(ctx,"TOGGLE_AB_KEY",Enum.KeyCode.Unknown)),
				toggleESP=encodeBinding(getValue(ctx,"TOGGLE_ACTION_KEY",Enum.KeyCode.Unknown)),
				toggleActionStatus=encodeBinding(getValue(ctx,"TOGGLE_ACTION_KEY",Enum.KeyCode.Unknown)),
				toggleSpeed=encodeBinding(getValue(ctx,"TOGGLE_SPEED_KEY",Enum.KeyCode.Unknown)),
				qbAimLock=encodeBinding(getValue(ctx,"QB_AIM_LOCK_KEY",Enum.KeyCode.H)),
				qbAimThrow=encodeBinding(getValue(ctx,"QB_AIM_THROW_KEY",Enum.KeyCode.T)),
				qbAimToggle=encodeBinding(getValue(ctx,"QB_AIM_TOGGLE_KEY",Enum.KeyCode.P)),
			},

			presetEditor=collectPresetEditor(ctx),
			uiStyle=collectUIStylePayload(uiStyle,defaultUIStyle),

			workspace={
				smoothPlastic=worldSettings.SmoothPlastic and true or false,
			},

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

	function api.Apply(settings)
		if ctx.applySavedPlayerSettings then
			local ok=pcall(ctx.applySavedPlayerSettings,settings)
			if ok then return end
		end

		if type(settings)~="table" then
			settings={}
		end

		api.SetLoading(true)

		if ctx.applyCurrentModeLocalDefaults then
			pcall(ctx.applyCurrentModeLocalDefaults)
		end

		local hitbox=settings.hitbox or {}
		local hx=clampNumber(hitbox.x or hitbox.X,0.1,50,getValue(ctx,"sizeX",2.52))
		local hy=clampNumber(hitbox.y or hitbox.Y,0.1,50,getValue(ctx,"sizeY",5.4))
		local hz=clampNumber(hitbox.z or hitbox.Z,0.1,50,getValue(ctx,"sizeZ",1.41))

		if ctx.setHitboxSize then
			pcall(ctx.setHitboxSize,hx,hy,hz)
		else
			setValue(ctx,"sizeX",hx)
			setValue(ctx,"sizeY",hy)
			setValue(ctx,"sizeZ",hz)
		end

		applyClamped(ctx,"setTransparency","targetTransparency",hitbox.transparency,0,1,getValue(ctx,"targetTransparency",0.7))
		applyBoolean(ctx,"setHitboxLock","hitboxOn",hitbox.enabled)
		applyClamped(ctx,"setGravity","gravityValue",settings.gravity,0,1000,196.2)
		applyBoolean(ctx,"setGravityState","gravityEnabled",settings.gravityEnabled)

		local speed=settings.speed or {}
		applyClamped(ctx,"setSpeedValue","speedValue",speed.value,0,100,18)
		applyBoolean(ctx,"setSpeedState","speedEnabled",speed.enabled)

		local gameParams=settings.gameParams or {}
		if gameParams.selectedPage~=nil then
			applyValue(ctx,"setParamsSelectedPage","paramsSelectedPage",gameParams.selectedPage)
		end
		applyBoolean(ctx,"setSpeedParamsState","speedParamsEnabled",gameParams.speedEnabled)
		applyBoolean(ctx,"setGravityJumpParamsState","gravityJumpParamsEnabled",gameParams.gravityJumpEnabled)
		applyBoolean(ctx,"setStaminaParamsState","staminaParamsEnabled",gameParams.staminaEnabled)
		applyBoolean(ctx,"setGameParamsState","gameParamsEnabled",gameParams.enabled)
		applyClamped(ctx,"setStaminaRegenValue","staminaRegenValue",gameParams.staminaRegen,0,50,10)
		applyClamped(ctx,"setStaminaDepleteValue","staminaDepleteValue",gameParams.staminaDeplete,0,50,10,clampStaminaDeplete)
		applyClamped(ctx,"setJumpPowerValue","jumpPowerValue",gameParams.jumpPower,0,300,53.5)
		applyClamped(ctx,"setDivePowerValue","divePowerValue",gameParams.divePower,0,15,1.9)

		local boost=settings.boost or {}
		applyBoolean(ctx,"setJumpBoostState","jumpBoostOn",boost.enabled)
		setBoolean(ctx,"jumpBoostTradeMode",boost.always)
		setClamped(ctx,"boostForceY",boost.forceY,10,100,32)
		setClamped(ctx,"boostCooldown",boost.cooldown,0,60,5)
		setClamped(ctx,"boostChance",boost.chance,0,100,100)
		setClamped(ctx,"ballDetectionRadius",boost.radius,1,50,10)

		local esp=settings.esp or {}
		applyBoolean(ctx,"setESPState","actionStatusOn",esp.enabled)

		local qbAim=settings.qbAim or {}
		applyBoolean(ctx,"setQBAimState","qbAimEnabled",qbAim.enabled)
		applyBoolean(ctx,"setQBAimTeamFilter","qbAimTeamFilter",qbAim.teamFilter)
		applyBoolean(ctx,"setQBAimShowArc","qbAimShowArc",qbAim.showArc)
		applyClamped(ctx,"setQBAimLeadDelay","qbAimLeadDelay",qbAim.leadDelay,0,1.5,0.38)
		applyClamped(ctx,"setQBAimPeakHeight","qbAimPeakHeight",qbAim.peakHeight,8,20,14.00)
		applyClamped(ctx,"setQBAimQBDrift","qbAimQBDrift",qbAim.qbDrift,0,0.25,0.04)
		if qbAim.qbDrift==nil and qbAim.qbYDrift~=nil then
			applyClamped(ctx,"setQBAimQBYDrift","qbAimQBYDrift",qbAim.qbYDrift,0,0.25,0.04)
		end

		local testing=settings.testing or {}
		applyBoolean(ctx,"setTestingState","testingEnabled",testing.enabled)

		local keybinds=settings.keybinds or {}
		local keyMap={
			toggleUI="TOGGLE_UI_KEY",
			toggleHitbox="TOGGLE_HB_KEY",
			toggleJumpBoost="TOGGLE_JB_KEY",
			toggleAlwaysBoost="TOGGLE_AB_KEY",
			toggleSpeed="TOGGLE_SPEED_KEY",
			qbAimLock="QB_AIM_LOCK_KEY",
			qbAimThrow="QB_AIM_THROW_KEY",
			qbAimToggle="QB_AIM_TOGGLE_KEY",
		}

		for savedName,stateName in pairs(keyMap) do
			if keybinds[savedName]~=nil then
				setValue(ctx,stateName,decodeBinding(keybinds[savedName]))
			end
		end

		if keybinds.toggleESP~=nil then
			setValue(ctx,"TOGGLE_ACTION_KEY",decodeBinding(keybinds.toggleESP))
		elseif keybinds.toggleActionStatus~=nil then
			setValue(ctx,"TOGGLE_ACTION_KEY",decodeBinding(keybinds.toggleActionStatus))
		end

		applyPresetEditor(ctx,settings.presetEditor or settings.PresetEditor)

		local uiStyle=type(settings.uiStyle)=="table" and settings.uiStyle or {}
		local hasSavedUIStyle=hasAnyKey(uiStyle)

		local defaultUIStyle=getDefaultUIStyle(ctx)
		if ctx.UI_STYLE then
			for key,value in pairs(defaultUIStyle) do
				if not hasSavedUIStyle or ctx.UI_STYLE[key]==nil then
					ctx.UI_STYLE[key]=value
				end
			end

			for _,field in ipairs(UI_STYLE_NUMBER_FIELDS) do
				local savedKey,styleKey,min,max,fallback=field[1],field[2],field[3],field[4],field[5]
				if uiStyle[savedKey]~=nil then
					ctx.UI_STYLE[styleKey]=clampNumber(uiStyle[savedKey],min,max,ctx.UI_STYLE[styleKey] or fallback)
				end
			end

			for _,field in ipairs(UI_STYLE_BOOL_FIELDS) do
				if uiStyle[field[1]]~=nil then
					ctx.UI_STYLE[field[2]]=uiStyle[field[1]] and true or false
				end
			end

			if uiStyle.liquidStrokeDirection~=nil then ctx.UI_STYLE.LiquidStrokeDirection=tostring(uiStyle.liquidStrokeDirection) end
			local themeExpanded=uiStyle.themePanelExpanded
			if themeExpanded==nil then themeExpanded=uiStyle.ThemePanelExpanded end
			if themeExpanded~=nil then ctx.UI_STYLE.ThemePanelExpanded=themeExpanded and true or false end

			local coloursExpanded=uiStyle.coloursPanelExpanded
			if coloursExpanded==nil then coloursExpanded=uiStyle.ColorsPanelExpanded end
			if coloursExpanded==nil then coloursExpanded=uiStyle.ColoursPanelExpanded end
			if coloursExpanded~=nil then ctx.UI_STYLE.ColoursPanelExpanded=coloursExpanded and true or false end

			if uiStyle.uiLib~=nil and tostring(uiStyle.uiLib)~="" then
				ctx.UI_STYLE.UILib=tostring(uiStyle.uiLib)
			else
				ctx.UI_STYLE.UILib=tostring(defaultUIStyle.UILib or "original")
			end
			ctx.UI_STYLE.CornerRadius=0
		end

		local workspaceSettings=settings.workspace or {}
		if workspaceSettings.smoothPlastic~=nil and ctx.WORLD_SETTINGS then
			ctx.WORLD_SETTINGS.SmoothPlastic=workspaceSettings.smoothPlastic and true or false
		end

		local window=settings.window or {}
		if ctx.UI_WINDOW then
			if window.w~=nil then ctx.UI_WINDOW.W=clampNumber(window.w,ctx.UI_WINDOW.MinW or 560,ctx.UI_WINDOW.MaxW or 1220,ctx.UI_WINDOW.W or 880) end
			if window.h~=nil then ctx.UI_WINDOW.H=clampNumber(window.h,ctx.UI_WINDOW.MinH or 360,ctx.UI_WINDOW.MaxH or 820,ctx.UI_WINDOW.H or 540) end
		end

		if ctx.root and window.posXScale~=nil then
			ctx.root.Position=UDim2.new(
				tonumber(window.posXScale) or ctx.root.Position.X.Scale,
				tonumber(window.posXOffset) or ctx.root.Position.X.Offset,
				tonumber(window.posYScale) or ctx.root.Position.Y.Scale,
				tonumber(window.posYOffset) or ctx.root.Position.Y.Offset
			)
		end

		api.SetLoading(false)

		for _,hookName in ipairs(APPLY_REFRESH_HOOKS) do
			if ctx[hookName] then
				pcall(ctx[hookName])
			end
		end
	end

	function api.SaveNow()
		if loading or ctx.PLAYER_SETTINGS_LOADING then return false,"loading" end
		if ctx.toolAlive==false then return false,"tool not alive" end
		if not ctx.BOT_API or not ctx.BOT_API.Post then return false,"missing BOT_API.Post" end

		local currentSettings=api.Collect()
		local settingsRoot=api.BuildRootForSave(currentSettings)

		local ok,encoded=pcall(function()
			return HttpService:JSONEncode(settingsRoot)
		end)

		if ok and encoded==autosaveLastPayload then
			return true,"unchanged"
		end

		autosaveLastPayload=ok and encoded or nil

		task.spawn(function()
			local response=ctx.BOT_API.Post("/player/save",{
				playerId=getPlayerId(ctx),
				settings=settingsRoot,
			})

			if not response or not response.ok then
				warn("Player settings autosave failed:",response and response.error or "unknown error")
			end
		end)

		return true,"queued"
	end

	function api.Schedule()
		if loading or ctx.PLAYER_SETTINGS_LOADING then return end
		if ctx.toolAlive==false then return end
		if autosaveQueued then return end

		autosaveQueued=true

		task.delay(autosaveDelay,function()
			autosaveQueued=false
			api.SaveNow()
		end)
	end

	function api.SetPresetSize(index,x,y,z,skipSave)
		local presets=ctx.PRESETS or {}
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
		local presets=ctx.PRESETS or {}
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
		local presets=ctx.PRESETS or {}
		local defaults=ctx.DEFAULT_PRESETS or {}
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

		if ctx.refreshPage2UI then pcall(ctx.refreshPage2UI) end
		return true
	end

	function api.ApplyPresetEditor(presetEditor,skipSave)
		applyPresetEditor(ctx,presetEditor)

		if skipSave~=true then
			api.Schedule()
		end

		if ctx.refreshPage2UI then pcall(ctx.refreshPage2UI) end
		return true
	end

	function api.CreateOwnedPreset(name,presetEditor)
		local cleanName=trim(name)
		if cleanName=="" then
			return false,"Name cannot be empty."
		end

		local editorForApi=encodePresetEditor(presetEditor or collectPresetEditor(ctx))
		local preset=nil

		if ctx.BOT_API and ctx.BOT_API.Post then
			local response=ctx.BOT_API.Post("/preset/create",{
				playerId=getPlayerId(ctx),
				name=cleanName,
				presetEditor=editorForApi,
			})

			if not response or not response.ok then
				return false,response and response.error or "Save failed."
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
			return false,"Save returned invalid preset data."
		end

		if ctx.OWNED_PRESETS then
			table.insert(ctx.OWNED_PRESETS,preset)
		end

		if ctx.refreshPage2UI then pcall(ctx.refreshPage2UI) end
		if ctx.rebuildOwnedList then pcall(ctx.rebuildOwnedList) end

		return true,preset
	end

	function api.EquipOwnedPreset(preset)
		local normalized=normalizePreset(preset)
		if not normalized then
			return false,"Invalid preset."
		end

		api.ApplyPresetEditor(normalized.Data.PresetEditor,true)

		if ctx.BOT_API and ctx.BOT_API.Post then
			task.spawn(function()
				local response=ctx.BOT_API.Post("/preset/equip",{
					playerId=getPlayerId(ctx),
					code=normalized.Code,
				})

				if not response or not response.ok then
					warn("Preset API equip failed:",response and response.error or "unknown error")
				end
			end)
		end

		api.Schedule()
		if ctx.refreshPage2UI then pcall(ctx.refreshPage2UI) end

		return true,normalized
	end

	function api.DeleteOwnedPreset(code,index)
		local response=nil
		local usedApi=false

		if ctx.BOT_API and ctx.BOT_API.Post then
			usedApi=true
			response=ctx.BOT_API.Post("/preset/delete",{
				playerId=getPlayerId(ctx),
				code=code,
			})
		end

		if response and response.ok and type(response.presets)=="table" and ctx.OWNED_PRESETS then
			clearArray(ctx.OWNED_PRESETS)

			for _,rawPreset in ipairs(response.presets) do
				local normalized=normalizePreset(rawPreset)
				if normalized then
					table.insert(ctx.OWNED_PRESETS,normalized)
				end
			end
		elseif usedApi then
			warn("Preset API delete failed:",response and response.error or "unknown error")
			return false,response and response.error or "Delete failed."
		elseif ctx.OWNED_PRESETS then
			local removed=false

			for i=#ctx.OWNED_PRESETS,1,-1 do
				local preset=ctx.OWNED_PRESETS[i]
				if tostring(preset.Code or preset.code or "")==tostring(code or "") then
					table.remove(ctx.OWNED_PRESETS,i)
					removed=true
				end
			end

			if not removed and index and ctx.OWNED_PRESETS[index] then
				table.remove(ctx.OWNED_PRESETS,index)
			end
		end

		if ctx.expandedOwned then
			ctx.expandedOwned[tostring(code or "")]=nil
		end

		if ctx.refreshPage2UI then pcall(ctx.refreshPage2UI) end
		if ctx.rebuildOwnedList then pcall(ctx.rebuildOwnedList) end

		return true
	end

	function api.Load()
		if not ctx.BOT_API or not ctx.BOT_API.Post then
			api.Apply(api.GetSavedSettingsForCurrentMode())
			return false,"missing BOT_API.Post"
		end

		local response=ctx.BOT_API.Post("/player/load",{
			playerId=getPlayerId(ctx),
		})

		if not response or not response.ok then
			warn("Player settings load failed:",response and response.error or "unknown error")
			api.Apply(api.GetSavedSettingsForCurrentMode())
			return false,response and response.error or "unknown error"
		end

		api.SetRoot(response.settings or {})
		api.Apply(api.GetSavedSettingsForCurrentMode())

		return true,response
	end

	function api.SetMode(modeKey,applyNow)
		if modeKey then
			setValue(ctx,"CURRENT_MODE_KEY",tostring(modeKey))
		end

		if applyNow~=false then
			api.Apply(api.GetSavedSettingsForCurrentMode())
		end
	end

	function api.LoadOwnedPresets()
		if not ctx.BOT_API or not ctx.BOT_API.Post then
			return false,"missing BOT_API.Post"
		end

		local response=ctx.BOT_API.Post("/preset/list-owned",{
			playerId=getPlayerId(ctx),
		})

		if not response or not response.ok then
			warn("Owned presets load failed:",response and response.error or "unknown error")
			return false,response and response.error or "unknown error"
		end

		if ctx.OWNED_PRESETS then
			clearArray(ctx.OWNED_PRESETS)

			for _,preset in ipairs(response.presets or {}) do
				local normalized=normalizePreset(preset)
				if normalized then
					table.insert(ctx.OWNED_PRESETS,normalized)
				end
			end
		end

		if ctx.rebuildOwnedList then pcall(ctx.rebuildOwnedList) end
		if ctx.refreshPage2UI then pcall(ctx.refreshPage2UI) end

		return true,response
	end

	api.EncodeBinding=encodeBinding
	api.DecodeBinding=decodeBinding
	api.EncodePresetEditor=encodePresetEditor
	api.NormalizeRoot=normalizeRoot
	api.NormalizePreset=normalizePreset
	api.CollectPresetEditor=function()
		return collectPresetEditor(ctx)
	end

	ctx.DataSave=api
	ctx.requestPlayerAutosave=function()
		api.Schedule()
	end

	return api
end

return DataSave
