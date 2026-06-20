-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[2]:GetChildren()[1]:GetChildren()[6]:GetChildren()[1]:GetChildren()[10]
-- Took 0.08s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- Decompiled using ByteFall
-- discord.gg/bytefall
return {
    SetFootballTimeScale = function(p1, p2)
        print("Setting football time scale to " .. p2)
        p1.Variables.FootballMath.Settings.TimeScale = p2
    end,
    SetFootballGravity = function(p3, p4)
        if p4 > 0 then
            return false
        end

        p3.Variables.FootballMath.Settings.Gravity = p4
        p3.Variables.FootballMath.Settings.GravityVector = Vector3.new(0, p4 / p3.Variables.FootballMath.Settings.FPS, 0)
        p3.Variables.FootballMath.Settings.GravityVectorConstant = Vector3.new(0, p4, 0)
        print("Setting football gravity to " .. p4)

        return true
    end
}
