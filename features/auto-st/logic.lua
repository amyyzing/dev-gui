local autoST={}

local players=game:GetService("Players")
local inputService=game:GetService("UserInputService")
local runService=game:GetService("RunService")
local workspace=game:GetService("Workspace")

local localPlayer=players.LocalPlayer
local detectionRange=45
local rightAnchorOffset=1.5
local maxPredictionTime=1.2
local minimumBallSpeed=4
local minimumTargetDistance=1.25
local turnRate=math.rad(360)
local yawDeadband=math.rad(0.75)
local alignmentInterval=1/60
local ballScanInterval=0.10
local lostBallGrace=0.15
local schedulerJobId="AutoSTAlignment"

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
	return character,
		character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart,
		character:FindFirstChildOfClass("Humanoid")
end

local function hasFootballName(instance)
	local current=instance
	for _=1,4 do
		if not current then break end
		local name=tostring(current.Name):lower()
		if name:find("football",1,true)
			or name:find("ball",1,true)
			or name=="918f5408-d86a-4fb8-a88c-5cab57410acf" then
			return true
		end
		current=current.Parent
	end
	return false
end

local function isCharacterBall(instance)
	for _,player in ipairs(players:GetPlayers()) do
		local character=player.Character
		if character and instance:IsDescendantOf(character) then
			return true
		end
	end
	return false
end

local function isFreeFootball(instance)
	return instance
		and instance:IsA("BasePart")
		and instance.Parent~=nil
		and not instance.Anchored
		and hasFootballName(instance)
		and not isCharacterBall(instance)
end

local function flat(vector)
	return Vector3.new(vector.X,0,vector.Z)
end

local function interceptPoint(rootPart,ball)
	local relativePosition=flat(ball.Position-rootPart.Position)
	local relativeVelocity=flat(ball.AssemblyLinearVelocity-rootPart.AssemblyLinearVelocity)
	local speedSquared=relativeVelocity:Dot(relativeVelocity)
	local time=0
	if speedSquared>1e-4 then
		time=math.clamp(-relativePosition:Dot(relativeVelocity)/speedSquared,0,maxPredictionTime)
	end
	return ball.Position+ball.AssemblyLinearVelocity*time,time
end

local function yawFromRight(rightVector)
	return math.atan2(-rightVector.Z,rightVector.X)
end

local function shortestAngle(from,to)
	local difference=to-from
	return math.atan2(math.sin(difference),math.cos(difference))
end

function autoST.new(app,parent)
	local state=app.State or{}
	local safeDisconnect=app.safeDisconnect
	local inputToBinding=app.inputToBinding
	local makeSection=app.makeSection
	local buildToggleRow=app.buildToggleRow
	local scheduler=app.schedulerApi or (app.Services and app.Services.schedulerApi)
	local api={}
	local enabled=false
	local destroyed=false
	local toggle=nil
	local section=nil
	local inputBegan=nil
	local descendantAdded=nil
	local descendantRemoving=nil
	local renderConnection=nil
	local schedulerRegistered=false
	local ballCandidates={}
	local ballIndexReady=false
	local trackedBall=nil
	local nextBallScanAt=0
	local lastBallSeenAt=0
	local controlledHumanoid=nil
	local previousAutoRotate=nil

	-- This state is intentionally session-only and always starts disabled.
	state.autoSTEnabled=false

	local function indexCandidate(instance)
		if instance:IsA("BasePart") and hasFootballName(instance) then
			ballCandidates[instance]=true
		end
	end

	local function rebuildBallIndex()
		table.clear(ballCandidates)
		for _,instance in ipairs(workspace:GetDescendants()) do
			indexCandidate(instance)
		end
		ballIndexReady=true
	end

	local function refreshKnownFootballCandidates()
		for _,rootName in ipairs({"Games","MiniGames"}) do
			local games=workspace:FindFirstChild(rootName)
			if games then
				for _,gameFolder in ipairs(games:GetChildren()) do
					local replicated=gameFolder:FindFirstChild("Replicated")
					if replicated then
						for _,container in ipairs(replicated:GetChildren()) do
							if hasFootballName(container) then
								indexCandidate(container)
								for _,instance in ipairs(container:GetDescendants()) do
									indexCandidate(instance)
								end
							end
						end
					end
				end
			end
		end
	end

	local function closestFootball(rootPart)
		local best=nil
		local bestDistance=detectionRange
		for instance in pairs(ballCandidates) do
			if not instance.Parent then
				ballCandidates[instance]=nil
			elseif isFreeFootball(instance) and instance.AssemblyLinearVelocity.Magnitude>=minimumBallSpeed then
				local distance=(instance.Position-rootPart.Position).Magnitude
				if distance<=bestDistance then
					best=instance
					bestDistance=distance
				end
			end
		end
		return best
	end

	local function releaseAutoRotate()
		if controlledHumanoid and controlledHumanoid.Parent and previousAutoRotate~=nil then
			controlledHumanoid.AutoRotate=previousAutoRotate
		end
		controlledHumanoid=nil
		previousAutoRotate=nil
	end

	local function controlAutoRotate(humanoid)
		if controlledHumanoid==humanoid then
			humanoid.AutoRotate=false
			return
		end
		releaseAutoRotate()
		controlledHumanoid=humanoid
		previousAutoRotate=humanoid.AutoRotate
		humanoid.AutoRotate=false
	end

	local function syncToggle()
		if toggle then toggle.set(enabled) end
	end

	local function setEnabled(value)
		enabled=value and true or false
		state.autoSTEnabled=enabled
		if enabled and not ballIndexReady then
			rebuildBallIndex()
		elseif not enabled then
			trackedBall=nil
			nextBallScanAt=0
			lastBallSeenAt=0
			releaseAutoRotate()
		end
		syncToggle()
	end

	function api.SetAutoSTState(value)
		setEnabled(value)
	end

	function api.Refresh()
		syncToggle()
	end

	function api.Reset()
		setEnabled(false)
	end

	local controls=nil
	section,controls=makeSection(parent,6,"Auto ST","",{
		headerToggle={
			startState=false,
			onChange=setEnabled,
		},
	})
	toggle=controls and controls.toggle
	if not toggle then
		toggle=buildToggleRow(section,"Auto ST",false,setEnabled)
	end

	local function configuredKey()
		if not app.getAutoSTKey then return Enum.KeyCode.Unknown end
		return app.getAutoSTKey() or Enum.KeyCode.Unknown
	end

	local function matchesToggleInput(input)
		local key=configuredKey()
		return key~=Enum.KeyCode.Unknown and inputToBinding(input)==key
	end

	inputBegan=inputService.InputBegan:Connect(function(input,processed)
		if not processed and matchesToggleInput(input) then setEnabled(not enabled) end
	end)

	descendantAdded=workspace.DescendantAdded:Connect(indexCandidate)
	descendantRemoving=workspace.DescendantRemoving:Connect(function(instance)
		ballCandidates[instance]=nil
		if trackedBall==instance then trackedBall=nil end
	end)

	local function alignmentStep(dt)
		if destroyed or not enabled then return end
		local _,rootPart,humanoid=characterParts()
		if not(rootPart and humanoid) then
			releaseAutoRotate()
			return
		end

		local now=os.clock()
		if not(trackedBall and isFreeFootball(trackedBall)
			and trackedBall.AssemblyLinearVelocity.Magnitude>=minimumBallSpeed
			and (trackedBall.Position-rootPart.Position).Magnitude<=detectionRange) then
			trackedBall=nil
			if now>=nextBallScanAt then
				refreshKnownFootballCandidates()
				trackedBall=closestFootball(rootPart)
				nextBallScanAt=now+ballScanInterval
			end
		end

		if not trackedBall then
			if now-lastBallSeenAt>=lostBallGrace then releaseAutoRotate() end
			return
		end
		lastBallSeenAt=now

		local target=interceptPoint(rootPart,trackedBall)
		local center=rootPart.Position
		local direction=flat(target-center)
		if direction.Magnitude<=minimumTargetDistance then return end

		local desiredRight=direction.Unit
		local rightAnchor=center+desiredRight*rightAnchorOffset
		local anchorDirection=flat(rightAnchor-center)
		if anchorDirection.Magnitude<=0 then return end

		controlAutoRotate(humanoid)
		local currentRight=flat(rootPart.CFrame.RightVector)
		if currentRight.Magnitude<=1e-4 then return end
		local currentYaw=yawFromRight(currentRight.Unit)
		local targetYaw=yawFromRight(anchorDirection.Unit)
		local yawError=shortestAngle(currentYaw,targetYaw)
		if math.abs(yawError)<=yawDeadband then return end

		dt=math.min(math.max(tonumber(dt) or alignmentInterval,1/240),0.05)
		local step=math.clamp(yawError,-turnRate*dt,turnRate*dt)
		rootPart.CFrame=CFrame.new(center)*CFrame.Angles(0,currentYaw+step,0)
	end

	if scheduler and type(scheduler.Register)=="function" then
		schedulerRegistered=scheduler.Register("RenderStepped",schedulerJobId,alignmentInterval,function(elapsed)
			alignmentStep(elapsed)
		end)==true
	end
	if not schedulerRegistered then
		renderConnection=runService.RenderStepped:Connect(alignmentStep)
	end

	function api.Destroy()
		if destroyed then return end
		destroyed=true
		enabled=false
		trackedBall=nil
		releaseAutoRotate()
		if schedulerRegistered and scheduler and type(scheduler.Unregister)=="function" then
			scheduler.Unregister("RenderStepped",schedulerJobId)
		end
		safeDisconnect(inputBegan)
		safeDisconnect(descendantAdded)
		safeDisconnect(descendantRemoving)
		safeDisconnect(renderConnection)
		table.clear(ballCandidates)
		destroyControl(toggle)
	end

	return api
end

return autoST
