# Remote events and `ThrowBall` contract

This file is focused on the game remote shape inferred from the script.

## Gameplay `ReEvent` lookup

Gameplay lookup searches:

1. `Workspace.Games.<gameFolder>.ReEvent`
2. `Workspace.Games.<gameFolder>.Replicated.ReEvent`
3. `ReplicatedStorage.Games.<gameFolder>.ReEvent`
4. `ReplicatedStorage.Games.<gameFolder>.Replicated.ReEvent`

The workspace-side path is accepted only when the corresponding `Replicated.Players` folder contains the local player name.

```lua
local function getGameReEvent()
	local games=Workspace:FindFirstChild("Games")
	if games then
		for _,gameFolder in ipairs(games:GetChildren()) do
			local replicated=gameFolder:FindFirstChild("Replicated")
			local playersFolder=replicated and replicated:FindFirstChild("Players")
			local reEvent=gameFolder:FindFirstChild("ReEvent") or (replicated and replicated:FindFirstChild("ReEvent"))

			if playersFolder and playersFolder:FindFirstChild(LP.Name) and reEvent and reEvent:IsA("RemoteEvent") then
				return reEvent
			end
		end
	end

	local replicatedGames=ReplicatedStorage:FindFirstChild("Games")
	if replicatedGames then
		for _,gameFolder in ipairs(replicatedGames:GetChildren()) do
			local replicated=gameFolder:FindFirstChild("Replicated")
			local reEvent=gameFolder:FindFirstChild("ReEvent") or (replicated and replicated:FindFirstChild("ReEvent"))

			if reEvent and reEvent:IsA("RemoteEvent") then
				return reEvent
			end
		end
	end

	return nil
end
```

## Squads/minigame `ReEvent` lookup

Squads lookup checks the first child folder/model inside several possible minigame containers:

1. `ReplicatedStorage.MiniGames`
2. `Workspace.MiniGames`
3. `Workspace.Games.MiniGames`
4. `ReplicatedStorage.Games.MiniGames`

It returns the first child minigame folder containing a `ReEvent` RemoteEvent.

```lua
local function getSquadsReEvent()
	local containers={}
	local replicatedMiniGames=ReplicatedStorage:FindFirstChild("MiniGames")
	local workspaceMiniGames=Workspace:FindFirstChild("MiniGames")
	local workspaceGames=Workspace:FindFirstChild("Games")
	local replicatedGames=ReplicatedStorage:FindFirstChild("Games")
	local function addContainer(container)
		if container then
			table.insert(containers,container)
		end
	end

	addContainer(replicatedMiniGames)
	addContainer(workspaceMiniGames)
	addContainer(workspaceGames and workspaceGames:FindFirstChild("MiniGames"))
	addContainer(replicatedGames and replicatedGames:FindFirstChild("MiniGames"))

	for _,container in ipairs(containers) do
		local miniGame=getFirstMiniGameFolder(container)
		local reEvent=miniGame and miniGame:FindFirstChild("ReEvent")

		if reEvent and reEvent:IsA("RemoteEvent") then
			return reEvent,miniGame
		end
	end

	return nil,nil
end
```

## Gameplay remote payload

```lua
reEvent:FireServer("Mechanics","ThrowBall",{
    Target = plan.aimPoint,
    Power = 100,
})
```

After sending gameplay throw, the script tries to call `Mechanics:UnequipFootball()`.

## Squads remote payload

```lua
reEvent:FireServer("Mechanics","ThrowBall",{
    Target = plan.aimPoint,
    AutoThrow = false,
    Power = 100,
})
```

## Power mapping

The client script models ball speed as:

```lua
MODEL_BALL_SPEED = 95
REMOTE_DISPLAY_POWER = 100
GAMEPLAY_BALL_POWER = MODEL_BALL_SPEED
SQUADS_BALL_POWER = MODEL_BALL_SPEED
```

The inline comment says the remote receives display power `100` while the server converts incoming `UpdateFootball` power to about `95` model speed.

## Throw remote functions

```lua
	local function fireGameplayThrow(plan)
		local reEvent=getGameReEvent()
		if not reEvent then
			return false,"Gameplay ReEvent missing"
		end

		reEvent:FireServer("Mechanics","ThrowBall",{Target=plan.aimPoint,Power=REMOTE_DISPLAY_POWER}) -- old behavior: fire after release frame
		pcall(function()
			local mechanics=getGlobalMechanics()
			if mechanics and type(mechanics.UnequipFootball)=="function" then
				mechanics:UnequipFootball() -- old behavior: unequip immediately after remote
			end
		end)

		return true,nil
	end
```

```lua
	local function fireSquadsThrow(plan)
		local reEvent=getSquadsReEvent()
		if not reEvent then
			return false,"Squads MiniGames ReEvent missing"
		end

		reEvent:FireServer("Mechanics","ThrowBall",{
			Target=plan.aimPoint,
			AutoThrow=false,
			Power=REMOTE_DISPLAY_POWER, -- must be 100, not plan.speed/95
		})

		return true,nil
	end
```
