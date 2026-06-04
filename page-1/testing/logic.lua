local Testing={}

local Players=game:GetService("Players")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local Workspace=game:GetService("Workspace")

local LP=Players.LocalPlayer

local BALL_G=28
local PLAYER_G=196.2
local JUMP_POWER=53.5
local WR_MAX_Y=6+(JUMP_POWER*JUMP_POWER)/(2*PLAYER_G)

local function firstFolder(container)
	if not container then return nil end

	for _,child in ipairs(container:GetChildren()) do
		if child:IsA("Folder") or child:IsA("Model") then
			return child
		end
	end

	return nil
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

local function projectileAt(origin,velocity,time)
	return origin+velocity*time+Vector3.new(0,-0.5*BALL_G*time*time,0)
end

local function c1FromPayload(payload)
	if type(payload)~="table" then return nil,nil end
	if typeof(payload.SpawnPos)~="Vector3" or typeof(payload.Target)~="Vector3" then return nil,nil end

	local power=tonumber(payload.Power) or 95
	local delta=payload.Target-payload.SpawnPos
	if delta.Magnitude<1e-6 or power<=0 then return nil,nil end

	local velocity=delta.Unit*power
	local a=0.5*BALL_G
	local b=-velocity.Y
	local c=WR_MAX_Y-payload.SpawnPos.Y
	local disc=b*b-4*a*c
	if disc<0 then
		local apexTime=math.max(velocity.Y/BALL_G,0)
		if apexTime<=0 then return nil,nil end
		return projectileAt(payload.SpawnPos,velocity,apexTime),apexTime
	end

	local root=math.sqrt(disc)
	local t1=(-b-root)/(2*a)
	local t2=(-b+root)/(2*a)
	local time=math.max(t1,t2)
	if time<=0 then
		time=math.min(t1,t2)
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
	return value==LP or (typeof(value)=="Instance" and value.Name==LP.Name)
end

local function addEvent(list,event)
	if event and event:IsA("RemoteEvent") and not list[event] then
		list[event]=true
	end
end

local function collectGameReEvents()
	local events={}

	addEvent(events,ReplicatedStorage:FindFirstChild("ReEvent"))

	for _,container in ipairs({
		ReplicatedStorage:FindFirstChild("Games"),
		ReplicatedStorage:FindFirstChild("MiniGames"),
		Workspace:FindFirstChild("Games"),
		Workspace:FindFirstChild("MiniGames"),
	}) do
		if container then
			for _,child in ipairs(container:GetChildren()) do
				addEvent(events,child:FindFirstChild("ReEvent"))
			end
		end
	end

	local packed={}
	for event in pairs(events) do
		table.insert(packed,event)
	end
	return packed
end

local function findLocalFolder()
	local miniGames=Workspace:FindFirstChild("MiniGames")
	local gameFolder=(miniGames and #miniGames:GetChildren()==1) and firstFolder(miniGames) or firstFolder(Workspace:FindFirstChild("Games"))
	return gameFolder and gameFolder:FindFirstChild("Local")
end

local function findCenter()
	local localFolder=findLocalFolder()
	return localFolder and localFolder:FindFirstChild("Center"),localFolder
end

function Testing.new(ctx,parent)
	local New=ctx.New
	local THEME=ctx.THEME
	local safeDisconnect=ctx.safeDisconnect
	local makeSection=ctx.makeSection
	local buildToggleRow=ctx.buildToggleRow
	local state=ctx.State
	local api={}
	local section=nil
	local toggle=nil
	local statusLabel=nil
	local marker=nil
	local remoteConnections={}
	local lifetimeConnections={}
	local listeningEvents={}
	local lastThrower=nil
	local lastThrowAt=0

	state.testingEnabled=state.testingEnabled and true or false

	local function changed()
		if ctx.onChanged then
			pcall(ctx.onChanged,state)
		end
	end

	local function setStatus(text,color)
		if statusLabel then
			statusLabel.Text=text
			statusLabel.TextColor3=color or THEME.MUTED
		end
	end

	local function syncControls()
		if toggle then
			toggle.set(state.testingEnabled)
		end
	end

	local function disconnectAll()
		for _,conn in ipairs(remoteConnections) do
			safeDisconnect(conn)
		end

		table.clear(remoteConnections)
		table.clear(listeningEvents)
	end

	local function destroyMarker()
		if marker and marker.Parent then
			marker:Destroy()
		end

		marker=nil
	end

	local function ensureMarker(parentFolder)
		if marker and marker.Parent then
			return marker
		end

		marker=Instance.new("Part")
		marker.Name="TestingC1Marker"
		marker.Shape=Enum.PartType.Ball
		marker.Size=Vector3.new(1.2,1.2,1.2)
		marker.Anchored=true
		marker.CanCollide=false
		marker.CanTouch=false
		marker.CanQuery=false
		marker.Material=Enum.Material.Neon
		marker.Color=THEME.GREEN or Color3.fromRGB(80,220,140)
		marker.Transparency=0.15
		marker.Parent=parentFolder or Workspace

		local billboard=Instance.new("BillboardGui")
		billboard.Name="TestingC1Label"
		billboard.Size=UDim2.new(0,64,0,20)
		billboard.StudsOffset=Vector3.new(0,1.6,0)
		billboard.AlwaysOnTop=true
		billboard.Adornee=marker
		billboard.Parent=marker

		local label=Instance.new("TextLabel")
		label.BackgroundTransparency=1
		label.Size=UDim2.fromScale(1,1)
		label.Text="C1"
		label.Font=Enum.Font.GothamBold
		label.TextSize=12
		label.TextColor3=THEME.TEXT or Color3.new(1,1,1)
		label.TextStrokeTransparency=0.35
		label.Parent=billboard

		return marker
	end

	local function captureC1(source,payload)
		if not state.testingEnabled then return end

		local center,folder=findCenter()
		local c1=center and center:FindFirstChild("C1",true)
		local cframe=c1 and attachmentCFrame(c1)
		local pos=cframe and cframe.Position
		local fromPayload=false
		local flightTime=nil
		if not pos then
			pos,flightTime=c1FromPayload(payload)
			fromPayload=pos~=nil
		end
		if not pos then
			setStatus("C1 not found: "..source,THEME.RED)
			return
		end

		ensureMarker(folder).CFrame=CFrame.new(pos)
		local powerText=payload and (" "..fmtPower(payload.Power)) or ""
		local timeText=flightTime and string.format(" %.2fs",flightTime) or ""
		local label=(lastThrower and (lastThrower.." ") or "")..(fromPayload and "C1 calc" or "C1")..powerText..timeText..": "..fmtVector(pos)
		setStatus(label,THEME.GREEN or THEME.TEXT)
	end

	local function captureSoon(source,payload)
		task.defer(captureC1,source,payload)
		task.delay(0.05,captureC1,source,payload)
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
		if not state.testingEnabled then return end

		local args={...}
		local topic=args[1]

		if topic=="AddEvent" and type(args[2])=="table" and args[2].Name=="Throw" then
			local view=args[2].View
			if not isLocalView(view) then
				lastThrower=instanceName(view)
				lastThrowAt=os.clock()
				setStatus("Throw: "..lastThrower,THEME.MUTED)
				captureSoon("throw")
			end
			return
		end

		if topic=="Mechanics" and (args[2]=="UpdateBall" or args[2]=="UpdateFootball") then
			local payload=updateFootballPayload(args,3)
			local powerText=payload and (" "..fmtPower(payload.Power)) or ""
			setStatus("UpdateBall"..powerText,THEME.MUTED)
			captureSoon("update ball",payload)
			return
		end

		if topic=="UpdateFootball" then
			local payload=updateFootballPayload(args,2)
			lastThrowAt=os.clock()
			setStatus("UpdateFootball"..(payload and (" "..fmtPower(payload.Power)) or ""),THEME.MUTED)
			captureSoon("update football",payload)
		end
	end

	local function connectIncoming()
		disconnectAll()

		for _,event in ipairs(collectGameReEvents()) do
			if not listeningEvents[event] then
				listeningEvents[event]=true
				table.insert(remoteConnections,event.OnClientEvent:Connect(handleIncoming))
			end
		end

		setStatus(#remoteConnections>0 and ("Listening: "..#remoteConnections.." event(s)") or "No ReEvent found",#remoteConnections>0 and THEME.MUTED or THEME.RED)
	end

	function api.SetTestingState(value,fire)
		state.testingEnabled=value and true or false
		if state.testingEnabled then
			connectIncoming()
		else
			disconnectAll()
			destroyMarker()
			lastThrower=nil
			lastThrowAt=0
			setStatus("Off",THEME.MUTED)
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
		else
			setStatus("Off",THEME.MUTED)
		end
	end

	function api.Reset()
		api.SetTestingState(false,true)
	end

	function api.Destroy()
		disconnectAll()
		for _,conn in ipairs(lifetimeConnections) do
			safeDisconnect(conn)
		end
		table.clear(lifetimeConnections)
		destroyMarker()
	end

	local sectionControls=nil
	section,sectionControls=makeSection(parent,5,"Testing","incoming C1 capture",{
		headerToggle={
			startState=state.testingEnabled,
			onChange=function(value)
				api.SetTestingState(value,true)
			end,
		},
		compact=true,
	})

	toggle=sectionControls and sectionControls.toggle
	if not toggle then
		toggle=buildToggleRow(section,"Testing",state.testingEnabled,function(value)
			api.SetTestingState(value,true)
		end)
	end

	statusLabel=New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,28),Text="",Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.MUTED,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,ZIndex=6},section)

	local ancestryConn=section.AncestryChanged:Connect(function()
		if not section.Parent then
			api.Destroy()
		end
	end)
	table.insert(lifetimeConnections,ancestryConn)

	api.Refresh()

	return api
end

return Testing
