-- hitbox.lua
-- Complete hitbox watcher module, with mode‑aware scanning.
-- Public API: init(), setSize(x,y,z), setAlpha(a), setOn(state), isOn(), getSize(), getAlpha(), rescan(mode), destroy()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local me = Players.LocalPlayer
local ZERO = Vector3.new(0, 0, 0)

-- ---------- state ----------
local hitboxOn = false
local toolAlive = true
local sizeX, sizeY, sizeZ = 2.52, 5.4, 1.41
local targetTransparency = 0.7
local CURRENT_MODE = 1   -- 1=Games, 2=Park, 3=Squads

-- ---------- helpers ----------
local watchers = setmetatable({}, { __mode = "k" })

local function safeDisconnect(conn)
	if conn and typeof(conn) == "RBXScriptConnection" then
		pcall(function() conn:Disconnect() end)
	end
end

local function safeDisconnectAll(t)
	if not t then return end
	for _, c in ipairs(t) do
		safeDisconnect(c)
	end
	table.clear(t)
end

local function ensureWatcher(inst)
	watchers[inst] = watchers[inst] or {
		cons = {},
		parts = {},
		partConns = setmetatable({}, { __mode = "k" }),
		origT = setmetatable({}, { __mode = "k" }),
		origS = setmetatable({}, { __mode = "k" }),
	}
	return watchers[inst]
end

local function applyVisuals(w, on)
	if not w then return end
	for i = #w.parts, 1, -1 do
		local p = w.parts[i]
		if not (p and p.Parent) then
			table.remove(w.parts, i)
		elseif p:IsA("BasePart") then
			if on then
				if p.Transparency ~= targetTransparency then
					p.Transparency = targetTransparency
				end
				local targetSize = Vector3.new(sizeX, sizeY, sizeZ)
				if targetSize ~= ZERO and p.Size ~= targetSize then
					p.Size = targetSize
				end
			else
				if w.origT[p] ~= nil and p.Transparency ~= w.origT[p] then
					p.Transparency = w.origT[p]
				end
				if w.origS[p] ~= nil and p.Size ~= w.origS[p] then
					p.Size = w.origS[p]
				end
			end
		end
	end
end

local function trackPart(w, part)
	if not toolAlive then return end
	if not part:IsA("BasePart") then return end

	if not table.find(w.parts, part) then
		table.insert(w.parts, part)
	end

	if w.origT[part] == nil then
		w.origT[part] = part.Transparency
	end
	if w.origS[part] == nil then
		w.origS[part] = part.Size
	end

	if not w.partConns[part] then
		w.partConns[part] = {}

		local c1 = part:GetPropertyChangedSignal("Size"):Connect(function()
			if toolAlive and hitboxOn then
				local targetSize = Vector3.new(sizeX, sizeY, sizeZ)
				if targetSize ~= ZERO and part.Size ~= targetSize then
					part.Size = targetSize
				end
			end
		end)
		local c2 = part:GetPropertyChangedSignal("Transparency"):Connect(function()
			if toolAlive and hitboxOn and part.Transparency ~= targetTransparency then
				part.Transparency = targetTransparency
			end
		end)
		local c3 = part.AncestryChanged:Connect(function(_, parent)
			if parent == nil then
				safeDisconnectAll(w.partConns[part])
				w.partConns[part] = nil
			end
		end)

		table.insert(w.partConns[part], c1)
		table.insert(w.partConns[part], c2)
		table.insert(w.partConns[part], c3)
	end

	if hitboxOn then
		part.Transparency = targetTransparency
		local targetSize = Vector3.new(sizeX, sizeY, sizeZ)
		if targetSize ~= ZERO then
			part.Size = targetSize
		end
	end
end

local function attachNode(node)
	if not toolAlive then return end
	if not node then return end

	local w = ensureWatcher(node)

	for _, d in ipairs(node:GetDescendants()) do
		if d:IsA("BasePart") then
			trackPart(w, d)
		end
	end

	if node:IsA("BasePart") then
		trackPart(w, node)
	end

	table.insert(w.cons, node.DescendantAdded:Connect(function(d)
		if toolAlive and d:IsA("BasePart") then
			trackPart(w, d)
		end
	end))

	table.insert(w.cons, node.AncestryChanged:Connect(function(_, parent)
		if parent == nil then
			applyVisuals(w, false)
			for _, conns in pairs(w.partConns) do
				safeDisconnectAll(conns)
			end
			w.partConns = setmetatable({}, { __mode = "k" })
			safeDisconnectAll(w.cons)
			watchers[node] = nil
		end
	end))

	applyVisuals(w, hitboxOn)
end

local function hookHitboxesFolder(hitboxes)
	if not toolAlive then return end
	if not hitboxes then return end

	ensureWatcher(hitboxes)
	local myNode = hitboxes:FindFirstChild(me.Name)
	if myNode then attachNode(myNode) end

	local w = ensureWatcher(hitboxes)
	table.insert(w.cons, hitboxes.ChildAdded:Connect(function(c)
		if toolAlive and c.Name == me.Name then
			attachNode(c)
		end
	end))
	table.insert(w.cons, hitboxes.AncestryChanged:Connect(function(_, parent)
		if parent == nil then
			safeDisconnectAll(w.cons)
			watchers[hitboxes] = nil
		end
	end))
end

-- Mode 1: workspace.Games
local function attachGameFolder(gameFolder)
	if not toolAlive then return end
	if not gameFolder then return end

	ensureWatcher(gameFolder)
	local replicated = gameFolder:FindFirstChild("Replicated")
	local hitboxes = replicated and replicated:FindFirstChild("Hitboxes")
	if hitboxes then hookHitboxesFolder(hitboxes) end

	local w = ensureWatcher(gameFolder)
	table.insert(w.cons, gameFolder.DescendantAdded:Connect(function(d)
		if not toolAlive then return end
		if (d:IsA("Folder") or d:IsA("Model")) then
			if d.Name == "Hitboxes" and d.Parent and d.Parent.Name == "Replicated" then
				hookHitboxesFolder(d)
			elseif d.Name == me.Name and d.Parent and d.Parent.Name == "Hitboxes" then
				attachNode(d)
			end
		end
	end))
	table.insert(w.cons, gameFolder.AncestryChanged:Connect(function(_, parent)
		if parent == nil then
			safeDisconnectAll(w.cons)
			watchers[gameFolder] = nil
		end
	end))
end

local function scanAllGames()
	if not toolAlive then return end
	local games = workspace:FindFirstChild("Games")
	if not games then return end
	ensureWatcher(games)

	for _, gameFolder in ipairs(games:GetChildren()) do
		attachGameFolder(gameFolder)
	end

	local w = ensureWatcher(games)
	table.insert(w.cons, games.ChildAdded:Connect(function(gameFolder)
		if toolAlive then attachGameFolder(gameFolder) end
	end))
	table.insert(w.cons, games.AncestryChanged:Connect(function(_, parent)
		if parent == nil then
			safeDisconnectAll(w.cons)
			watchers[games] = nil
		end
	end))
end

-- Mode 2 & 3: workspace.MiniGames
local function attachMiniGameFolder(miniGameFolder)
	if not toolAlive then return end
	if not miniGameFolder then return end

	ensureWatcher(miniGameFolder)
	local replicated = miniGameFolder:FindFirstChild("Replicated")
	local hitboxes = replicated and replicated:FindFirstChild("Hitboxes")
	if hitboxes then hookHitboxesFolder(hitboxes) end

	local w = ensureWatcher(miniGameFolder)
	table.insert(w.cons, miniGameFolder.DescendantAdded:Connect(function(d)
		if not toolAlive then return end
		if d:IsA("Folder") or d:IsA("Model") then
			if d.Name == "Hitboxes"
				and d.Parent
				and d.Parent.Name == "Replicated"
				and d.Parent.Parent == miniGameFolder then
				hookHitboxesFolder(d)
			elseif d.Name == me.Name
				and d.Parent
				and d.Parent.Name == "Hitboxes"
				and d.Parent.Parent
				and d.Parent.Parent.Name == "Replicated"
				and d.Parent.Parent.Parent == miniGameFolder then
				attachNode(d)
			end
		end
	end))
	table.insert(w.cons, miniGameFolder.AncestryChanged:Connect(function(_, parent)
		if parent == nil then
			safeDisconnectAll(w.cons)
			watchers[miniGameFolder] = nil
		end
	end))
end

local function scanAllMiniGames()
	if not toolAlive then return end
	local miniGames = workspace:FindFirstChild("MiniGames")
	if not miniGames then return end
	ensureWatcher(miniGames)

	for _, miniGameFolder in ipairs(miniGames:GetChildren()) do
		attachMiniGameFolder(miniGameFolder)
	end

	local w = ensureWatcher(miniGames)
	table.insert(w.cons, miniGames.ChildAdded:Connect(function(miniGameFolder)
		if toolAlive then attachMiniGameFolder(miniGameFolder) end
	end))
	table.insert(w.cons, miniGames.AncestryChanged:Connect(function(_, parent)
		if parent == nil then
			safeDisconnectAll(w.cons)
			watchers[miniGames] = nil
		end
	end))
end

local function scanCurrentMode()
	-- clear existing watchers (restore visuals first)
	for _, w in pairs(watchers) do
		if type(w) == "table" and w.parts then
			applyVisuals(w, false)
		end
		for inst, wData in pairs(watchers) do
			if type(wData) == "table" then
				if wData.cons then safeDisconnectAll(wData.cons) end
				if wData.partConns then
					for _, conns in pairs(wData.partConns) do
						safeDisconnectAll(conns)
					end
				end
				watchers[inst] = nil
			end
		end
	end

	if CURRENT_MODE == 1 then
		scanAllGames()
	elseif CURRENT_MODE == 2 then
		scanAllMiniGames()
	elseif CURRENT_MODE == 3 then
		-- Squads: only the single MiniGames child
		local miniGames = workspace:FindFirstChild("MiniGames")
		local onlyChild = miniGames and miniGames:GetChildren()[1]
		if onlyChild then
			attachMiniGameFolder(onlyChild)
		end
	end
end

-- ---------- public API ----------
local module = {}

function module.init()
	toolAlive = true
	scanCurrentMode()
end

function module.rescan(mode)
	mode = mode or 1
	CURRENT_MODE = math.clamp(mode, 1, 3)
	scanCurrentMode()
end

function module.destroy()
	toolAlive = false
	module.setOn(false)
	-- kill all watchers
	for inst, w in pairs(watchers) do
		if type(w) == "table" then
			if w.parts then applyVisuals(w, false) end
			if w.partConns then
				for _, conns in pairs(w.partConns) do
					safeDisconnectAll(conns)
				end
			end
			if w.cons then safeDisconnectAll(w.cons) end
			watchers[inst] = nil
		end
	end
end

function module.setSize(x, y, z)
	x = math.clamp(x, 0.2, 50)
	y = math.clamp(y, 0.2, 50)
	z = math.clamp(z, 0.2, 50)
	sizeX, sizeY, sizeZ = x, y, z
	if hitboxOn then
		for _, w in pairs(watchers) do
			applyVisuals(w, true)
		end
	end
end

function module.getSize()
	return sizeX, sizeY, sizeZ
end

function module.setAlpha(a)
	targetTransparency = math.clamp(a, 0, 1)
	if hitboxOn then
		for _, w in pairs(watchers) do
			applyVisuals(w, true)
		end
	end
end

function module.getAlpha()
	return targetTransparency
end

function module.setOn(state)
	if not toolAlive then return end
	hitboxOn = state
	for _, w in pairs(watchers) do
		applyVisuals(w, hitboxOn)
	end
end

function module.isOn()
	return hitboxOn
end

return module