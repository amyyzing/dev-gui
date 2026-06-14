local ESPDefense={}

local Players=game:GetService("Players")
local RunService=game:GetService("RunService")

local me=Players.LocalPlayer

local VALID_TEAM_IDS={
	HomeTeam=true,
	AwayTeam=true,
}

local ESP_HIGHLIGHT_NAME="MyESPHighlight"
local BALL_G=28
local G=Vector3.new(0,-BALL_G,0)
local MODEL_BALL_SPEED=95
local DEFAULT_THROW_Y=14
local MIN_THROW_ANGLE=-5
local MAX_THROW_ANGLE=55
local DEFENDER_SPEED_STUDS=21
local DEFENDER_REACTION_BUFFER=0.05
local CATCH_HEIGHT_TOLERANCE=0.25
local PASS_SAMPLE_DT=0.08
local PASS_SAMPLE_MAX=28
local ESP_REFRESH_INTERVAL=0.12
local ESP_TEAM_CACHE_INTERVAL=0.50
local HIGHLIGHT_SCAN_INTERVAL=1.00
local teamCache=setmetatable({}, {__mode="k"})
local highlightCache=setmetatable({}, {__mode="k"})

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

local function flat(v)
	return Vector3.new(v.X,0,v.Z)
end

local function getPlayerTeamID(player)
	if not player then return nil end

	local now=os.clock()
	local cached=teamCache[player]
	if cached and now-cached.t<ESP_TEAM_CACHE_INTERVAL then
		return cached.value
	end

	local replicated=player and player:FindFirstChild("Replicated")
	local teamValue=replicated and replicated:FindFirstChild("TeamID")
	local value=nil

	if teamValue then
		if teamValue:IsA("StringValue") or teamValue:IsA("IntValue") or teamValue:IsA("NumberValue") then
			value=tostring(teamValue.Value)
		else
			local ok,result=pcall(function()
				return teamValue.Value
			end)

			if ok then
				value=tostring(result)
			end
		end
	end

	teamCache[player]={t=now,value=value}

	return value
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

local function findBallCarrierData(players)
	for _,player in ipairs(players or Players:GetPlayers()) do
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

local function getConfiguredThrowY(ctx)
	local state=ctx and ctx.State
	local value=state and tonumber(state.qbAimPeakHeight)
	if value then
		return math.clamp(value,8,24)
	end

	return DEFAULT_THROW_Y
end

local function getThrowOrigin(carrierRoot,footballPart,throwY)
	local basePosition=(carrierRoot and carrierRoot.Position) or (footballPart and footballPart.Position)
	if not basePosition then return nil end

	return Vector3.new(basePosition.X,throwY,basePosition.Z)
end

local function getReceiverTarget(receiverRoot,catchY)
	local position=receiverRoot and receiverRoot.Position
	if not position then return nil end

	return Vector3.new(position.X,catchY,position.Z)
end

local function ballAt(origin,velocity,time)
	return origin+velocity*time+0.5*G*time*time
end

local function solveStationaryThrow(origin,target)
	local delta=target-origin
	local xz2=delta.X*delta.X+delta.Z*delta.Z
	local y=delta.Y
	local a=0.25*BALL_G*BALL_G
	local b=y*BALL_G-MODEL_BALL_SPEED*MODEL_BALL_SPEED
	local c=xz2+y*y
	local discriminant=b*b-4*a*c
	if discriminant<0 then
		return nil
	end

	local sqrtDiscriminant=math.sqrt(discriminant)
	local denominator=2*a
	local best=nil

	for _,timeSquared in ipairs({
		(-b-sqrtDiscriminant)/denominator,
		(-b+sqrtDiscriminant)/denominator,
	}) do
		if timeSquared and timeSquared>1e-6 then
			local time=math.sqrt(timeSquared)
			local velocity=(target-origin-0.5*G*time*time)/time
			local speed=velocity.Magnitude
			if speed>1e-6 then
				local direction=velocity.Unit
				local angle=math.deg(math.asin(math.clamp(direction.Y,-1,1)))
				if angle>=MIN_THROW_ANGLE and angle<=MAX_THROW_ANGLE then
					local candidate={
						time=time,
						origin=origin,
						target=target,
						velocity=direction*MODEL_BALL_SPEED,
						angle=angle,
					}

					if not best or candidate.time<best.time then
						best=candidate
					end
				end
			end
		end
	end

	return best
end

local function collectDefenderRoots(players)
	local roots={}
	for _,player in ipairs(players or Players:GetPlayers()) do
		if isSameTeam(player,me) then
			local friendlyRoot=getPlayerRoot(player)
			if friendlyRoot then
				table.insert(roots,friendlyRoot)
			end
		end
	end

	return roots
end

local function defenderCanReachBall(defenderRoot,ballPosition,elapsed,catchY)
	if not defenderRoot or not ballPosition or elapsed<=0 then
		return false
	end

	if ballPosition.Y>catchY+CATCH_HEIGHT_TOLERANCE then
		return false
	end

	local distanceXZ=(flat(defenderRoot.Position)-flat(ballPosition)).Magnitude
	local reachTime=distanceXZ/DEFENDER_SPEED_STUDS

	return reachTime<=elapsed+DEFENDER_REACTION_BUFFER
end

local function passCanBeIntercepted(plan,defenderRoots,catchY)
	if not plan then
		return true
	end

	for _,defenderRoot in ipairs(defenderRoots) do
		if defenderCanReachBall(defenderRoot,plan.target,plan.time,catchY) then
			return true
		end
	end

	local sampleCount=math.clamp(math.ceil(plan.time/PASS_SAMPLE_DT),4,PASS_SAMPLE_MAX)
	for sampleIndex=1,sampleCount do
		local time=plan.time*sampleIndex/sampleCount
		local ballPosition=ballAt(plan.origin,plan.velocity,time)

		for _,defenderRoot in ipairs(defenderRoots) do
			if defenderCanReachBall(defenderRoot,ballPosition,time,catchY) then
				return true
			end
		end
	end

	return false
end

local function isReceiverClosed(receiverPlayer,carrierData,defenderRoots,ctx)
	if not receiverPlayer or not carrierData then
		return true
	end

	local carrierPlayer=carrierData.player
	local footballPart=carrierData.footballPart
	if not carrierPlayer or not footballPart or not footballPart.Parent then
		return true
	end

	if receiverPlayer==carrierPlayer then
		return false
	end

	if not isSameTeam(receiverPlayer,carrierPlayer) then
		return false
	end

	local carrierRoot=getPlayerRoot(carrierPlayer)
	local receiverRoot=getPlayerRoot(receiverPlayer)
	if not carrierRoot or not receiverRoot then
		return true
	end

	local catchY=getConfiguredThrowY(ctx)
	local origin=getThrowOrigin(carrierRoot,footballPart,catchY)
	local target=getReceiverTarget(receiverRoot,catchY)
	local plan=origin and target and solveStationaryThrow(origin,target) or nil

	return passCanBeIntercepted(plan,defenderRoots,catchY)
end

local function getCachedHighlights(character)
	local now=os.clock()
	local cached=highlightCache[character]
	if cached and now-cached.t<HIGHLIGHT_SCAN_INTERVAL then
		return cached.items
	end

	local items={}
	for _,descendant in ipairs(character:GetDescendants()) do
		if descendant:IsA("Highlight") then
			table.insert(items,descendant)
		end
	end

	highlightCache[character]={t=now,items=items}
	return items
end

local function rememberHighlight(character,highlight)
	local cached=highlightCache[character]
	if not cached then return end

	for _,item in ipairs(cached.items) do
		if item==highlight then
			return
		end
	end

	table.insert(cached.items,highlight)
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
	for _,highlight in ipairs(getCachedHighlights(character)) do
		if highlight and highlight.Parent then
			found=true
			highlight.Adornee=character
			highlight.Enabled=true
			highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
			highlight.FillTransparency=0.5
			highlight.OutlineTransparency=0
			highlight.FillColor=color
			highlight.OutlineColor=color
		end
	end

	local owned=ensureOwnedHighlight(character)
	rememberHighlight(character,owned)
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
	highlightCache[character]=nil
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
	local safeDisconnect=ctx.safeDisconnect
	local api={}
	local heartbeatConn=nil
	local heartbeatElapsed=0
	local running=false

	local function rebuild()
		if not running then
			clearOwnedHighlights()
			return
		end

		local players=Players:GetPlayers()
		local carrierData=findBallCarrierData(players)
		local defenderRoots=collectDefenderRoots(players)
		local blue=THEME.BLUE or Color3.fromRGB(70,140,255)
		local red=THEME.RED or Color3.fromRGB(210,70,70)
		local green=THEME.GREEN or Color3.fromRGB(90,200,90)

		for _,player in ipairs(players) do
			if player~=me then
				local character=getLiveCharacter(player)
				if character then
					if shouldHighlightPlayer(player) then
						if carrierData and player==carrierData.player then
							forceHighlight(character,blue)
						elseif carrierData and isSameTeam(player,carrierData.player) then
							if isReceiverClosed(player,carrierData,defenderRoots,ctx) then
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
		heartbeatElapsed=0
		heartbeatConn=RunService.Heartbeat:Connect(function(dt)
			heartbeatElapsed+=(dt or 0)
			if heartbeatElapsed<ESP_REFRESH_INTERVAL then return end
			heartbeatElapsed=0
			rebuild()
		end)
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
