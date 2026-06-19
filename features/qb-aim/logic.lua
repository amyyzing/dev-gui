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
local QB_LAUNCH_Y_BIAS=0
local C2_GROUND_FALLBACK_MARGIN=2.50
local C2_MAX_ABOVE_BALL=8.00
local C2_MAX_RELEASE_DISTANCE=12.00
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
	ReactionBuffer=0.05,
	CatchHeightTolerance=0.25,
	SampleDt=0.08,
	SampleMax=28,
}
local TRACK_SETTINGS={
	ReceiverInterval=0.05,
}
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
local THROW_TARGET_LOCK_EXTRA_DELAY=0.00
local THROW_TARGET_LOCK_PREVIEW_LIVE=false -- freeze locked plan during animation; normal game preview appears to latch here
local THROW_TARGET_FIRE_IMMEDIATELY=false
local THROW_INPUT_COOLDOWN=0.85
local THROW_RELEASE_CONFIRM_TIMEOUT=1.75
local THROW_RELEASE_CONFIRM_STABLE_TIME=0.08
local QB_RELEASE_PREDICT_TIME=THROW_ANIMATION_RELEASE_WAIT
local WR_RELEASE_PREDICT_TIME=THROW_ANIMATION_RELEASE_WAIT
-- Key model:
--   1. Keypress computes one locked plan.
--   2. Original Center.C2 is snapshotted as the local release-frame anchor.
--   3. The release point is projected to the animation release frame on X/Z.
--   4. WR is predicted through the same release window.
--   5. Remote fires after THROW_ANIMATION_RELEASE_WAIT, always 0.266666...
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
	local api={}
	local enabled=false
	local trackedReceiver=nil
	local selectedRouteLock=nil
	local receiverData={}
	local receiverTrackElapsed=0
	local preview={last=0,center=nil,c2=nil,c3=nil,c1=nil,beam=nil,beamDefaultColor=nil,orig=nil,p1=nil,p2=nil,p3=nil,ballMissingSince=nil}
	local previewFrozen=false
	local previewFreezeStarted=0
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
	local updateTargetHighlight=function() end

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

	WR_LEAD_DELAY=math.clamp(tonumber(state.qbAimLeadDelay) or WR_LEAD_DELAY,LEAD_DELAY_MIN,LEAD_DELAY_MAX)
	WR_MAX_Y=math.clamp(tonumber(state.qbAimPeakHeight) or WR_MAX_Y,PEAK_HEIGHT_MIN,PEAK_HEIGHT_MAX)
	state.qbAimPeakHeight=WR_MAX_Y
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
		for _,player in ipairs(Players:GetPlayers()) do
			local character=player.Character
			if character then
				destroyQBAimHighlight(character)
			end
		end

		highlightedCharacter=nil
	end

	updateTargetHighlight=function()
		local character=enabled and state.qbAimTargetHighlight~=false and trackedReceiver and trackedReceiver.Character or nil
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

	local function captureReleaseFrame(qbRoot,ball)
		return{
			t=os.clock(),
			c2=c2Position(),
			rootPos=qbRoot and qbRoot.Position or nil,
			ballPos=ball and ball.Position or nil,
			rootVel=qbRoot and qbRoot.AssemblyLinearVelocity or Vector3.zero,
		}
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

	local function origin(qbRoot,ball,releaseFrame,releaseOffset)
		releaseOffset=math.max(tonumber(releaseOffset) or 0,0)
		local fallbackPosition=(releaseFrame and (releaseFrame.ballPos or releaseFrame.rootPos)) or (ball and ball.Position) or qbRoot.Position
		local c2Pos=releaseFrame and releaseFrame.c2 or c2Position()
		local useC2=false
		if c2Pos then
			local referencePosition=fallbackPosition
			local yValid=c2Pos.Y>=referencePosition.Y-C2_GROUND_FALLBACK_MARGIN and c2Pos.Y<=referencePosition.Y+C2_MAX_ABOVE_BALL
			local distanceValid=(c2Pos-referencePosition).Magnitude<=C2_MAX_RELEASE_DISTANCE
			useC2=yValid and distanceValid
		end

		local basePosition=useC2 and c2Pos or fallbackPosition
		local releaseVelocity=flat((releaseFrame and releaseFrame.rootVel) or qbRoot.AssemblyLinearVelocity or Vector3.zero)
		local predictedXZ=basePosition+releaseVelocity*releaseOffset
		return Vector3.new(predictedXZ.X,basePosition.Y+QB_LAUNCH_Y_BIAS,predictedXZ.Z),useC2 and "center_c2_projected" or (ball and "ball_projected" or "root_projected"),useC2
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
		local localTeam=getPlayerTeamID(LP)

		for _,player in ipairs(Players:GetPlayers()) do
			local playerTeam=getPlayerTeamID(player)
			if player~=receiver and player~=LP and isValidGameTeamID(playerTeam) and isValidGameTeamID(localTeam) and playerTeam~=localTeam then
				local character=Workspace:FindFirstChild(player.Name) or player.Character
				local defenderRoot=root(character)
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

		if ballPosition.Y>catchY+DEFENDER_SETTINGS.CatchHeightTolerance then
			return false
		end

		local reachRadius=DEFENDER_SETTINGS.Speed*(elapsed+DEFENDER_SETTINGS.ReactionBuffer)
		return (flat(defenderRoot.Position)-flat(ballPosition)).Magnitude<=reachRadius
	end

	local function planCanBeDefended(plan,receiver)
		if state.qbAimSafeArc==false or not plan then
			return false
		end

		local defenderRoots=collectArcDefenderRoots(receiver)
		if #defenderRoots==0 then
			return false
		end

		local catchY=WR_MAX_Y+C1_SOLVE_Y_BIAS
		local catchPoint=plan.target or plan.c1Point
		local catchTime=plan.time
		if not(catchPoint and catchTime and catchTime>0) then
			return true
		end

		for _,defenderRoot in ipairs(defenderRoots) do
			if defenderCanReachBall(defenderRoot,catchPoint,catchTime,catchY) then
				return true
			end
		end

		local sampleCount=math.clamp(math.ceil(catchTime/DEFENDER_SETTINGS.SampleDt),4,DEFENDER_SETTINGS.SampleMax)
		for sampleIndex=1,sampleCount do
			local time=catchTime*sampleIndex/sampleCount
			local ballPosition=mathCore.ballAt(plan.origin,plan.velocity,time)

			for _,defenderRoot in ipairs(defenderRoots) do
				if defenderCanReachBall(defenderRoot,ballPosition,time,catchY) then
					return true
				end
			end
		end

		return false
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

	local function hasHeldBallForPreview()
		return getHeldBall()~=nil
	end

	local function throwBlocked()
		return throwInProgress or os.clock()-lastThrowAt<THROW_INPUT_COOLDOWN
	end

	local function waitForHeldBallRelease()
		local deadline=os.clock()+THROW_RELEASE_CONFIRM_TIMEOUT
		local detachedSince=nil

		while os.clock()<deadline do
			if not getHeldBall() then
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

	local function buildPlan(receiver,ballPower,releaseOffset,releaseBall,receiverReleaseOffset,releaseFrame)
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
		receiverReleaseOffset=receiverReleaseOffset==nil and releaseOffset or receiverReleaseOffset
		releaseFrame=releaseFrame or captureReleaseFrame(qbRoot,ball)
		local originPosition,originSource,originUsesC2=origin(qbRoot,ball,releaseFrame,releaseOffset)
		local receiverAnchorPosition,receiverAnchorSource=receiverCatchAnchor(receiver,receiverRoot)
		local targetVelocity,shape,predictorState=routeVelocity(receiver,data,originPosition,receiverRoot,selectedRouteLock)
		local plan=mathCore.solve({
			originPosition=originPosition,
			receiverPosition=receiverRoot.Position,
			receiverAnchorPosition=receiverAnchorPosition,
			receiverAnchorSource=receiverAnchorSource,
			targetVelocity=targetVelocity,
			shape=shape,
			ballPower=ballPower or currentBallPower(),
			qbVelocity=qbRoot.AssemblyLinearVelocity,
			qbReleaseOffset=releaseOffset,
			receiverReleaseOffset=receiverReleaseOffset,
			predictorState=predictorState,
			catchY=WR_MAX_Y,
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
		})

		if plan then
			plan.releaseOriginSource=originSource
			plan.releaseUsesC2=originUsesC2
			plan.releaseFrameAge=releaseFrame and math.max(os.clock()-(releaseFrame.t or os.clock()),0) or 0
			plan.clientServerMixedRelease=true
		end

		return plan,ball
	end

	local function buildReleasePlan(receiver,ballPower,releaseBall,lockedPlan)
		-- Target-latch / delayed-remote solver.
		-- The preview arc locks at keypress, but the remote appears shortly before release.
		-- Keep the keypress plan frozen during animation, then send that same world Target.
		-- Do not recompute from the future QB point and do not fire immediately.
		if THROW_TARGET_FIRE_IMMEDIATELY then
			if lockedPlan then
				previewPlan(lockedPlan)
			end
			return lockedPlan,releaseBall
		end

		if THROW_ANIMATION_RELEASE_WAIT<=0 then
			return lockedPlan or buildPlan(receiver,ballPower,0,releaseBall)
		end

		local endAt=os.clock()+THROW_ANIMATION_RELEASE_WAIT
		local fireAt=endAt-math.clamp(THROW_REMOTE_LEAD_TIME,0,THROW_ANIMATION_RELEASE_WAIT)

		while os.clock()<fireAt do
			if THROW_TARGET_LOCK_PREVIEW_LIVE then
				local remaining=math.max(endAt-os.clock(),0)
				local livePlan=buildPlan(receiver,ballPower,remaining,releaseBall,remaining)
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

		-- Lock one plan at keypress. Keep animation-to-fire timing at 0.2666s,
		-- and solve from the captured C2 projected to that same release frame.
		-- The WR prediction uses the same release window.
		local lockedQBOffset=QB_RELEASE_PREDICT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY
		local lockedWROffset=WR_RELEASE_PREDICT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY
		local releaseFrame=captureReleaseFrame(root(LP.Character),heldBall)
		throwInProgress=true

		local function releaseThrowLock()
			throwInProgress=false
			lastThrowAt=os.clock()
		end

		local lockedPlan=buildPlan(receiver,power,lockedQBOffset,heldBall,lockedWROffset,releaseFrame)
		if not lockedPlan then
			releaseThrowLock()
			setStatus("No target-latch throw solution")
			return
		end

		previewPlan(lockedPlan)
		if planCanBeDefended(lockedPlan,receiver) then
			releaseThrowLock()
			setStatus("Unsafe throw blocked")
			return
		end

		QBAim._playThrowAnimation()

		local plan=buildReleasePlan(receiver,power,heldBall,lockedPlan)
		if not plan then
			releaseThrowLock()
			setStatus("No target-latch throw solution")
			return
		end

		if planCanBeDefended(plan,receiver) then
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
			setStatus(currentModeText().." delayed future-release throw sent")
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
			clearTargetHighlights()
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

	addConnection(RunService.Heartbeat:Connect(function(dt)
		if not(enabled and isAvailable()) then return end
		if not isAlive() then return end

		receiverTrackElapsed=receiverTrackElapsed+(dt or 0)
		if receiverTrackElapsed<TRACK_SETTINGS.ReceiverInterval then return end
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
		if not(enabled and isAvailable()) then
			if highlightedCharacter then
				clearTargetHighlights()
			end
			return
		end

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

		updateTargetHighlight()

		if not trackedReceiver then return end

		if state.qbAimShowArc==false then
			hideQBTrailPreview()
			return
		end

		if now-preview.last<ARC_SETTINGS.UpdateInterval then return end
		preview.last=now

		local previewQBOffset=QB_RELEASE_PREDICT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY
		local previewWROffset=WR_RELEASE_PREDICT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY
		local plan=buildPlan(trackedReceiver,nil,previewQBOffset,nil,previewWROffset)
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

		if wantsLock then
			lockReceiverUnderCursor()
			return true
		end

		if wantsThrow and throwBlocked() then
			setStatus("Throw already in progress")
			return true
		end

		if not getHeldBall() then
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
