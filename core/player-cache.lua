local playerCacheApi = {}
playerCacheApi.__index = playerCacheApi

local validTeamIds = {
	HomeTeam = true,
	AwayTeam = true,
}

local teamCacheSeconds = 0.5

local function safeDisconnect(connection)
	if connection and typeof(connection) == "RBXScriptConnection" then
		pcall(function()
			connection:Disconnect()
		end)
	end
end

local function getLiveCharacter(workspaceService, player)
	if not player then
		return nil
	end

	local workspaceCharacter = workspaceService and workspaceService:FindFirstChild(player.Name)
	if workspaceCharacter and workspaceCharacter:IsA("Model") then
		return workspaceCharacter
	end

	if player.Character and player.Character:IsA("Model") then
		return player.Character
	end

	return nil
end

local function getRoot(character)
	if not character then
		return nil
	end

	local primary = character.PrimaryPart
	if primary and primary:IsA("BasePart") then
		return primary
	end

	return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
end

local function readTeamId(player)
	local replicated = player and player:FindFirstChild("Replicated")
	local teamValue = replicated and replicated:FindFirstChild("TeamID")
	if not teamValue then
		return nil
	end

	if teamValue:IsA("StringValue") or teamValue:IsA("IntValue") or teamValue:IsA("NumberValue") then
		return tostring(teamValue.Value)
	end

	local ok, value = pcall(function()
		return teamValue.Value
	end)

	if ok then
		return tostring(value)
	end

	return nil
end

function playerCacheApi.new(playersService, workspaceService, scope)
	local self = setmetatable({
		_playersService = playersService or game:GetService("Players"),
		_workspace = workspaceService or game:GetService("Workspace"),
		_scope = scope,
		_players = {},
		_entries = {},
		_connections = {},
		_destroyed = false,
	}, playerCacheApi)

	if scope and type(scope.add) == "function" then
		scope:add(self)
	end

	for _, player in ipairs(self._playersService:GetPlayers()) do
		self:_addPlayer(player)
	end

	self:_connect(self._playersService.PlayerAdded, function(player)
		self:_addPlayer(player)
	end)

	self:_connect(self._playersService.PlayerRemoving, function(player)
		self:_removePlayer(player)
	end)

	return self
end

function playerCacheApi:_connect(signal, callback)
	if not signal or type(signal.Connect) ~= "function" then
		return nil
	end

	local ok, connection = pcall(function()
		return signal:Connect(callback)
	end)

	if ok and connection then
		self._connections[#self._connections + 1] = connection
		return connection
	end

	return nil
end

function playerCacheApi:_bindPlayerSignals(player, entry)
	safeDisconnect(entry.characterAddedConnection)
	safeDisconnect(entry.characterRemovingConnection)

	entry.characterAddedConnection = self:_connect(player.CharacterAdded, function()
		self:refreshPlayer(player)
	end)

	entry.characterRemovingConnection = self:_connect(player.CharacterRemoving, function()
		entry.character = nil
		entry.root = nil
		entry.humanoid = nil
	end)
end

function playerCacheApi:_addPlayer(player)
	if not player or self._entries[player] then
		return
	end

	local entry = {
		player = player,
		teamId = nil,
		teamReadAt = 0,
	}

	self._entries[player] = entry
	self._players[#self._players + 1] = player
	self:_bindPlayerSignals(player, entry)
	self:refreshPlayer(player)
end

function playerCacheApi:_removePlayer(player)
	local entry = self._entries[player]
	if entry then
		safeDisconnect(entry.characterAddedConnection)
		safeDisconnect(entry.characterRemovingConnection)
		self._entries[player] = nil
	end

	for index = #self._players, 1, -1 do
		if self._players[index] == player then
			table.remove(self._players, index)
			break
		end
	end
end

function playerCacheApi:refreshPlayer(player)
	local entry = self._entries[player]
	if not entry then
		return nil
	end

	local character = getLiveCharacter(self._workspace, player)
	entry.character = character
	entry.root = getRoot(character)
	entry.humanoid = character and character:FindFirstChildOfClass("Humanoid") or nil
	return entry
end

function playerCacheApi:getPlayers()
	return self._players
end

function playerCacheApi:getEntry(player)
	if not player then
		return nil
	end

	if not self._entries[player] then
		self:_addPlayer(player)
	end

	return self:refreshPlayer(player)
end

function playerCacheApi:getCharacter(player)
	local entry = self:getEntry(player)
	return entry and entry.character or nil
end

function playerCacheApi:getRoot(player)
	local entry = self:getEntry(player)
	return entry and entry.root or nil
end

function playerCacheApi:getHumanoid(player)
	local entry = self:getEntry(player)
	return entry and entry.humanoid or nil
end

function playerCacheApi:getTeamId(player)
	local entry = self:getEntry(player)
	if not entry then
		return nil
	end

	local now = os.clock()
	if now - (entry.teamReadAt or 0) >= teamCacheSeconds then
		entry.teamId = readTeamId(player)
		entry.teamReadAt = now
	end

	return entry.teamId
end

function playerCacheApi:isValidTeamId(teamId)
	return teamId ~= nil and validTeamIds[teamId] == true
end

function playerCacheApi:isSameTeam(playerA, playerB)
	local teamA = self:getTeamId(playerA)
	local teamB = self:getTeamId(playerB)
	return self:isValidTeamId(teamA) and self:isValidTeamId(teamB) and teamA == teamB
end

function playerCacheApi:destroy()
	if self._destroyed then
		return
	end

	self._destroyed = true
	for _, connection in ipairs(self._connections) do
		safeDisconnect(connection)
	end

	local players = {}
	for player in pairs(self._entries) do
		players[#players + 1] = player
	end

	for _, player in ipairs(players) do
		self:_removePlayer(player)
	end
end

function playerCacheApi:Destroy()
	self:destroy()
end

return playerCacheApi
