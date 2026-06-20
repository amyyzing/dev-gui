-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[2]:GetChildren()[1]:GetChildren()[6]:GetChildren()[1]:GetChildren()[8]
-- Took 0.1s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- Decompiled using ByteFall
-- discord.gg/bytefall
local v1 = game:GetService("RunService")
local t1 = {}

t1[Enum.HumanoidStateType.Jumping] = true
t1[Enum.HumanoidStateType.Freefall] = true
t1[Enum.HumanoidStateType.FallingDown] = true
t1[Enum.HumanoidStateType.GettingUp] = true
t1[Enum.HumanoidStateType.Flying] = true
t1[Enum.HumanoidStateType.PlatformStanding] = true
t1[Enum.HumanoidStateType.Dead] = true
t1[Enum.HumanoidStateType.Landed] = true

return {
    Jump = function(p1)
        local Character = p1.Variables.LP.Character

        if Character and Character.PrimaryPart and Character:FindFirstChild("Humanoid") then
            Character.Humanoid.Jump = true
        end
    end,
    SetupJumping = function(p2)
        p2.Variables.UIS.JumpRequest:Connect(function()
            local Character = p2.Variables.LP.Character

            if not Character then
                return
            end

            if p2.PlayerDiving then
                return
            end

            if not Character.PrimaryPart then
                return
            end

            if Character.PrimaryPart.Anchored then
                return
            end

            local Humanoid = Character.Humanoid

            if p2.PlayerPassengerSeating then
                p2:ExitVehicleIfAny()

                return
            end

            if p2.VehicleForbidJump then
                if p2.PlayerDriving and p2.VehicleType == "GolfCart" then
                    p2:VehicleAcceleration_TriggerQuickBrake(1.5)
                end

                Humanoid.JumpHeight = 0

                return
            end

            Humanoid.UseJumpPower = false
            Humanoid.JumpPower = 0
            Humanoid.JumpHeight = 0

            if Humanoid.PlatformStand then
                return false
            end

            if not p2.JumpDebounce then
                return false
            end

            game.ReplicatedStorage.ReEvent:FireServer("ReportJump")

            local v11 = Humanoid:GetState()

            if t1[v11] then
                return false
            end

            p2.JumpDebounce = false

            if p2.Variables.InputType == "Mobile" then
                p2:Catching()
            end

            if Character.Humanoid.SeatPart then
                Character.Humanoid.Sit = false
            end

            local v12 = Character.PrimaryPart.AssemblyLinearVelocity

            p2.PlayerIsJumping = true

            local v13 = p2.Variables.Functions.GameParams:GetGameParam("JumpPower") or 53.5

            if p2.Variables.GlobalVariables:PlayerHasBall(p2.Variables.CurrentGameSettings or p2.Variables.CurrentMiniSettings, p2.Variables.LP, p2.Variables.Football) then
                v13 = 53.5
            end

            local v14 = math.clamp(v13 - v12.Y, 0, v13)

            if p2.PlayerDriving and not p2.VehicleForbidJump then
                local v15 = Character.PrimaryPart.CFrame.LookVector
                local v16 = v12.Magnitude
                local vector3 = nil

                if p2.VehicleType == "Bike" then
                    local v18 = math.min(18 + v16 * 0.7, 42)

                    vector3 = Vector3.new(v15.X * v18, v14 * 0.6, v15.Z * v18)

                    local n1 = v14 * 0.025
                    local v20 = tick()
                    local connection = nil

                    connection = v1.Heartbeat:Connect(function()
                        if tick() - v20 > 0.75 then
                            connection:Disconnect()
                        elseif Character and Character.PrimaryPart and not Character.PrimaryPart.Anchored then
                            local v33 = Character.PrimaryPart
                            local vector32 = Vector3.new(0, n1, 0)

                            v33:ApplyImpulse(vector32 * Character.PrimaryPart.AssemblyMass)
                        end
                    end)
                elseif p2.VehicleType == "Hoverboard" then
                    local v22 = math.min(39 + v16 * 1, 85)

                    if p2.vehicleJumpAnimTrack and p2.vehicleJumpAnimTrack.IsPlaying then
                        p2.vehicleJumpAnimTrack:Stop()
                    end

                    if p2.characterJumpAnimTrack and p2.characterJumpAnimTrack.IsPlaying then
                        p2.characterJumpAnimTrack:Stop()
                    end

                    if p2.hoverboardMotor6D then
                        local v23 = p2.hoverboardMotor6D
                        local v24 = CFrame.Angles(0, 0, 0)

                        v23.C0 = CFrame.new(Vector3.new(0, -2.202, 0)) * v24
                        p2.hoverboardMotor6D.CurrentAngle = -0.163
                    end

                    task.wait(0.01)
                    p2.vehicleJumpAnimTrack:Play()
                    p2.characterJumpAnimTrack:Play()
                    p2.vehicleJumpAnimTrack:AdjustSpeed(1.8)
                    p2.characterJumpAnimTrack:AdjustSpeed(1.8)

                    local v25 = Character:FindFirstChild("Hoverboard")
                    local v26 = v25 and v25:FindFirstChild("JumpSound")

                    if v26 and v26:IsA("Sound") then
                        v26:Play()
                    end

                    vector3 = Vector3.new(v15.X * v22, v14 * 0.75, v15.Z * v22)

                    local n2 = v14 * 0.055
                    local v28 = tick()
                    local connection = nil

                    connection = v1.Heartbeat:Connect(function()
                        if tick() - v28 > 0.25 then
                            connection:Disconnect()
                        elseif Character and Character.PrimaryPart and not Character.PrimaryPart.Anchored then
                            local v35 = Character.PrimaryPart
                            local vector3 = Vector3.new(0, n2, 0)

                            v35:ApplyImpulse(vector3 * Character.PrimaryPart.AssemblyMass)
                        end
                    end)
                end

                Character.PrimaryPart:ApplyImpulse(vector3 * Character.PrimaryPart.AssemblyMass)
            else
                local v30 = Character.PrimaryPart
                local vector3 = Vector3.new(0, v14, 0)

                v30:ApplyImpulse(vector3 * Character.PrimaryPart.AssemblyMass)
            end

            Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            task.wait()
            p2.PlayerIsJumping = false

            local n3 = 2

            if p2.PlayerDriving and not p2.VehicleForbidJump then
                n3 = if p2.VehicleType == "Hoverboard" then 0.45 else 0.8
            end

            p2.Variables.EventCenter:Publish("ActionPerformed", "Jump", n3)
            task.wait(n3)
            p2.JumpDebounce = true
        end)

        local Character = p2.Variables.LP.Character

        if not Character then
        elseif Character.Humanoid then
            Character.Humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
                if Character.Humanoid.Jump then
                    p2.PlayerIsHoldingJumpKey = true

                    return
                end

                p2.PlayerIsHoldingJumpKey = false
            end)
        end
    end,
    GolfCartHandBrake = function(p3)
        local Character = p3.Variables.LP.Character

        if not Character then
            return
        end

        if not Character:FindFirstChild("Humanoid") then
            return
        end

        Character.Humanoid.Jump = true
    end
}
