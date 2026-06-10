-- Script Path: game:GetService("ReplicatedStorage").Assets.Modules.Client.Mechanics.Modules.General.MECH_ControlsDrive

local RunService = game:GetService("RunService")
local CollectionService = game:GetService("CollectionService")
local t = {
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
local v1 = nil
local v2 = nil
local v3 = nil
local v4 = nil
local t2 = {
    Bike = true,
    GolfCart = false,
    Hoverboard = true
}

local function _handleVehicleSeat(p1) --[[ _handleVehicleSeat | Line: 35 ]]
    if p1:IsA("Seat") then
        p1.Disabled = true
    end
end

function t.ExitDrivingState(p1) --[[ ExitDrivingState | Line: 41 | Upvalues: v2 (ref), v1 (ref), v4 (ref), v3 (ref) ]]
    if not p1.PlayerDriving then
        return
    end

    local Character = p1.Variables.LP.Character

    if Character then
        local Humanoid = Character:FindFirstChild("Humanoid")

        if Humanoid then
            Humanoid.AutoRotate = true
        end
    end

    p1:VehicleAcceleration_StopAcceleration()

    if p1.AnimationSpeedConnection then
        p1.AnimationSpeedConnection:Disconnect()
        p1.AnimationSpeedConnection = nil
    end

    if v2 then
        v2:Stop()
    end

    if v1 then
        v1:Stop()
    end

    if v4 then
        v4:Stop()
    end

    if v3 then
        v3:Stop()
    end

    if p1.hoverboardTrail then
        p1.hoverboardTrail.Enabled = false
        p1.hoverboardTrail = nil
    end

    p1.hoverboardMotor6D = nil

    if p1.golfCartWheelLeftFrontMotor and p1.golfCartWheelBaseC0.LeftFront then
        p1.golfCartWheelLeftFrontMotor.C0 = p1.golfCartWheelBaseC0.LeftFront
    end

    if p1.golfCartWheelRightFrontMotor and p1.golfCartWheelBaseC0.RightFront then
        p1.golfCartWheelRightFrontMotor.C0 = p1.golfCartWheelBaseC0.RightFront
    end

    p1.golfCartWheelLeftFrontMotor = nil
    p1.golfCartWheelRightFrontMotor = nil
    p1.golfCartWheelBaseC0 = {}
    p1.golfCartCurrentSteeringAngle = 0
    p1.VehicleForbidJump = false
    p1.PlayerDriving = false
    p1.VehicleType = nil
    p1:AllowVehicleSeating()
    p1.Variables.GUIModules.LiveControls:Update()
end
function t.StartDriving(p1, p2) --[[ StartDriving | Line: 101 | Upvalues: v1 (ref), v2 (ref), v3 (ref), v4 (ref), RunService (copy), t2 (copy) ]]
    if p1.PlayerDriving then
        return
    end

    if p1.ShiftLockEnabled then
        p1:ResetShiftLock()
    end

    local Character = p1.Variables.LP.Character

    if not Character then
        return
    end

    local Humanoid = Character:WaitForChild("Humanoid")

    if not Humanoid then
        return
    end

    local Animator = Humanoid:WaitForChild("Animator")
    local v12 = Character:WaitForChild(p2)
    local Animator2 = v12:WaitForChild("AnimationController"):WaitForChild("Animator")

    v1 = Animator:LoadAnimation(Animator2:WaitForChild("ChaStill"))
    v2 = Animator:LoadAnimation(Animator2:WaitForChild("ChaRideSlow"))
    v3 = Animator2:LoadAnimation(Animator2:WaitForChild("Still"))
    v4 = Animator2:LoadAnimation(Animator2:WaitForChild("RideSlow"))

    if p2 == "Hoverboard" then
        p1.characterJumpAnimTrack = Animator:LoadAnimation(Animator2:WaitForChild("ChaJump"))
        p1.vehicleJumpAnimTrack = Animator2:LoadAnimation(Animator2:WaitForChild("Jump"))
        p1.characterJumpAnimTrack.Looped = false
        p1.vehicleJumpAnimTrack.Looped = false

        local HoverBoard = v12:FindFirstChild("HoverBoard", true)
        local LowerTorso = Character:FindFirstChild("LowerTorso")

        if HoverBoard and (HoverBoard:IsA("BasePart") and LowerTorso) then
            local v22 = HoverBoard:FindFirstChild("HoverBoard") or HoverBoard:FindFirstChild("HoverboardMotor6D")
            local v32 = CFrame.new(Vector3.new(0, -2.202, 0)) * CFrame.Angles(0, 0, 0)

            if v22 and (v22:IsA("Motor6D") and v22.Part0 == LowerTorso) then
                if v22 and v22:IsA("Motor6D") then
                    v22.C0 = v32
                    v22.CurrentAngle = -0.163
                    p1.hoverboardMotor6D = v22
                end
            else
                if v22 and (v22:IsA("Motor6D") and v22.Part0 ~= LowerTorso) then
                    v22:Destroy()
                end

                local HoverBoard2 = Instance.new("Motor6D")

                HoverBoard2.Name = "HoverBoard"
                HoverBoard2.Part0 = LowerTorso
                HoverBoard2.Part1 = HoverBoard
                HoverBoard2.CurrentAngle = -0.163
                HoverBoard2.C0 = v32
                HoverBoard2.Parent = HoverBoard
                p1.hoverboardMotor6D = HoverBoard2
            end

            local Trail = HoverBoard:FindFirstChildOfClass("Trail")

            if Trail then
                p1.hoverboardTrail = Trail
                Trail.Enabled = false
            end
        end
    end

    local WalkSpeed = Humanoid.WalkSpeed

    Humanoid.AutoRotate = false

    local v42 = p1.Variables.RemoteConfig.Get("/Game/VehicleConfig"):expect()
    local v5 = if v42 then v42[p2] else v42
    local t = {}

    t.AccelerationRate = v5 and v5.AccelerationRate or 18
    t.DecelerationRate = v5 and v5.DecelerationRate or 14
    t.BaseSpeed = WalkSpeed
    t.TurnResponsiveness = v5 and v5.TurnResponsiveness or 0.35
    t.DirectionChangeSmoothing = v5 and v5.DirectionChangeSmoothing or 0.1
    t.SharpTurnSpeedReduction = v5 and v5.SharpTurnSpeedReduction or 0.85
    t.ReverseSpeedMultiplier = v5 and v5.ReverseSpeedMultiplier or 0.6
    p1:VehicleAcceleration_Initialize(p2, t)
    p1:VehicleAcceleration_StartAcceleration()
    p1:VehicleAcceleration_SetTargetVelocity(WalkSpeed)

    if p2 == "Hoverboard" and (v5 and v5.EnableHoverEffect) then
        local HumanoidHipHeight = v42[p2].HumanoidHipHeight
    end

    if p2 == "GolfCart" then
        local WheelLeftFront = v12:FindFirstChild("WheelLeftFront", true)
        local WheelRightFront = v12:FindFirstChild("WheelRightFront", true)

        if WheelLeftFront then
            for i, v in ipairs(v12:GetDescendants()) do
                if v:IsA("Motor6D") and v.Part1 == WheelLeftFront then
                    p1.golfCartWheelLeftFrontMotor = v
                    p1.golfCartWheelBaseC0.LeftFront = v.C0

                    break
                end
            end
        end

        if WheelRightFront then
            for i, v in ipairs(v12:GetDescendants()) do
                if v:IsA("Motor6D") and v.Part1 == WheelRightFront then
                    p1.golfCartWheelRightFrontMotor = v
                    p1.golfCartWheelBaseC0.RightFront = v.C0

                    break
                end
            end
        end
    end

    local v122 = Vector3.new(0, 0, 0)
    local v13 = WalkSpeed

    if Humanoid.MoveDirection.Magnitude > 0 then
        if not v2.IsPlaying then
            v1:Stop()
            v2:Play()
        end

        if not v4.IsPlaying then
            v3:Stop()
            v4:Play()
        end
    else
        if not v1.IsPlaying then
            v2:Stop()
            v1:Play()
        end

        if not v3.IsPlaying then
            v4:Stop()
            v3:Play()
        end
    end

    p1.AnimationSpeedConnection = RunService.Heartbeat:Connect(function() --[[ Line: 241 | Upvalues: Humanoid (copy), Character (copy), p1 (copy), v122 (ref), p2 (copy), v13 (ref), WalkSpeed (copy), t (copy), v2 (ref), v1 (ref), v4 (ref), v3 (ref) ]]
        if not (Humanoid and (Character and Character.PrimaryPart)) then
            return
        end

        local PrimaryPart = Character.PrimaryPart
        local v12 = p1:VehicleAcceleration_GetCurrentVelocity()
        local v22 = Humanoid.MoveDirection.Magnitude > 0.1

        if v22 then
            local MoveDirection = Humanoid.MoveDirection
            local LookVector = PrimaryPart.CFrame.LookVector

            if v122.Magnitude < 0.1 then
                v122 = MoveDirection
            end

            local v32 = if LookVector.Magnitude > 0.1 and MoveDirection.Magnitude > 0.1 then math.acos((math.clamp(LookVector:Dot(MoveDirection.Unit), -1, 1))) else 0
            local v7 = LookVector:Dot(MoveDirection.Unit)
            local v8 = false
            local v9 = false

            if p2 == "GolfCart" then
                local v10 = p1.Variables.PlayerData[p1.Variables.LP.Name]

                if v10 and (v10.ProfileData and v10.ProfileData.PersonalSettings) then
                    v9 = v10.ProfileData.PersonalSettings.ReverseGolfCart == true
                end
            end

            if p2 == "GolfCart" and (v7 < -0.5 and v9) then
                v8 = true
                v13 = WalkSpeed * t.ReverseSpeedMultiplier

                local Unit = LookVector:Cross(Vector3.new(0, 1, 0)).Unit

                if math.abs((MoveDirection.Unit:Dot(Unit))) > 0.3 then
                    local v132 = CFrame.lookAt(PrimaryPart.Position, PrimaryPart.Position + LookVector:Lerp(-MoveDirection.Unit, t.TurnResponsiveness * 0.3))

                    PrimaryPart.CFrame = CFrame.new(PrimaryPart.Position) * (v132 - v132.Position)
                end
            else
                v122 = v122:Lerp(MoveDirection, t.DirectionChangeSmoothing)

                local v14 = LookVector:Dot(v122.Unit)

                v13 = WalkSpeed * (if v14 < 0.7 then if v14 > 0 then 0.7 else 0.4 else 1) * (if v32 > 0.7853981633974483 then 1 - v32 / 3.141592653589793 * 0.5 else 1)

                local v18 = CFrame.lookAt(PrimaryPart.Position, PrimaryPart.Position + LookVector:Lerp(v122, t.TurnResponsiveness))

                PrimaryPart.CFrame = CFrame.new(PrimaryPart.Position) * (v18 - v18.Position)
            end

            if p2 == "GolfCart" and (p1.golfCartWheelLeftFrontMotor or p1.golfCartWheelRightFrontMotor) then
                local Unit = PrimaryPart.CFrame.LookVector:Cross(Vector3.new(0, 1, 0)).Unit
                local v19 = MoveDirection.Unit:Dot(Unit)

                if v8 then
                    v19 = -v19
                end

                p1.golfCartCurrentSteeringAngle = p1.golfCartCurrentSteeringAngle + (math.clamp(v19 * 0.7853981633974483 * 1.2, -0.7853981633974483, 0.7853981633974483) - p1.golfCartCurrentSteeringAngle) * 0.25

                if p1.golfCartWheelLeftFrontMotor and p1.golfCartWheelBaseC0.LeftFront then
                    p1.golfCartWheelLeftFrontMotor.C0 = p1.golfCartWheelBaseC0.LeftFront * CFrame.Angles(0, p1.golfCartCurrentSteeringAngle, 0)
                end

                if p1.golfCartWheelRightFrontMotor and p1.golfCartWheelBaseC0.RightFront then
                    p1.golfCartWheelRightFrontMotor.C0 = p1.golfCartWheelBaseC0.RightFront * CFrame.Angles(0, p1.golfCartCurrentSteeringAngle, 0)
                end
            end
        elseif p2 == "GolfCart" then
            p1.golfCartCurrentSteeringAngle = p1.golfCartCurrentSteeringAngle + (0 - p1.golfCartCurrentSteeringAngle) * 0.25

            if p1.golfCartWheelLeftFrontMotor and p1.golfCartWheelBaseC0.LeftFront then
                p1.golfCartWheelLeftFrontMotor.C0 = p1.golfCartWheelBaseC0.LeftFront * CFrame.Angles(0, p1.golfCartCurrentSteeringAngle, 0)
            end

            if p1.golfCartWheelRightFrontMotor and p1.golfCartWheelBaseC0.RightFront then
                p1.golfCartWheelRightFrontMotor.C0 = p1.golfCartWheelBaseC0.RightFront * CFrame.Angles(0, p1.golfCartCurrentSteeringAngle, 0)
            end
        end

        if v22 then
            p1:VehicleAcceleration_SetTargetVelocity(v13)

            if not v2.IsPlaying then
                v1:Stop()
                v2:Play()
            end

            if not v4.IsPlaying then
                v3:Stop()
                v4:Play()
            end

            if p2 == "Hoverboard" and (p1.hoverboardMotor6D and not p1.PlayerIsJumping) then
                p1.hoverboardMotor6D.C0 = CFrame.new(Vector3.new(0, -2.202, 0)) * CFrame.Angles(0, 0, 0)
                p1.hoverboardMotor6D.CurrentAngle = -0.163
            end
        else
            p1:VehicleAcceleration_SetTargetVelocity(0)

            if v12 > 0.5 then
                local v25 = PrimaryPart.CFrame.LookVector * v12

                PrimaryPart.AssemblyLinearVelocity = Vector3.new(v25.X, PrimaryPart.AssemblyLinearVelocity.Y, v25.Z)
            else
                v122 = Vector3.new(0, 0, 0)
            end

            if v12 < 1 then
                if not v1.IsPlaying then
                    v2:Stop()
                    v1:Play()
                end

                if not v3.IsPlaying then
                    v4:Stop()
                    v3:Play()
                end

                if p2 == "Hoverboard" and (p1.hoverboardMotor6D and not p1.PlayerIsJumping) then
                    p1.hoverboardMotor6D.C0 = CFrame.new(Vector3.new(0, -2, 0)) * CFrame.Angles(0, 0, 0)
                    p1.hoverboardMotor6D.CurrentAngle = -0.12
                end
            end
        end

        local v26 = p1:VehicleAcceleration_GetSpeedMultiplier()

        Humanoid.WalkSpeed = v12

        if p2 == "Hoverboard" and p1.hoverboardTrail then
            p1.hoverboardTrail.Enabled = v12 > 0
        end

        if v12 > 0.1 then
            local v28 = math.max(0.1, v26)

            if v4 and v4.IsPlaying then
                v4:AdjustSpeed(v28)
            end

            if v2 and v2.IsPlaying then
                v2:AdjustSpeed(v28)
            end
        else
            if v4 and v4.IsPlaying then
                v4:AdjustSpeed(0)
            end

            if not (v2 and v2.IsPlaying) then
                return
            end

            v2:AdjustSpeed(0)
        end
    end)

    if t2[p2] then
        p1.VehicleForbidJump = false
    else
        p1.VehicleForbidJump = true
    end

    p1.VehicleType = p2
    p1.PlayerDriving = true
    p1:DisableVehicleSeating()

    if p1.SprintStatus then
        p1:Sprint(true)
    end

    p1.Variables.GUIModules.LiveControls:Update()
end
function t.ExitVehicleIfAny(p1) --[[ ExitVehicleIfAny | Line: 455 ]]
    if p1.PlayerPassengerSeating then
        game.ReplicatedStorage.ReEvent:FireServer("PassengerEndSeating")

        return
    end

    for v1, v2 in p1.Variables.PlayerData[p1.Variables.LP.Name].ProfileData.Vehicles do
        if v2.Equipped then
            local v3, _ = game.ReplicatedStorage.ReEvent.ReFunction:InvokeServer("UnequipVehicle", v1)

            if v3 then
                v2.Equipped = false
                p1:ExitDrivingState()
            end
        end
    end

    for v4, v5 in p1.Variables.PauseMenu.Sidebar.Basis.Vehicles.Options:GetChildren() do
        if not v5:IsA("UIBase") then
            v5.EquippedText.Visible = false
            v5.Locked.Visible = true
            v5.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
            v5.Interactable = false
        end
    end
end
function t.VehicleBrake(p1) --[[ VehicleBrake | Line: 480 ]]
    if not p1.PlayerDriving or p1.VehicleType ~= "GolfCart" then
        return
    end

    p1:VehicleAcceleration_TriggerQuickBrake(1.5)
end
function t.PassengerStartSeating(p1) --[[ PassengerStartSeating | Line: 486 ]]
    if p1.ShiftLockEnabled then
        p1:ResetShiftLock()
    end

    if p1.SprintStatus then
        p1:Sprint(true)
    end

    p1.PlayerPassengerSeating = true
    p1.Variables.GUIModules.LiveControls:Update()
end
function t.PassengerEndSeating(p1) --[[ PassengerEndSeating | Line: 501 ]]
    p1.PlayerPassengerSeating = false
    p1.Variables.GUIModules.LiveControls:Update()
end
function t.AllowVehicleSeating(p1) --[[ AllowVehicleSeating | Line: 506 | Upvalues: CollectionService (copy) ]]
    if not p1.TrackingVehicleSeatAdded then
        return
    end

    p1.TrackingVehicleSeatAdded:Disconnect()
    p1.TrackingVehicleSeatAdded = nil

    for i, v in ipairs(CollectionService:GetTagged("VehicleSeat")) do
        if v:IsA("Seat") then
            v.Disabled = false
        end
    end
end
function t.DisableVehicleSeating(p1) --[[ DisableVehicleSeating | Line: 521 | Upvalues: CollectionService (copy), _handleVehicleSeat (copy) ]]
    if p1.TrackingVehicleSeatAdded then
        return
    end

    p1.TrackingVehicleSeatAdded = CollectionService:GetInstanceAddedSignal("VehicleSeat"):Connect(_handleVehicleSeat)

    for i, v in ipairs(CollectionService:GetTagged("VehicleSeat")) do
        if v:IsA("Seat") then
            v.Disabled = true
        end
    end
end

return t
