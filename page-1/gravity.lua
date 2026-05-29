local Gravity={}

function Gravity.new(ctx,parent)
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local state=ctx.State
	local api={}
	local slider=nil

	local function applyGravity(value)
		local gravity=math.clamp(tonumber(value) or 196.2,0,1000)
		state.gravityValue=gravity
		workspace.Gravity=gravity
		return gravity
	end

	local function changed()
		if ctx.onChanged then pcall(ctx.onChanged,state) end
	end

	local section=makeSection(parent,2,"Gravity","")

	slider=buildSlider(section,"G",0,1000,state.gravityValue,1,function(v)
		applyGravity(v)
		changed()
	end)

	function api.Refresh()
		local gravity=applyGravity(state.gravityValue)
		if slider then slider.set(gravity) end
	end

	function api.Reset()
		applyGravity(196.2)
		api.Refresh()
		changed()
	end

	return api
end

return Gravity
