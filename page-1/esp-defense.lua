local ESPDefense={}

local Players=game:GetService("Players")
local RunService=game:GetService("RunService")

local me=Players.LocalPlayer

local VALID_TEAM_IDS={
	HomeTeam=true,
	AwayTeam=true,
}

local ESP_HIGHLIGHT_NAME="MyESPHighlight"
local RANGE_BASE_YARDS=7
local YOUR_SPEED_YPS=7
local ANTIMATTER_SPEED_YPS=25

local function safeDisconnect(conn)
	if conn and typeof(conn)=="RBXScriptConnection" then
		pcall(function()
			conn:Disconnect()
		end)
	end
end

local function getLiveCharacter(player)
	if not player then return nil end

	local workspaceCharacter=workspace:FindFirstChild(player.Name)
	if workspaceCharacter and workspaceCharacter:IsA("Model") then
		return workspaceCharacter
	end

	if player.Character and player.Character:IsA("Model") then
		return player.Character
	end

	return nil
end

local function getCharacterRoot(character)
	if not character then return nil end
	return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
end

local function getPlayerRoot(player)
	return getCharacterRoot(getLiveCharacter(player))
end

local function studsToYards(studs)
	return studs/3
end

local function getPlayerTeamID(player)
	local replicated=player and player:FindFirstChild("Replicated")
	local teamValue=replicated and replicated:FindFirstChild("TeamID")
	if not teamValue then return nil end

	if teamValue:IsA("StringValue") or teamValue:IsA("IntValue") or teamValue:IsA("NumberValue") then
		return tostring(teamValue.Value)
	end

	local ok,value=pcall(function()
		return teamValue.Value
	end)

	if ok then
		return tostring(value)
	end

	return nil
end

local function isValidGameTeamID(teamID)
	return teamID~=nil and VALID_TEAM_IDS[teamID]==true
end

local function isSameTeam(playerA,playerB)
	local teamA=getPlayerTeamID(playerA)
	local teamB=getPlayerTeamID(playerB)

	if not isValidGameTeamID(teamA) or not isValidGameTeamID(teamB) then
		return false
	end

	return teamA==teamB
end

local function shouldHighlightPlayer(player)
	if not player or player==me then
		return false
	end

	local myTeam=getPlayerTeamID(me)
	local theirTeam=getPlayerTeamID(player)
	if not isValidGameTeamID(myTeam) or not isValidGameTeamID(theirTeam) then
		return false
	end

	return myTeam~=theirTeam
end

local function getFootballPartFromPlayer(player)
	local character=getLiveCharacter(player)
	if not character then return nil end

	local football=character:FindFirstChild("Football")
	if football and football:IsA("BasePart") and football.Parent==character then
		return football
	end

	return nil
end

local function findAntimatterData()
	for _,player in ipairs(Players:GetPlayers()) do
		if shouldHighlightPlayer(player) then
			local footballPart=getFootballPartFromPlayer(player)
			if footballPart then
				return{
					player=player,
					footballPart=footballPart,
				}
			end
		end
	end

	return nil
end

local function getClosestFriendlyReachTime(targetPlayer)
	local targetRoot=getPlayerRoot(targetPlayer)
	if not targetRoot then
		return math.huge
	end

	local bestTime=math.huge
	for _,player in ipairs(Players:GetPlayers()) do
		if isSameTeam(player,me) then
			local friendlyRoot=getPlayerRoot(player)
			if friendlyRoot then
				local distStuds=(friendlyRoot.Position-targetRoot.Position).Magnitude
				local distYards=studsToYards(distStuds)
				local timeToReach=0

				if distYards>RANGE_BASE_YARDS then
					timeToReach=(distYards-RANGE_BASE_YARDS)/YOUR_SPEED_YPS
				end

				if timeToReach<bestTime then
					bestTime=timeToReach
				end
			end
		end
	end

	return bestTime
end

local function shouldTurnRedFromAntimatterRule(targetPlayer,antimatterData)
	if not targetPlayer or not antimatterData then
		return false
	end

	local antimatterPlayer=antimatterData.player
	local footballPart=antimatterData.footballPart
	if not antimatterPlayer or not footballPart or not footballPart.Parent then
		return false
	end

	if targetPlayer==antimatterPlayer then
		return false
	end

	if not isSameTeam(targetPlayer,antimatterPlayer) then
		return false
	end

	local targetRoot=getPlayerRoot(targetPlayer)
	if not targetRoot then
		return false
	end

	local footballDistanceStuds=(footballPart.Position-targetRoot.Position).Magnitude
	local footballDistanceYards=studsToYards(footballDistanceStuds)
	local footballTime=footballDistanceYards/ANTIMATTER_SPEED_YPS
	local closestFriendlyTime=getClosestFriendlyReachTime(targetPlayer)

	return closestFriendlyTime<=footballTime
end

local function getOurHighlight(character)
	local highlight=character and character:FindFirstChild(ESP_HIGHLIGHT_NAME)
	if highlight and highlight:IsA("Highlight") then
		return highlight
	end

	return nil
end

local function ensureOwnedHighlight(character)
	local highlight=getOurHighlight(character)
	if highlight then return highlight end

	highlight=Instance.new("Highlight")
	highlight.Name=ESP_HIGHLIGHT_NAME
	highlight.Parent=character
	return highlight
end

local function forceHighlight(character,color)
	if not character then return end

	local found=false
	for _,descendant in ipairs(character:GetDescendants()) do
		if descendant:IsA("Highlight") then
			found=true
			descendant.Adornee=character
			descendant.Enabled=true
			descendant.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
			descendant.FillTransparency=0.5
			descendant.OutlineTransparency=0
			descendant.FillColor=color
			descendant.OutlineColor=color
		end
	end

	local owned=ensureOwnedHighlight(character)
	owned.Adornee=character
	owned.Enabled=true
	owned.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
	owned.FillTransparency=0.5
	owned.OutlineTransparency=0
	owned.FillColor=color
	owned.OutlineColor=color

	if not found then
		owned.Parent=character
	end
end

local function destroyOwnedHighlight(character)
	local highlight=getOurHighlight(character)
	if highlight then
		highlight:Destroy()
	end
end

local function clearOwnedHighlights()
	for _,player in ipairs(Players:GetPlayers()) do
		local character=getLiveCharacter(player)
		if character then
			destroyOwnedHighlight(character)
		end
	end
end

function ESPDefense.new(ctx)
	local THEME=ctx.THEME
	local api={}
	local heartbeatConn=nil
	local running=false

	local function rebuild()
		if not running then
			clearOwnedHighlights()
			return
		end

		local antimatterData=findAntimatterData()
		local blue=THEME.BLUE or Color3.fromRGB(70,140,255)
		local red=THEME.RED or Color3.fromRGB(210,70,70)
		local green=THEME.GREEN or Color3.fromRGB(90,200,90)

		for _,player in ipairs(Players:GetPlayers()) do
			if player~=me then
				local character=getLiveCharacter(player)
				if character then
					if shouldHighlightPlayer(player) then
						if antimatterData and player==antimatterData.player then
							forceHighlight(character,blue)
						elseif antimatterData and isSameTeam(player,antimatterData.player) then
							if shouldTurnRedFromAntimatterRule(player,antimatterData) then
								forceHighlight(character,red)
							else
								forceHighlight(character,green)
							end
						else
							destroyOwnedHighlight(character)
						end
					else
						destroyOwnedHighlight(character)
					end
				end
			end
		end
	end

	function api.Start()
		if running then return end
		running=true
		safeDisconnect(heartbeatConn)
		heartbeatConn=RunService.Heartbeat:Connect(rebuild)
		rebuild()
	end

	function api.Stop()
		running=false
		safeDisconnect(heartbeatConn)
		heartbeatConn=nil
		clearOwnedHighlights()
	end

	function api.Refresh()
		if running then
			rebuild()
		end
	end

	function api.Destroy()
		api.Stop()
	end

	return api
end

return ESPDefense
