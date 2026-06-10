-- Script Path: game:GetService("ReplicatedStorage").Assets.Modules.Client.Mechanics.Modules.General.MECH_ControlsBallControl

return {
    BallControlFilter = function(p1) --[[ BallControlFilter | Line: 12 ]]
        local v1 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

        if not p1.Variables.GlobalVariables:PlayerIsPlaying(v1, p1.Variables.LP) then
            return false
        end

        local v2 = false

        for k, v in pairs(p1.Variables.GFunctions.Footballs) do
            if k and k.Parent == p1.Variables.LP.Character then
                v2 = true
            end
        end

        if v1.ActiveState.Value == "TURK_Active" then
            return v2
        end

        return not v2
    end,
    BallControl = function(p1) --[[ BallControl | Line: 33 ]]
        if p1:FilterAction("BallControl") == false then
            return
        end

        local v1 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

        if not v1 then
            return
        end

        v1.ReEvent:FireServer("Mechanics", "BallControl", "SpawnBall")
    end
}
