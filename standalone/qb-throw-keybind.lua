-- Standalone QB aim-assist throw tester.
-- This is intentionally independent from the main loader/API. It keeps a small
-- frame tracker for the selected receiver so the throw solver reads one coherent
-- QB/C2/WR snapshot instead of mixing values from different frames.

local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local RunService=game:GetService("RunService")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local Workspace=game:GetService("Workspace")
local CoreGui=game:GetService("CoreGui")
local TweenService=game:GetService("TweenService")

local LP=Players.LocalPlayer
local RUNTIME_KEY="StandaloneQBThrowKeybindGui"
local LEGACY_RUNTIME_KEYS={"StandaloneQBAimAssist",RUNTIME_KEY.."RemoteHook"}

local BALL_G=28
local G=Vector3.new(0,-BALL_G,0)
local POWER_COEFFICIENT=0.95
local DEFAULT_DISPLAY_POWER=100
local DEFAULT_PEAK_Y=14.2
local DEFAULT_LEAD_DELAY=0.35
local DEFAULT_SERVER_ARRIVAL_LEAD=0
local USE_PING_ARRIVAL_LEAD=true
local MAX_SERVER_ARRIVAL_LEAD=0.35
local RELEASE_WAIT=0.26666666666666666
local THROW_ANIMATION_SPEED=1.35
local THROW_ANIMATION_NAME="UF_QuarterbackThrow"

local MAX_RUN_SPEED=21
local VELOCITY_DEADZONE=1.25
local MIN_T=0.35
local MAX_T=6
local DT=0.02
local SPEED_TOLERANCE=1.25
local CATCH_TOLERANCE=2
local AIM_SCALE=1000
local SNAPSHOT_LIMIT=180
local REFRESH_GAME_REFS=0.5
local REFRESH_BALL_REFS=0.12
local VALID_TEAM_IDS={HomeTeam=true,AwayTeam=true}

local runtimeOwner=(type(getgenv)=="function" and getgenv()) or _G
if type(runtimeOwner)=="table" then
	local old=rawget(runtimeOwner,RUNTIME_KEY)
	if old and type(old.Destroy)=="function" then
		pcall(function() old:Destroy() end)
	end
	for _,key in ipairs(LEGACY_RUNTIME_KEYS) do
		local legacy=rawget(runtimeOwner,key)
		if legacy and type(legacy.Destroy)=="function" then
			pcall(function() legacy:Destroy() end)
		elseif type(legacy)=="table" then
			legacy.activeSession=nil
			legacy.emit=nil
		end
		rawset(runtimeOwner,key,nil)
	end
end

local connections={}
local snapshots={}
local snapshotHead=0
local snapshotCount=0

local currentBinding=Enum.KeyCode.T
local lockBinding=Enum.KeyCode.H
local teamFilter=true
local capturing=false
local selectedReceiver=nil
local throwing=false
local previewFrozen=false
local displayPower=DEFAULT_DISPLAY_POWER
local catchY=DEFAULT_PEAK_Y
local leadDelay=DEFAULT_LEAD_DELAY
local serverArrivalLead=DEFAULT_SERVER_ARRIVAL_LEAD
local lastPlan=nil

local cache={
	lastGameScan=0,
	gameFolder=nil,
	localCenter=nil,
	c2=nil,
	replicatedCenter=nil,
	lastBallScan=0,
	heldBall=nil,
}

local screenGui=nil
local statusLabel=nil
local targetLabel=nil
local keyButton=nil
local teamButton=nil
local powerBox=nil
local peakBox=nil
local leadBox=nil
local arrivalBox=nil
local previewFolder=nil
local previewParts=nil
local targetHighlight=nil

local function connect(signal,fn)
	local conn=signal:Connect(fn)
	connections[#connections+1]=conn
	return conn
end

local function disconnectAll()
	for _,conn in ipairs(connections) do
		pcall(function() conn:Disconnect() end)
	end
	connections={}
end

local function new(className,props,parent)
	local obj=Instance.new(className)
	for key,value in pairs(props or {}) do
		obj[key]=value
	end
	obj.Parent=parent
	return obj
end

local function flat(v)
	return Vector3.new(v.X,0,v.Z)
end

local function safeUnit(v,fallback)
	if not v or v.Magnitude<1e-6 then
		return fallback or Vector3.new(1,0,0)
	end
	return v.Unit
end

local function clampMagnitude(v,maxMagnitude)
	if v.Magnitude>maxMagnitude then
		return v.Unit*maxMagnitude
	end
	return v
end

local function bindingToText(binding)
	if not binding or binding==Enum.KeyCode.Unknown then
		return "None"
	end
	return tostring(binding):gsub("Enum.KeyCode%.","")
end

local function setStatus(text,color)
	if statusLabel then
		statusLabel.Text=tostring(text or "")
		statusLabel.TextColor3=color or Color3.fromRGB(190,190,190)
	end
end

local function setTargetText()
	if not targetLabel then return end
	targetLabel.Text=selectedReceiver and ("Target: "..selectedReceiver.Name) or "Target: none"
end

local function rootOf(player)
	local character=player and (player.Character or Workspace:FindFirstChild(player.Name))
	return character and (character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart)
end

local function humanoidOf(player)
	local character=player and (player.Character or Workspace:FindFirstChild(player.Name))
	return character and character:FindFirstChildOfClass("Humanoid")
end

local function getTeamId(player)
	local replicated=player and player:FindFirstChild("Replicated")
	local teamValue=replicated and replicated:FindFirstChild("TeamID")
	if not teamValue then return nil end
	local ok,value=pcall(function() return teamValue.Value end)
	return ok and tostring(value) or nil
end

local function canTarget(player)
	if not player or player==LP or not rootOf(player) then
		return false
	end
	if not teamFilter then
		return true
	end
	local localTeam=getTeamId(LP)
	local playerTeam=getTeamId(player)
	if not VALID_TEAM_IDS[localTeam] or not VALID_TEAM_IDS[playerTeam] then
		return true
	end
	return localTeam==playerTeam
end

local function getGameId()
	local replicated=LP:FindFirstChild("Replicated")
	local gameId=replicated and replicated:FindFirstChild("GameID")
	local ok,value=pcall(function() return gameId and gameId.Value end)
	if ok and value and tostring(value)~="" then
		return tostring(value)
	end
	return nil
end

local function firstChildFolder(parent)
	if not parent then return nil end
	for _,child in ipairs(parent:GetChildren()) do
		if child:IsA("Folder") or child:IsA("Model") then
			return child
		end
	end
	return nil
end

local function findWorkspaceGameFolder()
	local gameId=getGameId()
	local roots={Workspace:FindFirstChild("MiniGames"),Workspace:FindFirstChild("Games")}
	for _,root in ipairs(roots) do
		local direct=root and gameId and root:FindFirstChild(gameId)
		if direct then
			return direct
		end
	end
	local miniGames=Workspace:FindFirstChild("MiniGames")
	if miniGames and #miniGames:GetChildren()==1 then
		return firstChildFolder(miniGames)
	end
	return firstChildFolder(Workspace:FindFirstChild("Games")) or firstChildFolder(miniGames)
end

local function refreshGameRefs(force)
	local now=os.clock()
	if not force and cache.gameFolder and now-cache.lastGameScan<REFRESH_GAME_REFS then
		return
	end
	cache.lastGameScan=now
	cache.gameFolder=findWorkspaceGameFolder()
	local localFolder=cache.gameFolder and cache.gameFolder:FindFirstChild("Local")
	local replicated=cache.gameFolder and cache.gameFolder:FindFirstChild("Replicated")
	cache.localCenter=localFolder and localFolder:FindFirstChild("Center")
	cache.c2=cache.localCenter and cache.localCenter:FindFirstChild("C2",true)
	cache.replicatedCenter=replicated and replicated:FindFirstChild("Center")
end

local function instanceWorldCFrame(instance)
	if not instance then return nil end
	if instance:IsA("Attachment") then
		local ok,cf=pcall(function() return instance.WorldCFrame end)
		if ok and typeof(cf)=="CFrame" then
			return cf
		end
		local parent=instance.Parent
		if parent and parent:IsA("BasePart") then
			return parent.CFrame*instance.CFrame
		end
	elseif instance:IsA("BasePart") then
		return instance.CFrame
	end
	return nil
end

local function currentC2Position(force)
	refreshGameRefs(force)
	local cf=instanceWorldCFrame(cache.c2)
	return cf and cf.Position
end

local function currentGameCenterY(force)
	refreshGameRefs(force)
	local center=cache.replicatedCenter
	if center and center:IsA("BasePart") then
		return center.CFrame.Y+0.5
	end
	return 0.5
end

local function currentHeldBall(force)
	local character=LP.Character or Workspace:FindFirstChild(LP.Name)
	local now=os.clock()
	if not character then
		cache.heldBall=nil
		return nil
	end
	if not force and cache.heldBall and cache.heldBall.Parent and cache.heldBall:IsDescendantOf(character) then
		return cache.heldBall
	end
	if not force and now-cache.lastBallScan<REFRESH_BALL_REFS then
		return cache.heldBall
	end
	cache.lastBallScan=now
	cache.heldBall=nil
	for _,child in ipairs(character:GetChildren()) do
		if child.Name:lower():find("football") then
			if child:IsA("BasePart") then
				cache.heldBall=child
				return child
			end
			local part=child:FindFirstChildWhichIsA("BasePart",true)
			if part then
				cache.heldBall=part
				return part
			end
		end
	end
	for _,descendant in ipairs(character:GetDescendants()) do
		if descendant:IsA("BasePart") and descendant.Name:lower():find("football") then
			cache.heldBall=descendant
			return descendant
		end
	end
	return nil
end

local function getGameReEvent()
	local function valid(event)
		return event and event:IsA("RemoteEvent") and event
	end
	refreshGameRefs(false)
	local gameId=getGameId()
	local workspaceEvent=cache.gameFolder and (valid(cache.gameFolder:FindFirstChild("ReEvent")) or valid((cache.gameFolder:FindFirstChild("Replicated") or nil) and cache.gameFolder.Replicated:FindFirstChild("ReEvent")))
	if workspaceEvent then
		return workspaceEvent
	end
	local games=ReplicatedStorage:FindFirstChild("Games")
	local gameFolder=games and gameId and games:FindFirstChild(gameId)
	local gameEvent=gameFolder and (valid(gameFolder:FindFirstChild("ReEvent")) or valid((gameFolder:FindFirstChild("Replicated") or nil) and gameFolder.Replicated:FindFirstChild("ReEvent")))
	if gameEvent then
		return gameEvent
	end
	return valid(ReplicatedStorage:FindFirstChild("ReEvent"))
end

local function receiverVelocityFromSnapshot(snapshot)
	local velocity=flat(snapshot.wrVel or Vector3.zero)
	if velocity.Magnitude<VELOCITY_DEADZONE then
		return Vector3.zero
	end
	if not snapshot.wrMoving and velocity.Magnitude<MAX_RUN_SPEED*0.35 then
		return Vector3.zero
	end
	return clampMagnitude(velocity,MAX_RUN_SPEED)
end

local function releasePositionFromSnapshot(snapshot)
	return snapshot.c2Pos or snapshot.ballPos or (snapshot.qbPos and snapshot.qbPos+Vector3.new(0,1.5,0))
end

local function estimatedOneWayLatency()
	if not USE_PING_ARRIVAL_LEAD then
		return serverArrivalLead
	end
	local ok,ping=pcall(function()
		return LP:GetNetworkPing()
	end)
	if not ok or type(ping)~="number" then
		return serverArrivalLead
	end
	local estimated=ping*0.5
	if serverArrivalLead>0 then
		estimated=serverArrivalLead
	end
	return math.clamp(estimated,0,MAX_SERVER_ARRIVAL_LEAD)
end

local function makeSnapshot(receiver,forceRefs)
	local qbRoot=rootOf(LP)
	local wrRoot=rootOf(receiver)
	if not qbRoot or not wrRoot then
		return nil
	end
	local qbHumanoid=humanoidOf(LP)
	local wrHumanoid=humanoidOf(receiver)
	local heldBall=currentHeldBall(forceRefs)
	local c2Pos=currentC2Position(forceRefs)
	local serverTime=nil
	pcall(function()
		serverTime=Workspace:GetServerTimeNow()
	end)
	local wrVel=wrRoot.AssemblyLinearVelocity or Vector3.zero
	local qbVel=qbRoot.AssemblyLinearVelocity or Vector3.zero
	local wrMoving=flat(wrVel).Magnitude>=VELOCITY_DEADZONE
	if wrHumanoid and wrHumanoid.MoveDirection.Magnitude>=0.05 then
		wrMoving=true
	end
	local airborne=false
	if qbHumanoid then
		local state=qbHumanoid:GetState()
		airborne=qbHumanoid.FloorMaterial==Enum.Material.Air or state==Enum.HumanoidStateType.Jumping or state==Enum.HumanoidStateType.Freefall
	end
	local snapshot={
		t=os.clock(),
		serverTime=serverTime,
		qbRoot=qbRoot,
		wrRoot=wrRoot,
		heldBall=heldBall,
		qbPos=qbRoot.Position,
		qbVel=qbVel,
		qbLook=qbRoot.CFrame.LookVector,
		qbRight=qbRoot.CFrame.RightVector,
		qbAirborne=airborne,
		wrPos=wrRoot.Position,
		wrVel=wrVel,
		wrMoving=wrMoving,
		c2Pos=c2Pos,
		ballPos=heldBall and heldBall.Position,
		landingY=currentGameCenterY(false),
	}
	snapshot.releasePos=releasePositionFromSnapshot(snapshot)
	return snapshot
end

local function pushSnapshot(snapshot)
	if not snapshot then return nil end
	snapshotHead=snapshotHead%SNAPSHOT_LIMIT+1
	snapshots[snapshotHead]=snapshot
	if snapshotCount<SNAPSHOT_LIMIT then
		snapshotCount=snapshotCount+1
	end
	return snapshot
end

local function latestSnapshot()
	if snapshotCount<=0 then return nil end
	return snapshots[snapshotHead]
end

local function previousSnapshot()
	if snapshotCount<2 then return nil end
	local index=snapshotHead-1
	if index<1 then index=SNAPSHOT_LIMIT end
	return snapshots[index]
end

local function sampleFrame(receiver,forceRefs)
	return pushSnapshot(makeSnapshot(receiver,forceRefs))
end

local function velocityBetween(current,previous,key)
	if not(current and previous and current[key] and previous[key]) then
		return nil
	end
	local dt=current.t-previous.t
	if dt<=0 or dt>0.25 then
		return nil
	end
	return (current[key]-previous[key])/dt
end

local function projectedSnapshot(snapshot,lead)
	if not snapshot or not lead or lead<=0 then
		return snapshot
	end
	lead=math.clamp(lead,0,MAX_SERVER_ARRIVAL_LEAD)
	local previous=previousSnapshot()
	local qbVel=snapshot.qbVel or Vector3.zero
	local wrVel=snapshot.wrVel or Vector3.zero
	local c2Vel=velocityBetween(snapshot,previous,"c2Pos")
	local ballVel=velocityBetween(snapshot,previous,"ballPos")
	local projected={}
	for key,value in pairs(snapshot) do
		projected[key]=value
	end
	projected.t=snapshot.t+lead
	projected.qbPos=snapshot.qbPos+qbVel*lead
	projected.wrPos=snapshot.wrPos+flat(wrVel)*lead
	if snapshot.c2Pos then
		projected.c2Pos=snapshot.c2Pos+clampMagnitude(c2Vel or qbVel,80)*lead
	end
	if snapshot.ballPos then
		projected.ballPos=snapshot.ballPos+clampMagnitude(ballVel or qbVel,80)*lead
	end
	projected.releasePos=releasePositionFromSnapshot(projected)
	return projected
end

local function landingAtY(origin,velocity,y)
	local a=0.5*G.Y
	local b=velocity.Y
	local c=origin.Y-y
	local disc=b*b-4*a*c
	if disc<0 then
		return nil,nil
	end
	local root=math.sqrt(disc)
	local t1=(-b+root)/(2*a)
	local t2=(-b-root)/(2*a)
	local time=math.max(t1,t2)
	if time<=0 then
		time=math.min(t1,t2)
	end
	if time<=0 then
		return nil,nil
	end
	return origin+velocity*time+0.5*G*time*time,time
end

local function solveSnapshot(snapshot,power)
	if not snapshot or not snapshot.releasePos or not snapshot.wrPos then
		return nil
	end
	local origin=snapshot.releasePos
	local wrVel=receiverVelocityFromSnapshot(snapshot)
	local ballSpeed=math.clamp(power or displayPower,30,100)*POWER_COEFFICIENT
	local best=nil
	for time=MIN_T,MAX_T,DT do
		local targetXZ=snapshot.wrPos+wrVel*(time+leadDelay)
		local target=Vector3.new(targetXZ.X,catchY,targetXZ.Z)
		local needed=(target-origin-0.5*G*time*time)/time
		local speed=needed.Magnitude
		if speed>1e-6 then
			local speedError=math.abs(speed-ballSpeed)
			local missEstimate=speedError*time
			if speedError<=SPEED_TOLERANCE or missEstimate<=CATCH_TOLERANCE then
				local direction=needed.Unit
				local angle=math.deg(math.asin(math.clamp(direction.Y,-1,1)))
				if angle>=-5 and angle<=55 then
					local velocity=direction*ballSpeed
					local hit=origin+velocity*time+0.5*G*time*time
					local gameMiss=(hit-target).Magnitude
					local landing,landingTime=landingAtY(origin,velocity,snapshot.landingY or currentGameCenterY(false))
					local score=gameMiss+missEstimate*0.25+time*0.05
					if not best or score<best.score then
						best={
							score=score,
							origin=origin,
							target=target,
							time=time,
							velocity=velocity,
							direction=direction,
							aimPoint=origin+direction*AIM_SCALE,
							speedError=speedError,
							missEstimate=missEstimate,
							gameMiss=gameMiss,
							landing=landing,
							landingTime=landingTime,
							power=power or displayPower,
							snapshot=snapshot,
						}
					end
				end
			end
		end
	end
	return best
end

local function buildPlan(receiver,power,forceRefs)
	if not canTarget(receiver) then
		return nil
	end
	local snapshot=sampleFrame(receiver,forceRefs)
	return solveSnapshot(projectedSnapshot(snapshot,estimatedOneWayLatency()),power)
end

local function findNearestReceiverToMouse()
	local camera=Workspace.CurrentCamera
	local mouse=LP:GetMouse()
	if not camera or not mouse then
		return nil
	end
	local best=nil
	local bestDistance=math.huge
	for _,player in ipairs(Players:GetPlayers()) do
		if canTarget(player) then
			local root=rootOf(player)
			local screenPoint,onScreen=camera:WorldToViewportPoint(root.Position)
			if onScreen then
				local distance=(Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenPoint.X,screenPoint.Y)).Magnitude
				if distance<bestDistance then
					best=player
					bestDistance=distance
				end
			end
		end
	end
	return best
end

local function ensureHighlight()
	if not selectedReceiver then
		if targetHighlight then
			targetHighlight:Destroy()
			targetHighlight=nil
		end
		return
	end
	local character=selectedReceiver.Character
	if not character then return end
	if not targetHighlight or not targetHighlight.Parent then
		targetHighlight=Instance.new("Highlight")
		targetHighlight.Name="StandaloneQBAimTarget"
		targetHighlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
		targetHighlight.FillColor=Color3.fromRGB(0,220,140)
		targetHighlight.OutlineColor=Color3.fromRGB(120,255,205)
		targetHighlight.FillTransparency=0.72
		targetHighlight.OutlineTransparency=0
	end
	targetHighlight.Adornee=character
	targetHighlight.Parent=character
end

local function clearPreview()
	if previewFolder then
		previewFolder:Destroy()
		previewFolder=nil
		previewParts=nil
	end
end

local function ensurePreview()
	if previewFolder and previewFolder.Parent then
		return previewParts
	end
	clearPreview()
	previewFolder=Instance.new("Folder")
	previewFolder.Name="StandaloneQBAimPreview"
	previewFolder.Parent=Workspace

	local function marker(name,size,color,transparency)
		local part=Instance.new("Part")
		part.Name=name
		part.Anchored=true
		part.CanCollide=false
		part.CanQuery=false
		part.CanTouch=false
		part.Size=Vector3.new(size,size,size)
		part.Material=Enum.Material.Neon
		part.Color=color
		part.Transparency=transparency
		part.Parent=previewFolder
		local attachment=Instance.new("Attachment")
		attachment.Name=name.."Attachment"
		attachment.Parent=part
		return part,attachment
	end

	local p0,a0=marker("Origin",0.18,Color3.fromRGB(255,255,255),1)
	local p1,a1=marker("Landing",0.18,Color3.fromRGB(255,255,255),1)
	local catch=marker("Catch",1.25,Color3.fromRGB(0,235,255),0.2)
	local beam=Instance.new("Beam")
	beam.Name="Arc"
	beam.Attachment0=a0
	beam.Attachment1=a1
	beam.FaceCamera=false
	beam.Width0=1.25
	beam.Width1=1.25
	beam.Segments=40
	beam.Color=ColorSequence.new(Color3.fromRGB(255,255,255))
	beam.Transparency=NumberSequence.new({
		NumberSequenceKeypoint.new(0,0.05),
		NumberSequenceKeypoint.new(0.9,0.05),
		NumberSequenceKeypoint.new(1,0.6),
	})
	beam.Parent=previewFolder
	previewParts={p0=p0,a0=a0,p1=p1,a1=a1,catch=catch,beam=beam}
	return previewParts
end

local function beamCFrame(point,velocity,fallback)
	local dir=safeUnit(velocity,fallback or Vector3.new(0,1,0))
	return CFrame.lookAt(point,point+dir)
end

local function beamDirection(velocity,origin,time)
	if not(velocity and origin and time and time>0) then
		return nil
	end
	local endPoint=0.5*G*time*time+velocity*time+origin
	local c1=endPoint-(G*time*time+velocity*time)/3
	local c0=(0.125*G*time*time+0.5*velocity*time+origin-0.125*(origin+endPoint))/0.375-c1
	local tangent0=c0-origin
	local tangent1=c1-endPoint
	local chord=origin-endPoint
	if tangent0.Magnitude<1e-6 or tangent1.Magnitude<1e-6 or chord.Magnitude<1e-6 then
		return nil
	end
	local x0=safeUnit(tangent0,velocity)
	local zLine=safeUnit(chord,Vector3.new(0,0,-1))
	local y0=safeUnit(x0:Cross(zLine),Vector3.new(0,1,0))
	local x1=safeUnit(tangent1,velocity+G*time)
	local y1=safeUnit(x1:Cross(zLine),y0)
	local z0=safeUnit(y0:Cross(x0),Vector3.new(0,0,1))
	local curve0=tangent0.Magnitude
	local curve1=-tangent1.Magnitude
	local cf0=CFrame.new(origin.X,origin.Y,origin.Z,x0.X,y0.X,z0.X,x0.Y,y0.Y,z0.Y,x0.Z,y0.Z,z0.Z)
	local cf1=CFrame.new(endPoint.X,endPoint.Y,endPoint.Z,x1.X,y1.X,z0.X,x1.Y,y1.Y,z0.Y,x1.Z,y1.Z,z0.Z)
	return curve0,curve1,cf0,cf1,endPoint
end

local function updatePreview(plan)
	if not plan then
		clearPreview()
		return
	end
	local parts=ensurePreview()
	if not parts then return end
	local previewTime=plan.landingTime or plan.time
	local endVelocity=plan.velocity+G*previewTime
	local curve0,curve1,c2,c3,endPoint=beamDirection(plan.velocity,plan.origin,previewTime)
	endPoint=endPoint or plan.landing or plan.target
	parts.p0.CFrame=c2 or beamCFrame(plan.origin,plan.velocity)
	parts.p1.CFrame=c3 or beamCFrame(endPoint,endVelocity,plan.velocity)
	parts.catch.CFrame=CFrame.new(plan.target)
	parts.beam.CurveSize0=math.clamp(curve0 or plan.velocity.Magnitude*previewTime/3,-400,400)
	parts.beam.CurveSize1=math.clamp(curve1 or -endVelocity.Magnitude*previewTime/3,-400,400)
	parts.beam.Enabled=true
end

local function lockNearestReceiver()
	local receiver=findNearestReceiverToMouse()
	if receiver then
		selectedReceiver=receiver
		snapshotHead=0
		snapshotCount=0
		snapshots={}
		setTargetText()
		ensureHighlight()
		setStatus("Locked "..receiver.Name,Color3.fromRGB(115,240,170))
	else
		setStatus(teamFilter and "No teammate under cursor" or "No receiver under cursor",Color3.fromRGB(255,120,120))
	end
	return receiver
end

local function findThrowAnimation()
	local containers={ReplicatedStorage,LP:FindFirstChild("PlayerScripts"),LP.Character}
	for _,container in ipairs(containers) do
		local animation=container and container:FindFirstChild(THROW_ANIMATION_NAME,true)
		if animation and animation:IsA("Animation") and animation.AnimationId~="" then
			return animation
		end
	end
	return nil
end

local function playThrowAnimation()
	local humanoid=humanoidOf(LP)
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
	if not ok or not track then
		return false
	end
	pcall(function() track.Priority=Enum.AnimationPriority.Action end)
	track:Play(0.05,1,THROW_ANIMATION_SPEED)
	return true
end

local function fireThrow(plan)
	local reEvent=getGameReEvent()
	if not reEvent then
		return false,"ReEvent missing"
	end
	reEvent:FireServer("Mechanics","ThrowBall",{
		Target=plan.aimPoint,
		AutoThrow=false,
		Power=math.clamp(plan.power or displayPower,30,100),
	})
	return true,nil
end

local function attemptAimAssistThrow()
	if throwing then
		setStatus("Throw already in progress",Color3.fromRGB(255,200,120))
		return
	end
	local receiver=selectedReceiver
	if not canTarget(receiver) then
		receiver=lockNearestReceiver()
	end
	if not receiver then return end
	if not currentHeldBall(true) then
		setStatus("No football held",Color3.fromRGB(255,120,120))
		return
	end

	local plan=buildPlan(receiver,displayPower,true)
	if not plan then
		setStatus("No aim solution",Color3.fromRGB(255,120,120))
		return
	end

	throwing=true
	previewFrozen=false
	lastPlan=plan
	updatePreview(plan)
	playThrowAnimation()
	setStatus("Throwing to "..receiver.Name.." ...",Color3.fromRGB(120,210,255))

	task.delay(RELEASE_WAIT,function()
		local snapshot=sampleFrame(receiver,true) or latestSnapshot()
		local finalPlan=solveSnapshot(projectedSnapshot(snapshot,estimatedOneWayLatency()),displayPower) or lastPlan
		if finalPlan then
			lastPlan=finalPlan
			updatePreview(finalPlan)
			previewFrozen=true
			local ok,err=fireThrow(finalPlan)
			if ok then
				setStatus("Aim throw sent: "..receiver.Name,Color3.fromRGB(115,240,170))
			else
				setStatus(err or "Throw failed",Color3.fromRGB(255,120,120))
			end
		else
			setStatus("No release solution",Color3.fromRGB(255,120,120))
		end
		task.delay(0.45,function()
			throwing=false
		end)
	end)
end

local function updateConfigFromBoxes()
	local power=tonumber(powerBox and powerBox.Text)
	if power then
		displayPower=math.clamp(power,30,100)
		if powerBox then powerBox.Text=tostring(math.floor(displayPower+0.5)) end
	end
	local peak=tonumber(peakBox and peakBox.Text)
	if peak then
		catchY=math.clamp(peak,8,25)
		if peakBox then peakBox.Text=string.format("%.2f",catchY):gsub("0+$",""):gsub("%.$","") end
	end
	local lead=tonumber(leadBox and leadBox.Text)
	if lead then
		leadDelay=math.clamp(lead,0,1)
		if leadBox then leadBox.Text=string.format("%.2f",leadDelay):gsub("0+$",""):gsub("%.$","") end
	end
	local arrival=tonumber(arrivalBox and arrivalBox.Text)
	if arrival then
		serverArrivalLead=math.clamp(arrival,0,MAX_SERVER_ARRIVAL_LEAD)
		USE_PING_ARRIVAL_LEAD=serverArrivalLead<=0
		if arrivalBox then arrivalBox.Text=string.format("%.3f",serverArrivalLead):gsub("0+$",""):gsub("%.$","") end
	end
end

local function makeTextBox(parent,label,value,callback)
	local row=new("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,34)},parent)
	new("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,-72,1,0),
		Text=label,
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=Color3.fromRGB(210,210,210),
		TextXAlignment=Enum.TextXAlignment.Left,
	},row)
	local box=new("TextBox",{
		BackgroundColor3=Color3.fromRGB(30,30,30),
		BorderSizePixel=0,
		Position=UDim2.new(1,-66,0,5),
		Size=UDim2.new(0,66,0,24),
		Text=tostring(value),
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=Color3.fromRGB(245,245,245),
		ClearTextOnFocus=false,
	},row)
	new("UIStroke",{Color=Color3.fromRGB(70,70,70),Thickness=1},box)
	connect(box.FocusLost,function() callback(box) end)
	return box
end

local function makeButton(parent,text,callback)
	local button=new("TextButton",{
		BackgroundColor3=Color3.fromRGB(32,32,32),
		BorderSizePixel=0,
		Size=UDim2.new(1,0,0,30),
		Text=text,
		Font=Enum.Font.GothamBold,
		TextSize=12,
		TextColor3=Color3.fromRGB(235,235,235),
		AutoButtonColor=false,
	},parent)
	new("UIStroke",{Color=Color3.fromRGB(70,70,70),Thickness=1},button)
	connect(button.MouseEnter,function()
		TweenService:Create(button,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(42,42,42)}):Play()
	end)
	connect(button.MouseLeave,function()
		TweenService:Create(button,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(32,32,32)}):Play()
	end)
	connect(button.MouseButton1Click,callback)
	return button
end

local function buildGui()
	screenGui=Instance.new("ScreenGui")
	screenGui.Name=RUNTIME_KEY
	screenGui.ResetOnSpawn=false
	screenGui.IgnoreGuiInset=true
	pcall(function() screenGui.Parent=CoreGui end)
	if not screenGui.Parent then
		screenGui.Parent=LP:WaitForChild("PlayerGui")
	end

	local frame=new("Frame",{
		BackgroundColor3=Color3.fromRGB(12,12,12),
		BorderSizePixel=0,
		Position=UDim2.new(0,80,0,180),
		Size=UDim2.new(0,250,0,322),
		Active=true,
		Draggable=true,
	},screenGui)
	new("UIStroke",{Color=Color3.fromRGB(100,100,100),Thickness=1},frame)

	new("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.new(0,14,0,10),
		Size=UDim2.new(1,-48,0,20),
		Text="Standalone QB Aim",
		Font=Enum.Font.GothamBold,
		TextSize=14,
		TextColor3=Color3.fromRGB(245,245,245),
		TextXAlignment=Enum.TextXAlignment.Left,
	},frame)

	local close=new("TextButton",{
		BackgroundColor3=Color3.fromRGB(26,26,26),
		BorderSizePixel=0,
		Position=UDim2.new(1,-34,0,8),
		Size=UDim2.new(0,24,0,24),
		Text="X",
		Font=Enum.Font.GothamBold,
		TextSize=12,
		TextColor3=Color3.fromRGB(240,240,240),
	},frame)

	local body=new("Frame",{
		BackgroundTransparency=1,
		Position=UDim2.new(0,14,0,42),
		Size=UDim2.new(1,-28,1,-52),
	},frame)
	new("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},body)

	targetLabel=new("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,20),
		Text="Target: none",
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=Color3.fromRGB(200,200,200),
		TextXAlignment=Enum.TextXAlignment.Left,
	},body)

	keyButton=makeButton(body,"Throw Key: "..bindingToText(currentBinding),function()
		capturing=true
		keyButton.Text="Press a key..."
		setStatus("Press a key for throw",Color3.fromRGB(120,210,255))
	end)

	teamButton=makeButton(body,"Team Filter: ON",function()
		teamFilter=not teamFilter
		teamButton.Text="Team Filter: "..(teamFilter and "ON" or "OFF")
		selectedReceiver=nil
		setTargetText()
		ensureHighlight()
		clearPreview()
		setStatus("Team filter "..(teamFilter and "on" or "off"))
	end)

	makeButton(body,"Lock Receiver Under Mouse (H)",function()
		lockNearestReceiver()
	end)

	makeButton(body,"Throw Aim Assist",function()
		updateConfigFromBoxes()
		attemptAimAssistThrow()
	end)

	powerBox=makeTextBox(body,"Display Power",displayPower,function() updateConfigFromBoxes() end)
	peakBox=makeTextBox(body,"Peak Height",catchY,function() updateConfigFromBoxes() end)
	leadBox=makeTextBox(body,"Lead Delay",leadDelay,function() updateConfigFromBoxes() end)
	arrivalBox=makeTextBox(body,"Arrival Lead",serverArrivalLead,function() updateConfigFromBoxes() end)

	statusLabel=new("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,34),
		Text="H locks. "..bindingToText(currentBinding).." throws.",
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=Color3.fromRGB(190,190,190),
		TextWrapped=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextYAlignment=Enum.TextYAlignment.Top,
	},body)

	connect(close.MouseButton1Click,function()
		local owner=type(runtimeOwner)=="table" and rawget(runtimeOwner,RUNTIME_KEY)
		if owner and type(owner.Destroy)=="function" then
			owner:Destroy()
		end
	end)
end

local function destroy()
	disconnectAll()
	clearPreview()
	if targetHighlight then
		targetHighlight:Destroy()
		targetHighlight=nil
	end
	if screenGui then
		screenGui:Destroy()
		screenGui=nil
	end
	snapshots={}
	snapshotHead=0
	snapshotCount=0
	if type(runtimeOwner)=="table" and rawget(runtimeOwner,RUNTIME_KEY) then
		rawset(runtimeOwner,RUNTIME_KEY,nil)
	end
end

buildGui()

connect(UIS.InputBegan,function(input,processed)
	if capturing then
		if input.UserInputType==Enum.UserInputType.Keyboard and input.KeyCode~=Enum.KeyCode.Unknown then
			currentBinding=input.KeyCode
			capturing=false
			keyButton.Text="Throw Key: "..bindingToText(currentBinding)
			setStatus("Throw key set to "..bindingToText(currentBinding))
		end
		return
	end
	if processed then return end
	if input.UserInputType==Enum.UserInputType.Keyboard and input.KeyCode==lockBinding then
		lockNearestReceiver()
		return
	end
	if input.UserInputType==Enum.UserInputType.Keyboard and input.KeyCode==currentBinding then
		updateConfigFromBoxes()
		attemptAimAssistThrow()
	end
end)

connect(RunService.RenderStepped,function()
	if selectedReceiver and not canTarget(selectedReceiver) then
		selectedReceiver=nil
		setTargetText()
		ensureHighlight()
		clearPreview()
		return
	end

	if not selectedReceiver then
		if not throwing then clearPreview() end
		return
	end

	ensureHighlight()
	local heldBall=currentHeldBall(false)
	local snapshot=sampleFrame(selectedReceiver,false)
	if heldBall and not throwing then
		previewFrozen=false
		local plan=solveSnapshot(projectedSnapshot(snapshot,estimatedOneWayLatency()),displayPower)
		lastPlan=plan
		updatePreview(plan)
	elseif not heldBall and not previewFrozen and not throwing then
		clearPreview()
	end
end)

if type(runtimeOwner)=="table" then
	rawset(runtimeOwner,RUNTIME_KEY,{Destroy=destroy})
end

setStatus("Ready. H locks, "..bindingToText(currentBinding).." throws.")
