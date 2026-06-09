local Speed={}

local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local RunService=game:GetService("RunService")

local me=Players.LocalPlayer
local DEFAULT_SPEED=18
local TOGGLE_SPEED_KEY=Enum.KeyCode.Unknown

local function getMyHumanoid()
	local character=workspace:FindFirstChild(me.Name) or me.Character

	if character then
		return character:FindFirstChildOfClass("Humanoid")
	end

	return nil
end

local function clampSpeed(value)
	return math.clamp(tonumber(value) or DEFAULT_SPEED,0,100)
end

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
end

function Speed.new(ctx,parent)
	local safeDisconnect=ctx.safeDisconnect
	local inputToBinding=ctx.inputToBinding
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local buildToggleRow=ctx.buildToggleRow
	local state=ctx.State
	local api={}
	local toggle=nil
	local slider=nil
	local speedConn=nil
	local inputConn=nil
	local destroyConn=nil
	local section=nil

	local function changed()
		if ctx.onChanged then pcall(ctx.onChanged,state) end
	end

	local function syncControls()
		if toggle then toggle.set(state.speedEnabled) end
		if slider then slider.set(state.speedValue) end
	end

	local function isAlive()
		return section==nil or section.Parent~=nil
	end

	local function applySpeedValue()
		local hum=getMyHumanoid()

		if hum then
			hum.WalkSpeed=state.speedValue
		end
	end

	local function stopForcing(resetValue)
		safeDisconnect(speedConn)
		speedConn=nil

		if resetValue then
			state.speedValue=DEFAULT_SPEED
		end

		local hum=getMyHumanoid()
		if hum then
			hum.WalkSpeed=DEFAULT_SPEED
		end
	end

	function api.SetSpeedValue(value,fire)
		state.speedValue=clampSpeed(value)

		if state.speedEnabled then
			applySpeedValue()
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetSpeedState(value,fire,resetValue)
		state.speedEnabled=value and true or false
		state.speedValue=clampSpeed(state.speedValue)

		safeDisconnect(speedConn)
		speedConn=nil

		if state.speedEnabled then
			applySpeedValue()

			speedConn=RunService.Heartbeat:Connect(function()
				if not state.speedEnabled or not isAlive() then
					safeDisconnect(speedConn)
					speedConn=nil
					return
				end

				state.speedValue=clampSpeed(state.speedValue)
				local hum=getMyHumanoid()

				if hum and hum.WalkSpeed~=state.speedValue then
					hum.WalkSpeed=state.speedValue
				end
			end)
		else
			stopForcing(resetValue==true)
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	local sectionControls=nil
	section,sectionControls=makeSection(parent,3,"Speed","",{
		headerToggle={
			startState=state.speedEnabled,
			onChange=function(value)
				api.SetSpeedState(value,true,true)
			end,
		},
	})

	toggle=sectionControls and sectionControls.toggle
	if not toggle then
		toggle=buildToggleRow(section,"Force Speed",state.speedEnabled,function(value)
			api.SetSpeedState(value,true,true)
		end)
	end

	slider=buildSlider(section,"Speed",0,100,state.speedValue,0,function(v)
		api.SetSpeedValue(v,true)
	end)

	function api.Refresh()
		api.SetSpeedState(state.speedEnabled,false,false)
	end

	function api.Reset()
		api.SetSpeedState(false,false,true)
		changed()
	end

	function api.Destroy()
		safeDisconnect(inputConn)
		inputConn=nil
		safeDisconnect(destroyConn)
		destroyConn=nil
		destroyControl(slider)
		stopForcing(state.speedEnabled)
	end

	local function handleSpeedInput(input)
		local speedKey=TOGGLE_SPEED_KEY
		if ctx.getSpeedToggleKey then
			speedKey=ctx.getSpeedToggleKey() or Enum.KeyCode.Unknown
		end

		if speedKey==nil or speedKey==Enum.KeyCode.Unknown then return false end

		local binding=inputToBinding(input)
		if binding==speedKey then
			api.SetSpeedState(not state.speedEnabled,true,true)
			return true
		end

		return false
	end

	inputConn=UIS.InputBegan:Connect(function(input,processed)
		if processed then return end
		handleSpeedInput(input)
	end)

	destroyConn=section.AncestryChanged:Connect(function()
		if not isAlive() then
			api.Destroy()
		end
	end)

	api.Refresh()

	return api
end

return Speed
