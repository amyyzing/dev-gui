-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[2]:GetChildren()[1]:GetChildren()[6]:GetChildren()[1]:GetChildren()[14]
-- Took 0.12s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- Decompiled using ByteFall
-- discord.gg/bytefall
return {
    GyroStatus = function(p1, p2)
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
    UpdateGyro = function(p3)
        local v4 = p3.Variables.CurrentGameSettings or p3.Variables.CurrentMiniSettings

        if not p3.Variables.LP.Character or not p3.Variables.LP.Character.PrimaryPart then
            return
        end

        if p3.THROW_INDICATOR then
            p3:GyroStatus(true)

            local HumanoidRootPartPosition = nil

            if p3.ShiftConn then
                p3.ShiftConn:Disconnect()
            end

            p3.ShiftConn = p3.Variables.RNS.Heartbeat:Connect(function(_)
                if p3.Variables.LP.Character and p3.Variables.LP.Character.PrimaryPart then
                    local u7 = p3.Variables.LP.Character.Humanoid.FloorMaterial ~= Enum.Material.Air

                    if not u7 and p3.GyroActive then
                        p3:GyroStatus(false)

                        return
                    end

                    if u7 and not p3.GyroActive then
                        p3:GyroStatus(true)
                    end
                end

                if p3.GyroActive then
                    HumanoidRootPartPosition = p3.Variables.LP.Character.HumanoidRootPart.Position

                    local n1

                    if p3.Variables.InputType == "Mobile" then
                        local v9 = p3:GetXboxCrosshairPosition()
                        local v10 = p3.Variables.Functions.Utilities:ScreenPointToRay(v9.X, v9.Y)

                        n1 = v10.Origin + v10.Direction * 1000
                    else
                        local v11 = p3.Variables.Functions.Utilities:ScreenPointToRay(p3.PlayerMouse.X, p3.PlayerMouse.Y)

                        n1 = v11.Origin + v11.Direction * 1000
                    end

                    local v12 = p3.Alignment
                    local v13 = CFrame.new
                    local v14 = HumanoidRootPartPosition
                    local vector3 = Vector3.new(n1.X, HumanoidRootPartPosition.Y, n1.Z)

                    v12.CFrame = v13(v14, vector3)

                    if v4 and not v4.GameStatus.Hiked.Value then
                        p3.THROW_INDICATOR = false
                        p3:UpdateGyro()
                    end
                end
            end)

            return
        end

        if p3.ShiftConn then
            p3.ShiftConn:Disconnect()
        end

        p3:GyroStatus(false)
    end
}
