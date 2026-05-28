local DataSave={}

local HttpService=game:GetService("HttpService")

local DEFAULT_ROOT={
	version=2,
	modes={},
}

local KEYBIND_FIELDS={
	{"toggleUI","TOGGLE_UI_KEY"},
	{"toggleHitbox","TOGGLE_HB_KEY"},
	{"toggleGameParams","TOGGLE_GP_KEY"},
	{"toggleJumpBoost","TOGGLE_JB_KEY"},
	{"toggleAlwaysBoost","TOGGLE_AB_KEY"},
	{"toggleActionStatus","TOGGLE_ACTION_KEY"},
	{"toggleSpeed","TOGGLE_SPEED_KEY"},
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
		return rawName
	end

	return Enum.KeyCode.Unknown
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

			speed={
				enabled=getValue(ctx,"speedEnabled",false),
				value=getValue(ctx,"speedValue",18),
			},

			gameParams={
				athleticism=getValue(ctx,"athleticismOn",false),
				jumpPower=getValue(ctx,"jumpPowerValue",50),
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

			keybinds={
				toggleUI=encodeBinding(getValue(ctx,"TOGGLE_UI_KEY",Enum.KeyCode.Unknown)),
				toggleHitbox=encodeBinding(getValue(ctx,"TOGGLE_HB_KEY",Enum.KeyCode.Unknown)),
				toggleGameParams=encodeBinding(getValue(ctx,"TOGGLE_GP_KEY",Enum.KeyCode.Unknown)),
				toggleJumpBoost=encodeBinding(getValue(ctx,"TOGGLE_JB_KEY",Enum.KeyCode.Unknown)),
				toggleAlwaysBoost=encodeBinding(getValue(ctx,"TOGGLE_AB_KEY",Enum.KeyCode.Unknown)),
				toggleActionStatus=encodeBinding(getValue(ctx,"TOGGLE_ACTION_KEY",Enum.KeyCode.Unknown)),
				toggleSpeed=encodeBinding(getValue(ctx,"TOGGLE_SPEED_KEY",Enum.KeyCode.Unknown)),
			},

			presetEditor=collectPresetEditor(ctx),

			uiStyle={
				strokeR=uiStyle.StrokeR,
				strokeG=uiStyle.StrokeG,
				strokeB=uiStyle.StrokeB,
				gradientR=uiStyle.GradientR,
				gradientG=uiStyle.GradientG,
				gradientB=uiStyle.GradientB,
				strokeGradient=uiStyle.StrokeGradient and true or false,
			},

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

		if hitbox.transparency~=nil then
			local tv=clampNumber(hitbox.transparency,0,1,getValue(ctx,"targetTransparency",0.7))
			if ctx.setTransparency then pcall(ctx.setTransparency,tv) else setValue(ctx,"targetTransparency",tv) end
		end

		if hitbox.enabled~=nil then
			if ctx.setHitboxLock then pcall(ctx.setHitboxLock,hitbox.enabled) else setValue(ctx,"hitboxOn",hitbox.enabled and true or false) end
		end

		if settings.gravity~=nil then
			local gv=clampNumber(settings.gravity,0,1000,196.2)
			if ctx.setGravity then pcall(ctx.setGravity,gv) else setValue(ctx,"gravityValue",gv) end
		end

		local speed=settings.speed or {}
		if speed.value~=nil then
			local sv=clampNumber(speed.value,0,100,18)
			if ctx.setSpeedValue then pcall(ctx.setSpeedValue,sv) else setValue(ctx,"speedValue",sv) end
		end

		if speed.enabled~=nil then
			if ctx.setSpeedState then pcall(ctx.setSpeedState,speed.enabled) else setValue(ctx,"speedEnabled",speed.enabled and true or false) end
		end

		local gameParams=settings.gameParams or {}
		if gameParams.athleticism~=nil then
			if ctx.setAthleticism then pcall(ctx.setAthleticism,gameParams.athleticism) else setValue(ctx,"athleticismOn",gameParams.athleticism and true or false) end
		end

		if gameParams.jumpPower~=nil then
			local jp=clampNumber(gameParams.jumpPower,0,300,50)
			if ctx.setJumpPowerValue then pcall(ctx.setJumpPowerValue,jp) else setValue(ctx,"jumpPowerValue",jp) end
		end

		if gameParams.divePower~=nil then
			local dp=clampNumber(gameParams.divePower,0,15,1.9)
			if ctx.setDivePowerValue then pcall(ctx.setDivePowerValue,dp) else setValue(ctx,"divePowerValue",dp) end
		end

		local boost=settings.boost or {}
		if boost.enabled~=nil then
			if ctx.setJumpBoostState then pcall(ctx.setJumpBoostState,boost.enabled) else setValue(ctx,"jumpBoostOn",boost.enabled and true or false) end
		end

		if boost.always~=nil then setValue(ctx,"jumpBoostTradeMode",boost.always and true or false) end
		if boost.forceY~=nil then setValue(ctx,"boostForceY",clampNumber(boost.forceY,10,100,32)) end
		if boost.cooldown~=nil then setValue(ctx,"boostCooldown",clampNumber(boost.cooldown,0,60,5)) end
		if boost.chance~=nil then setValue(ctx,"boostChance",clampNumber(boost.chance,0,100,100)) end
		if boost.radius~=nil then setValue(ctx,"ballDetectionRadius",clampNumber(boost.radius,1,50,10)) end

		local keybinds=settings.keybinds or {}
		local keyMap={
			toggleUI="TOGGLE_UI_KEY",
			toggleHitbox="TOGGLE_HB_KEY",
			toggleGameParams="TOGGLE_GP_KEY",
			toggleJumpBoost="TOGGLE_JB_KEY",
			toggleAlwaysBoost="TOGGLE_AB_KEY",
			toggleActionStatus="TOGGLE_ACTION_KEY",
			toggleSpeed="TOGGLE_SPEED_KEY",
		}

		for savedName,stateName in pairs(keyMap) do
			if keybinds[savedName]~=nil then
				setValue(ctx,stateName,decodeBinding(keybinds[savedName]))
			end
		end

		applyPresetEditor(ctx,settings.presetEditor or settings.PresetEditor)

		local uiStyle=settings.uiStyle or {}
		if ctx.UI_STYLE then
			if uiStyle.strokeR~=nil then ctx.UI_STYLE.StrokeR=clampNumber(uiStyle.strokeR,0,255,ctx.UI_STYLE.StrokeR or 255) end
			if uiStyle.strokeG~=nil then ctx.UI_STYLE.StrokeG=clampNumber(uiStyle.strokeG,0,255,ctx.UI_STYLE.StrokeG or 255) end
			if uiStyle.strokeB~=nil then ctx.UI_STYLE.StrokeB=clampNumber(uiStyle.strokeB,0,255,ctx.UI_STYLE.StrokeB or 255) end
			if uiStyle.gradientR~=nil then ctx.UI_STYLE.GradientR=clampNumber(uiStyle.gradientR,0,255,ctx.UI_STYLE.GradientR or 255) end
			if uiStyle.gradientG~=nil then ctx.UI_STYLE.GradientG=clampNumber(uiStyle.gradientG,0,255,ctx.UI_STYLE.GradientG or 255) end
			if uiStyle.gradientB~=nil then ctx.UI_STYLE.GradientB=clampNumber(uiStyle.gradientB,0,255,ctx.UI_STYLE.GradientB or 255) end
			if uiStyle.strokeGradient~=nil then ctx.UI_STYLE.StrokeGradient=uiStyle.strokeGradient and true or false end
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

		if ctx.RefreshAll then pcall(ctx.RefreshAll) end
		if ctx.applyUIStrokeTheme then pcall(ctx.applyUIStrokeTheme) end
		if ctx.refreshSettingsUI then pcall(ctx.refreshSettingsUI) end
		if ctx.refreshActualSettingsUI then pcall(ctx.refreshActualSettingsUI) end
		if ctx.refreshSpeedUI then pcall(ctx.refreshSpeedUI) end
		if ctx.refreshHitboxReadout then pcall(ctx.refreshHitboxReadout) end
		if ctx.refreshPage2UI then pcall(ctx.refreshPage2UI) end
		if ctx.updateResponsiveLayout then pcall(ctx.updateResponsiveLayout) end
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
