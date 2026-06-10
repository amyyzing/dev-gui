-- Script Path: game:GetService("ReplicatedStorage").Assets.Modules.Client.Mechanics.Modules.General.MECH_ControlsCatchHikeThrow

local t = {}
local v1 = nil

local function _getCachedAutoCatchingAbTest(p1) --[[ _getCachedAutoCatchingAbTest | Line: 10 | Upvalues: v1 (ref) ]]
    if v1 ~= nil then
        return v1
    end

    local v12, v2 = p1.Variables.ABTest.GetExperimentVariables("uf-auto-catching"):await()

    if not v12 or v2 == nil then
        return v1
    end

    v1 = v2

    return v2
end

function t.CatchHikeThrow(p1) --[[ CatchHikeThrow | Line: 22 ]]
    if p1:FilterAction("CatchHikeThrow") == false then
        return
    end

    local v1 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings
    local Hiking = v1.MechanicsUsed.Hiking.Value
    local Catching = v1.MechanicsUsed.Catching.Value

    if not v1 then
        return
    end

    local v2 = if p1.Variables.InputType == "Controller" and (p1:CheckAutoThrowEnabled() and p1:GetClosestReceiverNumber() ~= nil) then false else true
    local v3 = p1.Variables.GlobalVariables:PlayerIsQuarterback(p1.Variables.LP, v1)

    if p1.BallEquipped and (p1.BallEquipType == p1.DEF_QUARTERBACK and (v1.GameStatus.Hiked.Value and (v3 and (v2 and v1.MechanicsUsed.Throwing.Value)))) then
        if p1.Variables.Functions.MutationsMode:MutationModeCheck() and p1:IsPlayerStunnedByMutation() then
            return
        end

        p1:FootballThrow()
    else
        if not p1.BallEquipped and (not v1.GameStatus.Hiked.Value and (v3 and Hiking)) then
            p1:Hike()

            return
        end

        if not (v1.GameStatus.Hiked.Value and (p1.Variables.LP.Character and Catching)) then
            return
        end

        if p1.Variables.Functions.MutationsMode:MutationModeCheck() and p1:IsPlayerStunnedByMutation() then
            return
        end

        p1:Catching()
    end
end
function t.Catching(p1) --[[ Catching | Line: 62 ]]
    if p1:FilterAction("Catching") == false then
        return
    end

    (p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings).ReEvent:FireServer("Mechanics", "Catching", true)
end
function t.CatchingLoop(p1) --[[ CatchingLoop | Line: 70 | Upvalues: v1 (ref) ]]
    local v12 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

    if v12 and p1.Variables.GlobalVariables:PlayerIsInGame(v12, p1.Variables.LP) then
        for v2, v3 in p1.Variables.GlobalVariables.ReplicatedFolders do
            local v4 = p1.Variables.GlobalVariables:GetPlayer((tostring(v2)))

            if v4 then
                local Character = v4.Character

                if Character ~= nil and (Character.PrimaryPart and (p1.Variables.GlobalVariables:PlayerIsInGame(v12, v4) and (Character:FindFirstChild("Humanoid") and Character.Humanoid.Health > 0))) then
                    local v5 = (1 / 0)
                    local v6 = nil
                    local v7 = nil

                    for v8, v9 in p1.Variables.GFunctions.Footballs do
                        if v8 and (v8.Parent and (v9.GameID == v12.Name and (v8.Position - Character.PrimaryPart.Position).Magnitude < v5)) then
                            v5 = (v8.Position - Character.PrimaryPart.Position).Magnitude

                            if v8.Parent == Character then
                                v6 = v8
                                v7 = v8

                                continue
                            end

                            v6 = v8
                        end
                    end

                    if v6 and v12.GameStatus.Hiked.Value then
                        local v10 = p1.Variables.GlobalVariables:PlayerHasBall(v12, v4, v7)

                        if v1 == nil then
                            local v11, v122 = p1.Variables.ABTest.GetExperimentVariables("uf-auto-catching"):await()

                            if v11 and v122 ~= nil then
                                v1 = v122
                            end
                        end

                        local v13 = v1
                        local PrivateServer = game.ReplicatedStorage.Settings.PrivateServer.Value

                        if (p1.Variables.InputType == "Mobile" or (if v13 == nil then false else v13.enabled and (if p1.Variables.Functions.PlayerData:GetInstallDate() >= v13["install-cohort-date"].UnixTimestamp then not PrivateServer else false))) and (v4 == p1.Variables.LP and (not v10 and (Character.PrimaryPart.LocalCatchTracker.Value ~= 1 and (v6.LinearVelocity.Enabled and (v6.Position - Character.PrimaryPart.Position).Magnitude < 15)))) then
                            p1:Catching()
                        end

                        local TackleBox = v4.Replicated.TackleBox.Value

                        if TackleBox and (TackleBox.Parent and (v4 ~= p1.Variables.LP or p1.BallEquipType ~= p1.DEF_QUARTERBACK)) then
                            if TackleBox.Catching.Value and not v10 then
                                if v12.GameStatus.OneHandedCatch.Value == p1.Variables.GlobalVariables.OneHandedCatchValues.gameState.Unavailable then
                                    p1.Variables.Arms:CatchingArms(Character, v6.Position)
                                    Character.PrimaryPart.LocalCatchTracker.Value = 1

                                    continue
                                end

                                local v15 = p1.Variables.FootballMath:ToField(v12, Character.PrimaryPart.Position)
                                local v16 = if v15.X < v12.FieldSettings.FieldDimensions.NorthTD.Value then true else false
                                local v17 = if v15.X > v12.FieldSettings.FieldDimensions.SouthTD.Value then true else false
                                local v18 = false

                                if v16 or v17 then
                                    if v12.GameStatus.NorthScorer.Value == v12.GameStatus.Offense.Value and v16 then
                                        v18 = true
                                    end

                                    if v12.GameStatus.SouthScorer.Value == v12.GameStatus.Offense.Value and v17 then
                                        v18 = true
                                    end
                                end

                                if v18 and (p1.Variables.GlobalVariables:PlayerIsOnOffense(v12, v4) and v4 == p1.Variables.LP) then
                                    if v12.GameInstance.Value.Replicated.Hitboxes[v4.Name].OneHandedCatching.Value then
                                        p1.Variables.Arms:NormalArms(Character)
                                        Character.PrimaryPart.LocalCatchTracker.Value = 0

                                        continue
                                    end

                                    p1.Variables.Arms:OneHandedCatchArms(Character, v6.Position)
                                    Character.PrimaryPart.LocalCatchTracker.Value = 2

                                    continue
                                end

                                p1.Variables.Arms:CatchingArms(Character, v6.Position)
                                Character.PrimaryPart.LocalCatchTracker.Value = 1

                                continue
                            end

                            if not (v10 and v12.GameStatus.CanPop.Value) and (Character and (Character.PrimaryPart:FindFirstChild("LocalCatchTracker") and Character.PrimaryPart.LocalCatchTracker.Value ~= 0)) then
                                p1.Variables.Arms:NormalArms(Character)
                                Character.PrimaryPart.LocalCatchTracker.Value = 0
                            end
                        elseif Character and (Character.PrimaryPart:FindFirstChild("LocalCatchTracker") and Character.PrimaryPart.LocalCatchTracker.Value ~= 0) then
                            p1.Variables.Arms:NormalArms(Character)
                            Character.PrimaryPart.LocalCatchTracker.Value = 0
                        end
                    elseif Character and (Character.PrimaryPart:FindFirstChild("LocalCatchTracker") and Character.PrimaryPart.LocalCatchTracker.Value ~= 0) then
                        p1.Variables.Arms:NormalArms(Character)
                        Character.PrimaryPart.LocalCatchTracker.Value = 0
                    end
                end
            end
        end
    else
        if not (p1.Variables.LP.Character and p1.Variables.LP.Character.PrimaryPart) then
            return
        end

        for k, v in pairs(p1.Variables.GlobalVariables.ReplicatedFolders) do
            local v19 = p1.Variables.GlobalVariables:GetPlayer((tostring(k)))

            if v19 and (v19.Character and (v19.Character.PrimaryPart and v19.Character.PrimaryPart.LocalCatchTracker.Value ~= 0)) then
                p1.Variables.Arms:NormalArms(v19.Character)
                v19.Character.PrimaryPart.LocalCatchTracker.Value = 0
            end
        end
    end
end
function t.Hike(p1) --[[ Hike | Line: 174 ]]
    local v1 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

    if v1 and (p1.Variables.GlobalVariables:PlayerCanHike(v1) and (not p1.HandoffActive and p1.Variables.GlobalVariables:PlayerIsQuarterback(p1.Variables.LP, v1))) then
        p1.Variables.Functions.Input:XboxFocus(nil)
        v1.ReEvent:FireServer("Mechanics", "Hiked")

        return true
    end
end

return t
