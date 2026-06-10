-- Script Path: game:GetService("ReplicatedStorage").Assets.Modules.Client.Mechanics.Modules.General.MECH_Gyro

return {
    GyroStatus = function(p1, p2) --[[ GyroStatus | Line: 11 ]]
        if p2 and not p1.GyroActive then
            p1.GyroActive = true
            p1.Alignment.Parent = p1.Variables.LP.Character.HumanoidRootPart
            p1.AlignAttachment.Parent = p1.Variables.LP.Character.HumanoidRootPart
            p1.Alignment.Enabled = true

            return
        end

        p1.GyroActive = false
        p1.Alignment.Parent = p1.Variables.LP.Character.HumanoidRootPart
        p1.AlignAttachment.Parent = p1.Variables.LP.Character.HumanoidRootPart
        p1.Alignment.Enabled = false
    end,
    UpdateGyro = function(p1) --[[ UpdateGyro | Line: 26 ]]
        local v1 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

        if not (p1.Variables.LP.Character and p1.Variables.LP.Character.PrimaryPart) then
            return
        end

        if p1.THROW_INDICATOR then
            p1:GyroStatus(true)

            local v2 = nil

            if p1.ShiftConn then
                p1.ShiftConn:Disconnect()
            end

            p1.ShiftConn = p1.Variables.RNS.Heartbeat:Connect(function(p12) --[[ Line: 33 | Upvalues: p1 (copy), v2 (ref), v1 (copy) ]]
                if p1.Variables.LP.Character and p1.Variables.LP.Character.PrimaryPart then
                    local isNotAir = p1.Variables.LP.Character.Humanoid.FloorMaterial ~= Enum.Material.Air

                    if not isNotAir and p1.GyroActive then
                        p1:GyroStatus(false)

                        return
                    end

                    if isNotAir and not p1.GyroActive then
                        p1:GyroStatus(true)
                    end
                end

                if not p1.GyroActive then
                    return
                end

                v2 = p1.Variables.LP.Character.HumanoidRootPart.Position

                local v12

                if p1.Variables.InputType == "Mobile" then
                    local v22 = p1:GetXboxCrosshairPosition()
                    local v3 = p1.Variables.Functions.Utilities:ScreenPointToRay(v22.X, v22.Y)

                    v12 = v3.Origin + v3.Direction * 1000
                else
                    local v4 = p1.Variables.Functions.Utilities:ScreenPointToRay(p1.PlayerMouse.X, p1.PlayerMouse.Y)

                    v12 = v4.Origin + v4.Direction * 1000
                end

                p1.Alignment.CFrame = CFrame.new(v2, (Vector3.new(v12.X, v2.Y, v12.Z)))

                if not v1 or v1.GameStatus.Hiked.Value then
                    return
                end

                p1.THROW_INDICATOR = false
                p1:UpdateGyro()
            end)
        else
            if p1.ShiftConn then
                p1.ShiftConn:Disconnect()
            end

            p1:GyroStatus(false)
        end
    end
}
