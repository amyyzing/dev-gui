# Inferred `GameRemotes.lua`

This is not the official game file. It is an inferred remote lookup/contract map.

```lua
local GameRemotes = {}

function GameRemotes.GetGameplayReEvent(localPlayer)
    local games = Workspace:FindFirstChild("Games")
    if games then
        for _, gameFolder in ipairs(games:GetChildren()) do
            local replicated = gameFolder:FindFirstChild("Replicated")
            local playersFolder = replicated and replicated:FindFirstChild("Players")
            local reEvent = gameFolder:FindFirstChild("ReEvent") or (replicated and replicated:FindFirstChild("ReEvent"))

            if playersFolder and playersFolder:FindFirstChild(localPlayer.Name) and reEvent and reEvent:IsA("RemoteEvent") then
                return reEvent
            end
        end
    end

    local replicatedGames = ReplicatedStorage:FindFirstChild("Games")
    if replicatedGames then
        for _, gameFolder in ipairs(replicatedGames:GetChildren()) do
            local replicated = gameFolder:FindFirstChild("Replicated")
            local reEvent = gameFolder:FindFirstChild("ReEvent") or (replicated and replicated:FindFirstChild("ReEvent"))
            if reEvent and reEvent:IsA("RemoteEvent") then
                return reEvent
            end
        end
    end

    return nil
end

function GameRemotes.GetSquadsReEvent()
    local containers = {
        ReplicatedStorage:FindFirstChild("MiniGames"),
        Workspace:FindFirstChild("MiniGames"),
        Workspace:FindFirstChild("Games") and Workspace.Games:FindFirstChild("MiniGames"),
        ReplicatedStorage:FindFirstChild("Games") and ReplicatedStorage.Games:FindFirstChild("MiniGames"),
    }

    for _, container in ipairs(containers) do
        if container then
            for _, child in ipairs(container:GetChildren()) do
                if child:IsA("Folder") or child:IsA("Model") then
                    local reEvent = child:FindFirstChild("ReEvent")
                    if reEvent and reEvent:IsA("RemoteEvent") then
                        return reEvent, child
                    end
                end
            end
        end
    end

    return nil, nil
end

function GameRemotes.ThrowGameplay(reEvent, aimPoint)
    reEvent:FireServer("Mechanics", "ThrowBall", {
        Target = aimPoint,
        Power = 100,
    })
end

function GameRemotes.ThrowSquads(reEvent, aimPoint)
    reEvent:FireServer("Mechanics", "ThrowBall", {
        Target = aimPoint,
        AutoThrow = false,
        Power = 100,
    })
end

return GameRemotes
```
