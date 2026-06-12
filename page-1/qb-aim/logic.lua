local QBAim={}

local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local Workspace=game:GetService("Workspace")
local ReplicatedStorage=game:GetService("ReplicatedStorage")

local LP=Players.LocalPlayer

local YARDS_TO_STUDS=3
local BALL_G=28
local G=Vector3.new(0,-BALL_G,0)
local MODEL_BALL_SPEED=95
local REMOTE_DISPLAY_POWER=100 -- send to remote; server converts incoming UpdateFootball Power to 95
local GAMEPLAY_BALL_POWER=MODEL_BALL_SPEED
local SQUADS_BALL_POWER=MODEL_BALL_SPEED
local PLAYER_G=196.2
local JUMP_POWER=55.5
local WR_STANDING_TOP_Y=6.00
local DEFAULT_WR_MAX_Y=14.00 -- clean default catch peak; original jump formula is ~=13.85
local WR_MAX_Y=DEFAULT_WR_MAX_Y
local C1_Y_MIN=WR_MAX_Y
local C1_Y_MAX=WR_MAX_Y
local C1_Y_FIXED=WR_MAX_Y
local C1_Y_POTENTIAL_EXPONENT=1.00
local C1_SOLVE_Y_BIAS=0.00
local MAX_RUN_SPEED=21
local NORMAL_ROUTE_MIN_SPEED=19
local ROUTE_LOCK_MIN_SPEED=2.5
local ROUTE_LOCK_MAX_AGE=1.5
local CLEAN_MATH_ENABLED=true
local CLEAN_MOVING_SPEED_MIN=5.0
local CLEAN_CATCH_Y_TOLERANCE=0.35
local CLEAN_TARGET_MISS_TOLERANCE=0.35
local CLEAN_NEAR_TARGET_MISS_TOLERANCE=0.05
local CLEAN_USE_DIRECT_LEAD=true
local WR_LEAD_DELAY=0.38
local LEAD_DELAY_BASELINE=0.38 -- clean math: Lead Adjust is direct intentional ahead-time
local LEAD_DELAY_ZERO_FLIGHT_TIME=0.70
local LEAD_DELAY_FULL_FLIGHT_TIME=1.35
local ADAPTIVE_LEAD_ENABLED=true
local ROUTE_SPEED_PARTIAL_GAIN=1.08
local PREDICTOR_HISTORY_MAX_AGE=0.30
local PREDICTOR_MIN_SAMPLES=3
local PREDICTOR_LS_BLEND=0.00
local PREDICTOR_VELOCITY_BLEND=1.00
local PREDICTOR_ACCEL_BLEND=0.28
local PREDICTOR_ACCEL_MAX=48
local PREDICTOR_ACCEL_TIME_MAX=1.05
local PREDICTOR_ACCEL_LEAD_SCALE=0.22
local PREDICTOR_ACCEL_LEAD_MAX=9.5
local PREDICTOR_CONFIDENCE_MIN=0.30
local PREDICTOR_CONFIDENCE_MAX=1.00
local PREDICTOR_STALE_AFTER=0.35
local ADAPTIVE_RADIAL_FLIGHT_SCALE_MIN=0.45
local ADAPTIVE_RADIAL_FLIGHT_SCALE_MAX=1.12
local ADAPTIVE_TANGENT_FLIGHT_SCALE_MIN=0.38
local ADAPTIVE_TANGENT_FLIGHT_SCALE_MAX=0.95
local ADAPTIVE_CLOSING_TANGENT_DAMPING=0.55
local ADAPTIVE_UNCERTAINTY_DAMPING=0.45
local AXIS_INVARIANT_LEAD_ENABLED=true
local AXIS_EXTRA_LEAD_FRACTION=0.08
local AXIS_EXTRA_LEAD_TIME_MAX=0.16
local AXIS_LOS_RATE_GAIN=3.00
local AXIS_CLOSING_EXTRA_DAMPING=0.75
local AXIS_BRAKE_FLIGHT_DAMPING=0.38
local QB_RELEASE_DELAY=0.25
local QB_XZ_RELEASE_FACTOR=0
local QB_LAUNCH_Y_BIAS=0
local QB_GROUND_ROOT_Y=3.648
local QB_AIRBORNE_Y_EPSILON=0.35
local QB_AIRBORNE_VY_EPSILON=2
local QB_Y_RISE_FACTOR=0
local QB_Y_FALL_FACTOR=0
local QB_Y_MAX_CORRECTION=4.25
local C2_GROUND_FALLBACK_MARGIN=2.50
local C2_MAX_ABOVE_BALL=8.00
local QB_RELEASE_EXTRAPOLATE_HORIZONTAL=true
local QB_RELEASE_EXTRAPOLATE_VERTICAL=false
local MIN_T,MAX_T,DT=0.35,6,0.01
local QB_INHERITANCE=0
local INTERCEPT_BISECTION_STEPS=12
local SPEED_TOLERANCE=1.25
local CATCH_TOLERANCE=2.0
local GLOBAL_MIN_ANGLE=-5
local GLOBAL_MAX_ANGLE=55
local AIM_SCALE=1000
local ARC_PREVIEW_ENABLED=true
local ARC_PREVIEW_UPDATE_INTERVAL=0.035
local RECEIVER_TRACK_INTERVAL=0.05
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
local STABLE_WINDOW=0.48
local STABLE_MIN_DIST=2
local STABLE_MIN_SPEED=5
local STABLE_HOLD=0.55
local STABLE_STOP_SPEED=1.75
local STABLE_DOT_REPLACE=0.72
local STABLE_BLEND=0.18
local CIRCLE_RADIUS_FULL_LEAD=180
local CIRCLE_DISTANCE_SCALE_MIN=0.35
local CIRCLE_DISTANCE_SCALE_MAX=1.00
local CIRCLE_RADIAL_EXTRA_BASE=0.55
local CIRCLE_RADIAL_EXTRA_GAIN=0.45
local CIRCLE_RADIAL_EXTRA_MIN=0.25
local CIRCLE_RADIAL_EXTRA_MAX=1
local CIRCLE_TANGENT_EXTRA_BASE=0.25
local CIRCLE_TANGENT_EXTRA_GAIN=0.50
local CIRCLE_TANGENT_EXTRA_MIN=0.15
local CIRCLE_TANGENT_EXTRA_MAX=0.70
local CIRCLE_LOS_RATE_GAIN=6
local CIRCLE_LOS_RATE_EPSILON=1.00
local CIRCLE_EXTRA_LEAD_TIME_MAX=0.78
local CIRCLE_BALANCE_LEAD_SCALE_MIN=0.72
local CIRCLE_BALANCE_LEAD_SCALE_MAX=1.00
local CIRCLE_TANGENT_REACTIVE_LEAD=0.58
local CIRCLE_TANGENT_REACTIVE_LOS_GAIN=1.25
local CIRCLE_TANGENT_ALIGNMENT_BOOST=0.30
local CIRCLE_TANGENT_BALANCE_BOOST=0.35
local CIRCLE_TANGENT_DOMINANCE_SCALE_MIN=0.35
local CIRCLE_TANGENT_DOMINANCE_SCALE_MAX=1.00
local CIRCLE_TANGENT_DOMINANCE_LIFT=0.30
local CIRCLE_TANGENT_DOMINANCE_EPSILON=1e-6
local CIRCLE_TANGENT_CLOSING_DAMPING=0.95
local CIRCLE_TANGENT_CLOSING_SCALE_MIN=0.42
local CIRCLE_RADIAL_BASE_LEAD_TIME=0.20
local DIAG_STREAK_SIDE_RATIO_MIN=0.30
local DIAG_STREAK_SIDE_SPEED_MIN=4
local PLAY_THROW_ANIMATION=true
local THROW_ANIMATION_NAME="UF_QuarterbackThrow"
local THROW_ANIMATION_SPEED=1.35
local THROW_ANIMATION_RELEASE_WAIT=0.26666666666666666
-- The game appears to send/sample the remote shortly before the ball actually leaves.
-- Solve at that release window instead of trusting the keybind-time plan.
local THROW_REMOTE_LEAD_TIME=0.035
local RELEASE_FRAME_PLAN_MAX_AGE=0.075
local THROW_TARGET_LOCK_ON_INPUT=true
local THROW_TARGET_LOCK_EXTRA_DELAY=0.00
local THROW_TARGET_LOCK_PREVIEW_LIVE=true
local PLAY_THROW_LOCAL_FALLBACK=false
local QB_AIM_HIGHLIGHT_NAME="QBAimTargetHighlight"
local VALID_TEAM_IDS={
	HomeTeam=true,
	AwayTeam=true,
}

local function flat(v)
	return Vector3.new(v.X,0,v.Z)
end

local function distXZ(a,b)
	return (flat(b)-flat(a)).Magnitude
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

local function smoothstep(edge0,edge1,value)
	if edge1<=edge0 then
		return value>=edge1 and 1 or 0
	end

	local alpha=math.clamp((value-edge0)/(edge1-edge0),0,1)
	return alpha*alpha*(3-2*alpha)
end

local function leadDelayForFlightTime(time)
	-- Clean math rebuild: Lead Adjust is not route classification and not radial/tangent damping.
	-- It is only the intentional ahead-time along the receiver's current velocity vector.
	-- Set Lead Adjust to 0 for pure catch-time intercept, or 0.35-0.40 for your ahead-of-WR catch window.
	return math.max(WR_LEAD_DELAY,0)
end

local function safeVectorLerp(a,b,alpha)
	if not a then return b or Vector3.zero end
	if not b then return a or Vector3.zero end
	return a:Lerp(b,math.clamp(alpha or 0,0,1))
end

local function root(character)
	return character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso"))
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

local function getFootballFromFolder(folder)
	if not folder then return nil end

	for _,descendant in ipairs(folder:GetDescendants()) do
		if descendant:IsA("BasePart") and descendant.Name=="Football" then
			return descendant
		end
	end

	return nil
end

local function getModeFootball(modeKey)
	local heldBall=getHeldBall()
	if heldBall then
		return heldBall
	end

	if modeKey=="mode3" then
		return getFootballFromFolder(Workspace:FindFirstChild("MiniGames")) or getFootballFromFolder(ReplicatedStorage:FindFirstChild("MiniGames"))
	end

	return nil
end

local function getGameReEvent()
	local games=Workspace:FindFirstChild("Games")
	if games then
		for _,gameFolder in ipairs(games:GetChildren()) do
			local replicated=gameFolder:FindFirstChild("Replicated")
			local playersFolder=replicated and replicated:FindFirstChild("Players")
			local reEvent=gameFolder:FindFirstChild("ReEvent") or (replicated and replicated:FindFirstChild("ReEvent"))

			if playersFolder and playersFolder:FindFirstChild(LP.Name) and reEvent and reEvent:IsA("RemoteEvent") then
				return reEvent
			end
		end
	end

	local replicatedGames=ReplicatedStorage:FindFirstChild("Games")
	if replicatedGames then
		for _,gameFolder in ipairs(replicatedGames:GetChildren()) do
			local replicated=gameFolder:FindFirstChild("Replicated")
			local reEvent=gameFolder:FindFirstChild("ReEvent") or (replicated and replicated:FindFirstChild("ReEvent"))

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

local cachedMechanics=nil

local function getGlobalMechanics()
	local function valid(mechanics)
		return mechanics and (type(mechanics.PlayAnimation)=="function" or type(mechanics.UnequipFootball)=="function")
	end

	if valid(cachedMechanics) then
		return cachedMechanics
	end

	local globals=(typeof(getgenv)=="function" and getgenv()) or _G or {}
	if type(globals)=="table" then
		local mechanics=rawget(globals,"Mechanics")
		if valid(mechanics) then
			cachedMechanics=mechanics
			return mechanics
		end

		local variables=rawget(globals,"Variables")
		if type(variables)=="table" and valid(variables.Mechanics) then
			cachedMechanics=variables.Mechanics
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
			cachedMechanics=variables.Mechanics
			return variables.Mechanics
		end
	end

	return nil
end

local function findThrowAnimation()
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

local function playLocalThrowAnimation()
	local character=LP.Character or Workspace:FindFirstChild(LP.Name)
	local humanoid=character and character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return false end

	local animation=findThrowAnimation()
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

local function playThrowAnimation()
	if not PLAY_THROW_ANIMATION or not getHeldBall() then return false end

	local mechanics=getGlobalMechanics()
	if mechanics and type(mechanics.PlayAnimation)=="function" then
		local ok=pcall(function()
			mechanics:PlayAnimation(THROW_ANIMATION_NAME,THROW_ANIMATION_SPEED)
		end)
		if ok then
			return true,"mechanics"
		end
	end

	if PLAY_THROW_LOCAL_FALLBACK then
		local ok=playLocalThrowAnimation()
		return ok,"local"
	end

	return false,"none"
end

function QBAim.new(ctx,parent)
	local New=ctx.New
	local THEME=ctx.THEME
	local safeDisconnect=ctx.safeDisconnect
	local inputToBinding=ctx.inputToBinding
	local makeSection=ctx.makeSection
	local buildToggleRow=ctx.buildToggleRow
	local buildSlider=ctx.buildSlider
	local state=ctx.State or {}
	local api={}
	local enabled=false
	local trackedReceiver=nil
	local selectedRouteLock=nil
	local receiverData={}
	local receiverTrackElapsed=0
	local preview={last=0,center=nil,c2=nil,c3=nil,c1=nil,beam=nil,orig=nil,p1=nil,p2=nil,p3=nil,ballMissingSince=nil}
	local previewFrozen=false
	local previewFreezeStarted=0
	local highlightedCharacter=nil
	local connections={}
	local sectionBody=nil
	local sectionFrame=nil
	local enabledToggle=nil
	local teamFilterToggle=nil
	local arcToggle=nil
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
	local updateTargetHighlight=function() end

	if state.qbAimTeamFilter==nil then
		state.qbAimTeamFilter=true
	end

	if state.qbAimShowArc==nil then
		state.qbAimShowArc=true
	end

	if state.qbAimLeadDelay==nil then
		state.qbAimLeadDelay=WR_LEAD_DELAY
	end

	if state.qbAimPeakHeight==nil then
		state.qbAimPeakHeight=WR_MAX_Y
	end

	WR_LEAD_DELAY=math.clamp(tonumber(state.qbAimLeadDelay) or WR_LEAD_DELAY,LEAD_DELAY_MIN,LEAD_DELAY_MAX)
	WR_MAX_Y=math.clamp(tonumber(state.qbAimPeakHeight) or WR_MAX_Y,PEAK_HEIGHT_MIN,PEAK_HEIGHT_MAX)
	state.qbAimPeakHeight=WR_MAX_Y
	C1_Y_MIN=WR_MAX_Y
	C1_Y_MAX=WR_MAX_Y
	C1_Y_FIXED=WR_MAX_Y

	local function addConnection(conn)
		table.insert(connections,conn)
		return conn
	end

	local function changed()
		if ctx.onChanged then
			pcall(ctx.onChanged,state)
		end
	end

	local function isAlive()
		return sectionFrame==nil or sectionFrame.Parent~=nil
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

	local function syncPeakHeightConstants()
		C1_Y_MIN=WR_MAX_Y
		C1_Y_MAX=WR_MAX_Y
		C1_Y_FIXED=WR_MAX_Y
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

	local function setPeakHeight(value,showStatus)
		local numberValue=tonumber(value)
		if not numberValue then
			updatePeakHeightVisuals()
			return false
		end

		WR_MAX_Y=math.clamp(numberValue,PEAK_HEIGHT_MIN,PEAK_HEIGHT_MAX)
		state.qbAimPeakHeight=WR_MAX_Y
		syncPeakHeightConstants()
		updatePeakHeightVisuals()
		if showStatus then
			changed()
		end
		return true
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

	local function clearTargetHighlights()
		for _,player in ipairs(Players:GetPlayers()) do
			local character=player.Character
			if character then
				destroyQBAimHighlight(character)
			end
		end

		highlightedCharacter=nil
	end

	updateTargetHighlight=function()
		local character=enabled and trackedReceiver and trackedReceiver.Character or nil
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
		local highlight=ensureQBAimHighlight(character)
		highlight.Adornee=character
		highlight.Enabled=true
		highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
		highlight.FillTransparency=0.65
		highlight.OutlineTransparency=0
		highlight.FillColor=THEME.BLUE or THEME.ACC or Color3.fromRGB(21,103,251)
		highlight.OutlineColor=THEME.ACC or THEME.BLUE or Color3.fromRGB(32,202,106)
	end

	local function ensureReceiverData(player,receiverRoot)
		if receiverData[player] or not receiverRoot then
			return receiverData[player]
		end

		local now=os.clock()
		receiverData[player]={
			pos=receiverRoot.Position,
			vel=receiverRoot.AssemblyLinearVelocity or Vector3.zero,
			rawVel=receiverRoot.AssemblyLinearVelocity or Vector3.zero,
			accel=Vector3.zero,
			confidence=PREDICTOR_CONFIDENCE_MIN,
			lastSeen=now,
			t=now,
			vh={},
			ph={{t=now,pos=receiverRoot.Position}},
			sdir=nil,
			sspeed=0,
			stime=0,
			src="seeded",
		}

		return receiverData[player]
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

	local function c2Y()
		-- Use the game's original Center.C2 only as a release-height reference.
		-- Do not read from the cloned preview C2 here, because that creates stale/self-referential C2 values.
		local center=originalCenter()
		local c2=center and center:FindFirstChild("C2",true)
		local cf=c2 and attachmentCFrame(c2)
		return cf and cf.Position.Y
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
		local assembly=receiverRoot and receiverRoot.AssemblyLinearVelocity or nil
		local assemblyXZ=assembly and flat(assembly) or Vector3.zero
		local rawXZ=flat((data and data.rawVel) or fallbackVelocity or Vector3.zero)
		local storedXZ=flat((data and data.vel) or Vector3.zero)

		-- AssemblyLinearVelocity is preferred when it is clearly moving; otherwise use the
		-- immediate position-delta velocity from the heartbeat tracker. No route-shape basis.
		local velocity=Vector3.zero
		local source="none"
		if assemblyXZ.Magnitude>=CLEAN_MOVING_SPEED_MIN then
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
		local receiverRoot=receiver.Character and root(receiver.Character)
		local data=receiverData[receiver]
		if not(receiverRoot and data) then return nil end

		local velocity,source=currentReceiverRawVelocity(data,receiverRoot,receiverRoot.AssemblyLinearVelocity)
		if velocity.Magnitude<CLEAN_MOVING_SPEED_MIN then
			return nil
		end

		local ball=getHeldBall()
		local characterRoot=LP.Character and root(LP.Character)
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

	local function receiverMaxAt(position)
		return Vector3.new(position.X,WR_MAX_Y,position.Z)
	end

	local function receiverMax(receiverRoot)
		return receiverMaxAt(receiverRoot.Position)
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

	local function origin(qbRoot,ball,releaseOffset)
		releaseOffset=releaseOffset or 0
		local rootVelocity=qbRoot.AssemblyLinearVelocity
		local basePosition=ball and ball.Position or qbRoot.Position

		local baseY=basePosition.Y
		local centerY=c2Y()
		local y=baseY
		if centerY and centerY>=baseY-C2_GROUND_FALLBACK_MARGIN and centerY<=baseY+C2_MAX_ABOVE_BALL then
			y=centerY
		end

		local dx,dz=0,0
		if QB_RELEASE_EXTRAPOLATE_HORIZONTAL and releaseOffset>0 then
			dx=rootVelocity.X*releaseOffset
			dz=rootVelocity.Z*releaseOffset
		end

		if QB_RELEASE_EXTRAPOLATE_VERTICAL and releaseOffset>0 then
			local airborne=math.abs(rootVelocity.Y)>=QB_AIRBORNE_VY_EPSILON or qbRoot.Position.Y>QB_GROUND_ROOT_Y+QB_AIRBORNE_Y_EPSILON
			if airborne then
				y=y+rootVelocity.Y*releaseOffset-0.5*PLAYER_G*releaseOffset*releaseOffset
			end
		end

		return Vector3.new(basePosition.X+dx,y+QB_LAUNCH_Y_BIAS+qbYCorrection(qbRoot),basePosition.Z+dz)
	end

	local function velocityNeeded(originPosition,targetPosition,time)
		return(targetPosition-originPosition-0.5*G*time*time)/time
	end

	local function ballAt(originPosition,velocity,time)
		return originPosition+velocity*time+0.5*G*time*time
	end

	local function landing(originPosition,velocity)
		local discriminant=velocity.Y*velocity.Y+2*BALL_G*originPosition.Y
		if discriminant<0 then return nil,nil end

		local time=(velocity.Y+math.sqrt(discriminant))/BALL_G
		if time<=0 then return nil,nil end

		return ballAt(originPosition,velocity,time),time
	end

	local function targetAtTime(receiverStart,wrVel,time,leadDelay)
		local target=receiverStart+flat(wrVel)*(time+(leadDelay or 0))
		return Vector3.new(target.X,WR_MAX_Y+C1_SOLVE_Y_BIAS,target.Z)
	end

	local function c1HeightFromMagnitudePotential(potential,speed)
		return C1_Y_FIXED
	end

	local function c1Target(receiverPosition,originPosition,targetVelocity,flightTime,predictorState)
		local receiverStart=receiverMaxAt(receiverPosition)
		local wrVel=clampMagnitude(flat(targetVelocity or Vector3.zero),MAX_RUN_SPEED)
		local leadDelay=leadDelayForFlightTime(flightTime)
		local target=targetAtTime(receiverStart,wrVel,flightTime,leadDelay)
		local speed=wrVel.Magnitude
		local losVector=flat(receiverStart-originPosition)
		local losDir=unit(losVector,speed>0 and wrVel.Unit or Vector3.new(1,0,0))
		local awayShare=speed>1e-6 and math.clamp(wrVel:Dot(losDir)/speed,-1,1) or 0
		local lateralSpeed=(wrVel-losDir*wrVel:Dot(losDir)).Magnitude
		local lateralShare=speed>1e-6 and math.clamp(lateralSpeed/speed,0,1) or 0

		return target,{
			flightLeadXZ=wrVel*flightTime,
			accelerationLeadXZ=Vector3.zero,
			extraLeadXZ=wrVel*leadDelay,
			radialExtraLeadXZ=Vector3.zero,
			tangentExtraLeadXZ=wrVel*leadDelay,
			extraLeadTime=leadDelay,
			radialExtraTime=0,
			tangentExtraTime=leadDelay,
			tangentBaseTime=0,
			tangentReactiveTime=leadDelay,
			radialBaseTime=0,
			radialLDTime=0,
			adaptiveLeadScale=1,
			leadUserScale=math.clamp(WR_LEAD_DELAY/math.max(LEAD_DELAY_BASELINE,0.01),0,2.25),
			predictorConfidence=predictorState and predictorState.confidence or 1,
			radialFlightScale=1,
			tangentFlightScale=1,
			accelTime=0,
			magnitudeChangePotential=0,
			c1Height=C1_Y_FIXED,
			c1HeightMin=C1_Y_MIN,
			c1HeightMax=C1_Y_MAX,
			c1SolveYBias=C1_SOLVE_Y_BIAS,
			distance3DNow=(receiverStart-originPosition).Magnitude,
			distanceXZNow=distXZ(originPosition,receiverStart),
			distanceScale=1,
			awayShare=awayShare,
			positiveAwayShare=math.clamp(awayShare,0,1),
			radialShareAbs=math.abs(awayShare),
			lateralShare=lateralShare,
			routeBalance=1-math.abs(math.abs(awayShare)-lateralShare),
			balanceLeadScale=1,
			radialGain=0,
			tangentGain=0,
			losRate=0,
			losDamping=1,
			reactiveLosDamping=1,
			tangentAlignment=1,
			tangentAlignmentBoost=1,
			tangentBalanceBoost=1,
			tangentDominance=lateralShare*lateralShare/(awayShare*awayShare+lateralShare*lateralShare+CIRCLE_TANGENT_DOMINANCE_EPSILON),
			tangentBalancePeak=1,
			tangentDominanceScale=1,
			closingShare=math.clamp(-awayShare,0,1),
			tangentClosingScale=1,
			tangentSignedScale=1,
			routeAway=wrVel:Dot(losDir),
			routeSide=lateralSpeed,
			routeElevation=0,
			routeSpeed=speed,
			axisInvariant=true,
			cleanMath=true,
		}
	end

	local function interceptValue(originPosition,receiverStart,wrVel,qbVel,ballSpeed,time)
		local inheritedVelocity=flat(qbVel or Vector3.zero)*QB_INHERITANCE
		local receiverLeadDelay=leadDelayForFlightTime(time)
		local target=targetAtTime(receiverStart,wrVel,time,receiverLeadDelay)
		local neededDisplacement=target-originPosition-inheritedVelocity*time-0.5*G*time*time
		return neededDisplacement:Dot(neededDisplacement)-ballSpeed*ballSpeed*time*time
	end

	local function interceptLeadInfo(originPosition,target,wrVel,time,predictorState)
		local speed=math.max(flat(wrVel).Magnitude,1e-6)
		local losVector=flat(target-originPosition)
		local losDir=unit(losVector,flat(wrVel).Magnitude>0 and flat(wrVel).Unit or Vector3.new(1,0,0))
		local away=flat(wrVel):Dot(losDir)
		local awayShare=math.clamp(away/speed,-1,1)
		local lateralSpeed=(flat(wrVel)-losDir*away).Magnitude
		local lateralShare=math.clamp(lateralSpeed/speed,0,1)
		local receiverPredictionDelay=leadDelayForFlightTime(time)
		local predictorConfidence=math.clamp(predictorState and predictorState.confidence or 1,PREDICTOR_CONFIDENCE_MIN,PREDICTOR_CONFIDENCE_MAX)

		return{
			flightLeadXZ=flat(wrVel)*time,
			accelerationLeadXZ=Vector3.zero,
			extraLeadXZ=flat(wrVel)*receiverPredictionDelay,
			radialExtraLeadXZ=Vector3.zero,
			tangentExtraLeadXZ=flat(wrVel)*receiverPredictionDelay,
			extraLeadTime=receiverPredictionDelay,
			radialExtraTime=0,
			tangentExtraTime=receiverPredictionDelay,
			tangentBaseTime=0,
			tangentReactiveTime=receiverPredictionDelay,
			radialBaseTime=0,
			radialLDTime=0,
			adaptiveLeadScale=1,
			leadUserScale=math.clamp(WR_LEAD_DELAY/math.max(LEAD_DELAY_BASELINE,0.01),0,2.25),
			predictorConfidence=predictorConfidence,
			radialFlightScale=1,
			tangentFlightScale=1,
			accelTime=0,
			magnitudeChangePotential=0,
			c1Height=C1_Y_FIXED,
			c1HeightMin=C1_Y_MIN,
			c1HeightMax=C1_Y_MAX,
			c1SolveYBias=C1_SOLVE_Y_BIAS,
			distance3DNow=(target-originPosition).Magnitude,
			distanceXZNow=distXZ(originPosition,target),
			distanceScale=1,
			awayShare=awayShare,
			positiveAwayShare=math.clamp(awayShare,0,1),
			radialShareAbs=math.abs(awayShare),
			lateralShare=lateralShare,
			routeBalance=1-math.abs(math.abs(awayShare)-lateralShare),
			balanceLeadScale=1,
			radialGain=0,
			tangentGain=0,
			losRate=0,
			losDamping=1,
			reactiveLosDamping=1,
			tangentAlignment=1,
			tangentAlignmentBoost=1,
			tangentBalanceBoost=1,
			tangentDominance=(lateralShare*lateralShare)/((awayShare*awayShare)+(lateralShare*lateralShare)+CIRCLE_TANGENT_DOMINANCE_EPSILON),
			tangentBalancePeak=1,
			tangentDominanceScale=1,
			closingShare=math.clamp(-awayShare,0,1),
			tangentClosingScale=1,
			tangentSignedScale=1,
			routeAway=away,
			routeSide=lateralSpeed,
			routeElevation=0,
			routeSpeed=flat(wrVel).Magnitude,
			fixedIntercept=true,
			cleanMath=true,
			receiverPredictionDelay=receiverPredictionDelay,
			receiverPredictionDelayScale=WR_LEAD_DELAY>0 and receiverPredictionDelay/WR_LEAD_DELAY or 0,
		}
	end

	local function interceptCandidate(originPosition,receiverStart,wrVel,qbVel,ballSpeed,time,shape,predictorState,includeLeadInfo)
		if time<=0 then return nil end

		local inheritedVelocity=flat(qbVel or Vector3.zero)*QB_INHERITANCE
		local receiverLeadDelay=leadDelayForFlightTime(time)
		local target=targetAtTime(receiverStart,wrVel,time,receiverLeadDelay)
		local neededDisplacement=target-originPosition-inheritedVelocity*time-0.5*G*time*time
		local requiredVelocity=neededDisplacement/time
		local requiredSpeed=requiredVelocity.Magnitude
		if requiredSpeed<=1e-6 then return nil end

		local direction=requiredVelocity.Unit
		local angle=math.deg(math.asin(math.clamp(direction.Y,-1,1)))
		if angle<GLOBAL_MIN_ANGLE or angle>GLOBAL_MAX_ANGLE then return nil end

		local throwVelocity=direction*ballSpeed
		local worldVelocity=throwVelocity+inheritedVelocity
		local catchPosition=ballAt(originPosition,worldVelocity,time)
		local targetMiss=(catchPosition-target).Magnitude
		local yError=math.abs(catchPosition.Y-(WR_MAX_Y+C1_SOLVE_Y_BIAS))
		local speedError=math.abs(requiredSpeed-ballSpeed)
		local residual=math.abs(interceptValue(originPosition,receiverStart,wrVel,qbVel,ballSpeed,time))
		local verticalVelocityAtCatch=worldVelocity.Y+G.Y*time
		local landingPosition,landingTime=landing(originPosition,worldVelocity)
		local leadDistance=flat(wrVel).Magnitude*receiverLeadDelay

		return{
			score=targetMiss*1000+speedError*100+time*0.5+math.max(verticalVelocityAtCatch-10,0)*0.25,
			time=time,
			totalLeadTime=time+receiverLeadDelay,
			receiverPredictionDelay=receiverLeadDelay,
			receiverPredictionDelayScale=WR_LEAD_DELAY>0 and receiverLeadDelay/WR_LEAD_DELAY or 0,
			receiverLeadDistance=leadDistance,
			origin=originPosition,
			target=target,
			c1Point=target,
			requiredVelocity=requiredVelocity,
			requiredSpeed=requiredSpeed,
			direction=direction,
			throwVelocity=throwVelocity,
			worldVelocity=worldVelocity,
			velocity=worldVelocity,
			speed=ballSpeed,
			aimPoint=originPosition+direction*AIM_SCALE,
			angleDeg=angle,
			preferredAngle=angle,
			minDesiredAngle=GLOBAL_MIN_ANGLE,
			maxAngle=GLOBAL_MAX_ANGLE,
			totalErr=targetMiss,
			targetMiss=targetMiss,
			yError=yError,
			speedError=speedError,
			verticalVelocityAtCatch=verticalVelocityAtCatch,
			interceptResidual=residual,
			missEstimate=targetMiss,
			ballAtCatch=catchPosition,
			landing=landingPosition,
			landingTime=landingTime,
			flatDistNow=distXZ(originPosition,receiverStart),
			movementShape=shape,
			predictorState=predictorState,
			leadInfo=includeLeadInfo and interceptLeadInfo(originPosition,target,wrVel,time,predictorState) or nil,
			cleanMath=true,
		}
	end

	local function betterIntercept(candidate,current)
		if not current then return true end
		if candidate.score+1e-6<current.score then return true end
		if current.score+1e-6<candidate.score then return false end
		return candidate.time<current.time
	end

	local function refineInterceptTime(originPosition,receiverStart,wrVel,qbVel,ballSpeed,lo,hi,loValue)
		local low=lo
		local high=hi
		local lowValue=loValue or interceptValue(originPosition,receiverStart,wrVel,qbVel,ballSpeed,low)

		for _=1,INTERCEPT_BISECTION_STEPS do
			local mid=(low+high)*0.5
			local midValue=interceptValue(originPosition,receiverStart,wrVel,qbVel,ballSpeed,mid)

			if math.abs(midValue)<1e-5 then
				return mid
			end

			if (lowValue<0 and midValue>0) or (lowValue>0 and midValue<0) then
				high=mid
			else
				low=mid
				lowValue=midValue
			end
		end

		return(low+high)*0.5
	end

	local function solve(qbRoot,ball,receiverRoot,targetVelocity,shape,ballPower,releaseOffset,predictorState)
		local ballSpeed=ballPower or GAMEPLAY_BALL_POWER
		releaseOffset=releaseOffset or 0
		local wrVel=clampMagnitude(flat(targetVelocity or Vector3.zero),MAX_RUN_SPEED)
		local qbVel=clampMagnitude(flat(qbRoot.AssemblyLinearVelocity),MAX_RUN_SPEED)
		local originPosition=origin(qbRoot,ball,releaseOffset)
		local receiverReleasePosition=receiverRoot.Position+wrVel*releaseOffset
		local receiverStart=receiverMaxAt(receiverReleasePosition)
		local bestRoot=nil
		local bestNear=nil
		local previousTime=MIN_T
		local previousValue=interceptValue(originPosition,receiverStart,wrVel,qbVel,ballSpeed,previousTime)

		local function considerNear(time)
			local candidate=interceptCandidate(originPosition,receiverStart,wrVel,qbVel,ballSpeed,time,shape,predictorState,false)
			if candidate and candidate.targetMiss<=CLEAN_NEAR_TARGET_MISS_TOLERANCE and candidate.yError<=CLEAN_CATCH_Y_TOLERANCE and betterIntercept(candidate,bestNear) then
				bestNear=candidate
			end
		end

		local function considerRoot(time)
			local candidate=interceptCandidate(originPosition,receiverStart,wrVel,qbVel,ballSpeed,time,shape,predictorState,false)
			if candidate and candidate.targetMiss<=CLEAN_TARGET_MISS_TOLERANCE and candidate.yError<=CLEAN_CATCH_Y_TOLERANCE and betterIntercept(candidate,bestRoot) then
				bestRoot=candidate
			end
		end

		considerNear(previousTime)

		for time=MIN_T+DT,MAX_T,DT do
			local value=interceptValue(originPosition,receiverStart,wrVel,qbVel,ballSpeed,time)
			considerNear(time)

			if math.abs(value)<1e-8 then
				considerRoot(time)
			elseif math.abs(previousValue)<1e-8 then
				considerRoot(previousTime)
			elseif (previousValue<0 and value>0) or (previousValue>0 and value<0) then
				considerRoot(refineInterceptTime(originPosition,receiverStart,wrVel,qbVel,ballSpeed,previousTime,time,previousValue))
			end

			previousTime=time
			previousValue=value
		end

		local best=bestRoot or bestNear
		if best and not best.leadInfo then
			best.leadInfo=interceptLeadInfo(originPosition,best.target,wrVel,best.time,predictorState)
		end

		return best
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
		local endPoint=plan.target or plan.c1Point
		local previewTime=plan.time
		if not(startPoint and endPoint and previewTime) then return end

		local endVelocity=plan.velocity+G*previewTime
		local p2=startPoint
		local p1=endPoint
		local p3=endPoint

		if preview.p2 then
			p2=preview.p2:Lerp(p2,PREVIEW_SMOOTH)
		end

		if preview.p1 and (p1-preview.p1).Magnitude<=28 then
			p1=preview.p1:Lerp(p1,PREVIEW_SMOOTH)
		end

		if preview.p3 and (p3-preview.p3).Magnitude<=45 then
			p3=preview.p3:Lerp(p3,PREVIEW_SMOOTH)
		end

		preview.p1,preview.p2,preview.p3=p1,p2,p3
		setAttachmentCFrame(c2,xAxisCFrame(p2,plan.velocity))
		setAttachmentCFrame(c1,xAxisCFrame(p1,plan.velocity+G*plan.time))
		setAttachmentCFrame(c3,xAxisCFrame(p3,endVelocity))
		updateC1AndC3Info(plan,p1,p3)
		beam.Attachment0=c2
		beam.Attachment1=c3
		beam.CurveSize0=math.clamp(plan.velocity.Magnitude*previewTime/3,-ARC_MAX_CURVE,ARC_MAX_CURVE)
		beam.CurveSize1=math.clamp(endVelocity.Magnitude*previewTime/3,-ARC_MAX_CURVE,ARC_MAX_CURVE)
		setPreviewCenterVisible(true)
		beam.Enabled=true
	end

	local function currentBallPower()
		return getModeKey(ctx)=="mode3" and SQUADS_BALL_POWER or GAMEPLAY_BALL_POWER
	end

	local function hasHeldBallForPreview()
		return getHeldBall()~=nil
	end

	local function clearPreviewForMissingBall(statusText)
		clearPreviewVisuals()

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

	local function buildPlan(receiver,ballPower,releaseOffset,releaseBall)
		if not canTargetReceiver(receiver) then
			return nil,nil
		end

		local character=LP.Character
		local qbRoot=root(character)
		local ball=releaseBall or getHeldBall()
		local receiverRoot=receiver and receiver.Character and root(receiver.Character)
		local data=receiverData[receiver] or ensureReceiverData(receiver,receiverRoot)

		if not(qbRoot and ball and receiverRoot and data) then
			return nil
		end

		releaseOffset=releaseOffset or 0
		local originPosition=origin(qbRoot,ball,releaseOffset)
		local targetVelocity,shape,predictorState=routeVelocity(receiver,data,originPosition,receiverRoot,selectedRouteLock)
		return solve(qbRoot,ball,receiverRoot,targetVelocity,shape,ballPower or currentBallPower(),releaseOffset,predictorState),ball
	end

	local function buildReleasePlan(receiver,ballPower,releaseBall,lockedPlan)
		-- Target-latch solver. Normal throws appear to lock the mouse target at
		-- keypress/animation start, then send the remote near the release frame.
		-- Therefore the throw target must be computed at input time using the
		-- predicted release origin, then held until the remote is fired. Live plans
		-- during the animation are preview-only and must not replace the locked target.
		if THROW_ANIMATION_RELEASE_WAIT<=0 then
			return lockedPlan or buildPlan(receiver,ballPower,0,releaseBall)
		end

		local endAt=os.clock()+THROW_ANIMATION_RELEASE_WAIT
		local fireAt=endAt-math.clamp(THROW_REMOTE_LEAD_TIME,0,THROW_ANIMATION_RELEASE_WAIT)

		while os.clock()<fireAt do
			if THROW_TARGET_LOCK_PREVIEW_LIVE then
				local remaining=math.max(endAt-os.clock(),0)
				local livePlan=buildPlan(receiver,ballPower,remaining,releaseBall)
				if livePlan then
					previewPlan(livePlan)
				end
			elseif lockedPlan then
				previewPlan(lockedPlan)
			end

			RunService.Heartbeat:Wait()
		end

		return lockedPlan,releaseBall
	end

	local function fireGameplayThrow(plan)
		local reEvent=getGameReEvent()
		if not reEvent then
			return false,"Gameplay ReEvent missing"
		end

		reEvent:FireServer("Mechanics","ThrowBall",{Target=plan.aimPoint,Power=REMOTE_DISPLAY_POWER}) -- old behavior: fire after release frame
		pcall(function()
			local mechanics=getGlobalMechanics()
			if mechanics and type(mechanics.UnequipFootball)=="function" then
				mechanics:UnequipFootball() -- old behavior: unequip immediately after remote
			end
		end)

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

		if not canTargetReceiver(receiver) then
			trackedReceiver=nil
			selectedRouteLock=nil
			clearPreviewVisuals()
			setTargetText()
			setStatus(state.qbAimTeamFilter~=false and "Target not teammate" or "No receiver locked")
			return
		end

		local heldBall=getHeldBall()
		if not heldBall then
			clearPreviewForMissingBall("No ball held")
			return
		end

		local modeKey=getModeKey(ctx)
		local power=modeKey=="mode3" and SQUADS_BALL_POWER or GAMEPLAY_BALL_POWER
		local receiverRoot=receiver and receiver.Character and root(receiver.Character)
		if not receiverRoot then
			setStatus("No receiver locked")
			return
		end

		-- Lock the target at keybind/animation start, but solve it from the predicted
		-- release-frame origin. This mirrors the normal throw timeline: click/target
		-- is latched first, remote appears near release, then the ball releases from
		-- the moved QB position toward that latched target.
		local lockedReleaseOffset=THROW_ANIMATION_RELEASE_WAIT+THROW_TARGET_LOCK_EXTRA_DELAY
		local lockedPlan=buildPlan(receiver,power,lockedReleaseOffset,heldBall)
		if not lockedPlan then
			setStatus("No target-latch throw solution")
			return
		end

		previewPlan(lockedPlan)
		playThrowAnimation()

		local plan=buildReleasePlan(receiver,power,heldBall,lockedPlan)
		if not plan then
			setStatus("No target-latch throw solution")
			return
		end

		local ok,err
		if modeKey=="mode1" then
			ok,err=fireGameplayThrow(plan)
		elseif modeKey=="mode3" then
			ok,err=fireSquadsThrow(plan)
		else
			ok,err=false,"Park route unknown"
		end

		if ok then
			freezePreviewAtCurrentPlan(plan)
			setStatus(currentModeText().." release-time throw sent")
		else
			setStatus(err or "Throw failed")
		end
	end

	local function lockReceiverUnderCursor()
		if not(enabled and isAvailable()) then return end

		local camera=Workspace.CurrentCamera
		local mouse=LP:GetMouse()
		local best=nil
		local bestDistance=math.huge

		for _,player in ipairs(Players:GetPlayers()) do
			local receiverRoot=player~=LP and player.Character and root(player.Character)
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
			ensureReceiverData(best,best.Character and root(best.Character))
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
		end

		syncControls()

		if enabled and not getHeldBall() then
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

	function api.SetLeadDelay(value,fire)
		setLeadDelay(value,fire~=false)
	end

	function api.SetPeakHeight(value,fire)
		setPeakHeight(value,fire~=false)
	end

	function api.Refresh()
		syncControls()
	end

	function api.Reset()
		setEnabled(false)
	end

	function api.Destroy()
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

	addConnection(RunService.Heartbeat:Connect(function(dt)
		if not isAlive() then return end

		receiverTrackElapsed+=(dt or 0)
		if receiverTrackElapsed<RECEIVER_TRACK_INTERVAL then return end
		receiverTrackElapsed=0

		local now=os.clock()
		for _,player in ipairs(Players:GetPlayers()) do
			if player~=LP and player.Character then
				local receiverRoot=root(player.Character)
				if receiverRoot then
					local data=receiverData[player]

					if not data then
						data={pos=receiverRoot.Position,vel=Vector3.zero,rawVel=Vector3.zero,accel=Vector3.zero,confidence=PREDICTOR_CONFIDENCE_MIN,lastSeen=now,t=now,vh={},ph={},sdir=nil,sspeed=0,stime=0,src="none"}
						receiverData[player]=data
					end

					local sampleDt=math.min(now-data.t,0.1)
					if sampleDt>0 then
						local positionVelocity=(receiverRoot.Position-data.pos)/sampleDt
						local assemblyVelocity=receiverRoot.AssemblyLinearVelocity or Vector3.zero
						local chosenVelocity=flat(assemblyVelocity).Magnitude>=CLEAN_MOVING_SPEED_MIN and assemblyVelocity or positionVelocity
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
	end))

	addConnection(RunService.RenderStepped:Connect(function()
		if not(enabled and isAvailable()) then return end

		updateTargetHighlight()

		local now=os.clock()
		if FREEZE_PREVIEW_WHILE_BALL_RELEASED then
			if previewFrozen then
				if now-previewFreezeStarted<PREVIEW_POST_THROW_FREEZE_MIN then
					return
				end
				previewFrozen=false
			end

			local holdingBall=hasHeldBallForPreview()
			if not holdingBall then
				preview.ballMissingSince=preview.ballMissingSince or now
				if now-preview.ballMissingSince<PREVIEW_MISSING_BALL_GRACE then
					return
				end

				clearPreviewForMissingBall()
				return
			end

			preview.ballMissingSince=nil
		end

		if not trackedReceiver then return end

		if state.qbAimShowArc==false then
			hideQBTrailPreview()
			return
		end

		if now-preview.last<ARC_PREVIEW_UPDATE_INTERVAL then return end
		preview.last=now

		local plan=buildPlan(trackedReceiver,nil,THROW_ANIMATION_RELEASE_WAIT)
		if plan then
			previewPlan(plan)
		end
	end))

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

		if not getHeldBall() then
			clearPreviewForMissingBall("No ball held")
			return true
		end

		if wantsLock then
			lockReceiverUnderCursor()
		elseif wantsThrow then
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
	syncControls()
	return api
end

return QBAim
