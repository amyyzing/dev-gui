-- Script Path: game:GetService("ReplicatedStorage").Assets.Modules.Client.Mechanics.Modules.General.MECH_Animations

return {
    MoveAnimation = function(p1, p2, p3, p4, p5) --[[ MoveAnimation | Line: 10 ]]
        if not p1:LoadAnimation(p2) or p1.CFrameAnimationMove then
            return
        end

        p1.CFrameAnimationMove = true

        local v1 = p1.ActiveAnimations[p2]
        local Character = p1.Variables.LP.Character
        local HumanoidRootPart = Character.HumanoidRootPart

        if not v1.IsPlaying and (Character.Humanoid:GetState() ~= Enum.HumanoidStateType.FallingDown and Character.Humanoid.PlatformStand == false) then
            local v2 = v1.Length / p3
            local v4 = ((HumanoidRootPart.CFrame * p4 + p5).Position - HumanoidRootPart.CFrame.Position) / v2
            local Attachment = Instance.new("Attachment")

            Attachment.Parent = HumanoidRootPart
            Attachment.WorldPosition = HumanoidRootPart.AssemblyCenterOfMass
            Character.Humanoid.AutoRotate = false

            local LinearVelocity = Instance.new("LinearVelocity")

            LinearVelocity.Attachment0 = Attachment
            LinearVelocity.Parent = HumanoidRootPart
            LinearVelocity.MaxForce = 10000
            LinearVelocity.VelocityConstraintMode = Enum.VelocityConstraintMode.Plane
            LinearVelocity.PrimaryTangentAxis = Vector3.new(1, 0, 0)
            LinearVelocity.SecondaryTangentAxis = Vector3.new(0, 0, 1)
            LinearVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
            LinearVelocity.PlaneVelocity = Vector2.new(math.floor(v4.X + 0.5), (math.floor(v4.Z + 0.5)))
            LinearVelocity.Enabled = true
            v1:Play(nil, nil, p3)
            task.delay(v2, function() --[[ Line: 39 | Upvalues: Character (copy), LinearVelocity (copy), Attachment (copy) ]]
                Character.Humanoid.AutoRotate = true
                LinearVelocity:Destroy()
                Attachment:Destroy()
            end)
        end

        p1.CFrameAnimationMove = false
    end,
    IdleInPlace = function(p1) --[[ IdleInPlace | Line: 49 ]]
        local t = {
            WalkAnim = true,
            RunAnim = true
        }
        local Character = p1.Variables.LP.Character

        if not (Character and Character:FindFirstChild("Humanoid")) then
            return
        end

        for k, v in pairs(Character.Humanoid.Animator:GetPlayingAnimationTracks()) do
            if t[v.Name] then
                v:Stop()
            end
        end
    end,
    LoadAnimation = function(p1, p2) --[[ LoadAnimation | Line: 65 ]]
        local v1 = game.ReplicatedStorage.Assets.Storage.Animations:FindFirstChild(p2, true)

        if not v1 then
            local v2 = p1.Variables.GlobalVariables:GetItemAsset(p2)

            v1 = v2 and v2:FindFirstChild("SourceItem")
        end

        if not p1.ActiveAnimations[p2] and (v1 and p1.Variables.LP.Character) then
            p1.ActiveAnimations[p2] = p1.Variables.LP.Character:WaitForChild("Humanoid"):LoadAnimation(v1)
        end

        return p1.ActiveAnimations[p2]
    end,
    PlayAnimation = function(p1, p2, p3, p4, p5, p6) --[[ PlayAnimation | Line: 79 ]]
        local v1 = p1:LoadAnimation(p2)

        if not v1 then
            return false
        end

        if not p6 then
            p1.ActiveAnimations[p2]:Play(p5, p4, p3 or 1)

            return true
        end

        v1.Looped = true
        p1.ActiveAnimations[p2]:Play(p5, p4, p3 or 1)

        return true
    end,
    StopAnimation = function(p1, p2) --[[ StopAnimation | Line: 91 ]]
        if p1.ActiveAnimations[p2] == nil or not p1.Variables.LP.Character then
            return
        end

        p1.ActiveAnimations[p2]:Stop()
    end,
    StopAnimationThatStartsWith = function(p1, p2) --[[ StopAnimationThatStartsWith | Line: 97 ]]
        local v1 = string.len(p2)

        for k, v in pairs(p1.ActiveAnimations) do
            if string.sub(k, 1, v1) == p2 then
                p1:StopAnimation(k)
                p1.Variables.GlobalVariables:StopPropAnimation(p1.Variables.LP.Character)
            end
        end
    end,
    StopAssetAnimation = function(p1) --[[ StopAssetAnimation | Line: 107 ]]
        p1:StopAnimationThatStartsWith("ANIMAT_")
        p1:StopAnimationThatStartsWith("FIRSTD_")
    end,
    PlaySyncedAnimation = function(p1, p2, p3) --[[ PlaySyncedAnimation | Line: 113 ]]
        local v1 = p1:LoadAnimation(p2)

        if not v1 then
            return false
        end

        v1.Looped = true

        local v2 = game.Workspace:GetServerTimeNow() - p3
        local Length = v1.Length

        v1:Play(0, 1, 1)
        v1.TimePosition = if Length > 0 then v2 % Length else 0

        return true
    end,
    PlaySyncedAnimationForLeader = function(p1, p2, p3) --[[ PlaySyncedAnimationForLeader | Line: 133 ]]
        if p1:PlayAnimation(p2, 1, 1, 0, true) then
            game.ReplicatedStorage.ReEvent:FireServer("StartSyncAnimation", p2, game.Workspace:GetServerTimeNow(), p3)

            return true
        end

        return false
    end,
    ToggleEndAnimationButton = function(p1, p2) --[[ ToggleEndAnimationButton | Line: 143 ]]
        p1.Variables.GUIModules.EndAnimation:Initialize(p2)

        if p2 then
            p1.Variables.GUIModules.LiveControls:Update()
        else
            task.delay(0.5, function() --[[ Line: 148 | Upvalues: p1 (copy) ]]
                if not p1.Variables.GUIModules.LiveControls then
                    return
                end

                p1.Variables.GUIModules.LiveControls:Update()
            end)
        end
    end,
    ShowWagerWarning = function(p1, p2) --[[ ShowWagerWarning | Line: 156 ]]
        p1.Variables.GUIModules.DuelWagerWarning:Initialize(true, p2)
    end,
    HideWagerWarning = function(p1) --[[ HideWagerWarning | Line: 160 ]]
        p1.Variables.GUIModules.DuelWagerWarning:Initialize(false)
    end,
    IsPlayingAssetAnimation = function(p1) --[[ IsPlayingAssetAnimation | Line: 164 ]]
        for k, v in pairs(p1.ActiveAnimations) do
            if (string.sub(k, 1, 6) == "ANIMAT" or string.sub(k, 1, 6) == "FIRSTD") and v.IsPlaying then
                return true
            end
        end

        return false
    end,
    CameraFocusSoundSyncedAnimation = function(p1) --[[ CameraFocusSoundSyncedAnimation | Line: 174 ]]
        local Camera = p1.Variables.Camera.Camera

        if not Camera then
            return
        end

        local v1 = nil

        if p1.Variables.Camera.ActiveState == "PlayerView" then
            if Camera.CameraSubject then
                local v2 = game:GetService("Players"):GetPlayerFromCharacter(Camera.CameraSubject.Parent)

                if v2 then
                    v1 = v2
                end
            end
        else
            for k, v in pairs(p1.SyncedAnimations) do
                if k == p1.Variables.LP.Name then
                    v1 = p1.Variables.LP
                end
            end
        end

        for k, v in pairs(p1.SyncedAnimations) do
            if v1 then
                if k == v1.Name then
                    v:Unmute()

                    continue
                end

                v:Mute()

                continue
            end

            v:Unmute()
        end
    end,
    PlaySoundSyncedAnimation = function(p1, p2, p3, p4, p5) --[[ PlaySoundSyncedAnimation | Line: 212 ]]
        if not p1.SyncedAnimations[p2.Name] then
            p1.SyncedAnimations[p2.Name] = p1.Variables.Functions.Celebrations:CreateSoundCelebrationPromise(p2, p3, p4, p5)
            p1:CameraFocusSoundSyncedAnimation()
        end
    end,
    StopSoundSyncedAnimation = function(p1, p2) --[[ StopSoundSyncedAnimation | Line: 222 ]]
        if not p1.SyncedAnimations[p2] then
            return
        end

        p1.SyncedAnimations[p2]:Destroy()
        p1.SyncedAnimations[p2] = nil
    end,
    ResetAllAnimations = function(p1) --[[ ResetAllAnimations | Line: 229 ]]
        for k, v in pairs(p1.ActiveAnimations) do
            v:Stop()
        end

        for k, v in pairs(p1.ActiveTeamAnimations) do
            v:Stop()
        end

        for k, v in pairs(p1.SyncedAnimations) do
            v:Destroy()
            p1.SyncedAnimations[k] = nil
        end
    end,
    ClearAnimations = function(p1) --[[ ClearAnimations | Line: 243 ]]
        p1:ResetAllAnimations()
        p1.ActiveAnimations = {}
        p1.CachedAnimationLength = {}
        p1.SyncedAnimations = {}
        p1:ResetBallHoldingAnimations()
    end,
    LoadTeamAnimation = function(p1, p2, p3) --[[ LoadTeamAnimation | Line: 251 ]]
        if not p1.ActiveTeamAnimations[p2 .. p3] then
            local v1 = p1.Variables.GlobalVariables:GetItemAsset(p2)
            local v2 = if v1 then v1.SourceItem:FindFirstChild(p3) else nil

            if not p1.ActiveTeamAnimations[p2 .. p3] and (v2 and p1.Variables.LP.Character) then
                p1.ActiveTeamAnimations[p2 .. p3] = p1.Variables.LP.Character:WaitForChild("Humanoid"):LoadAnimation(v2)
            end
        end

        return p1.ActiveTeamAnimations[p2 .. p3]
    end,
    PlayTeamAnimation = function(p1, p2, p3, p4, p5, p6, p7) --[[ PlayTeamAnimation | Line: 265 ]]
        local v1 = p1:LoadTeamAnimation(p2, p3)

        if not v1 then
            return
        end

        if p7 then
            v1.Looped = true
        end

        p1.ActiveTeamAnimations[p2 .. p3]:Play(p6, p5, p4 or 1)
    end,
    StopTeamAnimation = function(p1, p2, p3) --[[ StopTeamAnimation | Line: 275 ]]
        if p1.ActiveTeamAnimations[p2 .. p3] == nil or not p1.Variables.LP.Character then
            return
        end

        p1.ActiveTeamAnimations[p2 .. p3]:Stop()
    end,
    ResetAllDirectionalAnimations = function(p1) --[[ ResetAllDirectionalAnimations | Line: 281 ]]
        for k, v in pairs(p1.ActiveAnimations) do
            if string.match(string.lower((tostring(v))), "directional") then
                v:Stop()
            end
        end
    end,
    PlayDirectionalAnimation = function(p1, p2) --[[ PlayDirectionalAnimation | Line: 289 ]]
        for k, v in pairs(p1.ActiveAnimations) do
            if v ~= p2 and string.match(string.lower((tostring(v))), "directional") then
                v:AdjustWeight(0, 0.3)
            end
        end

        if not p2 then
            return
        end

        if (p1.Directional.Back ~= true or p1.Directional.Forward ~= true) and (p1.Directional.Right ~= true or p1.Directional.Left ~= true) then
            p1.ActiveAnimations[tostring(p2)]:Play()
            p1.ActiveAnimations[tostring(p2)]:AdjustWeight(1, 0.3)

            return
        end

        p1:StopAnimation((tostring(p2)))
    end,
    ResetBallHoldingAnimations = function(p1) --[[ ResetBallHoldingAnimations | Line: 306 ]]
        p1:LoadAnimation("UF_QuarterbackDirectionalIdle")
        p1:LoadAnimation("UF_QuarterbackDirectionalBackLeft")
        p1:LoadAnimation("UF_QuarterbackDirectionalBackRight")
        p1:LoadAnimation("UF_QuarterbackDirectionalBackward")
        p1:LoadAnimation("UF_QuarterbackDirectionalForward")
        p1:LoadAnimation("UF_QuarterbackDirectionalForwardLeft")
        p1:LoadAnimation("UF_QuarterbackDirectionalForwardRight")
        p1:LoadAnimation("UF_QuarterbackDirectionalLeft")
        p1:LoadAnimation("UF_QuarterbackDirectionalRight")
        p1:LoadAnimation("UF_QuarterbackSlide")
        p1:LoadAnimation("UF_QuarterbackKneel")
        p1:LoadAnimation("UF_QuarterbackThrow")
        p1:LoadAnimation("UF_QuarterbackThrowRunning")

        for k, v in pairs({
            "UF_QuarterbackDirectionalIdle",
            "UF_QuarterbackDirectionalBackLeft",
            "UF_QuarterbackDirectionalBackRight",
            "UF_QuarterbackDirectionalBackward",
            "UF_QuarterbackDirectionalForward",
            "UF_QuarterbackDirectionalForwardLeft",
            "UF_QuarterbackDirectionalForwardRight",
            "UF_QuarterbackDirectionalLeft",
            "UF_QuarterbackDirectionalRight",
            "UF_BallHold_Quarterback",
            "UF_BallHold_Runner",
            "UF_BallHold_Punter",
            "UF_Quarterback_PreSnap"
        }) do
            if p1.ActiveAnimations[v] ~= nil and p1.Variables.LP.Character then
                p1.ActiveAnimations[v]:AdjustWeight(0)
            end
        end
    end,
    UpdateMovement = function(p1) --[[ UpdateMovement | Line: 343 ]]
        if p1.BallEquipped and p1.BallEquipType == p1.DEF_QUARTERBACK then
            if p1.Directional.Back and not (p1.Directional.Left or p1.Directional.Right) then
                p1:PlayDirectionalAnimation(p1.ActiveAnimations.UF_QuarterbackDirectionalBackward)

                return
            end

            if p1.Directional.Back and (p1.Directional.Left and not p1.Directional.Right) then
                p1:PlayDirectionalAnimation(p1.ActiveAnimations.UF_QuarterbackDirectionalBackLeft)

                return
            end

            if p1.Directional.Back and (not p1.Directional.Left and p1.Directional.Right) then
                p1:PlayDirectionalAnimation(p1.ActiveAnimations.UF_QuarterbackDirectionalBackRight)

                return
            end

            if p1.Directional.Left and not (p1.Directional.Back or p1.Directional.Forward) then
                p1:PlayDirectionalAnimation(p1.ActiveAnimations.UF_QuarterbackDirectionalLeft)

                return
            end

            if p1.Directional.Left and (not p1.Directional.Back and p1.Directional.Forward) then
                p1:PlayDirectionalAnimation(p1.ActiveAnimations.UF_QuarterbackDirectionalForwardLeft)

                return
            end

            if p1.Directional.Right and not (p1.Directional.Back or p1.Directional.Forward) then
                p1:PlayDirectionalAnimation(p1.ActiveAnimations.UF_QuarterbackDirectionalRight)

                return
            end

            if p1.Directional.Right and (not p1.Directional.Back and p1.Directional.Forward) then
                p1:PlayDirectionalAnimation(p1.ActiveAnimations.UF_QuarterbackDirectionalForwardRight)

                return
            end

            if p1.Directional.Forward and not (p1.Directional.Left or p1.Directional.Right) then
                p1:PlayDirectionalAnimation(p1.ActiveAnimations.UF_QuarterbackDirectionalForward)

                return
            end

            p1:PlayDirectionalAnimation("UF_QuarterbackDirectionalIdle")
        else
            p1:PlayDirectionalAnimation(nil)
        end
    end,
    PreAnimationDisplayRequest = function(p1, p2) --[[ PreAnimationDisplayRequest | Line: 378 ]]
        local v1

        if p2 == p1.Variables.GlobalVariables.RANDOMIZE_ITEM_NAME then
            v1 = true

            local v2 = p1.Variables.PlayerData[p1.Variables.LP.Name]

            if not v2 then
                return
            end

            local v3 = p1.Variables.GlobalVariables:ProfileGetItemsOfType(v2, "Animation")

            for i, v in ipairs(p1.Variables.GlobalVariables:ProfileGetItemsOfType(v2, "FirstDownAnimation")) do
                table.insert(v3, v)
            end

            local t = {}

            for i, v in ipairs(v3) do
                if v.ItemName and string.sub(v.ItemName, 1, 6) ~= "TEAMDA" then
                    table.insert(t, v.ItemName)
                end
            end

            if #t <= 0 then
                p1.Variables.Functions.GUIInterfaces:Notification("FAILED TO USE ANIMATION", "You do not have any usable animations!")

                return
            end

            p2 = t[math.random(1, #t)]
        else
            v1 = false
        end

        if not p1.ActiveAnimations[p2] then
            p1:LoadAnimation(p2)
        end

        local Length = p1.ActiveAnimations[p2].Length
        local v4 = os.time()

        while Length == 0 and v4 - v4 < 3 do
            task.wait()
            Length = p1.ActiveAnimations[p2].Length
        end

        if Length == 0 then
            warn("failed to load animation time")
        else
            game.ReplicatedStorage.ReEvent:FireServer("AnimationDisplayRequest", p2, Length, v1)
        end
    end
}
