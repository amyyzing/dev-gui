-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[1]:GetChildren()[5]:GetChildren()[1]
-- Took 0.13s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- Decompiled using ByteFall
-- discord.gg/bytefall
local t1 = {
    Settings = {}
}

t1.Settings.FPS = 60
t1.Settings.TimeScale = 1
t1.Settings.Gravity = -28
t1.Settings.GravityVector = Vector3.new(0, t1.Settings.Gravity / t1.Settings.FPS, 0)
t1.Settings.GravityVectorConstant = Vector3.new(0, t1.Settings.Gravity, 0)
t1.Settings.MaxPower = 100
t1.Settings.MinPower = 30
t1.Settings.MaximumInaccurateYards = 6
t1.Settings.MinimumInaccurateYards = 3
t1.Settings.MaximumPowerCoefficient = 0.95
t1.Settings.MinHeightToArcRatio = 0.01
t1.Settings.MaxTimeInAir = 6

function t1.BeamDirection(_, p2, p3, p4)
    local n1 = p4 * t1.Settings.TimeScale
    local n2 = t1.Settings.GravityVector * t1.Settings.FPS
    local n3 = 0.5 * n2 * n1 * n1 + p2 * n1 + p3
    local n4 = n3 - (n2 * n1 * n1 + p2 * n1) / 3
    local n5 = (0.125 * n2 * n1 * n1 + 0.5 * p2 * n1 + p3 - 0.125 * (p3 + n3)) / 0.375 - n4
    local v11 = (n5 - p3).magnitude
    local v12 = (n4 - n3).magnitude
    local v13 = (p3 - n3).unit
    local v14 = (n5 - p3).unit
    local v15 = v14:Cross(v13).unit
    local v16 = (n4 - n3).unit
    local v17 = v16:Cross(v13).unit
    local v18 = v15:Cross(v14).unit
    local cFrame = CFrame.new(p3.x, p3.y, p3.z, v14.x, v15.x, v18.x, v14.y, v15.y, v18.y, v14.z, v15.z, v18.z)
    local cFrame2 = CFrame.new(n3.x, n3.y, n3.z, v16.x, v17.x, v18.x, v16.y, v17.y, v18.y, v16.z, v17.z, v18.z)

    return v11, -v12, cFrame, cFrame2
end
function t1.CheckTackleContact(_, p6, p7)
    local v24 = OverlapParams.new()

    v24.CollisionGroup = "TackleBoxes_" .. p6.Name

    local v25 = game.Workspace:GetPartsInPart(p7, v24)

    if v25[1] and v25[1].CollisionGroup ~= "CBAdminPlayerCollisionGroup" then
        return true, v25[1]
    end

    return false
end
function t1.GetBounceDirection(_, p9, p10, p11)
    local v30 = RaycastParams.new()

    v30.FilterType = Enum.RaycastFilterType.Include
    v30.FilterDescendantsInstances = p10

    local v31 = p9.LinearVelocity.VectorVelocity
    local v32 = v31 ~= Vector3.new() and v31.unit or Vector3.new()
    local v33 = game.Workspace:Blockcast(p9.CFrame - v32 * 10, p9.Size, v32 * 10 * 2, v30)

    if v33 ~= nil and v33.Instance then
        local u34 = true

        if v33.Instance.Transparency >= 1 then
            u34 = true

            if v33.Instance.Name:lower() ~= "catchbox" then
                u34 = v33.Instance.Name:lower() == "touchdetect"
            end
        end

        if not u34 then
            return nil, false
        end

        local v35 = v32:Dot(v33.Normal)
        local n1 = (v32 - 2 * v35 * v33.Normal) * p9.LinearVelocity.VectorVelocity.magnitude

        if p11 then
            print("BOUNCE")
        end

        return n1
    end

    if p11 then
        print("DIDN'T HIT ANYTHING")
    end

    return nil, false
end
function t1.Quadratic(_, p13, p14, p15)
    local v41 = math.pow(p14, 2)
    local v42 = math.sqrt(v41 - 4 * p13 * p15)
    local v43 = math.pow(p14, 2)
    local v44 = math.sqrt(v43 - 4 * p13 * p15)

    return (math.max((-p14 + v42) / (2 * p13), (-p14 - v44) / (2 * p13)))
end
function t1.GetVelocityForPass(_, p17, p18, p19)
    local n1 = p19 * t1.Settings.TimeScale

    return (p18 - t1.Settings.GravityVectorConstant * n1 ^ 2 / 2 - p17) / n1
end
function t1.GetPositionFromTime(_, p21, p22, p23)
    local n1 = p21 * t1.Settings.TimeScale

    return CFrame.new(t1.Settings.GravityVectorConstant * n1 ^ 2 / 2 + p22 * n1 + p23)
end
function t1.GetSpotAtTime(_, p25, p26, p27, p28)
    local n1 = p25 * t1.Settings.TimeScale

    return CFrame.new(t1.Settings.GravityVectorConstant * n1 ^ 2 / 2 + (p26 - p27).unit * p28 * n1 + p27)
end
function t1.GetTimeToDestination(_, p30, p31, p32)
    return t1:Quadratic(t1.Settings.Gravity / 2, p30.Y, p31.Y - p32) / t1.Settings.TimeScale
end
function t1.FindStartingVelocity(_, p34, p35, p36, p37, p38, p39)
    local n1 = 1
    local n2 = 1

    if p38 then
        local v74 = math.floor((p35 - p34).Magnitude / 3 / 25 + 0.5)

        n2 = math.max(0, v74)
        n1 = 0
    end

    local vector3 = Vector3.new(p36.X, 0, p36.Z)
    local v76 = math.random(n1, n2)
    local v77 = t1.Settings.MinHeightToArcRatio
    local t2 = {}
    local n3 = 0

    local function v80(p40)
        local vector32 = Vector3.new(0, t1.Settings.Gravity, 0)
        local v163 = vector3 ~= Vector3.new() and vector3.unit or Vector3.new()

        return (p35 + v163 * v76 + vector3 * p40 - vector32 * p40 ^ 2 / 2 - p34) / p40, v76
    end

    if p37 < 50 then
        v77 = 3.5
    elseif p37 < 60 then
        v77 = 2.5
    elseif p37 < 70 then
        v77 = 1.25
    end

    local n4 = p37 * t1.Settings.MaximumPowerCoefficient

    for _ = 1, t1.Settings.MaxTimeInAir / 0.01 do
        local n5 = v77
        local vector33 = Vector3.new(0, t1.Settings.Gravity, 0)
        local v85 = vector3 ~= Vector3.new() and vector3.unit or Vector3.new()
        local n6 = (p35 + v85 * v76 + vector3 * n5 - vector33 * n5 ^ 2 / 2 - p34) / n5

        n3 = v76

        local v87 = n6.magnitude

        v77 += 0.01

        if math.floor(v87) <= t1.Settings.MaxPower * t1.Settings.MaximumPowerCoefficient then
            table.insert(t2, {
                SortPower = v87,
                Power = v87,
                InitialVelocity = n6,
                ExpectedTime = v77
            })
        end
    end

    table.sort(t2, function(p41, p42)
        if n4 - p41.SortPower == n4 - p42.SortPower then
            return p41.ExpectedTime < p42.ExpectedTime
        end

        local v166 = math.abs(n4 - p41.SortPower)
        local v167 = math.abs(n4 - p42.SortPower)

        return v166 < v167
    end)

    local v88 = t2[1].InitialVelocity
    local v89 = t1:GetTimeToDestination(v88, p34, p35.Y)

    if p39 then
        print("Samples:", #t2)
        print("Aim:", v88)
        print("Power:", v88.magnitude)
        print("Display Power:", v88.magnitude * (1 / t1.Settings.MaximumPowerCoefficient))
        print("Accuracy Offset:", n3)
        print("Calculated Time:", v89)
        print()
    end

    return {
        Time = v89,
        Aim = v88,
        Power = v88.magnitude,
        DisplayPower = v88.magnitude * (1 / t1.Settings.MaximumPowerCoefficient),
        SpawnPos = p34,
        Target = p34 + v88.unit,
        Accuracy = n3
    }
end
function t1.GetLandingSpot(p43, p44, p45, p46, p47)
    local v95 = t1:GetTimeToDestination((p44 - p45).unit * p46, p45, p47)

    return p43:GetSpotAtTime(v95, p44, p45, p46)
end
function t1.ToField(_, p49, p50)
    return p49.GameInstance.Value.Replicated.Center.CFrame:toObjectSpace(CFrame.new(p50))
end
function t1.ScrimmageVector(p51, p52)
    return p51:ToField(p52, p52.GameInstance.Value.Replicated.ScrimmageLine.Scrimmage.Position)
end
function t1.FirstDownVector(p53, p54)
    return p53:ToField(p54, p54.GameInstance.Value.Replicated.FirstDownLine.FirstDown.Position)
end
function t1.CenterVector(p55, p56)
    return p55:ToField(p56, p56.GameInstance.Value.Replicated.Center.Position)
end
function t1.CalculateAngle(_, p58, p59, p60)
    local n1 = p58 - p60
    local n2 = p59 - p60

    return (math.atan2(n1.x * n2.z - n1.z * n2.x, n1.x * n2.x + n1.z * n2.z))
end
function t1.OutOfBounds(_, p62, p63, p64, p65)
    local v116 = p62.FieldSettings.FieldDimensions
    local v117 = p63

    if v117 then
        v117 = true

        if p64.Z < v116.LeftOOB.Value + (p65 or 0) then
            v117 = true

            if p64.Z > v116.RightOOB.Value - (p65 or 0) then
                v117 = true

                if p64.X < v116.SouthTDOOB.Value + (p65 or 0) then
                    v117 = p64.X <= v116.NorthTDOOB.Value - (p65 or 0)
                end
            end
        end
    end

    return v117
end
function t1.HasBecomeRunner(p66, p67, p68, p69)
    local v122
    local v123
    local v124
    local v125
    local v126

    v122 = p67

    if v122 then
        v123 = p69.X
        v124 = p66:ScrimmageVector(p68)

        if v123 <= v124.X then
            v122 = true

            if p68.GameStatus.NorthScorer.Value == p68.GameStatus.Offense.Value then
            else
                v122 = false
                v125 = p69.X
                v126 = p66:ScrimmageVector(p68)

                if v125 >= v126.X then
                    v122 = p68.GameStatus.SouthScorer.Value == p68.GameStatus.Offense.Value
                end
            end
        else
            v122 = false
            v125 = p69.X
            v126 = p66:ScrimmageVector(p68)

            if v125 >= v126.X then
                v122 = p68.GameStatus.SouthScorer.Value == p68.GameStatus.Offense.Value
            end
        end

        return v122
    else
        return v122
    end
end
function t1.Touchdown(_, p71, p72, p73)
    local v131 = p71

    if v131 then
        if p73.X <= p72.FieldSettings.FieldDimensions.SouthTDOOB.Value and p73.X > p72.FieldSettings.FieldDimensions.SouthTD.Value then
            v131 = true

            if p72.GameStatus.SouthScorer.Value ~= p72.GameStatus.Offense.Value then
                v131 = false

                if p73.X >= p72.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                    v131 = false

                    if p73.X < p72.FieldSettings.FieldDimensions.NorthTD.Value then
                        v131 = p72.GameStatus.NorthScorer.Value == p72.GameStatus.Offense.Value
                    end
                end
            end
        else
            v131 = false

            if p73.X >= p72.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                v131 = false

                if p73.X < p72.FieldSettings.FieldDimensions.NorthTD.Value then
                    v131 = p72.GameStatus.NorthScorer.Value == p72.GameStatus.Offense.Value
                end
            end
        end
    end

    return v131
end
function t1.LeftEndzone(_, p75, p76, p77)
    local v136 = p75

    if v136 then
        v136 = false

        if p77.X > p76.FieldSettings.FieldDimensions.NorthTD.Value then
            v136 = p77.X < p76.FieldSettings.FieldDimensions.SouthTD.Value
        end
    end

    return v136
end
function t1.Rushing(p78, p79, p80)
    local v140
    local v141
    local u142
    local v143
    local v144

    v140 = p79.X
    v141 = p78:ScrimmageVector(p80)

    if v140 >= v141.X + 25 then
        u142 = true

        if p80.GameStatus.NorthScorer.Value == p80.GameStatus.Offense.Value then
        else
            u142 = false
            v143 = p79.X
            v144 = p78:ScrimmageVector(p80)

            if v143 <= v144.X - 25 then
                u142 = p80.GameStatus.SouthScorer.Value == p80.GameStatus.Offense.Value
            end
        end
    else
        u142 = false
        v143 = p79.X
        v144 = p78:ScrimmageVector(p80)

        if v143 <= v144.X - 25 then
            u142 = p80.GameStatus.SouthScorer.Value == p80.GameStatus.Offense.Value
        end
    end

    return u142
end
function t1.Safety(_, p82, p83, p84)
    local v149 = p82

    if v149 then
        if not p83.GameStatus.LeftEndzone.Value then
            v149 = p83.GameStatus.IsLateralPlay.Value

            if v149 then
                if p84.X >= p83.FieldSettings.FieldDimensions.SouthTD.Value then
                    v149 = true

                    if p83.GameStatus.NorthScorer.Value ~= p83.GameStatus.Offense.Value then
                        if p84.X <= p83.FieldSettings.FieldDimensions.NorthTD.Value then
                            v149 = true

                            if p83.GameStatus.SouthScorer.Value ~= p83.GameStatus.Offense.Value then
                                if p84.X >= p83.FieldSettings.FieldDimensions.SouthTDOOB.Value then
                                    v149 = true

                                    if p83.GameStatus.NorthScorer.Value ~= p83.GameStatus.Offense.Value then
                                        v149 = false

                                        if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                                            v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                                        end
                                    end
                                else
                                    v149 = false

                                    if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                                        v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                                    end
                                end
                            end
                        elseif p84.X >= p83.FieldSettings.FieldDimensions.SouthTDOOB.Value then
                            v149 = true

                            if p83.GameStatus.NorthScorer.Value ~= p83.GameStatus.Offense.Value then
                                v149 = false

                                if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                                    v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                                end
                            end
                        else
                            v149 = false

                            if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                                v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                            end
                        end
                    end
                elseif p84.X <= p83.FieldSettings.FieldDimensions.NorthTD.Value then
                    v149 = true

                    if p83.GameStatus.SouthScorer.Value ~= p83.GameStatus.Offense.Value then
                        if p84.X >= p83.FieldSettings.FieldDimensions.SouthTDOOB.Value then
                            v149 = true

                            if p83.GameStatus.NorthScorer.Value ~= p83.GameStatus.Offense.Value then
                                v149 = false

                                if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                                    v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                                end
                            end
                        else
                            v149 = false

                            if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                                v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                            end
                        end
                    end
                elseif p84.X >= p83.FieldSettings.FieldDimensions.SouthTDOOB.Value then
                    v149 = true

                    if p83.GameStatus.NorthScorer.Value ~= p83.GameStatus.Offense.Value then
                        v149 = false

                        if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                            v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                        end
                    end
                else
                    v149 = false

                    if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                        v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                    end
                end
            end
        elseif p84.X >= p83.FieldSettings.FieldDimensions.SouthTD.Value then
            v149 = true

            if p83.GameStatus.NorthScorer.Value ~= p83.GameStatus.Offense.Value then
                if p84.X <= p83.FieldSettings.FieldDimensions.NorthTD.Value then
                    v149 = true

                    if p83.GameStatus.SouthScorer.Value ~= p83.GameStatus.Offense.Value then
                        if p84.X >= p83.FieldSettings.FieldDimensions.SouthTDOOB.Value then
                            v149 = true

                            if p83.GameStatus.NorthScorer.Value ~= p83.GameStatus.Offense.Value then
                                v149 = false

                                if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                                    v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                                end
                            end
                        else
                            v149 = false

                            if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                                v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                            end
                        end
                    end
                elseif p84.X >= p83.FieldSettings.FieldDimensions.SouthTDOOB.Value then
                    v149 = true

                    if p83.GameStatus.NorthScorer.Value ~= p83.GameStatus.Offense.Value then
                        v149 = false

                        if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                            v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                        end
                    end
                else
                    v149 = false

                    if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                        v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                    end
                end
            end
        elseif p84.X <= p83.FieldSettings.FieldDimensions.NorthTD.Value then
            v149 = true

            if p83.GameStatus.SouthScorer.Value ~= p83.GameStatus.Offense.Value then
                if p84.X >= p83.FieldSettings.FieldDimensions.SouthTDOOB.Value then
                    v149 = true

                    if p83.GameStatus.NorthScorer.Value ~= p83.GameStatus.Offense.Value then
                        v149 = false

                        if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                            v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                        end
                    end
                else
                    v149 = false

                    if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                        v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                    end
                end
            end
        elseif p84.X >= p83.FieldSettings.FieldDimensions.SouthTDOOB.Value then
            v149 = true

            if p83.GameStatus.NorthScorer.Value ~= p83.GameStatus.Offense.Value then
                v149 = false

                if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                    v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
                end
            end
        else
            v149 = false

            if p84.X <= p83.FieldSettings.FieldDimensions.NorthTDOOB.Value then
                v149 = p83.GameStatus.SouthScorer.Value == p83.GameStatus.Offense.Value
            end
        end
    end

    return v149
end
function t1.EligibleToBlock(p85, p86, p87, p88)
    local YardsToStudsValue = p87.FieldSettings.FieldDimensions.YardsToStuds.Value
    local t3 = { Kickoff = true, Onside = true, SafetyPunt = true }
    local t4 = { Punt = true, FieldGoal = true }

    if p87.GameStatus.Hiked.Value and not p86 then
        if p87.GameStatus.FieldGoalType.Value ~= "Fake" and t4[p87.ActiveState.Value] or t3[p87.ActiveState.Value] then
            return true
        end

        if p87.ActiveState.Value == "TURK_Active" then
            return true
        end

        local u157 = true

        if p87.ActiveState.Value ~= "NormalPlay" then
            u157 = true

            if p87.ActiveState.Value ~= "TwoPoint" then
                u157 = true

                if p87.ActiveState.Value ~= "FieldGoal" then
                    u157 = true

                    if p87.ActiveState.Value ~= "Punt" then
                        u157 = true

                        if p87.ActiveState.Value ~= "PICK_Active" then
                            u157 = true

                            if p87.ActiveState.Value ~= "FLAG_Active" then
                                u157 = true

                                if p87.ActiveState.Value ~= "PKMA_Active" then
                                    u157 = p87.ActiveState.Value == "FLAG_PointAfter"
                                end
                            end
                        end
                    end
                end
            end
        end

        if not u157 or p87.GameStatus.BallInAir.Value then
            return false
        end

        if not p87.GameStatus.ThrowEligible.Value then
            return true
        end

        if p87.GameStatus.Offense.Value == p87.GameStatus.NorthScorer.Value then
            local v158 = p85:ScrimmageVector(p87)
            local v159 = math.min(v158.X / YardsToStudsValue + 50, 5)

            if p85:ScrimmageVector(p87).X - YardsToStudsValue * v159 < p88.X then
                return true
            end
        elseif p87.GameStatus.Offense.Value == p87.GameStatus.SouthScorer.Value then
            local v160 = p85:ScrimmageVector(p87)

            math.min(50 - v160.X / YardsToStudsValue, 5)

            if p85:ScrimmageVector(p87).X + YardsToStudsValue * 5 > p88.X then
                return true
            end
        end

        return false
    end

    return false
end

return t1
