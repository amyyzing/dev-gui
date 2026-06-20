-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[2]:GetChildren()[1]:GetChildren()[6]:GetChildren()[1]:GetChildren()[15]
-- Took 0.16s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- Decompiled using ByteFall
-- discord.gg/bytefall
local function _resetDirectionBeam(p1)
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

    if p1.Attachment1 then
        p1.Attachment1.Parent = nil
    end
end

local t1 = {
    CreateDirectionBeam = function(p2, p3)
        p2:DestroyDirectionBeam(p3)

        local v8 = p2.DirectionBeam
        local clone = game.ReplicatedStorage.Assets.Storage.GameAssets.DirectionBeam:Clone()

        v8[p3] = {
            Beam = clone,
            Attachment0 = Instance.new("Attachment"),
            Attachment1 = Instance.new("Attachment")
        }
    end,
    ResetDirectionBeam = function(p4, p5)
        local v12 = p4.DirectionBeam[p5]

        if not v12 then
            return
        end

        if v12.Beam then
            v12.Beam.Enabled = false
            v12.Beam.Attachment0 = nil
            v12.Beam.Attachment1 = nil
            v12.Beam.Parent = nil
        end

        if v12.Attachment0 then
            v12.Attachment0.Parent = nil
        end

        if v12.Attachment1 then
            v12.Attachment1.Parent = nil
        end
    end,
    ResetAllDirectionBeams = function(p6)
        for _, v in pairs(p6.DirectionBeam) do
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
    end,
    DestroyDirectionBeam = function(p7, p8)
        local v18 = p7.DirectionBeam[p8]

        if not v18 then
            return
        end

        if v18.Beam then
            v18.Beam.Enabled = false
            v18.Beam.Attachment0 = nil
            v18.Beam.Attachment1 = nil
            v18.Beam.Parent = nil
        end

        if v18.Attachment0 then
            v18.Attachment0.Parent = nil
        end

        if v18.Attachment1 then
            v18.Attachment1.Parent = nil
        end

        if v18.Beam then
            v18.Beam:Destroy()
        end

        if v18.Attachment0 then
            v18.Attachment0:Destroy()
        end

        if v18.Attachment1 then
            v18.Attachment1:Destroy()
        end

        p7.DirectionBeam[p8] = nil
    end,
    SetDirectionBeamTarget = function(p9, p10, p11, p12)
        local v23 = p9.DirectionBeam[p10]

        if not v23 then
            return
        end

        if not v23.Beam or not v23.Attachment0 or not v23.Attachment1 then
            p9:DestroyDirectionBeam(p10)

            return
        end

        if not p11 or not p11.Parent then
            p9:ResetDirectionBeam(p10)

            return
        end

        local Character = p10.Character

        if not Character or not Character.PrimaryPart or not Character:FindFirstChild("Humanoid") then
            p9:ResetDirectionBeam(p10)

            return
        end

        v23.Beam.Enabled = true
        v23.Beam.Parent = Character.PrimaryPart
        v23.Beam.Attachment0 = v23.Attachment0
        v23.Beam.Attachment1 = v23.Attachment1
        v23.Attachment0.Parent = Character.PrimaryPart
        v23.Attachment0.CFrame = CFrame.new(0, -Character.Humanoid.HipHeight, 0)
        v23.Attachment1.Parent = p11
        v23.Attachment1.CFrame = CFrame.new() + (p12 or Vector3.new(0, 0, 0))
    end
}

local u3 = nil

local function _getCachedBallTrackingAbTest(p13)
    if u3 == nil then
        local v26, v27 = p13.Variables.ABTest.GetExperimentVariables("uf-ball-tracking"):await()

        if v26 and v27 ~= nil then
            u3 = v27
        end
    end

    return u3
end
function t1.AdjustBallMarker(p14)
    local v29 = p14.Variables.PlayerData[game.Players.LocalPlayer.Name].ProfileData.GraphicsSettings.BallMarker
    local v30 = p14.Variables.CurrentGameSettings or p14.Variables.CurrentMiniSettings
    local v31 = p14.Variables.CurrentGameInstance or p14.Variables.CurrentMiniInstance

    if v30 and v31 and game.Players.LocalPlayer.Character then
        if u3 == nil then
            local v32, v33 = p14.Variables.ABTest.GetExperimentVariables("uf-ball-tracking"):await()

            if v32 and v33 ~= nil then
                u3 = v33
            end
        end

        local v34 = u3
        local u35 = false

        if v34 ~= nil then
            u35 = false

            if p14.Variables.Functions.PlayerData:GetInstallDate() >= v34["install-cohort-date"].UnixTimestamp then
                u35 = v34["ball-tracking-ux-enabled"]
            end
        end

        local v36 = p14.Variables.GlobalVariables:GetPlayerFromObjectValue(v30.GameStatus.ActiveCarrier)

        if not p14.Variables.Football or not v29 or not not v36 and not v30.GameStatus.BallInAir.Value then
            v31.Local.BallMarker.CFrame = v31.Local.Center.CFrame * CFrame.new(0, -10, 0)
            v31.Local.BallMarker_BallTrackingUX.CFrame = v31.Local.Center.CFrame * CFrame.new(0, -10, 0)

            local v37 = v31.Local.BallMarker_BallTrackingUX.BeamTop
            local v38 = CFrame.Angles
            local v39 = tick()
            local v40 = v38(0, v39 % 3.141592653589793 * 2.5, 0)

            v37.CFrame = CFrame.new(0, 0, 0) * v40

            return
        end

        if not u35 then
            local v41 = v31.Local.BallMarker
            local cFrame = CFrame.new(p14.Variables.Football.CFrame.X, v31.Local.Center.Position.Y + 0.4, p14.Variables.Football.CFrame.Z)
            local v43 = CFrame.Angles
            local v44 = tick()
            local v45 = v43(0, v44 % 3.141592653589793 * 2.5, 0)

            v41.CFrame = cFrame * v45
            v31.Local.BallMarker_BallTrackingUX.CFrame = v31.Local.Center.CFrame * CFrame.new(0, -10, 0)

            local v46 = v31.Local.BallMarker_BallTrackingUX.BeamTop
            local v47 = CFrame.Angles
            local v48 = tick()
            local v49 = v47(0, v48 % 3.141592653589793 * 2.5, 0)

            v46.CFrame = CFrame.new(0, 0, 0) * v49

            return
        end

        local v50 = v31.Local.BallMarker_BallTrackingUX
        local cFrame = CFrame.new(p14.Variables.Football.CFrame.X, v31.Local.Center.Position.Y + 0.4, p14.Variables.Football.CFrame.Z)
        local v52 = CFrame.Angles
        local v53 = tick()
        local v54 = v52(0, v53 % 3.141592653589793 * 2.5, 0)

        v50.CFrame = cFrame * v54

        local v55 = v31.Local.BallMarker_BallTrackingUX.BeamTop
        local cFrame2 = CFrame.new(0, p14.Variables.Football.CFrame.Y - v31.Local.Center.Position.Y, 0)
        local v57 = CFrame.Angles
        local v58 = tick()
        local v59 = v57(0, v58 % 3.141592653589793 * 2.5, 0)

        v55.CFrame = cFrame2 * v59

        local v60 = math.clamp((p14.Variables.Football.CFrame.Y - v31.Local.Center.Position.Y) / 30, 0.1, 1)

        v31.Local.BallMarker_BallTrackingUX.GroundCenter.Circle.Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, (v60 + 1) * 1.5),
            NumberSequenceKeypoint.new(1, (v60 + 1) * 1.5)
        })
        v31.Local.BallMarker_BallTrackingUX.GroundCenter.Circle.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1 - v60),
            NumberSequenceKeypoint.new(1, 1 - v60)
        })
        v31.Local.BallMarker.CFrame = v31.Local.Center.CFrame * CFrame.new(0, -10, 0)

        return
    end
end
function t1.CreateSphereLandingMarker(p15)
    local v62 = p15.Variables.CurrentGameInstance or p15.Variables.CurrentMiniInstance

    if (p15.Variables.CurrentGameSettings or p15.Variables.CurrentMiniSettings) and v62 then
        local Part = Instance.new("Part")

        Part.Name = "SphereMarker"
        Part.Shape = Enum.PartType.Ball
        Part.Size = Vector3.new(18, 3, 6)
        Part.Transparency = 0.5
        Part.CanCollide = false
        Part.Anchored = true
        Part.Color = Color3.fromRGB(255, 170, 0)
        Part.TopSurface = Enum.SurfaceType.Smooth
        Part.BottomSurface = Enum.SurfaceType.Smooth
        Part.Parent = v62.Local.LandingMarker
        Part.CFrame = v62.Local.LandingMarker.CFrame
    end
end
function t1.AdjustLandingMarkerBallTrackingUX(p16, p17)
    local v66 = p16.Variables.CurrentGameInstance or p16.Variables.CurrentMiniInstance

    if (p16.Variables.CurrentGameSettings or p16.Variables.CurrentMiniSettings) and v66 and p16.Variables.GFunctions.Footballs[p16.Variables.Football] then
        local v67 = p16.Variables.FootballMath:GetTimeToDestination((p17.Target.Value - p17.Origin.Value).unit * p17.Power.Value, p17.Origin.Value, v66.Replicated.PrimaryPart.CFrame.Position.Y + 0.4)
        local v68 = nil
        local u69

        if v67 == v67 and not (v67 <= 0) then
            local v70 = game.Workspace:GetServerTimeNow()
            local v71 = math.max(0, v70 - p16.Variables.GFunctions.Footballs[p16.Variables.Football].LaunchTime)

            v68 = math.clamp(v71, 0, v67)
            u69 = v67 < v68
        else
            u69 = true
        end

        if u69 then
            v66.Local.LandingMarker_BallTrackingUX.CFrame = v66.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)

            return
        end

        local v72 = math.clamp(1 - v68 / v67, 0, 1)
        local n1 = v72 * 8.4 + 2.1

        v66.Local.LandingMarker_BallTrackingUX.GroundCenter.Circle1.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, n1), NumberSequenceKeypoint.new(1, n1) })

        local n2 = v72 * 12 + 3

        v66.Local.LandingMarker_BallTrackingUX.GroundCenter.Circle2.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, n2), NumberSequenceKeypoint.new(1, n2) })
        v66.Local.LandingMarker_BallTrackingUX.GroundCenter.Circle3.Size.Keypoints[1] = NumberSequenceKeypoint.new(0, n1)

        return
    end
end
function t1.UpdateLandingSpot(p18)
    local v76 = p18.Variables.PlayerData[game.Players.LocalPlayer.Name].ProfileData.GraphicsSettings.BallMarker
    local v77 = p18.Variables.PlayerData[game.Players.LocalPlayer.Name].ProfileData.GameplaySettings.ThrowingArc
    local v78 = p18.Variables.CurrentGameSettings or p18.Variables.CurrentMiniSettings
    local v79 = p18.Variables.CurrentGameInstance or p18.Variables.CurrentMiniInstance

    if v78 and v79 then
        if not v79.Local.LandingMarker:FindFirstChild("SphereMarker") then
            p18:CreateSphereLandingMarker()
        end

        v79.Local.LandingMarker.SphereMarker.Transparency = 0.5

        if u3 == nil then
            local v80, v81 = p18.Variables.ABTest.GetExperimentVariables("uf-ball-tracking"):await()

            if v80 and v81 ~= nil then
                u3 = v81
            end
        end

        local v82 = u3
        local u83 = false

        if v82 ~= nil then
            u83 = false

            if p18.Variables.Functions.PlayerData:GetInstallDate() >= v82["install-cohort-date"].UnixTimestamp then
                u83 = v82["ball-tracking-ux-enabled"]
            end
        end

        if v79.Replicated.PrimaryPart then
            if not p18.Variables.Football or p18.Variables.Football.Parent == nil or not v78.GameStatus.BallInAir.Value or not v76 then
                if not p18.Variables.CurrentBallInfo or not v76 or p18.Variables.InputType ~= "Mobile" then
                    v79.Local.LandingMarker.CFrame = v79.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
                    v79.Local.LandingMarker_BallTrackingUX.CFrame = v79.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
                elseif not u83 then
                    local v84 = v79.Local.LandingMarker
                    local v85 = p18.Variables.FootballMath:GetLandingSpot(p18.Variables.CurrentBallInfo.Target, p18.Variables.CurrentBallInfo.Origin, p18.Variables.CurrentBallInfo.Power, v79.Replicated.PrimaryPart.CFrame.Position.Y + 0.4)
                    local v86 = CFrame.Angles
                    local v87 = tick()
                    local v88 = v86(0, v87 % 3.141592653589793 * 2.5, 0)

                    v84.CFrame = v85 * v88
                    v79.Local.LandingMarker.SphereMarker.Transparency = 1
                    v79.Local.LandingMarker_BallTrackingUX.CFrame = v79.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
                else
                    v79.Local.LandingMarker.CFrame = v79.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
                    v79.Local.LandingMarker.SphereMarker.Transparency = 1

                    local u89 = false

                    if p18.Variables.Football and p18.Variables.Football.Parent then
                        u89 = p18.Variables.GlobalVariables:GetPlayer(p18.Variables.Football.Parent.Name)
                    end

                    if not p18.Variables.GFunctions:CheckFootballBounce() and not u89 then
                        local v90 = v78.GameStatus.BallInfo
                        local t2 = {
                            PRAC_Practice = true,
                            EGGH_Active = true,
                            QBGA_Throwing = true,
                            ACCU_Throwing = true,
                            TURK_Active = true,
                            PUNT_Kicking = true,
                            PICK_Idle = true,
                            PKMA_Idle = true
                        }

                        if not t2[v78.ActiveState.Value] then
                            local v92 = v79.Local.LandingMarker_BallTrackingUX
                            local v93 = p18.Variables.FootballMath:GetLandingSpot(v90.Target.Value, v90.Origin.Value, v90.Power.Value, v79.Replicated.PrimaryPart.CFrame.Position.Y + 0.4)
                            local v94 = CFrame.Angles
                            local v95 = tick()
                            local v96 = v94(0, v95 % 3.141592653589793 * 2.5, 0)

                            v92.CFrame = v93 * v96
                            p18:AdjustLandingMarkerBallTrackingUX(v90)
                        elseif p18.Variables.CurrentBallInfo then
                            v90.Target.Value = p18.Variables.CurrentBallInfo.Target
                            v90.Origin.Value = p18.Variables.CurrentBallInfo.Origin
                            v90.Power.Value = p18.Variables.CurrentBallInfo.Power

                            local v97 = v79.Local.LandingMarker_BallTrackingUX
                            local v98 = p18.Variables.FootballMath:GetLandingSpot(v90.Target.Value, v90.Origin.Value, v90.Power.Value, v79.Replicated.PrimaryPart.CFrame.Position.Y + 0.4)
                            local v99 = CFrame.Angles
                            local v100 = tick()
                            local v101 = v99(0, v100 % 3.141592653589793 * 2.5, 0)

                            v97.CFrame = v98 * v101
                            p18:AdjustLandingMarkerBallTrackingUX(v90)
                        end
                    else
                        v79.Local.LandingMarker_BallTrackingUX.CFrame = v79.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
                    end
                end
            elseif not u83 then
                local v102 = v79.Local.LandingMarker
                local v103 = p18.Variables.FootballMath:GetLandingSpot(v78.GameStatus.BallInfo.Target.Value, v78.GameStatus.BallInfo.Origin.Value, v78.GameStatus.BallInfo.Power.Value, v79.Replicated.PrimaryPart.CFrame.Position.Y + 0.4)
                local v104 = CFrame.Angles
                local v105 = tick()
                local v106 = v104(0, v105 % 3.141592653589793 * 2.5, 0)

                v102.CFrame = v103 * v106
                v79.Local.LandingMarker.SphereMarker.Transparency = 1
                v79.Local.LandingMarker_BallTrackingUX.CFrame = v79.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
            else
                v79.Local.LandingMarker.CFrame = v79.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
                v79.Local.LandingMarker.SphereMarker.Transparency = 1

                if not p18.Variables.GFunctions:CheckFootballBounce() and not p18.Variables.GlobalVariables:GetPlayer(p18.Variables.Football.Parent.Name) then
                    local v107 = v78.GameStatus.BallInfo
                    local t3 = {
                        PRAC_Practice = true,
                        EGGH_Active = true,
                        QBGA_Throwing = true,
                        ACCU_Throwing = true,
                        TURK_Active = true,
                        PUNT_Kicking = true,
                        PICK_Idle = true,
                        PKMA_Idle = true
                    }

                    if not t3[v78.ActiveState.Value] then
                        local v109 = v79.Local.LandingMarker_BallTrackingUX
                        local v110 = p18.Variables.FootballMath:GetLandingSpot(v107.Target.Value, v107.Origin.Value, v107.Power.Value, v79.Replicated.PrimaryPart.CFrame.Position.Y + 0.4)
                        local v111 = CFrame.Angles
                        local v112 = tick()
                        local v113 = v111(0, v112 % 3.141592653589793 * 2.5, 0)

                        v109.CFrame = v110 * v113
                        p18:AdjustLandingMarkerBallTrackingUX(v107)
                    elseif p18.Variables.CurrentBallInfo then
                        v107.Target.Value = p18.Variables.CurrentBallInfo.Target
                        v107.Origin.Value = p18.Variables.CurrentBallInfo.Origin
                        v107.Power.Value = p18.Variables.CurrentBallInfo.Power

                        local v114 = v79.Local.LandingMarker_BallTrackingUX
                        local v115 = p18.Variables.FootballMath:GetLandingSpot(v107.Target.Value, v107.Origin.Value, v107.Power.Value, v79.Replicated.PrimaryPart.CFrame.Position.Y + 0.4)
                        local v116 = CFrame.Angles
                        local v117 = tick()
                        local v118 = v116(0, v117 % 3.141592653589793 * 2.5, 0)

                        v114.CFrame = v115 * v118
                        p18:AdjustLandingMarkerBallTrackingUX(v107)
                    end
                else
                    v79.Local.LandingMarker_BallTrackingUX.CFrame = v79.Local.PrimaryPart.CFrame * CFrame.new(0, -10, 0)
                end
            end

            v79.Local.LandingMarker.SphereMarker.CFrame = v79.Local.LandingMarker.CFrame
        end

        if not p18.Variables.ImprovedAiming or not p18.Variables.ImprovedAiming.Enabled then
            v79.Local.LandingMarker.SphereMarker.Transparency = 1
        end

        if not v77 or not v78.AssetsUsed.ThrowingArc.Value or p18:CheckAutoThrowEnabled() and p18.Variables.InputType == "Mobile" and p18.Variables.TestData ~= nil then
            v79.Local.Center.ThrowingArc.Enabled = false

            return
        end

        if p18.Variables.InputType == "Mobile" and p18.Variables.TestData ~= nil and not (game.Players.LocalPlayer.Replicated.InstallDate.Value <= p18.Variables.TestData.fromInstallDate) then
            v79.Local.Center.ThrowingArc.Enabled = false

            return
        end

        if not p18.Variables.LP.Character or not p18.Variables.LP.Character.PrimaryPart then
            v79.Local.Center.ThrowingArc.Enabled = false

            return
        end

        if p18.Variables.Football and p18.Variables.Football.Parent == p18.Variables.LP.Character then
            if p18.Variables.GlobalVariables:PlayerIsQuarterback(p18.Variables.LP, v78) and p18.BallEquipType == p18.DEF_QUARTERBACK then
                local v119 = p18.Variables.Functions.Utilities:ScreenPointToRay(p18.PlayerMouse.X, p18.PlayerMouse.Y)
                local n1 = v119.Origin + v119.Direction * 1000

                if p18.Variables.ImprovedAiming.Enabled then
                    v79.Local.Center.ThrowingArc.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0),
                        NumberSequenceKeypoint.new(0.4, 0.5),
                        NumberSequenceKeypoint.new(1, 1)
                    })
                else
                    v79.Local.Center.ThrowingArc.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.02, 0.6),
                        NumberSequenceKeypoint.new(0.8, 1),
                        NumberSequenceKeypoint.new(1, 1)
                    })
                end

                if p18.Variables.InputType == "Mobile" then
                    local v121 = p18.Variables.PlayerModule.controls:GetActiveController()
                    local t4 = {}

                    for v123 in p18.Fingers, nil, nil do
                        if v123 ~= v121.moveTouchObject then
                            table.insert(t4, v123)
                        end
                    end

                    local v124 = t4[1]

                    if v124 then
                        p18.LastAimingPosition = v124.Position
                    end

                    if p18.LastAimingPosition then
                        local v125 = p18.Variables.Functions.Utilities:ScreenPointToRay(p18.LastAimingPosition.X, p18.LastAimingPosition.Y)

                        n1 = v125.Origin + v125.Direction * 1000
                    end
                elseif p18.Variables.InputType == "Controller" then
                    local v126 = p18:GetXboxCrosshairPosition()
                    local v127 = p18.Variables.Functions.Utilities:ScreenPointToRay(v126.X, v126.Y)

                    n1 = v127.Origin + v127.Direction * 1000
                end

                local PrimaryPartPosition = p18.Variables.LP.Character.PrimaryPart.Position
                local v129 = (CFrame.lookAt(PrimaryPartPosition, PrimaryPartPosition + n1.unit) * CFrame.new(Vector3.new(1, 1.5, 0))).Position
                local n2 = (n1 - v129).Unit * p18.BallPower * p18.Variables.FootballMath.Settings.MaximumPowerCoefficient
                local v131 = p18.Variables.FootballMath:GetLandingSpot(n1, v129, p18.BallPower * p18.Variables.FootballMath.Settings.MaximumPowerCoefficient, v79.Replicated.Center.CFrame.Y + 0.5)
                local v132 = p18.Variables.FootballMath:GetTimeToDestination(n2, v129, v79.Replicated.Center.CFrame.Y + 0.5)
                local v133 = p18.Variables.FootballMath:GetVelocityForPass(v129, v131.Position, v132)
                local v134, v135, v136, v137 = p18.Variables.FootballMath:BeamDirection(v133, v129, v132)

                v79.Local.Center.ThrowingArc.CurveSize0 = v134
                v79.Local.Center.ThrowingArc.CurveSize1 = v135
                v79.Local.Center.C2.WorldCFrame = v136
                v79.Local.Center.C3.WorldCFrame = v137
                v79.Local.Center.ThrowingArc.Enabled = true

                local v138 = v79.Local.LandingMarker
                local v139 = CFrame.Angles
                local v140 = tick()
                local v141 = v139(0, v140 % 3.141592653589793 * 2.5, 0)

                v138.CFrame = v131 * v141
                v79.Local.LandingMarker.SphereMarker.CFrame = v79.Local.LandingMarker.CFrame

                return
            end

            v79.Local.Center.ThrowingArc.Enabled = false

            return
        end

        v79.Local.Center.ThrowingArc.Enabled = false

        return
    end
end

return t1
