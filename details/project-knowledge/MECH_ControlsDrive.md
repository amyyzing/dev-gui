-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[2]:GetChildren()[1]:GetChildren()[6]:GetChildren()[1]:GetChildren()[37]
-- Took 0.12s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- Decompiled using ByteFall
-- discord.gg/bytefall
local v1 = game:GetService("RunService")
local v2 = game:GetService("CollectionService")
local t1 = {
    PlayerDriving = false,
    TrackingVehicleSeatAdded = nil,
    CurrentVehicleType = nil,
    AnimationSpeedConnection = nil,
    characterJumpAnimTrack = nil,
    vehicleJumpAnimTrack = nil,
    hoverboardTrail = nil,
    hoverboardMotor6D = nil,
    golfCartWheelLeftFrontMotor = nil,
    golfCartWheelRightFrontMotor = nil,
    golfCartCurrentSteeringAngle = 0,
    golfCartWheelBaseC0 = {}
}
local u4 = nil
local u5 = nil
local u6 = nil
local u7 = nil
local t2 = { Bike = true, GolfCart = false, Hoverboard = true }

local function _handleVehicleSeat(p1)
    if not p1:IsA("Seat") then
        return
    end

    p1.Disabled = true
end
function t1.ExitDrivingState(p2)
    if not p2.PlayerDriving then
        return
    end

    local Character = p2.Variables.LP.Character
    local v13 = Character and Character:FindFirstChild("Humanoid")

    if v13 then
        v13.AutoRotate = true
    end

    p2:VehicleAcceleration_StopAcceleration()

    if p2.AnimationSpeedConnection then
        p2.AnimationSpeedConnection:Disconnect()
        p2.AnimationSpeedConnection = nil
    end

    if u5 then
        u5:Stop()
    end

    if u4 then
        u4:Stop()
    end

    if u7 then
        u7:Stop()
    end

    if u6 then
        u6:Stop()
    end

    if p2.hoverboardTrail then
        p2.hoverboardTrail.Enabled = false
        p2.hoverboardTrail = nil
    end

    p2.hoverboardMotor6D = nil

    if p2.golfCartWheelLeftFrontMotor and p2.golfCartWheelBaseC0.LeftFront then
        p2.golfCartWheelLeftFrontMotor.C0 = p2.golfCartWheelBaseC0.LeftFront
    end

    if p2.golfCartWheelRightFrontMotor and p2.golfCartWheelBaseC0.RightFront then
        p2.golfCartWheelRightFrontMotor.C0 = p2.golfCartWheelBaseC0.RightFront
    end

    p2.golfCartWheelLeftFrontMotor = nil
    p2.golfCartWheelRightFrontMotor = nil
    p2.golfCartWheelBaseC0 = {}
    p2.golfCartCurrentSteeringAngle = 0
    p2.VehicleForbidJump = false
    p2.PlayerDriving = false
    p2.VehicleType = nil
    p2:AllowVehicleSeating()
    p2.Variables.GUIModules.LiveControls:Update()
end
function t1.StartDriving(p3, p4)
    if p3.PlayerDriving then
        return
    end

    if p3.ShiftLockEnabled then
        p3:ResetShiftLock()
    end

    local Character = p3.Variables.LP.Character

    if not Character then
        return
    end

    local v17 = Character:WaitForChild("Humanoid")

    if not v17 then
        return
    end

    local v18 = v17:WaitForChild("Animator")
    local v19 = Character:WaitForChild(p4)
    local v20 = v19:WaitForChild("AnimationController"):WaitForChild("Animator")

    u4 = v18:LoadAnimation(v20:WaitForChild("ChaStill"))
    u5 = v18:LoadAnimation(v20:WaitForChild("ChaRideSlow"))
    u6 = v20:LoadAnimation(v20:WaitForChild("Still"))
    u7 = v20:LoadAnimation(v20:WaitForChild("RideSlow"))

    if p4 == "Hoverboard" then
        p3.characterJumpAnimTrack = v18:LoadAnimation(v20:WaitForChild("ChaJump"))
        p3.vehicleJumpAnimTrack = v20:LoadAnimation(v20:WaitForChild("Jump"))
        p3.characterJumpAnimTrack.Looped = false
        p3.vehicleJumpAnimTrack.Looped = false

        local v21 = v19:FindFirstChild("HoverBoard", true)
        local v22 = Character:FindFirstChild("LowerTorso")

        if v21 and v21:IsA("BasePart") and v22 then
            local v23 = v21:FindFirstChild("HoverBoard") or v21:FindFirstChild("HoverboardMotor6D")
            local v24 = CFrame.Angles(0, 0, 0)
            local n1 = CFrame.new(Vector3.new(0, -2.202, 0)) * v24

            if not v23 or not v23:IsA("Motor6D") or v22 ~= v23.Part0 then
                if v23 and v23:IsA("Motor6D") and v22 ~= v23.Part0 then
                    v23:Destroy()
                end

                local Motor6D = Instance.new("Motor6D")

                Motor6D.Name = "HoverBoard"
                Motor6D.Part0 = v22
                Motor6D.Part1 = v21
                Motor6D.CurrentAngle = -0.163
                Motor6D.C0 = n1
                Motor6D.Parent = v21
                p3.hoverboardMotor6D = Motor6D
            elseif v23 and v23:IsA("Motor6D") then
                v23.C0 = n1
                v23.CurrentAngle = -0.163
                p3.hoverboardMotor6D = v23
            end

            local v27 = v21:FindFirstChildOfClass("Trail")

            if v27 then
                p3.hoverboardTrail = v27
                v27.Enabled = false
            end
        end
    end

    local v28 = v17.WalkSpeed

    v17.AutoRotate = false

    local v29 = p3.Variables.RemoteConfig.Get("/Game/VehicleConfig"):expect()
    local v30 = v29 and v29[p4]
    local t3 = {
        AccelerationRate = v30 and v30.AccelerationRate or 18,
        DecelerationRate = v30 and v30.DecelerationRate or 14,
        BaseSpeed = v28,
        TurnResponsiveness = v30 and v30.TurnResponsiveness or 0.35,
        DirectionChangeSmoothing = v30 and v30.DirectionChangeSmoothing or 0.1,
        SharpTurnSpeedReduction = v30 and v30.SharpTurnSpeedReduction or 0.85,
        ReverseSpeedMultiplier = v30 and v30.ReverseSpeedMultiplier or 0.6
    }

    p3:VehicleAcceleration_Initialize(p4, t3)
    p3:VehicleAcceleration_StartAcceleration()
    p3:VehicleAcceleration_SetTargetVelocity(v28)

    if p4 == "GolfCart" then
        local v32 = v19:FindFirstChild("WheelLeftFront", true)
        local v33 = v19:FindFirstChild("WheelRightFront", true)

        if v32 then
            for _, v in ipairs(v19:GetDescendants()) do
                if v:IsA("Motor6D") and v32 == v.Part1 then
                    p3.golfCartWheelLeftFrontMotor = v
                    p3.golfCartWheelBaseC0.LeftFront = v.C0

                    break
                end
            end
        end

        if v33 then
            for _, v in ipairs(v19:GetDescendants()) do
                if v:IsA("Motor6D") and v33 == v.Part1 then
                    p3.golfCartWheelRightFrontMotor = v
                    p3.golfCartWheelBaseC0.RightFront = v.C0

                    break
                end
            end
        end
    end

    local u38 = Vector3.new(0, 0, 0)
    local u39 = v28

    if v17.MoveDirection.Magnitude > 0 then
        if not u5.IsPlaying then
            u4:Stop()
            u5:Play()
        end

        if not u7.IsPlaying then
            u6:Stop()
            u7:Play()
        end
    else
        if not u4.IsPlaying then
            u5:Stop()
            u4:Play()
        end

        if not u6.IsPlaying then
            u7:Stop()
            u6:Play()
        end
    end

    p3.AnimationSpeedConnection = v1.Heartbeat:Connect(function()
        if not v17 or not Character or not Character.PrimaryPart then
            return
        end

        local v56 = Character.PrimaryPart
        local v57 = p3:VehicleAcceleration_GetCurrentVelocity()
        local u58 = v17.MoveDirection.Magnitude > 0.1

        if u58 then
            local v59 = v17.MoveDirection
            local v60 = v56.CFrame.LookVector

            if u38.Magnitude < 0.1 then
                u38 = v59
            end

            local n1 = 0

            if v60.Magnitude > 0.1 and v59.Magnitude > 0.1 then
                local v62 = v60:Dot(v59.Unit)
                local v63 = math.clamp(v62, -1, 1)

                n1 = math.acos(v63)
            end

            local v64 = v60:Dot(v59.Unit)
            local u65 = false
            local u66 = false
            local v67 = p4 == "GolfCart" and p3.Variables.PlayerData[p3.Variables.LP.Name]

            if v67 and v67.ProfileData and v67.ProfileData.PersonalSettings then
                u66 = v67.ProfileData.PersonalSettings.ReverseGolfCart == true
            end

            if p4 == "GolfCart" and v64 < -0.5 and u66 then
                u65 = true
                u39 = v28 * t3.ReverseSpeedMultiplier

                local v68 = v60:Cross(Vector3.new(0, 1, 0))
                local v69 = v59.Unit:Dot(v68.Unit)

                if math.abs(v69) > 0.3 then
                    local v70 = v60:Lerp(-v59.Unit, t3.TurnResponsiveness * 0.3)
                    local v71 = CFrame.lookAt(v56.Position, v56.Position + v70)

                    v56.CFrame = CFrame.new(v56.Position) * (v71 - v71.Position)
                end
            else
                u38 = u38:Lerp(v59, t3.DirectionChangeSmoothing)

                local v72 = v60:Dot(u38.Unit)
                local n2 = 1

                if v72 < 0.7 then
                    n2 = if v72 > 0 then 0.7 else 0.4
                end

                local n3 = 1

                if n1 > 0.7853981633974483 then
                    n3 = 1 - n1 / 3.141592653589793 * 0.5
                end

                u39 = v28 * n2 * n3

                local v75 = v60:Lerp(u38, t3.TurnResponsiveness)
                local v76 = CFrame.lookAt(v56.Position, v56.Position + v75)

                v56.CFrame = CFrame.new(v56.Position) * (v76 - v76.Position)
            end

            if p4 == "GolfCart" and (not not p3.golfCartWheelLeftFrontMotor or not not p3.golfCartWheelRightFrontMotor) then
                local v77 = v56.CFrame.LookVector:Cross(Vector3.new(0, 1, 0))
                local v78 = v59.Unit:Dot(v77.Unit)

                if u65 then
                    v78 = -v78
                end

                local v79 = math.clamp(v78 * 0.7853981633974483 * 1.2, -0.7853981633974483, 0.7853981633974483)

                p3.golfCartCurrentSteeringAngle = p3.golfCartCurrentSteeringAngle + (v79 - p3.golfCartCurrentSteeringAngle) * 0.25

                if p3.golfCartWheelLeftFrontMotor and p3.golfCartWheelBaseC0.LeftFront then
                    local v80 = CFrame.Angles(0, p3.golfCartCurrentSteeringAngle, 0)

                    p3.golfCartWheelLeftFrontMotor.C0 = p3.golfCartWheelBaseC0.LeftFront * v80
                end

                if p3.golfCartWheelRightFrontMotor and p3.golfCartWheelBaseC0.RightFront then
                    local v81 = CFrame.Angles(0, p3.golfCartCurrentSteeringAngle, 0)

                    p3.golfCartWheelRightFrontMotor.C0 = p3.golfCartWheelBaseC0.RightFront * v81
                end
            end
        elseif p4 == "GolfCart" then
            p3.golfCartCurrentSteeringAngle = p3.golfCartCurrentSteeringAngle + (0 - p3.golfCartCurrentSteeringAngle) * 0.25

            if p3.golfCartWheelLeftFrontMotor and p3.golfCartWheelBaseC0.LeftFront then
                local v82 = CFrame.Angles(0, p3.golfCartCurrentSteeringAngle, 0)

                p3.golfCartWheelLeftFrontMotor.C0 = p3.golfCartWheelBaseC0.LeftFront * v82
            end

            if p3.golfCartWheelRightFrontMotor and p3.golfCartWheelBaseC0.RightFront then
                local v83 = CFrame.Angles(0, p3.golfCartCurrentSteeringAngle, 0)

                p3.golfCartWheelRightFrontMotor.C0 = p3.golfCartWheelBaseC0.RightFront * v83
            end
        end

        if u58 then
            p3:VehicleAcceleration_SetTargetVelocity(u39)

            if not u5.IsPlaying then
                u4:Stop()
                u5:Play()
            end

            if not u7.IsPlaying then
                u6:Stop()
                u7:Play()
            end

            if p4 == "Hoverboard" and p3.hoverboardMotor6D and not p3.PlayerIsJumping then
                local v84 = p3.hoverboardMotor6D
                local v85 = CFrame.Angles(0, 0, 0)

                v84.C0 = CFrame.new(Vector3.new(0, -2.202, 0)) * v85
                p3.hoverboardMotor6D.CurrentAngle = -0.163
            end
        else
            p3:VehicleAcceleration_SetTargetVelocity(0)

            if v57 > 0.5 then
                local n4 = v56.CFrame.LookVector * v57

                v56.AssemblyLinearVelocity = Vector3.new(n4.X, v56.AssemblyLinearVelocity.Y, n4.Z)
            else
                u38 = Vector3.new(0, 0, 0)
            end

            if v57 < 1 then
                if not u4.IsPlaying then
                    u5:Stop()
                    u4:Play()
                end

                if not u6.IsPlaying then
                    u7:Stop()
                    u6:Play()
                end

                if p4 == "Hoverboard" and p3.hoverboardMotor6D and not p3.PlayerIsJumping then
                    local v87 = p3.hoverboardMotor6D
                    local v88 = CFrame.Angles(0, 0, 0)

                    v87.C0 = CFrame.new(Vector3.new(0, -2, 0)) * v88
                    p3.hoverboardMotor6D.CurrentAngle = -0.12
                end
            end
        end

        local v89 = p3:VehicleAcceleration_GetSpeedMultiplier()

        v17.WalkSpeed = v57

        if p4 == "Hoverboard" and p3.hoverboardTrail then
            p3.hoverboardTrail.Enabled = v57 > 0
        end

        if v57 > 0.1 then
            local v90 = math.max(0.1, v89)

            if u7 and u7.IsPlaying then
                u7:AdjustSpeed(v90)
            end

            if u5 and u5.IsPlaying then
                u5:AdjustSpeed(v90)

                return
            end
        else
            if u7 and u7.IsPlaying then
                u7:AdjustSpeed(0)
            end

            if u5 and u5.IsPlaying then
                u5:AdjustSpeed(0)
            end
        end
    end)

    if t2[p4] then
        p3.VehicleForbidJump = false
    else
        p3.VehicleForbidJump = true
    end

    p3.VehicleType = p4
    p3.PlayerDriving = true
    p3:DisableVehicleSeating()

    if p3.SprintStatus then
        p3:Sprint(true)
    end

    p3.Variables.GUIModules.LiveControls:Update()
end
function t1.ExitVehicleIfAny(p5)
    if p5.PlayerPassengerSeating then
        game.ReplicatedStorage.ReEvent:FireServer("PassengerEndSeating")

        return
    end

    for v41, v42 in p5.Variables.PlayerData[p5.Variables.LP.Name].ProfileData.Vehicles, nil, nil do
        if v42.Equipped then
            local v43, v44 = game.ReplicatedStorage.ReEvent.ReFunction:InvokeServer("UnequipVehicle", v41)

            if v43 then
                v42.Equipped = false
                p5:ExitDrivingState()
            end
        end
    end

    for v45, v46 in p5.Variables.PauseMenu.Sidebar.Basis.Vehicles.Options:GetChildren() do
        if not v46:IsA("UIBase") then
            v46.EquippedText.Visible = false
            v46.Locked.Visible = true
            v46.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
            v46.Interactable = false
        end
    end
end
function t1.VehicleBrake(p6)
    if p6.PlayerDriving and p6.VehicleType == "GolfCart" then
        p6:VehicleAcceleration_TriggerQuickBrake(1.5)
    end
end
function t1.PassengerStartSeating(p7)
    if p7.ShiftLockEnabled then
        p7:ResetShiftLock()
    end

    if p7.SprintStatus then
        p7:Sprint(true)
    end

    p7.PlayerPassengerSeating = true
    p7.Variables.GUIModules.LiveControls:Update()
end
function t1.PassengerEndSeating(p8)
    p8.PlayerPassengerSeating = false
    p8.Variables.GUIModules.LiveControls:Update()
end
function t1.AllowVehicleSeating(p9)
    if not p9.TrackingVehicleSeatAdded then
        return
    end

    p9.TrackingVehicleSeatAdded:Disconnect()
    p9.TrackingVehicleSeatAdded = nil

    for _, v in ipairs(v2:GetTagged("VehicleSeat")) do
        if v:IsA("Seat") then
            v.Disabled = false
        end
    end
end
function t1.DisableVehicleSeating(p10)
    if p10.TrackingVehicleSeatAdded then
        return
    end

    p10.TrackingVehicleSeatAdded = v2:GetInstanceAddedSignal("VehicleSeat"):Connect(_handleVehicleSeat)

    for _, v in ipairs(v2:GetTagged("VehicleSeat")) do
        if v:IsA("Seat") then
            v.Disabled = true
        end
    end
end

return t1
