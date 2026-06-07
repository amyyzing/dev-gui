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
local WR_MAX_Y=WR_STANDING_TOP_Y+(JUMP_POWER*JUMP_POWER)/(2*PLAYER_G) -- ~=13.85
local C1_Y_MIN=WR_MAX_Y
local C1_Y_MAX=WR_MAX_Y
local C1_Y_FIXED=WR_MAX_Y
local C1_Y_POTENTIAL_EXPONENT=1.00
local C1_SOLVE_Y_BIAS=0.00
local MAX_RUN_SPEED=21
local NORMAL_ROUTE_MIN_SPEED=19
local ROUTE_LOCK_MIN_SPEED=2.5
local ROUTE_LOCK_MAX_AGE=1.5
local WR_LEAD_DELAY=0.2
local LEAD_DELAY_BASELINE=0.20 -- lead adjust is direct receiver prediction time; 0.20 is the baseline calculator
local ADAPTIVE_LEAD_ENABLED=true
local ROUTE_SPEED_PARTIAL_GAIN=1.08
local PREDICTOR_HISTORY_MAX_AGE=1.25
local PREDICTOR_MIN_SAMPLES=3
local PREDICTOR_LS_BLEND=0.45
local PREDICTOR_VELOCITY_BLEND=0.42
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
local QB_RELEASE_EXTRAPOLATE_VERTICAL=true
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
local PREVIEW_SMOOTH=0.28
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
local PLAY_THROW_LOCAL_FALLBACK=false
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

local function safeVectorLerp(a,b,alpha)
	if not a then return b or Vector3.zero end
	if not b then return a or Vector3.zero end
	return a:Lerp(b,math.clamp(alpha or 0,0,1))
end

local function root(character)
	return character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso"))
end

local function routeSpeed(speed)
	local clamped=math.clamp(speed,0,MAX_RUN_SPEED)
	if clamped<ROUTE_LOCK_MIN_SPEED then
		return 0
	end

	if clamped>=NORMAL_ROUTE_MIN_SPEED then
		return MAX_RUN_SPEED
	end

	return math.clamp(clamped*ROUTE_SPEED_PARTIAL_GAIN,ROUTE_LOCK_MIN_SPEED,MAX_RUN_SPEED)
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
	local connections={}
	local sectionBody=nil
	local sectionFrame=nil
	local enabledToggle=nil
	local teamFilterToggle=nil
	local arcToggle=nil
	local statusLabel=nil
	local targetLabel=nil
	local leadDelayFrame=nil
	local leadDelayBox=nil
	local leadDelaySlider=nil
	local leadDelaySliderFill=nil
	local leadDelaySliderKnob=nil
	local leadDelaySliderControl=nil
	local leadDelayDragging=false
	local LEAD_DELAY_MIN=0.00
	local LEAD_DELAY_MAX=1.50

	if state.qbAimTeamFilter==nil then
		state.qbAimTeamFilter=true
	end

	if state.qbAimShowArc==nil then
		state.qbAimShowArc=true
	end

	if state.qbAimLeadDelay==nil then
		state.qbAimLeadDelay=WR_LEAD_DELAY
	end

	WR_LEAD_DELAY=math.clamp(tonumber(state.qbAimLeadDelay) or WR_LEAD_DELAY,LEAD_DELAY_MIN,LEAD_DELAY_MAX)

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
		if statusLabel then
			statusLabel.Text=text
		end
	end

	local function setTargetText()
		if not targetLabel then return end

		if trackedReceiver then
			targetLabel.Text="Target: "..trackedReceiver.Name
		else
			targetLabel.Text="Target: none"
		end
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

	local function setLeadDelayFromScreenX(screenX,showStatus)
		if not leadDelaySlider then return false end
		local pos=leadDelaySlider.AbsolutePosition.X
		local size=math.max(leadDelaySlider.AbsoluteSize.X,1)
		local alpha=math.clamp((screenX-pos)/size,0,1)
		return setLeadDelay(LEAD_DELAY_MIN+(LEAD_DELAY_MAX-LEAD_DELAY_MIN)*alpha,showStatus)
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

	local function historyVector(data,now)
		if not(data and data.ph and #data.ph>=2) then
			return nil,0,0
		end

		local latest=data.ph[#data.ph]
		local earliest=data.ph[1]
		for i=#data.ph,1,-1 do
			if now-data.ph[i].t>=STABLE_WINDOW then
				earliest=data.ph[i]
				break
			end
		end

		local dt=latest.t-earliest.t
		if dt<=0 then
			return nil,0,0
		end

		local movement=flat(latest.pos-earliest.pos)
		local distance=movement.Magnitude
		local speed=distance/dt
		if distance<STABLE_MIN_DIST or speed<STABLE_MIN_SPEED then
			return nil,speed,distance
		end

		return movement,speed,distance
	end

	local function leastSquaresVelocity(data,now)
		if not(data and data.ph and #data.ph>=PREDICTOR_MIN_SAMPLES) then
			return nil,0,0
		end

		local count=0
		local sumT,sumX,sumZ=0,0,0
		local minT,maxT=nil,nil

		for _,sample in ipairs(data.ph) do
			if sample.t and sample.pos and now-sample.t<=PREDICTOR_HISTORY_MAX_AGE then
				local t=sample.t-now
				count+=1
				sumT+=t
				sumX+=sample.pos.X
				sumZ+=sample.pos.Z
				minT=minT and math.min(minT,t) or t
				maxT=maxT and math.max(maxT,t) or t
			end
		end

		if count<PREDICTOR_MIN_SAMPLES then
			return nil,0,0
		end

		local meanT=sumT/count
		local meanX=sumX/count
		local meanZ=sumZ/count
		local denom=0
		local numX,numZ=0,0

		for _,sample in ipairs(data.ph) do
			if sample.t and sample.pos and now-sample.t<=PREDICTOR_HISTORY_MAX_AGE then
				local centeredT=(sample.t-now)-meanT
				denom+=centeredT*centeredT
				numX+=centeredT*(sample.pos.X-meanX)
				numZ+=centeredT*(sample.pos.Z-meanZ)
			end
		end

		if denom<1e-6 then
			return nil,0,0
		end

		local velocity=clampMagnitude(Vector3.new(numX/denom,0,numZ/denom),MAX_RUN_SPEED)
		local span=(maxT or 0)-(minT or 0)
		local quality=math.clamp((count-PREDICTOR_MIN_SAMPLES+1)/5,0,1)*math.clamp(span/STABLE_WINDOW,0,1)
		return velocity,quality,span
	end

	local function predictionState(data,receiverPosition,fallbackVelocity)
		local now=os.clock()
		local measuredVelocity=clampMagnitude(flat((data and data.vel) or fallbackVelocity or Vector3.zero),MAX_RUN_SPEED)
		local lsVelocity,lsQuality=leastSquaresVelocity(data,now)
		local blendedVelocity=measuredVelocity
		if lsVelocity and lsVelocity.Magnitude>=ROUTE_LOCK_MIN_SPEED then
			blendedVelocity=safeVectorLerp(measuredVelocity,lsVelocity,PREDICTOR_LS_BLEND*lsQuality)
		end

		blendedVelocity=clampMagnitude(blendedVelocity,MAX_RUN_SPEED)
		local acceleration=clampMagnitude(flat(data and data.accel or Vector3.zero),PREDICTOR_ACCEL_MAX)
		local sampleAge=data and data.lastSeen and math.max(now-data.lastSeen,0) or PREDICTOR_STALE_AFTER
		local ageConfidence=1-math.clamp(sampleAge/PREDICTOR_STALE_AFTER,0,1)
		local speedConfidence=math.clamp(blendedVelocity.Magnitude/NORMAL_ROUTE_MIN_SPEED,0,1)
		local storedConfidence=math.clamp(data and data.confidence or PREDICTOR_CONFIDENCE_MIN,PREDICTOR_CONFIDENCE_MIN,PREDICTOR_CONFIDENCE_MAX)
		local confidence=math.clamp((0.35*storedConfidence+0.35*lsQuality+0.30*speedConfidence)*ageConfidence,PREDICTOR_CONFIDENCE_MIN,PREDICTOR_CONFIDENCE_MAX)

		return{
			position=receiverPosition,
			velocity=blendedVelocity,
			acceleration=acceleration,
			confidence=confidence,
			lsQuality=lsQuality,
			sampleAge=sampleAge,
		}
	end

	local function updateStable(data)
		if not data then return nil,0,"none" end

		local now=os.clock()
		local historyVelocity,historySpeed=historyVector(data,now)
		local lsVelocity,lsQuality=leastSquaresVelocity(data,now)
		local measuredVelocity=flat(data.vel or Vector3.zero)
		if measuredVelocity.Magnitude>MAX_RUN_SPEED then
			measuredVelocity=measuredVelocity.Unit*MAX_RUN_SPEED
		end

		local measuredSpeed=measuredVelocity.Magnitude
		if measuredSpeed<=STABLE_STOP_SPEED then
			data.sdir=nil
			data.sspeed=0
			data.stime=now
			data.src="stopped"
			return nil,0,"stopped"
		end

		local candidateDirection=nil
		local candidateSpeed=0
		local source="hold"
		if lsVelocity and lsQuality>=0.35 and lsVelocity.Magnitude>=STABLE_MIN_SPEED then
			candidateDirection=lsVelocity.Unit
			candidateSpeed=routeSpeed(lsVelocity.Magnitude)
			source="least_squares"
		elseif historyVelocity and historyVelocity.Magnitude>0 then
			candidateDirection=historyVelocity.Unit
			candidateSpeed=routeSpeed(historySpeed)
			source="history"
		elseif measuredSpeed>=STABLE_MIN_SPEED then
			candidateDirection=measuredVelocity.Unit
			candidateSpeed=routeSpeed(measuredSpeed)
			source="measured"
		end

		if candidateDirection and candidateSpeed>0 then
			if data.sdir and data.sdir.Magnitude>0 then
				local dot=math.clamp(data.sdir:Dot(candidateDirection),-1,1)
				if dot>=STABLE_DOT_REPLACE then
					data.sdir=unit(data.sdir:Lerp(candidateDirection,STABLE_BLEND),candidateDirection)
				else
					data.sdir=candidateDirection
				end
			else
				data.sdir=candidateDirection
			end

			data.sspeed=candidateSpeed
			data.stime=now
			data.src=source
			return data.sdir,data.sspeed,source
		end

		if data.sdir and now-(data.stime or 0)<=STABLE_HOLD then
			return data.sdir,data.sspeed or 0,"held"
		end

		return nil,0,"none"
	end

	local function basis(origin,position)
		local toTarget=flat(position-origin)
		if toTarget.Magnitude<0.1 then
			return Vector3.new(1,0,0),Vector3.new(0,0,1)
		end

		local away=toTarget.Unit
		return away,Vector3.new(-away.Z,0,away.X)
	end

	local function components(origin,position,velocity)
		local awayDirection,sideDirection=basis(origin,position)
		local flatVelocity=flat(velocity or Vector3.zero)
		local away=flatVelocity:Dot(awayDirection)
		local side=flatVelocity:Dot(sideDirection)

		return{
			awayDir=awayDirection,
			sideDir=sideDirection,
			away=away,
			side=side,
			awayAbs=math.abs(away),
			sideAbs=math.abs(side),
			speed=flatVelocity.Magnitude,
		}
	end

	local function movementShape(origin,position,velocity)
		-- Do not label routes as "slant" or "streak" from a QB-centered polar axis.
		-- The same world-space route can look tangent, radial, or mixed depending only on
		-- where the WR is on the QB-centered circle. Keep this as range relation only.
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

		local measuredVelocity=flat(data.vel)
		if measuredVelocity.Magnitude>MAX_RUN_SPEED then
			measuredVelocity=measuredVelocity.Unit*MAX_RUN_SPEED
		end

		local stableDirection,stableSpeed,stableSource=updateStable(data)
		local speed=stableSpeed>0 and stableSpeed or routeSpeed(measuredVelocity.Magnitude)
		if not stableDirection and (measuredVelocity.Magnitude<ROUTE_LOCK_MIN_SPEED or speed<=0) then
			return nil
		end

		local ball=getHeldBall()
		local characterRoot=LP.Character and root(LP.Character)
		local qbPosition=(ball and ball.Position) or (characterRoot and characterRoot.Position) or receiverRoot.Position
		local direction=stableDirection or measuredVelocity.Unit

		return{
			player=receiver,
			createdAt=os.clock(),
			routeDir=direction,
			routeSpeed=speed,
			routeVelocity=direction*speed,
			stableSource=stableSource,
			shape=movementShape(qbPosition,receiverRoot.Position,direction*speed),
		}
	end

	local function routeVelocity(receiver,data,origin,receiverRoot,routeLock)
		local state=predictionState(data,receiverRoot.Position,data and data.vel or Vector3.zero)
		local measuredVelocity=clampMagnitude(flat(state.velocity or Vector3.zero),MAX_RUN_SPEED)
		local measuredSpeed=measuredVelocity.Magnitude
		local adjustedSpeed=routeSpeed(measuredSpeed)
		local stableDirection,stableSpeed=updateStable(data)
		local velocity=Vector3.zero

		-- H locks the receiver identity only. Direction remains reactive, but the vector now blends
		-- recent least-squares motion with the stable route direction instead of blindly max-leading.
		if stableDirection and stableSpeed>0 then
			velocity=stableDirection*stableSpeed
			if measuredSpeed>=ROUTE_LOCK_MIN_SPEED and adjustedSpeed>0 then
				local reactiveVelocity=measuredVelocity.Unit*adjustedSpeed
				velocity=safeVectorLerp(velocity,reactiveVelocity,math.clamp((state.confidence or 0)*0.38,0,0.38))
			end
		elseif measuredSpeed>=ROUTE_LOCK_MIN_SPEED and adjustedSpeed>0 then
			velocity=measuredVelocity.Unit*adjustedSpeed
		else
			state.routeVelocity=Vector3.zero
			return Vector3.zero,"standing",state
		end

		velocity=clampMagnitude(flat(velocity),MAX_RUN_SPEED)
		state.routeVelocity=velocity
		return velocity,movementShape(origin,receiverRoot.Position,velocity),state
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

	local function preferredAngle(distance)
		local yards=distance/YARDS_TO_STUDS
		if yards<15 then return 24 elseif yards<25 then return 22 elseif yards<40 then return 19 elseif yards<55 then return 16 elseif yards<70 then return 14 elseif yards<85 then return 17 end
		return 22
	end

	local function minimumAngle(distance)
		local yards=distance/YARDS_TO_STUDS
		if yards<15 then return 14 elseif yards<25 then return 17 elseif yards<40 then return 16 elseif yards<55 then return 11 end
		return 0
	end

	local function maximumAngle(distance)
		if distance<45 then return 42 elseif distance<75 then return 38 elseif distance<120 then return 34 elseif distance<170 then return 32 end
		return 35
	end

	local function maximumTime(distance)
		if distance<45 then return 1.35 elseif distance<75 then return 1.85 elseif distance<120 then return 2.45 elseif distance<170 then return 3.25 elseif distance<230 then return 4.25 end
		return MAX_T
	end

	local function components3D(originPosition,receiverMaxPoint,velocity)
		local radiusVec=receiverMaxPoint-originPosition
		local radius=radiusVec.Magnitude
		if radius<1e-6 then
			local awayDir,sideDir=basis(originPosition,receiverMaxPoint)
			local velocityXZ=flat(velocity or Vector3.zero)
			return{
				radius=0,
				radialDir=awayDir,
				tangentDir=sideDir,
				elevationDir=Vector3.new(0,1,0),
				lateralDir=sideDir,
				awayDir=awayDir,
				sideDir=sideDir,
				radial=velocityXZ:Dot(awayDir),
				tangent=velocityXZ:Dot(sideDir),
				elevation=0,
				away=velocityXZ:Dot(awayDir),
				side=velocityXZ:Dot(sideDir),
				awayAbs=math.abs(velocityXZ:Dot(awayDir)),
				sideAbs=math.abs(velocityXZ:Dot(sideDir)),
				lateralAbs=math.abs(velocityXZ:Dot(sideDir)),
				speed=velocityXZ.Magnitude,
			}
		end

		local radialDir=radiusVec.Unit
		local up=Vector3.new(0,1,0)
		local tangentDir=up:Cross(radialDir)
		if tangentDir.Magnitude<1e-6 then
			tangentDir=Vector3.new(1,0,0)
		else
			tangentDir=tangentDir.Unit
		end
		local elevationDir=radialDir:Cross(tangentDir)
		if elevationDir.Magnitude<1e-6 then
			elevationDir=up
		else
			elevationDir=elevationDir.Unit
		end

		local velocity3=Vector3.new((velocity or Vector3.zero).X,0,(velocity or Vector3.zero).Z)
		local radial=velocity3:Dot(radialDir)
		local tangent=velocity3:Dot(tangentDir)
		local elevation=velocity3:Dot(elevationDir)
		local lateralVec=tangentDir*tangent+elevationDir*elevation
		local lateralAbs=lateralVec.Magnitude
		local lateralDir=lateralAbs>1e-6 and lateralVec.Unit or tangentDir
		local flatRadial=flat(radialDir)
		local awayDir=flatRadial.Magnitude>1e-6 and flatRadial.Unit or Vector3.new(1,0,0)
		local sideDir=Vector3.new(-awayDir.Z,0,awayDir.X)

		return{
			radius=radius,
			radialDir=radialDir,
			tangentDir=tangentDir,
			elevationDir=elevationDir,
			lateralDir=lateralDir,
			awayDir=awayDir,
			sideDir=sideDir,
			radial=radial,
			tangent=tangent,
			elevation=elevation,
			away=radial,
			side=tangent,
			awayAbs=math.abs(radial),
			sideAbs=lateralAbs,
			lateralAbs=lateralAbs,
			speed=velocity3.Magnitude,
		}
	end

	local function c1HeightFromMagnitudePotential(potential,speed)
		-- Fixed jump-peak target. Route dominance should not move C1 between 13.00 and WR_MAX_Y.
		return C1_Y_FIXED
	end

	local function c1Target(receiverPosition,originPosition,targetVelocity,flightTime,predictorState)
		local receiverMaxPoint=receiverMaxAt(receiverPosition)

		-- Axis-invariant predictor:
		-- The catch target is moved along the receiver's actual velocity vector.
		-- QB-centered radial/tangent projections are used only for damping/diagnostics, never
		-- as the main lead basis. This prevents a north-running WR from being treated as
		-- "full slant" on one side of the circle and "full streak" at the top of the circle.
		local velocityXZ=clampMagnitude(flat(targetVelocity or Vector3.zero),MAX_RUN_SPEED)
		local speed=velocityXZ.Magnitude
		local routeDir=speed>1e-6 and velocityXZ.Unit or Vector3.new(1,0,0)

		local losVector=flat(receiverMaxPoint-originPosition)
		local radius=math.max(losVector.Magnitude,1e-6)
		local losDir=unit(losVector,routeDir)

		local signedRangeSpeed=speed>1e-6 and velocityXZ:Dot(losDir) or 0
		local awayShare=speed>1e-6 and math.clamp(signedRangeSpeed/speed,-1,1) or 0
		local positiveAwayShare=math.clamp(awayShare,0,1)
		local closingShare=math.clamp(-awayShare,0,1)
		local radialShareAbs=math.abs(awayShare)
		local lateralVelocity=velocityXZ-losDir*signedRangeSpeed
		local lateralSpeed=lateralVelocity.Magnitude
		local lateralShare=speed>1e-6 and math.clamp(lateralSpeed/speed,0,1) or 0
		local routeBalance=1-math.abs(radialShareAbs-lateralShare)

		local predictorConfidence=math.clamp(predictorState and predictorState.confidence or 0.55,PREDICTOR_CONFIDENCE_MIN,PREDICTOR_CONFIDENCE_MAX)
		local leadUserScale=math.clamp(WR_LEAD_DELAY/math.max(LEAD_DELAY_BASELINE,0.01),0,2.25)
		local speedScale=math.clamp(speed/MAX_RUN_SPEED,0,1)
		local uncertaintyDamping=1-ADAPTIVE_UNCERTAINTY_DAMPING*(1-predictorConfidence)

		local losRate=lateralSpeed/math.max(radius,CIRCLE_LOS_RATE_EPSILON)
		local losDamping=1/(1+losRate*CIRCLE_LOS_RATE_GAIN)
		local reactiveLosDamping=1/(1+losRate*AXIS_LOS_RATE_GAIN)
		local distanceScale=math.clamp(radius/CIRCLE_RADIUS_FULL_LEAD,CIRCLE_DISTANCE_SCALE_MIN,CIRCLE_DISTANCE_SCALE_MAX)

		local accelerationXZ=clampMagnitude(flat(predictorState and predictorState.acceleration or Vector3.zero),PREDICTOR_ACCEL_MAX)
		local alongAcceleration=speed>1e-6 and accelerationXZ:Dot(routeDir) or 0
		local brakingShare=math.clamp(-alongAcceleration/math.max(PREDICTOR_ACCEL_MAX,1),0,1)
		local accelTime=math.min(flightTime,PREDICTOR_ACCEL_TIME_MAX)

		-- True intercept lead is v*t. Extra user lead is now a small along-route pad,
		-- not a radial/tangent dominance term.
		local brakeFlightScale=1-AXIS_BRAKE_FLIGHT_DAMPING*brakingShare*predictorConfidence
		local flightLead=velocityXZ*flightTime*math.clamp(brakeFlightScale,0.45,1)

		local accelerationLeadScale=PREDICTOR_ACCEL_LEAD_SCALE*predictorConfidence
		local accelerationLeadXZ=accelerationXZ*(0.5*accelTime*accelTime*accelerationLeadScale)
		accelerationLeadXZ=clampMagnitude(accelerationLeadXZ,PREDICTOR_ACCEL_LEAD_MAX)

		local closingDamping=math.clamp(1-AXIS_CLOSING_EXTRA_DAMPING*closingShare,0.20,1)
		local brakeExtraDamping=math.clamp(1-0.80*brakingShare,0.20,1)
		local adaptiveLeadScale=ADAPTIVE_LEAD_ENABLED and (leadUserScale*speedScale*predictorConfidence*uncertaintyDamping) or 1
		local axisExtraLeadTime=0

		if AXIS_INVARIANT_LEAD_ENABLED then
			axisExtraLeadTime=math.min(
				LEAD_DELAY_BASELINE
				*AXIS_EXTRA_LEAD_FRACTION
				*adaptiveLeadScale
				*distanceScale
				*reactiveLosDamping
				*closingDamping
				*brakeExtraDamping,
				AXIS_EXTRA_LEAD_TIME_MAX
			)
		end

		local extraLeadXZ=velocityXZ*axisExtraLeadTime
		local effectiveExtraTime=speed>1e-6 and (extraLeadXZ.Magnitude+accelerationLeadXZ.Magnitude)/speed or 0
		local targetFlat=flat(receiverMaxPoint)+flightLead+accelerationLeadXZ+extraLeadXZ
		local c1Height=c1HeightFromMagnitudePotential(0,speed)

		-- Diagnostics keep the old field names so the rest of the module remains compatible.
		local tangentDominance=(lateralShare*lateralShare)/((radialShareAbs*radialShareAbs)+(lateralShare*lateralShare)+CIRCLE_TANGENT_DOMINANCE_EPSILON)
		local balancePeak=1-math.abs(2*tangentDominance-1)
		local tangentClosingScale=closingDamping
		local tangentSignedScale=closingDamping*brakeExtraDamping

		return Vector3.new(targetFlat.X,c1Height+C1_SOLVE_Y_BIAS,targetFlat.Z),{
			flightLeadXZ=flightLead,
			accelerationLeadXZ=accelerationLeadXZ,
			extraLeadXZ=extraLeadXZ,
			radialExtraLeadXZ=Vector3.zero,
			tangentExtraLeadXZ=extraLeadXZ,
			extraLeadTime=effectiveExtraTime,
			radialExtraTime=0,
			tangentExtraTime=axisExtraLeadTime,
			tangentBaseTime=0,
			tangentReactiveTime=axisExtraLeadTime,
			radialBaseTime=0,
			radialLDTime=0,
			adaptiveLeadScale=adaptiveLeadScale,
			leadUserScale=leadUserScale,
			predictorConfidence=predictorConfidence,
			radialFlightScale=1,
			tangentFlightScale=1,
			accelTime=accelTime,
			accelerationLeadScale=accelerationLeadScale,
			brakingShare=brakingShare,
			brakeFlightScale=brakeFlightScale,
			axisExtraLeadTime=axisExtraLeadTime,
			magnitudeChangePotential=0,
			c1Height=c1Height,
			c1HeightMin=C1_Y_MIN,
			c1HeightMax=C1_Y_MAX,
			c1SolveYBias=C1_SOLVE_Y_BIAS,
			distance3DNow=radius,
			distanceXZNow=distXZ(originPosition,receiverMaxPoint),
			distanceScale=distanceScale,
			awayShare=awayShare,
			positiveAwayShare=positiveAwayShare,
			radialShareAbs=radialShareAbs,
			lateralShare=lateralShare,
			routeBalance=routeBalance,
			balanceLeadScale=1,
			radialGain=0,
			tangentGain=0,
			losRate=losRate,
			losDamping=losDamping,
			reactiveLosDamping=reactiveLosDamping,
			tangentAlignment=1,
			tangentAlignmentBoost=1,
			tangentBalanceBoost=1,
			tangentDominance=tangentDominance,
			tangentBalancePeak=balancePeak,
			tangentDominanceScale=1,
			closingShare=closingShare,
			tangentClosingScale=tangentClosingScale,
			tangentSignedScale=tangentSignedScale,
			routeAway=signedRangeSpeed,
			routeSide=lateralSpeed,
			routeElevation=0,
			routeSpeed=speed,
			axisInvariant=true,
		}
	end

	local function interceptValue(originPosition,receiverStart,wrVel,qbVel,ballSpeed,time)
		local inheritedVelocity=qbVel*QB_INHERITANCE
		local neededDisplacement=receiverStart-originPosition+(wrVel-inheritedVelocity)*time-0.5*G*time*time
		return neededDisplacement:Dot(neededDisplacement)-ballSpeed*ballSpeed*time*time
	end

	local function interceptLeadInfo(originPosition,target,wrVel,time,predictorState)
		local result=components3D(originPosition,target,wrVel)
		local speed=math.max(result.speed,1e-6)
		local radius=math.max(result.radius,1e-6)
		local awayShare=math.clamp(result.radial/speed,-1,1)
		local radialShareAbs=math.clamp(math.abs(result.radial)/speed,0,1)
		local lateralShare=math.clamp(result.lateralAbs/speed,0,1)
		local routeBalance=1-math.abs(radialShareAbs-lateralShare)
		local losRate=result.lateralAbs/math.max(radius,CIRCLE_LOS_RATE_EPSILON)
		local losDamping=1/(1+losRate*CIRCLE_LOS_RATE_GAIN)
		local reactiveLosDamping=1/(1+losRate*CIRCLE_TANGENT_REACTIVE_LOS_GAIN)
		local predictorConfidence=math.clamp(predictorState and predictorState.confidence or 0.55,PREDICTOR_CONFIDENCE_MIN,PREDICTOR_CONFIDENCE_MAX)

		return{
			flightLeadXZ=wrVel*time,
			accelerationLeadXZ=Vector3.zero,
			extraLeadXZ=Vector3.zero,
			radialExtraLeadXZ=Vector3.zero,
			tangentExtraLeadXZ=Vector3.zero,
			extraLeadTime=0,
			radialExtraTime=0,
			tangentExtraTime=0,
			tangentBaseTime=0,
			tangentReactiveTime=0,
			radialBaseTime=0,
			radialLDTime=0,
			adaptiveLeadScale=0,
			leadUserScale=math.clamp(WR_LEAD_DELAY/math.max(LEAD_DELAY_BASELINE,0.01),0,2.25),
			predictorConfidence=predictorConfidence,
			radialFlightScale=1,
			tangentFlightScale=1,
			accelTime=0,
			magnitudeChangePotential=1,
			c1Height=C1_Y_FIXED,
			c1HeightMin=C1_Y_MIN,
			c1HeightMax=C1_Y_MAX,
			c1SolveYBias=C1_SOLVE_Y_BIAS,
			distance3DNow=radius,
			distanceXZNow=distXZ(originPosition,target),
			distanceScale=math.clamp(radius/CIRCLE_RADIUS_FULL_LEAD,CIRCLE_DISTANCE_SCALE_MIN,CIRCLE_DISTANCE_SCALE_MAX),
			awayShare=awayShare,
			positiveAwayShare=math.clamp(awayShare,0,1),
			radialShareAbs=radialShareAbs,
			lateralShare=lateralShare,
			routeBalance=routeBalance,
			balanceLeadScale=1,
			radialGain=0,
			tangentGain=0,
			losRate=losRate,
			losDamping=losDamping,
			reactiveLosDamping=reactiveLosDamping,
			tangentAlignment=1,
			tangentAlignmentBoost=1,
			tangentBalanceBoost=1,
			tangentDominance=(lateralShare*lateralShare)/((radialShareAbs*radialShareAbs)+(lateralShare*lateralShare)+CIRCLE_TANGENT_DOMINANCE_EPSILON),
			tangentBalancePeak=routeBalance,
			tangentDominanceScale=1,
			closingShare=math.clamp(-awayShare,0,1),
			tangentClosingScale=1,
			tangentSignedScale=1,
			routeAway=result.radial,
			routeSide=result.tangent,
			routeElevation=result.elevation,
			routeSpeed=result.speed,
			fixedIntercept=true,
		}
	end

	local function interceptCandidate(originPosition,receiverStart,wrVel,qbVel,ballSpeed,time,shape,predictorState,includeLeadInfo)
		if time<=0 then return nil end

		local inheritedVelocity=qbVel*QB_INHERITANCE
		local neededDisplacement=receiverStart-originPosition+(wrVel-inheritedVelocity)*time-0.5*G*time*time
		local requiredVelocity=neededDisplacement/time
		local requiredSpeed=requiredVelocity.Magnitude
		if requiredSpeed<=1e-6 then return nil end

		local direction=requiredVelocity.Unit
		local angle=math.deg(math.asin(math.clamp(direction.Y,-1,1)))
		if angle<GLOBAL_MIN_ANGLE or angle>GLOBAL_MAX_ANGLE then return nil end

		local throwVelocity=direction*ballSpeed
		local worldVelocity=throwVelocity+inheritedVelocity
		local target=receiverStart+wrVel*time
		local catchPosition=ballAt(originPosition,worldVelocity,time)
		local speedError=math.abs(requiredSpeed-ballSpeed)
		local missEstimate=speedError*time
		local residual=math.abs(interceptValue(originPosition,receiverStart,wrVel,qbVel,ballSpeed,time))
		local verticalVelocityAtCatch=worldVelocity.Y+G.Y*time
		local landingPosition,landingTime=landing(originPosition,worldVelocity)

		return{
			score=speedError*100+missEstimate*25+time*0.35+(verticalVelocityAtCatch>6 and verticalVelocityAtCatch*0.15 or 0),
			time=time,
			totalLeadTime=time,
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
			totalErr=(catchPosition-target).Magnitude,
			speedError=speedError,
			verticalVelocityAtCatch=verticalVelocityAtCatch,
			interceptResidual=residual,
			missEstimate=missEstimate,
			ballAtCatch=catchPosition,
			landing=landingPosition,
			landingTime=landingTime,
			flatDistNow=distXZ(originPosition,receiverStart),
			movementShape=shape,
			predictorState=predictorState,
			leadInfo=includeLeadInfo and interceptLeadInfo(originPosition,target,wrVel,time,predictorState) or nil,
		}
	end

	local function betterIntercept(candidate,current)
		if not current then return true end
		if candidate.speedError+0.02<current.speedError then return true end
		if current.speedError+0.02<candidate.speedError then return false end
		if candidate.missEstimate+0.05<current.missEstimate then return true end
		if current.missEstimate+0.05<candidate.missEstimate then return false end

		local candidateRising=candidate.verticalVelocityAtCatch>6
		local currentRising=current.verticalVelocityAtCatch>6
		if candidateRising~=currentRising then
			return not candidateRising
		end

		return candidate.time<current.time
	end

	local function refineInterceptTime(originPosition,receiverStart,wrVel,qbVel,ballSpeed,lo,hi,loValue)
		local low=lo
		local high=hi
		local lowValue=loValue or interceptValue(originPosition,receiverStart,wrVel,qbVel,ballSpeed,low)

		for _=1,INTERCEPT_BISECTION_STEPS do
			local mid=(low+high)*0.5
			local midValue=interceptValue(originPosition,receiverStart,wrVel,qbVel,ballSpeed,mid)

			if midValue==0 then
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
		local receiverPredictionDelay=math.max(WR_LEAD_DELAY,0)
		local receiverReleasePosition=receiverRoot.Position+wrVel*(releaseOffset+receiverPredictionDelay)
		local receiverStart=receiverMaxAt(receiverReleasePosition)
		local bestRoot=nil
		local bestNear=nil
		local previousTime=MIN_T
		local previousValue=interceptValue(originPosition,receiverStart,wrVel,qbVel,ballSpeed,previousTime)

		local function considerNear(time)
			local candidate=interceptCandidate(originPosition,receiverStart,wrVel,qbVel,ballSpeed,time,shape,predictorState,false)
			if candidate and (candidate.speedError<=SPEED_TOLERANCE or candidate.missEstimate<=CATCH_TOLERANCE) and betterIntercept(candidate,bestNear) then
				bestNear=candidate
			end
		end

		local function considerRoot(time)
			local candidate=interceptCandidate(originPosition,receiverStart,wrVel,qbVel,ballSpeed,time,shape,predictorState,false)
			if candidate and betterIntercept(candidate,bestRoot) then
				bestRoot=candidate
			end
		end

		considerNear(previousTime)

		for time=MIN_T+DT,MAX_T,DT do
			local value=interceptValue(originPosition,receiverStart,wrVel,qbVel,ballSpeed,time)
			considerNear(time)

			if value==0 then
				considerRoot(time)
			elseif previousValue==0 then
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
		if best then
			best.receiverPredictionDelay=receiverPredictionDelay
			best.totalLeadTime=best.time+receiverPredictionDelay
			if best.leadInfo then
				best.leadInfo.receiverPredictionDelay=receiverPredictionDelay
				best.leadInfo.extraLeadTime=receiverPredictionDelay
			end
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

	local function buildReleasePlan(receiver,ballPower,releaseBall,fallbackPlan)
		if THROW_ANIMATION_RELEASE_WAIT<=0 then
			return buildPlan(receiver,ballPower,0,releaseBall)
		end

		local endAt=os.clock()+THROW_ANIMATION_RELEASE_WAIT
		local latestPlan=nil
		local latestBall=nil

		while os.clock()<endAt do
			local remaining=math.max(endAt-os.clock(),0)
			latestPlan,latestBall=buildPlan(receiver,ballPower,remaining,releaseBall)
			if latestPlan then
				previewPlan(latestPlan)
			end
			RunService.Heartbeat:Wait()
		end

		local finalPlan,finalBall=buildPlan(receiver,ballPower,0,releaseBall)
		return finalPlan or latestPlan or fallbackPlan,finalBall or latestBall or releaseBall
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

		local preAnimationPlan=buildPlan(receiver,power,THROW_ANIMATION_RELEASE_WAIT,heldBall)
		if not preAnimationPlan then
			setStatus("No release-time throw solution")
			return
		end

		playThrowAnimation()

		local plan=buildReleasePlan(receiver,power,heldBall,preAnimationPlan)
		if not plan then
			setStatus("No release-time throw solution")
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

	statusLabel=New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text="",Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},sectionBody)
	targetLabel=New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text="Target: none",Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},sectionBody)

	if buildSlider then
		leadDelaySliderControl=buildSlider(sectionBody,"Lead Adjust",LEAD_DELAY_MIN,LEAD_DELAY_MAX,WR_LEAD_DELAY,2,function(value)
			api.SetLeadDelay(value,true)
		end)
	else
		leadDelayFrame=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,26),ZIndex=6},sectionBody)
		leadDelayBox=New("TextBox",{BackgroundColor3=THEME.BG,BorderSizePixel=0,Position=UDim2.new(1,-72,0,0),Size=UDim2.fromOffset(72,24),Text=string.format("%.2f",WR_LEAD_DELAY),ClearTextOnFocus=false,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=7},leadDelayFrame)
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-80,0,24),Text="Lead Adjust",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7},leadDelayFrame)
		addConnection(leadDelayBox.FocusLost:Connect(function()
			setLeadDelay(leadDelayBox.Text,true)
		end))
	end

	updateLeadDelayVisuals()

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

					local dt=math.min(now-data.t,0.1)
					if dt>0 then
						local rawVelocity=(receiverRoot.Position-data.pos)/dt
						local previousRawVelocity=data.rawVel or data.vel or Vector3.zero
						local rawAcceleration=(rawVelocity-previousRawVelocity)/dt
						rawAcceleration=clampMagnitude(rawAcceleration,PREDICTOR_ACCEL_MAX)
						data.rawVel=rawVelocity
						table.insert(data.vh,rawVelocity)
						if #data.vh>5 then
							table.remove(data.vh,1)
						end

						local average=Vector3.zero
						for _,velocity in ipairs(data.vh) do
							average=average+velocity
						end

						average=average/#data.vh
						data.pos=receiverRoot.Position
						data.t=now
						data.lastSeen=now
						table.insert(data.ph,{t=now,pos=receiverRoot.Position})

						while #data.ph>0 and now-data.ph[1].t>PREDICTOR_HISTORY_MAX_AGE do
							table.remove(data.ph,1)
						end

						local lsVelocity,lsQuality=leastSquaresVelocity(data,now)
						if lsVelocity and lsQuality>0 then
							average=safeVectorLerp(average,lsVelocity,PREDICTOR_LS_BLEND*lsQuality)
						end

						data.vel=safeVectorLerp(data.vel,average,PREDICTOR_VELOCITY_BLEND)
						data.vel=clampMagnitude(data.vel,MAX_RUN_SPEED)
						data.accel=safeVectorLerp(data.accel,rawAcceleration,PREDICTOR_ACCEL_BLEND)
						data.accel=clampMagnitude(data.accel,PREDICTOR_ACCEL_MAX)
						local speedConfidence=math.clamp(data.vel.Magnitude/NORMAL_ROUTE_MIN_SPEED,0,1)
						data.confidence=math.clamp(0.25+0.45*lsQuality+0.30*speedConfidence,PREDICTOR_CONFIDENCE_MIN,PREDICTOR_CONFIDENCE_MAX)
					end
				end
			end
		end
	end))

	addConnection(RunService.RenderStepped:Connect(function()
		if not(enabled and isAvailable()) then return end

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
