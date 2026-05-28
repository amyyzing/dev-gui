local GameParams={}

function GameParams.new(ctx,parent)
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local buildToggleRow=ctx.buildToggleRow
	local state=ctx.State
	local api={}
	local athleticismToggle=nil
	local jumpSlider=nil
	local diveSlider=nil

	local function changed()
		if ctx.onChanged then pcall(ctx.onChanged,state) end
	end

	local section=makeSection(parent,1,"Game Params","")

	athleticismToggle=buildToggleRow(section,"+12 Stam / -8 Stam",state.athleticismOn,function(value)
		state.athleticismOn=value
		changed()
	end)

	jumpSlider=buildSlider(section,"J",0,300,state.jumpPowerValue,1,function(v)
		state.jumpPowerValue=v
		changed()
	end)

	diveSlider=buildSlider(section,"D",0,15,state.divePowerValue,2,function(v)
		state.divePowerValue=v
		changed()
	end)

	function api.Refresh()
		if athleticismToggle then athleticismToggle.set(state.athleticismOn) end
		if jumpSlider then jumpSlider.set(state.jumpPowerValue) end
		if diveSlider then diveSlider.set(state.divePowerValue) end
	end

	function api.Reset()
		state.athleticismOn=false
		state.jumpPowerValue=50
		state.divePowerValue=1.9
		api.Refresh()
		changed()
	end

	return api
end

return GameParams
