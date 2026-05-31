local ESP={}

local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local UIS=game:GetService("UserInputService")

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

local function getMyESPHighlight(character)
	local highlight=character and character:FindFirstChild(ESP_HIGHLIGHT_NAME)
	if highlight and highlight:IsA("Highlight") then
		return highlight
	end

	return nil
end

local function destroyMyESPHighlight(character)
	local highlight=getMyESPHighlight(character)
	if highlight then
		highlight:Destroy()
	end
end

local function createMyESPHighlight(character,color)
	if not character then return nil end

	local highlight=Instance.new("Highlight")
	highlight.Name=ESP_HIGHLIGHT_NAME
	highlight.Adornee=character
	highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
	highlight.FillTransparency=0.5
	highlight.OutlineTransparency=0
	highlight.FillColor=color
	highlight.OutlineColor=color
	highlight.Parent=character
	return highlight
end

local function recreateMyESPHighlight(character,color)
	if not character then return end
	local highlight=getMyESPHighlight(character)
	if not highlight then
		createMyESPHighlight(character,color)
		return
	end

	highlight.Adornee=character
	highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
	highlight.FillTransparency=0.5
	highlight.OutlineTransparency=0
	highlight.FillColor=color
	highlight.OutlineColor=color
end

local function clearAllMyESPHighlights()
	for _,player in ipairs(Players:GetPlayers()) do
		local character=getLiveCharacter(player)
		if character then
			destroyMyESPHighlight(character)
		end
	end
end

function ESP.new(ctx,parent)
	local makeSection=ctx.makeSection
	local buildToggleRow=ctx.buildToggleRow
	local inputToBinding=ctx.inputToBinding
	local state=ctx.State
	local THEME=ctx.THEME
	local api={}
	local sectionBody=nil
	local sectionFrame=nil
	local toggle=nil
	local keybindConn=nil
	local heartbeatConn=nil
	local espEnabled=false

	local function isGameplay()
		if ctx.getCurrentModeKey then
			return ctx.getCurrentModeKey()=="mode1"
		end

		return true
	end

	local function refreshFooter()
		if ctx.refreshESPStatus then
			pcall(ctx.refreshESPStatus,state.actionStatusOn,isGameplay())
		end
	end

	local function changed()
		if ctx.onChanged then
			pcall(ctx.onChanged,state)
		end

		refreshFooter()
	end

	local function rebuildEnemyHighlights()
		if not espEnabled or not isGameplay() then
			clearAllMyESPHighlights()
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
							recreateMyESPHighlight(character,blue)
						elseif antimatterData and isSameTeam(player,antimatterData.player) then
							if shouldTurnRedFromAntimatterRule(player,antimatterData) then
								recreateMyESPHighlight(character,red)
							else
								recreateMyESPHighlight(character,green)
							end
						else
							destroyMyESPHighlight(character)
						end
					else
						destroyMyESPHighlight(character)
					end
				end
			end
		end
	end

	local function stopESP()
		espEnabled=false
		safeDisconnect(heartbeatConn)
		heartbeatConn=nil
		clearAllMyESPHighlights()
	end

	local function startESP()
		if espEnabled then return end

		espEnabled=true
		safeDisconnect(heartbeatConn)
		heartbeatConn=RunService.Heartbeat:Connect(rebuildEnemyHighlights)
		rebuildEnemyHighlights()
	end

	local function syncControls()
		local available=isGameplay()

		if not available and state.actionStatusOn then
			state.actionStatusOn=false
		end

		if state.actionStatusOn and available then
			startESP()
		else
			stopESP()
		end

		if sectionFrame then
			sectionFrame.Visible=available
		elseif sectionBody then
			sectionBody.Visible=available
		end

		if toggle then
			toggle.set(available and state.actionStatusOn)
		end

		refreshFooter()
	end

	function api.SetESPState(value,fire)
		state.actionStatusOn=(value and isGameplay()) and true or false
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.Refresh()
		syncControls()
	end

	function api.Reset()
		api.SetESPState(false,true)
	end

	function api.Destroy()
		safeDisconnect(keybindConn)
		keybindConn=nil
		stopESP()

		if sectionFrame and sectionFrame.Parent then
			sectionFrame:Destroy()
		elseif sectionBody and sectionBody.Parent then
			sectionBody:Destroy()
		end

		if ctx.refreshESPStatus then
			pcall(ctx.refreshESPStatus,false,false)
		end
	end

	sectionBody=makeSection(parent,3,"ESP","Gameplay only")
	sectionFrame=sectionBody and sectionBody.Parent or nil

	toggle=buildToggleRow(sectionBody,"ESP",state.actionStatusOn,function(v)
		api.SetESPState(v,true)
	end)

	local function handleESPInput(input)
		if not isGameplay() then return false end

		local getKey=ctx.getESPToggleKey or ctx.getActionToggleKey
		local key=getKey and getKey() or Enum.KeyCode.Unknown
		if not key or key==Enum.KeyCode.Unknown then return false end

		local binding=inputToBinding and inputToBinding(input) or nil
		if binding~=nil and binding==key then
			api.SetESPState(not state.actionStatusOn,true)
			return true
		end

		return false
	end

	keybindConn=UIS.InputBegan:Connect(function(input,processed)
		if processed then return end
		handleESPInput(input)
	end)

	syncControls()
	return api
end

return ESP
