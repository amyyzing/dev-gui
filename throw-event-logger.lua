-- Standalone throw diagnostics logger.
-- Execute this by itself, run a few throw tests, then press RightShift+J or run:
-- getgenv().ThrowEventLogger.Copy()

local VERSION="throw-event-logger-v1"
local MAX_EVENTS=900
local MAX_ARG_DEPTH=5
local MAX_TABLE_ITEMS=55
local MAX_FOOTBALLS=18
local MAX_PLAYERS=28
local THROW_SNAPSHOT_DELAYS={0,0.03,0.08,0.16,0.32,0.65}

local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local UserInputService=game:GetService("UserInputService")
local Workspace=game:GetService("Workspace")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local HttpService=game:GetService("HttpService")

local LP=Players.LocalPlayer
local events={}
local connections={}
local connectedRemotes={}
local startedClock=os.clock()
local stopped=false

local function round(value)
	if type(value)~="number" then return value end
	if value~=value or value==math.huge or value==-math.huge then
		return tostring(value)
	end
	return math.floor(value*1000+0.5)/1000
end

local function pathOf(instance)
	if typeof(instance)~="Instance" then return tostring(instance) end
	local parts={}
	local current=instance
	for _=1,30 do
		if not current then break end
		table.insert(parts,1,current.Name)
		current=current.Parent
	end
	return table.concat(parts,".")
end

local function vec(value)
	if typeof(value)~="Vector3" then return nil end
	return{round(value.X),round(value.Y),round(value.Z)}
end

local function vec2(value)
	if typeof(value)~="Vector2" then return nil end
	return{round(value.X),round(value.Y)}
end

local function cf(value)
	if typeof(value)~="CFrame" then return nil end
	return{
		pos=vec(value.Position),
		look=vec(value.LookVector),
		right=vec(value.RightVector),
		up=vec(value.UpVector),
	}
end

local function partState(part)
	if not(part and typeof(part)=="Instance" and part:IsA("BasePart")) then return nil end
	local linearVelocity=nil
	local lv=part:FindFirstChildOfClass("LinearVelocity")
	if lv then
		linearVelocity=vec(lv.VectorVelocity)
	end
	return{
		name=part.Name,
		class=part.ClassName,
		path=pathOf(part),
		pos=vec(part.Position),
		cframe=cf(part.CFrame),
		size=vec(part.Size),
		assemblyVelocity=vec(part.AssemblyLinearVelocity),
		linearVelocity=linearVelocity,
		anchored=part.Anchored,
		parent=part.Parent and pathOf(part.Parent) or nil,
	}
end

local function root(character)
	if not character then return nil end
	local primary=character.PrimaryPart
	if primary and primary:IsA("BasePart") then
		return primary
	end
	return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
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

local function sanitize(value,depth,seen)
	depth=depth or 0
	seen=seen or {}
	if depth>MAX_ARG_DEPTH then
		return"<depth-limit>"
	end

	local valueType=typeof(value)
	local luaType=type(value)

	if valueType=="Vector3" then return vec(value) end
	if valueType=="Vector2" then return vec2(value) end
	if valueType=="CFrame" then return cf(value) end
	if valueType=="Color3" then return{round(value.R),round(value.G),round(value.B)} end
	if valueType=="UDim2" or valueType=="UDim" or valueType=="EnumItem" then return tostring(value) end
	if valueType=="Instance" then
		local payload={
			class=value.ClassName,
			name=value.Name,
			path=pathOf(value),
			parent=value.Parent and pathOf(value.Parent) or nil,
		}
		if value:IsA("BasePart") then
			payload.part=partState(value)
		end
		return payload
	end

	if luaType=="number" then return round(value) end
	if luaType=="string" or luaType=="boolean" or luaType=="nil" then return value end
	if luaType=="function" or luaType=="thread" or luaType=="userdata" then return tostring(value) end

	if luaType=="table" then
		if seen[value] then return"<cycle>" end
		seen[value]=true
		local output={}
		local count=0
		for key,item in pairs(value) do
			count=count+1
			if count>MAX_TABLE_ITEMS then
				output._truncated=true
				break
			end
			local outKey=type(key)=="string" and key or tostring(key)
			output[outKey]=sanitize(item,depth+1,seen)
		end
		seen[value]=nil
		return output
	end

	return tostring(value)
end

local function getPlayerTeamID(player)
	local replicated=player and player:FindFirstChild("Replicated")
	local teamValue=replicated and replicated:FindFirstChild("TeamID")
	if not teamValue then return nil end
	local ok,value=pcall(function()
		return teamValue.Value
	end)
	return ok and tostring(value) or nil
end

local function getPlayerGameID(player)
	local replicated=player and player:FindFirstChild("Replicated")
	local gameValue=replicated and replicated:FindFirstChild("GameID")
	if not gameValue then return nil end
	local ok,value=pcall(function()
		return gameValue.Value
	end)
	return ok and tostring(value) or nil
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

local function looksLikeFootball(instance)
	if not(instance and typeof(instance)=="Instance" and instance:IsA("BasePart")) then return false end
	local name=string.lower(instance.Name)
	if string.find(name,"football",1,true) or string.find(name,"ball",1,true) then
		return true
	end
	local parent=instance.Parent
	if parent then
		local parentName=string.lower(parent.Name)
		if string.find(parentName,"football",1,true) then
			return true
		end
	end
	return false
end

local function collectFootballs(rootInstance,output,seen)
	if not rootInstance then return end
	for _,descendant in ipairs(rootInstance:GetDescendants()) do
		if #output>=MAX_FOOTBALLS then return end
		if looksLikeFootball(descendant) and not seen[descendant] then
			seen[descendant]=true
			table.insert(output,partState(descendant))
		end
	end
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

local function getLocalFolder()
	local miniGames=Workspace:FindFirstChild("MiniGames")
	local gameFolder=nil
	if miniGames and #miniGames:GetChildren()==1 then
		gameFolder=getFirstChildFolder(miniGames)
	else
		gameFolder=getFirstChildFolder(Workspace:FindFirstChild("Games"))
	end
	return gameFolder and gameFolder:FindFirstChild("Local") or nil
end

local function arcState()
	local localFolder=getLocalFolder()
	local center=localFolder and localFolder:FindFirstChild("Center")
	if not center then return nil end
	local result={
		center=partState(center:IsA("BasePart") and center or nil),
		centerPath=pathOf(center),
	}
	for _,name in ipairs({"C1","C2","C3"}) do
		local attachment=center:FindFirstChild(name,true)
		local cframe=attachment and attachmentCFrame(attachment)
		result[name]={
			path=attachment and pathOf(attachment) or nil,
			pos=cframe and vec(cframe.Position) or nil,
			cframe=cframe and cf(cframe) or nil,
		}
	end
	local beam=center:FindFirstChild("ThrowingArc",true)
	if beam and beam:IsA("Beam") then
		result.beam={
			path=pathOf(beam),
			enabled=beam.Enabled,
			curve0=round(beam.CurveSize0),
			curve1=round(beam.CurveSize1),
			attachment0=beam.Attachment0 and pathOf(beam.Attachment0) or nil,
			attachment1=beam.Attachment1 and pathOf(beam.Attachment1) or nil,
		}
	end
	return result
end

local function humanoidState(character)
	local humanoid=character and character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return nil end
	return{
		health=round(humanoid.Health),
		walkSpeed=round(humanoid.WalkSpeed),
		jumpPower=round(humanoid.JumpPower),
		state=tostring(humanoid:GetState()),
		hipHeight=round(humanoid.HipHeight),
		moveDirection=vec(humanoid.MoveDirection),
	}
end

local function playerState(player)
	local character=player.Character
	local characterRoot=root(character)
	local tackleBox=getPlayerTackleBox(player)
	return{
		name=player.Name,
		displayName=player.DisplayName,
		userId=player.UserId,
		isLocal=player==LP,
		teamId=getPlayerTeamID(player),
		gameId=getPlayerGameID(player),
		root=partState(characterRoot),
		head=partState(character and character:FindFirstChild("Head")),
		upperTorso=partState(character and character:FindFirstChild("UpperTorso")),
		torso=partState(character and character:FindFirstChild("Torso")),
		tackleBox=partState(tackleBox),
		humanoid=humanoidState(character),
	}
end

local function snapshot(label)
	local footballs={}
	local seenFootballs={}
	collectFootballs(Workspace,footballs,seenFootballs)
	collectFootballs(ReplicatedStorage,footballs,seenFootballs)
	if LP.Character then
		collectFootballs(LP.Character,footballs,seenFootballs)
	end

	local players={}
	for _,player in ipairs(Players:GetPlayers()) do
		if #players>=MAX_PLAYERS then break end
		table.insert(players,playerState(player))
	end

	return{
		label=label,
		clock=round(os.clock()-startedClock),
		epoch=round(os.time()),
		serverTime=round(Workspace:GetServerTimeNow()),
		camera=Workspace.CurrentCamera and cf(Workspace.CurrentCamera.CFrame) or nil,
		localPlayer=LP and LP.Name or nil,
		mouse=LP and LP:GetMouse() and {x=round(LP:GetMouse().X),y=round(LP:GetMouse().Y),hit=cf(LP:GetMouse().Hit)} or nil,
		arc=arcState(),
		footballs=footballs,
		players=players,
	}
end

local function pushEvent(kind,data,withSnapshot)
	if stopped then return end
	local event={
		i=#events+1,
		kind=kind,
		clock=round(os.clock()-startedClock),
		serverTime=round(Workspace:GetServerTimeNow()),
		data=sanitize(data or {}),
	}
	if withSnapshot then
		event.snapshot=snapshot(kind)
	end
	table.insert(events,event)
	while #events>MAX_EVENTS do
		table.remove(events,1)
	end
end

local function argsLookThrow(args)
	for _,value in ipairs(args) do
		if type(value)=="string" then
			local text=string.lower(value)
			if string.find(text,"throw",1,true)
				or string.find(text,"football",1,true)
				or string.find(text,"updateball",1,true)
				or string.find(text,"updatefootball",1,true)
				or string.find(text,"catch",1,true)
				or string.find(text,"hike",1,true) then
				return true
			end
		elseif type(value)=="table" then
			if value.Target~=nil or value.SpawnPos~=nil or value.Power~=nil or value.CenterWorld~=nil or value.LaunchTime~=nil then
				return true
			end
		elseif typeof(value)=="Instance" then
			if value:IsA("RemoteEvent") or looksLikeFootball(value) then
				return true
			end
		end
	end
	return false
end

local function scheduleThrowSnapshots(label)
	for _,delayTime in ipairs(THROW_SNAPSHOT_DELAYS) do
		task.delay(delayTime,function()
			pushEvent("snapshot:"..label,{delay=delayTime},true)
		end)
	end
end

local function addConnection(connection)
	table.insert(connections,connection)
	return connection
end

local function connectRemote(remote)
	if not(remote and remote:IsA("RemoteEvent")) or connectedRemotes[remote] then return end
	connectedRemotes[remote]=true
	pushEvent("remote_watch",{remote=pathOf(remote),name=remote.Name})
	addConnection(remote.OnClientEvent:Connect(function(...)
		local args={...}
		if argsLookThrow(args) or remote.Name=="ReEvent" then
			pushEvent("remote_in",{remote=pathOf(remote),args=sanitize(args)},true)
			scheduleThrowSnapshots("remote_in")
		end
	end))
end

local function scanRemotes(container)
	if not container then return end
	if container:IsA("RemoteEvent") then
		connectRemote(container)
	end
	for _,descendant in ipairs(container:GetDescendants()) do
		if descendant:IsA("RemoteEvent") and (descendant.Name=="ReEvent" or descendant.Name=="RemoteEvent") then
			connectRemote(descendant)
		end
	end
end

local function watchContainer(container)
	if not container then return end
	scanRemotes(container)
	addConnection(container.DescendantAdded:Connect(function(descendant)
		if descendant:IsA("RemoteEvent") and (descendant.Name=="ReEvent" or descendant.Name=="RemoteEvent") then
			connectRemote(descendant)
		elseif looksLikeFootball(descendant) then
			pushEvent("football_added",{football=partState(descendant)},true)
		end
	end))
end

local function hookOutgoingFireServer()
	local hookMetamethod=rawget(getfenv and getfenv() or _G,"hookmetamethod") or rawget(getgenv and getgenv() or _G,"hookmetamethod")
	local getNamecallMethod=rawget(getfenv and getfenv() or _G,"getnamecallmethod") or rawget(getgenv and getgenv() or _G,"getnamecallmethod")
	local newCClosure=rawget(getfenv and getfenv() or _G,"newcclosure") or rawget(getgenv and getgenv() or _G,"newcclosure")
	if type(hookMetamethod)~="function" or type(getNamecallMethod)~="function" then
		pushEvent("outgoing_hook_unavailable",{reason="hookmetamethod/getnamecallmethod missing"})
		return
	end

	local oldNamecall=nil
	local callback=function(self,...)
		local method=getNamecallMethod()
		local args={...}
		if method=="FireServer" and typeof(self)=="Instance" and self:IsA("RemoteEvent") and argsLookThrow(args) then
			pushEvent("remote_out",{remote=pathOf(self),args=sanitize(args)},true)
			scheduleThrowSnapshots("remote_out")
		end
		return oldNamecall(self,...)
	end

	local ok,err=pcall(function()
		oldNamecall=hookMetamethod(game,"__namecall",type(newCClosure)=="function" and newCClosure(callback) or callback)
	end)
	pushEvent(ok and "outgoing_hook_enabled" or "outgoing_hook_failed",{error=err and tostring(err) or nil})
end

local function connectAnimationsForPlayer(player)
	local function attach(character)
		local humanoid=character and character:FindFirstChildOfClass("Humanoid")
		local animator=humanoid and humanoid:FindFirstChildOfClass("Animator")
		if not animator then return end
		addConnection(animator.AnimationPlayed:Connect(function(track)
			local animation=track.Animation
			local name=track.Name or ""
			local animationId=animation and animation.AnimationId or ""
			local lower=string.lower(name.." "..animationId)
			if string.find(lower,"throw",1,true) or string.find(lower,"quarterback",1,true) or player==LP then
				pushEvent("animation_played",{
					player=player.Name,
					track=name,
					animationId=animationId,
					speed=round(track.Speed),
					length=round(track.Length),
				},player==LP)
				if string.find(lower,"throw",1,true) or string.find(lower,"quarterback",1,true) then
					scheduleThrowSnapshots("animation")
				end
			end
		end))
	end

	if player.Character then
		task.defer(attach,player.Character)
	end
	addConnection(player.CharacterAdded:Connect(function(character)
		task.wait(0.25)
		attach(character)
	end))
end

local function dumpJson()
	local payload={
		version=VERSION,
		startedClock=startedClock,
		generatedClock=os.clock(),
		eventCount=#events,
		finalSnapshot=snapshot("dump"),
		events=events,
	}
	return HttpService:JSONEncode(payload)
end

local function printChunks(text)
	local chunkSize=3500
	print("========== THROW LOGGER JSON BEGIN ==========")
	for i=1,#text,chunkSize do
		print(string.sub(text,i,i+chunkSize-1))
	end
	print("========== THROW LOGGER JSON END ==========")
end

local function copyJson()
	local text=dumpJson()
	local copied=false
	if type(setclipboard)=="function" then
		local ok=pcall(function()
			setclipboard(text)
		end)
		copied=ok
	end
	if copied then
		print("[ThrowLogger] Copied JSON to clipboard. Events:",#events,"Chars:",#text)
	else
		print("[ThrowLogger] setclipboard unavailable; printing JSON chunks. Events:",#events,"Chars:",#text)
		printChunks(text)
	end
	return text
end

local function stopLogger()
	stopped=true
	for _,connection in ipairs(connections) do
		pcall(function()
			connection:Disconnect()
		end)
	end
	table.clear(connections)
	print("[ThrowLogger] stopped")
end

local api={
	Copy=copyJson,
	Dump=dumpJson,
	Stop=stopLogger,
	Clear=function()
		table.clear(events)
		pushEvent("cleared",{})
	end,
	Snapshot=function(label)
		pushEvent("manual_snapshot",{label=label or "manual"},true)
	end,
	Events=function()
		return events
	end,
}

local globals=(type(getgenv)=="function" and getgenv()) or _G
globals.ThrowEventLogger=api

watchContainer(ReplicatedStorage)
watchContainer(Workspace)
for _,player in ipairs(Players:GetPlayers()) do
	connectAnimationsForPlayer(player)
end
addConnection(Players.PlayerAdded:Connect(connectAnimationsForPlayer))

addConnection(UserInputService.InputBegan:Connect(function(input,gameProcessed)
	local interesting=input.UserInputType==Enum.UserInputType.MouseButton1
		or input.UserInputType==Enum.UserInputType.Touch
		or input.KeyCode==Enum.KeyCode.T
		or input.KeyCode==Enum.KeyCode.ButtonR2
		or input.KeyCode==Enum.KeyCode.ButtonR1
	if interesting then
		pushEvent("input_began",{
			key=tostring(input.KeyCode),
			userInputType=tostring(input.UserInputType),
			gameProcessed=gameProcessed,
			mouse=LP and LP:GetMouse() and {x=LP:GetMouse().X,y=LP:GetMouse().Y,hit=cf(LP:GetMouse().Hit)} or nil,
		},true)
		scheduleThrowSnapshots("input")
	end

	if UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then
		if input.KeyCode==Enum.KeyCode.J then
			copyJson()
		elseif input.KeyCode==Enum.KeyCode.K then
			pushEvent("manual_hotkey_snapshot",{},true)
			print("[ThrowLogger] snapshot added")
		elseif input.KeyCode==Enum.KeyCode.L then
			stopLogger()
		end
	end
end))

addConnection(UserInputService.InputEnded:Connect(function(input,gameProcessed)
	if input.UserInputType==Enum.UserInputType.MouseButton1
		or input.UserInputType==Enum.UserInputType.Touch
		or input.KeyCode==Enum.KeyCode.T
		or input.KeyCode==Enum.KeyCode.ButtonR2
		or input.KeyCode==Enum.KeyCode.ButtonR1 then
		pushEvent("input_ended",{
			key=tostring(input.KeyCode),
			userInputType=tostring(input.UserInputType),
			gameProcessed=gameProcessed,
		},false)
	end
end))

hookOutgoingFireServer()
pushEvent("logger_started",{
	version=VERSION,
	localPlayer=LP and LP.Name or nil,
	instructions={
		"Run throws/clicks normally.",
		"Press RightShift+K to add a manual snapshot.",
		"Press RightShift+J to copy JSON.",
		"Or run getgenv().ThrowEventLogger.Copy().",
		"Press RightShift+L to stop the logger.",
	},
},true)

print("[ThrowLogger] started. Press RightShift+J to copy JSON, RightShift+K snapshot, RightShift+L stop.")
