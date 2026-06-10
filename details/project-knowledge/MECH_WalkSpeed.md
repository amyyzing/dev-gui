-- Script Path: game:GetService("ReplicatedStorage").Assets.Modules.Client.Mechanics.Modules.General.MECH_WalkSpeed

return {
    GetWalkspeed = function(p1) --[[ GetWalkspeed | Line: 10 ]]
        local sum = 0

        for k, v in pairs(p1.WalkSpeedFactors) do
            sum = sum + v
        end

        return math.max(0, sum)
    end,
    UpdateWalkspeedFactor = function(p1, p2, p3) --[[ UpdateWalkspeedFactor | Line: 18 ]]
        local v1

        if p2 == "Normal" then
            v1 = math.clamp(p3, 0, p1.Variables.Functions.GameParams:GetGameParam("WalkSpeed") or p1.Variables.GlobalVariables.DefaultWalkSpeed)
        elseif p2 == "RouteRelease" then
            v1 = math.clamp(p3, 0, p1.Variables.GlobalVariables.DefaultPadBoost)
        elseif p2 == "Sprint" then
            v1 = math.clamp(p3, 0, p1.Variables.GlobalVariables.DefaultSprintBoost)
        elseif p2 == "Bike" or (p2 == "GolfCart" or p2 == "Hoverboard") then
            v1 = math.max(0, p3)
        elseif p2 == "Server" then
            local v10 = not game.ReplicatedStorage.Settings.PrivateServer.Value and math.clamp(p3, -1000, (p1.Variables.Functions.GameParams:GetGameParam("WalkSpeed"))) or p3

            if v10 < 0 then
                p1.WalkSpeedFactors.Sprint = 0
            end

            v1 = v10
        else
            if p2 ~= "Trucking" then
                return false
            end

            v1 = math.clamp(p3, -4, 0)
        end

        p1.WalkSpeedFactors[p2] = v1
        p1:WalkSpeed()

        return true
    end,
    WalkSpeed = function(p1) --[[ WalkSpeed | Line: 48 ]]
        p1.Variables.LP.Character.Humanoid.WalkSpeed = p1:GetWalkspeed()
    end,
    GetTargetVehicleSpeed = function(p1, p2) --[[ GetTargetVehicleSpeed | Line: 53 ]]
        if p2 == "Bike" then
            return p1.WalkSpeedFactors.Normal + p1.WalkSpeedFactors.Bike
        end

        if p2 == "GolfCart" then
            return p1.WalkSpeedFactors.Normal + p1.WalkSpeedFactors.GolfCart
        end

        if p2 == "Hoverboard" then
            return p1.WalkSpeedFactors.Normal + p1.WalkSpeedFactors.Hoverboard
        end

        return p1.WalkSpeedFactors.Normal or 0
    end
}
