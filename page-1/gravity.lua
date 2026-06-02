local Gravity={}

function Gravity.new(ctx,parent)
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local buildToggleRow=ctx.buildToggleRow
	local state=ctx.State
	local api={}
	local slider=nil
	local toggle=nil
	local DEFAULT_GRAVITY=196.2

	local function normalizeState()
		state.gravityEnabled=state.gravityEnabled and true or false
		state.gravityValue=math.clamp(tonumber(state.gravityValue) or DEFAULT_GRAVITY,0,1000)
	end

	local function applyGravity(value)
		local gravity=math.clamp(tonumber(value) or DEFAULT_GRAVITY,0,1000)
		state.gravityValue=gravity
		if state.gravityEnabled then
			workspace.Gravity=gravity
		end
		return gravity
	end

	local function changed()
		if ctx.onChanged then pcall(ctx.onChanged,state) end
	end

	local function syncControls()
		if toggle then toggle.set(state.gravityEnabled) end
		if slider then slider.set(state.gravityValue) end
	end

	function api.SetGravityState(value,fire)
		state.gravityEnabled=value and true or false
		if state.gravityEnabled then
			applyGravity(state.gravityValue)
		else
			workspace.Gravity=DEFAULT_GRAVITY
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetGravityValue(value,fire)
		applyGravity(value)
		syncControls()

		if fire~=false then
			changed()
		end
	end

	normalizeState()
	local section,sectionControls=makeSection(parent,2,"Gravity","",{
		headerToggle={
			startState=state.gravityEnabled,
			onChange=function(value)
				api.SetGravityState(value,true)
			end,
		},
	})

	toggle=sectionControls and sectionControls.toggle
	if not toggle and buildToggleRow then
		toggle=buildToggleRow(section,"Gravity",state.gravityEnabled,function(value)
			api.SetGravityState(value,true)
		end)
	end

	slider=buildSlider(section,"Gravity",0,1000,state.gravityValue,1,function(v)
		api.SetGravityValue(v,true)
	end)

	function api.Refresh()
		normalizeState()
		if state.gravityEnabled then
			applyGravity(state.gravityValue)
		end
		syncControls()
	end

	function api.Reset()
		state.gravityEnabled=false
		state.gravityValue=DEFAULT_GRAVITY
		api.SetGravityState(false,false)
		syncControls()
		changed()
	end

	return api
end

return Gravity
