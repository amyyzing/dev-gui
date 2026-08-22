local stickyHead={}

local players=game:GetService("Players")
local inputService=game:GetService("UserInputService")
local runService=game:GetService("RunService")

local localPlayer=players.LocalPlayer

local function clamp(value,min,max,fallback)
	local number=tonumber(value)
	return number and math.clamp(number,min,max) or fallback
end

local function disconnect(connection)
	if connection then pcall(function() connection:Disconnect() end) end
end

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
end

local function localRoot()
	local character=localPlayer.Character
	return character,character and character:FindFirstChild("HumanoidRootPart")
end

local function closestHead(root,maxDistance)
	local target=nil
	local closest=maxDistance
	for _,player in ipairs(players:GetPlayers()) do
		if player~=localPlayer and player.Character then
			local otherRoot=player.Character:FindFirstChild("HumanoidRootPart")
			local head=player.Character:FindFirstChild("Head")
			if otherRoot and head then
				local distance=(root.Position-otherRoot.Position).Magnitude
				if distance<closest then
					closest=distance
					target=head.Position+Vector3.new(0,2.5,0)
				end
			end
		end
	end
	return target
end

function stickyHead.new(app,parent)
	local state=app.State or{}
	local makeSection=app.makeSection
	local buildSlider=app.buildSlider
	local buildToggleRow=app.buildToggleRow
	local inputToBinding=app.inputToBinding
	local api={}
	local enabled=false
	local destroyed=false
	local toggle=nil
	local rangeSlider=nil
	local smoothnessSlider=nil
	local strengthSlider=nil
	local inputConnection=nil
	local heartbeatConnection=nil

	state.stickyHeadEnabled=false
	state.stickyHeadRange=clamp(state.stickyHeadRange,1,50,10)
	state.stickyHeadSmoothness=clamp(state.stickyHeadSmoothness,1,100,12)
	state.stickyHeadStrength=clamp(state.stickyHeadStrength,1,100,12)

	local function changed()
		if app.onChanged then pcall(app.onChanged,state) end
	end

	local function syncToggle()
		if toggle then toggle.set(enabled) end
	end

	local function setEnabled(value)
		enabled=value and true or false
		state.stickyHeadEnabled=enabled
		syncToggle()
	end

	local section,controls=makeSection(parent,8,"Sticky Head","",{
		headerToggle={startState=false,onChange=setEnabled},
	})
	toggle=controls and controls.toggle
	if not toggle then toggle=buildToggleRow(section,"Sticky Head",false,setEnabled) end

	rangeSlider=buildSlider(section,"Range",1,50,state.stickyHeadRange,1,function(value)
		state.stickyHeadRange=clamp(value,1,50,10)
		changed()
	end)
	smoothnessSlider=buildSlider(section,"Smoothness",1,100,state.stickyHeadSmoothness,1,function(value)
		state.stickyHeadSmoothness=clamp(value,1,100,12)
		changed()
	end)
	strengthSlider=buildSlider(section,"Strength",1,100,state.stickyHeadStrength,1,function(value)
		state.stickyHeadStrength=clamp(value,1,100,12)
		changed()
	end)

	local function matchesToggle(input)
		local key=app.getStickyHeadKey and app.getStickyHeadKey() or Enum.KeyCode.Unknown
		return key~=Enum.KeyCode.Unknown and inputToBinding(input)==key
	end

	inputConnection=inputService.InputBegan:Connect(function(input,processed)
		if not processed and matchesToggle(input) then setEnabled(not enabled) end
	end)
	heartbeatConnection=runService.Heartbeat:Connect(function()
		if destroyed or not enabled then return end
		local _,root=localRoot()
		if not root then return end
		local target=closestHead(root,state.stickyHeadRange)
		if not target then return end
		local alpha=math.clamp((state.stickyHeadSmoothness/100)*(state.stickyHeadStrength/12),0.01,1)
		root.CFrame=root.CFrame:Lerp(CFrame.new(target),alpha)
	end)

	function api.SetStickyHeadState(value)
		setEnabled(value)
	end

	function api.SetRange(value,notify)
		state.stickyHeadRange=clamp(value,1,50,10)
		if rangeSlider then rangeSlider.set(state.stickyHeadRange) end
		if notify~=false then changed() end
	end

	function api.SetSmoothness(value,notify)
		state.stickyHeadSmoothness=clamp(value,1,100,12)
		if smoothnessSlider then smoothnessSlider.set(state.stickyHeadSmoothness) end
		if notify~=false then changed() end
	end

	function api.SetStrength(value,notify)
		state.stickyHeadStrength=clamp(value,1,100,12)
		if strengthSlider then strengthSlider.set(state.stickyHeadStrength) end
		if notify~=false then changed() end
	end

	function api.Refresh()
		syncToggle()
		if rangeSlider then rangeSlider.set(state.stickyHeadRange) end
		if smoothnessSlider then smoothnessSlider.set(state.stickyHeadSmoothness) end
		if strengthSlider then strengthSlider.set(state.stickyHeadStrength) end
	end

	function api.Reset()
		setEnabled(false)
		api.SetRange(10,false)
		api.SetSmoothness(12,false)
		api.SetStrength(12,false)
	end

	function api.Destroy()
		if destroyed then return end
		destroyed=true
		enabled=false
		disconnect(inputConnection)
		disconnect(heartbeatConnection)
		destroyControl(toggle)
		destroyControl(rangeSlider)
		destroyControl(smoothnessSlider)
		destroyControl(strengthSlider)
	end

	return api
end

return stickyHead
