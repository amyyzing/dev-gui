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

function ESP.new(ctx,parent)
	local safeDisconnect=ctx.safeDisconnect
	local makeSection=ctx.makeSection
	local buildToggleRow=ctx.buildToggleRow
	local inputToBinding=ctx.inputToBinding
	local state=ctx.State
	local THEME=ctx.THEME
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

	local DefenseModule=ctx.ESPDefenseModule
	local OffenseModule=ctx.ESPOffenseModule

	if DefenseModule and DefenseModule.new then
		local ok,result=pcall(function()
			return DefenseModule.new({THEME=THEME,safeDisconnect=safeDisconnect})
		end)
		defenseApi=ok and result or makeNoop()
	else
		defenseApi=makeNoop()
	end

	if OffenseModule and OffenseModule.new then
		local ok,result=pcall(function()
			return OffenseModule.new({THEME=THEME})
		end)
		offenseApi=ok and result or makeNoop()
	else
		offenseApi=makeNoop()
	end

	local function isGameplay()
		if ctx.getCurrentModeKey then
			return ctx.getCurrentModeKey()=="mode1"
		end

		return true
	end

	local function isDefensePossession()
		local myTeam=getPlayerTeamID(me)
		local offenseTeam=getGameplayOffenseTeam()

		if not isValidGameTeamID(myTeam) or not isValidGameTeamID(offenseTeam) then
			return true
		end

		return offenseTeam~=myTeam
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
		if ctx.refreshESPStatus then
			pcall(ctx.refreshESPStatus,state.actionStatusOn,available)
		end
	end

	local function changed()
		if ctx.onChanged then
			pcall(ctx.onChanged,state)
		end

		refreshFooter(isGameplay() and isDefensePossession())
	end

	local function syncControls()
		local gameplay=isGameplay()
		local defense=gameplay and isDefensePossession()
		local available=gameplay and defense

		if not gameplay then
			state.actionStatusOn=false
			stopBoth()
			setStatus("Gameplay only",THEME.MUTED)
		elseif not defense then
			state.actionStatusOn=false
			stopBoth()
			setStatus("Offense possession",THEME.MUTED)
		elseif state.actionStatusOn then
			if activeMode~="defense" then
				stopBoth()
				activeMode="defense"
				if defenseApi and defenseApi.Start then pcall(defenseApi.Start) end
			elseif defenseApi and defenseApi.Refresh then
				pcall(defenseApi.Refresh)
			end
			setStatus("Defense active",THEME.GREEN or THEME.TEXT)
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
		state.actionStatusOn=(value and isGameplay() and isDefensePossession()) and true or false
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

		if ctx.refreshESPStatus then
			pcall(ctx.refreshESPStatus,false,false)
		end
	end

	local sectionControls=nil
	sectionBody,sectionControls=makeSection(parent,3,"ESP","Gameplay only",{
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
		if not isGameplay() or not isDefensePossession() then return false end

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

	heartbeatConn=RunService.Heartbeat:Connect(function(dt)
		poll+=dt
		if poll<0.25 then return end
		poll=0
		syncControls()
	end)

	syncControls()
	return api
end

return ESP
