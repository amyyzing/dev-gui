-- testing poles, C1 marker, and normal-arc safety colors.

local testing={}

local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local Workspace=game:GetService("Workspace")

local localPlayer=Players.LocalPlayer

local ballGravity=28
local testingCatchY=14.30
local defenderSpeed=21
local testingBallSpeed=95
local qbSafetyJobName="TestingQBCenterSafety"
local qbSafetyInterval=0
local catchMarkerHeight=80
local catchMarkerThickness=0.12
local groundMarkerDiameter=5.5
local groundMarkerThickness=0.05
local markerTransparency=0.75
local groundMarkerTransparency=0.75

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
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

local function fmtVector(v)
	return string.format("%.1f, %.1f, %.1f",v.X,v.Y,v.Z)
end

local function fmtPower(power)
	local n=tonumber(power)
	return n and string.format("P%.0f",n) or "P?"
end

local function flat(v)
	return Vector3.new(v.X,0,v.Z)
end

local function rootOfPlayer(player)
	local character=player and (Workspace:FindFirstChild(player.Name) or player.Character)
	return character and (character.PrimaryPart or character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso"))
end

local function teamOf(player)
	if not player then return nil end

	local replicated=player:FindFirstChild("Replicated")
	local teamValue=replicated and replicated:FindFirstChild("TeamID")
	local ok,value=pcall(function()
		return teamValue and teamValue.Value
	end)
	if ok and value~=nil then
		return tostring(value)
	end

	if player.Team then
		return tostring(player.Team)
	end
	if player.TeamColor then
		return tostring(player.TeamColor)
	end

	return nil
end

local function playerByName(name)
	if not name then return nil end
	for _,player in ipairs(Players:GetPlayers()) do
		if player.Name==name or player.DisplayName==name then
			return player
		end
	end
	return nil
end

local function projectileAt(origin,velocity,time)
	return origin+velocity*time+Vector3.new(0,-0.5*ballGravity*time*time,0)
end

local function cubicBezier(startPoint,firstHandle,secondHandle,endPoint,progress)
	local remaining=1-progress
	return startPoint*(remaining*remaining*remaining)+firstHandle*(3*remaining*remaining*progress)+secondHandle*(3*remaining*progress*progress)+endPoint*(progress*progress*progress)
end

local function c1FromPayload(payload)
	if type(payload)~="table" then return nil,nil end
	if typeof(payload.SpawnPos)~="Vector3" or typeof(payload.Target)~="Vector3" then return nil,nil end

	local power=tonumber(payload.Power) or 95
	local delta=payload.Target-payload.SpawnPos
	if delta.Magnitude<1e-6 or power<=0 then return nil,nil end

	local velocity=delta.Unit*power
	local a=0.5*ballGravity
	local b=-velocity.Y
	local c=testingCatchY-payload.SpawnPos.Y
	local disc=b*b-4*a*c
	if disc<0 then
		local apexTime=math.max(velocity.Y/ballGravity,0)
		if apexTime<=0 then return nil,nil end
		return projectileAt(payload.SpawnPos,velocity,apexTime),apexTime
	end

	local root=math.sqrt(disc)
	local earlyPeakTime=(-b-root)/(2*a)
	local latePeakTime=(-b+root)/(2*a)
	local time=math.max(earlyPeakTime,latePeakTime)
	if time<=0 then
		time=math.min(earlyPeakTime,latePeakTime)
	end
	if time<=0 then return nil,nil end

	return projectileAt(payload.SpawnPos,velocity,time),time
end

local function instanceName(value)
	if typeof(value)=="Instance" then
		return value.Name
	end

	return tostring(value or "?")
end

local function isLocalView(value)
	return value==localPlayer or (typeof(value)=="Instance" and value.Name==localPlayer.Name)
end

local function addEvent(list,event)
	if event and event:IsA("RemoteEvent") and not list[event] then
		list[event]=true
	end
end

local function localPlayerListed(gameFolder)
	local replicated=gameFolder and gameFolder:FindFirstChild("Replicated")
	local playersFolder=replicated and replicated:FindFirstChild("Players")
	return playersFolder and playersFolder:FindFirstChild(localPlayer.Name)~=nil
end

local function addGameFolderEvents(list,gameFolder,requireLocalPlayer)
	if not gameFolder then return end
	if requireLocalPlayer and not localPlayerListed(gameFolder) then return end

	addEvent(list,gameFolder:FindFirstChild("ReEvent"))

	local replicated=gameFolder:FindFirstChild("Replicated")
	addEvent(list,replicated and replicated:FindFirstChild("ReEvent"))
end

local function collectGameReEvents()
	local events={}

	addEvent(events,ReplicatedStorage:FindFirstChild("ReEvent"))

	for _,entry in ipairs({
		{container=ReplicatedStorage:FindFirstChild("Games"),requireLocalPlayer=false},
		{container=ReplicatedStorage:FindFirstChild("MiniGames"),requireLocalPlayer=false},
		{container=Workspace:FindFirstChild("Games"),requireLocalPlayer=true},
		{container=Workspace:FindFirstChild("MiniGames"),requireLocalPlayer=false},
	}) do
		local container=entry.container
		if container then
			for _,gameFolder in ipairs(container:GetChildren()) do
				addGameFolderEvents(events,gameFolder,entry.requireLocalPlayer)
			end
		end
	end

	local packed={}
	for event in pairs(events) do
		table.insert(packed,event)
	end
	return packed
end

local function centerHasArc(localFolder)
	local center=localFolder and localFolder:FindFirstChild("Center")
	if not center then
		return false
	end

	return center:FindFirstChild("ThrowingArc")~=nil
		or center:FindFirstChild("ThrowingArc",true)~=nil
		or center:FindFirstChild("C2",true)~=nil
		or center:FindFirstChild("C3",true)~=nil
end

local function findLocalFolderIn(container,requireArc)
	if not container then return nil end

	for _,gameFolder in ipairs(container:GetChildren()) do
		local localFolder=gameFolder:FindFirstChild("Local")
		if localFolder and (not requireArc or centerHasArc(localFolder)) then
			return localFolder
		end
	end

	return nil
end

local function findLocalFolder()
	local games=Workspace:FindFirstChild("Games")
	local miniGames=Workspace:FindFirstChild("MiniGames")
	return findLocalFolderIn(games,true)
		or findLocalFolderIn(miniGames,true)
		or findLocalFolderIn(games,false)
		or findLocalFolderIn(miniGames,false)
end

local function findCenter()
	local localFolder=findLocalFolder()
	return localFolder and localFolder:FindFirstChild("Center"),localFolder
end

function testing.new(app,parent,guiBuilder)
	local make=app.New
	local colors=app.colors
	local safeDisconnect=app.safeDisconnect
	local makeSection=app.makeSection
	local buildToggleRow=app.buildToggleRow
	local scheduler=app.schedulerApi
	local state=app.State
	local api={}
	local section=nil
	local toggle=nil
	local wrToggle=nil
	local qbToggle=nil
	local statusLabel=nil
	local marker=nil
	local groundMarker=nil
	local qbSafetyConn=nil
	local qbSafetyScheduled=false
	local remoteConnections={}
	local topologyConnections={}
	local lifetimeConnections={}
	local listeningEvents={}
	local reconnectQueued=false
	local lastThrower=nil
	local lastThrowAt=0
	local centerBeamDefaults={}

	state.testingEnabled=state.testingEnabled and true or false
	if state.testingWREnabled==nil then state.testingWREnabled=true end
	if state.testingQBEnabled==nil then state.testingQBEnabled=true end

	local function changed()
		if app.onChanged then
			pcall(app.onChanged,state)
		end
	end

	local function setStatus(text,color)
		if statusLabel then
			statusLabel.Text=text
			statusLabel.TextColor3=color or colors.muted
		end
	end

	local function syncControls()
		if toggle then
			toggle.set(state.testingEnabled)
		end
		if wrToggle then
			wrToggle.set(state.testingWREnabled~=false)
		end
		if qbToggle then
			qbToggle.set(state.testingQBEnabled~=false)
		end
	end

	local function disconnectRemoteConnections()
		for _,connection in ipairs(remoteConnections) do
			safeDisconnect(connection)
		end

		table.clear(remoteConnections)
		table.clear(listeningEvents)
	end

	local function disconnectTopologyConnections()
		for _,connection in ipairs(topologyConnections) do
			safeDisconnect(connection)
		end

		table.clear(topologyConnections)
		reconnectQueued=false
	end

	local function disconnectAll()
		disconnectRemoteConnections()
		disconnectTopologyConnections()
	end

	local function destroyMarker()
		if marker and marker.Parent then
			marker:Destroy()
		end
		if groundMarker and groundMarker.Parent then
			groundMarker:Destroy()
		end

		marker=nil
		groundMarker=nil
	end

	local function addBeamTarget(list,seen,instance)
		if not instance then return end
		if instance:IsA("Beam") and not seen[instance] then
			seen[instance]=true
			list[#list+1]=instance
		end
		for _,descendant in ipairs(instance:GetDescendants()) do
			if descendant:IsA("Beam") and not seen[descendant] then
				seen[descendant]=true
				list[#list+1]=descendant
			end
		end
	end

	local function centerArcBeams(center)
		local beams={}
		local seen={}
		addBeamTarget(beams,seen,center:FindFirstChild("ThrowingArc"))
		addBeamTarget(beams,seen,center:FindFirstChild("ThrowingArc",true))

		if #beams==0 then
			for _,descendant in ipairs(center:GetDescendants()) do
				if descendant:IsA("Beam") then
					addBeamTarget(beams,seen,descendant)
				end
			end
		end

		return beams
	end

	local function setCenterBeamUnsafe(unsafe)
		local center=findCenter()
		if not center then return end

		for _,beam in ipairs(centerArcBeams(center)) do
			if not centerBeamDefaults[beam] then
				centerBeamDefaults[beam]=beam.Color
			end
			beam.Color=unsafe and ColorSequence.new(colors.red or Color3.fromRGB(254,94,86)) or centerBeamDefaults[beam]
		end
	end

	local function restoreCenterBeams()
		for beam,color in pairs(centerBeamDefaults) do
			if beam and beam.Parent then
				beam.Color=color
			end
		end
		table.clear(centerBeamDefaults)
	end

	local function disconnectQBSafety()
		if qbSafetyScheduled and scheduler and type(scheduler.Unregister)=="function" then
			pcall(scheduler.Unregister,"RenderStepped",qbSafetyJobName)
			pcall(scheduler.Unregister,"Heartbeat",qbSafetyJobName)
		end
		qbSafetyScheduled=false
		safeDisconnect(qbSafetyConn)
		qbSafetyConn=nil
		restoreCenterBeams()
	end

	local function c1IsDefended(c1Position,flightTime,throwerOverride)
		if not(c1Position and flightTime and flightTime>0) then
			return false
		end

		local thrower=throwerOverride or playerByName(lastThrower)
		local throwerTeam=teamOf(thrower)
		if not throwerTeam then
			throwerTeam=teamOf(localPlayer)
		end

		local reach=defenderSpeed*flightTime
		for _,player in ipairs(Players:GetPlayers()) do
			local playerTeam=teamOf(player)
			local isDefender=player~=thrower and player~=localPlayer and (not throwerTeam or playerTeam~=throwerTeam)
			if isDefender then
				local defenderRoot=rootOfPlayer(player)
				if defenderRoot and (flat(defenderRoot.Position)-flat(c1Position)).Magnitude<=reach then
					return true
				end
			end
		end

		return false
	end

	local function beamC1Position(beam)
		if not(beam and beam:IsA("Beam") and beam.Attachment0 and beam.Attachment1) then
			return nil,nil
		end

		local c2Frame=attachmentCFrame(beam.Attachment0)
		local c3Frame=attachmentCFrame(beam.Attachment1)
		if not(c2Frame and c3Frame) then
			return nil,nil
		end

		local arcStart=c2Frame.Position
		local arcEnd=c3Frame.Position
		local firstHandle=arcStart+c2Frame.RightVector*beam.CurveSize0
		local secondHandle=arcEnd-c3Frame.RightVector*beam.CurveSize1
		local bestPoint=nil
		local bestProgress=0
		local bestDiff=math.huge
		local crossingPoint=nil
		local crossingProgress=nil
		local previousPoint=arcStart
		local previousProgress=0
		local previousY=previousPoint.Y-testingCatchY

		for i=1,96 do
			local progress=i/96
			local point=cubicBezier(arcStart,firstHandle,secondHandle,arcEnd,progress)
			local y=point.Y-testingCatchY
			local diff=math.abs(y)
			if diff<bestDiff then
				bestDiff=diff
				bestPoint=point
				bestProgress=progress
			end

			if previousY==0 or y==0 or (previousY<0 and y>0) or (previousY>0 and y<0) then
				local denom=math.abs(previousY)+math.abs(y)
				local alpha=denom>1e-6 and math.abs(previousY)/denom or 0
				crossingProgress=previousProgress+(progress-previousProgress)*alpha
				crossingPoint=previousPoint:Lerp(point,alpha)
			end

			previousPoint=point
			previousProgress=progress
			previousY=y
		end

		local c1Point=crossingPoint or bestPoint
		local c1Progress=crossingProgress or bestProgress
		if not c1Point then
			return nil,nil
		end

		c1Point=Vector3.new(c1Point.X,testingCatchY,c1Point.Z)
		local flatDistance=(flat(c1Point)-flat(arcStart)).Magnitude
		local distanceTime=flatDistance/testingBallSpeed
		local heightDelta=math.max(c1Point.Y-arcStart.Y,0)
		local verticalTime=heightDelta>0 and math.sqrt((2*heightDelta)/ballGravity) or 0
		local estimatedTime=math.max(distanceTime,verticalTime,c1Progress*distanceTime)
		return c1Point,estimatedTime
	end

	local function currentCenterC1AndTime()
		local center=findCenter()
		if not center then
			return nil,nil
		end

		for _,beam in ipairs(centerArcBeams(center)) do
			local point,time=beamC1Position(beam)
			if point and time and time>0 then
				return point,time
			end
		end

		local c1=center:FindFirstChild("C1",true)
		local c2=center:FindFirstChild("C2",true)
		local c1Frame=c1 and attachmentCFrame(c1)
		local c2Frame=c2 and attachmentCFrame(c2)
		if not(c1Frame and c2Frame) then
			return nil,nil
		end

		local c1Position=Vector3.new(c1Frame.Position.X,testingCatchY,c1Frame.Position.Z)
		local flatDistance=(flat(c1Position)-flat(c2Frame.Position)).Magnitude
		local heightDelta=math.max(c1Position.Y-c2Frame.Position.Y,0)
		local distanceTime=flatDistance/testingBallSpeed
		local verticalTime=heightDelta>0 and math.sqrt((2*heightDelta)/ballGravity) or 0
		return c1Position,math.max(distanceTime,verticalTime)
	end

	local function updateQBCenterSafety()
		if not(state.testingEnabled and state.testingQBEnabled~=false) then
			disconnectQBSafety()
			return
		end

		local c1Position,flightTime=currentCenterC1AndTime()
		if not(c1Position and flightTime and flightTime>0) then
			restoreCenterBeams()
			return
		end

		setCenterBeamUnsafe(c1IsDefended(c1Position,flightTime,localPlayer))
	end

	local function syncQBSafety()
		if not(state.testingEnabled and state.testingQBEnabled~=false) then
			disconnectQBSafety()
			return
		end

		if qbSafetyConn then return end
		if qbSafetyScheduled then return end

		if scheduler and type(scheduler.Register)=="function" then
			local ok,result=pcall(scheduler.Register,"RenderStepped",qbSafetyJobName,qbSafetyInterval,function()
				updateQBCenterSafety()
			end)
			if ok and result then
				qbSafetyScheduled=true
				updateQBCenterSafety()
				return
			end
		end

		qbSafetyConn=RunService.RenderStepped:Connect(function()
			updateQBCenterSafety()
		end)
	end

	local function styleMarker(part)
		part.Shape=Enum.PartType.Block
		part.Size=Vector3.new(catchMarkerThickness,catchMarkerHeight,catchMarkerThickness)
		part.Anchored=true
		part.CanCollide=false
		part.CanTouch=false
		part.CanQuery=false
		part.Material=Enum.Material.SmoothPlastic
		part.Color=Color3.fromRGB(0,0,0)
		part.Transparency=markerTransparency
	end

	local function styleGroundMarker(part)
		part.Shape=Enum.PartType.Cylinder
		part.Size=Vector3.new(groundMarkerThickness,groundMarkerDiameter,groundMarkerDiameter)
		part.Anchored=true
		part.CanCollide=false
		part.CanTouch=false
		part.CanQuery=false
		part.Material=Enum.Material.SmoothPlastic
		part.Color=Color3.fromRGB(0,0,0)
		part.Transparency=groundMarkerTransparency
	end

	local function groundYAt(position)
		local params=RaycastParams.new()
		params.FilterType=Enum.RaycastFilterType.Exclude
		params.FilterDescendantsInstances={marker,groundMarker}

		local result=Workspace:Raycast(position+Vector3.new(0,10,0),Vector3.new(0,-300,0),params)
		if result then
			return result.Position.Y+groundMarkerThickness*0.5+0.01
		end

		return groundMarkerThickness*0.5+0.01
	end

	local function ensureMarker(parentFolder)
		if marker and marker.Parent then
			styleMarker(marker)
			return marker
		end

		local parent=parentFolder or Workspace
		local existing=parent:FindFirstChild("TestingC1Marker")
		marker=(existing and existing:IsA("BasePart")) and existing or Instance.new("Part")
		marker.Name="TestingC1Marker"
		styleMarker(marker)
		marker.Parent=parent

		local billboard=marker:FindFirstChild("TestingC1Label")
		if not(billboard and billboard:IsA("BillboardGui")) then
			billboard=Instance.new("BillboardGui")
			billboard.Name="TestingC1Label"
			billboard.Parent=marker
		end
		billboard.Name="TestingC1Label"
		billboard.Size=UDim2.new(0,64,0,20)
		billboard.StudsOffset=Vector3.new(0,1.6,0)
		billboard.AlwaysOnTop=true
		billboard.Adornee=marker

		local label=billboard:FindFirstChild("Text")
		if not(label and label:IsA("TextLabel")) then
			label=Instance.new("TextLabel")
			label.Name="Text"
			label.Parent=billboard
		end
		label.BackgroundTransparency=1
		label.Size=UDim2.fromScale(1,1)
		label.Text="C1"
		label.Font=Enum.Font.GothamBold
		label.TextSize=12
		label.TextColor3=colors.text or Color3.new(1,1,1)
		label.TextStrokeTransparency=0.35

		return marker
	end

	local function ensureGroundMarker(parentFolder)
		if groundMarker and groundMarker.Parent then
			styleGroundMarker(groundMarker)
			return groundMarker
		end

		local parent=parentFolder or Workspace
		local existing=parent:FindFirstChild("TestingC1GroundMarker")
		groundMarker=(existing and existing:IsA("BasePart")) and existing or Instance.new("Part")
		groundMarker.Name="TestingC1GroundMarker"
		styleGroundMarker(groundMarker)
		groundMarker.Parent=parent
		return groundMarker
	end

	local function captureC1(source,payload)
		if not(state.testingEnabled and state.testingWREnabled~=false) then return end

		local center,folder=findCenter()
		local c1=center and center:FindFirstChild("C1",true)
		local cframe=c1 and attachmentCFrame(c1)
		local pos=cframe and cframe.Position
		local payloadPos,payloadFlightTime=c1FromPayload(payload)
		local fromPayload=false
		local flightTime=payloadFlightTime
		if not pos then
			pos=payloadPos
			fromPayload=pos~=nil
		end
		if not pos then
			setStatus("no c1: "..source,colors.red)
			return
		end

		pos=Vector3.new(pos.X,testingCatchY,pos.Z)
		ensureMarker(folder).CFrame=CFrame.new(pos)
		ensureGroundMarker(folder).CFrame=CFrame.new(pos.X,groundYAt(pos),pos.Z)*CFrame.Angles(0,0,math.rad(90))
		local powerText=payload and (" "..fmtPower(payload.Power)) or ""
		local timeText=flightTime and string.format(" %.2fs",flightTime) or ""
		local unsafe=c1IsDefended(pos,flightTime)
		local safetyText=unsafe and " unsafe" or " safe"
		local label=(lastThrower and (lastThrower.." ") or "")..(fromPayload and "C1 calc" or "C1")..safetyText..powerText..timeText..": "..fmtVector(pos)
		setStatus(label,unsafe and (colors.red or Color3.fromRGB(254,94,86)) or (colors.green or colors.text))
	end

	local function captureSoon(source,payload)
		task.defer(captureC1,source,payload)
		task.delay(0.016,captureC1,source,payload)
		task.delay(0.033,captureC1,source,payload)
		task.delay(0.08,captureC1,source,payload)
		task.delay(0.15,captureC1,source,payload)
	end

	local function updateFootballPayload(args,startIndex)
		for i=startIndex or 2,#args do
			local value=args[i]
			if type(value)=="table" and (value.Power~=nil or value.Target~=nil or value.SpawnPos~=nil) then
				return value
			end
		end

		return nil
	end

	local function handleIncoming(...)
		if not(state.testingEnabled and state.testingWREnabled~=false) then return end

		local args={...}
		local topic=args[1]

		if topic=="AddEvent" and type(args[2])=="table" and args[2].Name=="Throw" then
			local view=args[2].View
			if not isLocalView(view) then
				lastThrower=instanceName(view)
				lastThrowAt=os.clock()
				setStatus("throw: "..lastThrower,colors.muted)
				captureSoon("throw")
			end
			return
		end

		if topic=="Mechanics" and (args[2]=="UpdateBall" or args[2]=="UpdateFootball") then
			local payload=updateFootballPayload(args,3)
			local powerText=payload and (" "..fmtPower(payload.Power)) or ""
			setStatus("ball"..powerText,colors.muted)
			captureSoon("update ball",payload)
			return
		end

		if topic=="UpdateFootball" then
			local payload=updateFootballPayload(args,2)
			lastThrowAt=os.clock()
			setStatus("football"..(payload and (" "..fmtPower(payload.Power)) or ""),colors.muted)
			captureSoon("update football",payload)
		end
	end

	local connectIncoming

	local function scheduleReconnect()
		if reconnectQueued or not(state.testingEnabled and state.testingWREnabled~=false) then return end
		reconnectQueued=true

		task.defer(function()
			reconnectQueued=false
			if state.testingEnabled and state.testingWREnabled~=false and connectIncoming then
				connectIncoming()
			end
		end)
	end

	local function watchConnection(connection)
		table.insert(topologyConnections,connection)
	end

	local function shouldReconnectForInstance(instance)
		if not instance then return false end
		local name=instance.Name
		return name=="Games"
			or name=="MiniGames"
			or name=="ReEvent"
			or name=="Replicated"
			or name=="Players"
			or name==localPlayer.Name
	end

	local function watchRoot(root)
		if not root then return end

		watchConnection(root.ChildAdded:Connect(function(child)
			if shouldReconnectForInstance(child) then
				scheduleReconnect()
			end
		end))

		watchConnection(root.ChildRemoved:Connect(function(child)
			if shouldReconnectForInstance(child) then
				scheduleReconnect()
			end
		end))
	end

	local function watchContainer(container)
		if not container then return end

		watchConnection(container.ChildAdded:Connect(function()
			scheduleReconnect()
		end))

		watchConnection(container.ChildRemoved:Connect(function()
			scheduleReconnect()
		end))

		watchConnection(container.DescendantAdded:Connect(function(descendant)
			if shouldReconnectForInstance(descendant) then
				scheduleReconnect()
			end
		end))

		watchConnection(container.DescendantRemoving:Connect(function(descendant)
			if shouldReconnectForInstance(descendant) then
				scheduleReconnect()
			end
		end))
	end

	local function watchRemoteTopology()
		disconnectTopologyConnections()
		watchRoot(ReplicatedStorage)
		watchRoot(Workspace)
		watchContainer(ReplicatedStorage:FindFirstChild("Games"))
		watchContainer(ReplicatedStorage:FindFirstChild("MiniGames"))
		watchContainer(Workspace:FindFirstChild("Games"))
		watchContainer(Workspace:FindFirstChild("MiniGames"))
	end

	connectIncoming=function()
		disconnectRemoteConnections()
		if not(state.testingEnabled and state.testingWREnabled~=false) then
			return
		end
		watchRemoteTopology()

		for _,event in ipairs(collectGameReEvents()) do
			if not listeningEvents[event] then
				listeningEvents[event]=true
				table.insert(remoteConnections,event.OnClientEvent:Connect(handleIncoming))
			end
		end

		setStatus(#remoteConnections>0 and (#remoteConnections.." events") or "no reevent",#remoteConnections>0 and colors.muted or colors.red)
	end

	function api.SetTestingState(value,fire)
		state.testingEnabled=value and true or false
		if state.testingEnabled then
			connectIncoming()
			syncQBSafety()
		else
			disconnectAll()
			disconnectQBSafety()
			destroyMarker()
			lastThrower=nil
			lastThrowAt=0
			setStatus("off",colors.muted)
		end

		syncControls()
		if fire~=false then
			changed()
		end
	end

	function api.SetTestingWRState(value,fire)
		state.testingWREnabled=value and true or false
		if state.testingEnabled and state.testingWREnabled then
			connectIncoming()
		else
			disconnectAll()
			destroyMarker()
			lastThrower=nil
			lastThrowAt=0
		end

		syncControls()
		if fire~=false then
			changed()
		end
	end

	function api.SetTestingQBState(value,fire)
		state.testingQBEnabled=value and true or false
		if state.testingEnabled and state.testingQBEnabled then
			syncQBSafety()
			updateQBCenterSafety()
		else
			disconnectQBSafety()
		end

		syncControls()
		if fire~=false then
			changed()
		end
	end

	function api.Refresh()
		syncControls()
		if state.testingEnabled then
			connectIncoming()
			syncQBSafety()
		else
			disconnectQBSafety()
			setStatus("off",colors.muted)
		end
	end

	function api.Reset()
		api.SetTestingState(false,true)
	end

	function api.Destroy()
		disconnectAll()
		disconnectQBSafety()
		for _,connection in ipairs(lifetimeConnections) do
			safeDisconnect(connection)
		end
		table.clear(lifetimeConnections)
		destroyControl(toggle)
		destroyControl(wrToggle)
		destroyControl(qbToggle)
		destroyMarker()
	end

	local builtGui=nil
	if guiBuilder and type(guiBuilder.build)=="function" then
		local ok,result=pcall(guiBuilder.build,app,parent,state,api)
		if ok and type(result)=="table" then
			builtGui=result
		else
			warn("testing gui failed:",result)
		end
	end

	if builtGui then
		section=builtGui.body or builtGui.section
		toggle=builtGui.toggle
		wrToggle=builtGui.wrToggle
		qbToggle=builtGui.qbToggle
	else
		local sectionControls=nil
		section,sectionControls=makeSection(parent,5,"Testing","WR C1 and QB arc safety",{
			headerToggle={
				startState=state.testingEnabled,
				onChange=function(value)
					api.SetTestingState(value,true)
				end,
			},
		})

		toggle=sectionControls and sectionControls.toggle
		if not toggle then
			toggle=buildToggleRow(section,"Testing",state.testingEnabled,function(value)
				api.SetTestingState(value,true)
			end)
		end

		wrToggle=buildToggleRow(section,"WR",state.testingWREnabled~=false,function(value)
			api.SetTestingWRState(value,true)
		end)
		qbToggle=buildToggleRow(section,"QB",state.testingQBEnabled~=false,function(value)
			api.SetTestingQBState(value,true)
		end)
	end

	local ancestryConn=section.AncestryChanged:Connect(function()
		if not section.Parent then
			api.Destroy()
		end
	end)
	table.insert(lifetimeConnections,ancestryConn)

	api.Refresh()

	return api
end

return testing
