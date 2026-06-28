local QBAim={}

local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local Workspace=game:GetService("Workspace")
local ReplicatedStorage=game:GetService("ReplicatedStorage")

local LP=Players.LocalPlayer
local QBAimMathModule=rawget(getfenv(),"Page1QBAimMathModule")

local BALL_G=28
local G=Vector3.new(0,-BALL_G,0)
local MODEL_BALL_SPEED=95
local REMOTE_DISPLAY_POWER=100 -- send to remote; server converts incoming UpdateFootball Power to 95
local GAMEPLAY_BALL_POWER=MODEL_BALL_SPEED
local SQUADS_BALL_POWER=MODEL_BALL_SPEED
local PLAYER_G=196.2
local DEFAULT_WR_MAX_Y=14.00 -- clean default catch peak; original jump formula is ~=13.85
local WR_MAX_Y=DEFAULT_WR_MAX_Y
local C1_SOLVE_Y_BIAS=0.00
local MAX_RUN_SPEED=21
local CLEAN_MOVING_SPEED_MIN=5.0
local CLEAN_CATCH_Y_TOLERANCE=0.35
local CLEAN_TARGET_MISS_TOLERANCE=0.35
local CLEAN_NEAR_TARGET_MISS_TOLERANCE=0.05
local WR_LEAD_DELAY=0.38
local LEAD_DELAY_BASELINE=0.38 -- clean math: Lead Adjust is direct intentional ahead-time
local PREDICTOR_HISTORY_MAX_AGE=0.30
local PREDICTOR_ACCEL_MAX=48
local PREDICTOR_CONFIDENCE_MIN=0.30
local PREDICTOR_CONFIDENCE_MAX=1.00
local PREDICTOR_STALE_AFTER=0.35
local QB_RELEASE_DELAY=0.25
local QB_LAUNCH_Y_BIAS=0
local QB_GROUND_ROOT_Y=3.648
local QB_AIRBORNE_Y_EPSILON=0.35
local QB_AIRBORNE_VY_EPSILON=2
local QB_Y_RISE_FACTOR=0
local QB_Y_FALL_FACTOR=0
local QB_Y_MAX_CORRECTION=4.25
local C2_GROUND_FALLBACK_MARGIN=2.50
local C2_MAX_ABOVE_BALL=8.00
local C2_MAX_Y_DELTA=10.00
local QB_RELEASE_EXTRAPOLATE_HORIZONTAL=true
local QB_RELEASE_EXTRAPOLATE_VERTICAL=true
local QB_SERVER_HORIZONTAL_DEADZONE=0.75
local QB_SERVER_HORIZONTAL_SPEED_MAX=24
local MIN_T,MAX_T,DT=0.35,6,0.01
local QB_INHERITANCE=0
local INTERCEPT_BISECTION_STEPS=12
local GLOBAL_MIN_ANGLE=-5
local GLOBAL_MAX_ANGLE=55
local AIM_SCALE=1000
local ARC_PREVIEW_ENABLED=true
local ARC_SETTINGS={
	UpdateInterval=0.035,
	AttachmentRoll=math.rad(90),
	UnsafeColor=Color3.fromRGB(254,94,86),
}
local DEFENDER_SETTINGS={
	Speed=21,
	ReactionBuffer=0,
	CatchHeightTolerance=0.25,
}
local TRACK_SETTINGS={
	ReceiverInterval=0.05,
}
local POSSESSION_RESEED_SETTLE_TIME=0.12
local MOVE_DIRECTION_EPSILON=0.05
local MOVING_CONFIRM_SAMPLES=2
local FREEZE_PREVIEW_WHILE_BALL_RELEASED=true
local PREVIEW_POST_THROW_FREEZE_MIN=0.75
local PREVIEW_MISSING_BALL_GRACE=0.2
local ARC_MAX_CURVE=400
local PREVIEW_SMOOTH=1.00
local C1_MARKER_ENABLED=true
local C1_MARKER_SIZE=1.65
local C3_INFO_GUI_ENABLED=false
local C3_INFO_GUI_SIZE=UDim2.new(0,220,0,78)
local C3_INFO_GUI_OFFSET=Vector3.new(0,3.2,0)
local CIRCLE_TANGENT_DOMINANCE_EPSILON=1e-6
local RECEIVER_CATCH_ANCHOR_MAX_OFFSET=10
local RECEIVER_CATCH_ANCHOR_BLEND=1.00
local PLAY_THROW_ANIMATION=true
local THROW_ANIMATION_NAME="UF_QuarterbackThrow"
local THROW_ANIMATION_SPEED=1.35
-- Animation-to-remote timing stays fixed. User testing showed the outgoing ThrowBall
-- should wait for the normal animation release window, not fire immediately.
local THROW_ANIMATION_RELEASE_WAIT=0.26666666666666666
local THROW_REMOTE_LEAD_TIME=0.00 -- fire after the full animation release wait
local THROW_TARGET_LOCK_PREVIEW_LIVE=false -- freeze locked plan during animation; normal game preview appears to latch here
local THROW_TARGET_FIRE_IMMEDIATELY=false
local THROW_INPUT_COOLDOWN=0.85
local THROW_RELEASE_CONFIRM_TIMEOUT=1.75
local THROW_RELEASE_CONFIRM_STABLE_TIME=0.08
local RELEASE_TIMING_MID_MAX=0.12
local RELEASE_TIMING_RADIUS_MIN=1/60
local RELEASE_TIMING_RADIUS_MAX=0.06
local RELEASE_TIMING_RADIUS_PING_SCALE=0.25
local RECEIVER_UNCERTAINTY_MAX=3
local RELEASE_TARGET_SPREAD_MAX=3
local RELEASE_ANGLE_SPREAD_MAX=2.0
local SAFE_ARC_SAMPLE_DT=0.04
local SAFE_ARC_CATCHABLE_Y_MARGIN=0.25
local DIRECTIONAL_RELEASE_SIDE_OFFSET=1
local DIRECTIONAL_RELEASE_HEIGHT_OFFSET=1.5
-- Legacy save/API compatibility only. Final throws no longer use manual drift.
local QB_RELEASE_ORIGIN_DRIFT_TIME=0
local QB_RELEASE_VERTICAL_DRIFT_TIME=0
local QB_RELEASE_VERTICAL_DRIFT_MAX=6.00
-- Key model:
--   1. Keypress locks receiver identity and preview only.
--   2. Final plan recomputes at the animation release moment.
--   3. Early/mid/late timing validates server-arrival uncertainty.
--   4. Remote fires after THROW_ANIMATION_RELEASE_WAIT, always 0.266666...
local PLAY_THROW_LOCAL_FALLBACK=false
local QB_AIM_HIGHLIGHT_NAME="QBAimTargetHighlight"
local ESP_HIGHLIGHT_NAME="MyESPHighlight"
local VALID_TEAM_IDS={
	HomeTeam=true,
	AwayTeam=true,
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
	return character~=nil and (character==LP.Character or character==Workspace:FindFirstChild(LP.Name))
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
		local ok,isDown=pcall(UIS.IsKeyDown,UIS,keyCode)
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

	return rootMoveDirection(rootPart).Magnitude>MOVE_DIRECTION_EPSILON
end

local function movementAwareRootVelocity(rootPart)
	local velocity=rootPart and rootPart.AssemblyLinearVelocity or Vector3.zero
	local horizontal=flat(velocity)

	if horizontal.Magnitude<QB_SERVER_HORIZONTAL_DEADZONE then
		horizontal=Vector3.zero
	elseif horizontal.Magnitude>QB_SERVER_HORIZONTAL_SPEED_MAX then
		horizontal=horizontal.Unit*QB_SERVER_HORIZONTAL_SPEED_MAX
	end

	return Vector3.new(horizontal.X,velocity.Y,horizontal.Z)
end

local function routeSpeed(speed)
	-- Clean math rebuild: receivers are modeled as either stopped or moving at route speed.
	-- This removes partial-speed formula drift and keeps the prediction equation simple.
	local clamped=math.clamp(speed or 0,0,MAX_RUN_SPEED)
	if clamped<CLEAN_MOVING_SPEED_MIN then
		return 0
	end

	return MAX_RUN_SPEED
end

local function getModeKey(ctx)
	local miniGames=Workspace:FindFirstChild("MiniGames")
	local miniCount=miniGames and #miniGames:GetChildren() or 0
	if miniCount>1 then
		return"mode2"
	elseif miniCount==1 then
		return"mode3"
	end

	local games=Workspace:FindFirstChild("Games")
	if games and #games:GetChildren()>0 then
		return"mode1"
	end

	if ctx.getCurrentModeKey then
		local ok,modeKey=pcall(ctx.getCurrentModeKey)
		if ok and modeKey then
			return tostring(modeKey)
		end
	end

	local replicatedMiniGames=ReplicatedStorage:FindFirstChild("MiniGames")
	local replicatedMiniCount=replicatedMiniGames and #replicatedMiniGames:GetChildren() or 0
	if replicatedMiniCount>1 then
		return"mode2"
	elseif replicatedMiniCount==1 then
		return"mode3"
	end

	local replicatedGames=ReplicatedStorage:FindFirstChild("Games")
	if replicatedGames and #replicatedGames:GetChildren()>0 then
		return"mode1"
	end

	return"mode1"
end

local function getHeldBall()
	local character=Workspace:FindFirstChild(LP.Name) or LP.Character
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

	if LP.Character and LP.Character~=character then
		local lpRoot=root(LP.Character)
		if lpRoot then
			characterRoot=lpRoot
			ball=findBallPart(LP.Character,35)
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
	return teamID~=nil and VALID_TEAM_IDS[teamID]==true
end

local function isSameTeam(playerA,playerB)
	local teamA=getPlayerTeamID(playerA)
	local teamB=getPlayerTeamID(playerB)

	if not isValidGameTeamID(teamA) or not isValidGameTeamID(teamB) then
		return false
	end

	return teamA==teamB
end

local function localGameID()
	local replicated=LP and LP:FindFirstChild("Replicated")
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
		local workspaceGames=Workspace:FindFirstChild("Games")
		local replicatedGames=ReplicatedStorage:FindFirstChild("Games")
		local reEvent=folderReEvent(workspaceGames and workspaceGames:FindFirstChild(gameID))
			or folderReEvent(replicatedGames and replicatedGames:FindFirstChild(gameID))

		if reEvent then
			return reEvent
		end
	end

	local games=Workspace:FindFirstChild("Games")
	if games then
		for _,gameFolder in ipairs(games:GetChildren()) do
			local replicated=gameFolder:FindFirstChild("Replicated")
			local playersFolder=replicated and replicated:FindFirstChild("Players")
			local reEvent=folderReEvent(gameFolder)

			if playersFolder and playersFolder:FindFirstChild(LP.Name) and reEvent and reEvent:IsA("RemoteEvent") then
				return reEvent
			end
		end
	end

	local replicatedGames=ReplicatedStorage:FindFirstChild("Games")
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
	return getFirstChildFolder(Workspace:FindFirstChild("Games"))
end

local function getFirstMiniGame()
	return getFirstChildFolder(Workspace:FindFirstChild("MiniGames"))
end

local function localFolder()
	local miniGames=Workspace:FindFirstChild("MiniGames")
	local gameFolder=(miniGames and #miniGames:GetChildren()==1) and getFirstMiniGame() or getFirstGame()
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
			instance.Enabled=true
		end
	end

	prep(object)
	for _,descendant in ipairs(object:GetDescendants()) do
		prep(descendant)
	end
end

local function getFirstMiniGameFolder(container)
	if not container then return nil end

	for _,child in ipairs(container:GetChildren()) do
		if child:IsA("Folder") or child:IsA("Model") then
			return child
		end
	end

	return nil
end

local function getSquadsReEvent()
	local gameID=localGameID()
	if gameID then
		local replicatedMiniGames=ReplicatedStorage:FindFirstChild("MiniGames")
		local workspaceMiniGames=Workspace:FindFirstChild("MiniGames")
		local miniGame=(replicatedMiniGames and replicatedMiniGames:FindFirstChild(gameID))
			or (workspaceMiniGames and workspaceMiniGames:FindFirstChild(gameID))
		local reEvent=folderReEvent(miniGame)
		if reEvent then
			return reEvent,miniGame
		end
	end

	local containers={}
	local replicatedMiniGames=ReplicatedStorage:FindFirstChild("MiniGames")
	local workspaceMiniGames=Workspace:FindFirstChild("MiniGames")
	local workspaceGames=Workspace:FindFirstChild("Games")
	local replicatedGames=ReplicatedStorage:FindFirstChild("Games")
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
		local miniGame=getFirstMiniGameFolder(container)
		local reEvent=miniGame and miniGame:FindFirstChild("ReEvent")

		if reEvent and reEvent:IsA("RemoteEvent") then
			return reEvent,miniGame
		end
	end

	return nil,nil
end

QBAim._cachedMechanics=nil

function QBAim._getGlobalMechanics()
	local function valid(mechanics)
		return mechanics and (type(mechanics.PlayAnimation)=="function" or type(mechanics.UnequipFootball)=="function")
	end

	if valid(QBAim._cachedMechanics) then
		return QBAim._cachedMechanics
	end

	local globals=(typeof(getgenv)=="function" and getgenv()) or _G or {}
	if type(globals)=="table" then
		local mechanics=rawget(globals,"Mechanics")
		if valid(mechanics) then
			QBAim._cachedMechanics=mechanics
			return mechanics
		end

		local variables=rawget(globals,"Variables")
		if type(variables)=="table" and valid(variables.Mechanics) then
			QBAim._cachedMechanics=variables.Mechanics
			return variables.Mechanics
		end
	end

	local playerScripts=LP:FindFirstChild("PlayerScripts")
	local clientMain=playerScripts and playerScripts:FindFirstChild("ClientMain")
	local utilities=clientMain and clientMain:FindFirstChild("Utilities")
	local variablesModule=utilities and utilities:FindFirstChild("Variables")
	if variablesModule then
		local ok,variables=pcall(require,variablesModule)
		if ok and type(variables)=="table" and valid(variables.Mechanics) then
			QBAim._cachedMechanics=variables.Mechanics
			return variables.Mechanics
		end
	end

	return nil
end

function QBAim._findThrowAnimation()
	local containers={
		ReplicatedStorage,
		LP:FindFirstChild("PlayerScripts"),
		LP.Character,
	}

	for _,container in ipairs(containers) do
		local animation=container and container:FindFirstChild(THROW_ANIMATION_NAME,true)
		if animation and animation:IsA("Animation") and animation.AnimationId~="" then
			return animation
		end
	end

	return nil
end

function QBAim._playLocalThrowAnimation()
	local character=LP.Character or Workspace:FindFirstChild(LP.Name)
	local humanoid=character and character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return false end

	local animation=QBAim._findThrowAnimation()
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
	track:Play(0.05,1,THROW_ANIMATION_SPEED)
	return true
end

function QBAim._playThrowAnimation()
	if not PLAY_THROW_ANIMATION or not getHeldBall() then return false end

	local mechanics=QBAim._getGlobalMechanics()
	if mechanics and type(mechanics.PlayAnimation)=="function" then
		local ok=pcall(function()
			mechanics:PlayAnimation(THROW_ANIMATION_NAME,THROW_ANIMATION_SPEED)
		end)
		if ok then
			return true,"mechanics"
		end
	end

	if PLAY_THROW_LOCAL_FALLBACK then
		local ok=QBAim._playLocalThrowAnimation()
		return ok,"local"
	end

	return false,"none"
end

function QBAim.new(ctx,parent)
	local New=ctx.New
	local THEME=ctx.THEME
	local UI_STYLE=ctx.UI_STYLE
	local safeDisconnect=ctx.safeDisconnect
	local inputToBinding=ctx.inputToBinding
	local makeSection=ctx.makeSection
	local buildToggleRow=ctx.buildToggleRow
	local buildSlider=ctx.buildSlider
	local state=ctx.State or {}
	local mathCore=ctx.Page1QBAimMathModule or QBAimMathModule
	local services=ctx.Services or {}
	local playerCache=services.PlayerCache or ctx.PlayerCache
	local ballTracker=services.BallTracker or ctx.BallTracker
	local scheduler=ctx.Scheduler or services.Scheduler
	local api={}
	local enabled=false
	local trackedReceiver=nil
	local selectedRouteLock=nil
	local receiverData={}
	local receiverTrackElapsed=0
	local preview={last=0,center=nil,c2=nil,c3=nil,c1=nil,beam=nil,beamDefaultColor=nil,orig=nil,p1=nil,p2=nil,p3=nil,ballMissingSince=nil}
	local previewFrozen=false
	local previewFreezeStarted=0
	local lastHeldBall=nil
	local possessionSettleUntil=0
	local throwInProgress=false
	local lastThrowAt=-math.huge
	local highlightedCharacter=nil
	local connections={}
	local sectionBody=nil
	local sectionFrame=nil
	local enabledToggle=nil
	local teamFilterToggle=nil
	local arcToggle=nil
	local safeArcToggle=nil
	local highlightToggle=nil
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
	local LEAD_DELAY_MIN=0.00
	local LEAD_DELAY_MAX=1.50
	local PEAK_HEIGHT_MIN=8.00
	local PEAK_HEIGHT_MAX=20.00
	local QB_DRIFT_MIN=0.00
	local QB_DRIFT_MAX=0.25
	local QB_Y_DRIFT_MIN=0.00
	local QB_Y_DRIFT_MAX=0.35
	local updateTargetHighlight=function() end
	local schedulerJobs={}

	if not mathCore then
		error("Page1QBAimMathModule missing")
	end

	if state.qbAimTeamFilter==nil then
		state.qbAimTeamFilter=true
	end

	if state.qbAimShowArc==nil then
		state.qbAimShowArc=true
	end

	if state.qbAimSafeArc==nil then
		state.qbAimSafeArc=true
	end

	if state.qbAimTargetHighlight==nil then
		state.qbAimTargetHighlight=true
	end

	if state.qbAimLeadDelay==nil then
		state.qbAimLeadDelay=WR_LEAD_DELAY
	end

	if state.qbAimPeakHeight==nil then
		state.qbAimPeakHeight=WR_MAX_Y
	end

	if state.qbAimQBDrift==nil then
		state.qbAimQBDrift=QB_RELEASE_ORIGIN_DRIFT_TIME
	end

	if state.qbAimQBYDrift==nil then
		state.qbAimQBYDrift=tonumber(state.qbAimQBDrift) or QB_RELEASE_VERTICAL_DRIFT_TIME
	end

	WR_LEAD_DELAY=math.clamp(tonumber(state.qbAimLeadDelay) or WR_LEAD_DELAY,LEAD_DELAY_MIN,LEAD_DELAY_MAX)
	WR_MAX_Y=math.clamp(tonumber(state.qbAimPeakHeight) or WR_MAX_Y,PEAK_HEIGHT_MIN,PEAK_HEIGHT_MAX)
	state.qbAimPeakHeight=WR_MAX_Y
	state.qbAimQBDrift=math.clamp(tonumber(state.qbAimQBDrift) or QB_RELEASE_ORIGIN_DRIFT_TIME,QB_DRIFT_MIN,QB_DRIFT_MAX)
	state.qbAimQBYDrift=math.clamp(tonumber(state.qbAimQBYDrift) or QB_RELEASE_VERTICAL_DRIFT_TIME,QB_Y_DRIFT_MIN,QB_Y_DRIFT_MAX)
	local function addConnection(conn)
		table.insert(connections,conn)
		return conn
	end

	local function addSchedulerJob(kind,id,interval,fn)
		if scheduler and type(scheduler.Register)=="function" and scheduler.Register(kind,id,interval,fn) then
			table.insert(schedulerJobs,{kind=kind,id=id})
			return true
		end

		return false
	end

	local function changed()
		if ctx.onChanged then
			pcall(ctx.onChanged,state)
		end
	end

	local function isAlive()
		return sectionFrame==nil or sectionFrame.Parent~=nil
	end

	local function currentPlayers()
		if playerCache and type(playerCache.getPlayers)=="function" then
			return playerCache:getPlayers()
		end

		return Players:GetPlayers()
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
		if typeof(position)~="Vector3" then
			return 0
		end

		local params=RaycastParams.new()
		local ignore={}
		params.FilterType=Enum.RaycastFilterType.Exclude

		for _,player in ipairs(currentPlayers()) do
			local character=characterOf(player)
			if character then
				ignore[#ignore+1]=character
			end
		end

		params.FilterDescendantsInstances=ignore

		local result=Workspace:Raycast(position+Vector3.new(0,30,0),Vector3.new(0,-220,0),params)
		if result and result.Position.Y<=position.Y-1 then
			return result.Position.Y
		end

		return 0
	end

	local function catchYForPosition(position)
		return fieldGroundY(position)+WR_MAX_Y
	end

	local function teamOf(player)
		if playerCache and type(playerCache.getTeamId)=="function" then
			local teamID=playerCache:getTeamId(player)
			if teamID then return teamID end
		end

		return getPlayerTeamID(player)
	end

	local function currentHeldBall()
		if ballTracker and type(ballTracker.getHeldBall)=="function" then
			local ball=ballTracker:getHeldBall(LP,35)
			if ball then return ball end
		end

		return getHeldBall()
	end

	local function isAvailable()
		local modeKey=getModeKey(ctx)
		return modeKey=="mode1" or modeKey=="mode3"
	end

	local function currentModeText()
		local modeKey=getModeKey(ctx)
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
			leadDelaySliderControl.set(WR_LEAD_DELAY)
		end

		if leadDelayBox then
			leadDelayBox.Text=string.format("%.2f",WR_LEAD_DELAY)
		end

		if leadDelaySliderFill and leadDelaySliderKnob and leadDelaySlider then
			local alpha=(WR_LEAD_DELAY-LEAD_DELAY_MIN)/math.max(LEAD_DELAY_MAX-LEAD_DELAY_MIN,0.001)
			alpha=math.clamp(alpha,0,1)
			leadDelaySliderFill.Size=UDim2.new(alpha,0,1,0)
			leadDelaySliderKnob.Position=UDim2.new(alpha,-5,0.5,-5)
		end
	end

	local function updatePeakHeightVisuals()
		if peakHeightSliderControl then
			peakHeightSliderControl.set(WR_MAX_Y)
		end

		if peakHeightBox then
			peakHeightBox.Text=string.format("%.2f",WR_MAX_Y)
		end

		if peakHeightSliderFill and peakHeightSliderKnob and peakHeightSlider then
			local alpha=(WR_MAX_Y-PEAK_HEIGHT_MIN)/math.max(PEAK_HEIGHT_MAX-PEAK_HEIGHT_MIN,0.001)
			alpha=math.clamp(alpha,0,1)
			peakHeightSliderFill.Size=UDim2.new(alpha,0,1,0)
			peakHeightSliderKnob.Position=UDim2.new(alpha,-5,0.5,-5)
		end
	end

	local function setLeadDelay(value,showStatus)
		local numberValue=tonumber(value)
		if not numberValue then
			updateLeadDelayVisuals()
			return false
		end

		WR_LEAD_DELAY=math.clamp(numberValue,LEAD_DELAY_MIN,LEAD_DELAY_MAX)
		state.qbAimLeadDelay=WR_LEAD_DELAY
		updateLeadDelayVisuals()
		if showStatus then
			setStatus(string.format("LD set to %.2fs",WR_LEAD_DELAY))
			changed()
		end
		return true
	end

	local function setQBDrift(value,showStatus)
		local numberValue=tonumber(value)
		if not numberValue then
			return false
		end

		state.qbAimQBDrift=math.clamp(numberValue,QB_DRIFT_MIN,QB_DRIFT_MAX)
		if showStatus then
			changed()
		end
		return true
	end

	local function setQBYDrift(value,showStatus)
		local numberValue=tonumber(value)
		if not numberValue then
			return false
		end

		state.qbAimQBYDrift=math.clamp(numberValue,QB_Y_DRIFT_MIN,QB_Y_DRIFT_MAX)
		if showStatus then
			changed()
		end
		return true
	end

	local function setPeakHeight(value,showStatus)
		local numberValue=tonumber(value)
		if not numberValue then
			updatePeakHeightVisuals()
			return false
		end

		WR_MAX_Y=math.clamp(numberValue,PEAK_HEIGHT_MIN,PEAK_HEIGHT_MAX)
		state.qbAimPeakHeight=WR_MAX_Y
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
		if not(UI_STYLE and UI_STYLE.QBAimHighlightCustomColor==true) then
			return fallback
		end

		local prefix="QBAimHighlight"..channel
		return Color3.fromRGB(
			clampStyleByte(UI_STYLE[prefix.."R"],fallback and fallback.R*255 or 255),
			clampStyleByte(UI_STYLE[prefix.."G"],fallback and fallback.G*255 or 255),
			clampStyleByte(UI_STYLE[prefix.."B"],fallback and fallback.B*255 or 255)
		)
	end

	local function qbHighlightStyle()
		local fallbackFill=THEME.BLUE or THEME.ACC or Color3.fromRGB(21,103,251)
		local fallbackOutline=THEME.ACC or THEME.BLUE or Color3.fromRGB(32,202,106)
		return{
			fill=qbHighlightColor("Fill",fallbackFill),
			outline=qbHighlightColor("Outline",fallbackOutline),
			fillTransparency=clampStyleAlpha(UI_STYLE and UI_STYLE.QBAimHighlightFillTransparency,0.65),
			outlineTransparency=clampStyleAlpha(UI_STYLE and UI_STYLE.QBAimHighlightOutlineTransparency,0),
		}
	end

	local function setLeadDelayFromScreenX(screenX,showStatus)
		if not leadDelaySlider then return false end
		local pos=leadDelaySlider.AbsolutePosition.X
		local size=math.max(leadDelaySlider.AbsoluteSize.X,1)
		local alpha=math.clamp((screenX-pos)/size,0,1)
		return setLeadDelay(LEAD_DELAY_MIN+(LEAD_DELAY_MAX-LEAD_DELAY_MIN)*alpha,showStatus)
	end

	local function setPeakHeightFromScreenX(screenX,showStatus)
		if not peakHeightSlider then return false end
		local pos=peakHeightSlider.AbsolutePosition.X
		local size=math.max(peakHeightSlider.AbsoluteSize.X,1)
		local alpha=math.clamp((screenX-pos)/size,0,1)
		return setPeakHeight(PEAK_HEIGHT_MIN+(PEAK_HEIGHT_MAX-PEAK_HEIGHT_MIN)*alpha,showStatus)
	end

	local function canTargetReceiver(player)
		if not player or player==LP then
			return false
		end

		if state.qbAimTeamFilter==false then
			return true
		end

		return isSameTeam(player,LP)
	end

	local function getQBAimHighlight(character)
		local highlight=character and character:FindFirstChild(QB_AIM_HIGHLIGHT_NAME)
		if highlight and highlight:IsA("Highlight") then
			return highlight
		end

		return nil
	end

	local function ensureQBAimHighlight(character)
		local highlight=getQBAimHighlight(character)
		if highlight then return highlight end

		highlight=Instance.new("Highlight")
		highlight.Name=QB_AIM_HIGHLIGHT_NAME
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
		local highlight=character and character:FindFirstChild(ESP_HIGHLIGHT_NAME)
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
			confidence=PREDICTOR_CONFIDENCE_MIN,
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
			if player~=LP then
				local receiverRoot=rootOfPlayer(player)
				if receiverRoot then
					seedReceiverData(player,receiverRoot,now)
				end
			end
		end

		receiverTrackElapsed=TRACK_SETTINGS.ReceiverInterval
	end

	local function noteHeldBallState(ball,now)
		now=now or os.clock()
		if not ball then
			lastHeldBall=nil
			return
		end

		if ball==lastHeldBall then
			return
		end

		lastHeldBall=ball
		possessionSettleUntil=now+POSSESSION_RESEED_SETTLE_TIME
		selectedRouteLock=nil
		previewFrozen=false
		preview.ballMissingSince=nil
		preview.last=0
		reseedReceiverTracking(now)
	end

	local function configuredBinding(getterName,fallback)
		local getter=ctx[getterName]
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
			preview.p1,preview.p2,preview.p3=nil,nil,nil
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

		if safeArcToggle then
			safeArcToggle.set(state.qbAimSafeArc~=false)
		end

		if highlightToggle then
			highlightToggle.set(state.qbAimTargetHighlight~=false)
		end

		updateLeadDelayVisuals()
		updatePeakHeightVisuals()
		setTargetText()

		if not isAvailable() then
			setStatus(currentModeText().." unsupported")
		elseif enabled then
			setStatus("")
		else
			setStatus("")
		end
	end

	local function c2Position()
		-- Use the game's original Center.C2 as the release-position reference.
		-- Do not read from the cloned preview C2 here, because that creates stale/self-referential C2 values.
		local center=originalCenter()
		local c2=center and center:FindFirstChild("C2",true)
		local cf=c2 and attachmentCFrame(c2)
		return cf and cf.Position
	end

	local function setPreviewCenterVisible(visible)
		local center=preview.center
		if not(center and center.Parent) then return end

		local function apply(instance)
			if instance:IsA("BasePart") then
				if instance:GetAttribute("QBAimPreviewTransparency")==nil then
					instance:SetAttribute("QBAimPreviewTransparency",instance.Transparency)
				end
				instance.Transparency=visible and (instance:GetAttribute("QBAimPreviewTransparency") or 0) or 1
			elseif instance:IsA("Beam") then
				instance.Enabled=visible
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
				preview.beam=descendant
				break
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
		if not(center and center.Parent and bindArcRigParts(center)) then return nil end

		setPreviewCenterVisible(state.qbAimShowArc~=false)
		return preview.c2,preview.c1,preview.c3,preview.beam
	end

	--[[
		Clean math rebuild

		Core equation:
			ball(t) = origin + throwVelocity*t + 0.5*G*t^2
			target(t) = receiverPeakAtRelease + wrVelocity*(t + leadDelay)

		Only three football constants matter in the math core:
			1. ball speed
			2. receiver route speed
			3. receiver catch height

		No slant/streak/radial/tangent dominance is used for targeting. Route labels below are diagnostics only.
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
		-- Kept for compatibility with older diagnostics, but the clean predictor does not use
		-- long-window least-squares because it lags hard cuts and slants.
		if not(data and data.ph and #data.ph>=2) then
			return nil,0,0
		end

		local latest=data.ph[#data.ph]
		local earliest=data.ph[1]
		for i=#data.ph,1,-1 do
			if now-data.ph[i].t>=PREDICTOR_HISTORY_MAX_AGE then
				earliest=data.ph[i]
				break
			end
		end

		local dt=latest.t-earliest.t
		if dt<=0 then
			return nil,0,0
		end

		local velocity=clampMagnitude(flat(latest.pos-earliest.pos)/dt,MAX_RUN_SPEED)
		local quality=math.clamp(dt/math.max(PREDICTOR_HISTORY_MAX_AGE,0.05),0,1)
		return velocity,quality,dt
	end

	local function currentReceiverRawVelocity(data,receiverRoot,fallbackVelocity)
		local now=os.clock()
		local assembly=receiverRoot and receiverRoot.AssemblyLinearVelocity or nil
		local assemblyXZ=assembly and flat(assembly) or Vector3.zero
		local rawXZ=flat((data and data.rawVel) or fallbackVelocity or Vector3.zero)
		local storedXZ=flat((data and data.vel) or Vector3.zero)
		local canTrustAssembly=receiverRoot and rootHasMoveInput(receiverRoot) and now>=possessionSettleUntil

		-- AssemblyLinearVelocity is preferred when it is clearly moving; otherwise use the
		-- immediate position-delta velocity from the heartbeat tracker. No route-shape basis.
		local velocity=Vector3.zero
		local source="none"
		if canTrustAssembly and assemblyXZ.Magnitude>=CLEAN_MOVING_SPEED_MIN then
			velocity=assemblyXZ
			source="assembly"
		elseif rawXZ.Magnitude>=CLEAN_MOVING_SPEED_MIN then
			velocity=rawXZ
			source="raw_delta"
		elseif storedXZ.Magnitude>=CLEAN_MOVING_SPEED_MIN then
			velocity=storedXZ
			source="stored"
		end

		if velocity.Magnitude<CLEAN_MOVING_SPEED_MIN then
			return Vector3.zero,"stopped",0
		end

		return clampMagnitude(velocity,MAX_RUN_SPEED),source,velocity.Magnitude
	end

	local function predictionState(data,receiverPosition,fallbackVelocity,receiverRoot)
		local now=os.clock()
		local rawVelocity,source,rawSpeed=currentReceiverRawVelocity(data,receiverRoot,fallbackVelocity)
		local routeVelocity=Vector3.zero
		if rawVelocity.Magnitude>=CLEAN_MOVING_SPEED_MIN then
			routeVelocity=rawVelocity.Unit*MAX_RUN_SPEED
		end

		local acceleration=clampMagnitude(flat(data and data.accel or Vector3.zero),PREDICTOR_ACCEL_MAX)
		local sampleAge=data and data.lastSeen and math.max(now-data.lastSeen,0) or PREDICTOR_STALE_AFTER
		local moving=routeVelocity.Magnitude>0
		local confidence=moving and 1 or PREDICTOR_CONFIDENCE_MIN

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
		-- Compatibility shim. Clean math does not hold old route direction.
		local velocity,source,rawSpeed=currentReceiverRawVelocity(data,nil,data and data.rawVel or Vector3.zero)
		if velocity.Magnitude<CLEAN_MOVING_SPEED_MIN then
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
			data.sspeed=MAX_RUN_SPEED
			data.stime=os.clock()
			data.src=source
		end
		return direction,MAX_RUN_SPEED,source
	end

	local function movementShape(origin,position,velocity)
		-- Diagnostic only. The clean solver does not change the target formula based on this label.
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
		if velocity.Magnitude<CLEAN_MOVING_SPEED_MIN then
			return nil
		end

		local ball=currentHeldBall()
		local characterRoot=rootOfPlayer(LP)
		local qbPosition=(ball and ball.Position) or (characterRoot and characterRoot.Position) or receiverRoot.Position
		local routeVelocity=velocity.Unit*MAX_RUN_SPEED

		return{
			player=receiver,
			createdAt=os.clock(),
			routeDir=routeVelocity.Unit,
			routeSpeed=MAX_RUN_SPEED,
			routeVelocity=routeVelocity,
			stableSource=source,
			shape=movementShape(qbPosition,receiverRoot.Position,routeVelocity),
		}
	end

	local function routeVelocity(receiver,data,originPosition,receiverRoot,routeLock)
		local state=predictionState(data,receiverRoot.Position,data and data.rawVel or Vector3.zero,receiverRoot)
		local velocity=state.velocity or Vector3.zero

		if velocity.Magnitude<CLEAN_MOVING_SPEED_MIN then
			state.routeVelocity=Vector3.zero
			return Vector3.zero,"standing",state
		end

		-- H locks receiver identity only. Direction always uses the current raw vector.
		velocity=velocity.Unit*MAX_RUN_SPEED
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
			if flat(offset).Magnitude<=RECEIVER_CATCH_ANCHOR_MAX_OFFSET and math.abs(offset.Y)<=RECEIVER_CATCH_ANCHOR_MAX_OFFSET then
				local blended=rootPosition:Lerp(boxPosition,RECEIVER_CATCH_ANCHOR_BLEND)
				return Vector3.new(blended.X,rootPosition.Y,blended.Z),"tackle_box"
			end
		end

		return rootPosition,"root"
	end

	local function qbYCorrection(qbRoot)
		local y=qbRoot.Position.Y
		local vy=qbRoot.AssemblyLinearVelocity.Y
		if not(math.abs(vy)>=QB_AIRBORNE_VY_EPSILON or y>QB_GROUND_ROOT_Y+QB_AIRBORNE_Y_EPSILON) then
			return 0
		end

		local raw=vy>=0 and vy*QB_RELEASE_DELAY*QB_Y_RISE_FACTOR or -vy*QB_RELEASE_DELAY*QB_Y_FALL_FACTOR
		return math.clamp(raw,0,QB_Y_MAX_CORRECTION)
	end

	local function releaseVerticalVelocity(qbRoot,ball)
		local rootVelocity=qbRoot and qbRoot.AssemblyLinearVelocity or Vector3.zero
		local ballVelocity=ball and ball.AssemblyLinearVelocity or Vector3.zero

		if math.abs(ballVelocity.Y)>=QB_AIRBORNE_VY_EPSILON then
			return ballVelocity.Y,"ball"
		end

		return rootVelocity.Y,"root"
	end

	local function origin(qbRoot,ball,xzReleaseOffset,yReleaseOffset)
		xzReleaseOffset=xzReleaseOffset or 0
		if yReleaseOffset==nil then
			yReleaseOffset=0
		end

		local rootVelocity=movementAwareRootVelocity(qbRoot)
		local fallbackPosition=ball and ball.Position or qbRoot.Position
		local c2Pos=c2Position()
		local y=fallbackPosition.Y

		if c2Pos then
			local rootY=qbRoot.Position.Y
			local ballY=ball and ball.Position.Y or rootY
			local yDelta=math.min(math.abs(c2Pos.Y-rootY),math.abs(c2Pos.Y-ballY))
			local yValid=yDelta<=C2_MAX_Y_DELTA
				and c2Pos.Y>=math.min(rootY,ballY)-C2_GROUND_FALLBACK_MARGIN
				and c2Pos.Y<=math.max(rootY,ballY)+C2_MAX_ABOVE_BALL

			if yValid then
				-- C2 belongs to the local preview rig. Keep its useful release height,
				-- but never take its XZ and then add server-position drift on top.
				y=c2Pos.Y
			end
		end

		local dx,dz=0,0
		if QB_RELEASE_EXTRAPOLATE_HORIZONTAL and xzReleaseOffset>0 then
			dx=rootVelocity.X*xzReleaseOffset
			dz=rootVelocity.Z*xzReleaseOffset
		end

		if QB_RELEASE_EXTRAPOLATE_VERTICAL and yReleaseOffset>0 then
			local verticalVelocity=releaseVerticalVelocity(qbRoot,ball)
			local airborne=math.abs(verticalVelocity)>=QB_AIRBORNE_VY_EPSILON or qbRoot.Position.Y>QB_GROUND_ROOT_Y+QB_AIRBORNE_Y_EPSILON
			if airborne then
				local yOffset=verticalVelocity*yReleaseOffset-0.5*PLAYER_G*yReleaseOffset*yReleaseOffset
				y=y+math.clamp(yOffset,-QB_RELEASE_VERTICAL_DRIFT_MAX,QB_RELEASE_VERTICAL_DRIFT_MAX)
			end
		end

		return Vector3.new(fallbackPosition.X+dx,y+QB_LAUNCH_Y_BIAS+qbYCorrection(qbRoot),fallbackPosition.Z+dz)
	end

	local function directionalReleaseOrigin(qbRoot,direction,timingOffset)
		if not qbRoot then return nil end

		local character=qbRoot.Parent
		local primary=character and character.PrimaryPart
		local base=(primary and primary:IsA("BasePart") and primary.Position) or qbRoot.Position
		local velocity=movementAwareRootVelocity(qbRoot)
		local futureBase=base+flat(velocity)*(timingOffset or 0)
		local fallback=unit(flat(qbRoot.CFrame.LookVector),Vector3.new(0,0,-1))
		local dir=unit(flat(direction or fallback),fallback)
		local releaseCFrame=CFrame.lookAt(futureBase,futureBase+dir)

		return(releaseCFrame*CFrame.new(DIRECTIONAL_RELEASE_SIDE_OFFSET,DIRECTIONAL_RELEASE_HEIGHT_OFFSET,0)).Position
	end

	local function ensureC1Marker()
		if not C1_MARKER_ENABLED then return nil end

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
			marker.Size=Vector3.new(C1_MARKER_SIZE,C1_MARKER_SIZE,C1_MARKER_SIZE)
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
		if not C3_INFO_GUI_ENABLED then return nil,nil end

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
			billboard.Size=C3_INFO_GUI_SIZE
			billboard.StudsOffset=C3_INFO_GUI_OFFSET
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
			billboard.Size=C3_INFO_GUI_SIZE
			billboard.StudsOffset=C3_INFO_GUI_OFFSET
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

	local function collectArcDefenderRoots(receiver)
		local roots={}
		local localTeam=teamOf(LP)

		for _,player in ipairs(currentPlayers()) do
			local playerTeam=teamOf(player)
			if player~=receiver and player~=LP and isValidGameTeamID(playerTeam) and isValidGameTeamID(localTeam) and playerTeam~=localTeam then
				local defenderRoot=rootOfPlayer(player)
				if defenderRoot then
					roots[#roots+1]=defenderRoot
				end
			end
		end

		return roots
	end

	local function defenderCanReachBall(defenderRoot,ballPosition,elapsed,catchY)
		if not defenderRoot or not ballPosition or elapsed<=0 then
			return false
		end

		if ballPosition.Y>catchY+SAFE_ARC_CATCHABLE_Y_MARGIN then
			return false
		end

		local reachRadius=DEFENDER_SETTINGS.Speed*elapsed
		return (flat(defenderRoot.Position)-flat(ballPosition)).Magnitude<=reachRadius
	end

	local function trajectoryCanBeDefended(plan,receiver)
		if state.qbAimSafeArc==false or not plan then
			return false
		end

		local defenderRoots=collectArcDefenderRoots(receiver)
		if #defenderRoots==0 then
			return false
		end

		local catchPoint=plan.target or plan.c1Point
		local catchY=catchPoint and catchPoint.Y or nil
		local maxTime=plan.time or plan.landingTime
		if not(plan.origin and plan.velocity and catchY and maxTime and maxTime>0) then
			return true
		end

		for time=SAFE_ARC_SAMPLE_DT,maxTime,SAFE_ARC_SAMPLE_DT do
			local ballPosition=mathCore.ballAt(plan.origin,plan.velocity,time)
			for _,defenderRoot in ipairs(defenderRoots) do
				if defenderCanReachBall(defenderRoot,ballPosition,time,catchY) then
					return true
				end
			end
		end

		return false
	end

	local function planCanBeDefended(plan,receiver)
		return trajectoryCanBeDefended(plan,receiver)
	end

	local function updateArcSafetyColor(beam,unsafe)
		if not beam then return end

		if unsafe then
			beam.Color=ColorSequence.new(ARC_SETTINGS.UnsafeColor)
		elseif preview.beamDefaultColor then
			beam.Color=preview.beamDefaultColor
		end
	end

	local function clearPreviewVisuals(destroyCenter)
		previewFrozen=false
		preview.ballMissingSince=nil
		preview.p1,preview.p2,preview.p3=nil,nil,nil
		hideQBTrailPreview()

		if destroyCenter then
			destroyPreviewCenter()
		end
	end

	local function previewPlan(plan)
		if not(ARC_PREVIEW_ENABLED and plan and state.qbAimShowArc~=false) then
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
		local endPoint=plan.landing or catchPoint
		local previewTime=plan.landingTime or plan.time
		local catchTime=plan.time
		if not(startPoint and catchPoint and endPoint and previewTime and catchTime) then return end

		local endVelocity=plan.velocity+G*previewTime
		local p2=startPoint
		local p1=catchPoint
		local p3=endPoint

		if preview.p2 then
			p2=preview.p2:Lerp(p2,PREVIEW_SMOOTH)
		end

		if preview.p1 and (p1-preview.p1).Magnitude<=28 then
			p1=preview.p1:Lerp(p1,PREVIEW_SMOOTH)
		end

		if preview.p3 and (p3-preview.p3).Magnitude<=85 then
			p3=preview.p3:Lerp(p3,PREVIEW_SMOOTH)
		end

		preview.p1,preview.p2,preview.p3=p1,p2,p3
		setAttachmentCFrame(c2,xAxisCFrame(p2,plan.velocity)*CFrame.Angles(ARC_SETTINGS.AttachmentRoll,0,0))
		setAttachmentCFrame(c1,xAxisCFrame(p1,plan.velocity+G*catchTime)*CFrame.Angles(ARC_SETTINGS.AttachmentRoll,0,0))
		setAttachmentCFrame(c3,xAxisCFrame(p3,endVelocity)*CFrame.Angles(ARC_SETTINGS.AttachmentRoll,0,0))
		updateC1AndC3Info(plan,p1,p3)
		beam.Attachment0=c2
		beam.Attachment1=c3
		beam.CurveSize0=math.clamp(plan.velocity.Magnitude*previewTime/3,-ARC_MAX_CURVE,ARC_MAX_CURVE)
		beam.CurveSize1=math.clamp(endVelocity.Magnitude*previewTime/3,-ARC_MAX_CURVE,ARC_MAX_CURVE)
		updateArcSafetyColor(beam,planCanBeDefended(plan,trackedReceiver))
		setPreviewCenterVisible(true)
		beam.Enabled=true
	end

	local function currentBallPower()
		return getModeKey(ctx)=="mode3" and SQUADS_BALL_POWER or GAMEPLAY_BALL_POWER
	end

	local function throwBlocked()
		return throwInProgress or os.clock()-lastThrowAt<THROW_INPUT_COOLDOWN
	end

	local function waitForHeldBallRelease()
		local deadline=os.clock()+THROW_RELEASE_CONFIRM_TIMEOUT
		local detachedSince=nil

		while os.clock()<deadline do
			if not currentHeldBall() then
				detachedSince=detachedSince or os.clock()
				if os.clock()-detachedSince>=THROW_RELEASE_CONFIRM_STABLE_TIME then
					return true
				end
			else
				detachedSince=nil
			end

			RunService.Heartbeat:Wait()
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
		if not FREEZE_PREVIEW_WHILE_BALL_RELEASED then return end
		if plan then
			previewPlan(plan)
		end
		previewFrozen=true
		previewFreezeStarted=os.clock()
	end

	local function getTimingWindow()
		local rtt=0
		local ok,value=pcall(function()
			return LP:GetNetworkPing()
		end)

		if ok and type(value)=="number" and value==value and value>=0 then
			rtt=value
		end

		local mid=math.clamp(rtt*0.5,0,RELEASE_TIMING_MID_MAX)
		local radius=math.clamp(mid*RELEASE_TIMING_RADIUS_PING_SCALE+RELEASE_TIMING_RADIUS_MIN,RELEASE_TIMING_RADIUS_MIN,RELEASE_TIMING_RADIUS_MAX)
		return{
			min=math.max(0,mid-radius),
			mid=mid,
			max=mid+radius,
			radius=radius,
			width=radius*2,
		}
	end

	local function receiverAge(data)
		return data and data.lastSeen and math.max(0,os.clock()-data.lastSeen) or PREDICTOR_STALE_AFTER
	end

	local function receiverUncertainty(data,timing)
		local sampleAge=receiverAge(data)
		local timingWidth=timing and timing.width or 0
		local accel=flat(data and data.accel or Vector3.zero).Magnitude
		local accelFactor=math.clamp(accel/PREDICTOR_ACCEL_MAX,0,1)

		return sampleAge*MAX_RUN_SPEED+timingWidth*MAX_RUN_SPEED+accelFactor*2
	end

	local function stableAcrossWindow(early,mid,late)
		if not(early and mid and late and early.target and mid.target and late.target and early.angleDeg and mid.angleDeg and late.angleDeg) then
			return false
		end

		local targetSpread=math.max(
			(early.target-mid.target).Magnitude,
			(late.target-mid.target).Magnitude,
			(early.target-late.target).Magnitude
		)
		local angleSpread=math.max(
			math.abs(early.angleDeg-mid.angleDeg),
			math.abs(late.angleDeg-mid.angleDeg),
			math.abs(early.angleDeg-late.angleDeg)
		)

		return targetSpread<=RELEASE_TARGET_SPREAD_MAX and angleSpread<=RELEASE_ANGLE_SPREAD_MAX,targetSpread,angleSpread
	end

	local function buildPlan(receiver,ballPower,releaseOffset,releaseBall,receiverReleaseOffset,yReleaseOffset,originOverride)
		if not canTargetReceiver(receiver) then
			return nil,nil
		end

		local character=LP.Character
		local qbRoot=rootOfPlayer(LP) or root(character)
		local ball=releaseBall or currentHeldBall()
		local receiverRoot=rootOfPlayer(receiver)
		local data=receiverData[receiver] or ensureReceiverData(receiver,receiverRoot)

		if not(qbRoot and ball and receiverRoot and data) then
			return nil
		end

		releaseOffset=releaseOffset or 0
		receiverReleaseOffset=receiverReleaseOffset==nil and releaseOffset or receiverReleaseOffset
		yReleaseOffset=yReleaseOffset or 0
		local originPosition=originOverride or origin(qbRoot,ball,0,yReleaseOffset)
		local receiverAnchorPosition,receiverAnchorSource=receiverCatchAnchor(receiver,receiverRoot)
		local targetVelocity,shape,predictorState=routeVelocity(receiver,data,originPosition,receiverRoot,selectedRouteLock)
		local catchY=catchYForPosition(receiverAnchorPosition or receiverRoot.Position)
		return mathCore.solve({
			originPosition=originPosition,
			receiverPosition=receiverRoot.Position,
			receiverAnchorPosition=receiverAnchorPosition,
			receiverAnchorSource=receiverAnchorSource,
			targetVelocity=targetVelocity,
			shape=shape,
			ballPower=ballPower or currentBallPower(),
			qbVelocity=movementAwareRootVelocity(qbRoot),
			qbReleaseOffset=releaseOffset,
			receiverReleaseOffset=receiverReleaseOffset,
			predictorState=predictorState,
			catchY=catchY,
			solveYBias=C1_SOLVE_Y_BIAS,
			leadDelay=WR_LEAD_DELAY,
			leadDelayBaseline=LEAD_DELAY_BASELINE,
			maxRunSpeed=MAX_RUN_SPEED,
			minTime=MIN_T,
			maxTime=MAX_T,
			dt=DT,
			qbInheritance=QB_INHERITANCE,
			bisectionSteps=INTERCEPT_BISECTION_STEPS,
			minAngle=GLOBAL_MIN_ANGLE,
			maxAngle=GLOBAL_MAX_ANGLE,
			aimScale=AIM_SCALE,
			catchYTolerance=CLEAN_CATCH_Y_TOLERANCE,
			targetMissTolerance=CLEAN_TARGET_MISS_TOLERANCE,
			nearTargetMissTolerance=CLEAN_NEAR_TARGET_MISS_TOLERANCE,
			predictorConfidenceMin=PREDICTOR_CONFIDENCE_MIN,
			predictorConfidenceMax=PREDICTOR_CONFIDENCE_MAX,
			tangentDominanceEpsilon=CIRCLE_TANGENT_DOMINANCE_EPSILON,
			remoteFireDelayed=not THROW_TARGET_FIRE_IMMEDIATELY,
		}),ball
	end

	local function buildTwoPassPlan(receiver,ballPower,releaseBall,qbOffset,wrOffset)
		local first=buildPlan(receiver,ballPower,0,releaseBall,wrOffset,0,nil)
		if not(first and first.direction) then
			return nil
		end

		local qbRoot=rootOfPlayer(LP) or root(LP.Character)
		local originOverride=directionalReleaseOrigin(qbRoot,first.direction,qbOffset)
		if not originOverride then
			return nil
		end

		local second=buildPlan(receiver,ballPower,qbOffset,releaseBall,wrOffset,0,originOverride)
		if second then
			second.firstPassOrigin=first.origin
			second.directionalReleaseOrigin=originOverride
			second.releaseTimingOffset=qbOffset
		end

		return second
	end

	local function buildReleaseWindowPlans(receiver,ballPower,releaseBall)
		local receiverRoot=rootOfPlayer(receiver)
		local data=receiverData[receiver] or ensureReceiverData(receiver,receiverRoot)
		if not data then
			return nil,"receiver tracking unavailable"
		end

		local timing=getTimingWindow()
		local age=receiverAge(data)
		local mid=buildTwoPassPlan(receiver,ballPower,releaseBall,timing.mid,age+timing.mid)
		if not mid then
			return nil,"no release throw solution"
		end

		if state.qbAimSafeArc==false then
			return{
				mid=mid,
				timing=timing,
				uncertainty=0,
			}
		end

		local uncertainty=receiverUncertainty(data,timing)
		if uncertainty>RECEIVER_UNCERTAINTY_MAX then
			return nil,"receiver uncertainty too high"
		end

		local early=buildTwoPassPlan(receiver,ballPower,releaseBall,timing.min,age+timing.min)
		local late=buildTwoPassPlan(receiver,ballPower,releaseBall,timing.max,age+timing.max)
		local stable=stableAcrossWindow(early,mid,late)
		if not stable then
			return nil,"timing window unstable"
		end

		return{
			early=early,
			mid=mid,
			late=late,
			timing=timing,
			uncertainty=uncertainty,
		}
	end

	local function buildReleasePlan(receiver,ballPower,releaseBall)
		if not THROW_TARGET_FIRE_IMMEDIATELY and THROW_ANIMATION_RELEASE_WAIT>0 then
			local endAt=os.clock()+THROW_ANIMATION_RELEASE_WAIT
			local fireAt=endAt-math.clamp(THROW_REMOTE_LEAD_TIME,0,THROW_ANIMATION_RELEASE_WAIT)

			while os.clock()<fireAt do
				if THROW_TARGET_LOCK_PREVIEW_LIVE then
					local data=receiverData[receiver]
					local timing=getTimingWindow()
					local livePlan=buildTwoPassPlan(receiver,ballPower,releaseBall,timing.mid,receiverAge(data)+timing.mid)
					if livePlan then
						previewPlan(livePlan)
					end
				end

				RunService.Heartbeat:Wait()
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
			return false,"Gameplay ReEvent missing"
		end

		reEvent:FireServer("Mechanics","ThrowBall",{
			Target=plan.aimPoint,
			AutoThrow=false,
			Power=REMOTE_DISPLAY_POWER,
		})

		-- Do not call local UnequipFootball here. Normal flow lets the server send the
		-- incoming Mechanics/UnequipFootball and UpdateFootball events after ThrowBall.
		return true,nil
	end

	local function fireSquadsThrow(plan)
		local reEvent=getSquadsReEvent()
		if not reEvent then
			return false,"Squads MiniGames ReEvent missing"
		end

		reEvent:FireServer("Mechanics","ThrowBall",{
			Target=plan.aimPoint,
			AutoThrow=false,
			Power=REMOTE_DISPLAY_POWER, -- must be 100, not plan.speed/95
		})

		return true,nil
	end

	local function throwTo(receiver)
		if not(enabled and isAvailable()) then return end

		if throwBlocked() then
			setStatus("Throw already in progress")
			return
		end

		if not canTargetReceiver(receiver) then
			trackedReceiver=nil
			selectedRouteLock=nil
			clearPreviewVisuals()
			setTargetText()
			setStatus(state.qbAimTeamFilter~=false and "Target not teammate" or "No receiver locked")
			return
		end

		local heldBall=currentHeldBall()
		if not heldBall then
			clearPreviewForMissingBall("No ball held")
			return
		end
		noteHeldBallState(heldBall,os.clock())

		local modeKey=getModeKey(ctx)
		local power=modeKey=="mode3" and SQUADS_BALL_POWER or GAMEPLAY_BALL_POWER
		local receiverRoot=rootOfPlayer(receiver)
		if not receiverRoot then
			setStatus("No receiver locked")
			return
		end

		throwInProgress=true

		local function releaseThrowLock()
			throwInProgress=false
			lastThrowAt=os.clock()
		end

		local previewData=receiverData[receiver] or ensureReceiverData(receiver,receiverRoot)
		local previewTiming=getTimingWindow()
		local previewReleasePlan=buildTwoPassPlan(receiver,power,heldBall,previewTiming.mid,receiverAge(previewData)+previewTiming.mid)
		if previewReleasePlan then
			previewPlan(previewReleasePlan)
		end

		QBAim._playThrowAnimation()

		local plan,_,reason=buildReleasePlan(receiver,power,heldBall)
		if not plan then
			releaseThrowLock()
			setStatus(reason or "No release throw solution")
			return
		end

		if trajectoryCanBeDefended(plan,receiver) then
			previewPlan(plan)
			releaseThrowLock()
			setStatus("Unsafe throw blocked")
			return
		end

		local fired,ok,err=pcall(function()
			if modeKey=="mode1" then
				return fireGameplayThrow(plan)
			elseif modeKey=="mode3" then
				return fireSquadsThrow(plan)
			end

			return false,"Park route unknown"
		end)

		if not fired then
			local thrownErr=ok
			ok=false
			err=thrownErr or "Throw failed"
		end

		if ok then
			freezePreviewAtCurrentPlan(plan)
			waitForHeldBallRelease()
			setStatus(currentModeText().." release-time throw sent")
		else
			setStatus(err or "Throw failed")
		end

		releaseThrowLock()
	end

	local function lockReceiverUnderCursor()
		if not(enabled and isAvailable()) then return end

		local camera=Workspace.CurrentCamera
		local mouse=LP:GetMouse()
		local best=nil
		local bestDistance=math.huge

		for _,player in ipairs(currentPlayers()) do
			local receiverRoot=player~=LP and rootOfPlayer(player)
			if receiverRoot and camera and canTargetReceiver(player) then
				local screenPoint,onScreen=camera:WorldToViewportPoint(receiverRoot.Position)
				if onScreen then
					local distance=(Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenPoint.X,screenPoint.Y)).Magnitude
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
			preview.p1,preview.p2,preview.p3=nil,nil,nil
			setTargetText()
			setStatus("Locked "..best.Name)
		else
			setStatus(state.qbAimTeamFilter~=false and "No teammate under cursor" or "No receiver under cursor")
		end
	end

	local function setEnabled(value)
		enabled=value and isAvailable() and true or false
		state.qbAimEnabled=enabled
		if not enabled then
			trackedReceiver=nil
			selectedRouteLock=nil
			previewFrozen=false
			preview.ballMissingSince=nil
			preview.p1,preview.p2,preview.p3=nil,nil,nil
			hideQBTrailPreview()
			clearTargetHighlights()
		end

		syncControls()

		if enabled and not currentHeldBall() then
			setStatus("Waiting for ball")
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
			setStatus("Target cleared")
		end
		syncControls()
		if fire~=false then
			changed()
		end
	end

	function api.SetShowArcState(value,fire)
		state.qbAimShowArc=value and true or false
		if not state.qbAimShowArc then
			clearPreviewVisuals()
			setStatus("Arc hidden")
		end
		syncControls()
		if fire~=false then
			changed()
		end
	end

	function api.SetSafeArcState(value,fire)
		state.qbAimSafeArc=value and true or false
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

	function api.SetQBDrift(value,fire)
		setQBDrift(value,fire~=false)
	end

	function api.SetQBYDrift(value,fire)
		setQBYDrift(value,fire~=false)
	end

	function api.Refresh()
		syncControls()
	end

	function api.Reset()
		setEnabled(false)
	end

	function api.Destroy()
		if scheduler and type(scheduler.Unregister)=="function" then
			for _,job in ipairs(schedulerJobs) do
				scheduler.Unregister(job.kind,job.id)
			end
		end
		table.clear(schedulerJobs)

		for _,conn in ipairs(connections) do
			safeDisconnect(conn)
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

	safeArcToggle=buildToggleRow(sectionBody,"Safe Arc",state.qbAimSafeArc~=false,function(value)
		api.SetSafeArcState(value,true)
	end)

	highlightToggle=buildToggleRow(sectionBody,"Target Highlight",state.qbAimTargetHighlight~=false,function(value)
		api.SetTargetHighlightState(value,true)
	end)

	if buildSlider then
		leadDelaySliderControl=buildSlider(sectionBody,"Lead Adjust",LEAD_DELAY_MIN,LEAD_DELAY_MAX,WR_LEAD_DELAY,2,function(value)
			api.SetLeadDelay(value,true)
		end)
		peakHeightSliderControl=buildSlider(sectionBody,"Peak Height",PEAK_HEIGHT_MIN,PEAK_HEIGHT_MAX,WR_MAX_Y,2,function(value)
			api.SetPeakHeight(value,true)
		end)
	else
		leadDelayFrame=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,26),ZIndex=6},sectionBody)
		leadDelayBox=New("TextBox",{BackgroundColor3=THEME.BG,BorderSizePixel=0,Position=UDim2.new(1,-72,0,0),Size=UDim2.fromOffset(72,24),Text=string.format("%.2f",WR_LEAD_DELAY),ClearTextOnFocus=false,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=7},leadDelayFrame)
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-80,0,24),Text="Lead Adjust",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7},leadDelayFrame)
		addConnection(leadDelayBox.FocusLost:Connect(function()
			setLeadDelay(leadDelayBox.Text,true)
		end))
		peakHeightFrame=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,26),ZIndex=6},sectionBody)
		peakHeightBox=New("TextBox",{BackgroundColor3=THEME.BG,BorderSizePixel=0,Position=UDim2.new(1,-72,0,0),Size=UDim2.fromOffset(72,24),Text=string.format("%.2f",WR_MAX_Y),ClearTextOnFocus=false,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=7},peakHeightFrame)
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-80,0,24),Text="Peak Height",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7},peakHeightFrame)
		addConnection(peakHeightBox.FocusLost:Connect(function()
			setPeakHeight(peakHeightBox.Text,true)
		end))
	end

	updateLeadDelayVisuals()
	updatePeakHeightVisuals()

	local function receiverTrackStep(dt)
		if not(enabled and isAvailable()) then return end
		if not isAlive() then return end

		receiverTrackElapsed=receiverTrackElapsed+(dt or 0)
		if receiverTrackElapsed<TRACK_SETTINGS.ReceiverInterval then return end
		receiverTrackElapsed=0

		local now=os.clock()
		for _,player in ipairs(currentPlayers()) do
			if player~=LP then
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
						local positionMoving=flat(positionVelocity).Magnitude>=CLEAN_MOVING_SPEED_MIN
						local assemblyMoving=flat(assemblyVelocity).Magnitude>=CLEAN_MOVING_SPEED_MIN
						local chosenVelocity=Vector3.zero

						if positionMoving then
							chosenVelocity=positionVelocity
						elseif rootHasMoveInput(receiverRoot) and assemblyMoving and now>=possessionSettleUntil then
							chosenVelocity=assemblyVelocity
						end

						if flat(chosenVelocity).Magnitude>=CLEAN_MOVING_SPEED_MIN then
							data.movingSamples=(data.movingSamples or 0)+1
						else
							data.movingSamples=0
						end

						if (data.movingSamples or 0)<MOVING_CONFIRM_SAMPLES then
							chosenVelocity=Vector3.zero
						end

						local previousRawVelocity=data.rawVel or Vector3.zero
						local rawAcceleration=(chosenVelocity-previousRawVelocity)/sampleDt

						data.rawVel=clampMagnitude(chosenVelocity,MAX_RUN_SPEED)
						data.vel=data.rawVel
						data.accel=clampMagnitude(rawAcceleration,PREDICTOR_ACCEL_MAX)
						data.confidence=flat(data.rawVel).Magnitude>=CLEAN_MOVING_SPEED_MIN and PREDICTOR_CONFIDENCE_MAX or PREDICTOR_CONFIDENCE_MIN
						data.pos=receiverRoot.Position
						data.t=now
						data.lastSeen=now
						table.insert(data.ph,{t=now,pos=receiverRoot.Position})

						while #data.ph>0 and now-data.ph[1].t>PREDICTOR_HISTORY_MAX_AGE do
							table.remove(data.ph,1)
						end
					end
				end
			end
		end
	end

	if not addSchedulerJob("Heartbeat","QBAimReceiverTrack",TRACK_SETTINGS.ReceiverInterval,receiverTrackStep) then
		addConnection(RunService.Heartbeat:Connect(receiverTrackStep))
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
		if FREEZE_PREVIEW_WHILE_BALL_RELEASED then
			if previewFrozen then
				if now-previewFreezeStarted<PREVIEW_POST_THROW_FREEZE_MIN then
					return
				end
				previewFrozen=false
			end

			heldBall=currentHeldBall()
			local holdingBall=heldBall~=nil
			if not holdingBall then
				preview.ballMissingSince=preview.ballMissingSince or now
				if now-preview.ballMissingSince<PREVIEW_MISSING_BALL_GRACE then
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

		if now-preview.last<ARC_SETTINGS.UpdateInterval then return end
		preview.last=now

		local timing=getTimingWindow()
		local data=receiverData[trackedReceiver]
		local plan=buildTwoPassPlan(trackedReceiver,nil,heldBall,timing.mid,receiverAge(data)+timing.mid)
		if plan then
			previewPlan(plan)
		end
	end

	if not addSchedulerJob("RenderStepped","QBAimPreview",0,previewStep) then
		addConnection(RunService.RenderStepped:Connect(previewStep))
	end

	local function handleQBAimInput(input)
		if not isAvailable() then return false end

		if bindingMatches("getQBAimToggleKey",input,Enum.KeyCode.P) then
			setEnabled(not enabled)
			return true
		end

		if not enabled then return false end

		local wantsLock=bindingMatches("getQBAimLockKey",input,Enum.KeyCode.H)
		local wantsThrow=bindingMatches("getQBAimThrowKey",input,Enum.KeyCode.T)
		if not(wantsLock or wantsThrow) then return false end

		if wantsLock then
			lockReceiverUnderCursor()
			return true
		end

		if wantsThrow and throwBlocked() then
			setStatus("Throw already in progress")
			return true
		end

		if not currentHeldBall() then
			clearPreviewForMissingBall("No ball held")
			return true
		end

		if wantsThrow then
			if trackedReceiver then
				throwTo(trackedReceiver)
			else
				setStatus("No receiver locked")
			end
		end

		return true
	end

	addConnection(UIS.InputBegan:Connect(function(input,processed)
		if processed then return end
		handleQBAimInput(input)
	end))

	cleanupC3InfoGui()
	clearTargetHighlights()
	syncControls()
	return api
end

return QBAim
