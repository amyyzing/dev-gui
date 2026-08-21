local jpv={}

local players=game:GetService("Players")
local inputService=game:GetService("UserInputService")
local runService=game:GetService("RunService")
local workspace=game:GetService("Workspace")

local localPlayer=players.LocalPlayer
local pullDuration=0.50

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

local function characterParts()
	local character=localPlayer.Character
	if not character then return nil,nil,nil end
	return character,character:FindFirstChild("HumanoidRootPart"),character:FindFirstChildOfClass("Humanoid")
end

local function isFootball(part)
	if not(part and part:IsA("BasePart") and not part.Anchored) then return false end
	local current=part
	for _=1,4 do
		if not current then break end
		local name=tostring(current.Name):lower()
		if name:find("football",1,true) or name:find("ball",1,true) then return true end
		current=current.Parent
	end
	return false
end

local function closestFootball(root,maxDistance)
	local closest=nil
	local closestDistance=maxDistance
	for _,part in ipairs(workspace:GetDescendants()) do
		if isFootball(part) then
			local distance=(part.Position-root.Position).Magnitude
			if distance<=closestDistance then
				closest=part
				closestDistance=distance
			end
		end
	end
	return closest
end

function jpv.new(app,parent)
	local state=app.State or{}
	local makeSection=app.makeSection
	local buildSlider=app.buildSlider
	local buildToggleRow=app.buildToggleRow
	local inputToBinding=app.inputToBinding
	local api={}
	local enabled=false
	local holding=false
	local pullActive=false
	local pullStarted=0
	local destroyed=false
	local toggle=nil
	local pullSlider=nil
	local distanceSlider=nil
	local beganConnection=nil
	local endedConnection=nil
	local characterConnection=nil
	local jumpingConnection=nil
	local heartbeatConnection=nil

	state.jpvEnabled=false
	state.jpvPullValue=clamp(state.jpvPullValue,0.01,2,1)
	state.jpvMaxDistance=clamp(state.jpvMaxDistance,1,50,10)

	local function changed()
		if app.onChanged then pcall(app.onChanged,state) end
	end

	local function syncToggle()
		if toggle then toggle.set(enabled) end
	end

	local function setEnabled(value)
		enabled=value and true or false
		state.jpvEnabled=enabled
		if not enabled then
			holding=false
			pullActive=false
		end
		syncToggle()
	end

	local section,controls=makeSection(parent,7,"Jump Pull Vector","hold the configured key while jumping",{
		headerToggle={startState=false,onChange=setEnabled},
	})
	toggle=controls and controls.toggle
	if not toggle then toggle=buildToggleRow(section,"Jump Pull Vector",false,setEnabled) end

	pullSlider=buildSlider(section,"Pull",0.01,2,state.jpvPullValue,2,function(value)
		state.jpvPullValue=clamp(value,0.01,2,1)
		changed()
	end)
	distanceSlider=buildSlider(section,"Distance",1,50,state.jpvMaxDistance,1,function(value)
		state.jpvMaxDistance=clamp(value,1,50,10)
		changed()
	end)

	local function bindCharacter(character)
		disconnect(jumpingConnection)
		jumpingConnection=nil
		local humanoid=character and (character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid",3))
		if humanoid then
			jumpingConnection=humanoid.Jumping:Connect(function()
				if enabled and holding then
					pullActive=true
					pullStarted=os.clock()
				end
			end)
		end
	end

	bindCharacter(localPlayer.Character)
	characterConnection=localPlayer.CharacterAdded:Connect(bindCharacter)

	local function matchesHold(input)
		local key=app.getJPVKey and app.getJPVKey() or Enum.KeyCode.Unknown
		return key~=Enum.KeyCode.Unknown and inputToBinding(input)==key
	end

	beganConnection=inputService.InputBegan:Connect(function(input,processed)
		if not processed and enabled and matchesHold(input) then holding=true end
	end)
	endedConnection=inputService.InputEnded:Connect(function(input)
		if matchesHold(input) then
			holding=false
			pullActive=false
		end
	end)

	heartbeatConnection=runService.Heartbeat:Connect(function()
		if destroyed or not enabled or not holding or not pullActive then return end
		if os.clock()-pullStarted>pullDuration then
			pullActive=false
			return
		end
		local _,root,humanoid=characterParts()
		if not(root and humanoid) then return end
		local ball=closestFootball(root,state.jpvMaxDistance*10)
		if not ball then return end
		local target=ball.Position+Vector3.new(0,2.5,0)
		local alpha=0.2*(math.clamp(state.jpvPullValue,0.01,2)*0.2)
		local position=root.Position:Lerp(target,alpha)
		root.CFrame=CFrame.new(position,position+root.CFrame.LookVector)
	end)

	function api.SetJPVState(value)
		setEnabled(value)
	end

	function api.SetPullValue(value,notify)
		state.jpvPullValue=clamp(value,0.01,2,1)
		if pullSlider then pullSlider.set(state.jpvPullValue) end
		if notify~=false then changed() end
	end

	function api.SetMaxDistance(value,notify)
		state.jpvMaxDistance=clamp(value,1,50,10)
		if distanceSlider then distanceSlider.set(state.jpvMaxDistance) end
		if notify~=false then changed() end
	end

	function api.Refresh()
		syncToggle()
		if pullSlider then pullSlider.set(state.jpvPullValue) end
		if distanceSlider then distanceSlider.set(state.jpvMaxDistance) end
	end

	function api.Reset()
		setEnabled(false)
		api.SetPullValue(1,false)
		api.SetMaxDistance(10,false)
	end

	function api.Destroy()
		if destroyed then return end
		destroyed=true
		enabled=false
		holding=false
		pullActive=false
		disconnect(beganConnection)
		disconnect(endedConnection)
		disconnect(characterConnection)
		disconnect(jumpingConnection)
		disconnect(heartbeatConnection)
		destroyControl(toggle)
		destroyControl(pullSlider)
		destroyControl(distanceSlider)
	end

	return api
end

return jpv
