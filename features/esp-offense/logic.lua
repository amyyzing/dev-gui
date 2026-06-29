-- marks open receivers while you are the quarterback.

local espOffense={}

local Players=game:GetService("Players")
local RunService=game:GetService("RunService")

local me=Players.LocalPlayer

local validTeamIds={
	HomeTeam=true,
	AwayTeam=true,
}

local espHighlightName="MyESPHighlight"
local qbTargetHighlightName="QBAimTargetHighlight"
local ballGravity=28
local gravityVector=Vector3.new(0,-ballGravity,0)
local modelBallSpeed=95
local defaultThrowY=14
local minThrowAngle=-5
local maxThrowAngle=55
local defenderSpeed=21
local defenderReactionBuffer=0.05
local catchHeightTolerance=0.25
local passSampleStep=0.08
local passSampleMax=28
local espRefreshInterval=0.12
local espTeamCacheInterval=0.50
local teamCache=setmetatable({}, {__mode="k"})

local function clampByte(value,fallback)
	return math.clamp(math.floor((tonumber(value) or fallback or 0)+0.5),0,255)
end

local function clamp01(value,fallback)
	local number=tonumber(value)
	if number==nil then
		return fallback
	end

	return math.clamp(number,0,1)
end

local function styleColor(style,prefix,legacyPrefix,channel,fallback)
	local custom=style and style[prefix.."CustomColor"]==true
	if not custom and legacyPrefix then
		custom=style and style[legacyPrefix.."CustomColor"]==true
		prefix=legacyPrefix
	end

	if not custom then
		return fallback
	end

	return Color3.fromRGB(
		clampByte(style[prefix..channel.."R"],fallback and fallback.R*255 or 255),
		clampByte(style[prefix..channel.."G"],fallback and fallback.G*255 or 255),
		clampByte(style[prefix..channel.."B"],fallback and fallback.B*255 or 255)
	)
end

local function highlightStyle(app,stateKey,fallbackColor)
	local style=app and app.style
	local prefix=stateKey=="closed" and "ESPOffenseClosed" or "ESPOffenseOpen"
	return{
		fill=styleColor(style,prefix,"ESPOffense","Fill",fallbackColor),
		outline=styleColor(style,prefix,"ESPOffense","Outline",fallbackColor),
		fillTransparency=clamp01(style and (style[prefix.."FillTransparency"] or style.ESPOffenseFillTransparency),0.5),
		outlineTransparency=clamp01(style and (style[prefix.."OutlineTransparency"] or style.ESPOffenseOutlineTransparency),0),
	}
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

local function flat(v)
	return Vector3.new(v.X,0,v.Z)
end

local function findFootballPart(container,rootPart,maxDistance)
	if not(container and rootPart) then return nil end

	local function looksLikeFootball(inst)
		while inst and inst~=container do
			if tostring(inst.Name):lower():find("football",1,true) then
				return true
			end
			inst=inst.Parent
		end

		return false
	end

	local direct=container:FindFirstChild("Football")
	if direct then
		if direct:IsA("BasePart") and (direct.Position-rootPart.Position).Magnitude<=maxDistance then
			return direct
		end

		if direct:IsA("Model") or direct:IsA("Folder") or direct:IsA("Tool") then
			for _,descendant in ipairs(direct:GetDescendants()) do
				if descendant:IsA("BasePart") and (descendant.Position-rootPart.Position).Magnitude<=maxDistance then
					return descendant
				end
			end
		end
	end

	for _,descendant in ipairs(container:GetDescendants()) do
		if descendant:IsA("BasePart") and looksLikeFootball(descendant) and (descendant.Position-rootPart.Position).Magnitude<=maxDistance then
			return descendant
		end
	end

	return nil
end

local function getPlayerTeamID(player)
	if not player then return nil end

	local now=os.clock()
	local cached=teamCache[player]
	if cached and now-cached.t<espTeamCacheInterval then
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
	return teamID~=nil and validTeamIds[teamID]==true
end

local function isSameTeam(playerA,playerB)
	local teamA=getPlayerTeamID(playerA)
	local teamB=getPlayerTeamID(playerB)

	if not isValidGameTeamID(teamA) or not isValidGameTeamID(teamB) then
		return false
	end

	return teamA==teamB
end

local function getFootballPartFromPlayer(player)
	local character=getLiveCharacter(player)
	local rootPart=getCharacterRoot(character)
	if not(character and rootPart) then return nil end

	local football=findFootballPart(character,rootPart,35)
	if football then return football end

	return findFootballPart(character:FindFirstChild("GAMEOBJECTS"),rootPart,35)
end

local function shouldHighlightReceiver(player)
	return player and player~=me and isSameTeam(player,me)
end

local function shouldUseAsDefender(player)
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

local function getConfiguredThrowY(app)
	local state=app and app.State
	local value=state and tonumber(state.qbAimPeakHeight)
	if value then
		return math.clamp(value,8,24)
	end

	return defaultThrowY
end

local function getThrowOrigin(qbRoot,footballPart,throwY)
	local basePosition=(qbRoot and qbRoot.Position) or (footballPart and footballPart.Position)
	if not basePosition then return nil end

	return Vector3.new(basePosition.X,throwY,basePosition.Z)
end

local function getReceiverTarget(receiverRoot,catchY)
	local position=receiverRoot and receiverRoot.Position
	if not position then return nil end

	return Vector3.new(position.X,catchY,position.Z)
end

local function ballAt(origin,velocity,time)
	return origin+velocity*time+0.5*gravityVector*time*time
end

local function solveStationaryThrow(origin,target)
	local delta=target-origin
	local xz2=delta.X*delta.X+delta.Z*delta.Z
	local y=delta.Y
	local a=0.25*ballGravity*ballGravity
	local b=y*ballGravity-modelBallSpeed*modelBallSpeed
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
			local velocity=(target-origin-0.5*gravityVector*time*time)/time
			local speed=velocity.Magnitude
			if speed>1e-6 then
				local direction=velocity.Unit
				local angle=math.deg(math.asin(math.clamp(direction.Y,-1,1)))
				if angle>=minThrowAngle and angle<=maxThrowAngle then
					local candidate={
						time=time,
						origin=origin,
						target=target,
						velocity=direction*modelBallSpeed,
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
		if shouldUseAsDefender(player) then
			local defenderRoot=getPlayerRoot(player)
			if defenderRoot then
				table.insert(roots,defenderRoot)
			end
		end
	end

	return roots
end

local function defenderCanReachBall(defenderRoot,ballPosition,elapsed,catchY)
	if not defenderRoot or not ballPosition or elapsed<=0 then
		return false
	end

	if ballPosition.Y>catchY+catchHeightTolerance then
		return false
	end

	local distanceXZ=(flat(defenderRoot.Position)-flat(ballPosition)).Magnitude
	local reachTime=distanceXZ/defenderSpeed

	return reachTime<=elapsed+defenderReactionBuffer
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

	local sampleCount=math.clamp(math.ceil(plan.time/passSampleStep),4,passSampleMax)
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

local function isReceiverClosed(receiverPlayer,origin,defenderRoots,catchY)
	local receiverRoot=getPlayerRoot(receiverPlayer)
	if not receiverRoot then
		return true
	end

	local target=getReceiverTarget(receiverRoot,catchY)
	local plan=origin and target and solveStationaryThrow(origin,target) or nil

	return passCanBeIntercepted(plan,defenderRoots,catchY)
end

local function getOurHighlight(character)
	local highlight=character and character:FindFirstChild(espHighlightName)
	if highlight and highlight:IsA("Highlight") then
		return highlight
	end

	return nil
end

local function hasActiveQBAimHighlight(character)
	local highlight=character and character:FindFirstChild(qbTargetHighlightName)
	return highlight and highlight:IsA("Highlight") and highlight.Enabled==true
end

local function ensureOwnedHighlight(character)
	local highlight=getOurHighlight(character)
	if highlight then return highlight end

	highlight=Instance.new("Highlight")
	highlight.Name=espHighlightName
	highlight.Parent=character
	return highlight
end

local function forceHighlight(app,character,stateKey,color)
	if not character then return end

	local style=highlightStyle(app,stateKey,color)
	local owned=ensureOwnedHighlight(character)
	owned.Adornee=character
	owned.Enabled=true
	owned.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
	owned.FillTransparency=style.fillTransparency
	owned.OutlineTransparency=style.outlineTransparency
	owned.FillColor=style.fill
	owned.OutlineColor=style.outline
end

local function destroyOwnedHighlight(character)
	local highlight=getOurHighlight(character)
	if highlight then
		highlight:Destroy()
	end
end

function espOffense.new(app)
	local colors=app.colors
	local safeDisconnect=app.safeDisconnect
	local scheduler=app.schedulerApi
	local services=app.Services or {}
	local playerCache=services.playerCacheApi or app.playerCacheApi
	local ballTracker=services.ballTrackerApi or app.ballTrackerApi
	local api={}
	local heartbeatConn=nil
	local heartbeatElapsed=0
	local running=false
	local schedulerJobId="ESPOffense"
	local function currentPlayers()
		if playerCache and type(playerCache.getPlayers)=="function" then
			return playerCache:getPlayers()
		end

		return Players:GetPlayers()
	end

	local function cachedCharacter(player)
		if playerCache and type(playerCache.getCharacter)=="function" then
			return playerCache:getCharacter(player)
		end

		return getLiveCharacter(player)
	end

	local function cachedRoot(player)
		if playerCache and type(playerCache.getRoot)=="function" then
			return playerCache:getRoot(player)
		end

		return getPlayerRoot(player)
	end

	local function trackedFootball(player)
		if ballTracker and type(ballTracker.getFootballPartFromPlayer)=="function" then
			local football=ballTracker:getFootballPartFromPlayer(player,35)
			if football then return football end
		end

		return getFootballPartFromPlayer(player)
	end

	local function clearHighlights()
		for _,player in ipairs(currentPlayers()) do
			local character=cachedCharacter(player)
			if character then
				destroyOwnedHighlight(character)
			end
		end
	end

	local function rebuild()
		if not running then
			clearHighlights()
			return
		end

		local qbRoot=cachedRoot(me)
		if not(qbRoot and trackedFootball(me)) then
			clearHighlights()
			return
		end

		local players=currentPlayers()
		local catchY=getConfiguredThrowY(app)
		local origin=getThrowOrigin(qbRoot,nil,catchY)
		local defenderRoots=collectDefenderRoots(players)
		local red=colors.red or Color3.fromRGB(210,70,70)
		local green=colors.green or Color3.fromRGB(90,200,90)

		for _,player in ipairs(players) do
			if player~=me then
				local character=cachedCharacter(player)
				if character then
					if shouldHighlightReceiver(player) then
						if hasActiveQBAimHighlight(character) then
							destroyOwnedHighlight(character)
						elseif isReceiverClosed(player,origin,defenderRoots,catchY) then
							forceHighlight(app,character,"closed",red)
						else
							forceHighlight(app,character,"open",green)
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
		heartbeatConn=nil
		heartbeatElapsed=0
		if scheduler and scheduler.Register then
			scheduler.Register("Heartbeat",schedulerJobId,espRefreshInterval,function()
				if running then
					rebuild()
				end
			end)
		else
			heartbeatConn=RunService.Heartbeat:Connect(function(dt)
				heartbeatElapsed=heartbeatElapsed+(dt or 0)
				if heartbeatElapsed<espRefreshInterval then return end
				heartbeatElapsed=0
				rebuild()
			end)
		end
		rebuild()
	end

	function api.Stop()
		running=false
		if scheduler and scheduler.Unregister then
			scheduler.Unregister("Heartbeat",schedulerJobId)
		end
		safeDisconnect(heartbeatConn)
		heartbeatConn=nil
		clearHighlights()
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

return espOffense
