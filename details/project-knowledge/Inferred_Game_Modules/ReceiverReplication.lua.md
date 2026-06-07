# Inferred `ReceiverReplication.lua`

This is not the official game file. It maps client-readable player state used by QBAim.

```lua
local ReceiverReplication = {}

ReceiverReplication.ValidTeamIDs = {
    HomeTeam = true,
    AwayTeam = true,
}

function ReceiverReplication.GetTeamID(player)
    local replicated = player and player:FindFirstChild("Replicated")
    local teamValue = replicated and replicated:FindFirstChild("TeamID")
    if not teamValue then return nil end

    if teamValue:IsA("StringValue") or teamValue:IsA("IntValue") or teamValue:IsA("NumberValue") then
        return tostring(teamValue.Value)
    end

    local ok, value = pcall(function()
        return teamValue.Value
    end)
    if ok then return tostring(value) end
    return nil
end

function ReceiverReplication.IsSameTeam(a, b)
    local ta = ReceiverReplication.GetTeamID(a)
    local tb = ReceiverReplication.GetTeamID(b)
    return ReceiverReplication.ValidTeamIDs[ta] == true
       and ReceiverReplication.ValidTeamIDs[tb] == true
       and ta == tb
end

return ReceiverReplication
```
