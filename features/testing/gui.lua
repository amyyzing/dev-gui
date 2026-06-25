local TestingGui={}

function TestingGui.build(ctx,parent,state,api)
	local makeSection=ctx.makeSection
	local buildToggleRow=ctx.buildToggleRow

	local body,controls=makeSection(parent,5,"Testing","WR C1 and QB arc safety",{
		headerToggle={
			startState=state.testingEnabled,
			onChange=function(value)
				api.SetTestingState(value,true)
			end,
		},
	})

	local toggle=controls and controls.toggle
	if not toggle then
		toggle=buildToggleRow(body,"Testing",state.testingEnabled,function(value)
			api.SetTestingState(value,true)
		end)
	end

	local wrToggle=buildToggleRow(body,"WR",state.testingWREnabled~=false,function(value)
		api.SetTestingWRState(value,true)
	end)
	local qbToggle=buildToggleRow(body,"QB",state.testingQBEnabled~=false,function(value)
		api.SetTestingQBState(value,true)
	end)

	return{
		body=body,
		section=controls and controls.section or body,
		toggle=toggle,
		wrToggle=wrToggle,
		qbToggle=qbToggle,
	}
end

function TestingGui.new(ctx,...)
	return ctx.Page1TestingLogicModule.new(ctx,...,TestingGui)
end

return TestingGui
