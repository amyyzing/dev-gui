-- player highlights and ball-holder colors.

local ESP={}

local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local ReplicatedStorage=game:GetService("ReplicatedStorage")

local me=Players.LocalPlayer

local VALID_TEAM_IDS={
	HomeTeam=true,
	AwayTeam=true,
}

local function firstChild(parent)
	if not parent then return nil end
	return parent:GetChildren()[1]
end

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
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

local function getFootballPartFromPlayer(player)
	local character=getLiveCharacter(player)
	local rootPart=getCharacterRoot(character)
	if not(character and rootPart) then return nil end

	local football=findFootballPart(character,rootPart,35)
	if football then return football end

	return findFootballPart(character:FindFirstChild("GAMEOBJECTS"),rootPart,35)
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

local function getGameplayOffenseTeam()
	local games=ReplicatedStorage:FindFirstChild("Games")
	local gameFolder=firstChild(games)
	local offense=gameFolder and gameFolder:FindFirstChild("Offense")
	local gameStatus=offense and offense:FindFirstChild("GameStatus")
	if not gameStatus then return nil end

	if gameStatus:IsA("StringValue") or gameStatus:IsA("IntValue") or gameStatus:IsA("NumberValue") then
		return tostring(gameStatus.Value)
	end

	local ok,value=pcall(function()
		return gameStatus.Value
	end)

	if ok then
		return tostring(value)
	end

	return nil
end

local function makeNoop()
	return{
		Start=function() end,
		Stop=function() end,
		Refresh=function() end,
		Destroy=function() end,
	}
end

function ESP.new(app,parent)
	local safeDisconnect=app.safeDisconnect
	local makeSection=app.makeSection
	local buildToggleRow=app.buildToggleRow
	local inputToBinding=app.inputToBinding
	local state=app.State
	local THEME=app.THEME
	local UI_STYLE=app.UI_STYLE
	local scheduler=app.Scheduler
	local services=app.Services or {}
	local playerCache=services.PlayerCache or app.PlayerCache
	local ballTracker=services.BallTracker or app.BallTracker
	local api={}
	local sectionBody=nil
	local sectionFrame=nil
	local toggle=nil
	local statusLabel=nil
	local keybindConn=nil
	local heartbeatConn=nil
	local defenseApi=nil
	local offenseApi=nil
	local activeMode=nil
	local poll=0

	local DefenseModule=app.ESPDefenseModule
	local OffenseModule=app.ESPOffenseModule
	local function currentPlayers()
		if playerCache and type(playerCache.getPlayers)=="function" then
			return playerCache:getPlayers()
		end

		return Players:GetPlayers()
	end

	local function trackedFootball(player)
		if ballTracker and type(ballTracker.getFootballPartFromPlayer)=="function" then
			local football=ballTracker:getFootballPartFromPlayer(player,35)
			if football then return football end
		end

		return getFootballPartFromPlayer(player)
	end

	local function trackedTeamID(player)
		if playerCache and type(playerCache.getTeamId)=="function" then
			local teamID=playerCache:getTeamId(player)
			if teamID then return teamID end
		end

		return getPlayerTeamID(player)
	end

	if DefenseModule and DefenseModule.new then
		local ok,result=pcall(function()
			return DefenseModule.new({THEME=THEME,UI_STYLE=UI_STYLE,State=state,safeDisconnect=safeDisconnect,Scheduler=scheduler,Services=services,PlayerCache=playerCache,BallTracker=ballTracker})
		end)
		defenseApi=ok and result or makeNoop()
	else
		defenseApi=makeNoop()
	end

	if OffenseModule and OffenseModule.new then
		local ok,result=pcall(function()
			return OffenseModule.new({THEME=THEME,UI_STYLE=UI_STYLE,State=state,safeDisconnect=safeDisconnect,Scheduler=scheduler,Services=services,PlayerCache=playerCache,BallTracker=ballTracker})
		end)
		offenseApi=ok and result or makeNoop()
	else
		offenseApi=makeNoop()
	end

	local function isGameplay()
		if app.getCurrentModeKey then
			return app.getCurrentModeKey()=="mode1"
		end

		return true
	end

	local function isDefensePossession()
		local myTeam=trackedTeamID(me)
		local offenseTeam=getGameplayOffenseTeam()

		if not isValidGameTeamID(myTeam) or not isValidGameTeamID(offenseTeam) then
			return true
		end

		return offenseTeam~=myTeam
	end

	local function getPossessionMode()
		if trackedFootball(me) then
			return"offense"
		end

		local myTeam=trackedTeamID(me)
		for _,player in ipairs(currentPlayers()) do
			if player~=me and trackedFootball(player) then
				local theirTeam=trackedTeamID(player)
				if isValidGameTeamID(myTeam) and isValidGameTeamID(theirTeam) then
					return theirTeam==myTeam and"offense"or"defense"
				end

				return"defense"
			end
		end

		return isDefensePossession() and"defense"or"offense"
	end

	local function setStatus(text,color)
		if statusLabel then
			statusLabel.Text=text
			statusLabel.TextColor3=color or THEME.MUTED
		end
	end

	local function stopBoth()
		if defenseApi and defenseApi.Stop then pcall(defenseApi.Stop) end
		if offenseApi and offenseApi.Stop then pcall(offenseApi.Stop) end
		activeMode=nil
	end

	local function refreshFooter(available)
		if app.refreshESPStatus then
			pcall(app.refreshESPStatus,state.actionStatusOn,available)
		end
	end

	local function changed()
		if app.onChanged then
			pcall(app.onChanged,state)
		end

		refreshFooter(isGameplay())
	end

	local function syncControls()
		local gameplay=isGameplay()
		local mode=gameplay and getPossessionMode() or nil
		local available=gameplay

		if not gameplay then
			state.actionStatusOn=false
			stopBoth()
			setStatus("game only",THEME.MUTED)
		elseif state.actionStatusOn then
			local nextMode=mode or"defense"
			local nextApi=nextMode=="defense" and defenseApi or offenseApi

			if activeMode~=nextMode then
				stopBoth()
				activeMode=nextMode
				if nextApi and nextApi.Start then pcall(nextApi.Start) end
			elseif nextApi and nextApi.Refresh then
				pcall(nextApi.Refresh)
			end
			setStatus(nextMode=="defense" and "Defense active" or "Offense active",THEME.GREEN or THEME.TEXT)
		else
			stopBoth()
			setStatus("",THEME.MUTED)
		end

		if sectionFrame then
			sectionFrame.Visible=gameplay
		elseif sectionBody then
			sectionBody.Visible=gameplay
		end

		if toggle then
			toggle.set(available and state.actionStatusOn)
		end

		refreshFooter(available)
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
		if scheduler and scheduler.Unregister then
			scheduler.Unregister("Heartbeat","ESPControls")
		end
		safeDisconnect(heartbeatConn)
		keybindConn=nil
		heartbeatConn=nil
		stopBoth()

		if defenseApi and defenseApi.Destroy then pcall(defenseApi.Destroy) end
		if offenseApi and offenseApi.Destroy then pcall(offenseApi.Destroy) end

		destroyControl(toggle)

		if sectionFrame and sectionFrame.Parent then
			sectionFrame:Destroy()
		elseif sectionBody and sectionBody.Parent then
			sectionBody:Destroy()
		end

		if app.refreshESPStatus then
			pcall(app.refreshESPStatus,false,false)
		end
	end

	local sectionControls=nil
	sectionBody,sectionControls=makeSection(parent,3,"ESP","",{
		headerToggle={
			startState=state.actionStatusOn,
			onChange=function(v)
				api.SetESPState(v,true)
			end,
		},
		compact=true,
	})
	sectionFrame=(sectionControls and sectionControls.section) or (sectionBody and sectionBody.Parent) or nil

	toggle=sectionControls and sectionControls.toggle
	if not toggle then
		toggle=buildToggleRow(sectionBody,"ESP",state.actionStatusOn,function(v)
			api.SetESPState(v,true)
		end)
	end

	local function handleESPInput(input)
		if not isGameplay() then return false end

		local getKey=app.getESPToggleKey or app.getActionToggleKey
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

	if scheduler and scheduler.Register then
		scheduler.Register("Heartbeat","ESPControls",0.25,function()
			syncControls()
		end)
	else
		heartbeatConn=RunService.Heartbeat:Connect(function(dt)
			poll=poll+dt
			if poll<0.25 then return end
			poll=0
			syncControls()
		end)
	end

	syncControls()
	return api
end

return ESP
