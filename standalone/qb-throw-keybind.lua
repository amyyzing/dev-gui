-- Standalone QB throw keybind + passive throw-pipeline logger.
-- No loader/API/module fetch and no custom throw remote payload.
-- Pressing the bound key sends the same native left-click input the game uses.
-- The logger records incoming/outgoing remotes, local snapshots, and best-effort
-- connection/decompiler details without blocking or changing remote args.

local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local TweenService=game:GetService("TweenService")
local HttpService=game:GetService("HttpService")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local Workspace=game:GetService("Workspace")
local CoreGui=game:GetService("CoreGui")

local LP=Players.LocalPlayer
local RUNTIME_KEY="StandaloneQBThrowKeybindGui"
local LOGGER_KEY=RUNTIME_KEY.."RemoteHook"
local CLICK_COOLDOWN=0.18
local LOG_LIMIT=900
local TABLE_ENTRY_LIMIT=60
local STRING_LIMIT=3000
local DECOMPILE_CHAR_LIMIT=18000
local CONNECTION_CAPTURE_LIMIT=18
local SCRIPT_CAPTURE_LIMIT=18

local runtimeOwner=(type(getgenv)=="function" and getgenv()) or _G
if type(runtimeOwner)=="table" then
	local old=rawget(runtimeOwner,RUNTIME_KEY)
	if old and type(old.Destroy)=="function" then
		pcall(function()
			old:Destroy()
		end)
	end

end

local sessionId=tostring(os.time()).."-"..tostring(math.floor(os.clock()*1000))
local connections={}
local logs={}
local logIndex=0
local boundRemotes={}
local screenGui=nil
local currentBinding=Enum.KeyCode.T
local capturing=false
local lastClickAt=-math.huge
local statusLabel=nil
local keyButton=nil
local logCountLabel=nil
local loggerState=nil

local VirtualInputManager=nil
pcall(function()
	VirtualInputManager=game:GetService("VirtualInputManager")
end)

if type(runtimeOwner)=="table" then
	loggerState=rawget(runtimeOwner,LOGGER_KEY)
	if type(loggerState)~="table" then
		loggerState={}
		rawset(runtimeOwner,LOGGER_KEY,loggerState)
	end
	loggerState.activeSession=sessionId
end

local function connect(signal,fn)
	local conn=signal:Connect(fn)
	connections[#connections+1]=conn
	return conn
end

local function disconnectAll()
	for _,conn in ipairs(connections) do
		pcall(function()
			conn:Disconnect()
		end)
	end
	table.clear(connections)
end

local function new(className,props,parent)
	local obj=Instance.new(className)
	for key,value in pairs(props or {}) do
		obj[key]=value
	end
	obj.Parent=parent
	return obj
end

local function setStatus(text,color)
	if statusLabel then
		statusLabel.Text=tostring(text or "")
		if color then
			statusLabel.TextColor3=color
		end
	end
end

local function safeFullName(obj)
	local ok,result=pcall(function()
		return obj:GetFullName()
	end)
	if ok then
		return result
	end
	return tostring(obj)
end

local function clampString(value,limit)
	value=tostring(value)
	limit=limit or STRING_LIMIT
	if #value>limit then
		return value:sub(1,limit).."...<truncated "..tostring(#value-limit).." chars>"
	end
	return value
end

local function serializeValue(value,depth,seen)
	depth=depth or 0
	seen=seen or {}

	local valueType=typeof(value)
	if value==nil or valueType=="boolean" or valueType=="number" then
		return value
	end
	if valueType=="string" then
		return clampString(value)
	end
	if depth>=5 then
		return {type=valueType,truncated=true,value=clampString(value,240)}
	end
	if valueType=="Vector2" then
		return {type="Vector2",x=value.X,y=value.Y}
	end
	if valueType=="Vector3" then
		return {type="Vector3",x=value.X,y=value.Y,z=value.Z}
	end
	if valueType=="Color3" then
		return {type="Color3",r=value.R,g=value.G,b=value.B}
	end
	if valueType=="CFrame" then
		local position=value.Position
		local look=value.LookVector
		return {
			type="CFrame",
			position={x=position.X,y=position.Y,z=position.Z},
			lookVector={x=look.X,y=look.Y,z=look.Z},
		}
	end
	if valueType=="EnumItem" then
		return tostring(value)
	end
	if valueType=="Instance" then
		local info={
			type="Instance",
			className=value.ClassName,
			name=value.Name,
			path=safeFullName(value),
		}
		pcall(function()
			info.debugId=value:GetDebugId()
		end)
		if value:IsA("BasePart") then
			info.position=serializeValue(value.Position,depth+1,seen)
			info.cframe=serializeValue(value.CFrame,depth+1,seen)
			info.velocity=serializeValue(value.AssemblyLinearVelocity,depth+1,seen)
		end
		return info
	end
	if valueType=="table" then
		if seen[value] then
			return {type="table",cycle=true}
		end
		seen[value]=true

		local out={type="table",value={}}
		local count=0
		for key,item in pairs(value) do
			count+=1
			if count>TABLE_ENTRY_LIMIT then
				out.truncated=true
				out.truncatedAfter=TABLE_ENTRY_LIMIT
				break
			end
			out.value[clampString(key,120)]=serializeValue(item,depth+1,seen)
		end
		seen[value]=nil
		return out
	end
	if valueType=="function" then
		local info={type="function",value=clampString(value,240)}
		if debug and debug.info then
			pcall(function()
				info.source=debug.info(value,"s")
				info.line=debug.info(value,"l")
				info.name=debug.info(value,"n")
			end)
		end
		return info
	end

	return {type=valueType,value=clampString(value,240)}
end

local function serializeArgs(args)
	local out={}
	for index,arg in ipairs(args) do
		out[index]=serializeValue(arg,0,{})
	end
	return out
end

local function snapshotLocalState(reason)
	local mouse=LP:GetMouse()
	local character=LP.Character or Workspace:FindFirstChild(LP.Name)
	local root=character and character:FindFirstChild("HumanoidRootPart")
	local humanoid=character and character:FindFirstChildOfClass("Humanoid")
	local camera=Workspace.CurrentCamera
	local snapshot={
		reason=reason,
		player=LP.Name,
		clock=os.clock(),
		binding=serializeValue(currentBinding,0,{}),
	}

	if root then
		snapshot.root={
			position=serializeValue(root.Position,0,{}),
			cframe=serializeValue(root.CFrame,0,{}),
			velocity=serializeValue(root.AssemblyLinearVelocity,0,{}),
		}
	end
	if humanoid then
		snapshot.humanoid={
			state=tostring(humanoid:GetState()),
			moveDirection=serializeValue(humanoid.MoveDirection,0,{}),
			floorMaterial=tostring(humanoid.FloorMaterial),
			jump=humanoid.Jump,
			walkSpeed=humanoid.WalkSpeed,
			jumpPower=humanoid.JumpPower,
		}
	end
	if mouse and mouse.Hit then
		snapshot.mouse={
			hit=serializeValue(mouse.Hit,0,{}),
			target=serializeValue(mouse.Target,0,{}),
		}
	end
	if camera then
		snapshot.camera={
			cframe=serializeValue(camera.CFrame,0,{}),
			focus=serializeValue(camera.Focus,0,{}),
		}
	end

	return snapshot
end

local function refreshLogCount()
	if logCountLabel then
		logCountLabel.Text="Logs: "..tostring(#logs)
	end
end

local function addLog(kind,data)
	logIndex+=1
	logs[#logs+1]={
		i=logIndex,
		session=sessionId,
		t=os.clock(),
		kind=kind,
		data=data,
	}
	if #logs>LOG_LIMIT then
		table.remove(logs,1)
	end
	refreshLogCount()
end

local function remoteText(remote,args)
	local text=(safeFullName(remote).." "..remote.Name):lower()
	for index=1,math.min(#args,4) do
		local arg=args[index]
		if type(arg)=="string" then
			text=text.." "..arg:lower()
		end
	end
	return text
end

local function shouldLogRemote(remote,args)
	if typeof(remote)~="Instance" then return false end
	local text=remoteText(remote,args or {})
	return text:find("reevent",1,true)
		or text:find("football",1,true)
		or text:find("throw",1,true)
		or text:find("mechanic",1,true)
		or text:find("updateball",1,true)
		or text:find("game",1,true)
end

local function emitOutgoingRemote(source,method,remote,args)
	if not shouldLogRemote(remote,args) then return end
	addLog("outgoing_remote",{
		source=source,
		method=method,
		remote=serializeValue(remote,0,{}),
		args=serializeArgs(args or {}),
		snapshot=snapshotLocalState("outgoing "..tostring(method)),
	})
end

local function installOutgoingHooks()
	if not loggerState then
		addLog("outgoing_hook_unavailable",{reason="No global runtime table"})
		return
	end

	loggerState.activeSession=sessionId
	loggerState.emit=function(source,method,remote,args)
		if loggerState.activeSession~=sessionId then return end
		emitOutgoingRemote(source,method,remote,args or {})
	end

	local installed={}
	local failed={}

	if loggerState.namecallHooked then
		installed[#installed+1]="namecall_existing"
	elseif type(hookmetamethod)=="function" and type(getnamecallmethod)=="function" then
		local wrap=(type(newcclosure)=="function" and newcclosure) or function(fn)
			return fn
		end
		local oldNamecall
		local ok,err=pcall(function()
			oldNamecall=hookmetamethod(game,"__namecall",wrap(function(self,...)
				local method=getnamecallmethod()
				if (method=="FireServer" or method=="InvokeServer") and typeof(self)=="Instance" and (self:IsA("RemoteEvent") or self:IsA("RemoteFunction")) then
					local state=type(runtimeOwner)=="table" and rawget(runtimeOwner,LOGGER_KEY) or nil
					local emit=type(state)=="table" and state.emit or nil
					if type(emit)=="function" then
						local args={...}
						pcall(emit,"namecall",method,self,args)
					end
				end
				return oldNamecall(self,...)
			end))
		end)

		if ok then
			loggerState.namecallHooked=true
			loggerState.oldNamecall=oldNamecall
			installed[#installed+1]="namecall"
		else
			failed[#failed+1]={hook="namecall",error=tostring(err)}
		end
	else
		failed[#failed+1]={
			hook="namecall",
			hookmetamethod=type(hookmetamethod),
			getnamecallmethod=type(getnamecallmethod),
		}
	end

	addLog("outgoing_hook_ready",{
		installed=installed,
		failed=failed,
	})
end

local function bindIncomingRemote(remote)
	if typeof(remote)~="Instance" or not remote:IsA("RemoteEvent") then return end
	if boundRemotes[remote] then return end
	if not shouldLogRemote(remote,{}) then return end

	boundRemotes[remote]=true
	addLog("incoming_remote_bound",{remote=serializeValue(remote,0,{})})

	connect(remote.OnClientEvent,function(...)
		local args={...}
		if not shouldLogRemote(remote,args) then return end
		addLog("incoming_remote",{
			remote=serializeValue(remote,0,{}),
			args=serializeArgs(args),
			snapshot=snapshotLocalState("incoming OnClientEvent"),
		})
	end)
end

local function scanRemoteContainer(container)
	if not container then return end
	if container:IsA("RemoteEvent") then
		bindIncomingRemote(container)
		return
	end
	for _,descendant in ipairs(container:GetDescendants()) do
		if descendant:IsA("RemoteEvent") then
			bindIncomingRemote(descendant)
		end
	end
end

local function bindIncomingRemotes()
	scanRemoteContainer(ReplicatedStorage:FindFirstChild("ReEvent"))
	scanRemoteContainer(ReplicatedStorage:FindFirstChild("Games"))
	scanRemoteContainer(ReplicatedStorage:FindFirstChild("MiniGames"))
	scanRemoteContainer(Workspace:FindFirstChild("Games"))
	scanRemoteContainer(Workspace:FindFirstChild("MiniGames"))

	connect(ReplicatedStorage.DescendantAdded,function(descendant)
		if descendant:IsA("RemoteEvent") then
			task.defer(bindIncomingRemote,descendant)
		end
	end)
	connect(Workspace.DescendantAdded,function(descendant)
		if descendant:IsA("RemoteEvent") then
			task.defer(bindIncomingRemote,descendant)
		end
	end)
end

local function tryDecompiler(name,fn,subject)
	if type(fn)~="function" then
		return nil
	end
	local ok,result=pcall(fn,subject)
	if not ok then
		return {tool=name,ok=false,error=clampString(result,600)}
	end
	if type(result)=="string" then
		return {tool=name,ok=true,text=clampString(result,DECOMPILE_CHAR_LIMIT)}
	end
	return {tool=name,ok=true,result=serializeValue(result,0,{})}
end

local function decompileSubject(subject)
	local attempts={}
	local result=tryDecompiler("decompile",decompile,subject)
	if result then attempts[#attempts+1]=result end
	result=tryDecompiler("bytefall",bytefall,subject)
	if result then attempts[#attempts+1]=result end
	result=tryDecompiler("getscriptbytecode",getscriptbytecode,subject)
	if result then attempts[#attempts+1]=result end

	if #attempts==0 then
		return {available=false,reason="No decompile/bytefall/getscriptbytecode global available"}
	end
	return {available=true,attempts=attempts}
end

local function captureRemoteConnections()
	local captured={}
	local count=0

	if type(getconnections)~="function" then
		addLog("connection_capture_unavailable",{getconnections=type(getconnections)})
		return
	end

	for remote in pairs(boundRemotes) do
		if count>=CONNECTION_CAPTURE_LIMIT then break end
		local ok,remoteConnections=pcall(getconnections,remote.OnClientEvent)
		if ok and type(remoteConnections)=="table" then
			for index,connection in ipairs(remoteConnections) do
				if count>=CONNECTION_CAPTURE_LIMIT then break end
				count+=1
				local fn=connection.Function
				captured[#captured+1]={
					remote=serializeValue(remote,0,{}),
					connectionIndex=index,
					enabled=connection.Enabled,
					functionInfo=serializeValue(fn,0,{}),
					decompile=decompileSubject(fn),
				}
			end
		else
			captured[#captured+1]={
				remote=serializeValue(remote,0,{}),
				error=tostring(remoteConnections),
			}
		end
	end

	addLog("connection_capture",{
		count=count,
		limit=CONNECTION_CAPTURE_LIMIT,
		items=captured,
	})
end

local function scriptLooksRelevant(scriptObject)
	local text=(safeFullName(scriptObject).." "..scriptObject.Name):lower()
	local keywords={
		"clientmain",
		"mechanic",
		"football",
		"throw",
		"input",
		"bind",
		"variable",
		"mouse",
		"reevent",
		"animation",
		"camera",
	}

	for _,keyword in ipairs(keywords) do
		if text:find(keyword,1,true) then
			return true
		end
	end

	return false
end

local function captureScriptCandidates()
	local roots={
		LP:FindFirstChild("PlayerScripts"),
		ReplicatedStorage:FindFirstChild("Assets"),
		ReplicatedStorage:FindFirstChild("Games"),
		ReplicatedStorage:FindFirstChild("MiniGames"),
		ReplicatedStorage,
	}
	local seen={}
	local captured={}
	local count=0

	for _,root in ipairs(roots) do
		if count>=SCRIPT_CAPTURE_LIMIT then break end
		if root and not seen[root] then
			seen[root]=true
			local candidates={}
			if root:IsA("LocalScript") or root:IsA("ModuleScript") then
				candidates[#candidates+1]=root
			end
			for _,descendant in ipairs(root:GetDescendants()) do
				if count>=SCRIPT_CAPTURE_LIMIT then break end
				if (descendant:IsA("LocalScript") or descendant:IsA("ModuleScript")) and not seen[descendant] then
					seen[descendant]=true
					if scriptLooksRelevant(descendant) then
						candidates[#candidates+1]=descendant
					end
				end
			end

			for _,candidate in ipairs(candidates) do
				if count>=SCRIPT_CAPTURE_LIMIT then break end
				count+=1
				captured[#captured+1]={
					script=serializeValue(candidate,0,{}),
					decompile=decompileSubject(candidate),
				}
			end
		end
	end

	addLog("script_capture",{
		count=count,
		limit=SCRIPT_CAPTURE_LIMIT,
		items=captured,
	})
end

local function exportLogs()
	local payload={
		session={
			id=sessionId,
			player=LP.Name,
			placeId=game.PlaceId,
			jobId=game.JobId,
			clock=os.clock(),
			capabilities={
				hookmetamethod=type(hookmetamethod),
				getnamecallmethod=type(getnamecallmethod),
				newcclosure=type(newcclosure),
				getconnections=type(getconnections),
				decompile=type(decompile),
				bytefall=type(bytefall),
				getscriptbytecode=type(getscriptbytecode),
				setclipboard=type(setclipboard),
				writefile=type(writefile),
				mouse1click=type(mouse1click),
				mouse1press=type(mouse1press),
				virtualInputManager=VirtualInputManager~=nil,
			},
		},
		finalSnapshot=snapshotLocalState("export"),
		logs=logs,
	}

	local ok,json=pcall(function()
		return HttpService:JSONEncode(payload)
	end)
	if not ok then
		return nil,tostring(json)
	end
	return json,nil
end

local function copyOrWriteLogs()
	addLog("manual_export_requested",{snapshot=snapshotLocalState("manual export")})
	local json,err=exportLogs()
	if not json then
		setStatus("Export failed: "..err,Color3.fromRGB(255,105,105))
		return
	end

	if type(setclipboard)=="function" then
		local ok,clipErr=pcall(setclipboard,json)
		if ok then
			setStatus("Copied log JSON to clipboard",Color3.fromRGB(150,255,180))
			return
		end
		addLog("clipboard_failed",{error=tostring(clipErr)})
	end
	if type(toclipboard)=="function" then
		local ok,clipErr=pcall(toclipboard,json)
		if ok then
			setStatus("Copied log JSON to clipboard",Color3.fromRGB(150,255,180))
			return
		end
		addLog("clipboard_failed",{error=tostring(clipErr)})
	end
	if type(writefile)=="function" then
		local fileName="qb_throw_pipeline_log_"..sessionId..".json"
		local ok,fileErr=pcall(writefile,fileName,json)
		if ok then
			setStatus("Wrote "..fileName,Color3.fromRGB(150,255,180))
			return
		end
		addLog("writefile_failed",{error=tostring(fileErr)})
	end

	for startIndex=1,#json,3500 do
		print(json:sub(startIndex,startIndex+3499))
	end
	setStatus("Printed log JSON in console chunks",Color3.fromRGB(255,225,160))
end

local function clearLogs()
	table.clear(logs)
	logIndex=0
	addLog("log_cleared",{snapshot=snapshotLocalState("clear")})
	setStatus("Log cleared",Color3.fromRGB(220,220,220))
end

local function keyCodeToLabel(key)
	if key==nil or key==Enum.KeyCode.Unknown then
		return "NIL"
	end

	local name=tostring(key):gsub("Enum.KeyCode%.","")
	local short={
		LeftControl="LCTRL",
		RightControl="RCTRL",
		LeftShift="LSHIFT",
		RightShift="RSHIFT",
		BackQuote="`",
		Return="ENTER",
		Space="SPACE",
	}

	return short[name] or string.upper(name)
end

local function bindingToLabel(binding)
	if binding==nil or binding==Enum.KeyCode.Unknown then
		return "NIL"
	end

	if type(binding)=="string" then
		local map={
			MouseButton1="LMB",
			MouseButton2="RMB",
			MouseButton3="MMB",
			Touch="TOUCH",
			Gamepad1="PAD1",
			Gamepad2="PAD2",
			Gamepad3="PAD3",
			Gamepad4="PAD4",
			Gamepad5="PAD5",
			Gamepad6="PAD6",
			Gamepad7="PAD7",
			Gamepad8="PAD8",
		}
		return map[binding] or string.upper(binding)
	end

	return keyCodeToLabel(binding)
end

local function inputToBinding(input)
	local key=input.KeyCode
	if key and key~=Enum.KeyCode.Unknown then
		return key
	end

	if input.UserInputType==Enum.UserInputType.MouseButton1 then return "MouseButton1" end
	if input.UserInputType==Enum.UserInputType.MouseButton2 then return "MouseButton2" end
	if input.UserInputType==Enum.UserInputType.MouseButton3 then return "MouseButton3" end
	if input.UserInputType==Enum.UserInputType.Touch then return "Touch" end

	local name=tostring(input.UserInputType):gsub("Enum.UserInputType%.","")
	if name:match("^Gamepad") then
		return name
	end

	return nil
end

local function bindingMatches(input,binding)
	if binding==nil or binding==Enum.KeyCode.Unknown then
		return false
	end

	local incoming=inputToBinding(input)
	return incoming~=nil and incoming==binding
end

local function sendNativeClick()
	if os.clock()-lastClickAt<CLICK_COOLDOWN then
		return false,"Click cooldown"
	end

	lastClickAt=os.clock()

	if type(mouse1click)=="function" then
		local ok,err=pcall(mouse1click)
		if ok then
			return true,"mouse1click"
		end
		return false,tostring(err)
	end

	if type(mouse1press)=="function" and type(mouse1release)=="function" then
		local ok,err=pcall(function()
			mouse1press()
			task.wait()
			mouse1release()
		end)
		if ok then
			return true,"mouse1press"
		end
		return false,tostring(err)
	end

	if VirtualInputManager then
		local pos=UIS:GetMouseLocation()
		local ok,err=pcall(function()
			VirtualInputManager:SendMouseButtonEvent(pos.X,pos.Y,0,true,game,0)
			task.wait()
			VirtualInputManager:SendMouseButtonEvent(pos.X,pos.Y,0,false,game,0)
		end)
		if ok then
			return true,"VirtualInputManager"
		end
		return false,tostring(err)
	end

	return false,"No native click method available"
end

local function triggerThrowInput()
	if currentBinding=="MouseButton1" then
		setStatus("LMB already uses the game's throw input",Color3.fromRGB(255,225,160))
		addLog("native_click_skipped",{reason="binding is MouseButton1",snapshot=snapshotLocalState("skip native click")})
		return
	end

	addLog("native_click_request",{snapshot=snapshotLocalState("before native click")})
	local ok,method=sendNativeClick()
	addLog("native_click_result",{ok=ok,method=method,snapshot=snapshotLocalState("after native click")})

	if ok then
		setStatus("Native throw input sent: "..method,Color3.fromRGB(150,255,180))
	else
		setStatus("Input failed: "..method,Color3.fromRGB(255,105,105))
	end
end

local function makeButton(parent,text,x,y,w,h)
	return new("TextButton",{
		Position=UDim2.fromOffset(x,y),
		Size=UDim2.fromOffset(w,h),
		BackgroundColor3=Color3.fromRGB(38,38,38),
		BorderSizePixel=0,
		Font=Enum.Font.GothamBold,
		Text=text,
		TextColor3=Color3.fromRGB(238,238,238),
		TextSize=11,
		AutoButtonColor=false,
	},parent)
end

local function buildGui()
	local parent=LP:FindFirstChildOfClass("PlayerGui") or LP:WaitForChild("PlayerGui",5) or CoreGui

	screenGui=new("ScreenGui",{
		Name="StandaloneQBThrowKeybind",
		ResetOnSpawn=false,
		IgnoreGuiInset=true,
		ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
	},parent)

	pcall(function()
		screenGui.DisplayOrder=999999
	end)

	local panel=new("Frame",{
		Position=UDim2.fromOffset(80,180),
		Size=UDim2.fromOffset(430,238),
		BackgroundColor3=Color3.fromRGB(14,14,14),
		BorderSizePixel=0,
		Active=true,
	},screenGui)

	new("UIStroke",{
		Color=Color3.fromRGB(185,185,185),
		Transparency=0.35,
		Thickness=1,
	},panel)

	local title=new("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(14,12),
		Size=UDim2.new(1,-58,0,20),
		Font=Enum.Font.GothamBold,
		Text="QB Throw Pipeline Logger",
		TextColor3=Color3.fromRGB(238,238,238),
		TextSize=14,
		TextXAlignment=Enum.TextXAlignment.Left,
	},panel)

	new("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(14,34),
		Size=UDim2.new(1,-28,0,34),
		Font=Enum.Font.Gotham,
		Text="Keybind sends native click. Logger records remotes and local snapshots.",
		TextColor3=Color3.fromRGB(165,165,165),
		TextSize=11,
		TextWrapped=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextYAlignment=Enum.TextYAlignment.Top,
	},panel)

	local close=new("TextButton",{
		AnchorPoint=Vector2.new(1,0),
		Position=UDim2.new(1,-10,0,10),
		Size=UDim2.fromOffset(28,24),
		BackgroundColor3=Color3.fromRGB(32,32,32),
		BorderSizePixel=0,
		Font=Enum.Font.GothamBold,
		Text="X",
		TextColor3=Color3.fromRGB(238,238,238),
		TextSize=12,
		AutoButtonColor=false,
	},panel)

	new("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(14,76),
		Size=UDim2.fromOffset(120,20),
		Font=Enum.Font.GothamMedium,
		Text="Throw key",
		TextColor3=Color3.fromRGB(225,225,225),
		TextSize=12,
		TextXAlignment=Enum.TextXAlignment.Left,
	},panel)

	keyButton=new("TextButton",{
		Position=UDim2.fromOffset(138,72),
		Size=UDim2.fromOffset(176,30),
		BackgroundColor3=Color3.fromRGB(30,30,30),
		BorderSizePixel=0,
		Font=Enum.Font.GothamBold,
		Text=bindingToLabel(currentBinding),
		TextColor3=Color3.fromRGB(238,238,238),
		TextSize=12,
		AutoButtonColor=false,
	},panel)

	logCountLabel=new("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(324,76),
		Size=UDim2.fromOffset(92,20),
		Font=Enum.Font.Gotham,
		Text="Logs: 0",
		TextColor3=Color3.fromRGB(165,165,165),
		TextSize=11,
		TextXAlignment=Enum.TextXAlignment.Right,
	},panel)

	local sendButton=makeButton(panel,"SEND CLICK",14,116,120,30)
	local copyButton=makeButton(panel,"COPY LOG",144,116,90,30)
	local clearButton=makeButton(panel,"CLEAR",244,116,72,30)
	local captureButton=makeButton(panel,"CAPTURE",326,116,90,30)

	statusLabel=new("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(14,160),
		Size=UDim2.new(1,-28,0,54),
		Font=Enum.Font.Gotham,
		Text="Ready",
		TextColor3=Color3.fromRGB(170,255,190),
		TextSize=11,
		TextWrapped=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextYAlignment=Enum.TextYAlignment.Top,
	},panel)

	local dragStart=nil
	local panelStart=nil
	connect(title.InputBegan,function(input)
		if input.UserInputType~=Enum.UserInputType.MouseButton1 and input.UserInputType~=Enum.UserInputType.Touch then
			return
		end

		dragStart=input.Position
		panelStart=panel.Position
	end)

	connect(UIS.InputChanged,function(input)
		if not dragStart then return end
		if input.UserInputType~=Enum.UserInputType.MouseMovement and input.UserInputType~=Enum.UserInputType.Touch then
			return
		end

		local delta=input.Position-dragStart
		panel.Position=UDim2.new(panelStart.X.Scale,panelStart.X.Offset+delta.X,panelStart.Y.Scale,panelStart.Y.Offset+delta.Y)
	end)

	connect(UIS.InputEnded,function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
			dragStart=nil
			panelStart=nil
		end
	end)

	local function buttonHover(button,normal,hover)
		connect(button.MouseEnter,function()
			TweenService:Create(button,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3=hover}):Play()
		end)
		connect(button.MouseLeave,function()
			TweenService:Create(button,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3=normal}):Play()
		end)
	end

	buttonHover(close,Color3.fromRGB(32,32,32),Color3.fromRGB(70,32,32))
	for _,button in ipairs({keyButton,sendButton,copyButton,clearButton,captureButton}) do
		buttonHover(button,button.BackgroundColor3,Color3.fromRGB(54,54,54))
	end

	connect(keyButton.Activated,function()
		capturing=true
		keyButton.Text="PRESS..."
		setStatus("Press a key/button. Esc cancels. Backspace clears.",Color3.fromRGB(255,225,160))
	end)

	connect(sendButton.Activated,function()
		triggerThrowInput()
	end)
	connect(copyButton.Activated,function()
		copyOrWriteLogs()
	end)
	connect(clearButton.Activated,function()
		clearLogs()
	end)
	connect(captureButton.Activated,function()
		captureRemoteConnections()
		captureScriptCandidates()
		setStatus("Captured remote/script decompiler info",Color3.fromRGB(150,255,180))
	end)

	local api
	api={
		Destroy=function()
			disconnectAll()
			if loggerState and loggerState.activeSession==sessionId then
				loggerState.activeSession=nil
				loggerState.emit=nil
			end
			if screenGui then
				screenGui:Destroy()
				screenGui=nil
			end
			if type(runtimeOwner)=="table" and rawget(runtimeOwner,RUNTIME_KEY)==api then
				rawset(runtimeOwner,RUNTIME_KEY,nil)
			end
		end,
	}

	connect(close.Activated,function()
		api:Destroy()
	end)

	return api
end

local api=buildGui()

connect(UIS.InputBegan,function(input,processed)
	if capturing then
		if input.KeyCode==Enum.KeyCode.Escape then
			capturing=false
			keyButton.Text=bindingToLabel(currentBinding)
			setStatus("Capture cancelled",Color3.fromRGB(220,220,220))
			return
		end

		if input.KeyCode==Enum.KeyCode.Backspace or input.KeyCode==Enum.KeyCode.Delete then
			currentBinding=Enum.KeyCode.Unknown
			capturing=false
			keyButton.Text=bindingToLabel(currentBinding)
			setStatus("Throw key cleared",Color3.fromRGB(220,220,220))
			addLog("binding_cleared",{snapshot=snapshotLocalState("binding cleared")})
			return
		end

		local binding=inputToBinding(input)
		if binding then
			currentBinding=binding
			capturing=false
			keyButton.Text=bindingToLabel(currentBinding)
			setStatus("Throw key set to "..bindingToLabel(currentBinding),Color3.fromRGB(170,255,190))
			addLog("binding_set",{binding=serializeValue(currentBinding,0,{}),snapshot=snapshotLocalState("binding set")})
		end

		return
	end

	if processed or UIS:GetFocusedTextBox() then
		return
	end

	if bindingMatches(input,currentBinding) then
		triggerThrowInput()
	end
end)

if type(runtimeOwner)=="table" then
	rawset(runtimeOwner,RUNTIME_KEY,api)
end

addLog("session_started",{
	snapshot=snapshotLocalState("start"),
	capabilities={
		hookmetamethod=type(hookmetamethod),
		getnamecallmethod=type(getnamecallmethod),
		newcclosure=type(newcclosure),
		getconnections=type(getconnections),
		decompile=type(decompile),
		bytefall=type(bytefall),
		getscriptbytecode=type(getscriptbytecode),
		mouse1click=type(mouse1click),
		mouse1press=type(mouse1press),
		virtualInputManager=VirtualInputManager~=nil,
	},
})
installOutgoingHooks()
bindIncomingRemotes()
setStatus("Ready - key is "..bindingToLabel(currentBinding)..". Throw, then COPY LOG.",Color3.fromRGB(170,255,190))
