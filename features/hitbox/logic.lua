local hitbox={}

local players=game:GetService("Players")
local inputService=game:GetService("UserInputService")

local me=players.LocalPlayer
local zeroVector=Vector3.new(0,0,0)
local defaultSizeX=2.52
local defaultSizeY=5.4
local defaultSizeZ=1.41
local defaultTransparency=0.7
local hitboxToggleKey=Enum.KeyCode.Unknown

local function clampNumber(value,min,max,fallback)
	local n=tonumber(value)
	if not n then return fallback end
	return math.clamp(n,min,max)
end

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
end

local function getDirectChildCount(folder)
	if not folder then return 0 end
	return #folder:GetChildren()
end

local function folderHasAnyDescendants(folder)
	if not folder then return false end
	return #folder:GetDescendants()>0
end

function hitbox.new(app,parent)
	local safeDisconnect=app.safeDisconnect
	local inputToBinding=app.inputToBinding
	local make=app.New
	local colors=app.colors
	local makeSection=app.makeSection
	local buildSlider=app.buildSlider
	local fmtNumber=app.fmtNumber
	local state=app.State
	local api={}
	local toggle=nil
	local boxX=nil
	local boxY=nil
	local boxZ=nil
	local transparencySlider=nil
	local inputConn=nil
	local workspaceConn=nil
	local destroyConn=nil
	local section=nil
	local alive=true
	local currentMode=1
	local currentModeKey="mode1"
	local currentModeLabel="Gameplay"
	local watchers=setmetatable({}, {__mode="k"})
	local originalParts=app.hitboxOriginals or {
		Transparency=setmetatable({}, {__mode="k"}),
		Size=setmetatable({}, {__mode="k"}),
	}

	local function safeDisconnectAll(t)
		if not t then return end

		for _,connection in ipairs(t) do
			safeDisconnect(connection)
		end

		table.clear(t)
	end

	local function changed()
		if app.onChanged then pcall(app.onChanged,state) end
	end

	local function isAlive()
		return alive and (section==nil or section.Parent~=nil)
	end

	local function normalizeState()
		state.hitboxOn=state.hitboxOn and true or false
		state.sizeX=clampNumber(state.sizeX,0.2,50,defaultSizeX)
		state.sizeY=clampNumber(state.sizeY,0.2,50,defaultSizeY)
		state.sizeZ=clampNumber(state.sizeZ,0.2,50,defaultSizeZ)
		state.targetTransparency=clampNumber(state.targetTransparency,0,1,defaultTransparency)
	end

	local function targetSize()
		return Vector3.new(state.sizeX,state.sizeY,state.sizeZ)
	end

	local function syncModeToCtx()
		if app.setCurrentMode then
			pcall(app.setCurrentMode,currentModeKey,currentModeLabel)
		end
	end

	local function detectWorkspaceMode()
		local miniGames=workspace:FindFirstChild("MiniGames")
		local miniCount=getDirectChildCount(miniGames)

		if miniCount>1 then
			return 2,"mode2","Park"
		elseif miniCount==1 then
			return 3,"mode3","Squads"
		end

		local games=workspace:FindFirstChild("Games")
		if getDirectChildCount(games)>0 or folderHasAnyDescendants(games) then
			return 1,"mode1","Gameplay"
		end

		return 1,"mode1","Gameplay"
	end

	local function updateCurrentModeFromWorkspace()
		local mode,key,label=detectWorkspaceMode()
		local changedMode=mode~=currentMode or key~=currentModeKey or label~=currentModeLabel

		currentMode=mode
		currentModeKey=key
		currentModeLabel=label

		if changedMode then
			syncModeToCtx()
		end

		return changedMode
	end

	local function ensureWatcher(inst)
		watchers[inst]=watchers[inst] or{
			cons={},
			parts={},
			partConns=setmetatable({}, {__mode="k"}),
			origT=setmetatable({}, {__mode="k"}),
			origS=setmetatable({}, {__mode="k"}),
			attached=false,
		}

		return watchers[inst]
	end

	local function applyVisuals(w,on)
		if not w then return end

		for i=#w.parts,1,-1 do
			local part=w.parts[i]

			if not(part and part.Parent) then
				table.remove(w.parts,i)
			elseif part:IsA("BasePart") then
				if on then
					if part.Transparency~=state.targetTransparency then
						part.Transparency=state.targetTransparency
					end

					local size=targetSize()
					if size~=zeroVector and part.Size~=size then
						part.Size=size
					end
				else
					if w.origT[part]~=nil and part.Transparency~=w.origT[part] then
						part.Transparency=w.origT[part]
					end

					if w.origS[part]~=nil and part.Size~=w.origS[part] then
						part.Size=w.origS[part]
					end
				end
			end
		end
	end

	local function trackPart(w,part)
		if not isAlive() then return end
		if not part:IsA("BasePart") then return end

		if not table.find(w.parts,part) then
			table.insert(w.parts,part)
		end

		if originalParts.Transparency[part]==nil then
			originalParts.Transparency[part]=part.Transparency
		end

		if originalParts.Size[part]==nil then
			originalParts.Size[part]=part.Size
		end

		w.origT[part]=originalParts.Transparency[part]
		w.origS[part]=originalParts.Size[part]

		if not w.partConns[part] then
			w.partConns[part]={}

			table.insert(w.partConns[part],part:GetPropertyChangedSignal("Size"):Connect(function()
				if isAlive() and state.hitboxOn then
					local size=targetSize()

					if size~=zeroVector and part.Size~=size then
						part.Size=size
					end
				end
			end))

			table.insert(w.partConns[part],part:GetPropertyChangedSignal("Transparency"):Connect(function()
				if isAlive() and state.hitboxOn and part.Transparency~=state.targetTransparency then
					part.Transparency=state.targetTransparency
				end
			end))

			table.insert(w.partConns[part],part.AncestryChanged:Connect(function(_,instParent)
				if instParent==nil then
					safeDisconnectAll(w.partConns[part])
					w.partConns[part]=nil
				end
			end))
		end

		if state.hitboxOn then
			part.Transparency=state.targetTransparency

			local size=targetSize()
			if size~=zeroVector then
				part.Size=size
			end
		end
	end

	local function attachNode(node)
		if not isAlive() or not node then return end

		local w=ensureWatcher(node)
		if w.attached then
			applyVisuals(w,state.hitboxOn)
			return
		end

		w.attached=true

		for _,descendant in ipairs(node:GetDescendants()) do
			if descendant:IsA("BasePart") then
				trackPart(w,descendant)
			end
		end

		if node:IsA("BasePart") then
			trackPart(w,node)
		end

		table.insert(w.cons,node.DescendantAdded:Connect(function(descendant)
			if isAlive() and descendant:IsA("BasePart") then
				trackPart(w,descendant)
			end
		end))

		table.insert(w.cons,node.AncestryChanged:Connect(function(_,instParent)
			if instParent==nil then
				applyVisuals(w,false)

				for _,conns in pairs(w.partConns) do
					safeDisconnectAll(conns)
				end

				w.partConns=setmetatable({}, {__mode="k"})
				safeDisconnectAll(w.cons)
				watchers[node]=nil
			end
		end))

		applyVisuals(w,state.hitboxOn)
	end

	local function hookHitboxesFolder(hitboxes)
		if not isAlive() or not hitboxes then return end

		local w=ensureWatcher(hitboxes)
		if w.attached then return end
		w.attached=true

		local myNode=hitboxes:FindFirstChild(me.Name)
		if myNode then
			attachNode(myNode)
		end

		table.insert(w.cons,hitboxes.ChildAdded:Connect(function(child)
			if isAlive() and child.Name==me.Name then
				attachNode(child)
			end
		end))

		table.insert(w.cons,hitboxes.AncestryChanged:Connect(function(_,instParent)
			if instParent==nil then
				safeDisconnectAll(w.cons)
				watchers[hitboxes]=nil
			end
		end))
	end

	local function attachGameFolder(gameFolder)
		if not isAlive() or not gameFolder then return end

		local w=ensureWatcher(gameFolder)
		if w.attached then return end
		w.attached=true

		local replicated=gameFolder:FindFirstChild("Replicated")
		local hitboxes=replicated and replicated:FindFirstChild("Hitboxes")

		if hitboxes then
			hookHitboxesFolder(hitboxes)
		end

		table.insert(w.cons,gameFolder.DescendantAdded:Connect(function(descendant)
			if not isAlive() then return end

			if descendant:IsA("Folder") or descendant:IsA("Model") then
				if descendant.Name=="Hitboxes" and descendant.Parent and descendant.Parent.Name=="Replicated" then
					hookHitboxesFolder(descendant)
				elseif descendant.Name==me.Name and descendant.Parent and descendant.Parent.Name=="Hitboxes" then
					attachNode(descendant)
				end
			end
		end))

		table.insert(w.cons,gameFolder.AncestryChanged:Connect(function(_,instParent)
			if instParent==nil then
				safeDisconnectAll(w.cons)
				watchers[gameFolder]=nil
			end
		end))
	end

	local function attachMiniGameFolder(miniGameFolder)
		if not isAlive() or not miniGameFolder then return end

		local w=ensureWatcher(miniGameFolder)
		if w.attached then return end
		w.attached=true

		local replicated=miniGameFolder:FindFirstChild("Replicated")
		local hitboxes=replicated and replicated:FindFirstChild("Hitboxes")

		if hitboxes then
			hookHitboxesFolder(hitboxes)
		end

		table.insert(w.cons,miniGameFolder.DescendantAdded:Connect(function(descendant)
			if not isAlive() then return end

			if descendant:IsA("Folder") or descendant:IsA("Model") then
				if descendant.Name=="Hitboxes"
					and descendant.Parent
					and descendant.Parent.Name=="Replicated"
					and descendant.Parent.Parent==miniGameFolder then
					hookHitboxesFolder(descendant)
				elseif descendant.Name==me.Name
					and descendant.Parent
					and descendant.Parent.Name=="Hitboxes"
					and descendant.Parent.Parent
					and descendant.Parent.Parent.Name=="Replicated"
					and descendant.Parent.Parent.Parent==miniGameFolder then
					attachNode(descendant)
				end
			end
		end))

		table.insert(w.cons,miniGameFolder.AncestryChanged:Connect(function(_,instParent)
			if instParent==nil then
				safeDisconnectAll(w.cons)
				watchers[miniGameFolder]=nil
			end
		end))
	end

	local function scanAllGames()
		if not isAlive() then return end

		local games=workspace:FindFirstChild("Games")
		if not games then return end

		local w=ensureWatcher(games)
		if not w.attached then
			w.attached=true

			table.insert(w.cons,games.ChildAdded:Connect(function(gameFolder)
				if isAlive() then
					attachGameFolder(gameFolder)
				end
			end))

			table.insert(w.cons,games.AncestryChanged:Connect(function(_,instParent)
				if instParent==nil then
					safeDisconnectAll(w.cons)
					watchers[games]=nil
				end
			end))
		end

		for _,gameFolder in ipairs(games:GetChildren()) do
			attachGameFolder(gameFolder)
		end
	end

	local function scanAllMiniGames()
		if not isAlive() then return end

		local miniGames=workspace:FindFirstChild("MiniGames")
		if not miniGames then return end

		local w=ensureWatcher(miniGames)
		if not w.attached then
			w.attached=true

			table.insert(w.cons,miniGames.ChildAdded:Connect(function(miniGameFolder)
				if isAlive() then
					attachMiniGameFolder(miniGameFolder)
				end
			end))

			table.insert(w.cons,miniGames.AncestryChanged:Connect(function(_,instParent)
				if instParent==nil then
					safeDisconnectAll(w.cons)
					watchers[miniGames]=nil
				end
			end))
		end

		for _,miniGameFolder in ipairs(miniGames:GetChildren()) do
			attachMiniGameFolder(miniGameFolder)
		end
	end

	local function forEachWatcherPartsApply(on)
		for _,w in pairs(watchers) do
			if type(w)=="table" and w.parts then
				applyVisuals(w,on)
			end
		end
	end

	local function clearAllWatchersAndRestore()
		for inst,w in pairs(watchers) do
			if type(w)=="table" then
				if w.parts then
					applyVisuals(w,false)
				end

				if w.partConns then
					for _,conns in pairs(w.partConns) do
						safeDisconnectAll(conns)
					end
				end

				if w.cons then
					safeDisconnectAll(w.cons)
				end

				watchers[inst]=nil
			end
		end
	end

	local function scanCurrentModeFolders()
		if not isAlive() then return end

		updateCurrentModeFromWorkspace()
		clearAllWatchersAndRestore()

		if currentMode==1 then
			scanAllGames()
		elseif currentMode==2 then
			scanAllMiniGames()
		elseif currentMode==3 then
			local miniGames=workspace:FindFirstChild("MiniGames")
			local onlyChild=miniGames and miniGames:GetChildren()[1]

			if onlyChild then
				attachMiniGameFolder(onlyChild)
			end
		end
	end

	local function paintToggle()
		if toggle then toggle.set(state.hitboxOn) end
	end

	local function syncReadouts()
		if boxX then boxX.Text="X: "..fmtNumber(state.sizeX,2) end
		if boxY then boxY.Text="Y: "..fmtNumber(state.sizeY,2) end
		if boxZ then boxZ.Text="Z: "..fmtNumber(state.sizeZ,2) end
		if transparencySlider then transparencySlider.set(state.targetTransparency) end
		paintToggle()
	end

	function api.SetHitboxSize(x,y,z,fire)
		state.sizeX=clampNumber(x,0.2,50,defaultSizeX)
		state.sizeY=clampNumber(y,0.2,50,defaultSizeY)
		state.sizeZ=clampNumber(z,0.2,50,defaultSizeZ)

		if state.hitboxOn then
			forEachWatcherPartsApply(true)
		end

		syncReadouts()

		if fire~=false then
			changed()
		end
	end

	function api.SetTransparency(value,fire)
		state.targetTransparency=clampNumber(value,0,1,defaultTransparency)

		if state.hitboxOn then
			forEachWatcherPartsApply(true)
		end

		syncReadouts()

		if fire~=false then
			changed()
		end
	end

	function api.SetHitboxLock(value,fire)
		state.hitboxOn=value and true or false
		forEachWatcherPartsApply(state.hitboxOn)
		paintToggle()

		if fire~=false then
			changed()
		end
	end

	function api.Refresh()
		normalizeState()
		scanCurrentModeFolders()
		forEachWatcherPartsApply(state.hitboxOn)
		syncReadouts()
	end

	function api.Reset()
		api.SetHitboxLock(false,false)
		state.sizeX=defaultSizeX
		state.sizeY=defaultSizeY
		state.sizeZ=defaultSizeZ
		state.targetTransparency=defaultTransparency
		api.Refresh()
		changed()
	end

	function api.Destroy()
		if not alive then return end
		alive=false

		safeDisconnect(inputConn)
		inputConn=nil
		safeDisconnect(workspaceConn)
		workspaceConn=nil
		safeDisconnect(destroyConn)
		destroyConn=nil
		destroyControl(toggle)
		destroyControl(transparencySlider)
		clearAllWatchersAndRestore()
	end

	normalizeState()
	updateCurrentModeFromWorkspace()
	syncModeToCtx()

	local sectionControls=nil
	section,sectionControls=makeSection(parent,1,"Hitbox","",{
		headerToggle={
			startState=state.hitboxOn,
			onChange=function(value)
				api.SetHitboxLock(value,true)
			end,
		},
	})
	toggle=sectionControls and sectionControls.toggle

	make("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text="HITBOX SIZE",Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=colors.muted,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)

	local sizeReadout=make("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,24),ZIndex=5},section)
	make("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,0),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Left},sizeReadout)

	local function makeReadout(prefix)
		return make("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(0.333,0,1,0),Text=prefix,Font=Enum.Font.Gotham,TextSize=13,TextColor3=colors.text,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=6},sizeReadout)
	end

	boxX=makeReadout("X: "..fmtNumber(state.sizeX,2))
	boxY=makeReadout("Y: "..fmtNumber(state.sizeY,2))
	boxZ=makeReadout("Z: "..fmtNumber(state.sizeZ,2))

	make("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text="TRANSPARENCY",Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=colors.muted,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)

	transparencySlider=buildSlider(section,"Alpha",0,1,state.targetTransparency,2,function(value)
		api.SetTransparency(value,true)
	end)

	local function handleToggleInput(input)
		local hitboxKey=hitboxToggleKey
		if app.getHitboxToggleKey then
			hitboxKey=app.getHitboxToggleKey() or Enum.KeyCode.Unknown
		end

		if hitboxKey==nil or hitboxKey==Enum.KeyCode.Unknown then return false end

		local binding=inputToBinding(input)
		if binding==hitboxKey then
			api.SetHitboxLock(not state.hitboxOn,true)
			return true
		end

		return false
	end

	inputConn=inputService.InputBegan:Connect(function(input,processed)
		if processed then return end
		handleToggleInput(input)
	end)

	workspaceConn=workspace.ChildAdded:Connect(function(child)
		if child.Name=="Games" or child.Name=="MiniGames" then
			task.defer(function()
				if isAlive() then
					api.Refresh()
				end
			end)
		end
	end)

	destroyConn=section.AncestryChanged:Connect(function()
		if not isAlive() then
			api.Destroy()
		end
	end)

	api.Refresh()
	return api
end

return hitbox
