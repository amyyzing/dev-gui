-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[2]:GetChildren()[1]:GetChildren()[6]:GetChildren()[1]:GetChildren()[26]
-- Took 0.09s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- Decompiled using ByteFall
-- discord.gg/bytefall
local u1 = nil

local function _getCachedAutoCatchingAbTest(p1)
    if u1 == nil then
        local v4, v5 = p1.Variables.ABTest.GetExperimentVariables("uf-auto-catching"):await()

        if v4 and v5 ~= nil then
            u1 = v5
        end
    end

    return u1
end

return {
    CatchHikeThrow = function(p2)
        if p2:FilterAction("CatchHikeThrow") == false then
            return
        end

        local v7 = p2.Variables.CurrentGameSettings or p2.Variables.CurrentMiniSettings
        local HikingValue = v7.MechanicsUsed.Hiking.Value
        local CatchingValue = v7.MechanicsUsed.Catching.Value
        local ThrowingValue = v7.MechanicsUsed.Throwing.Value

        if v7 then
            local u11 = true

            if p2.Variables.InputType == "Controller" and p2:CheckAutoThrowEnabled() and p2:GetClosestReceiverNumber() ~= nil then
                u11 = false
            end

            local v12 = p2.Variables.GlobalVariables:PlayerIsQuarterback(p2.Variables.LP, v7)

            if p2.BallEquipped and p2.BallEquipType == p2.DEF_QUARTERBACK and v7.GameStatus.Hiked.Value and v12 and u11 and ThrowingValue then
                if p2.Variables.Functions.MutationsMode:MutationModeCheck() and p2:IsPlayerStunnedByMutation() then
                    return
                end

                p2:FootballThrow()
            elseif not p2.BallEquipped and not v7.GameStatus.Hiked.Value and v12 and HikingValue then
                p2:Hike()
            elseif v7.GameStatus.Hiked.Value and p2.Variables.LP.Character and CatchingValue then
                if p2.Variables.Functions.MutationsMode:MutationModeCheck() and p2:IsPlayerStunnedByMutation() then
                    return
                end

                p2:Catching()

                return
            end

            return
        end
    end,
    Catching = function(p3)
        if p3:FilterAction("Catching") == false then
            return
        end;

        (p3.Variables.CurrentGameSettings or p3.Variables.CurrentMiniSettings).ReEvent:FireServer("Mechanics", "Catching", true)
    end,
    CatchingLoop = function(p4)
        local v15 = p4.Variables.CurrentGameSettings or p4.Variables.CurrentMiniSettings

        if v15 and p4.Variables.GlobalVariables:PlayerIsInGame(v15, p4.Variables.LP) then
            for v16, v17 in p4.Variables.GlobalVariables.ReplicatedFolders, nil, nil do
                local v18 = p4.Variables.GlobalVariables
                local v19 = tostring(v16)
                local v20 = v18:GetPlayer(v19)

                if v20 then
                    local Character = v20.Character

                    if Character ~= nil and Character.PrimaryPart and p4.Variables.GlobalVariables:PlayerIsInGame(v15, v20) and Character:FindFirstChild("Humanoid") and Character.Humanoid.Health > 0 then
                        local v22 = nil
                        local v23 = nil
                        local n1 = math.huge

                        for v25, v26 in p4.Variables.GFunctions.Footballs, nil, nil do
                            if v25 and v25.Parent and v26.GameID == v15.Name and n1 > (v25.Position - Character.PrimaryPart.Position).Magnitude then
                                v22 = v25
                                n1 = (v25.Position - Character.PrimaryPart.Position).Magnitude

                                if Character == v25.Parent then
                                    v23 = v25
                                end
                            end
                        end

                        if v22 and v15.GameStatus.Hiked.Value then
                            local v27 = p4.Variables.GlobalVariables:PlayerHasBall(v15, v20, v23)

                            if u1 == nil then
                                local v28, v29 = p4.Variables.ABTest.GetExperimentVariables("uf-auto-catching"):await()

                                if v28 and v29 ~= nil then
                                    u1 = v29
                                end
                            end

                            local v30 = u1
                            local PrivateServerValue = game.ReplicatedStorage.Settings.PrivateServer.Value
                            local u32 = false

                            if v30 ~= nil then
                                u32 = v30.enabled

                                if u32 then
                                    u32 = false

                                    if p4.Variables.Functions.PlayerData:GetInstallDate() >= v30["install-cohort-date"].UnixTimestamp then
                                        u32 = not PrivateServerValue
                                    end
                                end
                            end

                            if (p4.Variables.InputType == "Mobile" or u32) and v20 == p4.Variables.LP and not v27 and Character.PrimaryPart.LocalCatchTracker.Value ~= 1 and not not v22.LinearVelocity.Enabled and (v22.Position - Character.PrimaryPart.Position).Magnitude < 15 then
                                p4:Catching()
                            end

                            local TackleBoxValue = v20.Replicated.TackleBox.Value

                            if TackleBoxValue and TackleBoxValue.Parent and (v20 ~= p4.Variables.LP or p4.BallEquipType ~= p4.DEF_QUARTERBACK) then
                                if not TackleBoxValue.Catching.Value or v27 then
                                    if v27 and v15.GameStatus.CanPop.Value then
                                        continue
                                    end
                                elseif v15.GameStatus.OneHandedCatch.Value == p4.Variables.GlobalVariables.OneHandedCatchValues.gameState.Unavailable then
                                    p4.Variables.Arms:CatchingArms(Character, v22.Position)
                                    Character.PrimaryPart.LocalCatchTracker.Value = 1

                                    continue
                                else
                                    local v34 = p4.Variables.FootballMath:ToField(v15, Character.PrimaryPart.Position)
                                    local u35 = v34.X < v15.FieldSettings.FieldDimensions.NorthTD.Value
                                    local u36 = v34.X > v15.FieldSettings.FieldDimensions.SouthTD.Value
                                    local u37 = false

                                    if u35 or u36 then
                                        if v15.GameStatus.NorthScorer.Value == v15.GameStatus.Offense.Value and u35 then
                                            u37 = true
                                        end

                                        if v15.GameStatus.SouthScorer.Value == v15.GameStatus.Offense.Value and u36 then
                                            u37 = true
                                        end
                                    end

                                    if not u37 or not p4.Variables.GlobalVariables:PlayerIsOnOffense(v15, v20) or v20 ~= p4.Variables.LP then
                                        p4.Variables.Arms:CatchingArms(Character, v22.Position)
                                        Character.PrimaryPart.LocalCatchTracker.Value = 1

                                        continue
                                    elseif not v15.GameInstance.Value.Replicated.Hitboxes[v20.Name].OneHandedCatching.Value then
                                        p4.Variables.Arms:OneHandedCatchArms(Character, v22.Position)
                                        Character.PrimaryPart.LocalCatchTracker.Value = 2

                                        continue
                                    else
                                        p4.Variables.Arms:NormalArms(Character)
                                        Character.PrimaryPart.LocalCatchTracker.Value = 0

                                        continue
                                    end
                                end
                            end
                        end

                        if Character and Character.PrimaryPart:FindFirstChild("LocalCatchTracker") and Character.PrimaryPart.LocalCatchTracker.Value ~= 0 then
                            p4.Variables.Arms:NormalArms(Character)
                            Character.PrimaryPart.LocalCatchTracker.Value = 0
                        end
                    end
                end
            end
        elseif p4.Variables.LP.Character and p4.Variables.LP.Character.PrimaryPart then
            for k, _ in pairs(p4.Variables.GlobalVariables.ReplicatedFolders) do
                local v40 = p4.Variables.GlobalVariables
                local v41 = tostring(k)
                local v42 = v40:GetPlayer(v41)

                if v42 and v42.Character and v42.Character.PrimaryPart and v42.Character.PrimaryPart.LocalCatchTracker.Value ~= 0 then
                    p4.Variables.Arms:NormalArms(v42.Character)
                    v42.Character.PrimaryPart.LocalCatchTracker.Value = 0
                end
            end
        end
    end,
    Hike = function(p5)
        local v44 = p5.Variables.CurrentGameSettings or p5.Variables.CurrentMiniSettings

        if v44 and p5.Variables.GlobalVariables:PlayerCanHike(v44) and not p5.HandoffActive and p5.Variables.GlobalVariables:PlayerIsQuarterback(p5.Variables.LP, v44) then
            p5.Variables.Functions.Input:XboxFocus(nil)
            v44.ReEvent:FireServer("Mechanics", "Hiked")

            return true
        end
    end
}
