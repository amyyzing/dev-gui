local GameParams={}

function GameParams.new(ctx,parent)
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local state=ctx.State
	local api={}
	local staminaRegenSlider=nil
	local staminaDepleteSlider=nil
	local jumpSlider=nil
	local diveSlider=nil

	local function changed()
		if ctx.onChanged then pcall(ctx.onChanged,state) end
	end

	local function clampNumber(value,min,max,fallback)
		local n=tonumber(value)
		if not n then return fallback end
		return math.clamp(n,min,max)
	end

	local function normalizeState()
		state.staminaRegenValue=clampNumber(state.staminaRegenValue,0,50,12)
		state.staminaDepleteValue=clampNumber(state.staminaDepleteValue,-50,0,-8)
		state.jumpPowerValue=clampNumber(state.jumpPowerValue,0,300,50)
		state.divePowerValue=clampNumber(state.divePowerValue,0,15,1.9)
	end

	local function syncControls()
		if staminaRegenSlider then staminaRegenSlider.set(state.staminaRegenValue) end
		if staminaDepleteSlider then staminaDepleteSlider.set(state.staminaDepleteValue) end
		if jumpSlider then jumpSlider.set(state.jumpPowerValue) end
		if diveSlider then diveSlider.set(state.divePowerValue) end
	end

	function api.SetStaminaRegenValue(value,fire)
		state.staminaRegenValue=clampNumber(value,0,50,12)
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetStaminaDepleteValue(value,fire)
		state.staminaDepleteValue=clampNumber(value,-50,0,-8)
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetJumpPowerValue(value,fire)
		state.jumpPowerValue=clampNumber(value,0,300,50)
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetDivePowerValue(value,fire)
		state.divePowerValue=clampNumber(value,0,15,1.9)
		syncControls()

		if fire~=false then
			changed()
		end
	end

	local section=makeSection(parent,1,"Game Params","")

	normalizeState()

	staminaRegenSlider=buildSlider(section,"SR",0,50,state.staminaRegenValue,1,function(v)
		api.SetStaminaRegenValue(v,true)
	end)

	staminaDepleteSlider=buildSlider(section,"SD",-50,0,state.staminaDepleteValue,1,function(v)
		api.SetStaminaDepleteValue(v,true)
	end)

	jumpSlider=buildSlider(section,"J",0,300,state.jumpPowerValue,1,function(v)
		api.SetJumpPowerValue(v,true)
	end)

	diveSlider=buildSlider(section,"D",0,15,state.divePowerValue,2,function(v)
		api.SetDivePowerValue(v,true)
	end)

	function api.Refresh()
		normalizeState()
		syncControls()
	end

	function api.Reset()
		state.athleticismOn=false
		state.staminaRegenValue=12
		state.staminaDepleteValue=-8
		state.jumpPowerValue=50
		state.divePowerValue=1.9
		api.Refresh()
		changed()
	end

	return api
end

return GameParams
