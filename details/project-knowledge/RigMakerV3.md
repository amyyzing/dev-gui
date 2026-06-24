# RigMakerV3

## Release-Relevant Notes

- Reviewed on 2026-06-24 from a ByteFall/Potassium dump.
- This is a rig/outfit/uniform assembly module. It builds player rigs, applies outfits, handles jersey numbers/name tags, updates humanoid scaling, and welds accessory/item handles onto body attachments.
- It does not contain football throw release logic. No `ThrowBall`, `UpdateFootball`, `SpawnPos`, `C2`, `C3`, release marker, or football launch remote path appears in this module.
- The useful part for QB aim diagnostics is character geometry: `SetScale`, `UpdateScaling`, `FindAttachment`, and `AttachItem` show that visual items are attached by Roblox attachments/welds and that body scale can affect accessory/handle placement.
- `HasCharacterLoaded` checks for key body fragments including hands, torso, and root, but this module does not prove that the throw origin comes from hand/torso/root. It only shows how the visual rig is assembled.
- Practical takeaway: do not use this module as the source of release timing. Use it only as background for why visual body parts, accessories, uniforms, and humanoid scale may not be a reliable launch-origin reference.

-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[1]:GetChildren()[5]:GetChildren()[7]
-- Took 0.45s to decompile.
-- Executor: Potassium (v2.2.5)

-- Decompiled using ByteFall
-- discord.gg/bytefall
local t1 = {
    Locker = {},
    Street = { Shirt = true, Pants = true }
}

game:GetService("RunService")
require(game.ReplicatedStorage.Assets.Modules.Shared.Types.Outfits)

local t2 = {
    Rigs = {},
    TIMEOUT = 2.5,
    DataFiles = nil,
    GlobalVariables = nil,
    Variables = nil,
    Directory = script,
    NumberApply = require(script.NumberApply),
    FontMaker = require(script.FontMaker)
}

t2.__index = t2
require(game.ReplicatedStorage.Assets.Modules.Shared.Types.Ranked)

function t2.new(p1, p2, p3, p4)
    if t2.Rigs[p1] then
        t2.Rigs[p1]:Destroy()
        t2.Rigs[p1] = nil
    end

    local v7 = setmetatable({}, t2)

    v7.Queue = {}
    v7.Index = p1
    v7.Items = {}
    v7.Rig = nil
    v7.Dequeued = false
    v7.LastAppliedOutfit = nil
    v7.ApplyOutfitOnCharAdded = true
    v7.UpdateRigOnCharAdded = true
    v7.CurrentJerseyNumber = ""
    v7.LastOutfitType = ""

    if not p1:IsA("Player") and not p1:IsA("FakePlayer") then
        v7.Rig = p1
        v7.Connections = {}
        v7.Connections.RigRemoving = p1.Destroying:Connect(function()
            v7:Destroy()
        end)
    else
        v7.Player = p1

        if not v7.Player or not p1 or not p1.Parent then
            return
        end

        v7.TeamID = p1:WaitForChild("Replicated", 60):WaitForChild("TeamID", 60)
        v7.GameID = p1.Replicated:WaitForChild("GameID", 60)
        v7.Rig = v7.Player.Character
        v7.Connections = {}
        v7.Connections.PlayerRemoving = p1.AncestryChanged:Connect(function(_, p6)
            if not p6 then
                v7:Destroy()
            end
        end)
        v7.Connections.CharacterAdded = p1.CharacterAdded:Connect(function(p7)
            v7.Rig = p7
            t2.Variables.Functions.Outfits:UpdateUniforms({ v7.Player })
        end)
        v7.Connections.GameIDChanged = v7.GameID:GetPropertyChangedSignal("Value"):Connect(function()
            t2.Variables.Functions.Outfits:UpdateUniforms({ v7.Player })
        end)

        if t2.GlobalVariables:GetPlaceIDSettings(game.PlaceId).Index:lower():match("gameplay") then
            v7.Connections.TeamChanged = v7.TeamID.Changed:Connect(function()
                if v7.TeamID.Value ~= "Unpicked" and v7.TeamID.Value ~= "Spectators" then
                    t2.Variables.Functions.Outfits:UpdateUniforms({ v7.Player })
                end
            end)
        end

        local v8 = t2.GlobalVariables
        local v9 = tostring(v7.Player)

        v8:Console("RigMaker", "Finished .new() for: " .. v9)
    end

    t2.Rigs[v7.Index] = v7

    if p2 then
        v7:ApplyOutfit(p3, p4)
    end

    return v7
end
function t2.Destroy(p8)
    if p8.Rig then
        t2.GlobalVariables:UnregisterScrollingItemsIn(p8.Rig)
    end

    if p8.Connections then
        for _, v in pairs(p8.Connections) do
            local v13 = string.lower
            local v14 = typeof(v)

            if v13(v14) == "table" then
                for _, v2 in pairs(v) do
                    v2:Disconnect()
                end
            else
                v:Disconnect()
            end
        end
    end

    p8.Connections = nil
    t2.Rigs[p8.Index] = nil
    setmetatable(p8, nil)
end
function t2.SetScale(p9, p10, p11)
    local function adjust(p12, p13, p14, p15)
        for _, v in ipairs(p12:GetDescendants()) do
            if v.Name == "AccessoryWeld" then
                v:Destroy()
            end
        end

        for v509, v510 in p10.Head:GetChildren() do
            if v510:IsA("Weld") and v510.Name == "HeadWeld" then
                v510:Destroy()
            end
        end

        local v511 = p12.Handle:FindFirstChildOfClass("SpecialMesh")

        if v511 then
            local OriginalSizeValue = v511.OriginalSize.Value

            v511.Scale = Vector3.new(OriginalSizeValue.X * p14, OriginalSizeValue.Y * p13, OriginalSizeValue.Z * p15)
        end

        for _, v in pairs(p12:GetChildren()) do
            if (v:IsA("BasePart") or v:IsA("MeshPart")) and not v:FindFirstChildOfClass("WrapLayer") then
                local v515 = v.OriginalSize.Value

                v.Size = Vector3.new(v515.X * p14, v515.Y * p13, v515.Z * p15)

                if v.Name == "Handle" then
                    local v516 = v:FindFirstChildOfClass("Attachment")

                    if v516 then
                        local v517 = nil

                        for v518, v519 in t2.GlobalVariables.BodyParts, nil, nil do
                            local v520 = p10:FindFirstChild(v519)

                            if v520 and v520:FindFirstChild(v516.Name) then
                                v517 = v520[v516.Name]

                                break
                            end
                        end

                        if v517 then
                            local v521 = v517.Axis
                            local v522 = v517.SecondaryAxis
                            local v523 = v521:Cross(v522).Unit
                            local v524 = v516.Axis
                            local v525 = v516.SecondaryAxis
                            local v526 = v524:Cross(v525).Unit
                            local v527 = v517:FindFirstChild("OriginalPosition")
                            local v528 = v527 and v527.Value or v517.Position

                            v.RigMakerV3_Weld.C0 = CFrame.new(v528.X * p15, v528.Y * p13, v528.Z * p14, v521.X, v522.X, v523.X, v521.Y, v522.Y, v523.Y, v521.Z, v522.Z, v523.Z)

                            local v529 = v516:FindFirstChild("OriginalPosition")
                            local v530 = v529 and v529.Value or v516.Position

                            v.RigMakerV3_Weld.C1 = CFrame.new(v530.X * p15, v530.Y * p13, v530.Z * p14, v524.X, v525.X, v526.X, v524.Y, v525.Y, v526.Y, v524.Z, v525.Z, v526.Z)
                        end
                    end
                else
                    local n1 = v.Position - p12.Handle.Position
                    local vPosition = v.Position
                    local vector3 = Vector3.new(n1.X * (p14 - 1), n1.Y * (p13 - 1), n1.Z * (p15 - 1))

                    v.Position = vPosition + vector3
                end
            end
        end
    end
    local function adjustHeadAccessory(p16, p17)
        for _, v in pairs(p16:GetChildren()) do
            if v:IsA("BasePart") or v:IsA("MeshPart") then
                local vSize = v.Size

                v.Size = Vector3.new(vSize.X * p17, vSize.Y * p17, vSize.Z * p17)

                if v.Name == "Handle" then
                    local v539 = v:FindFirstChildOfClass("Attachment")

                    if v539 then
                        local v540 = nil

                        for v541, v542 in t2.GlobalVariables.BodyParts, nil, nil do
                            local v543 = p10:FindFirstChild(v542)

                            if v543 and v543:FindFirstChild(v539.Name) then
                                v540 = v543[v539.Name]

                                break
                            end
                        end

                        if v540 then
                            local v544 = v540.Axis
                            local v545 = v540.SecondaryAxis
                            local v546 = v544:Cross(v545).Unit
                            local v547 = v539.Axis
                            local v548 = v539.SecondaryAxis
                            local v549 = v547:Cross(v548).Unit
                            local v550 = v540:FindFirstChild("OriginalPosition")
                            local v551 = v550 and v550.Value or v540.Position

                            v.RigMakerV3_Weld.C0 = CFrame.new(v551.X * p17, v551.Y * p17, v551.Z * p17, v544.X, v545.X, v546.X, v544.Y, v545.Y, v546.Y, v544.Z, v545.Z, v546.Z)

                            local v552 = v539:FindFirstChild("OriginalPosition")
                            local v553 = v552 and v552.Value or v539.Position

                            v.RigMakerV3_Weld.C1 = CFrame.new(v553.X * p17, v553.Y * p17, v553.Z * p17, v547.X, v548.X, v549.X, v547.Y, v548.Y, v549.Y, v547.Z, v548.Z, v549.Z)
                        end
                    end
                else
                    local n1 = v.Position - p16.Handle.Position
                    local vPosition = v.Position
                    local vector3 = Vector3.new(n1.X * (p17 - 1), n1.Y * (p17 - 1), n1.Z * (p17 - 1))

                    v.Position = vPosition + vector3
                end
            end
        end
    end

    if p11:FindFirstChild("Handle") then
        local u22 = false

        for _, v in pairs(p11.Handle:GetChildren()) do
            if v:IsA("Attachment") and p9.Rig and p9.Rig:FindFirstChild("Head") and p9.Rig.Head:FindFirstChild((tostring(v.Name))) then
                u22 = true

                break
            end
        end

        if u22 then
            local v25 = p9.Rig.Humanoid:FindFirstChild("HeadScale")

            if v25 then
                adjustHeadAccessory(p11, v25.Value)
            end

            return
        end

        if p11.Handle:FindFirstChildWhichIsA("Attachment", true) and p9.Rig and p9.Rig:FindFirstChild("Humanoid") then
            local v26 = p9.Rig.Humanoid:FindFirstChild("BodyHeightScale")
            local v27 = p9.Rig.Humanoid:FindFirstChild("BodyWidthScale")
            local v28 = p9.Rig.Humanoid:FindFirstChild("BodyDepthScale")

            if v26 and v27 and v28 then
                adjust(p11, v26.Value, v27.Value, v28.Value)
            end
        end

        return
    end
end
function t2.ConnectScalingEvents(p18, p19)
    if p18.ScaleConnections then
        for _, v in pairs(p18.ScaleConnections) do
            if v then
                v:Disconnect()
            end
        end
    end

    p18.ScaleConnections = {
        p18.Rig.Humanoid.BodyWidthScale.Changed:Connect(function()
            for _, v in pairs(p18.Rig:GetChildren()) do
                if v:IsA("Accessory") then
                    p18:SetScale(p18.Rig, v)
                end
            end

            p18:AddJerseyNumbers(p19)
        end),
        p18.Rig.Humanoid.BodyDepthScale.Changed:Connect(function()
            for _, v in pairs(p18.Rig:GetChildren()) do
                if v:IsA("Accessory") then
                    p18:SetScale(p18.Rig, v)
                end
            end

            p18:AddJerseyNumbers(p19)
        end),
        p18.Rig.Humanoid.BodyHeightScale.Changed:Connect(function()
            for _, v in pairs(p18.Rig:GetChildren()) do
                if v:IsA("Accessory") then
                    p18:SetScale(p18.Rig, v)
                end
            end

            p18:AddJerseyNumbers(p19)
        end),
        p18.Rig.AncestryChanged:Connect(function(_, p21)
            if p21 == nil then
                for _, v in pairs(p18.ScaleConnections) do
                    if v then
                        v:Disconnect()
                    end
                end

                p18.ScaleConnections = nil
            end
        end)
    }
end
function t2.FindAttachment(p22, p23, p24)
    local t3 = {}

    for _, v in pairs(p23.Handle:GetChildren()) do
        if v:IsA("Attachment") then
            t3[#t3 + 1] = v
        end
    end

    local t4 = {}

    for v40, v41 in t2.GlobalVariables.BodyParts, nil, nil do
        local v42 = p22.Rig:WaitForChild(v41, 60)

        if v42 then
            for v43, v44 in v42:GetChildren() do
                if v44:IsA("Attachment") then
                    t4[#t4 + 1] = v44
                end
            end
        end
    end

    for v45, v46 in t3, nil, nil do
        for v47, v48 in t4, nil, nil do
            local v49 = tostring(v48)
            local v50 = tostring(v46)

            if v49 == v50 then
                return p24 == "Accessory" and v46 or v48
            end
        end
    end
end
function t2.AttachItem(p25, p26, p27, p28)
    local function weldItemAttachments(p29, p30, p31)
        local Weld = Instance.new("Weld")

        Weld.Part0 = p29.Parent
        Weld.Part1 = p30.Parent
        Weld.C0 = p29.CFrame
        Weld.C1 = p31 ~= nil and p30.CFrame + p31 or p30.CFrame
        Weld.Parent = p30.Parent
        Weld.Name = "RigMakerV3_Weld"
    end

    p26.Parent = p25.Rig

    local v56 = p26:FindFirstChild("Handle")

    if v56 then
        v56.Anchored = false
        v56.CanCollide = false

        for _, v in pairs(p26:GetDescendants()) do
            if v:IsA("WeldConstraint") or v:IsA("Weld") then
                v:Destroy()
            end
        end

        local t5 = {}

        for _, v in pairs(p26:GetDescendants()) do
            if v:IsA("Motor6D") and v.Part1 then
                t5[v.Part1] = true
            end
        end

        for _, v in pairs(p26:GetDescendants()) do
            if v:IsA("BasePart") then
                if v.Name ~= "Handle" and not t5[v] then
                    local WeldConstraint = Instance.new("WeldConstraint")

                    WeldConstraint.Part0 = v
                    WeldConstraint.Part1 = v56
                    WeldConstraint.Enabled = true
                    WeldConstraint.Parent = v
                end

                if t5[v] then
                    v.CanCollide = false
                    v.Anchored = false
                end

                if not v:FindFirstChild("OriginalSize") then
                    local Vector3Value = Instance.new("Vector3Value")

                    Vector3Value.Name = "OriginalSize"
                    Vector3Value.Value = v.Size
                    Vector3Value.Parent = v
                end

                local v66 = v56:FindFirstChildOfClass("Attachment")
                local Vector3Value = v66:FindFirstChild("OriginalPosition")

                if not Vector3Value then
                    Vector3Value = Instance.new("Vector3Value")
                    Vector3Value.Name = "OriginalPosition"
                    Vector3Value.Parent = v66
                end

                Vector3Value.Value = v66.Position
            elseif v:IsA("SpecialMesh") and not v:FindFirstChild("OriginalSize") then
                local Vector3Value = Instance.new("Vector3Value")

                Vector3Value.Name = "OriginalSize"
                Vector3Value.Value = v.Scale
                Vector3Value.Parent = v
            end
        end

        local v69 = p25:FindAttachment(p26, "Accessory")
        local v70

        if p28 then
            local v71 = p26:FindFirstChild(p28.Name, true)
            local Weld = Instance.new("Weld")

            Weld.Part0 = p28.Parent
            Weld.Part1 = v71.Parent
            Weld.C0 = p28.CFrame
            Weld.C1 = v71.CFrame
            Weld.Parent = v71.Parent
            Weld.Name = "RigMakerV3_Weld"
        elseif v69 then
            local v73 = p25:FindAttachment(p26, "Character")

            if not v73 then
                local v74 = t2.GlobalVariables
                local v75 = tostring(p26)
                local v76 = tostring(p25.Player)

                v74:Console("RigMaker", "Missing attachment! " .. v75 .. " for " .. v76, "Warn")
            else
                local v77 = t2.GlobalVariables
                local v78 = tostring(p26)

                v70 = p25.Player

                local v79 = tostring(v70)

                v77:Console("RigMaker", "Attaching " .. v78 .. " for " .. v79 .. " to version ")

                local Weld = Instance.new("Weld")

                Weld.Part0 = v73.Parent
                Weld.Part1 = v69.Parent
                Weld.C0 = v73.CFrame
                Weld.C1 = p27 ~= nil and v69.CFrame + p27 or v69.CFrame
                Weld.Parent = v69.Parent
                Weld.Name = "RigMakerV3_Weld"
            end
        end

        task.delay(0.01, function()
            if not p25.SetScale or not p25.Rig then
                return
            end

            p25:SetScale(p25.Rig, p26)
        end)

        local v81 = p26:FindFirstChildOfClass("AnimationController")

        if not v81 then
            for v82, v83 in p26:GetDescendants() do
                if v83:IsA("AnimationController") then
                    v81 = v83

                    break
                end
            end
        end

        local s1 = v81 and v81:FindFirstChildOfClass("Animator")
        local v85 = p26:FindFirstChild("ItemAnim", true)

        if s1 and v85 then
            task.defer(function()
                if not p26.Parent then
                    return
                end

                local v571 = s1:LoadAnimation(v85)

                v571.Looped = true
                v571:Play()
            end)
        end

        local v86 = p26:FindFirstChild("HueCycle", true)

        if v86 and v86:IsA("BoolValue") and v86.Value then
            local t6 = {}

            for v88, v89 in p26:GetDescendants() do
                if v89:IsA("BasePart") and v89.Name ~= "Handle" then
                    local v90, v70, v91 = v89.Color:ToHSV()

                    table.insert(t6, {
                        part = v89,
                        s = if v70 < 0.1 then 1 else v70,
                        v = if v91 < 0.1 then 1 else v91
                    })
                end
            end

            if #t6 > 0 then
                task.spawn(function()
                    while p26.Parent do
                        local v572 = os.clock()

                        for v573, v574 in t6, nil, nil do
                            local v575 = Color3.fromHSV(v572 % 10 / 10, v574.s, v574.v)

                            v574.part.Color = v575

                            for v576, v577 in v574.part:GetChildren() do
                                if v577:IsA("ParticleEmitter") then
                                    v577.Color = ColorSequence.new(v575)
                                end
                            end
                        end

                        task.wait(0.03)
                    end
                end)
            end
        end
    end
end
function t2.AddItem(p32, p33, p34, p35)
    local v96 = p34 ~= nil and p34.ItemInfo ~= nil and p34.ItemInfo or t2.GlobalVariables:GetItemInfo(p33)

    if v96 then
        if v96.ItemType == "Sock" and (not not p32.Rig:FindFirstChild("JERSEY_LeftOverrideSock") or not not p32.Rig:FindFirstChild("JERSEY_RightOverrideSock")) then
            return
        end

        if v96.ItemType == "Mouth" or v96.ItemType == "Eyes" then
            local v97 = p32.Rig:WaitForChild("Head", t2.TIMEOUT)

            if not v97 then
                t2.GlobalVariables:Console("RigMaker", "Did not find head. Aborting AddItem")

                return
            end

            local v98 = v97:FindFirstChild("face")

            if v98 then
                if v96.ItemType == "Mouth" and (v97:FindFirstChild("eyes") == nil or v97:FindFirstChild("eyes").Texture == "") then
                    v98.Texture = "rbxassetid://9636014010"
                elseif v96.ItemType == "Eyes" and (v97:FindFirstChild("mouth") == nil or v97:FindFirstChild("mouth").Texture == "") then
                    v98.Texture = "rbxassetid://9636014014"
                else
                    v98.Texture = ""
                end
            end

            local Decal = v97:FindFirstChild(string.lower(v96.ItemType))

            if not Decal then
                Decal = Instance.new("Decal")
                Decal.Name = string.lower(v96.ItemType)
                Decal.Parent = v97
            end

            Decal.Texture = "rbxassetid://" .. tostring(v96.AssetId)

            return
        end

        if v96.ItemType ~= "Shirt" and v96.ItemType ~= "Undershirt" and v96.ItemType ~= "Pants" then
            if (t2.DataFiles ~= nil and not not game.Players.LocalPlayer and t2.DataFiles[game.Players.LocalPlayer.Name] ~= nil and t2.DataFiles[game.Players.LocalPlayer.Name].ProfileData.GraphicsSettings.Accessories or nil) == false then
                return
            end

            local v100 = t2.GlobalVariables:GetItemAsset(p33)
            local v101 = v100:FindFirstChild("SourceItem")

            if not v101 or not v101:IsA("Accessory") then
                return
            end

            if p34 and p34.Side == "Left" and v100:FindFirstChild("SourceLeft") then
                v101 = v100.SourceLeft
            end

            local clone = v101:Clone()

            if p34 then
                p34.AddDefault = false
            else
                p34 = { AddDefault = false }
            end

            if t2.GlobalVariables.DefaultItems[v96.ItemType] then
                p32:RemoveItem(t2.GlobalVariables.DefaultItems[v96.ItemType], p34)
            elseif p34 and p34.Side ~= nil and t2.GlobalVariables.DefaultItems[p34.Side .. v96.ItemType] then
                p32:RemoveItem(t2.GlobalVariables.DefaultItems[p34.Side .. v96.ItemType], p34)
            end

            p32:RemoveItem(p33, p34)

            if v96.ItemType ~= "Cleat" then
                if v96.ItemType == "Shell" or v96.ItemType == "Helmet" then
                    local v103, v104, v105 = p32:GetSetting({ "TeamFolder", "Helmet", "GameTeamAssets" }, p35)
                    local v106 = t2.GlobalVariables
                    local v107 = tostring(v103)
                    local v108 = v106:GetUniform(v107, v104, v105)

                    if v108 and v108:FindFirstChild("OverrideHelmet") and v108:FindFirstChild("OverrideHelmet").Value then
                        clone = script.Assets.LeagueHelmet:Clone()
                    end

                    if v96.ItemType == "Shell" and v108 ~= nil then
                        for _, v in pairs(v108.HelmetInfo:GetChildren()) do
                            if v:IsA("Decal") then
                                local clone2 = v:Clone()

                                clone2.Parent = clone.Handle
                            end
                        end
                    end

                    for _, v in pairs(clone:GetDescendants()) do
                        if v.Name == "Handle" then
                            if v96.ItemType ~= "Shell" then
                                if v96.ItemType == "Helmet" and v108 ~= nil then
                                    v.Color = v108.HelmetInfo.BarColor.Value
                                end
                            elseif v108 ~= nil then
                                v.Color = v108.HelmetInfo.MainColor.Value
                            end
                        elseif v.Name == "VisorAttachment" then
                            v:Destroy()
                        end
                    end
                end
            elseif p34 and p34.Side ~= nil then
                p32.Rig[p34.Side .. "Foot"].Transparency = 1
            end

            if p34 and p34.Side then
                local t7 = {}

                for _, v in ipairs(clone:GetChildren()) do
                    if v:IsA("BasePart") and string.match(v.Name:lower(), "handle") then
                        t7[#t7 + 1] = v
                    end
                end

                for _, v in pairs(t7) do
                    local v119 = v:FindFirstChildWhichIsA("Attachment")

                    if v119 then
                        local v120 = v119.Name

                        if not string.lower(v119.Name):match(p34.Side:lower()) then
                            v119.Name = p34.Side .. v119.Name
                        end

                        local v121 = t2.GlobalVariables.DefaultItemSizes
                        local v122 = tostring(category)

                        if v121[v122] then
                            local v123 = t2.GlobalVariables.DefaultItemSizes
                            local v124 = tostring(category)
                            local v125 = v123[v124].SourceLeft == nil and t2.GlobalVariables.DefaultItemSizes[tostring(category)].Source == nil and t2.GlobalVariables.DefaultItemSizes[tostring(category)][v96.AccessoryType]

                            if not v125 then
                                local v126 = t2.GlobalVariables.DefaultItemSizes
                                local v127 = tostring(category)

                                v125 = v126[v127]
                            end

                            if v125[clone.Name] then
                                local v128 = nil

                                for _, v3 in pairs(v125[clone.Name]) do
                                    if v120 == v3.Name then
                                        v128 = v3

                                        break
                                    end
                                end

                                if v128 and v128[p34.Side .. "CFrame"] then
                                    v119.CFrame = v128[p34.Side .. "CFrame"]
                                end
                            end
                        end
                    end
                end
            end

            clone.Name = p33

            if p34 then
                for k, v in pairs(p34) do
                    clone:SetAttribute(k, v)
                end
            end

            clone:SetAttribute("ItemType", v96.ItemType)

            if v96.ItemType == "ArmAccessory" or v96.ItemType == "LegAccessory" then
                local t8 = {}

                for _, v in ipairs(clone:GetChildren()) do
                    local v136 = string.match
                    local v137 = v.Name:lower()

                    if v136(v137, "handle") and v.Name ~= "Handle" then
                        t8[#t8 + 1] = v
                    end
                end

                if #t8 > 0 then
                    for k, v in pairs(t8) do
                        local Accessory = Instance.new("Accessory")
                        local v141 = clone.Name
                        local v142 = tostring(k)

                        Accessory.Name = v141 .. "_" .. v142

                        for _, v4 in pairs(clone:GetChildren()) do
                            if v4.Name:sub(1, 8) == "Material" and v4.Name:match("%d+") == v.Name:match("%d+") then
                                if v4.Material ~= Enum.Material.Neon then
                                    v4.Transparency = 1
                                end

                                v4.Parent = Accessory
                                v4.Name = "Material"
                            end
                        end

                        v.Name = "Handle"
                        v.Parent = Accessory
                        Accessory:SetAttribute("AccessoryLink", clone.Name)

                        if p34 then
                            for k2, v5 in pairs(p34) do
                                Accessory:SetAttribute(k2, v5)
                            end
                        end

                        Accessory:SetAttribute("ItemType", v96.ItemType)
                        p32:AttachItem(Accessory)
                        t2.GlobalVariables:RegisterScrollingItem(Accessory, v96)
                    end
                end
            end

            local v147 = nil

            if v96.ItemType == "Visor" then
                local v148 = p32:GetOutfit().Customizables.Head.Shell

                if v148 and v148.ItemName == "" then
                    v148.ItemName = t2.GlobalVariables.DefaultItems.Shell
                end

                local v149 = v148 and t2.GlobalVariables:GetItemAsset(v148.ItemName):FindFirstChild("SourceItem")

                if v149 then
                    v147 = v149:GetAttribute("VisorOffset")
                end
            elseif v96.ItemType == "Mouthpiece" then
                local v150 = p32:GetOutfit().Customizables.Head.Helmet

                if v150 and v150.ItemName == "" then
                    v150.ItemName = t2.GlobalVariables.DefaultItems.Helmet
                end

                if v150 then
                    local v151 = clone:FindFirstChild("MouthGuardAttachment", true)
                    local v152 = p32.Rig:FindFirstChild(v150.ItemName, true)
                    local v153 = v152 and v152:FindFirstChild("MouthGuardAttachment", true)

                    if v153 and v151 then
                        p32:AttachItem(clone, nil, v153)
                        t2.GlobalVariables:RegisterScrollingItem(clone, v96)

                        return
                    end
                end
            elseif v96.ItemType == "Helmet" then
                p32:AttachItem(clone, nil, nil)
                t2.GlobalVariables:RegisterScrollingItem(clone, v96)

                local v154 = p32:GetOutfit().Customizables.Head.Mouthpiece
                local v155 = v154 and v154.ItemName ~= "" and p32.Rig:FindFirstChild(v154.ItemName, true)

                if v155 then
                    local v156 = v155:FindFirstChild("MouthGuardAttachment", true)
                    local v157 = clone:FindFirstChild("MouthGuardAttachment", true)

                    if v156 and v157 then
                        p32:AttachItem(v155, nil, v157)

                        return
                    end

                    return
                end

                return
            end

            p32:AttachItem(clone, v147)
            t2.GlobalVariables:RegisterScrollingItem(clone, v96)

            return
        end

        local s1 = if v96.ItemType == "Shirt" or v96.ItemType == "Undershirt" then "Shirt" else "Pants"
        local v159 = t2.GlobalVariables:GetItemInfo(p33)

        if v159.LayeredCloth and v159.LayeredCloth == "Yes" then
            local s2 = "Layered_" .. s1
            local v161 = p32.Rig:FindFirstChild(s2)

            if v161 then
                local v162 = v161:GetAttribute("AccessoryLink")

                if p33 == v162 then
                    return
                end

                t2.GlobalVariables:UnregisterScrollingItem(v161)
                v161:Destroy()
            end

            local v163 = t2.GlobalVariables:GetItemAsset(p33):FindFirstChild("SourceItem")

            if not v163 then
                local v164 = tostring(p33)

                warn("No source found for item: " .. v164)

                return
            end

            local clone = v163:Clone()
            local v166 = clone:FindFirstChild("Handle")

            if v166 then
                v166.Transparency = 1
                task.delay(0.1, function()
                    if v166 and v166.Parent then
                        v166.Transparency = 0
                    end
                end)
            end

            clone.Name = s2
            clone:SetAttribute("AccessoryLink", p33)
            clone:SetAttribute("ItemType", v159.ItemType)
            clone.Parent = p32.Rig

            local v167 = p32.Rig:FindFirstChildOfClass(s1)

            if v167 then
                v167[s1 .. "Template"] = ""
            end

            p32:AttachItem(clone)
            t2.GlobalVariables:RegisterScrollingItem(clone, v159)

            return
        end

        local v168 = p32.Rig:FindFirstChild("Layered_" .. s1)

        if v168 then
            t2.GlobalVariables:UnregisterScrollingItem(v168)
            v168:Destroy()
        end

        local v169 = p32.Rig:FindFirstChildOfClass(s1) or Instance.new(s1)

        v169.Name = p33
        v169[s1 .. "Template"] = "rbxassetid://" .. tostring(v159.AssetId)
        v169.Parent = p32.Rig

        if v159.ItemType == "Undershirt" then
            p32:AddJersey(p35)

            return
        end
    else
        t2.GlobalVariables:Console("RigMaker", "Did not find iteminfo. Aborting AddItem.")
    end
end
function t2.RemoveItem(p36, p37, p38, p39)
    local v174 = p38 ~= nil and p38.ItemInfo ~= nil and p38.ItemInfo or t2.GlobalVariables:GetItemInfo(p37)

    if v174 then
        if v174.ItemType == "Mouth" or v174.ItemType == "Eyes" then
            local v175 = p36.Rig:FindFirstChild("Head")

            if v175 then
                local v176 = p36.Rig.Head:FindFirstChild(v174.ItemType:lower())

                if v176 then
                    v176.Texture = ""
                end

                local v177 = v175:FindFirstChild("face")

                if v177 then
                    if v174.ItemType == "Mouth" and (v175:FindFirstChild("eyes") == nil or v175.eyes.Texture == "") then
                        v177.Texture = "rbxasset://textures/face.png"

                        return
                    end

                    if v174.ItemType == "Eyes" and (v175:FindFirstChild("mouth") == nil or v175.mouth.Texture == "") then
                        v177.Texture = "rbxasset://textures/face.png"

                        return
                    end

                    if v174.ItemType == "Mouth" then
                        v177.Texture = "rbxassetid://9636014014"

                        return
                    end

                    if v174.ItemType == "Eyes" then
                        v177.Texture = "rbxassetid://9636014010"

                        return
                    end
                end
            end
        elseif v174.ItemType == "Shirt" or v174.ItemType == "Pants" or v174.ItemType == "Undershirt" then
            for _, v in ipairs(p36.Rig:GetChildren()) do
                if v:IsA(v174.ItemType) then
                    t2.GlobalVariables:UnregisterScrollingItem(v)
                    v:Destroy()
                end
            end

            if v174.ItemType == "Undershirt" then
                p36:AddJersey(p39)

                return
            end

            if p38 and p38.AddDefault == true then
                p36:AddItem(t2.GlobalVariables.DefaultItems[v174.ItemType], nil, p39)

                return
            end
        else
            for _, v in ipairs(p36.Rig:GetChildren()) do
                if (p37 == v.Name or p37 == v:GetAttribute("AccessoryLink")) and (p38.Customizable == nil or v:GetAttribute("Customizable") == p38.Customizable) then
                    if p38 and p38.Side then
                        local v182 = v:FindFirstChildWhichIsA("Attachment", true)

                        if v182 and v182.Name:lower():match(p38.Side:lower()) then
                            t2.GlobalVariables:UnregisterScrollingItem(v)
                            v:Destroy()
                        end
                    else
                        t2.GlobalVariables:UnregisterScrollingItem(v)
                        v:Destroy()
                    end
                end
            end

            if p38 and p38.AddDefault == true then
                if t2.GlobalVariables.DefaultItems[v174.ItemType] then
                    p36:AddItem(t2.GlobalVariables.DefaultItems[v174.ItemType], p38, p39)

                    return
                end

                if p38 and p38.Side ~= nil and t2.GlobalVariables.DefaultItems[p38.Side .. v174.ItemType] then
                    p36:AddItem(t2.GlobalVariables.DefaultItems[p38.Side .. v174.ItemType], p38, p39)

                    return
                end
            end
        end
    else
        t2.GlobalVariables:Console("RigMaker", "Did not find iteminfo. Aborting RemoveItem.")
    end
end
function t2.AddJerseyNumbers(p40, p41)
    local v185 = p40:GetOutfit()

    if v185 == nil or v185.Type ~= "Locker" then
        return
    end

    local v186, v187, v188, v189 = p40:GetSetting({ "TeamFolder", "Numbers", "JerseyNumber", "GameTeamAssets" }, p41)

    if v186 and v187 and v188 then
        if p41 and p41.JerseyNumber ~= nil then
            p40.CurrentJerseyNumber = p41.JerseyNumber
        elseif p41 and p41.Offensive == true then
            p40.CurrentJerseyNumber = "OffensiveNumber"
        elseif p40.Player ~= nil and p40.GameID ~= nil and p40.GameID.Value ~= "" then
            p40.CurrentJerseyNumber = "DefensiveNumber"

            local v190 = p40:GetSetting("Team", p41)
            local v191 = game.ReplicatedStorage.Games:FindFirstChild(p40.GameID.Value) or game.ReplicatedStorage.MiniGames:FindFirstChild(p40.GameID.Value)

            if v190 and v191 then
                local v192 = game.ReplicatedStorage.Assets.TeamAssets
                local v193 = tostring(v190)

                if v192:FindFirstChild(v193) then
                    local HomeTeamValue = v191.HomeTeam.Value
                    local v195 = tostring(v190)

                    v190 = if HomeTeamValue == v195 then "HomeTeam" else "AwayTeam"
                end

                if v190 == v191.GameStatus.Offense.Value then
                    p40.CurrentJerseyNumber = "OffensiveNumber"
                end
            end
        end

        local v196 = t2.GlobalVariables
        local v197 = tostring(v186)
        local v198 = v196:GetUniform(v197, v187, v186)

        if v198 == nil then
            return
        end

        local v199 = p40.Rig:FindFirstChild("Humanoid")

        if v199 then
            v199:FindFirstChild("BodyWidthScale")
            v199:FindFirstChild("BodyHeightScale")
            v199:FindFirstChild("BodyDepthScale")
        end

        local v200 = game.HttpService:JSONDecode(v198.Configuration.Value)

        v200.Model = p40.Rig
        v200.Number = tonumber(v188)
        t2.NumberApply:ApplyNumbers(v200)

        return
    end
end
function t2.AddJersey(p42, p43)
    local v203 = p42:GetOutfit()
    local v204, v205, v206, v207 = p42:GetSetting({ "Jersey", "Pants", "TeamFolder", "GameTeamAssets" }, p43)
    local v208 = t2.GlobalVariables
    local v209 = tostring(v206)
    local v210 = v208:GetUniform(v209, v204, v207)
    local v211 = t2.GlobalVariables
    local v212 = tostring(v206)
    local v213 = v211:GetUniform(v212, v205, v207)

    if v210 == nil or v213 == nil then
        return
    end

    local v214 = p42.Rig:FindFirstChildOfClass("Shirt")

    if v214 and v203.Customizables.Torso.Undershirt.ItemName == "" and (p43 == nil or p43.Undershirt ~= true) then
        v214.ShirtTemplate = ""
    end

    local v215 = p42.Rig:FindFirstChildOfClass("Pants")

    if v215 then
        v215.PantsTemplate = ""
    end

    for _, v in ipairs(p42.Rig:GetChildren()) do
        if v.Name:match("JERSEY_") then
            v:Destroy()
        end
    end

    local v218 = p43 ~= nil and p43.JerseyTag ~= nil and string.upper((tostring(p43.JerseyTag))) or v203.AvatarAttributes.JerseyTag ~= nil and string.match(v203.AvatarAttributes.JerseyTag, "%w") ~= nil and string.upper((tostring(v203.AvatarAttributes.JerseyTag))) or p42.Player ~= nil and string.upper((tostring(p42.Player))) or p42.Index ~= nil and string.upper((tostring(p42.Index))) or ""
    local clone = script.Assets.NameTag:Clone()

    clone.Name = "JERSEY_" .. clone.Name

    local v220 = script.DefaultFont

    if v210:FindFirstChild("JerseyTagFont") then
        v220 = v210.JerseyTagFont:FindFirstChildOfClass("ModuleScript") or v220
    end

    local v221 = v218:sub(1, 12)

    if not t2.GlobalVariables:CanCustomizeNumberAndJerseyTag(v206) then
        v221 = "PLAYER"
    end

    t2.FontMaker:PrintJerseyName({ jerseyTag = clone, teamFolder = v206, text = v221, fontModule = v220 })

    local u222 = v210:FindFirstChild("JerseyTagFont") ~= nil
    local v223 = u222 and script.Assets.NewPads or script.Assets
    local clone3

    if not u222 and (v203.Customizables.Torso.Undershirt.ItemName ~= "" or p43 ~= nil and p43.Undershirt == true) then
        clone3 = script.Assets.RolledUpChestPad:Clone()
    else
        clone3 = v223.ChestPad:Clone()
    end

    clone3.Handle.TextureID = v210.Shirt.Texture
    clone3.Name = "JERSEY_" .. clone3.Name

    local clone4 = v223.RightShoulder:Clone()

    clone4.Handle.TextureID = v210.Shirt.Texture
    clone4.Name = "JERSEY_" .. clone4.Name

    local clone5 = v223.LeftShoulder:Clone()

    clone5.Handle.TextureID = v210.Shirt.Texture
    clone5.Name = "JERSEY_" .. clone5.Name

    local clone6 = v223.LeftPad:Clone()

    clone6.Handle.TextureID = v213.Pants.Texture
    clone6.Name = "JERSEY_" .. clone6.Name

    local clone7 = v223.RightPad:Clone()

    clone7.Handle.TextureID = v213.Pants.Texture
    clone7.Name = "JERSEY_" .. clone7.Name

    local clone8 = v223.LowerPad:Clone()

    clone8.Handle.TextureID = v213.Pants.Texture
    clone8.Name = "JERSEY_" .. clone8.Name

    local clone9 = v223.ChestPad:Clone()

    clone9.Name = "JERSEY_NumberReferencePad"
    clone9.Handle.Transparency = 1

    for _, v in ipairs(clone9.Handle:GetChildren()) do
        if not v:IsA("Attachment") then
            v:Destroy()
        end
    end

    if v210:FindFirstChild("LeftOverrideSock") then
        local clone10 = v210.LeftOverrideSock:Clone()

        clone10.Name = "JERSEY_" .. clone10.Name
        p42:AttachItem(clone10)

        for v234, v235 in p42.Rig:GetChildren() do
            if v235.Name:sub(1, 4) == "SOCK" then
                v235:Destroy()
            end
        end
    end

    if v210:FindFirstChild("RightOverrideSock") then
        local clone11 = v210.RightOverrideSock:Clone()

        clone11.Name = "JERSEY_" .. clone11.Name
        p42:AttachItem(clone11)

        for v237, v238 in p42.Rig:GetChildren() do
            if v238.Name:sub(1, 4) == "SOCK" then
                v238:Destroy()
            end
        end
    end

    clone5.Handle.Color = v206.Colors.Primary.Value
    clone4.Handle.Color = v206.Colors.Primary.Value
    clone6.Handle.Color = v206.Colors.Secondary.Value
    clone7.Handle.Color = v206.Colors.Secondary.Value
    clone8.Handle.Color = v206.Colors.Secondary.Value
    clone3.Handle.Color = v206.Colors.Primary.Value
    p42:AttachItem(clone)
    p42:AttachItem(clone4)
    p42:AttachItem(clone5)
    p42:AttachItem(clone6)
    p42:AttachItem(clone7)
    p42:AttachItem(clone8)
    p42:AttachItem(clone3)
    p42:AttachItem(clone9)
    p42:AddJerseyNumbers(p43)
end
function t2.HasCharacterLoaded(p44)
    local t9 = {
        "arm",
        "leg",
        "foot",
        "hand",
        "head",
        "torso",
        "root"
    }
    local t10 = { "Humanoid", "BodyWidthScale", "BodyHeightScale", "BodyDepthScale" }
    local t11 = {}

    for _, v in pairs(game.StarterPlayer.StarterCharacter:GetChildren()) do
        if v:IsA("BasePart") and v.Name ~= "LeftHandJoint" and v.Name ~= "RightHandJoint" then
            local v245 = v.Name:lower()

            for _, v6 in pairs(t9) do
                if v245:match(v6) then
                    t10[#t10 + 1] = v.Name
                end
            end
        end
    end

    if p44.Rig == nil then
        local v248 = tick()

        repeat
            task.wait()
        until p44 == nil or p44.Player == nil or p44.Player.Parent == nil or p44.Rig ~= nil or tick() - v248 > 8
    end

    if p44.Rig then
        for _, v in pairs(t10) do
            if not p44.Rig:FindFirstChild(v, true) then
                local v251 = tick()

                repeat
                    task.wait()
                until p44 == nil or p44.Player == nil or p44.Player.Parent == nil or p44.Rig == nil or not not p44.Rig:FindFirstChild(v, true) or tick() - v251 > 8

                if not p44 or not p44.Rig or not p44.Rig:FindFirstChild(v, true) then
                    break
                end

                t11[#t11 + 1] = v
            else
                t11[#t11 + 1] = v
            end
        end
    end

    if #t11 == #t10 then
        return true
    end

    return false
end
function t2.UpdateScaling(p45, p46, p47, p48)
    local v256 = p48 ~= nil and p48 or p45.Rig:WaitForChild("Humanoid", t2.TIMEOUT)

    if not v256 then
        t2.GlobalVariables:Console("RigMaker", "Did not find humanoid. Aborting UpdateScaling.")

        return
    end

    local v257 = v256:WaitForChild("BodyHeightScale", t2.TIMEOUT)
    local v258 = v256:WaitForChild("BodyWidthScale", t2.TIMEOUT)
    local v259 = v256:WaitForChild("BodyDepthScale", t2.TIMEOUT)

    if not v257 or not v258 or not v259 then
        t2.GlobalVariables:Console("RigMaker", "Did not find a humanoid scale. Aborting UpdateScaling.")
    elseif p46 == "All" then
        p45:UpdateScaling("Height", p47, v256)
        p45:UpdateScaling("Weight", p47, v256)
    elseif p46 == "Height" then
        local HeightScale = nil

        if p47 == nil then
            local v261 = p45:GetOutfit()

            if v261 then
                HeightScale = v261.AvatarAttributes.HeightScale
            end
        elseif tonumber(p47) then
            HeightScale = tonumber(p47)
        elseif typeof(p47):lower() == "table" then
            HeightScale = p47.HeightScale
        end

        local v262 = t2.GlobalVariables.HeightWeightAdj.Height
        local v263 = tostring(HeightScale)

        if v262[v263] then
            v257.Value = HeightScale

            return
        end
    elseif p46 == "Weight" then
        local WeightScale = nil

        if p47 == nil then
            local v265 = p45:GetOutfit()

            if v265 then
                WeightScale = v265.AvatarAttributes.WeightScale
            end
        elseif tonumber(p47) then
            WeightScale = tonumber(p47)
        elseif typeof(p47):lower() == "table" then
            WeightScale = p47.WeightScale
        end

        local v266 = t2.GlobalVariables.HeightWeightAdj.Weight
        local v267 = tostring(WeightScale)

        if v266[v267] then
            v258.Value = WeightScale
            v259.Value = WeightScale
        end
    end
end
function t2.UpdateSkinColor(p49, p50)
    local t12 = {
        "HeadColor",
        "TorsoColor",
        "RightArmColor",
        "RightLegColor",
        "LeftArmColor",
        "LeftLegColor"
    }
    local v271 = string.lower
    local v272 = typeof(p50)

    if v271(v272) == "table" then
        for k, v in pairs(p50) do
            local v275 = string.lower
            local v276 = typeof(k)

            if v275(v276) == "instance" then
                k.Color = Color3.fromRGB(t2.GlobalVariables:ParseForColor3(v))
            elseif table.find(t12, k) then
                for _, v7 in pairs(p49.Rig:GetChildren()) do
                    if k == "HeadColor" and v7.Name == "Head" then
                        v7.Color = Color3.fromRGB(t2.GlobalVariables:ParseForColor3(v))
                    elseif k == "TorsoColor" and string.match(v7.Name, "Torso") then
                        v7.Color = Color3.fromRGB(t2.GlobalVariables:ParseForColor3(v))
                    elseif string.match(k, "Right") and string.match(k, "Arm") and string.match(v7.Name, "Right") and string.match(v7.Name, "Arm") or string.match(k, "Left") and string.match(k, "Arm") and string.match(v7.Name, "Left") and string.match(v7.Name, "Arm") or string.match(k, "Right") and string.match(k, "Leg") and string.match(v7.Name, "Right") and string.match(v7.Name, "Leg") or string.match(k, "Left") and string.match(k, "Leg") and string.match(v7.Name, "Left") and string.match(v7.Name, "Leg") then
                        v7.Color = Color3.fromRGB(t2.GlobalVariables:ParseForColor3(v))
                    end
                end
            else
                local v279 = p49.Rig
                local v280 = tostring(k)

                v279[v280].Color = v
            end
        end

        return
    end

    local v281 = p49:GetOutfit()

    for _, v in pairs(t12) do
        local v284 = p50 ~= nil and p50 or v281.AvatarColors[v]

        for _, v8 in pairs(p49.Rig:GetChildren()) do
            if v == "HeadColor" and v8.Name == "Head" then
                v8.Color = Color3.fromRGB(t2.GlobalVariables:ParseForColor3(v284))
            elseif v == "TorsoColor" and string.match(v8.Name, "Torso") then
                v8.Color = Color3.fromRGB(t2.GlobalVariables:ParseForColor3(v284))
            elseif string.match(v, "Right") and string.match(v, "Arm") and string.match(v8.Name, "Right") and string.match(v8.Name, "Arm") or string.match(v, "Left") and string.match(v, "Arm") and string.match(v8.Name, "Left") and string.match(v8.Name, "Arm") or string.match(v, "Right") and string.match(v, "Leg") and string.match(v8.Name, "Right") and string.match(v8.Name, "Leg") or string.match(v, "Left") and string.match(v, "Leg") and string.match(v8.Name, "Left") and string.match(v8.Name, "Leg") then
                v8.Color = Color3.fromRGB(t2.GlobalVariables:ParseForColor3(v284))
            end
        end
    end

    if p49.Rig:FindFirstChild("NeckAccessory") then
        p49.Rig.NeckAccessory.Handle.Color = Color3.fromRGB(t2.GlobalVariables:ParseForColor3(v281.AvatarColors.HeadColor))
    end
end
function t2.ResetRig(p51, p52)
    for _, v in ipairs(p51.Rig:GetDescendants()) do
        if (not v.Name:match("Layered") or not p52 or not t1[p52.Type] or not t1[p52.Type][v.Name:split("_")[2]]) and (v:IsA("Accessory") or v:IsA("Hat") or v:IsA("Texture") or v.Name == "mouth" or v.Name == "eyes") then
            t2.GlobalVariables:UnregisterScrollingItem(v)
            v:Destroy()
        end
    end

    if p51.Rig.Head:FindFirstChild("face") then
        p51.Rig.Head.face.Texture = "rbxasset://textures/face.png"
    end
end
function t2.RemoveNametags(p53)
    for _, v in ipairs(p53.Rig:GetChildren()) do
        if v.Name == "LockerTag" or v.Name == "StreetTag" or v.Name == "CharacterStatus" or v.Name == "RecordTag" or v.Name == "SocialTag" then
            if p53.Connections and p53.Connections[v] then
                for _, v9 in pairs(p53.Connections[v]) do
                    v9:Disconnect()
                end

                p53.Connections[v] = nil
            end

            v:Destroy()
        end
    end
end
function t2.UpdateStreetTag(p54, p55)
    if not p54.Rig then
        return
    end

    local v298 = p54.Rig:findFirstChild("StreetTag")
    local v299 = p54.Rig:findFirstChild("RecordTag")
    local v300 = t2.GlobalVariables:GetStreetTagType()
    local CurrentSeasonValue = game.ReplicatedStorage.Assets.GameInfo.Seasons.CurrentSeason.Value
    local v302 = t2.GlobalVariables:GetReplicated(p54.Player)

    if v298 and t2.Variables and t2.DataFiles and t2.DataFiles[tostring(p54.Player)] then
        local v303 = t2.DataFiles
        local v304 = tostring(p54.Player)
        local v305 = v303[v304]

        if not v305 then
            return
        end

        if not p55 then
            p55 = {}
        end

        if not p55.Overall then
            p55.Overall = t2.Variables.Overalls:GetOverallInfo(p54.Player, v305).DisplayOverall
        end

        if not p55.Banner then
            p55.Banner = v305.Customization.SelectedBanner
        end

        if not p55.SubText then
            local v306 = v305.ProfileData.Seasons[v305.ProfileData.Seasons.EquippedSeason] or v305.ProfileData.Seasons[CurrentSeasonValue]

            if v300 == "TradeHub" then
                local v307 = t2.Variables.Functions.Utilities:ShortenNumber(v302.RAP.Value)
                local v308 = v305.ProfileData.PlayerInfo.Stats.Trades

                p55.SubText = "%s RAP  /  %s %s"
                p55.SubText = p55.SubText:format(v307, v308, if v308 == 1 then "TRADE" else "TRADES")
                v299.Enabled = false
            else
                v299.Streak.Visible = false
                v299.Streak.Streak.Visible = false

                for _, v in ipairs(v299.Streak:GetChildren()) do
                    if v:IsA("ImageLabel") then
                        v.Visible = false
                    end
                end

                if v300 == "FlagFootball" then
                    local v311 = t2.Variables.Functions.Utilities:CommaNumber(v306.MiniGames.FlagFootball.Wins)
                    local v312 = t2.Variables.Functions.Utilities:CommaNumber(v306.MiniGames.FlagFootball.Losses)
                    local v313 = t2.Variables.Functions.Utilities:CommaNumber(v306.MiniGames.FlagFootball.WinStreak)

                    p55.SubText = "%s-%s W/L     🔥 %s"
                    p55.SubText = p55.SubText:format(v311, v312, v313)
                    v299.Enabled = tonumber(v306.MiniGames.FlagFootball.WinStreak) > 0
                    v299.Ranked.Visible = false
                    v299.Streak.Visible = false
                else
                    local v314 = t2.GlobalVariables:GetDisplayELO(v305.ProfileData.Seasons[CurrentSeasonValue].Ranked.OpenSkill)
                    local v315, v316 = t2.GlobalVariables:GetRankByRankScore(v314, CurrentSeasonValue)

                    if not v315 then
                        return
                    end

                    local v317 = t2.GlobalVariables
                    local v318 = tonumber(v306.MiniGames.Pickups.WinStreak)
                    local v319, v320 = v317:GetParkTierReward(v318, nil)
                    local v321 = t2.Variables.Functions.Utilities:CommaNumber(v306.MiniGames.Pickups.WinStreak)

                    v299.Enabled = tonumber(v306.MiniGames.Pickups.WinStreak) > 0
                    v299.Ranked.Visible = false
                    v299.Streak.Visible = true

                    local v322 = v299.Streak
                    local v323 = tostring(v319)
                    local v324 = v322:FindFirstChild("Streak_" .. v323)

                    v324.Visible = true
                    v324.Size = UDim2.new(v320.scale, 0, v320.scale, 0)
                    v299.Streak.StreakCount.Text = v321

                    local v325 = t2.GlobalVariables:GetRankedGeneralConfig()

                    if t2.GlobalVariables:CanPlayRanked(v305) then
                        p55.IconType = "Ranked"
                        p55.Icon = v316.Icon
                        p55.RankInfo = v316

                        local v326 = v316.Section:upper()
                        local v327 = v316.SectionNumber:upper()

                        p55.SubText = v326 .. " " .. v327
                    else
                        p55.Icon = v325.NoobIcon
                        p55.IconType = "Noob"
                        p55.SubText = "NOOB"
                    end
                end
            end
        end

        t2.GlobalVariables:GeneratePlayerCard(p54.Player, v298, p55)

        return
    end
end
function t2.UpdateLockerTag(p56, p57)
    if not p56.Rig then
        return
    end

    if not t2.Variables then
        return
    end

    if not p57 then
        p57 = {}
    end

    local v330 = p56.Rig:findFirstChild("RecordTag")

    if not v330 then
        return
    end

    local v331

    if p57.DataFile then
        v331 = p57.DataFile
    else
        local v332 = t2.DataFiles

        if v332 then
            local v333 = t2.DataFiles
            local v334 = tostring(p56.Player)

            v332 = v333[v334]
        end

        v331 = v332
    end

    if not v331 then
        return
    end

    local v335 = p57.LockerTagOverride
    local v336 = game.ReplicatedStorage.Assets.GameInfo.Seasons.CurrentSeason.Value
    local v337 = t2.GlobalVariables:GetRankedSeasonConfig(v336)
    local v338 = v331.ProfileData.Seasons.EquippedSeason

    if v335 == "RankedGameplay" then
        local v339 = v331.ProfileData.Seasons[v338].Ranked
        local v340 = v331.ProfileData.Seasons[v336].Ranked
        local v341 = t2.Variables.Functions.Utilities:CommaNumber(v339.Wins)
        local v342 = t2.Variables.Functions.Utilities:CommaNumber(v339.Losses)
        local v343 = t2.Variables.Functions.Utilities:CommaNumber(v339.WinStreak)
        local v344 = t2.Variables.Functions.Utilities:CommaNumber(v339.LossStreak)
        local v345 = t2.GlobalVariables:GetDisplayELO(v340.OpenSkill)
        local v346, v347 = t2.GlobalVariables:GetRankByRankScore(v345, v336)

        if not v346 then
            return
        end

        local v348 = Color3.fromHex(v347.HexColor)
        local v349 = Color3.fromRGB(255, 255, 255)
        local v350 = v348:Lerp(v349, 0.5)
        local v351 = Color3.fromHex(v347.HexColor)
        local v352 = Color3.fromRGB(255, 255, 255)
        local v353 = v351:Lerp(v352, 0.75)
        local v354 = v350:ToHex():lower()
        local v355 = v347.Section:upper()
        local v356 = v347.SectionNumber:upper()
        local v357 = ("<b><font color=\"#%s\">%s</font></b>    "):format(v354, v355 .. " " .. v356)

        if v339.WinStreak > 0 then
            p57.SubText = (v357 .. "%s-%s W/L     🔥 %s"):format(v341, v342, v343)
        elseif v339.LossStreak > 0 then
            p57.SubText = (v357 .. "%s-%s W/L     😭 %s"):format(v341, v342, v344)
        else
            p57.SubText = (v357 .. "%s-%s W/L"):format(v341, v342)
        end

        local v358 = v337.Config.RankTiers[v347.Index]

        v330.Enabled = true
        v330.Ranked.Visible = true
        v330.Streak.Visible = false
        v330.Ranked.Image = v358.Icon
        v330.Ranked.TextLabel.Text = v358.SectionNumber:upper()
        v330.Ranked.LevelUp.Visible = if p57.DidRankUp then true else false
        v330.Ranked.TextLabel.TextColor3 = v353

        return
    end
end
function t2.PlaySocialMessage(p58, p59, p60)
    local v362 = p58.Rig:FindFirstChild("SocialTag")

    if not v362 then
        return
    end

    local clone = v362.Template:Clone()

    clone.Parent = v362.Content
    clone.TextContent.Text = p59
    clone.TextContent.TextTransparency = 1
    clone.TextContent.TextStrokeTransparency = 1
    clone.Position = UDim2.new(0.5, 0, 1, 0)
    clone.Visible = true
    v362.Enabled = true

    local v364 = t2.GlobalVariables:GetSocialMessagesConfig()
    local n1 = #p59 * v364.SecondsPerCharacter
    local v366 = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
    local v367 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
    local v368 = TweenInfo.new(1 + n1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)
    local v369 = game:GetService("TweenService"):Create(clone.TextContent, v366, { TextTransparency = 0, TextStrokeTransparency = 0 })
    local v370 = game:GetService("TweenService"):Create(clone.TextContent, v367, { TextTransparency = 1, TextStrokeTransparency = 1 })
    local v371 = game:GetService("TweenService"):Create(clone, v368, { Position = UDim2.new(0.5, 0, 0, 0) })
    local v372 = game:GetService("TweenService"):Create(clone.Background, v366, { ImageTransparency = 0 })
    local v373 = game:GetService("TweenService"):Create(clone.Background, v367, { ImageTransparency = 1 })

    local v374 = task.spawn(function()
        local n1 = 0
        local n2 = 0

        while true do
            n2 += 1

            local v580 = task.wait()

            n1 += v580
            t2.GlobalVariables.SocialEffects[p60 or "Normal"].Animate(clone, p59, n1, n2)
        end
    end)

    v369.Completed:Connect(function()
        task.wait(0.5)
        v370:Play()
        v373:Play()
    end)
    v370.Completed:Connect(function()
        clone:Destroy()
        task.cancel(v374)
        v362.Enabled = false
    end)
    v372:Play()
    v369:Play()
    v371:Play()
end
function t2.ShowNametagIcon(p61, p62, p63, p64)
    if p63 == true then
        p62.Size = UDim2.new(0, 0, 0, 0)
        p62.Visible = true
        p62:TweenSize(p64, Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.2)
    elseif p63 == false then
        p62.Size = p64
        p62.Visible = true
        p62:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1)
        task.delay(0.51, function()
            local v581 = p61.Player.Replicated
            local v582 = tostring(p62)

            p62.Visible = v581[v582].Value
        end)
    end
end
function t2.AddNametag(p65, p66, p67)
    p65:RemoveNametags()

    local v382 = p65:GetOutfit()

    if (p66 or v382) and p65.Rig:WaitForChild("Head", t2.TIMEOUT) then
        local v383 = p65.Rig:WaitForChild("Humanoid", t2.TIMEOUT)

        if v383 then
            v383.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        end

        local clone = script.Assets.RecordTag:Clone()

        clone.Adornee = p65.Rig.PrimaryPart
        clone.Parent = p65.Rig
        clone.Enabled = false

        local clone12 = script.Assets.SocialTag:Clone()

        clone12.Adornee = p65.Rig.PrimaryPart
        clone12.Parent = p65.Rig
        clone12.Enabled = false

        local clone13 = script.Assets[p66 .. "Tag"]:Clone()

        clone13.Adornee = p65.Rig.PrimaryPart
        clone13.Parent = p65.Rig

        if p66 ~= "Locker" then
            if p66 == "Street" then
                p65:UpdateStreetTag(p67)
            end
        elseif p67 == nil or not p67.Username then
            if t2.GlobalVariables:GetPlaceIDSettings(game.PlaceId).Index:match("TradeHub") and p65.Player ~= nil then
                clone13.Username.Text = tostring(p65.Player.DisplayName)
            else
                clone13.Username.Text = tostring(p65.Player)
            end
        else
            clone13.Username.Text = p67.Username
        end

        if game.Players.LocalPlayer and p65.Player == game.Players.LocalPlayer then
            clone13.Enabled = p66 == "Street"
        else
            clone13.Enabled = true
        end

        local clone14 = script.Assets.CharacterStatus:Clone()

        clone14.Adornee = p65.Rig.PrimaryPart
        clone14.Parent = p65.Rig

        for _, v in pairs({ "AFK", "InCustomizer" }) do
            clone14.Icons[v].Visible = false
        end

        if p65.Player and p65.Connections then
            p65.Connections[clone14] = {}
            p65.Connections[clone13] = {}
            p65.Connections[clone] = {}

            local function updateRecordTagAdornee()
                local v583 = math.abs(v383.HipHeight - 2)
                local v584 = p65.Rig:FindFirstChild("Bike") or p65.Rig:FindFirstChild("GolfCart") or p65.Rig:FindFirstChild("Hoverboard")
                local t18 = {}

                if clone:IsA("BillboardGui") then
                    table.insert(t18, clone)
                end

                for _, v in ipairs(clone:GetDescendants()) do
                    if v:IsA("BillboardGui") then
                        table.insert(t18, v)
                    end
                end

                if v583 > 0.1 or v584 ~= nil then
                    clone.Adornee = v588

                    for _, v in ipairs(t18) do
                        v.StudsOffset = Vector3.new(0, -0.5, 0)
                    end

                    return
                end

                clone.Adornee = p65.Rig.PrimaryPart

                for _, v in ipairs(t18) do
                    v.StudsOffset = Vector3.new(0, 0, 0)
                end
            end

            updateRecordTagAdornee()
            p65.Connections[clone].HipHeightChanged = v383:GetPropertyChangedSignal("HipHeight"):Connect(updateRecordTagAdornee)
            p65.Connections[clone].ChildAdded = p65.Rig.ChildAdded:Connect(function(p68)
                if p68.Name == "Bike" or p68.Name == "GolfCart" or p68.Name == "Hoverboard" then
                    updateRecordTagAdornee()
                end
            end)
            p65.Connections[clone].ChildRemoved = p65.Rig.ChildRemoved:Connect(function(p69)
                if p69.Name == "Bike" or p69.Name == "GolfCart" or p69.Name == "Hoverboard" then
                    updateRecordTagAdornee()
                end
            end)

            for _, v in ipairs({ "AFK", "InCustomizer" }) do
                local v393 = clone14.Icons[v].Size

                clone14.Icons[v].Visible = false

                local v394 = p65.Player.Replicated
                local v395 = tostring(v)
                local v396 = v394:FindFirstChild(v395)

                if v396 then
                    clone14.Icons[v].Visible = v396.Value
                    p65.Connections[clone14][v] = v396.Changed:Connect(function()
                        if v396.Name == "InCustomizer" and v396.Value == true then
                            clone14.Icons.AFK.Visible = false
                        end

                        if v396.Name ~= "AFK" or v396.Value ~= false or clone14.Icons[v].Visible ~= false then
                            p65:ShowNametagIcon(clone14.Icons[v], p65.Player.Replicated[v].Value, v393)
                        elseif tostring(t2.Variables.CurrentSlide) ~= "BlankUI" then
                            p65:ShowNametagIcon(clone14.Icons[v], p65.Player.Replicated[v].Value, v393)

                            return
                        end
                    end)
                end
            end

            p65.Connections[clone14].Destroyed = clone14.AncestryChanged:Connect(function(_, p71)
                if not p71 then
                    for _, v in pairs(p65.Connections[clone14]) do
                        v:Disconnect()
                    end

                    p65.Connections[clone14] = nil
                end
            end)
            p65.Connections[clone13].Destroyed = clone13.AncestryChanged:Connect(function(_, p73)
                if not p73 then
                    for _, v in pairs(p65.Connections[clone13]) do
                        v:Disconnect()
                    end

                    p65.Connections[clone13] = nil
                end
            end)
            p65.Connections[clone].Destroyed = clone.AncestryChanged:Connect(function(_, p75)
                if not p75 then
                    for _, v in pairs(p65.Connections[clone]) do
                        v:Disconnect()
                    end

                    p65.Connections[clone] = nil
                end
            end)
        end
    end
end
function t2.SetCustomOutfit(p76, p77)
    p76.CustomOutfit = p77

    if p76.CustomOutfit then
        local v399 = string.lower
        local v400 = typeof(p76.CustomOutfit)

        p76.CustomOutfit = v399(v400) ~= "table" and t2.GlobalVariables:ConvertFolderToTable(p76.CustomOutfit) or p76.CustomOutfit
    end
end
function t2.GetRefereeOutfit(_, p79)
    for k, _ in pairs(p79.Customizables.Torso) do
        p79.Customizables.Torso[k] = { ItemName = "", ItemUniqueId = "" }
    end

    p79.Customizables.Arms.LeftHand = { ItemName = "", ItemUniqueId = "" }
    p79.Customizables.Arms.RightHand = { ItemName = "", ItemUniqueId = "" }
    p79.Customizables.Head.Neck = { ItemName = "", ItemUniqueId = "" }
    p79.Customizables.Torso.Shirt = {
        ItemUniqueId = "",
        ItemName = t2.GlobalVariables.DefaultItems.RefereeShirt
    }
    p79.Customizables.Legs.Pants = {
        ItemUniqueId = "",
        ItemName = t2.GlobalVariables.DefaultItems.RefereePants
    }
    p79.Customizables.Torso.Shirt = {
        ItemUniqueId = "",
        ItemName = t2.GlobalVariables.DefaultItems.RefereeShirt
    }
    p79.Customizables.Head.Neck = {
        ItemUniqueId = "",
        ItemName = t2.GlobalVariables.DefaultItems.RefereeWhistle
    }

    return p79
end
function t2.GetCoachOutfit(_, p81)
    for k, _ in pairs(p81.Customizables.Torso) do
        p81.Customizables.Torso[k] = { ItemName = "", ItemUniqueId = "" }
    end

    p81.Customizables.Arms.LeftHand = { ItemName = "", ItemUniqueId = "" }
    p81.Customizables.Arms.RightHand = { ItemName = "", ItemUniqueId = "" }
    p81.Customizables.Head.Neck = { ItemName = "", ItemUniqueId = "" }
    p81.Customizables.Torso.Shirt = {
        ItemUniqueId = "",
        ItemName = t2.GlobalVariables.DefaultItems.RefereeShirt
    }
    p81.Customizables.Legs.Pants = {
        ItemUniqueId = "",
        ItemName = t2.GlobalVariables.DefaultItems.RefereePants
    }
    p81.Customizables.Torso.Shirt = {
        ItemUniqueId = "",
        ItemName = t2.GlobalVariables.DefaultItems.RefereeShirt
    }
    p81.Customizables.Head.Neck = {
        ItemUniqueId = "",
        ItemName = t2.GlobalVariables.DefaultItems.RefereeWhistle
    }

    return p81
end
function t2.GetOutfit(p82, p83, p84)
    if p82.CustomOutfit and not p84 then
        return p82.CustomOutfit
    end

    if t2.DataFiles then
        local v412 = t2.DataFiles
        local v413 = tostring(p82.Player)

        if v412[v413] then
            local v414 = p83 ~= nil and p83 or t2.GlobalVariables:GetCategoryForUniform(p82.Player, true)
            local v415 = t2.DataFiles
            local v416 = tostring(p82.Player)
            local v417 = v415[v416].Customization[v414 .. "Outfits"]
            local v418 = t2.DataFiles
            local v419 = tostring(p82.Player)

            return v417[v418[v419].Customization["Current" .. v414 .. "Outfit"]]
        end

        repeat
            task.wait()
        until p82 == nil or p82.Player == nil or p82.Player.Parent == nil or string.lower((typeof(t2.DataFiles[tostring(p82.Player)]))) == "table"

        local v420 = t2.DataFiles
        local v421 = tostring(p82.Player)

        if v420[v421] then
            local v422 = p83 ~= nil and p83 or t2.GlobalVariables:GetCategoryForUniform(p82.Player, true)
            local v423 = t2.DataFiles
            local v424 = tostring(p82.Player)
            local v425 = v423[v424].Customization[v422 .. "Outfits"]
            local v426 = t2.DataFiles
            local v427 = tostring(p82.Player)

            return v425[v426[v427].Customization["Current" .. v422 .. "Outfit"]]
        end

        return
    end
end
function t2.MakeOutfit(p85, p86, p87)
    local v431 = t2.GlobalVariables
    local v432 = tostring(p85.Player)

    v431:Console("RigMaker", "MakeOutfit() is ready for " .. v432)

    local v433 = p86 ~= nil and p86 or p85:GetOutfit()

    if p86 then
        p85:SetCustomOutfit(p86)
    end

    if not p86 and p85.TeamID then
        if p85.TeamID.Value == "Referees" then
            v433 = p85:GetRefereeOutfit(t2.GlobalVariables:CloneTable(p85:GetOutfit("Street")))
        elseif p85.TeamID.Value == "Coaches" then
            v433 = p85:GetCoachOutfit(t2.GlobalVariables:CloneTable(p85:GetOutfit("Street")))
        elseif p85.TeamID.Value ~= "Unpicked" then
            if p85.TeamID.Value == "Spectators" then
                v433 = p85:GetOutfit("Street")
            end
        elseif p87 == nil or p87.Team == nil then
            v433 = p85:GetOutfit("Street")
        end
    end

    if v433 then
        local v434 = string.lower
        local v435 = typeof(v433)
        local v436 = v434(v435) ~= "table" and t2.GlobalVariables:ConvertFolderToTable(v433) or v433

        if not p85 or not p85.Index or not t2 or not t2.Rigs or not t2.Rigs[p85.Index] then
            t2.GlobalVariables:Console("RigMaker", "Returned 1")

            return
        end

        local v437 = t2.GlobalVariables
        local v438 = tostring(p85.Player)
        local v439 = tostring(v436)
        local u440 = false

        if v436 ~= nil then
            u440 = tostring(v436.Type)
        end

        v437:Console("RigMaker", "Waiting for " .. v438 .. "'s character to load in. \n Outfit is: " .. v439 .. "\n Outfit type is " .. u440 or "nil")

        if p85:HasCharacterLoaded() ~= true then
            t2.GlobalVariables:Console("RigMaker", "Returned 2")

            return
        end

        local v441 = t2.GlobalVariables
        local v442 = tostring(p85.Player)
        local v443 = tostring(v436)
        local u444 = false

        if v436 ~= nil then
            u444 = tostring(v436.Type)
        end

        v441:Console("RigMaker", "Making outfit for " .. v442 .. ". \n Outfit is: " .. v443 .. "\n Outfit type is " .. u444 or "nil")
        p85:ResetRig(v436)
        p85.LastOutfitType = v436.Type

        if v436.Type == "Locker" then
            if p85.Player ~= nil and p85:VerifyLockerSettings(p87) == false then
                t2.GlobalVariables:Console("RigMaker", "Returned 3")

                return
            end

            local t13 = {}

            for k, v in pairs(v436.Customizables) do
                if k ~= "Other" then
                    for _, v10 in pairs(v) do
                        if v10.ItemName ~= "" and string.match(v10.ItemName, "(%a+)") then
                            t13[v10.ItemName] = true
                        end
                    end
                end
            end

            t2.GlobalVariables:GetItemAssetsInBulk(t13)

            for k, v in pairs(v436.Customizables) do
                if k ~= "Other" then
                    for k3, v11 in pairs(v) do
                        if v11.ItemName == "" and t2.GlobalVariables.DefaultItems[k3] then
                            v11.ItemName = t2.GlobalVariables.DefaultItems[k3]
                        end

                        local v454 = v11.ItemName ~= "" and t2.GlobalVariables:GetItemAsset(v11.ItemName) or nil

                        if v11.ItemName ~= "" and (v454 or k3 == "Mouth" or k3 == "Eyes") then
                            local v455 = v11.ItemName
                            local t14 = {
                                Customizable = k3,
                                Side = if k3:match("Left") then "Left" else if k3:match("Right") then "Right" else nil
                            }

                            p85:AddItem(v455, t14, p87)
                        end
                    end
                end
            end

            p85:AddJersey(p87)
        elseif v436.Type == "Street" then
            local t15 = {}

            for k, v in pairs(v436.Customizables) do
                if k ~= "Other" then
                    for _, v12 in pairs(v) do
                        if v12.ItemName ~= "" and string.match(v12.ItemName, "(%a+)") then
                            t15[v12.ItemName] = true
                        end
                    end
                end
            end

            t2.GlobalVariables:GetItemAssetsInBulk(t15)

            for k, v in pairs(v436.Customizables) do
                if k ~= "Other" then
                    for k4, v13 in pairs(v) do
                        if v13.ItemName == "" and t2.GlobalVariables.DefaultItems[k4] then
                            v13.ItemName = t2.GlobalVariables.DefaultItems[k4]
                        end

                        local v466 = v13.ItemName ~= "" and t2.GlobalVariables:GetItemAsset(v13.ItemName) or nil

                        if v13.ItemName ~= "" and (v466 or k4 == "Mouth" or k4 == "Eyes") then
                            local v467 = v13.ItemName
                            local t16 = {
                                Customizable = k4,
                                Side = if k4:match("Left") then "Left" else if k4:match("Right") then "Right" else nil
                            }

                            p85:AddItem(v467, t16, p87)
                        end
                    end
                end
            end
        end

        if not p87 or p87.Nametag ~= false then
            p85:AddNametag(v436.Type, p87)
        end

        p85:UpdateSkinColor()
        p85:ConnectScalingEvents(p87)

        if p87 and p87.UpdateViewportScaling == true then
            p85:UpdateScaling("All")
            p85.Rig.Humanoid.AutomaticScalingEnabled = false
            p85.Rig.Humanoid.AutomaticScalingEnabled = true
        end

        p85.LastAppliedOutfit = v436
    elseif p85 then
        local v469 = t2.GlobalVariables
        local v470 = tostring(p85.Index)

        v469:Console("RigMaker", "Could not find outfit for " .. v470, "Warn")
    end

    local v471 = t2.GlobalVariables
    local v472 = tostring(p85.Player)

    v471:Console("RigMaker", "Finished making outfit for " .. v472 .. "'s rig")
end
function t2.ApplyOutfit(p88, p89, p90, p91)
    if p91 == true then
        p88:MakeOutfit(p89, p90)

        return
    end

    p88:Enqueue("MakeOutfit", { p89, p90 })
end
function t2.GetSetting(p92, p93, p94)
    local function retrieve(p95)
        if p95 == "Team" then
            if p94 ~= nil and p94.Team then
                return p94.Team
            end

            if p92.TeamID and p92.TeamID.Value == "Benched" then
                local v608 = p92.TeamID:GetAttribute("TeamCache")

                if v608 then
                    return v608
                end
            else
                if p92.TeamID and p92.TeamID.Value ~= "" then
                    return p92.TeamID.Value
                end

                if p92.Player ~= nil and t2.DataFiles and t2.DataFiles[tostring(p92.Player)] then
                    local v609 = t2.DataFiles
                    local v610 = tostring(p92.Player)
                    local v611 = v609[v610].Customization.CurrentLockerOutfit
                    local v612 = t2.DataFiles
                    local v613 = tostring(p92.Player)

                    return v612[v613].Customization.LockerOutfits[v611].SelectedTeam
                end
            end
        elseif p95 == "TeamFolder" then
            local v614 = p92:GetSetting("Team", p94)

            if v614 and game.ReplicatedStorage.Assets.TeamAssets:FindFirstChild(v614) then
                return game.ReplicatedStorage.Assets.TeamAssets[v614]
            end

            if p92.GameID and p92.GameID.Value ~= "" then
                return (game.ReplicatedStorage.Games:FindFirstChild(p92.GameID.Value) or game.ReplicatedStorage.MiniGames:FindFirstChild(p92.GameID.Value)).TeamAssets[v614]
            end
        elseif p95 == "Uniform" then
            local v615 = p92:GetSetting("TeamFolder")
            local v616 = p92:GetSetting("GameTeamAssets")
            local v617 = p92:GetSetting("Jersey", p94)

            if v615 and v617 then
                local v618 = t2.GlobalVariables
                local v619 = tostring(v615)

                return v618:GetUniform(v619, v617, v616)
            end
        elseif p95 == "Helmet" then
            if p94 and p94.Helmet then
                return p94.Helmet
            end

            local v620 = p92:GetSetting("Team", p94)

            if v620 and p92.GameID and p92.GameID.Value ~= "" then
                local v621 = game.ReplicatedStorage.Games:FindFirstChild(p92.GameID.Value) or game.ReplicatedStorage.MiniGames:FindFirstChild(p92.GameID.Value)
                local v622 = game.ReplicatedStorage.Assets.TeamAssets
                local v623 = tostring(v620)

                if v622:FindFirstChild(v623) then
                    local v624 = v621.HomeTeam.Value
                    local v625 = tostring(v620)

                    v620 = if v624 == v625 then "HomeTeam" else "AwayTeam"
                end

                local v626 = v621.Uniforms
                local v627 = string.sub(v620, 1, 4)
                local v628 = v626:FindFirstChild(v627)

                if v628 then
                    return v628.Helmet.Value
                end
            end

            local v629 = p92:GetSetting("Jersey", p94)

            if v629 then
                return v629
            end
        else
            if p95 == "Jersey" then
                if p94 and p94.Jersey ~= nil then
                    return p94.Jersey
                else
                    if p92.GameID ~= nil and p92.GameID.Value ~= "" then
                        local v630 = p92:GetSetting("Team", p94)

                        if v630 then
                            local v631 = game.ReplicatedStorage.Games:FindFirstChild(p92.GameID.Value) or game.ReplicatedStorage.MiniGames:FindFirstChild(p92.GameID.Value)
                            local v632 = game.ReplicatedStorage.Assets.TeamAssets
                            local v633 = tostring(v630)

                            if v632:FindFirstChild(v633) then
                                local v634 = v631.HomeTeam.Value
                                local v635 = tostring(v630)

                                v630 = if v634 == v635 then "HomeTeam" else "AwayTeam"
                            end

                            local v636 = v631.Uniforms
                            local v637 = string.sub(v630, 1, 4)
                            local v638 = v636:FindFirstChild(v637)

                            if v638 then
                                return v638.Jersey.Value
                            end
                        end
                    elseif p92.Player ~= nil and t2.DataFiles and t2.DataFiles[tostring(p92.Player)] then
                        local v639 = t2.DataFiles
                        local v640 = tostring(p92.Player)

                        return v639[v640].Customization.SelectedJersey
                    end

                    return "Home"
                end
            end

            if p95 == "Pants" then
                if p94 and p94.Pants ~= nil then
                    return p94.Pants
                else
                    local v641 = p92.GameID ~= nil and p92.GameID.Value ~= "" and p92:GetSetting("Team", p94)

                    if v641 then
                        local v642 = game.ReplicatedStorage.Games:FindFirstChild(p92.GameID.Value) or game.ReplicatedStorage.MiniGames:FindFirstChild(p92.GameID.Value)
                        local v643 = game.ReplicatedStorage.Assets.TeamAssets
                        local v644 = tostring(v641)

                        if v643:FindFirstChild(v644) then
                            local v645 = v642.HomeTeam.Value
                            local v646 = tostring(v641)

                            v641 = if v645 == v646 then "HomeTeam" else "AwayTeam"
                        end

                        local v647 = v642.Uniforms
                        local v648 = string.sub(v641, 1, 4)
                        local v649 = v647:FindFirstChild(v648)

                        if v649 then
                            return v649.Pants.Value
                        else
                            return "Home"
                        end
                    else
                        return "Home"
                    end
                end
            end

            if p95 == "Numbers" then
                if p94 and p94.Numbers ~= nil then
                    return p94.Numbers
                else
                    local v650 = p92.GameID ~= nil and p92.GameID.Value ~= "" and p92:GetSetting("Team", p94)

                    if v650 then
                        local v651 = game.ReplicatedStorage.Games:FindFirstChild(p92.GameID.Value) or game.ReplicatedStorage.MiniGames:FindFirstChild(p92.GameID.Value)
                        local v652 = game.ReplicatedStorage.Assets.TeamAssets
                        local v653 = tostring(v650)

                        if v652:FindFirstChild(v653) then
                            local v654 = v651.HomeTeam.Value
                            local v655 = tostring(v650)

                            v650 = if v654 == v655 then "HomeTeam" else "AwayTeam"
                        end

                        local v656 = v651.Uniforms
                        local v657 = string.sub(v650, 1, 4)
                        local v658 = v656:FindFirstChild(v657)

                        if v658 then
                            return v658.Numbers.Value
                        else
                            return "Home"
                        end
                    else
                        return "Home"
                    end
                end
            end

            if p95 == "JerseyNumber" then
                if p94 and p94.JerseyNumber ~= nil then
                    return p94.JerseyNumber
                else
                    local v659 = p92:GetOutfit()
                    local v660 = p92:GetSetting("Team", p94)

                    if p94 and p94.Offensive == true then
                        return t2.GlobalVariables:GetJerseyInformation(v659).OffensiveNumber
                    elseif p92.GameID and p92.GameID.Value ~= "" then
                        local v661 = t2.GlobalVariables:GetJerseyInformation(v659)
                        local v662 = game.ReplicatedStorage.Games:FindFirstChild(p92.GameID.Value) or game.ReplicatedStorage.MiniGames:FindFirstChild(p92.GameID.Value)

                        if v660 and v662 then
                            local v663 = game.ReplicatedStorage.Assets.TeamAssets
                            local v664 = tostring(v660)

                            if v663:FindFirstChild(v664) then
                                local v665 = v662.HomeTeam.Value
                                local v666 = tostring(v660)

                                v660 = if v665 == v666 then "HomeTeam" else "AwayTeam"
                            end

                            local v667 = t2.GlobalVariables:GetJerseyInformation(v659, v660 == "HomeTeam" and v662.HomeTeam.Value or v662.AwayTeam.Value)

                            if v660 == v662.GameStatus.Offense.Value then
                                return v667.OffensiveNumber
                            else
                                return v667.DefensiveNumber
                            end
                        else
                            return v661.DefensiveNumber
                        end
                    elseif game.ReplicatedStorage.Assets.TeamAssets:FindFirstChild((tostring(v660))) then
                        return t2.GlobalVariables:GetJerseyInformation(v659, v660).OffensiveNumber
                    else
                        return p94.JerseyNumber
                    end
                end
            end

            if p95 == "GameTeamAssets" and p92.GameID ~= nil and p92.GameID.Value ~= "" then
                local v668 = p92:GetSetting("Team", p94)
                local v669 = game.ReplicatedStorage.Games:FindFirstChild(p92.GameID.Value) or game.ReplicatedStorage.MiniGames:FindFirstChild(p92.GameID.Value)

                if v668 == "HomeTeam" then
                    return v669.TeamAssets.HomeTeam
                elseif v668 == "AwayTeam" then
                    return v669.TeamAssets.AwayTeam
                elseif v669.HomeTeam.Value == tostring(v668) then
                    return v669.TeamAssets.HomeTeam
                else
                    return v669.TeamAssets.AwayTeam
                end
            end
        end

        return ""
    end

    if typeof(p93):lower() == "table" then
        local t17 = {}

        for _, v in ipairs(p93) do
            t17[#t17 + 1] = retrieve(v)
        end

        return table.unpack(t17)
    end

    return retrieve(p93)
end
function t2.VerifyLockerSettings(p96, p97)
    local function verify()
        for _, v in ipairs({
            p96:GetSetting("Team", "TeamFolder", "Uniform", "Helmet", "Jersey", "Pants", "Numbers", "JerseyNumbers"),
            p97
        }) do
            if v == "" then
                return false
            end
        end

        return true
    end

    local v487 = verify()

    if v487 == false then
        repeat
            v487 = verify()
            task.wait()
        until v487 == true or p96 == nil or p96.Player == nil or p96.Player.Parent == nil or not t2.Rigs[p96.Index]
    end

    return v487
end
function t2.Enqueue(p98, p99, p100)
    table.insert(p98.Queue, { p99, p100 })
    p98:Dequeue()
end
function t2.Dequeue(p101)
    if p101.Dequeued == false and #p101.Queue > 0 then
        p101.Dequeued = true
        task.spawn(function()
            local v672 = table.remove(p101.Queue, 1)

            if v672 and p101[v672[1]] then
                p101[v672[1]](p101, table.unpack(v672[2]))
            end

            p101.Dequeued = false

            if p101 and p101.Queue and #p101.Queue > 0 then
                p101:Dequeue()
            end
        end)
    end
end
function t2.CreateNameTag(_, _, p104)
    local clone = script.Assets.NameTag:Clone()
    local v496 = script.DefaultFont

    if p104 and p104.FontModule then
        v496 = p104.FontModule
    end

    t2.FontMaker:PrintJerseyName({
        text = "PLAYER",
        jerseyTag = clone,
        teamFolder = p104.TeamFolder,
        fontModule = v496
    })

    return clone
end

return function(p105, p106, p107)
    if p106 then
        t2.DataFiles = p106
    end

    if p105 then
        t2.GlobalVariables = p105
    end

    if p107 then
        t2.Variables = p107
    end

    return t2
end
