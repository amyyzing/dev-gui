local Gravity={}

function Gravity.new(ctx,parent)
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local state=ctx.State
	local api={}
	local slider=nil

	local function changed()
		if ctx.onChanged then pcall(ctx.onChanged,state) end
	end

	local section=makeSection(parent,2,"Gravity","")

	slider=buildSlider(section,"G",0,1000,state.gravityValue,1,function(v)
		state.gravityValue=v
		changed()
	end)

	function api.Refresh()
		if slider then slider.set(state.gravityValue) end
	end

	function api.Reset()
		state.gravityValue=196.2
		api.Refresh()
		changed()
	end

	return api
end

return Gravity
