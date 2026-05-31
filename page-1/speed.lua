local Speed={}

local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local RunService=game:GetService("RunService")
local ContextActionService=game:GetService("ContextActionService")

local me=Players.LocalPlayer
local DEFAULT_SPEED=18
local TOGGLE_SPEED_KEY=Enum.KeyCode.Unknown

local function safeDisconnect(conn)
	if conn and typeof(conn)=="RBXScriptConnection" then
		pcall(function()
			conn:Disconnect()
		end)
	end
end

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

local function inputToBinding(input)
	local uiType=tostring(input.UserInputType)

	if uiType=="Enum.UserInputType.MouseButton1" then return"MouseButton1" end
	if uiType=="Enum.UserInputType.MouseButton2" then return"MouseButton2" end
	if uiType=="Enum.UserInputType.MouseButton3" then return"MouseButton3" end
	if uiType=="Enum.UserInputType.MouseButton4" then return"MouseButton4" end
	if uiType=="Enum.UserInputType.MouseButton5" then return"MouseButton5" end

	local key=input.KeyCode
	if key and key~=Enum.KeyCode.Unknown then return key end
	return nil
end

function Speed.new(ctx,parent)
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local buildToggleRow=ctx.buildToggleRow
	local state=ctx.State
	local api={}
	local toggle=nil
	local slider=nil
	local speedConn=nil
	local inputConn=nil
	local sideButtonActionName="SpeedSideButton_"..tostring(math.random(100000,999999))
	local lastSideButtonBinding=nil
	local lastSideButtonAt=0
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

	section=makeSection(parent,3,"Speed","")

	toggle=buildToggleRow(section,"Force Speed",state.speedEnabled,function(value)
		api.SetSpeedState(value,true,true)
	end)

	slider=buildSlider(section,"S",0,100,state.speedValue,0,function(v)
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
		pcall(function()
			ContextActionService:UnbindAction(sideButtonActionName)
		end)
		safeDisconnect(destroyConn)
		destroyConn=nil
		stopForcing(state.speedEnabled)
	end

	local function handleSpeedInput(input)
		local speedKey=TOGGLE_SPEED_KEY
		if ctx.getSpeedToggleKey then
			speedKey=ctx.getSpeedToggleKey() or Enum.KeyCode.Unknown
		end

		if speedKey==nil or speedKey==Enum.KeyCode.Unknown then return false end

		local binding=(ctx.inputToBinding or inputToBinding)(input)
		if binding==speedKey then
			if binding=="MouseButton4" or binding=="MouseButton5" then
				local now=os.clock()
				if lastSideButtonBinding==binding and now-lastSideButtonAt<0.12 then
					return true
				end
				lastSideButtonBinding=binding
				lastSideButtonAt=now
			end

			api.SetSpeedState(not state.speedEnabled,true,true)
			return true
		end

		return false
	end

	inputConn=UIS.InputBegan:Connect(function(input,processed)
		if processed then return end
		handleSpeedInput(input)
	end)

	ContextActionService:BindActionAtPriority(sideButtonActionName,function(_,inputState,input)
		if inputState~=Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end

		return handleSpeedInput(input) and Enum.ContextActionResult.Sink or Enum.ContextActionResult.Pass
	end,false,Enum.ContextActionPriority.High.Value+900,Enum.UserInputType.MouseButton4,Enum.UserInputType.MouseButton5)

	destroyConn=section.AncestryChanged:Connect(function()
		if not isAlive() then
			api.Destroy()
		end
	end)

	api.Refresh()

	return api
end

return Speed
