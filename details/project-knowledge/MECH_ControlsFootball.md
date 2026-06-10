-- Script Path: game:GetService("ReplicatedStorage").Assets.Modules.Client.Mechanics.Modules.General.MECH_ControlsFootball

return {
    SetFootballTimeScale = function(p1, p2) --[[ SetFootballTimeScale | Line: 11 ]]
        print("Setting football time scale to " .. p2)
        p1.Variables.FootballMath.Settings.TimeScale = p2
    end,
    SetFootballGravity = function(p1, p2) --[[ SetFootballGravity | Line: 17 ]]
        if p2 > 0 then
            return false
        end

        p1.Variables.FootballMath.Settings.Gravity = p2
        p1.Variables.FootballMath.Settings.GravityVector = Vector3.new(0, p2 / p1.Variables.FootballMath.Settings.FPS, 0)
        p1.Variables.FootballMath.Settings.GravityVectorConstant = Vector3.new(0, p2, 0)
        print("Setting football gravity to " .. p2)

        return true
    end
}
