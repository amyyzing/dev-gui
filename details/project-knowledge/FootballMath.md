-- Script Path: game:GetService("ReplicatedStorage").Assets.Modules.Shared.Services.FootballMath

local t = {
    Settings = {}
}

t.Settings.FPS = 60
t.Settings.TimeScale = 1
t.Settings.Gravity = -28
t.Settings.GravityVector = Vector3.new(0, t.Settings.Gravity / t.Settings.FPS, 0)
t.Settings.GravityVectorConstant = Vector3.new(0, t.Settings.Gravity, 0)
t.Settings.MaxPower = 100
t.Settings.MinPower = 30
t.Settings.MaximumInaccurateYards = 6
t.Settings.MinimumInaccurateYards = 3
t.Settings.MaximumPowerCoefficient = 0.95
t.Settings.MinHeightToArcRatio = 0.01
t.Settings.MaxTimeInAir = 6
function t.BeamDirection(p1, p2, p3, p4) --[[ BeamDirection | Line: 36 | Upvalues: t (copy) ]]
    local v1 = p4 * t.Settings.TimeScale
    local v2 = t.Settings.GravityVector * t.Settings.FPS
    local v3 = 0.5 * v2 * v1 * v1 + p2 * v1 + p3
    local v4 = v3 - (v2 * v1 * v1 + p2 * v1) / 3
    local v5 = (0.125 * v2 * v1 * v1 + 0.5 * p2 * v1 + p3 - 0.125 * (p3 + v3)) / 0.375 - v4
    local unit = (p3 - v3).unit
    local unit2 = (v5 - p3).unit
    local unit3 = unit2:Cross(unit).unit
    local unit4 = (v4 - v3).unit
    local unit5 = unit4:Cross(unit).unit
    local unit6 = unit3:Cross(unit2).unit

    return (v5 - p3).magnitude, -(v4 - v3).magnitude, CFrame.new(p3.x, p3.y, p3.z, unit2.x, unit3.x, unit6.x, unit2.y, unit3.y, unit6.y, unit2.z, unit3.z, unit6.z), CFrame.new(v3.x, v3.y, v3.z, unit4.x, unit5.x, unit6.x, unit4.y, unit5.y, unit6.y, unit4.z, unit5.z, unit6.z)
end
function t.CheckTackleContact(p1, p2, p3) --[[ CheckTackleContact | Line: 75 ]]
    local v1 = OverlapParams.new()

    v1.CollisionGroup = "TackleBoxes_" .. p2.Name

    local v2 = game.Workspace:GetPartsInPart(p3, v1)

    if v2[1] and v2[1].CollisionGroup ~= "CBAdminPlayerCollisionGroup" then
        return true, v2[1]
    end

    return false
end
function t.GetBounceDirection(p1, p2, p3, p4) --[[ GetBounceDirection | Line: 97 ]]
    local v1 = RaycastParams.new()

    v1.FilterType = Enum.RaycastFilterType.Include
    v1.FilterDescendantsInstances = p3

    local VectorVelocity = p2.LinearVelocity.VectorVelocity
    local v2 = VectorVelocity ~= Vector3.new() and VectorVelocity.unit or Vector3.new()
    local v3 = game.Workspace:Blockcast(p2.CFrame - v2 * 10, p2.Size, v2 * 10 * 2, v1)

    if v3 == nil or not v3.Instance then
        if not p4 then
            return nil, false
        end

        print("DIDN\'T HIT ANYTHING")

        return nil, false
    end

    if not (if v3.Instance.Transparency < 1 or v3.Instance.Name:lower() == "catchbox" then true elseif v3.Instance.Name:lower() == "touchdetect" then true else false) then
        return nil, false
    end

    local v5 = (v2 - 2 * v2:Dot(v3.Normal) * v3.Normal) * p2.LinearVelocity.VectorVelocity.magnitude

    if not p4 then
        return v5
    end

    print("BOUNCE")

    return v5
end
function t.Quadratic(p1, p2, p3, p4) --[[ Quadratic | Line: 124 ]]
    return math.max((-p3 + math.sqrt(math.pow(p3, 2) - 4 * p2 * p4)) / (2 * p2), (-p3 - math.sqrt(math.pow(p3, 2) - 4 * p2 * p4)) / (2 * p2))
end
function t.GetVelocityForPass(p1, p2, p3, p4) --[[ GetVelocityForPass | Line: 135 | Upvalues: t (copy) ]]
    local v1 = p4 * t.Settings.TimeScale

    return (p3 - t.Settings.GravityVectorConstant * v1 ^ 2 / 2 - p2) / v1
end
function t.GetPositionFromTime(p1, p2, p3, p4) --[[ GetPositionFromTime | Line: 141 | Upvalues: t (copy) ]]
    local v1 = p2 * t.Settings.TimeScale

    return CFrame.new(t.Settings.GravityVectorConstant * v1 ^ 2 / 2 + p3 * v1 + p4)
end
function t.GetSpotAtTime(p1, p2, p3, p4, p5) --[[ GetSpotAtTime | Line: 147 | Upvalues: t (copy) ]]
    local v1 = p2 * t.Settings.TimeScale

    return CFrame.new(t.Settings.GravityVectorConstant * v1 ^ 2 / 2 + (p3 - p4).unit * p5 * v1 + p4)
end
function t.GetTimeToDestination(p1, p2, p3, p4) --[[ GetTimeToDestination | Line: 154 | Upvalues: t (copy) ]]
    return t:Quadratic(t.Settings.Gravity / 2, p2.Y, p3.Y - p4) / t.Settings.TimeScale
end
function t.FindStartingVelocity(p1, p2, p3, p4, p5, p6, p7) --[[ FindStartingVelocity | Line: 160 | Upvalues: t (copy) ]]
    local v1, v2

    if p6 then
        v1, v2 = 0, math.max(0, (math.floor((p3 - p2).Magnitude / 3 / 25 + 0.5)))
    else
        v1 = 1
        v2 = 1
    end

    local v6 = Vector3.new(p4.X, 0, p4.Z)
    local v7 = math.random(v1, v2)
    local MinHeightToArcRatio = t.Settings.MinHeightToArcRatio
    local t2 = {}
    local accuracyoffset = 0

    if p5 < 50 then
        MinHeightToArcRatio = 3.5
    elseif p5 < 60 then
        MinHeightToArcRatio = 2.5
    elseif p5 < 70 then
        MinHeightToArcRatio = 1.25
    end

    local v8 = p5 * t.Settings.MaximumPowerCoefficient

    for i = 1, t.Settings.MaxTimeInAir / 0.01 do
        local v9
        local v10 = Vector3.new(0, t.Settings.Gravity, 0)

        v9 = if v6 == Vector3.new() then Vector3.new() else v6.unit or Vector3.new()

        local v11 = MinHeightToArcRatio
        local v12 = (p3 + v9 * v7 + v6 * v11 - v10 * v11 ^ 2 / 2 - p2) / v11
        local magnitude = v12.magnitude

        MinHeightToArcRatio = MinHeightToArcRatio + 0.01

        if math.floor(magnitude) <= t.Settings.MaxPower * t.Settings.MaximumPowerCoefficient then
            table.insert(t2, {
                SortPower = magnitude,
                Power = magnitude,
                InitialVelocity = v12,
                ExpectedTime = MinHeightToArcRatio
            })
            accuracyoffset = v7

            continue
        end

        accuracyoffset = v7
    end

    table.sort(t2, function(p1, p2) --[[ Line: 208 | Upvalues: v8 (ref) ]]
        if v8 - p1.SortPower == v8 - p2.SortPower then
            return p1.ExpectedTime < p2.ExpectedTime
        end

        local v3 = math.abs(v8 - p1.SortPower)

        return v3 < math.abs(v8 - p2.SortPower)
    end)

    local InitialVelocity = t2[1].InitialVelocity
    local ExpectedTime = t2[1].ExpectedTime
    local Power = t2[1].Power
    local calculatedtime = t:GetTimeToDestination(InitialVelocity, p2, p3.Y)

    if p7 then
        print("Samples:", #t2)
        print("Aim:", InitialVelocity)
        print("Power:", InitialVelocity.magnitude)
        print("Display Power:", InitialVelocity.magnitude * (1 / t.Settings.MaximumPowerCoefficient))
        print("Accuracy Offset:", accuracyoffset)
        print("Calculated Time:", calculatedtime)
        print()
    end

    return {
        Time = calculatedtime,
        Aim = InitialVelocity,
        Power = InitialVelocity.magnitude,
        DisplayPower = InitialVelocity.magnitude * (1 / t.Settings.MaximumPowerCoefficient),
        SpawnPos = p2,
        Target = p2 + InitialVelocity.unit,
        Accuracy = accuracyoffset
    }
end
function t.GetLandingSpot(p1, p2, p3, p4, p5) --[[ GetLandingSpot | Line: 243 | Upvalues: t (copy) ]]
    return p1:GetSpotAtTime(t:GetTimeToDestination((p2 - p3).unit * p4, p3, p5), p2, p3, p4)
end
function t.ToField(p1, p2, p3) --[[ ToField | Line: 254 ]]
    return p2.GameInstance.Value.Replicated.Center.CFrame:toObjectSpace(CFrame.new(p3))
end
function t.ScrimmageVector(p1, p2) --[[ ScrimmageVector | Line: 260 ]]
    return p1:ToField(p2, p2.GameInstance.Value.Replicated.ScrimmageLine.Scrimmage.Position)
end
function t.FirstDownVector(p1, p2) --[[ FirstDownVector | Line: 265 ]]
    return p1:ToField(p2, p2.GameInstance.Value.Replicated.FirstDownLine.FirstDown.Position)
end
function t.CenterVector(p1, p2) --[[ CenterVector | Line: 270 ]]
    return p1:ToField(p2, p2.GameInstance.Value.Replicated.Center.Position)
end
function t.CalculateAngle(p1, p2, p3, p4) --[[ CalculateAngle | Line: 275 ]]
    local v1 = p2 - p4
    local v2 = p3 - p4

    return math.atan2(v1.x * v2.z - v1.z * v2.x, v1.x * v2.x + v1.z * v2.z)
end
function t.OutOfBounds(p1, p2, p3, p4, p5) --[[ OutOfBounds | Line: 284 ]]
    local FieldDimensions = p2.FieldSettings.FieldDimensions

    return if p3 then if p4.Z >= FieldDimensions.LeftOOB.Value + (p5 or 0) or (p4.Z <= FieldDimensions.RightOOB.Value - (p5 or 0) or p4.X >= FieldDimensions.SouthTDOOB.Value + (p5 or 0)) then true else p4.X <= FieldDimensions.NorthTDOOB.Value - (p5 or 0) else p3
end
function t.HasBecomeRunner(p1, p2, p3, p4) --[[ HasBecomeRunner | Line: 294 ]]
    return p2 and (if p4.X <= p1:ScrimmageVector(p3).X and p3.GameStatus.NorthScorer.Value == p3.GameStatus.Offense.Value then true elseif p4.X >= p1:ScrimmageVector(p3).X then p3.GameStatus.SouthScorer.Value == p3.GameStatus.Offense.Value else false)
end
function t.Touchdown(p1, p2, p3, p4) --[[ Touchdown | Line: 304 ]]
    return p2 and (if p4.X <= p3.FieldSettings.FieldDimensions.SouthTDOOB.Value and (p4.X > p3.FieldSettings.FieldDimensions.SouthTD.Value and p3.GameStatus.SouthScorer.Value == p3.GameStatus.Offense.Value) then true elseif p4.X >= p3.FieldSettings.FieldDimensions.NorthTDOOB.Value and p4.X < p3.FieldSettings.FieldDimensions.NorthTD.Value then p3.GameStatus.NorthScorer.Value == p3.GameStatus.Offense.Value else false)
end
function t.LeftEndzone(p1, p2, p3, p4) --[[ LeftEndzone | Line: 315 ]]
    return if p2 then if p4.X > p3.FieldSettings.FieldDimensions.NorthTD.Value then p4.X < p3.FieldSettings.FieldDimensions.SouthTD.Value else false else p2
end
function t.Rushing(p1, p2, p3) --[[ Rushing | Line: 322 ]]
    return if p2.X >= p1:ScrimmageVector(p3).X + 25 and p3.GameStatus.NorthScorer.Value == p3.GameStatus.Offense.Value then true elseif p2.X <= p1:ScrimmageVector(p3).X - 25 then p3.GameStatus.SouthScorer.Value == p3.GameStatus.Offense.Value else false
end
function t.Safety(p1, p2, p3, p4) --[[ Safety | Line: 332 ]]
    local v1

    if p2 then
        if p3.GameStatus.LeftEndzone.Value then
            v1 = if p4.X >= p3.FieldSettings.FieldDimensions.SouthTD.Value and p3.GameStatus.NorthScorer.Value == p3.GameStatus.Offense.Value or (p4.X <= p3.FieldSettings.FieldDimensions.NorthTD.Value and p3.GameStatus.SouthScorer.Value == p3.GameStatus.Offense.Value or p4.X >= p3.FieldSettings.FieldDimensions.SouthTDOOB.Value and p3.GameStatus.NorthScorer.Value == p3.GameStatus.Offense.Value) then true elseif p4.X <= p3.FieldSettings.FieldDimensions.NorthTDOOB.Value then p3.GameStatus.SouthScorer.Value == p3.GameStatus.Offense.Value else false
        else
            v1 = p3.GameStatus.IsLateralPlay.Value

            if v1 then
                v1 = if p4.X >= p3.FieldSettings.FieldDimensions.SouthTD.Value and p3.GameStatus.NorthScorer.Value == p3.GameStatus.Offense.Value or (p4.X <= p3.FieldSettings.FieldDimensions.NorthTD.Value and p3.GameStatus.SouthScorer.Value == p3.GameStatus.Offense.Value or p4.X >= p3.FieldSettings.FieldDimensions.SouthTDOOB.Value and p3.GameStatus.NorthScorer.Value == p3.GameStatus.Offense.Value) then true elseif p4.X <= p3.FieldSettings.FieldDimensions.NorthTDOOB.Value then p3.GameStatus.SouthScorer.Value == p3.GameStatus.Offense.Value else false
            end
        end
    else
        v1 = p2
    end

    return v1
end
function t.EligibleToBlock(p1, p2, p3, p4) --[[ EligibleToBlock | Line: 341 ]]
    local YardsToStuds = p3.FieldSettings.FieldDimensions.YardsToStuds.Value

    if not p3.GameStatus.Hiked.Value or p2 then
        return false
    end

    if p3.GameStatus.FieldGoalType.Value ~= "Fake" and ({
        Punt = true,
        FieldGoal = true
    })[p3.ActiveState.Value] then
        return true
    end

    if ({
        Kickoff = true,
        Onside = true,
        SafetyPunt = true
    })[p3.ActiveState.Value] then
        return true
    end

    if p3.ActiveState.Value == "TURK_Active" then
        return true
    end

    if not (if p3.ActiveState.Value == "NormalPlay" or (p3.ActiveState.Value == "TwoPoint" or (p3.ActiveState.Value == "FieldGoal" or (p3.ActiveState.Value == "Punt" or (p3.ActiveState.Value == "PICK_Active" or (p3.ActiveState.Value == "FLAG_Active" or p3.ActiveState.Value == "PKMA_Active"))))) then true elseif p3.ActiveState.Value == "FLAG_PointAfter" then true else false) or p3.GameStatus.BallInAir.Value then
        return false
    end

    if not p3.GameStatus.ThrowEligible.Value then
        return true
    end

    if p3.GameStatus.Offense.Value == p3.GameStatus.NorthScorer.Value then
        local v3 = math.min(p1:ScrimmageVector(p3).X / YardsToStuds + 50, 5)

        if p1:ScrimmageVector(p3).X - YardsToStuds * v3 < p4.X then
            return true
        end
    else
        if p3.GameStatus.Offense.Value ~= p3.GameStatus.SouthScorer.Value then
            return false
        end

        math.min(50 - p1:ScrimmageVector(p3).X / YardsToStuds, 5)

        if p1:ScrimmageVector(p3).X + YardsToStuds * 5 > p4.X then
            return true
        end
    end

    return false
end

return t
