local testing={}

local players=game:GetService("Players")
local runService=game:GetService("RunService")
local replicatedStorage=game:GetService("ReplicatedStorage")
local workspace=game:GetService("Workspace")

local localPlayer=players.LocalPlayer
local qbInterception=rawget(getfenv(),"QBInterceptionModule")

local ballGravity=28
local testingCatchY=14.30
local qbSafetyJobName="TestingQBCenterSafety"
local qbSafetyInterval=0.06
local USE_LEGACY_VISUAL_ARC_FALLBACK=false
local SAFETY={
	staleArcMaxAge=0.12,
}
local WHITE_ARC=ColorSequence.new(Color3.new(1,1,1))
local RED_ARC=ColorSequence.new(Color3.fromRGB(255,70,70))
local catchMarkerHeight=80
local catchMarkerThickness=0.12
local groundMarkerDiameter=5.5
local groundMarkerThickness=0.05
local markerTransparency=0.75
local groundMarkerTransparency=0.75
local CurrentThrowArcState=nil
local throwArcGeneration=0

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

local function fmtMaybeVector(v)
	return typeof(v)=="Vector3" and fmtVector(v) or "nil"
end

local function instancePath(instance)
	if typeof(instance)~="Instance" then
		return "nil"
	end

	local ok,path=pcall(function()
		return instance:GetFullName()
	end)
	return ok and path or instance.Name
end

local function fmtPower(power)
	local n=tonumber(power)
	return n and string.format("P%.0f",n) or "P?"
end

local function flat(v)
	return Vector3.new(v.X,0,v.Z)
end

local function customTeamOf(player)
	if not player then return nil end

	local replicated=player:FindFirstChild("Replicated")
	local teamValue=replicated and replicated:FindFirstChild("TeamID")
	local ok,value=pcall(function()
		return teamValue and teamValue.Value
	end)
	if ok and value~=nil then
		return tostring(value)
	end

	return nil
end

local function gameIDOf(player)
	local replicated=player and player:FindFirstChild("Replicated")
	local value=replicated and replicated:FindFirstChild("GameID")
	local ok,result=pcall(function()
		return value and value.Value
	end)
	if not ok or result==nil or tostring(result)=="" then return nil end
	return tostring(result)
end

local function isCurrentSessionPlayer(player)
	local gameID=gameIDOf(localPlayer)
	return gameID~=nil and gameIDOf(player)==gameID
end

local function sameTeam(a,b)
	if not(a and b) then
		return nil
	end

	local customA=customTeamOf(a)
	local customB=customTeamOf(b)
	if customA~=nil and customB~=nil then
		return customA==customB
	end

	if a.Team~=nil and b.Team~=nil then
		if a.Neutral or b.Neutral then
			return nil
		end

		return a.Team==b.Team
	end

	if not a.Neutral and not b.Neutral then
		return a.TeamColor==b.TeamColor
	end

	return nil
end

local function isOpponentOfThrower(player,thrower)
	if not(player and thrower) or player==thrower then
		return false
	end

	local result=sameTeam(player,thrower)
	if result==nil then
		return false
	end

	return result==false
end

local function legacyProjectileAt(origin,velocity,time)
	return origin+velocity*time+Vector3.new(0,-0.5*ballGravity*time*time,0)
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
		return legacyProjectileAt(payload.SpawnPos,velocity,apexTime),apexTime
	end

	local root=math.sqrt(disc)
	local earlyPeakTime=(-b-root)/(2*a)
	local latePeakTime=(-b+root)/(2*a)
	local time=math.max(earlyPeakTime,latePeakTime)
	if time<=0 then
		time=math.min(earlyPeakTime,latePeakTime)
	end
	if time<=0 then return nil,nil end

	return legacyProjectileAt(payload.SpawnPos,velocity,time),time
end

local function normalizeArcGravity(gravity)
	if typeof(gravity)=="Vector3" then
		return gravity
	end
	if type(gravity)=="number" then
		return Vector3.new(0,-math.abs(gravity),0)
	end
	return Vector3.new(0,-ballGravity,0)
end

local function publishThrowArcState(beam,C2,C1,C3,velocity,gravity,flightTime,power)
	if typeof(C2)~="Vector3" or typeof(velocity)~="Vector3" then
		CurrentThrowArcState=nil
		return nil
	end

	gravity=normalizeArcGravity(gravity)
	if type(flightTime)~="number" or flightTime<=0 then
		CurrentThrowArcState=nil
		return nil
	end

	local flatVelocity=flat(velocity)
	if flatVelocity.Magnitude<=1e-6 then
		CurrentThrowArcState=nil
		return nil
	end

	throwArcGeneration+=1
	CurrentThrowArcState={
		beam=beam,
		C2=C2,
		C1=typeof(C1)=="Vector3" and C1 or nil,
		C3=typeof(C3)=="Vector3" and C3 or nil,
		power=power,
		origin=C2,
		velocity=velocity,
		gravity=gravity,
		flightTime=flightTime,
		forward=flatVelocity.Unit,
		updatedAt=os.clock(),
		generation=throwArcGeneration,
		source="original_throwing_arc",
	}

	return CurrentThrowArcState
end

testing.PublishThrowArcState=publishThrowArcState

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

	addEvent(events,replicatedStorage:FindFirstChild("ReEvent"))
	local gameID=gameIDOf(localPlayer)

	for _,container in ipairs({
		replicatedStorage:FindFirstChild("Games"),
		replicatedStorage:FindFirstChild("MiniGames"),
		workspace:FindFirstChild("Games"),
		workspace:FindFirstChild("MiniGames"),
	}) do
		if container then
			local gameFolder=gameID and container:FindFirstChild(gameID) or nil
			if not gameFolder and #container:GetChildren()==1 then
				gameFolder=container:GetChildren()[1]
			end
			addGameFolderEvents(events,gameFolder,false)
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
	local gameID=gameIDOf(localPlayer)
	local games=workspace:FindFirstChild("Games")
	local miniGames=workspace:FindFirstChild("MiniGames")
	if gameID then
		local gameFolder=(games and games:FindFirstChild(gameID)) or (miniGames and miniGames:FindFirstChild(gameID))
		local localFolder=gameFolder and gameFolder:FindFirstChild("Local")
		if localFolder then return localFolder end
	end

	return findLocalFolderIn(games,true)
		or findLocalFolderIn(miniGames,true)
		or (games and #games:GetChildren()==1 and findLocalFolderIn(games,false))
		or (miniGames and #miniGames:GetChildren()==1 and findLocalFolderIn(miniGames,false))
end

local function findCenter()
	local localFolder=findLocalFolder()
	return localFolder and localFolder:FindFirstChild("Center"),localFolder
end

local function readVisualThrowArcState()
	local center=findCenter()
	local beam=center and center:FindFirstChild("ThrowingArc",true)
	if not(beam and beam:IsA("Beam") and beam.Enabled) then return nil end

	local attachment0=beam.Attachment0 or center:FindFirstChild("C2",true)
	local attachment1=beam.Attachment1 or center:FindFirstChild("C3",true)
	local cframe0=attachmentCFrame(attachment0)
	local cframe1=attachmentCFrame(attachment1)
	if not(cframe0 and cframe1) then return nil end

	local p0=cframe0.Position
	local p1=p0+cframe0.RightVector*beam.CurveSize0
	local p3=cframe1.Position
	local p2=p3-cframe1.RightVector*beam.CurveSize1
	local gravity=Vector3.new(0,-ballGravity,0)
	local acceleration=3*((p3-p2)-(p1-p0))
	local timeSquared=acceleration.Y/gravity.Y
	if timeSquared<=1e-6 then return nil end

	local flightTime=math.sqrt(timeSquared)
	local velocity=3*(p1-p0)/flightTime
	local calculatedEnd=p0+velocity*flightTime+0.5*gravity*flightTime*flightTime
	if (calculatedEnd-p3).Magnitude>0.2 then return nil end
	local c1Attachment=center:FindFirstChild("C1",true)
	local c1CFrame=attachmentCFrame(c1Attachment)

	return publishThrowArcState(
		beam,
		p0,
		c1CFrame and c1CFrame.Position or nil,
		p3,
		velocity,
		gravity,
		flightTime,
		velocity.Magnitude
	)
end

function testing.new(app,parent,guiBuilder)
	local colors=app.colors
	local safeDisconnect=app.safeDisconnect
	local makeSection=app.makeSection
	local buildToggleRow=app.buildToggleRow
	local scheduler=app.schedulerApi
	local interceptionCore=app.QBInterceptionModule or qbInterception
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
	local destroyed=false
	local captureToken=0
	local lastThrower=nil
	local centerBeamDefaults={}

	if not interceptionCore then
		error("qb interception missing")
	end

	state.testingEnabled=state.testingEnabled and true or false
	if state.testingWREnabled==nil then state.testingWREnabled=true end
	if state.testingQBEnabled==nil then state.testingQBEnabled=true end
	if state.testingQBDebug==nil then state.testingQBDebug=false end

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

	local function setThrowingArcUnsafe(arc,unsafe,info)
		local beam=arc and arc.beam
		if not(beam and beam.Parent) then
			return
		end

		if not centerBeamDefaults[beam] then
			centerBeamDefaults[beam]=beam.Color
		end

		if unsafe then
			beam.Color=interceptionCore.BuildColorSequence(
				centerBeamDefaults[beam] or WHITE_ARC,
				RED_ARC,
				info and info.windows or nil,
				arc.flightTime,
				true
			)
		else
			beam.Color=centerBeamDefaults[beam] or WHITE_ARC
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

	local function debugQB(reason,details)
		if not state.testingQBDebug then
			return
		end

		local parts={"[TestingQB]",reason}
		if details then
			for key,value in pairs(details) do
				parts[#parts+1]=tostring(key).."="..tostring(value)
			end
		end

		warn(table.concat(parts," "))
	end

	local function getJumpPeakHeight(humanoid)
		if not humanoid then
			return 7.2
		end

		if humanoid.UseJumpPower then
			local g=workspace.Gravity
			if g<=0 then
				return 7.2
			end

			return (humanoid.JumpPower*humanoid.JumpPower)/(2*g)
		end

		return humanoid.JumpHeight
	end

	local function getTackleBox(player)
		local replicated=player and player:FindFirstChild("Replicated")
		local tackleBoxValue=replicated and replicated:FindFirstChild("TackleBox")
		if not tackleBoxValue then return nil end

		local ok,value=pcall(function()
			return tackleBoxValue.Value
		end)
		if ok and typeof(value)=="Instance" and value.Parent then
			if value:IsA("BasePart") then return value end
			for _,name in ipairs({"CatchBox","PlayerCollisionBox"}) do
				local part=value:FindFirstChild(name,true)
				if part and part:IsA("BasePart") then return part end
			end
		end
		return nil
	end

	local function defenderDescriptor(player)
		local character=player and player.Character
		local humanoid=character and character:FindFirstChildOfClass("Humanoid")
		local root=character and character:FindFirstChild("HumanoidRootPart")
		if not(root and humanoid) or humanoid.Health<=0 then return nil end

		local tackleBox=getTackleBox(player)
		local jumpHeight=getJumpPeakHeight(humanoid)
		local gravity=math.max(workspace.Gravity,1e-3)
		local jumpRiseTime=humanoid.UseJumpPower
			and math.max(0,humanoid.JumpPower)/gravity
			or math.sqrt(2*math.max(0,jumpHeight)/gravity)
		local speed=math.max(21,humanoid.WalkSpeed)
		local velocity=flat(root.AssemblyLinearVelocity or Vector3.zero)
		if velocity.Magnitude>speed then
			velocity=velocity.Unit*speed
		end
		return{
			player=player,
			position=(tackleBox and tackleBox.Position) or root.Position,
			velocity=velocity,
			boxSize=(tackleBox and tackleBox.Size) or root.Size,
			speed=speed,
			jumpHeight=jumpHeight,
			jumpRiseTime=jumpRiseTime,
		}
	end

	local function isArcStateFresh(arc)
		return arc and arc.updatedAt and os.clock()-arc.updatedAt<=SAFETY.staleArcMaxAge
	end

	local function validateC3Direction(arc)
		if typeof(arc.C3)~="Vector3" or typeof(arc.C2)~="Vector3" then
			return nil
		end

		local c3Dir=flat(arc.C3-arc.C2)
		local vDir=flat(arc.velocity)
		if c3Dir.Magnitude<=1e-6 or vDir.Magnitude<=1e-6 then
			return false
		end

		return c3Dir.Unit:Dot(vDir.Unit)>0.98
	end

	local function isArcUnsafe(arc,thrower)
		if not isArcStateFresh(arc) then
			return false,{reason="stale_or_missing_arc"}
		end
		if not(arc.origin and arc.velocity and arc.gravity and arc.flightTime) then
			return false,{reason="invalid_arc_fields"}
		end
		if arc.flightTime<=0 then
			return false,{reason="invalid_flight_time"}
		end

		local flatVelocity=flat(arc.velocity)
		if flatVelocity.Magnitude<=1e-6 then
			return false,{reason="no_forward_velocity"}
		end
		arc.forward=arc.forward or flatVelocity.Unit

		local c3Valid=validateC3Direction(arc)
		if c3Valid==false then
			debugQB("c3_mismatch",{
				generation=arc.generation,
				source=arc.source,
			})
		end

		local defenders={}
		for _,player in ipairs(players:GetPlayers()) do
			if player~=thrower and isCurrentSessionPlayer(player) then
				local teamResult=sameTeam(player,thrower)
				local opponent=isOpponentOfThrower(player,thrower)
				debugQB("consider_player",{
					player=player.Name,
					team=tostring(teamResult),
					opponent=opponent,
				})

				if opponent then
					local defender=defenderDescriptor(player)
					if defender then
						defenders[#defenders+1]=defender
					end
				end
			end
		end

		return interceptionCore.Evaluate(arc,defenders)
	end

	local function updateQBCenterSafety()
		if not(state.testingEnabled and state.testingQBEnabled~=false) then
			disconnectQBSafety()
			return
		end

		local arc=readVisualThrowArcState() or CurrentThrowArcState
		local unsafe,info=isArcUnsafe(arc,localPlayer)
		if not isArcStateFresh(arc) then
			if USE_LEGACY_VISUAL_ARC_FALLBACK then
				debugQB("legacy_visual_arc_fallback_disabled")
			end
			restoreCenterBeams()
			debugQB("no_fresh_projectile_source",{
				reason=info and info.reason or "missing",
				generation=arc and arc.generation or "nil",
				age=arc and arc.updatedAt and string.format("%.4f",os.clock()-arc.updatedAt) or "nil",
				source=arc and arc.source or "nil",
			})
			return
		end

		if not(arc and arc.beam and arc.beam.Parent) then
			restoreCenterBeams()
			debugQB("missing_beam",{
				generation=arc and arc.generation or "nil",
			})
			return
		end

		setThrowingArcUnsafe(arc,unsafe,info)
		debugQB("arc_decision",{
			unsafe=unsafe,
			reason=info and info.reason or "intercept",
			generation=arc.generation,
			age=string.format("%.4f",os.clock()-arc.updatedAt),
			source=arc.source,
			beam=instancePath(arc.beam),
			C2=fmtMaybeVector(arc.C2),
			C1=fmtMaybeVector(arc.C1),
			C3=fmtMaybeVector(arc.C3),
			velocity=fmtMaybeVector(arc.velocity),
			gravity=fmtMaybeVector(arc.gravity),
			flightTime=arc.flightTime,
			power=arc.power or "nil",
			interceptor=info and info.player and info.player.Name or "none",
			interceptTime=info and info.time or "nil",
			interceptPoint=info and fmtMaybeVector(info.point) or "nil",
			yMin=info and info.yMin or "nil",
			yMax=info and info.yMax or "nil",
			distance=info and info.distance or "nil",
			reachableRadius=info and info.reachableRadius or "nil",
			windowCount=info and info.windows and #info.windows or 0,
		})
	end

	local function syncQBSafety()
		if destroyed or not(state.testingEnabled and state.testingQBEnabled~=false) then
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

		qbSafetyConn=runService.RenderStepped:Connect(function()
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

		local result=workspace:Raycast(position+Vector3.new(0,10,0),Vector3.new(0,-300,0),params)
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

		local parent=parentFolder or workspace
		local existing=parent:FindFirstChild("DevGuiTestingC1Marker")
		marker=(existing and existing:IsA("BasePart")) and existing or Instance.new("Part")
		marker.Name="DevGuiTestingC1Marker"
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

		local parent=parentFolder or workspace
		local existing=parent:FindFirstChild("DevGuiTestingC1GroundMarker")
		groundMarker=(existing and existing:IsA("BasePart")) and existing or Instance.new("Part")
		groundMarker.Name="DevGuiTestingC1GroundMarker"
		styleGroundMarker(groundMarker)
		groundMarker.Parent=parent
		return groundMarker
	end

	local function captureC1(source,payload)
		if destroyed or not(state.testingEnabled and state.testingWREnabled~=false) then return end

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

		ensureMarker(folder).CFrame=CFrame.new(pos)
		ensureGroundMarker(folder).CFrame=CFrame.new(pos.X,groundYAt(pos),pos.Z)*CFrame.Angles(0,0,math.rad(90))
		local powerText=payload and (" "..fmtPower(payload.Power)) or ""
		local timeText=flightTime and string.format(" %.2fs",flightTime) or ""
		local arcUnsafe,arcInfo=isArcUnsafe(CurrentThrowArcState,localPlayer)
		local safetyText=isArcStateFresh(CurrentThrowArcState) and (arcUnsafe and " unsafe" or " safe") or " no arc"
		local label=(lastThrower and (lastThrower.." ") or "")..(fromPayload and "C1 calc" or "C1")..safetyText..powerText..timeText..": "..fmtVector(pos)
		setStatus(label,arcUnsafe and (colors.red or Color3.fromRGB(254,94,86)) or (arcInfo and arcInfo.reason=="stale_or_missing_arc" and colors.muted or (colors.green or colors.text)))
	end

	local function captureSoon(source,payload)
		captureToken=captureToken+1
		local token=captureToken
		local function captureCurrent()
			if not destroyed and token==captureToken then
				captureC1(source,payload)
			end
		end

		task.defer(captureCurrent)
		task.delay(0.016,captureCurrent)
		task.delay(0.033,captureCurrent)
		task.delay(0.08,captureCurrent)
		task.delay(0.15,captureCurrent)
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
			setStatus("football"..(payload and (" "..fmtPower(payload.Power)) or ""),colors.muted)
			captureSoon("update football",payload)
		end
	end

	local connectIncoming

	local function scheduleReconnect()
		if destroyed or reconnectQueued or not(state.testingEnabled and state.testingWREnabled~=false) then return end
		reconnectQueued=true

		task.defer(function()
			reconnectQueued=false
			if not destroyed and state.testingEnabled and state.testingWREnabled~=false and connectIncoming then
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
		watchRoot(replicatedStorage)
		watchRoot(workspace)
		watchContainer(replicatedStorage:FindFirstChild("Games"))
		watchContainer(replicatedStorage:FindFirstChild("MiniGames"))
		watchContainer(workspace:FindFirstChild("Games"))
		watchContainer(workspace:FindFirstChild("MiniGames"))
	end

	connectIncoming=function()
		disconnectRemoteConnections()
		if destroyed or not(state.testingEnabled and state.testingWREnabled~=false) then
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
			CurrentThrowArcState=nil
			lastThrower=nil
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

	function api.PublishThrowArcState(beam,C2,C1,C3,velocity,gravity,flightTime,power)
		local arc=publishThrowArcState(beam,C2,C1,C3,velocity,gravity,flightTime,power)
		if state.testingEnabled and state.testingQBEnabled~=false then
			updateQBCenterSafety()
		end
		return arc
	end

	function api.ClearThrowArcState()
		CurrentThrowArcState=nil
		restoreCenterBeams()
	end

	function api.Refresh()
		if destroyed then return end
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
		if destroyed then return end
		destroyed=true
		captureToken=captureToken+1
		disconnectAll()
		disconnectQBSafety()
		CurrentThrowArcState=nil
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
