local qbAim={}

local players=game:GetService("Players")
local runService=game:GetService("RunService")
local inputService=game:GetService("UserInputService")
local contextActionService=game:GetService("ContextActionService")
local workspace=game:GetService("Workspace")
local replicatedStorage=game:GetService("ReplicatedStorage")

local localPlayer=players.LocalPlayer
local qbAimMath=rawget(getfenv(),"QBAimMathModule")

local ballGravity=28
local gravityVector=Vector3.new(0,-ballGravity,0)
local modelBallSpeed=95
local remotePower=100 -- remote power
local gameplayBallPower=modelBallSpeed
local squadsBallPower=modelBallSpeed
local defaultCatchHeight=14.2 -- jump peak
local catchHeight=defaultCatchHeight
local catchSolveYBias=0.00
local maxRunSpeed=21
local movingSpeedMin=5.0
local catchYTolerance=0.35
local targetMissTolerance=0.35
local nearTargetMissTolerance=0.05
local leadDelay=0.38
local leadDelayBaseline=0.38 -- lead time
local receiverHistoryMaxAge=0.30
local receiverAccelMax=48
local receiverConfidenceMin=0.30
local receiverConfidenceMax=1.00
local receiverStaleAfter=0.35
local qbLaunchYBias=0
local centerGroundFallbackMargin=2.50
local centerMaxAboveBall=8.00
local centerMaxYDelta=10.00
local qbHorizontalDeadzone=0.75
local qbHorizontalSpeedMax=24
local minTime,maxTime=0.35,6
local qbInheritance=0
local interceptBisectionSteps=12
local globalMinAngle=-5
local globalMaxAngle=55
local aimDistance=1000
local arcPreviewEnabled=true
local arcSettings={
	-- Receiver physics is normally 60 Hz, but rendered remote positions can update
	-- between physics samples. Cap the expensive solve at 120 Hz so the arc can
	-- follow those positions without scaling all the way up with 240+ FPS.
	UpdateInterval=1/120,
	AttachmentRoll=math.rad(90),
}
local trackSettings={
	ReceiverInterval=1/60,
}
local possessionSettleTime=0.12
local moveDirectionEpsilon=0.05
local movingConfirmSamples=2
local freezePreviewAfterRelease=true
local postThrowFreezeTime=0.75
local missingBallGraceTime=0.2
local arcMaxCurve=400
local catchMarkerEnabled=true
local catchMarkerSize=1.65
local landingInfoEnabled=false
local landingInfoSize=UDim2.new(0,220,0,78)
local landingInfoOffset=Vector3.new(0,3.2,0)
local circleTangentMargin=1e-6
local catchAnchorMaxOffset=10
local catchAnchorBlend=1.00
local playThrowAnimation=true
local throwAnimationName="UF_QuarterbackThrow"
local throwAnimationSpeed=1.35
-- Anim Time
local throwReleaseWait=0.26666666666666666
local throwRemoteLeadTime=0.00 -- fire wait
local livePreviewDuringThrow=false -- freeze arc
local fireThrowImmediately=false
local noAnimationThrowFallback=true
local noAnimationReleaseWait=0
local throwInputCooldown=0.85
local releaseConfirmTimeout=1.75
local releaseConfirmStableTime=0.08
local releaseTimingMidMax=0.12
local releaseTimingRadiusMin=1/60
local releaseTimingRadiusMax=0.06
local releaseTimingPingScale=0.25
local centerMaxReleaseDistance=12.00
local defaultThrowDelay=0.10
local throwDelay=defaultThrowDelay
-- Throw Steps
--   1. lock the wr
--   2. wait
--   3. send
local useLocalThrowFallback=false
local qbTargetHighlightName="QBAimTargetHighlight"
local espHighlightName="MyESPHighlight"
local validTeamIds={
	HomeTeam=true,
	AwayTeam=true,
	SquadTeam=true,
}

local function flat(v)
	return Vector3.new(v.X,0,v.Z)
end

local function unit(v,fallback)
	if v.Magnitude<1e-6 then
		return fallback or Vector3.new(1,0,0)
	end

	return v.Unit
end

local function clampMagnitude(v,maxMagnitude)
	if not v then
		return Vector3.zero
	end

	if v.Magnitude>maxMagnitude and maxMagnitude>0 then
		return v.Unit*maxMagnitude
	end

	return v
end

local function root(character)
	if not character then return nil end

	local primary=character.PrimaryPart
	if primary and primary:IsA("BasePart") then
		return primary
	end

	return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
end

local function rootMoveDirection(rootPart)
	local character=rootPart and rootPart.Parent
	local humanoid=character and character:FindFirstChildOfClass("Humanoid")
	local direction=humanoid and humanoid.MoveDirection or Vector3.zero
	return flat(direction)
end

local function isLocalRoot(rootPart)
	local character=rootPart and rootPart.Parent
	return character~=nil and (character==localPlayer.Character or character==workspace:FindFirstChild(localPlayer.Name))
end

local function localMoveKeyDown()
	local keys={
		Enum.KeyCode.W,
		Enum.KeyCode.A,
		Enum.KeyCode.S,
		Enum.KeyCode.D,
		Enum.KeyCode.Up,
		Enum.KeyCode.Down,
		Enum.KeyCode.Left,
		Enum.KeyCode.Right,
	}

	for _,keyCode in ipairs(keys) do
		local ok,isDown=pcall(inputService.IsKeyDown,inputService,keyCode)
		if ok and isDown then
			return true
		end
	end

	return false
end

local function rootHasMoveInput(rootPart)
	if isLocalRoot(rootPart) then
		return localMoveKeyDown()
	end

	return rootMoveDirection(rootPart).Magnitude>moveDirectionEpsilon
end

local function movementAwareRootVelocity(rootPart)
	local velocity=rootPart and rootPart.AssemblyLinearVelocity or Vector3.zero
	local horizontal=flat(velocity)

	if horizontal.Magnitude<qbHorizontalDeadzone then
		horizontal=Vector3.zero
	elseif horizontal.Magnitude>qbHorizontalSpeedMax then
		horizontal=horizontal.Unit*qbHorizontalSpeedMax
	end

	return Vector3.new(horizontal.X,velocity.Y,horizontal.Z)
end

local function routeSpeed(speed)
	-- Route Speed
	local clamped=math.clamp(speed or 0,0,maxRunSpeed)
	if clamped<movingSpeedMin then
		return 0
	end

	return maxRunSpeed
end

local function getModeKey(app)
	local miniGames=workspace:FindFirstChild("MiniGames")
	local miniCount=miniGames and #miniGames:GetChildren() or 0
	if miniCount>1 then
		return"mode2"
	elseif miniCount==1 then
		return"mode3"
	end

	local games=workspace:FindFirstChild("Games")
	if games and #games:GetChildren()>0 then
		return"mode1"
	end

	if app.getCurrentModeKey then
		local ok,modeKey=pcall(app.getCurrentModeKey)
		if ok and modeKey then
			return tostring(modeKey)
		end
	end

	local replicatedMiniGames=replicatedStorage:FindFirstChild("MiniGames")
	local replicatedMiniCount=replicatedMiniGames and #replicatedMiniGames:GetChildren() or 0
	if replicatedMiniCount>1 then
		return"mode2"
	elseif replicatedMiniCount==1 then
		return"mode3"
	end

	local replicatedGames=replicatedStorage:FindFirstChild("Games")
	if replicatedGames and #replicatedGames:GetChildren()>0 then
		return"mode1"
	end

	return"mode1"
end

local function getHeldBall()
	local character=workspace:FindFirstChild(localPlayer.Name) or localPlayer.Character
	local characterRoot=root(character)
	if not(character and characterRoot) then return nil end

	local function findBallPart(container,maxDistance)
		if not container then return nil end

		local function looksLikeFootball(inst)
			while inst and inst~=container do
				if tostring(inst.Name):lower():find("football",1,true) then
					return true
				end
				inst=inst.Parent
			end

			return false
		end

		local direct=container:FindFirstChild("Football")
		if direct then
			if direct:IsA("BasePart") and (direct.Position-characterRoot.Position).Magnitude<=maxDistance then
				return direct
			end

			if direct:IsA("Model") or direct:IsA("Folder") or direct:IsA("Tool") then
				for _,descendant in ipairs(direct:GetDescendants()) do
					if descendant:IsA("BasePart") and (descendant.Position-characterRoot.Position).Magnitude<=maxDistance then
						return descendant
					end
				end
			end
		end

		for _,descendant in ipairs(container:GetDescendants()) do
			if descendant:IsA("BasePart") and looksLikeFootball(descendant) and (descendant.Position-characterRoot.Position).Magnitude<=maxDistance then
				return descendant
			end
		end

		return nil
	end

	local ball=findBallPart(character,35)
	if ball then return ball end

	ball=findBallPart(character:FindFirstChild("GAMEOBJECTS"),35)
	if ball then return ball end

	if localPlayer.Character and localPlayer.Character~=character then
		local lpRoot=root(localPlayer.Character)
		if lpRoot then
			characterRoot=lpRoot
			ball=findBallPart(localPlayer.Character,35)
		end
	end

	if ball then return ball end

	return nil
end

local function getPlayerTeamID(player)
	local replicated=player and player:FindFirstChild("Replicated")
	local teamValue=replicated and replicated:FindFirstChild("TeamID")
	if not teamValue then return nil end

	if teamValue:IsA("StringValue") or teamValue:IsA("IntValue") or teamValue:IsA("NumberValue") then
		return tostring(teamValue.Value)
	end

	local ok,value=pcall(function()
		return teamValue.Value
	end)

	if ok then
		return tostring(value)
	end

	return nil
end

local function getPlayerTackleBox(player)
	local replicated=player and player:FindFirstChild("Replicated")
	local tackleBoxValue=replicated and replicated:FindFirstChild("TackleBox")
	if not tackleBoxValue then return nil end

	local ok,value=pcall(function()
		return tackleBoxValue.Value
	end)

	if ok and typeof(value)=="Instance" and value:IsA("BasePart") and value.Parent then
		return value
	end

	return nil
end

local function isValidGameTeamID(teamID)
	return teamID~=nil and validTeamIds[teamID]==true
end

local function isSameTeam(playerA,playerB)
	local teamA=getPlayerTeamID(playerA)
	local teamB=getPlayerTeamID(playerB)

	if not isValidGameTeamID(teamA) or not isValidGameTeamID(teamB) then
		return false
	end

	return teamA==teamB
end

local function getPlayerGameID(player)
	local replicated=player and player:FindFirstChild("Replicated")
	local gameID=replicated and replicated:FindFirstChild("GameID")
	if not gameID then return nil end

	local ok,value=pcall(function()
		return gameID.Value
	end)
	if not ok or value==nil then return nil end

	value=tostring(value)
	if value=="" then return nil end
	return value
end

local function localGameID()
	return getPlayerGameID(localPlayer)
end

local function folderReEvent(folder)
	if not folder then return nil end

	local replicated=folder:FindFirstChild("Replicated")
	local reEvent=folder:FindFirstChild("ReEvent") or (replicated and replicated:FindFirstChild("ReEvent"))
	if reEvent and reEvent:IsA("RemoteEvent") then
		return reEvent
	end

	return nil
end

local function getGameReEvent()
	local gameID=localGameID()
	if gameID then
		local workspaceGames=workspace:FindFirstChild("Games")
		local replicatedGames=replicatedStorage:FindFirstChild("Games")
		local reEvent=folderReEvent(workspaceGames and workspaceGames:FindFirstChild(gameID))
			or folderReEvent(replicatedGames and replicatedGames:FindFirstChild(gameID))

		if reEvent then
			return reEvent
		end
	end

	local games=workspace:FindFirstChild("Games")
	if games then
		for _,gameFolder in ipairs(games:GetChildren()) do
			local replicated=gameFolder:FindFirstChild("Replicated")
			local playersFolder=replicated and replicated:FindFirstChild("Players")
			local reEvent=folderReEvent(gameFolder)

			if playersFolder and playersFolder:FindFirstChild(localPlayer.Name) and reEvent and reEvent:IsA("RemoteEvent") then
				return reEvent
			end
		end
	end

	local replicatedGames=replicatedStorage:FindFirstChild("Games")
	if replicatedGames then
		for _,gameFolder in ipairs(replicatedGames:GetChildren()) do
			local reEvent=folderReEvent(gameFolder)

			if reEvent and reEvent:IsA("RemoteEvent") then
				return reEvent
			end
		end
	end

	return nil
end

local function getFirstChildFolder(container)
	if not container then return nil end

	for _,child in ipairs(container:GetChildren()) do
		if child:IsA("Model") or child:IsA("Folder") then
			return child
		end
	end

	return nil
end

local function getFirstGame()
	return getFirstChildFolder(workspace:FindFirstChild("Games"))
end

local function getFirstMiniGame()
	return getFirstChildFolder(workspace:FindFirstChild("MiniGames"))
end

local function localFolder()
	local gameID=localGameID()
	local miniGames=workspace:FindFirstChild("MiniGames")
	local games=workspace:FindFirstChild("Games")
	local gameFolder=gameID and ((miniGames and miniGames:FindFirstChild(gameID)) or (games and games:FindFirstChild(gameID)))

	if not gameFolder and miniGames and #miniGames:GetChildren()==1 then
		gameFolder=getFirstMiniGame()
	end

	if not gameFolder then
		gameFolder=getFirstGame()
	end

	return gameFolder and gameFolder:FindFirstChild("Local")
end

local function originalCenter()
	local folder=localFolder()
	return folder and folder:FindFirstChild("Center"),folder
end

local function attachmentCFrame(attachment)
	if not(attachment and attachment.Parent) then return nil end

	local ok,worldCFrame=pcall(function()
		return attachment.WorldCFrame
	end)
	if ok then return worldCFrame end

	if attachment.Parent:IsA("BasePart") then
		return attachment.Parent.CFrame*attachment.CFrame
	end

	return nil
end

local function setAttachmentCFrame(attachment,cframe)
	if not(attachment and attachment.Parent and typeof(cframe)=="CFrame") then return false end

	if attachment.Parent:IsA("BasePart") then
		attachment.CFrame=attachment.Parent.CFrame:ToObjectSpace(cframe)
		return true
	end

	local ok=pcall(function()
		attachment.WorldCFrame=cframe
	end)

	return ok
end

local function xAxisCFrame(position,xVector)
	xVector=unit(xVector)
	local up=Vector3.new(0,1,0)
	if math.abs(xVector:Dot(up))>0.96 then
		up=Vector3.new(0,0,1)
	end

	local z=unit(xVector:Cross(up),Vector3.new(0,0,1))
	local y=unit(z:Cross(xVector),Vector3.new(0,1,0))
	return CFrame.fromMatrix(position,xVector,y,z)
end

local function prepPreviewObject(object)
	if not object then return end

	local function prep(instance)
		if instance:IsA("BasePart") then
			instance.Anchored=true
			instance.CanCollide=false
			instance.CanTouch=false
			instance.CanQuery=false
		elseif instance:IsA("Beam") then
			instance.Enabled=false
		end
	end

	prep(object)
	for _,descendant in ipairs(object:GetDescendants()) do
		prep(descendant)
	end
end

local function getOnlyMiniGameFolder(container)
	if not container then return nil end

	local found=nil
	for _,child in ipairs(container:GetChildren()) do
		if child:IsA("Folder") or child:IsA("Model") then
			if found then
				return nil
			end
			found=child
		end
	end

	return found
end

local function getMiniGameReEvent(allowSingleFallback)
	local gameID=localGameID()
	if gameID then
		local replicatedMiniGames=replicatedStorage:FindFirstChild("MiniGames")
		local workspaceMiniGames=workspace:FindFirstChild("MiniGames")
		local miniGame=(replicatedMiniGames and replicatedMiniGames:FindFirstChild(gameID))
			or (workspaceMiniGames and workspaceMiniGames:FindFirstChild(gameID))
		local reEvent=folderReEvent(miniGame)
		if reEvent then
			return reEvent,miniGame
		end
	end

	if not allowSingleFallback then
		return nil,nil
	end

	local containers={}
	local replicatedMiniGames=replicatedStorage:FindFirstChild("MiniGames")
	local workspaceMiniGames=workspace:FindFirstChild("MiniGames")
	local workspaceGames=workspace:FindFirstChild("Games")
	local replicatedGames=replicatedStorage:FindFirstChild("Games")
	local function addContainer(container)
		if container then
			table.insert(containers,container)
		end
	end

	addContainer(replicatedMiniGames)
	addContainer(workspaceMiniGames)
	addContainer(workspaceGames and workspaceGames:FindFirstChild("MiniGames"))
	addContainer(replicatedGames and replicatedGames:FindFirstChild("MiniGames"))

	for _,container in ipairs(containers) do
		local miniGame=getOnlyMiniGameFolder(container)
		local reEvent=folderReEvent(miniGame)

		if reEvent then
			return reEvent,miniGame
		end
	end

	return nil,nil
end

qbAim._cachedMechanics=nil

function qbAim._getGlobalMechanics()
	local function valid(mechanics)
		return mechanics and (type(mechanics.PlayAnimation)=="function" or type(mechanics.UnequipFootball)=="function")
	end

	if valid(qbAim._cachedMechanics) then
		return qbAim._cachedMechanics
	end

	local globals=(typeof(getgenv)=="function" and getgenv()) or _G or {}
	if type(globals)=="table" then
		local mechanics=rawget(globals,"Mechanics")
		if valid(mechanics) then
			qbAim._cachedMechanics=mechanics
			return mechanics
		end

		local variables=rawget(globals,"Variables")
		if type(variables)=="table" and valid(variables.Mechanics) then
			qbAim._cachedMechanics=variables.Mechanics
			return variables.Mechanics
		end
	end

	local playerScripts=localPlayer:FindFirstChild("PlayerScripts")
	local clientMain=playerScripts and playerScripts:FindFirstChild("ClientMain")
	local utilities=clientMain and clientMain:FindFirstChild("Utilities")
	local variablesModule=utilities and utilities:FindFirstChild("Variables")
	if variablesModule then
		local ok,variables=pcall(require,variablesModule)
		if ok and type(variables)=="table" and valid(variables.Mechanics) then
			qbAim._cachedMechanics=variables.Mechanics
			return variables.Mechanics
		end
	end

	return nil
end

function qbAim._findThrowAnimation()
	local containers={
		replicatedStorage,
		localPlayer:FindFirstChild("PlayerScripts"),
		localPlayer.Character,
	}

	for _,container in ipairs(containers) do
		local animation=container and container:FindFirstChild(throwAnimationName,true)
		if animation and animation:IsA("Animation") and animation.AnimationId~="" then
			return animation
		end
	end

	return nil
end

function qbAim._playLocalThrowAnimation()
	local character=localPlayer.Character or workspace:FindFirstChild(localPlayer.Name)
	local humanoid=character and character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return false end

	local animation=qbAim._findThrowAnimation()
	if not animation then return false end

	local animator=humanoid:FindFirstChildOfClass("Animator")
	if not animator then
		animator=Instance.new("Animator")
		animator.Parent=humanoid
	end

	local ok,track=pcall(function()
		return animator:LoadAnimation(animation)
	end)

	if not(ok and track) then return false end

	pcall(function()
		track.Priority=Enum.AnimationPriority.Action
	end)
	track:Play(0.05,1,throwAnimationSpeed)
	return true
end

function qbAim._playPumpFakeAnimation(mechanics)
	if not mechanics or type(mechanics.Pumpfake)~="function" then
		return false
	end

	local ok=pcall(function()
		task.spawn(function()
			pcall(mechanics.Pumpfake,mechanics)
		end)
	end)

	return ok
end

function qbAim._playThrowAnimation()
	if not playThrowAnimation or not getHeldBall() then return false end

	local mechanics=qbAim._getGlobalMechanics()
	if mechanics and type(mechanics.PlayAnimation)=="function" then
		local ok,played=pcall(function()
			return mechanics:PlayAnimation(throwAnimationName,throwAnimationSpeed)
		end)
		if ok and played==true then
			return true,"mechanics"
		end
	end

	if qbAim._playPumpFakeAnimation(mechanics) then
		return true,"pumpfake"
	end

	if useLocalThrowFallback then
		local ok=qbAim._playLocalThrowAnimation()
		return ok,"local"
	end

	return false,"none"
end

function qbAim.new(app,parent)
	local make=app.New or app.make
	local colors=app.colors
	local style=app.style
	local safeDisconnect=app.safeDisconnect
	local inputToBinding=app.inputToBinding
	local makeSection=app.makeSection
	local buildToggleRow=app.buildToggleRow
	local buildSlider=app.buildSlider
	local state=app.State or {}
	local mathCore=app.QBAimMathModule or qbAimMath
	local services=app.Services or {}
	local playerCache=services.playerCacheApi or app.playerCacheApi
	local ballTracker=services.ballTrackerApi or app.ballTrackerApi
	local scheduler=app.schedulerApi or services.schedulerApi
	local api={}
	local enabled=false
	local trackedReceiver=nil
	local selectedRouteLock=nil
	local receiverData={}
	local qbOriginHistory={}
	local receiverTrackElapsed=0
	local preview={center=nil,c2=nil,c3=nil,c1=nil,beam=nil,beamDefaultColor=nil,orig=nil,visible=nil,ballMissingSince=nil}
	local previewFrozen=false
	local previewFreezeStarted=0
	local lastHeldBall=nil
	local possessionSettleUntil=0
	local throwInProgress=false
	local lastThrowAt=-math.huge
	local controllerThrowActionName="QBAim_ControllerThrow"
	local controllerToggleActionName="QBAim_ControllerToggle"
	local controllerThrowBinding=nil
	local controllerToggleBinding=nil
	local controllerThrowInputActive=false
	local controllerToggleInputActive=false
	local refreshControllerThrowBinding=function() end
	local highlightedCharacter=nil
	local connections={}
	local sectionBody=nil
	local sectionFrame=nil
	local enabledToggle=nil
	local teamFilterToggle=nil
	local arcToggle=nil
	local highlightToggle=nil
	local autoCalibrateButton=nil
	local leadDelayFrame=nil
	local leadDelayBox=nil
	local leadDelaySlider=nil
	local leadDelaySliderFill=nil
	local leadDelaySliderKnob=nil
	local leadDelaySliderControl=nil
	local leadDelayDragging=false
	local peakHeightFrame=nil
	local peakHeightBox=nil
	local peakHeightSlider=nil
	local peakHeightSliderFill=nil
	local peakHeightSliderKnob=nil
	local peakHeightSliderControl=nil
	local peakHeightDragging=false
	local throwDelaySliderControl=nil
	local leadDelayMin=0.00
	local leadDelayMax=1.50
	local peakHeightMin=8.00
	local peakHeightMax=20.00
	local throwDelayMin=0.00
	local throwDelayMax=0.50
	local qbOriginHistoryMaxAge=throwDelayMax+0.25
	local calibration={armed=false,startedAt=nil,ball=nil,missingSince=nil,animationTime=0}
	local calibrationAnimationConnection=nil
	local calibrationHumanoidConnection=nil
	local updateTargetHighlight=function() end
	local schedulerJobs={}

	if not mathCore then
		error("qb aim math missing")
	end
	if state.qbAimTeamFilter==nil then
		state.qbAimTeamFilter=true
	end

	if state.qbAimShowArc==nil then
		state.qbAimShowArc=true
	end

	if state.qbAimTargetHighlight==nil then
		state.qbAimTargetHighlight=true
	end

	if state.qbAimLeadDelay==nil then
		state.qbAimLeadDelay=leadDelay
	end

	if state.qbAimPeakHeight==nil then
		state.qbAimPeakHeight=catchHeight
	end

	if state.qbAimThrowDelay==nil then
		state.qbAimThrowDelay=defaultThrowDelay
	end

	leadDelay=math.clamp(tonumber(state.qbAimLeadDelay) or leadDelay,leadDelayMin,leadDelayMax)
	catchHeight=math.clamp(tonumber(state.qbAimPeakHeight) or catchHeight,peakHeightMin,peakHeightMax)
	state.qbAimPeakHeight=catchHeight
	throwDelay=math.clamp(tonumber(state.qbAimThrowDelay) or defaultThrowDelay,throwDelayMin,throwDelayMax)
	state.qbAimThrowDelay=throwDelay
	local function addConnection(connection)
		table.insert(connections,connection)
		return connection
	end

	local function addSchedulerJob(kind,id,interval,fn)
		if scheduler and type(scheduler.Register)=="function" and scheduler.Register(kind,id,interval,fn) then
			table.insert(schedulerJobs,{kind=kind,id=id})
			return true
		end

		return false
	end

	local function changed()
		if app.onChanged then
			pcall(app.onChanged,state)
		end
	end

	local function isAlive()
		return sectionFrame==nil or sectionFrame.Parent~=nil
	end

	local function currentPlayers()
		if playerCache and type(playerCache.getPlayers)=="function" then
			return playerCache:getPlayers()
		end

		return players:GetPlayers()
	end

	local function characterOf(player)
		if playerCache and type(playerCache.getCharacter)=="function" then
			return playerCache:getCharacter(player)
		end

		return player and player.Character or nil
	end

	local function rootOfPlayer(player)
		if playerCache and type(playerCache.getRoot)=="function" then
			return playerCache:getRoot(player)
		end

		return player and player.Character and root(player.Character) or nil
	end

	local function fieldGroundY(position)
		if typeof(position)~="Vector3" then return nil end

		local ignore={}
		for _,player in ipairs(currentPlayers()) do
			local character=characterOf(player)
			if character then
				ignore[#ignore+1]=character
			end
		end

		local params=RaycastParams.new()
		params.FilterType=Enum.RaycastFilterType.Exclude
		params.FilterDescendantsInstances=ignore
		params.IgnoreWater=true

		local result=workspace:Raycast(position,Vector3.new(0,-220,0),params)
		if result and result.Position.Y<=position.Y then
			return result.Position.Y
		end

		return nil
	end

	local function currentHeldBall()
		if ballTracker and type(ballTracker.getHeldBall)=="function" then
			local ball=ballTracker:getHeldBall(localPlayer,35)
			if ball then return ball end
		end

		return getHeldBall()
	end

	local function isAvailable()
		local modeKey=getModeKey(app)
		return modeKey=="mode1" or modeKey=="mode2" or modeKey=="mode3"
	end

	local function isCurrentSessionPlayer(player)
		local modeKey=getModeKey(app)
		if modeKey~="mode2" and modeKey~="mode3" then
			return true
		end

		local gameID=localGameID()
		return gameID~=nil and getPlayerGameID(player)==gameID
	end

	local function currentModeText()
		local modeKey=getModeKey(app)
		if modeKey=="mode1" then
			return"Gameplay"
		elseif modeKey=="mode2" then
			return"Park"
		elseif modeKey=="mode3" then
			return"Squads"
		end

		return tostring(modeKey)
	end

	local function setStatus(text)
		return text
	end

	local function setTargetText()
		updateTargetHighlight()
	end

	local function updateLeadDelayVisuals()
		if leadDelaySliderControl then
			leadDelaySliderControl.set(leadDelay)
		end

		if leadDelayBox then
			leadDelayBox.Text=string.format("%.2f",leadDelay)
		end

		if leadDelaySliderFill and leadDelaySliderKnob and leadDelaySlider then
			local alpha=(leadDelay-leadDelayMin)/math.max(leadDelayMax-leadDelayMin,0.001)
			alpha=math.clamp(alpha,0,1)
			leadDelaySliderFill.Size=UDim2.new(alpha,0,1,0)
			leadDelaySliderKnob.Position=UDim2.new(alpha,-5,0.5,-5)
		end
	end

	local function updatePeakHeightVisuals()
		if peakHeightSliderControl then
			peakHeightSliderControl.set(catchHeight)
		end

		if peakHeightBox then
			peakHeightBox.Text=string.format("%.2f",catchHeight)
		end

		if peakHeightSliderFill and peakHeightSliderKnob and peakHeightSlider then
			local alpha=(catchHeight-peakHeightMin)/math.max(peakHeightMax-peakHeightMin,0.001)
			alpha=math.clamp(alpha,0,1)
			peakHeightSliderFill.Size=UDim2.new(alpha,0,1,0)
			peakHeightSliderKnob.Position=UDim2.new(alpha,-5,0.5,-5)
		end
	end

	local function updateThrowDelayVisuals()
		if throwDelaySliderControl then
			throwDelaySliderControl.set(throwDelay)
		end
	end

	local function updateCalibrationButton(text)
		if autoCalibrateButton then
			autoCalibrateButton.Text=text or (calibration.armed and "Throw once..." or "Auto Calibrate")
		end
	end

	local function setLeadDelay(value,showStatus)
		local numberValue=tonumber(value)
		if not numberValue then
			updateLeadDelayVisuals()
			return false
		end

		leadDelay=math.clamp(numberValue,leadDelayMin,leadDelayMax)
		state.qbAimLeadDelay=leadDelay
		updateLeadDelayVisuals()
		if showStatus then
			setStatus(string.format("lead %.2fs",leadDelay))
			changed()
		end
		return true
	end

	local function setThrowDelay(value,showStatus)
		local numberValue=tonumber(value)
		if not numberValue then
			updateThrowDelayVisuals()
			return false
		end

		throwDelay=math.clamp(numberValue,throwDelayMin,throwDelayMax)
		state.qbAimThrowDelay=throwDelay
		updateThrowDelayVisuals()
		if showStatus then
			setStatus(string.format("throw delay %.2fs",throwDelay))
			changed()
		end
		return true
	end

	local function clearCalibration(keepArmed)
		calibration.armed=keepArmed==true
		calibration.startedAt=nil
		calibration.ball=nil
		calibration.missingSince=nil
		calibration.animationTime=0
		updateCalibrationButton()
	end

	local function startCalibration(startedAt,ball,animationTime)
		if not calibration.armed or calibration.startedAt or not ball then return false end
		calibration.startedAt=startedAt or os.clock()
		calibration.ball=ball
		calibration.missingSince=nil
		calibration.animationTime=math.max(0,tonumber(animationTime) or 0)
		updateCalibrationButton("Calibrating...")
		return true
	end

	local function isThrowAnimation(track)
		local animation=track and track.Animation
		local name=string.lower(tostring((animation and animation.Name) or (track and track.Name) or ""))
		if name==string.lower(throwAnimationName) or string.find(name,"throw",1,true) then
			return true
		end

		local configured=qbAim._findThrowAnimation()
		return configured and animation and configured.AnimationId~="" and animation.AnimationId==configured.AnimationId
	end

	local function bindCalibrationAnimator(character)
		safeDisconnect(calibrationAnimationConnection)
		safeDisconnect(calibrationHumanoidConnection)
		calibrationAnimationConnection=nil
		calibrationHumanoidConnection=nil

		local humanoid=character and character:FindFirstChildOfClass("Humanoid")
		if not humanoid then return end

		local function bindAnimator(animator)
			safeDisconnect(calibrationAnimationConnection)
			calibrationAnimationConnection=animator.AnimationPlayed:Connect(function(track)
				if calibration.armed and isThrowAnimation(track) then
					startCalibration(os.clock(),currentHeldBall(),throwReleaseWait)
				end
			end)
		end

		local animator=humanoid:FindFirstChildOfClass("Animator")
		if animator then
			bindAnimator(animator)
		end
		calibrationHumanoidConnection=humanoid.ChildAdded:Connect(function(child)
			if child:IsA("Animator") then
				bindAnimator(child)
			end
		end)
	end

	local function calibrationStep()
		if not(calibration.armed and calibration.startedAt) then return end

		local now=os.clock()
		if now-calibration.startedAt>releaseConfirmTimeout then
			clearCalibration(true)
			updateCalibrationButton("Throw again...")
			return
		end

		if currentHeldBall()==calibration.ball then
			calibration.missingSince=nil
			return
		end

		calibration.missingSince=calibration.missingSince or now
		if now-calibration.missingSince<releaseConfirmStableTime then return end

		local measured=calibration.missingSince-calibration.startedAt-calibration.animationTime
		clearCalibration(false)
		setThrowDelay(measured,true)
		updateCalibrationButton(string.format("Calibrated %.2fs",throwDelay))
	end

	function api.AutoCalibrate()
		if calibration.armed then
			clearCalibration(false)
			return false
		end

		clearCalibration(true)
		return true
	end

	local function setPeakHeight(value,showStatus)
		local numberValue=tonumber(value)
		if not numberValue then
			updatePeakHeightVisuals()
			return false
		end

		catchHeight=math.clamp(numberValue,peakHeightMin,peakHeightMax)
		state.qbAimPeakHeight=catchHeight
		updatePeakHeightVisuals()
		if showStatus then
			changed()
		end
		return true
	end

	local function clampStyleByte(value,fallback)
		return math.clamp(math.floor((tonumber(value) or fallback or 0)+0.5),0,255)
	end

	local function clampStyleAlpha(value,fallback)
		local number=tonumber(value)
		if number==nil then
			return fallback
		end

		return math.clamp(number,0,1)
	end

	local function qbHighlightColor(channel,fallback)
		if not(style and style.QBAimHighlightCustomColor==true) then
			return fallback
		end

		local prefix="QBAimHighlight"..channel
		return Color3.fromRGB(
			clampStyleByte(style[prefix.."R"],fallback and fallback.R*255 or 255),
			clampStyleByte(style[prefix.."G"],fallback and fallback.G*255 or 255),
			clampStyleByte(style[prefix.."B"],fallback and fallback.B*255 or 255)
		)
	end

	local function qbHighlightStyle()
		local fallbackFill=colors.blue or colors.accent or Color3.fromRGB(21,103,251)
		local fallbackOutline=colors.accent or colors.blue or Color3.fromRGB(32,202,106)
		return{
			fill=qbHighlightColor("Fill",fallbackFill),
			outline=qbHighlightColor("Outline",fallbackOutline),
			fillTransparency=clampStyleAlpha(style and style.QBAimHighlightFillTransparency,0.65),
			outlineTransparency=clampStyleAlpha(style and style.QBAimHighlightOutlineTransparency,0),
		}
	end

	local function setLeadDelayFromScreenX(screenX,showStatus)
		if not leadDelaySlider then return false end
		local pos=leadDelaySlider.AbsolutePosition.X
		local size=math.max(leadDelaySlider.AbsoluteSize.X,1)
		local alpha=math.clamp((screenX-pos)/size,0,1)
		return setLeadDelay(leadDelayMin+(leadDelayMax-leadDelayMin)*alpha,showStatus)
	end

	local function setPeakHeightFromScreenX(screenX,showStatus)
		if not peakHeightSlider then return false end
		local pos=peakHeightSlider.AbsolutePosition.X
		local size=math.max(peakHeightSlider.AbsoluteSize.X,1)
		local alpha=math.clamp((screenX-pos)/size,0,1)
		return setPeakHeight(peakHeightMin+(peakHeightMax-peakHeightMin)*alpha,showStatus)
	end

	local function canTargetReceiver(player)
		if not player or player==localPlayer then
			return false
		end

		if not isCurrentSessionPlayer(player) then
			return false
		end

		if state.qbAimTeamFilter==false then
			return true
		end

		return isSameTeam(player,localPlayer)
	end

	local function getQBAimHighlight(character)
		local highlight=character and character:FindFirstChild(qbTargetHighlightName)
		if highlight and highlight:IsA("Highlight") then
			return highlight
		end

		return nil
	end

	local function ensureQBAimHighlight(character)
		local highlight=getQBAimHighlight(character)
		if highlight then return highlight end

		highlight=Instance.new("Highlight")
		highlight.Name=qbTargetHighlightName
		highlight.Parent=character
		return highlight
	end

	local function destroyQBAimHighlight(character)
		local highlight=getQBAimHighlight(character)
		if highlight then
			highlight:Destroy()
		end
	end

	local function destroyESPHighlight(character)
		local highlight=character and character:FindFirstChild(espHighlightName)
		if highlight and highlight:IsA("Highlight") then
			highlight:Destroy()
		end
	end

	local function clearTargetHighlights()
		for _,player in ipairs(currentPlayers()) do
			local character=characterOf(player)
			if character then
				destroyQBAimHighlight(character)
			end
		end

		highlightedCharacter=nil
	end

	updateTargetHighlight=function()
		local character=enabled and state.qbAimTargetHighlight~=false and trackedReceiver and characterOf(trackedReceiver) or nil
		if not(character and canTargetReceiver(trackedReceiver)) then
			if highlightedCharacter then
				destroyQBAimHighlight(highlightedCharacter)
				highlightedCharacter=nil
			end
			return
		end

		if highlightedCharacter and highlightedCharacter~=character then
			destroyQBAimHighlight(highlightedCharacter)
		end

		highlightedCharacter=character
		destroyESPHighlight(character)
		local highlight=ensureQBAimHighlight(character)
		local style=qbHighlightStyle()
		highlight.Adornee=character
		highlight.Enabled=true
		highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
		highlight.FillTransparency=style.fillTransparency
		highlight.OutlineTransparency=style.outlineTransparency
		highlight.FillColor=style.fill
		highlight.OutlineColor=style.outline
	end

	local function seedReceiverData(player,receiverRoot,now)
		if not(player and receiverRoot) then return nil end
		now=now or os.clock()
		local data={
			pos=receiverRoot.Position,
			vel=Vector3.zero,
			rawVel=Vector3.zero,
			accel=Vector3.zero,
			confidence=receiverConfidenceMin,
			lastSeen=now,
			t=now,
			vh={},
			ph={{t=now,pos=receiverRoot.Position}},
			sdir=nil,
			sspeed=0,
			stime=0,
			movingSamples=0,
			seededAt=now,
			src="seeded",
		}

		receiverData[player]=data
		return data
	end

	local function ensureReceiverData(player,receiverRoot)
		if receiverData[player] or not receiverRoot then
			return receiverData[player]
		end

		return seedReceiverData(player,receiverRoot)
	end

	local function reseedReceiverTracking(now)
		now=now or os.clock()
		for _,player in ipairs(currentPlayers()) do
			if canTargetReceiver(player) then
				local receiverRoot=rootOfPlayer(player)
				if receiverRoot then
					seedReceiverData(player,receiverRoot,now)
				end
			end
		end

		receiverTrackElapsed=trackSettings.ReceiverInterval
	end

	local function noteHeldBallState(ball,now)
		now=now or os.clock()
		if not ball then
			if lastHeldBall then table.clear(qbOriginHistory) end
			lastHeldBall=nil
			return
		end

		if ball==lastHeldBall then
			return
		end

		lastHeldBall=ball
		table.clear(qbOriginHistory)
		possessionSettleUntil=now+possessionSettleTime
		selectedRouteLock=nil
		previewFrozen=false
		preview.ballMissingSince=nil
		reseedReceiverTracking(now)
	end

	local function configuredBinding(getterName,fallback)
		local getter=app[getterName]
		if type(getter)=="function" then
			local ok,binding=pcall(getter)
			if ok and binding~=nil then
				return binding
			end
		end

		return fallback
	end

	local function bindingMatches(getterName,input,fallback)
		local binding=configuredBinding(getterName,fallback)
		if binding==nil or binding==Enum.KeyCode.Unknown then
			return false
		end

		local incoming=inputToBinding(input)
		return incoming~=nil and incoming==binding
	end

	local function syncControls()
		if not isAvailable() then
			enabled=false
			trackedReceiver=nil
			selectedRouteLock=nil
			if highlightedCharacter then
				clearTargetHighlights()
			end
		elseif trackedReceiver and not canTargetReceiver(trackedReceiver) then
			trackedReceiver=nil
			selectedRouteLock=nil
			previewFrozen=false
			preview.ballMissingSince=nil
		end

		if enabledToggle then
			enabledToggle.set(enabled)
		end

		if teamFilterToggle then
			teamFilterToggle.set(state.qbAimTeamFilter~=false)
		end

		if arcToggle then
			arcToggle.set(state.qbAimShowArc~=false)
		end

		if highlightToggle then
			highlightToggle.set(state.qbAimTargetHighlight~=false)
		end

		updateLeadDelayVisuals()
		updatePeakHeightVisuals()
		updateThrowDelayVisuals()
		setTargetText()

		if not isAvailable() then
			setStatus(currentModeText().." unsupported")
		else
			setStatus("")
		end
	end

	local function c2Position()
		-- Real C2
		local center=originalCenter()
		local c2=center and center:FindFirstChild("C2",true)
		local cframeValue=c2 and attachmentCFrame(c2)
		return cframeValue and cframeValue.Position
	end

	local function setPreviewCenterVisible(visible)
		local center=preview.center
		if not(center and center.Parent) then return end
		if preview.visible==visible then return end
		preview.visible=visible

		local function apply(instance)
			if instance:IsA("BasePart") then
				if instance:GetAttribute("QBAimPreviewTransparency")==nil then
					instance:SetAttribute("QBAimPreviewTransparency",instance.Transparency)
				end
				instance.Transparency=visible and (instance:GetAttribute("QBAimPreviewTransparency") or 0) or 1
			elseif instance:IsA("Beam") then
				instance.Enabled=visible and instance==preview.beam
			elseif instance:IsA("Attachment") then
				pcall(function()
					instance.Visible=visible
				end)
			end
		end

		apply(center)
		for _,descendant in ipairs(center:GetDescendants()) do
			apply(descendant)
		end
	end

	local function destroyPreviewCenter()
		if preview.center and preview.center.Parent then
			preview.center:Destroy()
		end

		preview.center=nil
		preview.c1=nil
		preview.c2=nil
		preview.c3=nil
		preview.beam=nil
		preview.beamDefaultColor=nil
		preview.orig=nil
		preview.visible=nil
	end

	local function bindArcRigParts(center)
		preview.c2=center:FindFirstChild("C2",true)
		preview.c3=center:FindFirstChild("C3",true)
		if not(preview.c2 and preview.c3) then return false end

		preview.c1=center:FindFirstChild("C1",true)
		if not preview.c1 then
			preview.c1=Instance.new("Attachment")
			preview.c1.Name="C1"
			preview.c1.Parent=preview.c2.Parent
		end

		preview.beam=nil
		for _,descendant in ipairs(center:GetDescendants()) do
			if descendant:IsA("Beam") then
				if not preview.beam then
					preview.beam=descendant
				end
				descendant.Enabled=false
			end
		end

		if preview.beam then
			preview.beam.Attachment0=preview.c2
			preview.beam.Attachment1=preview.c3
			if not preview.beamDefaultColor then
				preview.beamDefaultColor=preview.beam.Color
			end
			preview.beam.Enabled=state.qbAimShowArc~=false
		end

		return preview.beam~=nil
	end

	local function arcRig()
		local original,folder=originalCenter()
		if original and folder and (not preview.center or preview.orig~=original or not preview.center.Parent) then
			destroyPreviewCenter()
			preview.center=original:Clone()
			preview.center.Name="ClonedCenter"
			preview.center.Parent=folder
			prepPreviewObject(preview.center)
			preview.orig=original
		end

		local center=preview.center
		if not(center and center.Parent) then return nil end

		local bound=preview.c2 and preview.c2.Parent
			and preview.c1 and preview.c1.Parent
			and preview.c3 and preview.c3.Parent
			and preview.beam and preview.beam.Parent
		if not bound and not bindArcRigParts(center) then return nil end

		setPreviewCenterVisible(state.qbAimShowArc~=false)
		return preview.c2,preview.c1,preview.c3,preview.beam
	end

	--[[
		Throw Math

		ball(t)=origin+velocity*t+0.5*g*t^2
		wr(t)=wrStart+wrVel*(t+lead)

		route label = text only
	]]

	local function historyVector(data,now)
		if not(data and data.ph and #data.ph>=2) then
			return nil,0,0
		end

		local latest=data.ph[#data.ph]
		local earliest=data.ph[1]
		local dt=latest.t-earliest.t
		if dt<=0 then
			return nil,0,0
		end

		local movement=flat(latest.pos-earliest.pos)
		local distance=movement.Magnitude
		local speed=distance/dt
		return movement,speed,distance
	end

	local function leastSquaresVelocity(data,now)
		-- Old Check
		if not(data and data.ph and #data.ph>=2) then
			return nil,0,0
		end

		local latest=data.ph[#data.ph]
		local earliest=data.ph[1]
		for i=#data.ph,1,-1 do
			if now-data.ph[i].t>=receiverHistoryMaxAge then
				earliest=data.ph[i]
				break
			end
		end

		local dt=latest.t-earliest.t
		if dt<=0 then
			return nil,0,0
		end

		local velocity=clampMagnitude(flat(latest.pos-earliest.pos)/dt,maxRunSpeed)
		local quality=math.clamp(dt/math.max(receiverHistoryMaxAge,0.05),0,1)
		return velocity,quality,dt
	end

	local function currentReceiverRawVelocity(data,receiverRoot,fallbackVelocity)
		local now=os.clock()
		local assembly=receiverRoot and receiverRoot.AssemblyLinearVelocity or nil
		local assemblyXZ=assembly and flat(assembly) or Vector3.zero
		local rawXZ=flat((data and data.rawVel) or fallbackVelocity or Vector3.zero)
		local storedXZ=flat((data and data.vel) or Vector3.zero)
		local canTrustAssembly=receiverRoot and rootHasMoveInput(receiverRoot) and now>=possessionSettleUntil

		-- Velocity Source
		local velocity=Vector3.zero
		local source="none"
		if canTrustAssembly and assemblyXZ.Magnitude>=movingSpeedMin then
			velocity=assemblyXZ
			source="assembly"
		elseif rawXZ.Magnitude>=movingSpeedMin then
			velocity=rawXZ
			source="raw_delta"
		elseif storedXZ.Magnitude>=movingSpeedMin then
			velocity=storedXZ
			source="stored"
		end

		if velocity.Magnitude<movingSpeedMin then
			return Vector3.zero,"stopped",0
		end

		return clampMagnitude(velocity,maxRunSpeed),source,velocity.Magnitude
	end

	local function predictionState(data,receiverPosition,fallbackVelocity,receiverRoot)
		local now=os.clock()
		local rawVelocity,source,rawSpeed=currentReceiverRawVelocity(data,receiverRoot,fallbackVelocity)
		local routeVelocity=Vector3.zero
		if rawVelocity.Magnitude>=movingSpeedMin then
			routeVelocity=rawVelocity.Unit*maxRunSpeed
		end

		local acceleration=clampMagnitude(flat(data and data.accel or Vector3.zero),receiverAccelMax)
		local sampleAge=data and data.lastSeen and math.max(now-data.lastSeen,0) or receiverStaleAfter
		local moving=routeVelocity.Magnitude>0
		local confidence=moving and 1 or receiverConfidenceMin

		return{
			position=receiverPosition,
			velocity=routeVelocity,
			rawVelocity=rawVelocity,
			rawSpeed=rawSpeed,
			acceleration=acceleration,
			confidence=confidence,
			lsQuality=0,
			sampleAge=sampleAge,
			source=source,
		}
	end

	local function updateStable(data)
		-- Old Route Vars
		local velocity,source,rawSpeed=currentReceiverRawVelocity(data,nil,data and data.rawVel or Vector3.zero)
		if velocity.Magnitude<movingSpeedMin then
			if data then
				data.sdir=nil
				data.sspeed=0
				data.src="stopped"
			end
			return nil,0,"stopped"
		end

		local direction=velocity.Unit
		if data then
			data.sdir=direction
			data.sspeed=maxRunSpeed
			data.stime=os.clock()
			data.src=source
		end
		return direction,maxRunSpeed,source
	end

	local function movementShape(origin,position,velocity)
		-- Route Label
		local velocityXZ=flat(velocity or Vector3.zero)
		local speed=velocityXZ.Magnitude
		if speed<0.1 then
			return"standing"
		end

		local losVector=flat(position-origin)
		local losDir=unit(losVector,velocityXZ.Unit)
		local signedShare=math.clamp(velocityXZ:Dot(losDir)/math.max(speed,1e-6),-1,1)
		local crossShare=math.sqrt(math.max(1-signedShare*signedShare,0))

		if signedShare>0.70 then
			return"range_opening"
		elseif signedShare<-0.70 then
			return"range_closing"
		elseif crossShare>0.70 then
			return"range_crossing"
		end

		return"range_mixed"
	end

	local function lockRoute(receiver)
		local receiverRoot=rootOfPlayer(receiver)
		local data=receiverData[receiver]
		if not(receiverRoot and data) then return nil end

		local velocity,source=currentReceiverRawVelocity(data,receiverRoot,receiverRoot.AssemblyLinearVelocity)
		if velocity.Magnitude<movingSpeedMin then
			return nil
		end

		local ball=currentHeldBall()
		local characterRoot=rootOfPlayer(localPlayer)
		local qbPosition=(ball and ball.Position) or (characterRoot and characterRoot.Position) or receiverRoot.Position
		local routeVelocity=velocity.Unit*maxRunSpeed

		return{
			player=receiver,
			createdAt=os.clock(),
			routeDir=routeVelocity.Unit,
			routeSpeed=maxRunSpeed,
			routeVelocity=routeVelocity,
			stableSource=source,
			shape=movementShape(qbPosition,receiverRoot.Position,routeVelocity),
		}
	end

	local function routeVelocity(receiver,data,originPosition,receiverRoot,routeLock)
		local state=predictionState(data,receiverRoot.Position,data and data.rawVel or Vector3.zero,receiverRoot)
		local velocity=state.velocity or Vector3.zero

		if velocity.Magnitude<movingSpeedMin then
			state.routeVelocity=Vector3.zero
			return Vector3.zero,"standing",state
		end

		-- H keeps the wr
		velocity=velocity.Unit*maxRunSpeed
		state.routeVelocity=velocity
		return velocity,movementShape(originPosition,receiverRoot.Position,velocity),state
	end

	local function receiverCatchAnchor(receiver,receiverRoot)
		if not receiverRoot then
			return nil,"none"
		end

		local rootPosition=receiverRoot.Position
		local tackleBox=getPlayerTackleBox(receiver)
		if tackleBox then
			local boxPosition=tackleBox.Position
			local offset=boxPosition-rootPosition
			if flat(offset).Magnitude<=catchAnchorMaxOffset and math.abs(offset.Y)<=catchAnchorMaxOffset then
				local blended=rootPosition:Lerp(boxPosition,catchAnchorBlend)
				return Vector3.new(blended.X,rootPosition.Y,blended.Z),"tackle_box"
			end
		end

		return rootPosition,"root"
	end

	local function origin(qbRoot,ball)
		local fallbackPosition=ball and ball.Position or qbRoot.Position
		local c2Pos=c2Position()
		local basePosition=fallbackPosition

		if c2Pos then
			local referencePosition=fallbackPosition
			local yValid=c2Pos.Y>=referencePosition.Y-centerGroundFallbackMargin
				and c2Pos.Y<=referencePosition.Y+centerMaxAboveBall
				and math.abs(c2Pos.Y-referencePosition.Y)<=centerMaxYDelta
			local distanceValid=(c2Pos-referencePosition).Magnitude<=centerMaxReleaseDistance

			if yValid and distanceValid then
				basePosition=c2Pos
			elseif yValid then
				basePosition=Vector3.new(fallbackPosition.X,c2Pos.Y,fallbackPosition.Z)
			end
		end

		return Vector3.new(basePosition.X,basePosition.Y+qbLaunchYBias,basePosition.Z)
	end

	local function recordQBOrigin(now,qbRoot,ball)
		if not qbRoot then return nil end
		now=now or os.clock()
		local position=origin(qbRoot,ball)
		local latest=qbOriginHistory[#qbOriginHistory]
		if latest and now-latest.t<=1e-5 then
			latest.t=now
			latest.pos=position
		else
			qbOriginHistory[#qbOriginHistory+1]={t=now,pos=position}
		end

		while #qbOriginHistory>2 and now-qbOriginHistory[2].t>qbOriginHistoryMaxAge do
			table.remove(qbOriginHistory,1)
		end
		return position
	end

	local function delayedQBOrigin(now,delay,currentPosition)
		delay=math.clamp(tonumber(delay) or 0,throwDelayMin,throwDelayMax)
		if delay<=0 or #qbOriginHistory==0 then
			return currentPosition
		end

		local targetTime=now-delay
		local first=qbOriginHistory[1]
		if targetTime<=first.t then return first.pos end

		for index=2,#qbOriginHistory do
			local current=qbOriginHistory[index]
			if current.t>=targetTime then
				local previous=qbOriginHistory[index-1]
				local span=math.max(current.t-previous.t,1e-6)
				return previous.pos:Lerp(current.pos,math.clamp((targetTime-previous.t)/span,0,1))
			end
		end

		return qbOriginHistory[#qbOriginHistory].pos
	end

	local function ensureC1Marker()
		if not catchMarkerEnabled then return nil end

		local _,folder=originalCenter()
		if not folder then return nil end

		local marker=preview.c1Marker
		if marker and marker.Parent then
			return marker
		end

		marker=folder:FindFirstChild("PreviewC1Marker")
		if not(marker and marker:IsA("BasePart")) then
			marker=Instance.new("Part")
			marker.Name="PreviewC1Marker"
			marker.Shape=Enum.PartType.Ball
			marker.Size=Vector3.new(catchMarkerSize,catchMarkerSize,catchMarkerSize)
			marker.Anchored=true
			marker.CanCollide=false
			marker.CanTouch=false
			marker.CanQuery=false
			marker.Material=Enum.Material.Neon
			marker.Color=Color3.fromRGB(0,255,140)
			marker.Parent=folder
		end

		marker.Transparency=0

		local billboard=marker:FindFirstChild("C1Label")
		if not billboard then
			billboard=Instance.new("BillboardGui")
			billboard.Name="C1Label"
			billboard.Size=UDim2.new(0,60,0,24)
			billboard.StudsOffset=Vector3.new(0,2.2,0)
			billboard.AlwaysOnTop=true
			billboard.Adornee=marker
			billboard.Parent=marker

			local label=Instance.new("TextLabel")
			label.Name="Text"
			label.BackgroundTransparency=1
			label.Size=UDim2.new(1,0,1,0)
			label.Text="C1"
			label.Font=Enum.Font.GothamBold
			label.TextSize=18
			label.TextColor3=Color3.fromRGB(0,255,140)
			label.TextStrokeTransparency=0.25
			label.Parent=billboard
		else
			billboard.Enabled=true
			billboard.Adornee=marker
		end

		preview.c1Marker=marker
		return marker
	end

	local function cleanupC3InfoGui()
		local anchor=preview.c3InfoAnchor
		if anchor and anchor.Parent then
			anchor:Destroy()
		end

		preview.c3InfoAnchor=nil

		local _,folder=originalCenter()
		if folder then
			local existing=folder:FindFirstChild("PreviewC3InfoAnchor")
			if existing then
				existing:Destroy()
			end
		end
	end

	local function ensureC3InfoGui()
		if not landingInfoEnabled then return nil,nil end

		local _,folder=originalCenter()
		if not folder then return nil,nil end

		local anchor=preview.c3InfoAnchor
		if not(anchor and anchor.Parent) then
			anchor=folder:FindFirstChild("PreviewC3InfoAnchor")
			if not(anchor and anchor:IsA("BasePart")) then
				anchor=Instance.new("Part")
				anchor.Name="PreviewC3InfoAnchor"
				anchor.Size=Vector3.new(0.25,0.25,0.25)
				anchor.Transparency=1
				anchor.Anchored=true
				anchor.CanCollide=false
				anchor.CanTouch=false
				anchor.CanQuery=false
				anchor.Parent=folder
			end
			preview.c3InfoAnchor=anchor
		end

		local billboard=anchor:FindFirstChild("C3InfoGui")
		if not billboard then
			billboard=Instance.new("BillboardGui")
			billboard.Name="C3InfoGui"
			billboard.Size=landingInfoSize
			billboard.StudsOffset=landingInfoOffset
			billboard.AlwaysOnTop=true
			billboard.Adornee=anchor
			billboard.Parent=anchor

			local frame=Instance.new("Frame")
			frame.Name="Panel"
			frame.BackgroundColor3=Color3.fromRGB(10,12,16)
			frame.BackgroundTransparency=0.18
			frame.BorderSizePixel=0
			frame.Size=UDim2.new(1,0,1,0)
			frame.Parent=billboard

			local corner=Instance.new("UICorner")
			corner.CornerRadius=UDim.new(0,0)
			corner.Parent=frame

			local stroke=Instance.new("UIStroke")
			stroke.Color=Color3.fromRGB(255,170,0)
			stroke.Thickness=1.5
			stroke.Transparency=0.1
			stroke.Parent=frame

			local label=Instance.new("TextLabel")
			label.Name="Text"
			label.BackgroundTransparency=1
			label.Position=UDim2.new(0,8,0,4)
			label.Size=UDim2.new(1,-16,1,-8)
			label.Font=Enum.Font.GothamMedium
			label.TextSize=12
			label.TextColor3=Color3.fromRGB(255,235,205)
			label.TextStrokeTransparency=0.85
			label.TextXAlignment=Enum.TextXAlignment.Center
			label.TextYAlignment=Enum.TextYAlignment.Center
			label.Parent=frame
		else
			billboard.Enabled=true
			billboard.Adornee=anchor
		end

		local label=billboard:FindFirstChild("Panel") and billboard.Panel:FindFirstChild("Text")
		if billboard then
			billboard.Size=landingInfoSize
			billboard.StudsOffset=landingInfoOffset
		end
		if label then
			label.TextXAlignment=Enum.TextXAlignment.Center
			label.TextYAlignment=Enum.TextYAlignment.Center
		end
		return anchor,label
	end

	local function updateC1AndC3Info(plan,c1Pos,c3Pos)
		if not plan then return end

		local marker=ensureC1Marker()
		if marker and typeof(c1Pos)=="Vector3" then
			marker.CFrame=CFrame.new(c1Pos)
			marker.Transparency=0
		end

	end

	local function hideC1AndC3Info()
		if preview.c1Marker and preview.c1Marker.Parent then
			preview.c1Marker.Transparency=1
			local billboard=preview.c1Marker:FindFirstChild("C1Label")
			if billboard then billboard.Enabled=false end
		end

		cleanupC3InfoGui()
	end

	local function hideQBTrailPreview()
		if preview.beam and preview.beam.Parent then
			pcall(function()
				preview.beam.Enabled=false
				preview.beam.Color=preview.beamDefaultColor or preview.beam.Color
			end)
		end

		if preview.center and preview.center.Parent then
			for _,descendant in ipairs(preview.center:GetDescendants()) do
				if descendant:IsA("Beam") then
					descendant.Enabled=false
				end
			end
			setPreviewCenterVisible(false)
		end

		hideC1AndC3Info()
	end

	local function clearPreviewVisuals(destroyCenter)
		previewFrozen=false
		preview.ballMissingSince=nil
		hideQBTrailPreview()

		if destroyCenter then
			destroyPreviewCenter()
		end
	end

	local function previewPlan(plan)
		if not(arcPreviewEnabled and plan and state.qbAimShowArc~=false) then
			if state.qbAimShowArc==false then
				hideQBTrailPreview()
			end

			return
		end

		preview.ballMissingSince=nil
		local c2,c1,c3,beam=arcRig()
		if not(c2 and c1 and c3 and beam) then return end

		local startPoint=plan.origin
		local catchPoint=plan.target or plan.c1Point
		local catchTime=plan.time
		local endPoint=plan.landing or catchPoint
		local previewTime=plan.landingTime or catchTime
		if not(startPoint and catchPoint and catchTime and endPoint and previewTime) then return end

		local catchVelocity=plan.velocity+gravityVector*catchTime
		local endVelocity=plan.velocity+gravityVector*previewTime
		setAttachmentCFrame(c2,xAxisCFrame(startPoint,plan.velocity)*CFrame.Angles(arcSettings.AttachmentRoll,0,0))
		setAttachmentCFrame(c1,xAxisCFrame(catchPoint,catchVelocity)*CFrame.Angles(arcSettings.AttachmentRoll,0,0))
		setAttachmentCFrame(c3,xAxisCFrame(endPoint,endVelocity)*CFrame.Angles(arcSettings.AttachmentRoll,0,0))
		updateC1AndC3Info(plan,catchPoint,endPoint)
		beam.Attachment0=c2
		beam.Attachment1=c3
		beam.CurveSize0=math.clamp(plan.velocity.Magnitude*previewTime/3,-arcMaxCurve,arcMaxCurve)
		beam.CurveSize1=math.clamp(endVelocity.Magnitude*previewTime/3,-arcMaxCurve,arcMaxCurve)
		setPreviewCenterVisible(true)
		beam.Enabled=true
	end

	local function currentBallPower()
		return getModeKey(app)=="mode3" and squadsBallPower or gameplayBallPower
	end

	local function throwBlocked()
		return throwInProgress or os.clock()-lastThrowAt<throwInputCooldown
	end

	local function waitForHeldBallRelease()
		local deadline=os.clock()+releaseConfirmTimeout
		local detachedSince=nil

		while os.clock()<deadline do
			if not currentHeldBall() then
				detachedSince=detachedSince or os.clock()
				if os.clock()-detachedSince>=releaseConfirmStableTime then
					return true
				end
			else
				detachedSince=nil
			end

			runService.Heartbeat:Wait()
		end

		return false
	end

	local function clearPreviewForMissingBall(statusText)
		clearPreviewVisuals()
		if highlightedCharacter then
			clearTargetHighlights()
		end

		if statusText then
			setStatus(statusText)
		end
	end

	local function freezePreviewAtCurrentPlan(plan)
		if not freezePreviewAfterRelease then return end
		if plan then
			previewPlan(plan)
		end
		previewFrozen=true
		previewFreezeStarted=os.clock()
	end

	local function getTimingWindow()
		local rtt=0
		local ok,value=pcall(function()
			return localPlayer:GetNetworkPing()
		end)

		if ok and type(value)=="number" and value==value and value>=0 then
			rtt=value
		end

		local mid=math.clamp(rtt*0.5,0,releaseTimingMidMax)
		local radius=math.clamp(mid*releaseTimingPingScale+releaseTimingRadiusMin,releaseTimingRadiusMin,releaseTimingRadiusMax)
		return{
			min=math.max(0,mid-radius),
			mid=mid,
			max=mid+radius,
			radius=radius,
			width=radius*2,
		}
	end

	local function receiverAge(data)
		return data and data.lastSeen and math.max(0,os.clock()-data.lastSeen) or receiverStaleAfter
	end

	local function buildPlan(receiver,ballPower,releaseBall,receiverReleaseOffset,originOverride)
		if not canTargetReceiver(receiver) then
			return nil,nil
		end

		local character=localPlayer.Character
		local qbRoot=rootOfPlayer(localPlayer) or root(character)
		local ball=releaseBall or currentHeldBall()
		local receiverRoot=rootOfPlayer(receiver)
		local data=receiverData[receiver] or ensureReceiverData(receiver,receiverRoot)

		if not(qbRoot and ball and receiverRoot and data) then
			return nil
		end

		receiverReleaseOffset=receiverReleaseOffset or 0
		local originPosition=originOverride or origin(qbRoot,ball)
		local receiverAnchorPosition,receiverAnchorSource=receiverCatchAnchor(receiver,receiverRoot)
		local targetVelocity,shape,predictorState=routeVelocity(receiver,data,originPosition,receiverRoot,selectedRouteLock)
		local catchPosition=receiverAnchorPosition or receiverRoot.Position
		local catchY=catchHeight
		if getModeKey(app)=="mode2" then
			local groundY=fieldGroundY(catchPosition)
			if not groundY then
				return nil,nil
			end
			catchY=groundY+catchHeight
		end
		return mathCore.solve({
			originPosition=originPosition,
			receiverPosition=receiverRoot.Position,
			receiverAnchorPosition=receiverAnchorPosition,
			receiverAnchorSource=receiverAnchorSource,
			targetVelocity=targetVelocity,
			shape=shape,
			ballPower=ballPower or currentBallPower(),
			qbVelocity=movementAwareRootVelocity(qbRoot),
			qbReleaseOffset=0,
			receiverReleaseOffset=receiverReleaseOffset,
			predictorState=predictorState,
			catchY=catchY,
			solveYBias=catchSolveYBias,
			leadDelay=leadDelay,
			leadDelayBaseline=leadDelayBaseline,
			maxRunSpeed=maxRunSpeed,
			minTime=minTime,
			maxTime=maxTime,
			qbInheritance=qbInheritance,
			bisectionSteps=interceptBisectionSteps,
			minAngle=globalMinAngle,
			maxAngle=globalMaxAngle,
			aimScale=aimDistance,
			catchYTolerance=catchYTolerance,
			targetMissTolerance=targetMissTolerance,
			nearTargetMissTolerance=nearTargetMissTolerance,
			predictorConfidenceMin=receiverConfidenceMin,
			predictorConfidenceMax=receiverConfidenceMax,
			tangentDominanceEpsilon=circleTangentMargin,
			remoteFireDelayed=not fireThrowImmediately,
		}),ball
	end

	local function buildTwoPassPlan(receiver,ballPower,releaseBall,wrOffset)
		local qbRoot=rootOfPlayer(localPlayer) or root(localPlayer.Character)
		if not qbRoot then
			return nil
		end

		local delay=math.clamp(tonumber(state.qbAimThrowDelay) or defaultThrowDelay,throwDelayMin,throwDelayMax)
		local now=os.clock()
		local currentOrigin=recordQBOrigin(now,qbRoot,releaseBall or currentHeldBall())
		local sampledOrigin=delayedQBOrigin(now,delay,currentOrigin)
		local plan=buildPlan(receiver,ballPower,releaseBall,wrOffset or 0,sampledOrigin)
		if plan then
			plan.centerReleaseOrigin=sampledOrigin
			plan.throwDelay=delay
			plan.originHistoryDelay=delay
			plan.releaseTimingOffset=0
			plan.releaseYOffset=0
			plan.receiverTimingOffset=wrOffset or 0
		end

		return plan
	end

	local function buildReleaseWindowPlans(receiver,ballPower,releaseBall)
		local receiverRoot=rootOfPlayer(receiver)
		local data=receiverData[receiver] or ensureReceiverData(receiver,receiverRoot)
		if not data then
			return nil,"receiver tracking missing"
		end

		local timing=getTimingWindow()
		local age=receiverAge(data)
		local mid=buildTwoPassPlan(receiver,ballPower,releaseBall,age+timing.mid)
		if not mid then
			return nil,"no throw found"
		end

		return{
			mid=mid,
			timing=timing,
		}
	end

	local function buildReleasePlan(receiver,ballPower,releaseBall,releaseWaitOverride)
		local releaseWait=releaseWaitOverride
		if releaseWait==nil then
			releaseWait=throwReleaseWait
		end
		releaseWait=math.max(0,tonumber(releaseWait) or 0)

		if not fireThrowImmediately and releaseWait>0 then
			local endAt=os.clock()+releaseWait
			local fireAt=endAt-math.clamp(throwRemoteLeadTime,0,releaseWait)

			while os.clock()<fireAt do
				if livePreviewDuringThrow then
					local data=receiverData[receiver]
					local timing=getTimingWindow()
					local livePlan=buildTwoPassPlan(receiver,ballPower,releaseBall,receiverAge(data)+timing.mid)
					if livePlan then
						previewPlan(livePlan)
					end
				end

				runService.Heartbeat:Wait()
			end
		end

		local plans,reason=buildReleaseWindowPlans(receiver,ballPower,releaseBall or currentHeldBall())
		if not plans then
			return nil,releaseBall,reason
		end

		return plans.mid,releaseBall,nil,plans
	end

	local function fireGameplayThrow(plan)
		local reEvent=getGameReEvent()
		if not reEvent then
			return false,"game remote missing"
		end

		reEvent:FireServer("Mechanics","ThrowBall",{
			Target=plan.aimPoint,
			AutoThrow=false,
			Power=remotePower,
		})

		-- Server handles unequip
		return true,nil
	end

	local function fireMiniGameThrow(plan,modeKey)
		local reEvent=getMiniGameReEvent(modeKey=="mode3")
		if not reEvent then
			return false,"minigame remote missing"
		end

		reEvent:FireServer("Mechanics","ThrowBall",{
			Target=plan.aimPoint,
			AutoThrow=false,
			Power=remotePower, -- must be 100, not plan.speed/95
		})

		return true,nil
	end

	local function throwTo(receiver,options)
		if not(enabled and isAvailable()) then return end
		options=options or {}

		if throwBlocked() then
			setStatus("already throwing")
			return
		end

		if not canTargetReceiver(receiver) then
			trackedReceiver=nil
			selectedRouteLock=nil
			clearPreviewVisuals()
			setTargetText()
			setStatus(state.qbAimTeamFilter~=false and "not teammate" or "no wr")
			return
		end

		local heldBall=currentHeldBall()
		if not heldBall then
			clearPreviewForMissingBall("no ball")
			return
		end
		noteHeldBallState(heldBall,os.clock())

		local modeKey=getModeKey(app)
		local power=modeKey=="mode3" and squadsBallPower or gameplayBallPower
		local receiverRoot=rootOfPlayer(receiver)
		if not receiverRoot then
			setStatus("no wr")
			return
		end

		throwInProgress=true

		local function releaseThrowLock()
			throwInProgress=false
			lastThrowAt=os.clock()
		end

		local previewData=receiverData[receiver] or ensureReceiverData(receiver,receiverRoot)
		local previewTiming=getTimingWindow()
		local previewReleasePlan=buildTwoPassPlan(receiver,power,heldBall,receiverAge(previewData)+previewTiming.mid)
		if previewReleasePlan then
			previewPlan(previewReleasePlan)
		end

		local skipAnimation=options.skipAnimation==true or options.noAnimation==true
		local animationPlayed=false
		if not skipAnimation then
			animationPlayed=qbAim._playThrowAnimation()
			if animationPlayed then
				startCalibration(os.clock(),heldBall,throwReleaseWait)
			end
		end

		local releaseWait=throwReleaseWait
		if skipAnimation or (noAnimationThrowFallback and not animationPlayed) then
			releaseWait=noAnimationReleaseWait
		end

		local plan,_,reason=buildReleasePlan(receiver,power,heldBall,releaseWait)
		if not plan then
			releaseThrowLock()
			setStatus(reason or "no throw")
			return
		end

		startCalibration(os.clock(),heldBall,0)
		local fired,ok,err=pcall(function()
			if modeKey=="mode1" then
				return fireGameplayThrow(plan)
			elseif modeKey=="mode2" or modeKey=="mode3" then
				return fireMiniGameThrow(plan,modeKey)
			end

			return false,"mode unsupported"
		end)

		if not fired then
			local thrownErr=ok
			ok=false
			err=thrownErr or "throw failed"
		end

		if ok then
			freezePreviewAtCurrentPlan(plan)
			waitForHeldBallRelease()
			setStatus(currentModeText().." throw sent")
		else
			setStatus(err or "throw failed")
		end

		releaseThrowLock()
	end

	local function lockReceiverNearScreenPoint(targetPoint)
		if not(enabled and isAvailable()) then return end

		local camera=workspace.CurrentCamera
		local best=nil
		local bestDistance=math.huge

		for _,player in ipairs(currentPlayers()) do
			local receiverRoot=player~=localPlayer and rootOfPlayer(player)
			if receiverRoot and camera and canTargetReceiver(player) then
				local screenPoint,onScreen=camera:WorldToViewportPoint(receiverRoot.Position)
				if onScreen then
					local distance=(targetPoint-Vector2.new(screenPoint.X,screenPoint.Y)).Magnitude
					if distance<bestDistance then
						best=player
						bestDistance=distance
					end
				end
			end
		end

		if best then
			ensureReceiverData(best,rootOfPlayer(best))
			trackedReceiver=best
			selectedRouteLock=lockRoute(best)
			previewFrozen=false
			preview.ballMissingSince=nil
			setTargetText()
			setStatus("locked "..best.Name)
		else
			setStatus(state.qbAimTeamFilter~=false and "no teammate" or "no wr")
		end
	end

	local function lockReceiverUnderCursor()
		local mouse=localPlayer:GetMouse()
		lockReceiverNearScreenPoint(Vector2.new(mouse.X,mouse.Y))
	end

	local function lockReceiverAtViewportCenter()
		local camera=workspace.CurrentCamera
		local viewport=camera and camera.ViewportSize or Vector2.new(0,0)
		lockReceiverNearScreenPoint(viewport*0.5)
	end

	local function requestThrow(noAnimation)
		if not(enabled and isAvailable()) then return false end

		if throwBlocked() then
			setStatus("already throwing")
			return true
		end

		if not currentHeldBall() then
			clearPreviewForMissingBall("no ball")
			return true
		end

		if trackedReceiver then
			throwTo(trackedReceiver,{
				noAnimation=noAnimation==true,
			})
		else
			setStatus("no wr")
		end

		return true
	end

	function api.LockTarget()
		if app.isMobile then
			lockReceiverAtViewportCenter()
		else
			lockReceiverUnderCursor()
		end
	end

	function api.Throw()
		return requestThrow(false)
	end

	local function setEnabled(value)
		local wasEnabled=enabled
		enabled=value and isAvailable() and true or false
		state.qbAimEnabled=enabled
		if enabled~=wasEnabled then table.clear(qbOriginHistory) end
		if not enabled then
			trackedReceiver=nil
			selectedRouteLock=nil
			previewFrozen=false
			preview.ballMissingSince=nil
			hideQBTrailPreview()
			clearTargetHighlights()
		end

		syncControls()

		if enabled and not currentHeldBall() then
			setStatus("need ball")
		end
	end

	function api.SetQBAimState(value)
		setEnabled(value)
	end

	function api.SetTeamFilterState(value,fire)
		state.qbAimTeamFilter=value and true or false
		if state.qbAimTeamFilter and trackedReceiver and not canTargetReceiver(trackedReceiver) then
			trackedReceiver=nil
			selectedRouteLock=nil
			clearPreviewVisuals()
			setTargetText()
			setStatus("cleared")
		end
		syncControls()
		if fire~=false then
			changed()
		end
	end

	function api.SetShowArcState(value,fire)
		state.qbAimShowArc=value and true or false
		if not state.qbAimShowArc then
			hideQBTrailPreview()
			setStatus("arc hidden")
		end
		syncControls()
		if fire~=false then
			changed()
		end
	end

	function api.SetTargetHighlightState(value,fire)
		state.qbAimTargetHighlight=value and true or false
		if not state.qbAimTargetHighlight then
			clearTargetHighlights()
		end
		syncControls()
		if fire~=false then
			changed()
		end
	end

	function api.SetLeadDelay(value,fire)
		setLeadDelay(value,fire~=false)
	end

	function api.SetPeakHeight(value,fire)
		setPeakHeight(value,fire~=false)
	end

	function api.SetThrowDelay(value,fire)
		setThrowDelay(value,fire~=false)
	end

	function api.Refresh()
		setLeadDelay(state.qbAimLeadDelay,false)
		setPeakHeight(state.qbAimPeakHeight,false)
		setThrowDelay(state.qbAimThrowDelay,false)
		setEnabled(state.qbAimEnabled==true)
		refreshControllerThrowBinding()
		syncControls()
	end

	function api.Reset()
		state.qbAimTeamFilter=true
		state.qbAimShowArc=true
		state.qbAimTargetHighlight=true
		clearCalibration(false)
		setLeadDelay(leadDelayBaseline,false)
		setPeakHeight(defaultCatchHeight,false)
		setThrowDelay(defaultThrowDelay,false)
		setEnabled(false)
		changed()
	end

	function api.Destroy()
		clearCalibration(false)
		safeDisconnect(calibrationAnimationConnection)
		safeDisconnect(calibrationHumanoidConnection)
		contextActionService:UnbindAction(controllerThrowActionName)
		contextActionService:UnbindAction(controllerToggleActionName)
		controllerThrowBinding=nil
		controllerToggleBinding=nil
		controllerThrowInputActive=false
		controllerToggleInputActive=false

		if scheduler and type(scheduler.Unregister)=="function" then
			for _,job in ipairs(schedulerJobs) do
				scheduler.Unregister(job.kind,job.id)
			end
		end
		table.clear(schedulerJobs)

		for _,connection in ipairs(connections) do
			safeDisconnect(connection)
		end

		table.clear(connections)

		destroyPreviewCenter()
		clearTargetHighlights()
		if preview.c1Marker and preview.c1Marker.Parent then
			preview.c1Marker:Destroy()
		end
		if preview.c3InfoAnchor and preview.c3InfoAnchor.Parent then
			preview.c3InfoAnchor:Destroy()
		end
	end

	local sectionControls=nil
	sectionBody,sectionControls=makeSection(parent,4,"QB Aim","custom keys in Keybind Settings",{
		headerToggle={
			startState=enabled,
			onChange=function(value)
				setEnabled(value)
			end,
		},
	})
	sectionFrame=sectionBody and sectionBody.Parent or nil

	enabledToggle=sectionControls and sectionControls.toggle
	if not enabledToggle then
		enabledToggle=buildToggleRow(sectionBody,"Enabled",enabled,function(value)
			setEnabled(value)
		end)
	end

	teamFilterToggle=buildToggleRow(sectionBody,"Team Filter",state.qbAimTeamFilter~=false,function(value)
		api.SetTeamFilterState(value,true)
	end)

	arcToggle=buildToggleRow(sectionBody,"Show Arc",state.qbAimShowArc~=false,function(value)
		api.SetShowArcState(value,true)
	end)

	highlightToggle=buildToggleRow(sectionBody,"Target Highlight",state.qbAimTargetHighlight~=false,function(value)
		api.SetTargetHighlightState(value,true)
	end)

	if app.isMobile then
		local actionRow=make("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,40),ZIndex=6},sectionBody)
		local lockButton=make("TextButton",{Size=UDim2.new(0.5,-4,0,36),Position=UDim2.fromOffset(0,2),BackgroundColor3=colors.button or colors.bg,BorderSizePixel=0,Text="LOCK TARGET",Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.text,AutoButtonColor=true,ZIndex=7,ThemeRole="BUTTON",CornerRole="Control"},actionRow)
		local throwButton=make("TextButton",{Size=UDim2.new(0.5,-4,0,36),Position=UDim2.new(0.5,4,0,2),BackgroundColor3=colors.button or colors.bg,BorderSizePixel=0,Text="THROW",Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.text,AutoButtonColor=true,ZIndex=7,ThemeRole="BUTTON",CornerRole="Control"},actionRow)

		addConnection(lockButton.Activated:Connect(api.LockTarget))
		addConnection(throwButton.Activated:Connect(api.Throw))
	end

	if buildSlider then
		leadDelaySliderControl=buildSlider(sectionBody,"Lead Adjust",leadDelayMin,leadDelayMax,leadDelay,2,function(value)
			api.SetLeadDelay(value,true)
		end)
		peakHeightSliderControl=buildSlider(sectionBody,"Peak Height",peakHeightMin,peakHeightMax,catchHeight,2,function(value)
			api.SetPeakHeight(value,true)
		end)
		throwDelaySliderControl=buildSlider(sectionBody,"Throw Delay",throwDelayMin,throwDelayMax,throwDelay,2,function(value)
			api.SetThrowDelay(value,true)
		end)
	else
		leadDelayFrame=make("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,26),ZIndex=6},sectionBody)
		leadDelayBox=make("TextBox",{BackgroundColor3=colors.muted,BackgroundTransparency=0.70,BorderSizePixel=0,Position=UDim2.new(1,-72,0,0),Size=UDim2.fromOffset(72,24),Text=string.format("%.2f",leadDelay),ClearTextOnFocus=false,Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.text,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=7,ThemeRole="MUTED"},leadDelayFrame)
		make("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-80,0,24),Text="Lead Adjust",Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.muted,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7},leadDelayFrame)
		addConnection(leadDelayBox.FocusLost:Connect(function()
			setLeadDelay(leadDelayBox.Text,true)
		end))
		peakHeightFrame=make("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,26),ZIndex=6},sectionBody)
		peakHeightBox=make("TextBox",{BackgroundColor3=colors.muted,BackgroundTransparency=0.70,BorderSizePixel=0,Position=UDim2.new(1,-72,0,0),Size=UDim2.fromOffset(72,24),Text=string.format("%.2f",catchHeight),ClearTextOnFocus=false,Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.text,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=7,ThemeRole="MUTED"},peakHeightFrame)
		make("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-80,0,24),Text="Peak Height",Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.muted,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7},peakHeightFrame)
		addConnection(peakHeightBox.FocusLost:Connect(function()
			setPeakHeight(peakHeightBox.Text,true)
		end))
	end

	autoCalibrateButton=make("TextButton",{Size=UDim2.new(1,0,0,30),BackgroundColor3=colors.MUTED or colors.muted,BackgroundTransparency=0.70,BorderSizePixel=0,Text="Auto Calibrate",Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.text,AutoButtonColor=false,ZIndex=7,ThemeRole="MUTED",CornerRole="Control"},sectionBody)
	addConnection(autoCalibrateButton.Activated:Connect(api.AutoCalibrate))

	updateLeadDelayVisuals()
	updatePeakHeightVisuals()
	updateThrowDelayVisuals()
	updateCalibrationButton()
	bindCalibrationAnimator(localPlayer.Character or workspace:FindFirstChild(localPlayer.Name))
	addConnection(localPlayer.CharacterAdded:Connect(bindCalibrationAnimator))
	if not addSchedulerJob("Heartbeat","QBAimAutoCalibrate",0,calibrationStep) then
		addConnection(runService.Heartbeat:Connect(calibrationStep))
	end

	local function receiverTrackStep(dt)
		if not(enabled and isAvailable()) then return end
		if not isAlive() then return end

		receiverTrackElapsed=receiverTrackElapsed+(dt or 0)
		if receiverTrackElapsed<trackSettings.ReceiverInterval then return end
		receiverTrackElapsed=0

		local now=os.clock()
		local qbRoot=rootOfPlayer(localPlayer) or root(localPlayer.Character)
		if qbRoot then
			recordQBOrigin(now,qbRoot,currentHeldBall())
		end
		for _,player in ipairs(currentPlayers()) do
			if canTargetReceiver(player) then
				local receiverRoot=rootOfPlayer(player)
				if receiverRoot then
					local data=receiverData[player]

					if not data then
						data=seedReceiverData(player,receiverRoot,now)
					end

					local sampleDt=math.min(now-data.t,0.1)
					if sampleDt>0 then
						local positionVelocity=(receiverRoot.Position-data.pos)/sampleDt
						local assemblyVelocity=receiverRoot.AssemblyLinearVelocity or Vector3.zero
						local positionMoving=flat(positionVelocity).Magnitude>=movingSpeedMin
						local assemblyMoving=flat(assemblyVelocity).Magnitude>=movingSpeedMin
						local chosenVelocity=Vector3.zero

						if positionMoving then
							chosenVelocity=positionVelocity
						elseif rootHasMoveInput(receiverRoot) and assemblyMoving and now>=possessionSettleUntil then
							chosenVelocity=assemblyVelocity
						end

						if flat(chosenVelocity).Magnitude>=movingSpeedMin then
							data.movingSamples=(data.movingSamples or 0)+1
						else
							data.movingSamples=0
						end

						if (data.movingSamples or 0)<movingConfirmSamples then
							chosenVelocity=Vector3.zero
						end

						local previousRawVelocity=data.rawVel or Vector3.zero
						local rawAcceleration=(chosenVelocity-previousRawVelocity)/sampleDt

						data.rawVel=clampMagnitude(chosenVelocity,maxRunSpeed)
						data.vel=data.rawVel
						data.accel=clampMagnitude(rawAcceleration,receiverAccelMax)
						data.confidence=flat(data.rawVel).Magnitude>=movingSpeedMin and receiverConfidenceMax or receiverConfidenceMin
						data.pos=receiverRoot.Position
						data.t=now
						data.lastSeen=now
						table.insert(data.ph,{t=now,pos=receiverRoot.Position})

						while #data.ph>0 and now-data.ph[1].t>receiverHistoryMaxAge do
							table.remove(data.ph,1)
						end
					end
				end
			end
		end
	end

	if not addSchedulerJob("Heartbeat","QBAimReceiverTrack",trackSettings.ReceiverInterval,receiverTrackStep) then
		addConnection(runService.Heartbeat:Connect(receiverTrackStep))
	end

	local function previewStep()
		if not(enabled and isAvailable()) then
			if highlightedCharacter then
				clearTargetHighlights()
			end
			return
		end

		local now=os.clock()
		local heldBall=nil
		if freezePreviewAfterRelease then
			if previewFrozen then
				if now-previewFreezeStarted<postThrowFreezeTime then
					return
				end
				previewFrozen=false
			end

			heldBall=currentHeldBall()
			local holdingBall=heldBall~=nil
			if not holdingBall then
				preview.ballMissingSince=preview.ballMissingSince or now
				if now-preview.ballMissingSince<missingBallGraceTime then
					return
				end

				noteHeldBallState(nil,now)
				clearPreviewForMissingBall()
				return
			end

			noteHeldBallState(heldBall,now)
			preview.ballMissingSince=nil
		end

		updateTargetHighlight()

		if not trackedReceiver then return end

		if state.qbAimShowArc==false then
			hideQBTrailPreview()
			return
		end

		local timing=getTimingWindow()
		local data=receiverData[trackedReceiver]
		local plan=buildTwoPassPlan(trackedReceiver,nil,heldBall,receiverAge(data)+timing.mid)
		if plan then
			previewPlan(plan)
		end
	end

	if not addSchedulerJob("RenderStepped","QBAimPreview",arcSettings.UpdateInterval,previewStep) then
		local previewElapsed=arcSettings.UpdateInterval
		addConnection(runService.RenderStepped:Connect(function(dt)
			previewElapsed=previewElapsed+(dt or 0)
			if previewElapsed<arcSettings.UpdateInterval then return end
			previewElapsed=previewElapsed%arcSettings.UpdateInterval
			previewStep()
		end))
	end

	local function hasFocusedTextBox()
		local ok,focused=pcall(function()
			return inputService:GetFocusedTextBox()
		end)
		return ok and focused~=nil
	end

	local function isControllerKeyCode(binding)
		if typeof(binding)~="EnumItem" or binding.EnumType~=Enum.KeyCode then
			return false
		end

		local name=binding.Name
		return name:sub(1,6)=="Button"
			or name:sub(1,4)=="DPad"
			or name:sub(1,10)=="Thumbstick"
	end

	local function isControllerQBAimInput(input)
		return controllerThrowBinding~=nil and input.KeyCode==controllerThrowBinding
			or controllerToggleBinding~=nil and input.KeyCode==controllerToggleBinding
	end

	local function suppressNativeControllerInput(binding)
		local mechanics=qbAim._getGlobalMechanics()
		local variables=mechanics and mechanics.Variables
		local playerData=variables and variables.PlayerData
		local profile=playerData and playerData[localPlayer.Name]
		profile=profile and profile.ProfileData
		local controlSettings=profile and profile.ControlSettings
		local throwKeys=mechanics and mechanics.ThrowKeysPressed
		if type(controlSettings)~="table" and type(throwKeys)~="table" then
			return false
		end

		local blockedValue="__QBAimControllerInput__"
		local changedControls={}
		if type(controlSettings)=="table" then
			for _,setting in pairs(controlSettings) do
				if type(setting)=="table" and setting.Controller==binding.Name then
					table.insert(changedControls,{setting=setting,value=setting.Controller})
					setting.Controller=blockedValue
				end
			end
		end

		local throwKeyState=type(throwKeys)=="table" and throwKeys[binding] or nil
		if throwKeyState~=nil then
			throwKeys[binding]=nil
		end

		if #changedControls==0 and throwKeyState==nil then
			return true
		end

		task.spawn(function()
			runService.Heartbeat:Wait()
			for _,entry in ipairs(changedControls) do
				if entry.setting.Controller==blockedValue then
					entry.setting.Controller=entry.value
				end
			end

			if throwKeyState~=nil and throwKeys[binding]==nil then
				throwKeys[binding]=throwKeyState
			end
		end)

		return true
	end

	refreshControllerThrowBinding=function()
		local throwBinding=configuredBinding("getQBAimThrowKey",Enum.KeyCode.T)
		if throwBinding~=controllerThrowBinding then
			contextActionService:UnbindAction(controllerThrowActionName)
			controllerThrowBinding=nil
			controllerThrowInputActive=false
			if isControllerKeyCode(throwBinding) then
				controllerThrowBinding=throwBinding
				contextActionService:BindActionAtPriority(controllerThrowActionName,function(_,inputState)
					if not enabled then
						controllerThrowInputActive=false
						return Enum.ContextActionResult.Pass
					end

					if inputState==Enum.UserInputState.Begin then
						controllerThrowInputActive=false
						if hasFocusedTextBox() or not isAvailable() or not currentHeldBall() or not trackedReceiver then
							return Enum.ContextActionResult.Pass
						end

						if not suppressNativeControllerInput(throwBinding) then
							return Enum.ContextActionResult.Pass
						end

						controllerThrowInputActive=true
						task.defer(requestThrow,false)
						return Enum.ContextActionResult.Sink
					end

					if inputState==Enum.UserInputState.End or inputState==Enum.UserInputState.Cancel then
						local wasActive=controllerThrowInputActive
						controllerThrowInputActive=false
						return wasActive and Enum.ContextActionResult.Sink or Enum.ContextActionResult.Pass
					end

					return controllerThrowInputActive and Enum.ContextActionResult.Sink or Enum.ContextActionResult.Pass
				end,false,10000,throwBinding)
			end
		end

		local toggleBinding=configuredBinding("getQBAimToggleKey",Enum.KeyCode.P)
		if toggleBinding~=controllerToggleBinding then
			contextActionService:UnbindAction(controllerToggleActionName)
			controllerToggleBinding=nil
			controllerToggleInputActive=false
			if isControllerKeyCode(toggleBinding) then
				controllerToggleBinding=toggleBinding
				contextActionService:BindActionAtPriority(controllerToggleActionName,function(_,inputState)
					if inputState==Enum.UserInputState.Begin then
						controllerToggleInputActive=false
						if hasFocusedTextBox() or not isAvailable() then
							return Enum.ContextActionResult.Pass
						end

						if not suppressNativeControllerInput(toggleBinding) then
							return Enum.ContextActionResult.Pass
						end

						controllerToggleInputActive=true
						setEnabled(not enabled)
						return Enum.ContextActionResult.Sink
					end

					if inputState==Enum.UserInputState.End or inputState==Enum.UserInputState.Cancel then
						local wasActive=controllerToggleInputActive
						controllerToggleInputActive=false
						return wasActive and Enum.ContextActionResult.Sink or Enum.ContextActionResult.Pass
					end

					return controllerToggleInputActive and Enum.ContextActionResult.Sink or Enum.ContextActionResult.Pass
				end,false,10000,toggleBinding)
			end
		end
	end

	local function shouldHandleProcessedQBAimInput(input)
		if hasFocusedTextBox() then return false end
		if not enabled then return false end
		return bindingMatches("getQBAimThrowKey",input,Enum.KeyCode.T)
	end

	local function handleQBAimInput(input,processed)
		if not isAvailable() then return false end
		local inputWasProcessed=processed==true

		if not inputWasProcessed and bindingMatches("getQBAimToggleKey",input,Enum.KeyCode.P) then
			setEnabled(not enabled)
			return true
		end

		if not enabled then return false end

		local wantsLock=not inputWasProcessed and bindingMatches("getQBAimLockKey",input,Enum.KeyCode.H)
		local wantsThrow=bindingMatches("getQBAimThrowKey",input,Enum.KeyCode.T)
		if inputWasProcessed and not wantsThrow then return false end
		if not(wantsLock or wantsThrow) then return false end

		if wantsLock then
			lockReceiverUnderCursor()
			return true
		end

		if wantsThrow then
			return requestThrow(false)
		end

		return true
	end

	addConnection(inputService.InputBegan:Connect(function(input,processed)
		if isControllerQBAimInput(input) then return end
		if processed and not shouldHandleProcessedQBAimInput(input) then return end
		handleQBAimInput(input,processed)
	end))

	cleanupC3InfoGui()
	clearTargetHighlights()
	refreshControllerThrowBinding()
	syncControls()
	return api
end

return qbAim
