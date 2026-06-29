-- standalone scratch script. not part of the main panel loader path.

-- Standalone Practice / Quarterback Gauntlet hitbox toggle.
-- Toggle locally expands gauntlet TouchDetect hitboxes for easier overlap.

local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local RunService=game:GetService("RunService")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local Workspace=game:GetService("Workspace")
local CoreGui=game:GetService("CoreGui")
local TweenService=game:GetService("TweenService")
local CollectionService=game:GetService("CollectionService")

local LP=Players.LocalPlayer
local RUNTIME_KEY="StandalonePracticeQBGauntlet"
local LEGACY_RUNTIME_KEYS={
	"StandaloneQBThrowKeybindGui",
	"StandaloneQBAimAssist",
	"StandaloneQBThrowKeybindGuiRemoteHook",
}

local BALL_G=28
local G=Vector3.new(0,-BALL_G,0)
local POWER_COEFFICIENT=0.95
local DEFAULT_POWER=100
local DEFAULT_TARGET_LEAD=0
local HITBOX_SCALE=2
local MIN_T=0.25
local MAX_T=5
local DT=0.02
local AIM_SCALE=1000
local MAX_TARGET_SPEED=90
local REFRESH_INTERVAL=0.12
local PREVIEW_UPDATE_INTERVAL=1/30
local TARGET_VELOCITY_DAMPING=0.62
local HIT_SPAM_INTERVAL=0.08
local HIT_RETRY_WINDOW=0.55
local HIT_NEAR_MARGIN=1.5
local GAUNTLET_TARGET_PATHS={
	{score=5,name="5",path={"Throw5_1","RotateModel","Throw1","TouchDetect"}},
	{score=5,name="5",path={"SideToSide","Throw5_1","RotateModel","Throw1","TouchDetect"}},
	{score=4,name="4-1",path={"SideToSide","Throw4_1","RotateModel","Throw1","TouchDetect"}},
	{score=4,name="4-2",path={"SideToSide","Throw4_2","RotateModel","Throw1","TouchDetect"}},
	{score=3,name="3",path={"Stationary","Throw3","Throw4","TouchDetect"}},
	{score=3,name="3",path={"Stationary","Throw3_1","Throw4","TouchDetect"}},
	{score=3,name="3",path={"Stationary","Throw3_2","Throw4","TouchDetect"}},
}

local runtimeOwner=(type(getgenv)=="function" and getgenv()) or _G
if type(runtimeOwner)=="table" then
	for _,key in ipairs(LEGACY_RUNTIME_KEYS) do
		local old=rawget(runtimeOwner,key)
		if old and type(old.Destroy)=="function" then
			pcall(function() old:Destroy() end)
		end
		rawset(runtimeOwner,key,nil)
	end
	local old=rawget(runtimeOwner,RUNTIME_KEY)
	if old and type(old.Destroy)=="function" then
		pcall(function() old:Destroy() end)
	end
end

local connections={}
local currentBinding=Enum.KeyCode.T
local capturing=false
local power=DEFAULT_POWER
local targetLead=DEFAULT_TARGET_LEAD
local lastRefresh=0
local activeTargets={}
local targetHistory={}
local currentTarget=nil
local cachedPlan=nil
local lastPreviewUpdate=0
local cachedPracticeBall=nil
local practiceControlsEnabled=true
local boundPracticeEvent=nil
local ballHitConn=nil

local screenGui=nil
local statusLabel=nil
local targetLabel=nil
local keyButton=nil
local powerBox=nil
local leadBox=nil
local targetHighlight=nil
local previewFolder=nil
local previewParts=nil
local hitboxEnabled=false
local originalHitboxes={}
local hitboxButton=nil
local hitSpamEnabled=false
local hitSpamButton=nil

local function connect(signal,fn)
	local connection=signal:Connect(fn)
	connections[#connections+1]=connection
	return connection
end

local function disconnectAll()
	for _,connection in ipairs(connections) do
		pcall(function() connection:Disconnect() end)
	end
	connections={}
end

local function new(className,properties,parent)
	local instance=Instance.new(className)
	for key,value in pairs(properties or {}) do
		instance[key]=value
	end
	instance.Parent=parent
	return instance
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

local function pathOf(instance)
	local parts={}
	local cursor=instance
	while cursor and cursor~=game do
		table.insert(parts,1,cursor.Name)
		cursor=cursor.Parent
	end
	return table.concat(parts,".")
end

local function rootOfLocalPlayer()
	local character=LP.Character or Workspace:FindFirstChild(LP.Name)
	return character and (character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart)
end

local function heldFootball()
	if cachedPracticeBall and typeof(cachedPracticeBall)=="Instance" then
		if cachedPracticeBall:IsA("BasePart") then
			return cachedPracticeBall
		end
		local part=cachedPracticeBall:FindFirstChildWhichIsA("BasePart",true)
		if part then return part end
	end
	local character=LP.Character or Workspace:FindFirstChild(LP.Name)
	if not character then return nil end
	for _,child in ipairs(character:GetChildren()) do
		if child.Name:lower():find("football") then
			if child:IsA("BasePart") then return child end
			local part=child:FindFirstChildWhichIsA("BasePart",true)
			if part then return part end
		end
	end
	for _,descendant in ipairs(character:GetDescendants()) do
		if descendant:IsA("BasePart") and descendant.Name:lower():find("football") then
			return descendant
		end
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

local function findPracticeWorkspace()
	local miniGames=Workspace:FindFirstChild("MiniGames")
	if not miniGames then return nil end
	for _,child in ipairs(miniGames:GetChildren()) do
		local replicated=child:FindFirstChild("Replicated")
		if replicated and replicated:FindFirstChild("QuarterbackGauntlet") then
			return child
		end
	end
	return firstChildFolder(miniGames)
end

local function findPracticeRemote(workspaceGame)
	local miniGames=ReplicatedStorage:FindFirstChild("MiniGames")
	local direct=miniGames and workspaceGame and miniGames:FindFirstChild(workspaceGame.Name)
	local event=direct and direct:FindFirstChild("ReEvent")
	if event and event:IsA("RemoteEvent") then
		return event
	end
	if miniGames then
		for _,child in ipairs(miniGames:GetChildren()) do
			event=child:FindFirstChild("ReEvent")
			if event and event:IsA("RemoteEvent") then
				return event
			end
		end
	end
	event=ReplicatedStorage:FindFirstChild("ReEvent")
	if event and event:IsA("RemoteEvent") then
		return event
	end
	return nil
end

local function worldCFrame(instance)
	if not instance then return nil end
	if instance:IsA("Attachment") then
		local ok,cframeValue=pcall(function() return instance.WorldCFrame end)
		if ok and typeof(cframeValue)=="CFrame" then return cframeValue end
		local parent=instance.Parent
		if parent and parent:IsA("BasePart") then
			return parent.CFrame*instance.CFrame
		end
	elseif instance:IsA("BasePart") then
		return instance.CFrame
	end
	return nil
end

local function centerC2Position(workspaceGame)
	local localFolder=workspaceGame and workspaceGame:FindFirstChild("Local")
	local center=localFolder and localFolder:FindFirstChild("Center")
	local c2=center and center:FindFirstChild("C2",true)
	local cframeValue=worldCFrame(c2)
	return cframeValue and cframeValue.Position
end

local function releaseOrigin(workspaceGame)
	local c2=centerC2Position(workspaceGame)
	if c2 then return c2 end
	local ball=heldFootball()
	if ball then return ball.Position end
	local root=rootOfLocalPlayer()
	return root and (root.Position+Vector3.new(0,1.5,0))
end

local function canHitValue(touch)
	local cursor=touch
	for _=1,8 do
		if not cursor then break end
		local value=cursor:FindFirstChild("CanHit")
		if value and value:IsA("BoolValue") then
			return value
		end
		value=cursor:FindFirstChild("CanHit",true)
		if value and value:IsA("BoolValue") then
			return value
		end
		cursor=cursor.Parent
	end
	return nil
end

local function targetScore(touch)
	local path=pathOf(touch):lower()
	if path:find("throw5") then return 5 end
	if path:find("stationary") and path:find("throw3") then return 3 end
	if path:find("sidetoside") and path:find("throw4") then return 4 end
	if path:find("throw3") then return 3 end
	if path:find("throw4") then return 4 end
	return 0
end

local function touchDetectPart(instance)
	if instance:IsA("BasePart") then
		return instance
	end
	return instance:FindFirstChildWhichIsA("BasePart",true)
end

local function findByPath(root,segments)
	local cursor=root
	for _,name in ipairs(segments) do
		if not cursor then return nil end
		cursor=cursor:FindFirstChild(name)
	end
	return cursor
end

local function canHitState(part)
	local canHit=part and part.Parent and part.Parent:FindFirstChild("CanHit")
	if canHit and canHit:IsA("BoolValue") then
		return canHit.Value
	end
	return nil
end

local function closestTaggedTouch(position,tagged)
	local best=nil
	local bestDist=nil
	for _,instance in ipairs(tagged or {}) do
		if instance and instance.Parent then
			local touch=nil
			if instance:IsA("BasePart") and instance.Name=="TouchDetect" then
				touch=instance
			else
				local found=instance:FindFirstChild("TouchDetect",true)
				if found then
					touch=touchDetectPart(found)
				end
			end
			if touch and touch:IsA("BasePart") and touch.Parent then
				local dist=(touch.Position-position).Magnitude
				if not bestDist or dist<bestDist then
					best=touch
					bestDist=dist
				end
			end
		end
	end
	return best,bestDist
end

local function targetLabelText(target)
	if not target then return "Target: none" end
	return string.format("Target: %dpt  %s",target.score,target.name or target.part.Name)
end

local function updateTargetText()
	if targetLabel then
		targetLabel.Text=targetLabelText(currentTarget)
	end
end

local function targetVelocity(part)
	local now=os.clock()
	local pos=part.Position
	local previous=targetHistory[part]
	local velocity=part.AssemblyLinearVelocity or Vector3.zero
	if previous then
		local dt=now-previous.t
		if dt>0 and dt<0.35 then
			local measured=(pos-previous.pos)/dt
			if measured.Magnitude>velocity.Magnitude then
				velocity=measured
			end
		end
	end
	targetHistory[part]={pos=pos,t=now,velocity=velocity}
	if velocity.Magnitude>MAX_TARGET_SPEED then
		velocity=velocity.Unit*MAX_TARGET_SPEED
	end
	velocity=velocity*TARGET_VELOCITY_DAMPING
	return velocity
end

local function targetStillActive(target)
	return target and target.part and target.part.Parent and target.canHit and target.canHit.Value
end

local function restoreHitboxes()
	for part,original in pairs(originalHitboxes) do
		if part and part.Parent then
			pcall(function()
				part.Size=original.Size
				part.Transparency=original.Transparency
				part.CanCollide=original.CanCollide
				part.CanTouch=original.CanTouch
				part.CanQuery=original.CanQuery
			end)
		end
	end
	originalHitboxes={}
end

local function applyHitbox(part)
	if not hitboxEnabled or not part or not part.Parent or not part:IsA("BasePart") then
		return
	end
	if not originalHitboxes[part] then
		originalHitboxes[part]={
			Size=part.Size,
			Transparency=part.Transparency,
			CanCollide=part.CanCollide,
			CanTouch=part.CanTouch,
			CanQuery=part.CanQuery,
		}
	end
	local original=originalHitboxes[part]
	part.Size=original.Size*HITBOX_SCALE
	part.CanCollide=false
	part.CanTouch=true
	part.CanQuery=true
	part.Transparency=math.max(original.Transparency,0.55)
end

local function refreshHitboxButton()
	if hitboxButton then
		local prefix=string.format("%gx Hitbox",HITBOX_SCALE)
		hitboxButton.Text=hitboxEnabled and (prefix..": ON") or (prefix..": OFF")
		hitboxButton.BackgroundColor3=hitboxEnabled and Color3.fromRGB(30,110,70) or Color3.fromRGB(32,32,32)
	end
end

local function setHitboxEnabled(enabled)
	hitboxEnabled=enabled==true
	if not hitboxEnabled then
		restoreHitboxes()
	else
		for _,target in ipairs(activeTargets) do
			applyHitbox(target.part)
		end
	end
	refreshHitboxButton()
	local scaleText=string.format("%gx",HITBOX_SCALE)
	setStatus(hitboxEnabled and (scaleText.." gauntlet hitboxes enabled") or (scaleText.." gauntlet hitboxes disabled"),hitboxEnabled and Color3.fromRGB(115,240,170) or Color3.fromRGB(190,190,190))
end

local function refreshHitSpamButton()
	if hitSpamButton then
		hitSpamButton.Text=hitSpamEnabled and "Hit Window Retry: ON" or "Hit Window Retry: OFF"
		hitSpamButton.BackgroundColor3=hitSpamEnabled and Color3.fromRGB(110,70,30) or Color3.fromRGB(32,32,32)
	end
end

local function setHitSpamEnabled(enabled)
	hitSpamEnabled=enabled==true
	refreshHitSpamButton()
	if hitSpamEnabled then
		setStatus("Hit retry armed; waits for CanHit.",Color3.fromRGB(255,190,100))
	else
		setStatus("Hit retry disabled",Color3.fromRGB(190,190,190))
	end
end

local function refreshTargets(force)
	local now=os.clock()
	if not force and now-lastRefresh<REFRESH_INTERVAL then
		return activeTargets
	end
	lastRefresh=now
	activeTargets={}

	local workspaceGame=findPracticeWorkspace()
	local base=workspaceGame and workspaceGame:FindFirstChild("Replicated")
	base=base and base:FindFirstChild("QuarterbackGauntlet")
	if not base then
		currentTarget=nil
		updateTargetText()
		return activeTargets
	end

	local function addTarget(touch,score,name,seen)
		local part=touchDetectPart(touch)
		if not part or seen[part] then
			return
		end
		local canHit=canHitValue(touch) or canHitValue(part)
		if not(canHit and canHit.Value) then
			return
		end
		seen[part]=true
		applyHitbox(part)
		activeTargets[#activeTargets+1]={
			part=part,
			score=score,
			name=name,
			canHit=canHit,
			velocity=targetVelocity(part),
			workspaceGame=workspaceGame,
		}
	end

	local seen={}
	for _,entry in ipairs(GAUNTLET_TARGET_PATHS) do
		local touch=findByPath(base,entry.path)
		if touch then
			addTarget(touch,entry.score,entry.name,seen)
		end
	end

	for _,descendant in ipairs(base:GetDescendants()) do
		if descendant.Name=="TouchDetect" then
			local score=targetScore(descendant)
			if score>0 then
				addTarget(descendant,score,nil,seen)
			end
		end
	end

	table.sort(activeTargets,function(a,b)
		if a.score~=b.score then return a.score>b.score end
		return a.part.Position.Y>b.part.Position.Y
	end)
	local best=activeTargets[1]
	if targetStillActive(currentTarget) then
		local matched=false
		for _,target in ipairs(activeTargets) do
			if target.part==currentTarget.part then
				currentTarget=target
				matched=true
				break
			end
		end
		if not matched then
			currentTarget=best
		elseif best and best.score>currentTarget.score then
			currentTarget=best
		end
	else
		currentTarget=best
	end
	updateTargetText()
	return activeTargets
end

local function ensureHighlight()
	if not currentTarget or not currentTarget.part then
		if targetHighlight then
			targetHighlight:Destroy()
			targetHighlight=nil
		end
		return
	end
	if not targetHighlight or not targetHighlight.Parent then
		targetHighlight=Instance.new("Highlight")
		targetHighlight.Name="PracticeGauntletTarget"
		targetHighlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
		targetHighlight.FillColor=Color3.fromRGB(0,235,255)
		targetHighlight.OutlineColor=Color3.fromRGB(255,255,255)
		targetHighlight.FillTransparency=0.65
		targetHighlight.OutlineTransparency=0
	end
	targetHighlight.Adornee=currentTarget.part
	targetHighlight.Parent=currentTarget.part
end

local function clearPreview()
	if previewFolder then
		previewFolder:Destroy()
		previewFolder=nil
		previewParts=nil
	end
end

local function stopBallDetection()
	if ballHitConn then
		pcall(function() ballHitConn:Disconnect() end)
		ballHitConn=nil
	end
end

local function startBallDetection(event,ball)
	stopBallDetection()
	if not event or not ball or not ball.Parent or not ball:IsA("BasePart") then
		return
	end

	local radius=math.max(ball.Size.X,ball.Size.Y,ball.Size.Z)/2+0.5
	local params=OverlapParams.new()
	params.MaxParts=40
	params.FilterType=Enum.RaycastFilterType.Include
	params.FilterDescendantsInstances=CollectionService:GetTagged("FootballCanHit")

	local hit=false
	local lastSent={}
	local sentCount=0
	local firstNearAt=nil
	local lastNearAt=nil
	ballHitConn=RunService.Heartbeat:Connect(function()
		if hit or not ball or not ball.Parent then
			stopBallDetection()
			return
		end

		local tagged=CollectionService:GetTagged("FootballCanHit")
		params.FilterDescendantsInstances=tagged
		local parts=Workspace:GetPartBoundsInRadius(ball.Position,radius,params)
		local closest,closestDist=closestTaggedTouch(ball.Position,tagged)
		local closestCanHit=canHitState(closest)
		local sawOverlap=false
		local now=os.clock()
		local nearWindow=closestDist and closestDist<=radius+HIT_NEAR_MARGIN
		local sentThisFrame=false

		local function fireHit(part,stopAfterSend)
			local last=lastSent[part] or 0
			if hitSpamEnabled and now-last<HIT_SPAM_INTERVAL then
				return false
			end
			lastSent[part]=now
			sentCount=sentCount+1
			pcall(function()
				event:FireServer("Mechanics","QBGauntletClientHit",part)
			end)
			setStatus(string.format("Hit retry sent %d event(s).",sentCount),Color3.fromRGB(255,190,100))
			if stopAfterSend then
				hit=true
			end
			return true
		end

		for _,part in ipairs(parts) do
			if part.Name=="TouchDetect" then
				sawOverlap=true
				local canHitReady=canHitState(part)
				if canHitReady and not sentThisFrame then
					sentThisFrame=fireHit(part,not hitSpamEnabled) or sentThisFrame
					if hit then
						stopBallDetection()
						return
					end
				end
			end
		end

		if nearWindow then
			firstNearAt=firstNearAt or now
			lastNearAt=now
		end

		if hitSpamEnabled and not sentThisFrame and nearWindow and closest and closestCanHit then
			sentThisFrame=fireHit(closest,false) or sentThisFrame
		end

		if sawOverlap and not closestCanHit then
			setStatus("Overlap seen; waiting for CanHit.",Color3.fromRGB(255,190,100))
		elseif firstNearAt and lastNearAt and now-lastNearAt>HIT_RETRY_WINDOW then
			setStatus("Hit window passed.",Color3.fromRGB(190,190,190))
			stopBallDetection()
		elseif sawOverlap and hitSpamEnabled then
			setStatus(string.format("Hit retry active. Sent %d event(s).",sentCount),Color3.fromRGB(255,190,100))
		end
	end)
	connections[#connections+1]=ballHitConn
end

local function notePracticeBall(ball)
	if typeof(ball)=="Instance" then
		cachedPracticeBall=ball
	end
end

local function handlePracticeEvent(action,...)
	if action=="ToggleControls" then
		local enabled=...
		practiceControlsEnabled=enabled~=false
		if practiceControlsEnabled then
			refreshTargets(true)
		end
		return
	end
	if action=="UpdateLiveControls" then
		refreshTargets(true)
		cachedPlan=nil
		return
	end
	if action=="Mechanics" then
		local method,ball=...
		if method=="UpdateBall" or method=="EquipFootball" then
			notePracticeBall(ball)
			refreshTargets(true)
			cachedPlan=nil
		end
		return
	end
	if action=="QBGA_Throwing" then
		local method,ball=...
		if method=="BallThrown" then
			notePracticeBall(ball)
			startBallDetection(boundPracticeEvent,heldFootball())
		end
	end
end

local function bindPracticeEvent()
	if boundPracticeEvent and boundPracticeEvent.Parent then
		return
	end
	local event=findPracticeRemote(findPracticeWorkspace())
	if not event or event==boundPracticeEvent then
		return
	end
	boundPracticeEvent=event
	connect(event.OnClientEvent,function(action,...)
		handlePracticeEvent(action,...)
	end)
end

local function ensurePreview()
	if previewFolder and previewFolder.Parent then
		return previewParts
	end
	clearPreview()
	previewFolder=Instance.new("Folder")
	previewFolder.Name="PracticeGauntletPreview"
	previewFolder.Parent=Workspace

	local function marker(name,size,color,transparency)
		local part=Instance.new("Part")
		part.Name=name
		part.Anchored=true
		part.CanCollide=false
		part.CanTouch=false
		part.CanQuery=false
		part.Size=Vector3.new(size,size,size)
		part.Material=Enum.Material.Neon
		part.Color=color
		part.Transparency=transparency
		part.Parent=previewFolder
		local attachment=Instance.new("Attachment")
		attachment.Parent=part
		return part,attachment
	end

	local origin,a0=marker("Origin",0.2,Color3.fromRGB(255,255,255),1)
	local ending,a1=marker("End",0.2,Color3.fromRGB(255,255,255),1)
	local target=marker("Target",1.1,Color3.fromRGB(0,235,255),0.2)
	local beam=Instance.new("Beam")
	beam.Name="Arc"
	beam.Attachment0=a0
	beam.Attachment1=a1
	beam.FaceCamera=false
	beam.Width0=1
	beam.Width1=1
	beam.Segments=36
	beam.Color=ColorSequence.new(Color3.fromRGB(255,255,255))
	beam.Transparency=NumberSequence.new(0.15)
	beam.Parent=previewFolder
	previewParts={origin=origin,ending=ending,target=target,beam=beam}
	return previewParts
end

local function safeUnit(v,fallback)
	if not v or v.Magnitude<1e-6 then
		return fallback or Vector3.new(1,0,0)
	end
	return v.Unit
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

local function landingAtY(origin,velocity,y)
	local a=0.5*G.Y
	local b=velocity.Y
	local c=origin.Y-y
	local disc=b*b-4*a*c
	if disc<0 then return nil,nil end
	local root=math.sqrt(disc)
	local lateLandingTime=(-b+root)/(2*a)
	local earlyLandingTime=(-b-root)/(2*a)
	local time=math.max(lateLandingTime,earlyLandingTime)
	if time<=0 then time=math.min(lateLandingTime,earlyLandingTime) end
	if time<=0 then return nil,nil end
	return origin+velocity*time+0.5*G*time*time,time
end

local function solveThrow(target)
	local origin=releaseOrigin(target.workspaceGame)
	if not origin then return nil end
	local speed=math.clamp(power,30,100)*POWER_COEFFICIENT
	local targetPos=target.part.Position
	local targetVel=targetVelocity(target.part)
	local best=nil

	for time=MIN_T,MAX_T,DT do
		local desired=targetPos+targetVel*(time+targetLead)
		local needed=(desired-origin-0.5*G*time*time)/time
		if needed.Magnitude>1e-6 then
			local speedError=math.abs(needed.Magnitude-speed)
			local missEstimate=speedError*time
			local direction=needed.Unit
			local velocity=direction*speed
			local hit=origin+velocity*time+0.5*G*time*time
			local miss=(hit-desired).Magnitude
			local score=miss+missEstimate*0.4+time*0.03
			if not best or score<best.score then
				local landing,landingTime=landingAtY(origin,velocity,0.5)
				best={
					score=score,
					origin=origin,
					target=desired,
					time=time,
					velocity=velocity,
					aimPoint=origin+direction*AIM_SCALE,
					landing=landing,
					landingTime=landingTime,
					targetPart=target.part,
					targetScore=target.score,
					speedError=speedError,
					miss=miss,
				}
			end
		end
	end
	return best
end

local function updatePreview(plan)
	if not plan then
		clearPreview()
		return
	end
	local parts=ensurePreview()
	if not parts then return end
	local previewTime=plan.time
	local curve0,curve1,c2,c3,endPoint=beamDirection(plan.velocity,plan.origin,previewTime)
	endPoint=endPoint or plan.origin+plan.velocity*previewTime+0.5*G*previewTime*previewTime
	local endVelocity=plan.velocity+G*previewTime
	parts.origin.CFrame=c2 or beamCFrame(plan.origin,plan.velocity)
	parts.ending.CFrame=c3 or beamCFrame(endPoint,endVelocity,plan.velocity)
	parts.target.CFrame=CFrame.new(plan.target)
	parts.beam.CurveSize0=math.clamp(curve0 or plan.velocity.Magnitude*previewTime/3,-400,400)
	parts.beam.CurveSize1=math.clamp(curve1 or -endVelocity.Magnitude*previewTime/3,-400,400)
end

local function fireThrow(plan)
	local event=findPracticeRemote(findPracticeWorkspace())
	if not event then
		return false,"Practice ReEvent missing"
	end
	event:FireServer("Mechanics","ThrowBall",{
		Target=plan.aimPoint,
		AutoThrow=false,
		Power=math.clamp(power,30,100),
	})
	startBallDetection(event,heldFootball())
	return true,nil
end

local function updateConfig()
	local value=tonumber(powerBox and powerBox.Text)
	if value then
		power=math.clamp(value,30,100)
		if powerBox then powerBox.Text=tostring(math.floor(power+0.5)) end
	end
	value=tonumber(leadBox and leadBox.Text)
	if value then
		targetLead=math.clamp(value,0,1)
		if leadBox then leadBox.Text=string.format("%.2f",targetLead):gsub("0+$",""):gsub("%.$","") end
	end
end

local function throwAtBestTarget()
	updateConfig()
	bindPracticeEvent()
	refreshTargets(true)
	if not currentTarget then
		setStatus("No active CanHit target",Color3.fromRGB(255,120,120))
		return
	end
	local plan=solveThrow(currentTarget)
	if not plan then
		setStatus("No throw solution",Color3.fromRGB(255,120,120))
		return
	end
	updatePreview(plan)
	cachedPlan=plan
	lastPreviewUpdate=os.clock()
	local ok,err=fireThrow(plan)
	if ok then
		setStatus(string.format("Thrown at %dpt target",plan.targetScore),Color3.fromRGB(115,240,170))
	else
		setStatus(err or "Throw failed",Color3.fromRGB(255,120,120))
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
		Size=UDim2.new(0,318,0,168),
		Active=true,
		Draggable=true,
	},screenGui)
	new("UIStroke",{Color=Color3.fromRGB(100,100,100),Thickness=1},frame)

	new("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.new(0,14,0,10),
		Size=UDim2.new(1,-48,0,20),
		Text="Practice Hitbox",
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

	hitboxButton=makeButton(body,"2x Hitbox: OFF",function()
		setHitboxEnabled(not hitboxEnabled)
		refreshTargets(true)
	end)

	hitSpamButton=makeButton(body,"Hit Window Retry: OFF",function()
		setHitSpamEnabled(not hitSpamEnabled)
		refreshTargets(true)
	end)

	statusLabel=new("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,28),
		Text="Expands active gauntlet TouchDetect hitboxes.",
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=Color3.fromRGB(190,190,190),
		TextWrapped=false,
		TextTruncate=Enum.TextTruncate.AtEnd,
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
	stopBallDetection()
	restoreHitboxes()
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
	if type(runtimeOwner)=="table" then
		rawset(runtimeOwner,RUNTIME_KEY,nil)
	end
end

buildGui()
bindPracticeEvent()

connect(RunService.RenderStepped,function()
	bindPracticeEvent()
	refreshTargets(false)
	if hitboxEnabled then
		for _,target in ipairs(activeTargets) do
			applyHitbox(target.part)
		end
	end
end)

if type(runtimeOwner)=="table" then
	rawset(runtimeOwner,RUNTIME_KEY,{Destroy=destroy})
end

refreshHitboxButton()
refreshHitSpamButton()
setStatus("Ready. Toggle testing helpers when needed.")
