# Inferred `FootballFinder.lua`

This is not the official game file. It represents the football object search behavior used by QBAim.

```lua
local FootballFinder = {}

function FootballFinder.Root(character)
    return character and (
        character:FindFirstChild("HumanoidRootPart")
        or character:FindFirstChild("UpperTorso")
        or character:FindFirstChild("Torso")
    )
end

function FootballFinder.LooksLikeFootball(inst, stopContainer)
    while inst and inst ~= stopContainer do
        if tostring(inst.Name):lower():find("football", 1, true) then
            return true
        end
        inst = inst.Parent
    end
    return false
end

function FootballFinder.FindBallPart(container, characterRoot, maxDistance)
    if not container then return nil end

    local direct = container:FindFirstChild("Football")
    if direct then
        if direct:IsA("BasePart") and (direct.Position - characterRoot.Position).Magnitude <= maxDistance then
            return direct
        end
        if direct:IsA("Model") or direct:IsA("Folder") or direct:IsA("Tool") then
            for _, descendant in ipairs(direct:GetDescendants()) do
                if descendant:IsA("BasePart") and (descendant.Position - characterRoot.Position).Magnitude <= maxDistance then
                    return descendant
                end
            end
        end
    end

    for _, descendant in ipairs(container:GetDescendants()) do
        if descendant:IsA("BasePart") and FootballFinder.LooksLikeFootball(descendant, container)
            and (descendant.Position - characterRoot.Position).Magnitude <= maxDistance then
            return descendant
        end
    end

    return nil
end

return FootballFinder
```
