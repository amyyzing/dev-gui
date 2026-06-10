-- Script Path: game:GetService("ReplicatedStorage").Assets.Modules.Shared.GlobalVariables.Modules.GLOB_MechanicActions

return {
    Dive = function(p1, p2, p3, p4) --[[ Dive | Line: 3 ]]
        if not p2 then
            return
        end

        local Humanoid = p2:FindFirstChild("Humanoid")

        if not Humanoid then
            return
        end

        local PrimaryPart = p2.PrimaryPart

        if not PrimaryPart then
            return
        end

        Humanoid.Jump = false
        Humanoid.AutoRotate = false

        local AssemblyLinearVelocity = PrimaryPart.AssemblyLinearVelocity

        PrimaryPart.AssemblyLinearVelocity = Vector3.new(AssemblyLinearVelocity.X, 4, AssemblyLinearVelocity.Z) * p3
        PrimaryPart.AssemblyAngularVelocity = Vector3.new(AssemblyLinearVelocity.Z / 5, 0, -AssemblyLinearVelocity.X / 5)
        Humanoid.PlatformStand = true
        task.wait(0.5)

        if not Humanoid.PlatformStand or p1.PlayerTackling then
            return
        end

        PrimaryPart.AssemblyLinearVelocity = Vector3.new()
        PrimaryPart.AssemblyAngularVelocity = Vector3.new()

        if p4 then
            return
        end

        task.wait(1)
        Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        Humanoid.AutoRotate = true
        Humanoid.PlatformStand = false
    end,
    KnockBack = function(p1, p2, p3) --[[ KnockBack | Line: 30 ]]
        if not p2 then
            return
        end

        local Humanoid = p2:FindFirstChild("Humanoid")

        if not Humanoid then
            return
        end

        local PrimaryPart = p2.PrimaryPart

        if not PrimaryPart then
            return
        end

        Humanoid.Jump = false
        Humanoid.AutoRotate = false

        if p3.X > 15 then
            p3 = Vector3.new(16, p3.Y, p3.Z)
        end

        if p3.Z > 15 then
            p3 = Vector3.new(p3.X, p3.Y, 16)
        end

        PrimaryPart.RotVelocity = Vector3.new(p3.Z / 5, 0, -p3.X / 5)
        PrimaryPart.Velocity = Vector3.new(p3.X, 4, p3.Z) * 2.2
        Humanoid.PlatformStand = true
        task.wait(1.5)
        PrimaryPart.Velocity = Vector3.new()
        PrimaryPart.RotVelocity = Vector3.new()
        Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        Humanoid.AutoRotate = true
        Humanoid.PlatformStand = false
    end
}
