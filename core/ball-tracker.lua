local ballTrackerApi = {}
ballTrackerApi.__index = ballTrackerApi

local positiveBallCacheSeconds = 0.15
local negativeBallCacheSeconds = 0.5
local defaultHeldDistance = 35

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

local function looksLikeFootball(instance, stopAt)
	while instance and instance ~= stopAt do
		if tostring(instance.Name):lower():find("football", 1, true) then
			return true
		end
		instance = instance.Parent
	end

	return false
end

local function validPartNear(part, rootPart, maxDistance)
	return part and part:IsA("BasePart") and part.Parent and rootPart and (part.Position - rootPart.Position).Magnitude <= maxDistance
end

local function candidateFootballPart(candidate, rootPart, maxDistance)
	if validPartNear(candidate, rootPart, maxDistance) then
		return candidate
	end

	if not candidate or not (candidate:IsA("Model") or candidate:IsA("Folder") or candidate:IsA("Tool")) then
		return nil
	end

	for _, name in ipairs({ "FootballBox", "Part" }) do
		local namedPart = candidate:FindFirstChild(name)
		if validPartNear(namedPart, rootPart, maxDistance) then
			return namedPart
		end
	end

	for _, descendant in ipairs(candidate:GetDescendants()) do
		if validPartNear(descendant, rootPart, maxDistance) then
			return descendant
		end
	end

	return nil
end

function ballTrackerApi.new(playersService, workspaceService, playerCache, scope)
	local self = setmetatable({
		_playersService = playersService or game:GetService("Players"),
		_workspace = workspaceService or game:GetService("Workspace"),
		_playerCache = playerCache,
		_scope = scope,
		_ballCache = setmetatable({}, { __mode = "k" }),
		_destroyed = false,
	}, ballTrackerApi)

	if scope and type(scope.add) == "function" then
		scope:add(self)
	end

	return self
end

function ballTrackerApi:findDirectFootballPart(container, rootPart, maxDistance)
	if self._destroyed or not (container and rootPart) then
		return nil
	end

	for _, child in ipairs(container:GetChildren()) do
		if tostring(child.Name):lower():find("football", 1, true) then
			local part = candidateFootballPart(child, rootPart, maxDistance)
			if part then
				return part
			end
		end
	end

	return nil
end

function ballTrackerApi:findFootballPart(container, rootPart, maxDistance)
	maxDistance = tonumber(maxDistance) or defaultHeldDistance
	if self._destroyed or not (container and rootPart) then
		return nil
	end

	local direct = self:findDirectFootballPart(container, rootPart, maxDistance)
	if direct then
		return direct
	end

	for _, descendant in ipairs(container:GetDescendants()) do
		if validPartNear(descendant, rootPart, maxDistance) and looksLikeFootball(descendant, container) then
			return descendant
		end
	end

	return nil
end

function ballTrackerApi:getCharacter(player)
	if self._playerCache and type(self._playerCache.getCharacter) == "function" then
		return self._playerCache:getCharacter(player)
	end

	return getLiveCharacter(self._workspace, player)
end

function ballTrackerApi:getRoot(player)
	if self._playerCache and type(self._playerCache.getRoot) == "function" then
		return self._playerCache:getRoot(player)
	end

	return getRoot(self:getCharacter(player))
end

function ballTrackerApi:getFootballPartFromPlayer(player, maxDistance)
	if self._destroyed or not player then
		return nil
	end

	maxDistance = tonumber(maxDistance) or defaultHeldDistance
	local character = self:getCharacter(player)
	local rootPart = self:getRoot(player)
	if not (character and rootPart) then
		self._ballCache[player] = nil
		return nil
	end

	local cached = self._ballCache[player]
	local now = os.clock()
	if cached and cached.character == character then
		if cached.part and now - cached.t <= positiveBallCacheSeconds and validPartNear(cached.part, rootPart, maxDistance) then
			return cached.part
		end

		if cached.part == false
			and now - cached.t <= negativeBallCacheSeconds
			and (cached.maxDistance or 0) >= maxDistance then
			local gameObjects = character:FindFirstChild("GAMEOBJECTS")
			local direct = self:findDirectFootballPart(character, rootPart, maxDistance)
				or self:findDirectFootballPart(gameObjects, rootPart, maxDistance)
			if direct then
				self._ballCache[player] = {
					part = direct,
					t = now,
					character = character,
					maxDistance = maxDistance,
				}
				return direct
			end

			return nil
		end
	end

	local football = self:findFootballPart(character, rootPart, maxDistance)

	self._ballCache[player] = {
		part = football or false,
		t = now,
		character = character,
		maxDistance = maxDistance,
	}
	return football
end

function ballTrackerApi:getHeldBall(player, maxDistance)
	return self:getFootballPartFromPlayer(player or self._playersService.LocalPlayer, maxDistance)
end

function ballTrackerApi:getCarrier(players)
	if self._destroyed then
		return nil
	end

	local list = players
	if not list then
		if self._playerCache and type(self._playerCache.getPlayers) == "function" then
			list = self._playerCache:getPlayers()
		else
			list = self._playersService:GetPlayers()
		end
	end

	for _, player in ipairs(list) do
		local footballPart = self:getFootballPartFromPlayer(player, defaultHeldDistance)
		if footballPart then
			return {
				player = player,
				footballPart = footballPart,
			}
		end
	end

	return nil
end

function ballTrackerApi:destroy()
	if self._destroyed then
		return
	end

	self._destroyed = true
	self._ballCache = setmetatable({}, { __mode = "k" })
end

function ballTrackerApi:Destroy()
	self:destroy()
end

return ballTrackerApi
