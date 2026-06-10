-- Script Path: game:GetService("ReplicatedStorage").Assets.Modules.Client.Mechanics.Modules.General.MECH_ControlsJump

local RunService = game:GetService("RunService")
local t = {}
local t2 = {
    [Enum.HumanoidStateType.Jumping] = true,
    [Enum.HumanoidStateType.Freefall] = true,
    [Enum.HumanoidStateType.FallingDown] = true,
    [Enum.HumanoidStateType.GettingUp] = true,
    [Enum.HumanoidStateType.Flying] = true,
    [Enum.HumanoidStateType.PlatformStanding] = true,
    [Enum.HumanoidStateType.Dead] = true,
    [Enum.HumanoidStateType.Landed] = true
}

function t.Jump(p1) --[[ Jump | Line: 22 ]]
    local Character = p1.Variables.LP.Character

    if not (Character and (Character.PrimaryPart and Character:FindFirstChild("Humanoid"))) then
        return
    end

    Character.Humanoid.Jump = true
end
function t.SetupJumping(p1) --[[ SetupJumping | Line: 29 | Upvalues: t2 (copy), RunService (copy) ]]
    p1.Variables.UIS.JumpRequest:Connect(function() --[[ Line: 30 | Upvalues: p1 (copy), t2 (ref), RunService (ref) ]]
        local Character = p1.Variables.LP.Character

        if not Character then
            return
        end

        if p1.PlayerDiving then
            return
        end

        if not Character.PrimaryPart then
            return
        end

        if Character.PrimaryPart.Anchored then
            return
        end

        local Humanoid = Character.Humanoid

        if p1.PlayerPassengerSeating then
            p1:ExitVehicleIfAny()

            return
        end

        if p1.VehicleForbidJump then
            if not p1.PlayerDriving or p1.VehicleType ~= "GolfCart" then
                Humanoid.JumpHeight = 0

                return
            end

            p1:VehicleAcceleration_TriggerQuickBrake(1.5)
            Humanoid.JumpHeight = 0
        else
            Humanoid.UseJumpPower = false
            Humanoid.JumpPower = 0
            Humanoid.JumpHeight = 0

            if Humanoid.PlatformStand then
                return false
            end

            if not p1.JumpDebounce then
                return false
            end

            game.ReplicatedStorage.ReEvent:FireServer("ReportJump")

            if t2[Humanoid:GetState()] then
                return false
            end

            p1.JumpDebounce = false

            if p1.Variables.InputType == "Mobile" then
                p1:Catching()
            end

            if Character.Humanoid.SeatPart then
                Character.Humanoid.Sit = false
            end

            local AssemblyLinearVelocity = Character.PrimaryPart.AssemblyLinearVelocity

            p1.PlayerIsJumping = true

            local v1 = p1.Variables.Functions.GameParams:GetGameParam("JumpPower") or 53.5

            if p1.Variables.GlobalVariables:PlayerHasBall(p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings, p1.Variables.LP, p1.Variables.Football) then
                v1 = 53.5
            end

            local Mutations = p1.Variables.Functions.Mutations
            local v4 = math.clamp(v1 - AssemblyLinearVelocity.Y, 0, v1)

            if p1.PlayerDriving and not p1.VehicleForbidJump then
                local LookVector = Character.PrimaryPart.CFrame.LookVector
                local Magnitude = AssemblyLinearVelocity.Magnitude
                local v5 = nil

                if p1.VehicleType == "Bike" then
                    local v6 = math.min(18 + Magnitude * 0.7, 42)
                    local v9 = Vector3.new(LookVector.X * v6, v4 * 0.6, LookVector.Z * v6)
                    local v10 = v4 * 0.025
                    local v11 = tick()
                    local v12 = nil

                    v12 = RunService.Heartbeat:Connect(function() --[[ Line: 102 | Upvalues: v11 (copy), v12 (ref), Character (copy), v10 (copy) ]]
                        if tick() - v11 > 0.75 then
                            v12:Disconnect()

                            return
                        end

                        if not Character or (not Character.PrimaryPart or Character.PrimaryPart.Anchored) then
                            return
                        end

                        Character.PrimaryPart:ApplyImpulse(Vector3.new(0, v10, 0) * Character.PrimaryPart.AssemblyMass)
                    end)
                    v5 = v9
                elseif p1.VehicleType == "Hoverboard" then
                    local v14 = math.min(39 + Magnitude * 1, 85)

                    if p1.vehicleJumpAnimTrack and p1.vehicleJumpAnimTrack.IsPlaying then
                        p1.vehicleJumpAnimTrack:Stop()
                    end

                    if p1.characterJumpAnimTrack and p1.characterJumpAnimTrack.IsPlaying then
                        p1.characterJumpAnimTrack:Stop()
                    end

                    if p1.hoverboardMotor6D then
                        p1.hoverboardMotor6D.C0 = CFrame.new(Vector3.new(0, -2.202, 0)) * CFrame.Angles(0, 0, 0)
                        p1.hoverboardMotor6D.CurrentAngle = -0.163
                    end

                    task.wait(0.01)
                    p1.vehicleJumpAnimTrack:Play()
                    p1.characterJumpAnimTrack:Play()
                    p1.vehicleJumpAnimTrack:AdjustSpeed(1.8)
                    p1.characterJumpAnimTrack:AdjustSpeed(1.8)

                    local Hoverboard = Character:FindFirstChild("Hoverboard")

                    if Hoverboard then
                        local JumpSound = Hoverboard:FindFirstChild("JumpSound")

                        if JumpSound and JumpSound:IsA("Sound") then
                            JumpSound:Play()
                        end
                    end

                    local v17 = Vector3.new(LookVector.X * v14, v4 * 0.75, LookVector.Z * v14)
                    local v18 = v4 * 0.055
                    local v19 = tick()
                    local v20 = nil

                    v20 = RunService.Heartbeat:Connect(function() --[[ Line: 160 | Upvalues: v19 (copy), v20 (ref), Character (copy), v18 (copy) ]]
                        if tick() - v19 > 0.25 then
                            v20:Disconnect()

                            return
                        end

                        if not Character or (not Character.PrimaryPart or Character.PrimaryPart.Anchored) then
                            return
                        end

                        Character.PrimaryPart:ApplyImpulse(Vector3.new(0, v18, 0) * Character.PrimaryPart.AssemblyMass)
                    end)
                    v5 = v17
                end

                Character.PrimaryPart:ApplyImpulse(v5 * Character.PrimaryPart.AssemblyMass)
            else
                Character.PrimaryPart:ApplyImpulse(Vector3.new(0, v4, 0) * Character.PrimaryPart.AssemblyMass)
            end

            Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            task.wait()
            p1.PlayerIsJumping = false

            local v21 = if p1.PlayerDriving and not p1.VehicleForbidJump then if p1.VehicleType == "Hoverboard" then 0.45 else 0.8 else 2

            p1.Variables.EventCenter:Publish("ActionPerformed", "Jump", v21)
            task.wait(v21)
            p1.JumpDebounce = true
        end
    end)

    local Character = p1.Variables.LP.Character

    if not Character then
        return
    end

    if not (Character and Character.Humanoid) then
        return
    end

    Character.Humanoid:GetPropertyChangedSignal("Jump"):Connect(function() --[[ Line: 196 | Upvalues: Character (copy), p1 (copy) ]]
        if Character.Humanoid.Jump then
            p1.PlayerIsHoldingJumpKey = true
        else
            p1.PlayerIsHoldingJumpKey = false
        end
    end)
end
function t.GolfCartHandBrake(p1) --[[ GolfCartHandBrake | Line: 206 ]]
    local Character = p1.Variables.LP.Character

    if not Character then
        return
    end

    if Character:FindFirstChild("Humanoid") then
        Character.Humanoid.Jump = true
    end
end

return t
