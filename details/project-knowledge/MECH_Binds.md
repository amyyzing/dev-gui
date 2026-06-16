-- Script Path: game:GetChildren()[117]:GetChildren()[10]:GetChildren()[2]:GetChildren()[2]:GetChildren()[1]:GetChildren()[6]:GetChildren()[1]:GetChildren()[15]
-- Took 0.66s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- https://lua.expert/
local t = {}

local function _resetDirectionBeam(p1) --[[ _resetDirectionBeam | Line: 10 ]]
    if not p1 then
        return
    end

    if p1.Beam then
        p1.Beam.Enabled = false
        p1.Beam.Attachment0 = nil
        p1.Beam.Attachment1 = nil
        p1.Beam.Parent = nil
    end

    if p1.Attachment0 then
        p1.Attachment0.Parent = nil
    end

    if not p1.Attachment1 then
        return
    end

    p1.Attachment1.Parent = nil
end

function t.CreateDirectionBeam(p1, p2) --[[ CreateDirectionBeam | Line: 27 ]]
    p1:DestroyDirectionBeam(p2)
    p1.DirectionBeam[p2] = {
        Beam = game.ReplicatedStorage.Assets.Storage.GameAssets.DirectionBeam:Clone(),
        Attachment0 = Instance.new("Attachment"),
        Attachment1 = Instance.new("Attachment")
    }
end
function t.ResetDirectionBeam(p1, p2) --[[ ResetDirectionBeam | Line: 36 ]]
    local v1 = p1.DirectionBeam[p2]

    if not v1 then
        return
    end

    if v1.Beam then
        v1.Beam.Enabled = false
        v1.Beam.Attachment0 = nil
        v1.Beam.Attachment1 = nil
        v1.Beam.Parent = nil
    end

    if v1.Attachment0 then
        v1.Attachment0.Parent = nil
    end

    if not v1.Attachment1 then
        return
    end

    v1.Attachment1.Parent = nil
end
function t.ResetAllDirectionBeams(p1) --[[ ResetAllDirectionBeams | Line: 40 ]]
    for k, v in pairs(p1.DirectionBeam) do
        if v then
            if v.Beam then
                v.Beam.Enabled = false
                v.Beam.Attachment0 = nil
                v.Beam.Attachment1 = nil
                v.Beam.Parent = nil
            end

            if v.Attachment0 then
                v.Attachment0.Parent = nil
            end

            if v.Attachment1 then
                v.Attachment1.Parent = nil
            end
        end
    end
end
function t.DestroyDirectionBeam(p1, p2) --[[ DestroyDirectionBeam | Line: 46 ]]
    local v1 = p1.DirectionBeam[p2]

    if not v1 then
        return
    end

    if v1 then
        if v1.Beam then
            v1.Beam.Enabled = false
            v1.Beam.Attachment0 = nil
            v1.Beam.Attachment1 = nil
            v1.Beam.Parent = nil
        end

        if v1.Attachment0 then
            v1.Attachment0.Parent = nil
        end

        if v1.Attachment1 then
            v1.Attachment1.Parent = nil
        end
    end

    if v1.Beam then
        v1.Beam:Destroy()
    end

    if v1.Attachment0 then
        v1.Attachment0:Destroy()
    end

    if v1.Attachment1 then
        v1.Attachment1:Destroy()
    end

    p1.DirectionBeam[p2] = nil
end
function t.SetDirectionBeamTarget(p1, p2, p3, p4) --[[ SetDirectionBeamTarget | Line: 65 ]]
    local v1 = p1.DirectionBeam[p2]

    if not v1 then
        return
    end

    local v2 = p4 or Vector3.new(0, 0, 0)

    if not (v1.Beam and (v1.Attachment0 and v1.Attachment1)) then
        p1:DestroyDirectionBeam(p2)

        return
    end

    if not (p3 and p3.Parent) then
        p1:ResetDirectionBeam(p2)

        return
    end

    local Character = p2.Character

    if Character and (Character.PrimaryPart and Character:FindFirstChild("Humanoid")) then
        v1.Beam.Enabled = true
        v1.Beam.Parent = Character.PrimaryPart
        v1.Beam.Attachment0 = v1.Attachment0
        v1.Beam.Attachment1 = v1.Attachment1
        v1.Attachment0.Parent = Character.PrimaryPart
        v1.Attachment0.CFrame = CFrame.new(0, -Character.Humanoid.HipHeight, 0)
        v1.Attachment1.Parent = p3
        v1.Attachment1.CFrame = CFrame.new() + v2
    else
        p1:ResetDirectionBeam(p2)
    end
end

local v1 = nil

local function _getCachedBallTrackingAbTest(p1) --[[ _getCachedBallTrackingAbTest | Line: 100 | Upvalues: v1 (ref) ]]
    if v1 ~= nil then
        return v1
    end

    local v12, v2 = p1.Variables.ABTest.GetExperimentVariables("uf-ball-tracking"):await()

    if not v12 or v2 == nil then
        return v1
    end

    v1 = v2

    return v2
end

function t.AdjustBallMarker(p1) --[[ AdjustBallMarker | Line: 111 | Upvalues: v1 (ref) ]]
    local BallMarker = p1.Variables.PlayerData[game.Players.LocalPlayer.Name].ProfileData.GraphicsSettings.BallMarker
    local v12 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings
    local v2 = p1.Variables.CurrentGameInstance or p1.Variables.CurrentMiniInstance

    if not (v12 and (v2 and game.Players.LocalPlayer.Character)) then
        return
    end

    if v1 == nil then
        local v3, v4 = p1.Variables.ABTest.GetExperimentVariables("uf-ball-tracking"):await()

        if v3 and v4 ~= nil then
            v1 = v4
        end
    end

    local v5 = v1
    local v6 = if v5 == nil or not (p1.Variables.Functions.PlayerData:GetInstallDate() >= v5["install-cohort-date"].UnixTimestamp) then false else v5["ball-tracking-ux-enabled"]

    if p1.Variables.Football and (BallMarker and (not p1.Variables.GlobalVariables:GetPlayerFromObjectValue(v12.GameStatus.ActiveCarrier) or v12.GameStatus.BallInAir.Value)) then
        if v6 then
            v2.Local.BallMarker_BallTrackingUX.CFrame = CFrame.new(p1.Variables.Football.CFrame.X, v2.Local.Center.Position.Y + 0.4, p1.Variables.Football.CFrame.Z) * CFrame.Angles(0, tick() % math.pi * 2.5, 0)
            v2.Local.BallMarker_BallTrackingUX.BeamTop.CFrame = CFrame.new(0, p1.Variables.Football.CFrame.Y - v2.Local.Center.Position.Y, 0) * CFrame.Angles(0, tick() % math.pi * 2.5, 0)

            local v9 = math.clamp((p1.Variables.Football.CFrame.Y - v2.Local.Center.Position.Y) / 30, 0.1, 1)

            v2.Local.BallMarker_BallTrackingUX.GroundCenter.Circle.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, (v9 + 1) * 1.5), NumberSequenceKeypoint.new(1, (v9 + 1) * 1.5) })
            v2.Local.BallMarker_BallTrackingUX.GroundCenter.Circle.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1 - v9), NumberSequenceKeypoint.new(1, 1 - v9) })
            v2.Local.BallMarker.CFrame = v2.Local.Center.CFrame * CFrame.new(0, -10, 0)
        else
            v2.Local.BallMarker.CFrame = CFrame.new(p1.Variables.Football.CFrame.X, v2.Local.Center.Position.Y + 0.4, p1.Variables.Football.CFrame.Z) * CFrame.Angles(0, tick() % math.pi * 2.5, 0)
            v2.Local.BallMarker_BallTrackingUX.CFrame = v2.Local.Center.CFrame * CFrame.new(0, -10, 0)
            v2.Local.BallMarker_BallTrackingUX.BeamTop.CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(0, tick() % math.pi * 2.5, 0)
        end
    else
        v2.Local.BallMarker.CFrame = v2.Local.Center.CFrame * CFrame.new(0, -10, 0)
        v2.Local.BallMarker_BallTrackingUX.CFrame = v2.Local.Center.CFrame * CFrame.new(0, -10, 0)
        v2.Local.BallMarker_BallTrackingUX.BeamTop.CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(0, tick() % math.pi * 2.5, 0)
    end
end
function t.CreateSphereLandingMarker(p1) --[[ CreateSphereLandingMarker | Line: 171 ]]
    local v2 = p1.Variables.CurrentGameInstance or p1.Variables.CurrentMiniInstance

    if not ((p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings) and v2) then
        return
    end

    local SphereMarker = Instance.new("Part")

    SphereMarker.Name = "SphereMarker"
    SphereMarker.Shape = Enum.PartType.Ball
    SphereMarker.Size = Vector3.new(18, 3, 6)
    SphereMarker.Transparency = 0.5
    SphereMarker.CanCollide = false
    SphereMarker.Anchored = true
    SphereMarker.Color = Color3.fromRGB(255, 170, 0)
    SphereMarker.TopSurface = Enum.SurfaceType.Smooth
    SphereMarker.BottomSurface = Enum.SurfaceType.Smooth
    SphereMarker.Parent = v2.Local.LandingMarker
    SphereMarker.CFrame = v2.Local.LandingMarker.CFrame
end
function t.AdjustLandingMarkerBallTrackingUX(p1, p2) --[[ AdjustLandingMarkerBallTrackingUX | Line: 190 ]]
    local v2 = p1.Variables.CurrentGameInstance or p1.Variables.CurrentMiniInstance

    if not ((p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings) and (v2 and p1.Variables.GFunctions.Footballs[p1.Variables.Football])) then
        return
    end

    local v4 = p1.Variables.FootballMath:GetTimeToDestination((p2.Target.Value - p2.Origin.Value).unit * p2.Power.Value, p2.Origin.Value, v2.Replicated.PrimaryPart.CFrame.Position.Y + 0.4)
    local v5 = nil
    local v6

    if v4 == v4 and not (v4 <= 0) then
        local v9 = math.clamp(math.max(0, game.Workspace:GetServerTimeNow() - p1.Variables.GFunctions.Footballs[p1.Variables.Football].LaunchTime), 0, v4)

        v5 = v9
        v6 = if v4 < v9 then true else false
    else
        v6 = true
    end

    if v6 then
        v2.Local.LandingMarker_BallTrackingUX.CFrame = v2.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)

        return
    end

    local v10 = math.clamp(1 - v5 / v4, 0, 1)
    local v11 = v10 * 8.4 + 2.1

    v2.Local.LandingMarker_BallTrackingUX.GroundCenter.Circle1.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, v11), NumberSequenceKeypoint.new(1, v11) })

    local v12 = v10 * 12 + 3

    v2.Local.LandingMarker_BallTrackingUX.GroundCenter.Circle2.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
    v2.Local.LandingMarker_BallTrackingUX.GroundCenter.Circle3.Size.Keypoints[1] = NumberSequenceKeypoint.new(0, v11)
end
function t.UpdateLandingSpot(p1) --[[ UpdateLandingSpot | Line: 233 | Upvalues: v1 (ref) ]]
    local BallMarker = p1.Variables.PlayerData[game.Players.LocalPlayer.Name].ProfileData.GraphicsSettings.BallMarker
    local ThrowingArc = p1.Variables.PlayerData[game.Players.LocalPlayer.Name].ProfileData.GameplaySettings.ThrowingArc
    local v12 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings
    local v2 = p1.Variables.CurrentGameInstance or p1.Variables.CurrentMiniInstance

    if not (v12 and v2) then
        return
    end

    if not v2.Local.LandingMarker:FindFirstChild("SphereMarker") then
        p1:CreateSphereLandingMarker()
    end

    v2.Local.LandingMarker.SphereMarker.Transparency = 0.5

    if v1 == nil then
        local v3, v4 = p1.Variables.ABTest.GetExperimentVariables("uf-ball-tracking"):await()

        if v3 and v4 ~= nil then
            v1 = v4
        end
    end

    local v5 = v1
    local v6 = if v5 == nil or not (p1.Variables.Functions.PlayerData:GetInstallDate() >= v5["install-cohort-date"].UnixTimestamp) then false else v5["ball-tracking-ux-enabled"]

    if v2.Replicated.PrimaryPart then
        if p1.Variables.Football and (p1.Variables.Football.Parent ~= nil and (v12.GameStatus.BallInAir.Value and BallMarker)) then
            if v6 then
                v2.Local.LandingMarker.CFrame = v2.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
                v2.Local.LandingMarker.SphereMarker.Transparency = 1

                if p1.Variables.GFunctions:CheckFootballBounce() or p1.Variables.GlobalVariables:GetPlayer(p1.Variables.Football.Parent.Name) then
                    v2.Local.LandingMarker_BallTrackingUX.CFrame = v2.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
                else
                    local BallInfo = v12.GameStatus.BallInfo

                    if ({
                        PRAC_Practice = true,
                        EGGH_Active = true,
                        QBGA_Throwing = true,
                        ACCU_Throwing = true,
                        TURK_Active = true,
                        PUNT_Kicking = true,
                        PICK_Idle = true,
                        PKMA_Idle = true
                    })[v12.ActiveState.Value] then
                        if p1.Variables.CurrentBallInfo then
                            BallInfo.Target.Value = p1.Variables.CurrentBallInfo.Target
                            BallInfo.Origin.Value = p1.Variables.CurrentBallInfo.Origin
                            BallInfo.Power.Value = p1.Variables.CurrentBallInfo.Power
                            v2.Local.LandingMarker_BallTrackingUX.CFrame = p1.Variables.FootballMath:GetLandingSpot(BallInfo.Target.Value, BallInfo.Origin.Value, BallInfo.Power.Value, v2.Replicated.PrimaryPart.CFrame.Position.Y + 0.4) * CFrame.Angles(0, tick() % math.pi * 2.5, 0)
                            p1:AdjustLandingMarkerBallTrackingUX(BallInfo)
                        end
                    else
                        v2.Local.LandingMarker_BallTrackingUX.CFrame = p1.Variables.FootballMath:GetLandingSpot(BallInfo.Target.Value, BallInfo.Origin.Value, BallInfo.Power.Value, v2.Replicated.PrimaryPart.CFrame.Position.Y + 0.4) * CFrame.Angles(0, tick() % math.pi * 2.5, 0)
                        p1:AdjustLandingMarkerBallTrackingUX(BallInfo)
                    end
                end
            else
                v2.Local.LandingMarker.CFrame = p1.Variables.FootballMath:GetLandingSpot(v12.GameStatus.BallInfo.Target.Value, v12.GameStatus.BallInfo.Origin.Value, v12.GameStatus.BallInfo.Power.Value, v2.Replicated.PrimaryPart.CFrame.Position.Y + 0.4) * CFrame.Angles(0, tick() % math.pi * 2.5, 0)
                v2.Local.LandingMarker.SphereMarker.Transparency = 1
                v2.Local.LandingMarker_BallTrackingUX.CFrame = v2.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
            end
        elseif p1.Variables.CurrentBallInfo and (BallMarker and p1.Variables.InputType == "Mobile") then
            if v6 then
                v2.Local.LandingMarker.CFrame = v2.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
                v2.Local.LandingMarker.SphereMarker.Transparency = 1

                local v7 = if p1.Variables.Football and p1.Variables.Football.Parent then p1.Variables.GlobalVariables:GetPlayer(p1.Variables.Football.Parent.Name) else false

                if p1.Variables.GFunctions:CheckFootballBounce() or v7 then
                    v2.Local.LandingMarker_BallTrackingUX.CFrame = v2.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
                else
                    local BallInfo = v12.GameStatus.BallInfo

                    if ({
                        PRAC_Practice = true,
                        EGGH_Active = true,
                        QBGA_Throwing = true,
                        ACCU_Throwing = true,
                        TURK_Active = true,
                        PUNT_Kicking = true,
                        PICK_Idle = true,
                        PKMA_Idle = true
                    })[v12.ActiveState.Value] then
                        if p1.Variables.CurrentBallInfo then
                            BallInfo.Target.Value = p1.Variables.CurrentBallInfo.Target
                            BallInfo.Origin.Value = p1.Variables.CurrentBallInfo.Origin
                            BallInfo.Power.Value = p1.Variables.CurrentBallInfo.Power
                            v2.Local.LandingMarker_BallTrackingUX.CFrame = p1.Variables.FootballMath:GetLandingSpot(BallInfo.Target.Value, BallInfo.Origin.Value, BallInfo.Power.Value, v2.Replicated.PrimaryPart.CFrame.Position.Y + 0.4) * CFrame.Angles(0, tick() % math.pi * 2.5, 0)
                            p1:AdjustLandingMarkerBallTrackingUX(BallInfo)
                        end
                    else
                        v2.Local.LandingMarker_BallTrackingUX.CFrame = p1.Variables.FootballMath:GetLandingSpot(BallInfo.Target.Value, BallInfo.Origin.Value, BallInfo.Power.Value, v2.Replicated.PrimaryPart.CFrame.Position.Y + 0.4) * CFrame.Angles(0, tick() % math.pi * 2.5, 0)
                        p1:AdjustLandingMarkerBallTrackingUX(BallInfo)
                    end
                end
            else
                v2.Local.LandingMarker.CFrame = p1.Variables.FootballMath:GetLandingSpot(p1.Variables.CurrentBallInfo.Target, p1.Variables.CurrentBallInfo.Origin, p1.Variables.CurrentBallInfo.Power, v2.Replicated.PrimaryPart.CFrame.Position.Y + 0.4) * CFrame.Angles(0, tick() % math.pi * 2.5, 0)
                v2.Local.LandingMarker.SphereMarker.Transparency = 1
                v2.Local.LandingMarker_BallTrackingUX.CFrame = v2.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
            end
        else
            v2.Local.LandingMarker.CFrame = v2.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
            v2.Local.LandingMarker_BallTrackingUX.CFrame = v2.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
        end

        v2.Local.LandingMarker.SphereMarker.CFrame = v2.Local.LandingMarker.CFrame
    end

    if not (p1.Variables.ImprovedAiming and p1.Variables.ImprovedAiming.Enabled) then
        v2.Local.LandingMarker.SphereMarker.Transparency = 1
    end

    if ThrowingArc and (v12.AssetsUsed.ThrowingArc.Value and (not p1:CheckAutoThrowEnabled() or (p1.Variables.InputType ~= "Mobile" or p1.Variables.TestData == nil))) then
        if p1.Variables.InputType == "Mobile" and (p1.Variables.TestData ~= nil and not (game.Players.LocalPlayer.Replicated.InstallDate.Value <= p1.Variables.TestData.fromInstallDate)) then
            v2.Local.Center.ThrowingArc.Enabled = false

            return
        end

        if p1.Variables.LP.Character and p1.Variables.LP.Character.PrimaryPart and (p1.Variables.Football and p1.Variables.Football.Parent == p1.Variables.LP.Character and (p1.Variables.GlobalVariables:PlayerIsQuarterback(p1.Variables.LP, v12) and p1.BallEquipType == p1.DEF_QUARTERBACK)) then
            local v9 = p1.Variables.Functions.Utilities:ScreenPointToRay(p1.PlayerMouse.X, p1.PlayerMouse.Y)
            local v10 = v9.Origin + v9.Direction * 1000

            if p1.Variables.ImprovedAiming.Enabled then
                v2.Local.Center.ThrowingArc.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.4, 0.5), NumberSequenceKeypoint.new(1, 1) })
            else
                v2.Local.Center.ThrowingArc.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.02, 0.6),
                    NumberSequenceKeypoint.new(0.8, 1),
                    NumberSequenceKeypoint.new(1, 1)
                })
            end

            if p1.Variables.InputType == "Mobile" then
                local v11 = p1.Variables.PlayerModule.controls:GetActiveController()
                local t = {}

                for v122 in p1.Fingers do
                    if v122 ~= v11.moveTouchObject then
                        table.insert(t, v122)
                    end
                end

                local v13 = t[1]

                if v13 then
                    p1.LastAimingPosition = v13.Position
                end

                if p1.LastAimingPosition then
                    local v14 = p1.Variables.Functions.Utilities:ScreenPointToRay(p1.LastAimingPosition.X, p1.LastAimingPosition.Y)

                    v10 = v14.Origin + v14.Direction * 1000
                end
            elseif p1.Variables.InputType == "Controller" then
                local v15 = p1:GetXboxCrosshairPosition()
                local v16 = p1.Variables.Functions.Utilities:ScreenPointToRay(v15.X, v15.Y)

                v10 = v16.Origin + v16.Direction * 1000
            end

            local v17 = CFrame.new(Vector3.new(1, 1.5, 0))
            local Position = p1.Variables.LP.Character.PrimaryPart.Position
            local Position2 = (CFrame.lookAt(Position, Position + v10.unit) * v17).Position
            local v19 = p1.Variables.FootballMath:GetLandingSpot(v10, Position2, p1.BallPower * p1.Variables.FootballMath.Settings.MaximumPowerCoefficient, v2.Replicated.Center.CFrame.Y + 0.5)
            local v20 = p1.Variables.FootballMath:GetTimeToDestination((v10 - Position2).Unit * p1.BallPower * p1.Variables.FootballMath.Settings.MaximumPowerCoefficient, Position2, v2.Replicated.Center.CFrame.Y + 0.5)
            local v22, v23, v24, v25 = p1.Variables.FootballMath:BeamDirection(p1.Variables.FootballMath:GetVelocityForPass(Position2, v19.Position, v20), Position2, v20)

            v2.Local.Center.ThrowingArc.CurveSize0 = v22
            v2.Local.Center.ThrowingArc.CurveSize1 = v23
            v2.Local.Center.C2.WorldCFrame = v24
            v2.Local.Center.C3.WorldCFrame = v25
            v2.Local.Center.ThrowingArc.Enabled = true
            v2.Local.LandingMarker.CFrame = v19 * CFrame.Angles(0, tick() % math.pi * 2.5, 0)
            v2.Local.LandingMarker.SphereMarker.CFrame = v2.Local.LandingMarker.CFrame
        else
            v2.Local.Center.ThrowingArc.Enabled = false
        end
    else
        v2.Local.Center.ThrowingArc.Enabled = false
    end
end

return t
