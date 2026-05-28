local Speed={}

function Speed.new(ctx,parent)
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local buildToggleRow=ctx.buildToggleRow
	local state=ctx.State
	local api={}
	local toggle=nil
	local slider=nil

	local function changed()
		if ctx.onChanged then pcall(ctx.onChanged,state) end
	end

	local section=makeSection(parent,3,"Speed","")

	toggle=buildToggleRow(section,"Force Speed",state.speedEnabled,function(value)
		state.speedEnabled=value
		changed()
	end)

	slider=buildSlider(section,"S",0,100,state.speedValue,0,function(v)
		state.speedValue=v
		changed()
	end)

	function api.Refresh()
		if toggle then toggle.set(state.speedEnabled) end
		if slider then slider.set(state.speedValue) end
	end

	function api.Reset()
		state.speedEnabled=false
		state.speedValue=18
		api.Refresh()
		changed()
	end

	return api
end

return Speed
