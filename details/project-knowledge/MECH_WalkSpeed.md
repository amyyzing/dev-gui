-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[2]:GetChildren()[1]:GetChildren()[6]:GetChildren()[1]:GetChildren()[11]
-- Took 0.07s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- Decompiled using ByteFall
-- discord.gg/bytefall
return {
    GetWalkspeed = function(p1)
        local n1 = 0

        for _, v in pairs(p1.WalkSpeedFactors) do
            n1 += v
        end

        return (math.max(0, n1))
    end,
    UpdateWalkspeedFactor = function(p2, p3, p4)
        local v8

        if p3 == "Normal" then
            local v9 = p2.Variables.Functions.GameParams:GetGameParam("WalkSpeed") or p2.Variables.GlobalVariables.DefaultWalkSpeed

            v8 = math.clamp(p4, 0, v9)
        elseif p3 == "RouteRelease" then
            v8 = math.clamp(p4, 0, p2.Variables.GlobalVariables.DefaultPadBoost)
        elseif p3 == "Sprint" then
            v8 = math.clamp(p4, 0, p2.Variables.GlobalVariables.DefaultSprintBoost)
        elseif p3 == "Bike" then
            v8 = math.max(0, p4)
        elseif p3 == "GolfCart" then
            v8 = math.max(0, p4)
        elseif p3 == "Hoverboard" then
            v8 = math.max(0, p4)
        elseif p3 == "Server" then
            local v10 = p2.Variables.Functions.GameParams:GetGameParam("WalkSpeed")

            v8 = not game.ReplicatedStorage.Settings.PrivateServer.Value and math.clamp(p4, -1000, v10) or p4

            if v8 < 0 then
                p2.WalkSpeedFactors.Sprint = 0
            end
        else
            if p3 ~= "Trucking" then
                return false
            end

            v8 = math.clamp(p4, -4, 0)
        end

        p2.WalkSpeedFactors[p3] = v8
        p2:WalkSpeed()

        return true
    end,
    WalkSpeed = function(p5)
        p5.Variables.LP.Character.Humanoid.WalkSpeed = p5:GetWalkspeed()
    end,
    GetTargetVehicleSpeed = function(p6, p7)
        if p7 == "Bike" then
            return p6.WalkSpeedFactors.Normal + p6.WalkSpeedFactors.Bike
        end

        if p7 == "GolfCart" then
            return p6.WalkSpeedFactors.Normal + p6.WalkSpeedFactors.GolfCart
        end

        if p7 == "Hoverboard" then
            return p6.WalkSpeedFactors.Normal + p6.WalkSpeedFactors.Hoverboard
        end

        return p6.WalkSpeedFactors.Normal or 0
    end
}
