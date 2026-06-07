# Inferred `ArcCenterRig.lua`

This is not the official game file. It describes the `Local.Center` visual arc object used by the client.

```lua
local ArcCenterRig = {}

ArcCenterRig.ExpectedChildren = {
    Center = "Model/Folder/BasePart container under Local",
    C2 = "Attachment used as arc start/release reference",
    C1 = "Attachment used as midpoint/catch solve marker; created if missing",
    C3 = "Attachment used as endpoint",
    Beam = "Beam using C2 -> C3",
}

function ArcCenterRig.GetLocalFolder()
    local miniGames = Workspace:FindFirstChild("MiniGames")
    local gameFolder
    if miniGames and #miniGames:GetChildren() == 1 then
        gameFolder = miniGames:GetChildren()[1]
    else
        local games = Workspace:FindFirstChild("Games")
        gameFolder = games and games:GetChildren()[1]
    end
    return gameFolder and gameFolder:FindFirstChild("Local")
end

function ArcCenterRig.GetOriginalCenter()
    local folder = ArcCenterRig.GetLocalFolder()
    return folder and folder:FindFirstChild("Center"), folder
end

return ArcCenterRig
```

## Runtime use

QBAim clones `Center`, renames the clone to `ClonedCenter`, anchors/non-collides its parts, then adjusts the `C2`, `C1`, and `C3` attachment CFrames every preview update.
