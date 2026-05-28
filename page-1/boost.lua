local Boost={}

function Boost.new(ctx,parent)
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local buildToggleRow=ctx.buildToggleRow
	local state=ctx.State
	local api={}
	local jumpBoostToggle=nil
	local jumpBoostModeToggle=nil
	local forceSlider=nil
	local chanceSlider=nil
	local radiusSlider=nil

	local function changed()
		if ctx.onChanged then pcall(ctx.onChanged,state) end
	end

	local section=makeSection(parent,2,"Boost","")

	jumpBoostToggle=buildToggleRow(section,"Jump Boost",state.jumpBoostOn,function(value)
		state.jumpBoostOn=value
		changed()
	end)

	jumpBoostModeToggle=buildToggleRow(section,"Always Boost",state.jumpBoostTradeMode,function(value)
		state.jumpBoostTradeMode=value
		changed()
	end)

	forceSlider=buildSlider(section,"F",10,100,state.boostForceY,1,function(v)
		state.boostForceY=v
		changed()
	end)

	chanceSlider=buildSlider(section,"C",0,100,state.boostChance,0,function(v)
		state.boostChance=v
		changed()
	end)

	radiusSlider=buildSlider(section,"R",1,50,state.ballDetectionRadius,1,function(v)
		state.ballDetectionRadius=v
		changed()
	end)

	function api.Refresh()
		if jumpBoostToggle then jumpBoostToggle.set(state.jumpBoostOn) end
		if jumpBoostModeToggle then jumpBoostModeToggle.set(state.jumpBoostTradeMode) end
		if forceSlider then forceSlider.set(state.boostForceY) end
		if chanceSlider then chanceSlider.set(state.boostChance) end
		if radiusSlider then radiusSlider.set(state.ballDetectionRadius) end
	end

	function api.Reset()
		state.jumpBoostOn=false
		state.jumpBoostTradeMode=false
		state.boostForceY=32
		state.boostChance=100
		state.ballDetectionRadius=10
		api.Refresh()
		changed()
	end

	return api
end

return Boost
