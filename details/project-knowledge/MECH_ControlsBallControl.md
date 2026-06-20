-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[2]:GetChildren()[1]:GetChildren()[6]:GetChildren()[1]:GetChildren()[31]
-- Took 0.08s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- Decompiled using ByteFall
-- discord.gg/bytefall
return {
    BallControlFilter = function(p1)
        local v2 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

        if not p1.Variables.GlobalVariables:PlayerIsPlaying(v2, p1.Variables.LP) then
            return false
        end

        local u3 = false

        for k, _ in pairs(p1.Variables.GFunctions.Footballs) do
            if k and k.Parent == p1.Variables.LP.Character then
                u3 = true
            end
        end

        if v2.ActiveState.Value == "TURK_Active" then
            return u3
        end

        return not u3
    end,
    BallControl = function(p2)
        if p2:FilterAction("BallControl") == false then
            return
        end

        local v7 = p2.Variables.CurrentGameSettings or p2.Variables.CurrentMiniSettings

        if v7 then
            v7.ReEvent:FireServer("Mechanics", "BallControl", "SpawnBall")
        end
    end
}
