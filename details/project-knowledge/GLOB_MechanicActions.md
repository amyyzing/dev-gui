-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[2]:GetChildren()[1]:GetChildren()[6]:GetChildren()[1]:GetChildren()[3]
-- Took 0.12s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- Decompiled using ByteFall
-- discord.gg/bytefall
return {
    MoveAnimation = function(p1, p2, p3, p4, p5)
        if p1:LoadAnimation(p2) and not p1.CFrameAnimationMove then
            p1.CFrameAnimationMove = true

            local v6 = p1.ActiveAnimations[p2]
            local Character = p1.Variables.LP.Character
            local HumanoidRootPart = Character.HumanoidRootPart

            if not v6.IsPlaying and Character.Humanoid:GetState() ~= Enum.HumanoidStateType.FallingDown and Character.Humanoid.PlatformStand == false then
                local n1 = v6.Length / p3
                local n2 = ((HumanoidRootPart.CFrame * p4 + p5).Position - HumanoidRootPart.CFrame.Position) / n1
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

                local v13 = Vector2.new
                local v14 = math.floor(n2.X + 0.5)
                local v15 = math.floor(n2.Z + 0.5)

                LinearVelocity.PlaneVelocity = v13(v14, v15)
                LinearVelocity.Enabled = true
                v6:Play(nil, nil, p3)
                task.delay(n1, function()
                    Character.Humanoid.AutoRotate = true
                    LinearVelocity:Destroy()
                    Attachment:Destroy()
                end)
            end

            p1.CFrameAnimationMove = false
        end
    end,
    IdleInPlace = function(p6)
        local t1 = { WalkAnim = true, RunAnim = true }
        local Character = p6.Variables.LP.Character

        if Character and Character:FindFirstChild("Humanoid") then
            for _, v in pairs(Character.Humanoid.Animator:GetPlayingAnimationTracks()) do
                if t1[v.Name] then
                    v:Stop()
                end
            end
        end
    end,
    LoadAnimation = function(p7, p8)
        local v23 = game.ReplicatedStorage.Assets.Storage.Animations:FindFirstChild(p8, true)

        if not v23 then
            v23 = p7.Variables.GlobalVariables:GetItemAsset(p8)

            if v23 then
                v23 = v23:FindFirstChild("SourceItem")
            end
        end

        if not p7.ActiveAnimations[p8] and v23 and p7.Variables.LP.Character then
            p7.ActiveAnimations[p8] = p7.Variables.LP.Character:WaitForChild("Humanoid"):LoadAnimation(v23)
        end

        return p7.ActiveAnimations[p8]
    end,
    PlayAnimation = function(p9, p10, p11, p12, p13, p14)
        local v30 = p9:LoadAnimation(p10)

        if v30 then
            if p14 then
                v30.Looped = true
            end

            p9.ActiveAnimations[p10]:Play(p13, p12, p11 or 1)

            return true
        end

        return false
    end,
    StopAnimation = function(p15, p16)
        if p15.ActiveAnimations[p16] ~= nil and p15.Variables.LP.Character then
            p15.ActiveAnimations[p16]:Stop()
        end
    end,
    StopAnimationThatStartsWith = function(p17, p18)
        local v35 = string.len(p18)

        for k, _ in pairs(p17.ActiveAnimations) do
            local v38 = string.sub(k, 1, v35)

            if p18 == v38 then
                p17:StopAnimation(k)
                p17.Variables.GlobalVariables:StopPropAnimation(p17.Variables.LP.Character)
            end
        end
    end,
    StopAssetAnimation = function(p19)
        p19:StopAnimationThatStartsWith("ANIMAT_")
        p19:StopAnimationThatStartsWith("FIRSTD_")
    end,
    PlaySyncedAnimation = function(p20, p21, p22)
        local v43 = p20:LoadAnimation(p21)

        if v43 then
            v43.Looped = true

            local v44 = game.Workspace:GetServerTimeNow()
            local v45 = v43.Length
            local n1 = 0

            if v45 > 0 then
                n1 = (v44 - p22) % v45
            end

            v43:Play(0, 1, 1)
            v43.TimePosition = n1

            return true
        end

        return false
    end,
    PlaySyncedAnimationForLeader = function(p23, p24, p25)
        if p23:PlayAnimation(p24, 1, 1, 0, true) then
            local v50 = game.Workspace:GetServerTimeNow()

            game.ReplicatedStorage.ReEvent:FireServer("StartSyncAnimation", p24, v50, p25)

            return true
        end

        return false
    end,
    ToggleEndAnimationButton = function(p26, p27)
        p26.Variables.GUIModules.EndAnimation:Initialize(p27)

        if p27 then
            p26.Variables.GUIModules.LiveControls:Update()

            return
        end

        task.delay(0.5, function()
            if p26.Variables.GUIModules.LiveControls then
                p26.Variables.GUIModules.LiveControls:Update()
            end
        end)
    end,
    ShowWagerWarning = function(p28, p29)
        p28.Variables.GUIModules.DuelWagerWarning:Initialize(true, p29)
    end,
    HideWagerWarning = function(p30)
        p30.Variables.GUIModules.DuelWagerWarning:Initialize(false)
    end,
    IsPlayingAssetAnimation = function(p31)
        for k, v in pairs(p31.ActiveAnimations) do
            if (string.sub(k, 1, 6) == "ANIMAT" or string.sub(k, 1, 6) == "FIRSTD") and v.IsPlaying then
                return true
            end
        end

        return false
    end,
    CameraFocusSoundSyncedAnimation = function(p32)
        local Camera = p32.Variables.Camera.Camera

        if not Camera then
            return
        end

        local LP = nil

        if p32.Variables.Camera.ActiveState ~= "PlayerView" then
            for k, _ in pairs(p32.SyncedAnimations) do
                if k == p32.Variables.LP.Name then
                    LP = p32.Variables.LP
                end
            end
        elseif Camera.CameraSubject then
            local v64 = game:GetService("Players"):GetPlayerFromCharacter(Camera.CameraSubject.Parent)

            if v64 then
                LP = v64
            end
        end

        for k, v in pairs(p32.SyncedAnimations) do
            if not LP then
                v:Unmute()
            elseif k == LP.Name then
                v:Unmute()
            else
                v:Mute()
            end
        end
    end,
    PlaySoundSyncedAnimation = function(p33, p34, p35, p36, p37)
        if p33.SyncedAnimations[p34.Name] then
            return
        end

        p33.SyncedAnimations[p34.Name] = p33.Variables.Functions.Celebrations:CreateSoundCelebrationPromise(p34, p35, p36, p37)
        p33:CameraFocusSoundSyncedAnimation()
    end,
    StopSoundSyncedAnimation = function(p38, p39)
        if p38.SyncedAnimations[p39] then
            p38.SyncedAnimations[p39]:Destroy()
            p38.SyncedAnimations[p39] = nil
        end
    end,
    ResetAllAnimations = function(p40)
        for _, v in pairs(p40.ActiveAnimations) do
            v:Stop()
        end

        for _, v in pairs(p40.ActiveTeamAnimations) do
            v:Stop()
        end

        for k, v in pairs(p40.SyncedAnimations) do
            v:Destroy()
            p40.SyncedAnimations[k] = nil
        end
    end,
    ClearAnimations = function(p41)
        p41:ResetAllAnimations()
        p41.ActiveAnimations = {}
        p41.CachedAnimationLength = {}
        p41.SyncedAnimations = {}
        p41:ResetBallHoldingAnimations()
    end,
    LoadTeamAnimation = function(p42, p43, p44)
        if not p42.ActiveTeamAnimations[p43 .. p44] then
            local v85 = nil
            local v86 = p42.Variables.GlobalVariables:GetItemAsset(p43)

            if v86 then
                v85 = v86.SourceItem:FindFirstChild(p44)
            end

            if not p42.ActiveTeamAnimations[p43 .. p44] and v85 and p42.Variables.LP.Character then
                p42.ActiveTeamAnimations[p43 .. p44] = p42.Variables.LP.Character:WaitForChild("Humanoid"):LoadAnimation(v85)
            end
        end

        return p42.ActiveTeamAnimations[p43 .. p44]
    end,
    PlayTeamAnimation = function(p45, p46, p47, p48, p49, p50, p51)
        local v94 = p45:LoadTeamAnimation(p46, p47)

        if v94 then
            if p51 then
                v94.Looped = true
            end

            p45.ActiveTeamAnimations[p46 .. p47]:Play(p50, p49, p48 or 1)
        end
    end,
    StopTeamAnimation = function(p52, p53, p54)
        if p52.ActiveTeamAnimations[p53 .. p54] ~= nil and p52.Variables.LP.Character then
            p52.ActiveTeamAnimations[p53 .. p54]:Stop()
        end
    end,
    ResetAllDirectionalAnimations = function(p55)
        for _, v in pairs(p55.ActiveAnimations) do
            local v101 = string.match
            local v102 = string.lower
            local v103 = tostring(v)
            local v104 = v102(v103)

            if v101(v104, "directional") then
                v:Stop()
            end
        end
    end,
    PlayDirectionalAnimation = function(p56, p57)
        for _, v in pairs(p56.ActiveAnimations) do
            if v ~= p57 and string.match(string.lower((tostring(v))), "directional") then
                v:AdjustWeight(0, 0.3)
            end
        end

        if not p57 then
            return
        end

        if p56.Directional.Back == true and p56.Directional.Forward == true or p56.Directional.Right == true and p56.Directional.Left == true then
            local v109 = tostring(p57)

            p56:StopAnimation(v109)

            return
        end

        local v110 = p56.ActiveAnimations
        local v111 = tostring(p57)

        v110[v111]:Play()

        local v112 = p56.ActiveAnimations
        local v113 = tostring(p57)

        v112[v113]:AdjustWeight(1, 0.3)
    end,
    ResetBallHoldingAnimations = function(p58)
        p58:LoadAnimation("UF_QuarterbackDirectionalIdle")
        p58:LoadAnimation("UF_QuarterbackDirectionalBackLeft")
        p58:LoadAnimation("UF_QuarterbackDirectionalBackRight")
        p58:LoadAnimation("UF_QuarterbackDirectionalBackward")
        p58:LoadAnimation("UF_QuarterbackDirectionalForward")
        p58:LoadAnimation("UF_QuarterbackDirectionalForwardLeft")
        p58:LoadAnimation("UF_QuarterbackDirectionalForwardRight")
        p58:LoadAnimation("UF_QuarterbackDirectionalLeft")
        p58:LoadAnimation("UF_QuarterbackDirectionalRight")
        p58:LoadAnimation("UF_QuarterbackSlide")
        p58:LoadAnimation("UF_QuarterbackKneel")
        p58:LoadAnimation("UF_QuarterbackThrow")
        p58:LoadAnimation("UF_QuarterbackThrowRunning")

        for _, v in pairs({
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
            if p58.ActiveAnimations[v] ~= nil and p58.Variables.LP.Character then
                p58.ActiveAnimations[v]:AdjustWeight(0)
            end
        end
    end,
    UpdateMovement = function(p59)
        if p59.BallEquipped and p59.BallEquipType == p59.DEF_QUARTERBACK then
            if p59.Directional.Back and not p59.Directional.Left and not p59.Directional.Right then
                p59:PlayDirectionalAnimation(p59.ActiveAnimations.UF_QuarterbackDirectionalBackward)

                return
            end

            if p59.Directional.Back and p59.Directional.Left and not p59.Directional.Right then
                p59:PlayDirectionalAnimation(p59.ActiveAnimations.UF_QuarterbackDirectionalBackLeft)

                return
            end

            if p59.Directional.Back and not p59.Directional.Left and p59.Directional.Right then
                p59:PlayDirectionalAnimation(p59.ActiveAnimations.UF_QuarterbackDirectionalBackRight)

                return
            end

            if p59.Directional.Left and not p59.Directional.Back and not p59.Directional.Forward then
                p59:PlayDirectionalAnimation(p59.ActiveAnimations.UF_QuarterbackDirectionalLeft)

                return
            end

            if p59.Directional.Left and not p59.Directional.Back and p59.Directional.Forward then
                p59:PlayDirectionalAnimation(p59.ActiveAnimations.UF_QuarterbackDirectionalForwardLeft)

                return
            end

            if p59.Directional.Right and not p59.Directional.Back and not p59.Directional.Forward then
                p59:PlayDirectionalAnimation(p59.ActiveAnimations.UF_QuarterbackDirectionalRight)

                return
            end

            if p59.Directional.Right and not p59.Directional.Back and p59.Directional.Forward then
                p59:PlayDirectionalAnimation(p59.ActiveAnimations.UF_QuarterbackDirectionalForwardRight)

                return
            end

            if p59.Directional.Forward and not p59.Directional.Left and not p59.Directional.Right then
                p59:PlayDirectionalAnimation(p59.ActiveAnimations.UF_QuarterbackDirectionalForward)

                return
            end

            p59:PlayDirectionalAnimation("UF_QuarterbackDirectionalIdle")

            return
        end

        p59:PlayDirectionalAnimation(nil)
    end,
    PreAnimationDisplayRequest = function(p60, p61)
        local u120 = false

        if p61 == p60.Variables.GlobalVariables.RANDOMIZE_ITEM_NAME then
            u120 = true

            local v121 = p60.Variables.PlayerData[p60.Variables.LP.Name]

            if not v121 then
                return
            end

            local v122 = p60.Variables.GlobalVariables:ProfileGetItemsOfType(v121, "Animation")

            for _, v in ipairs(p60.Variables.GlobalVariables:ProfileGetItemsOfType(v121, "FirstDownAnimation")) do
                table.insert(v122, v)
            end

            local t2 = {}

            for _, v in ipairs(v122) do
                if v.ItemName and string.sub(v.ItemName, 1, 6) ~= "TEAMDA" then
                    table.insert(t2, v.ItemName)
                end
            end

            if #t2 <= 0 then
                p60.Variables.Functions.GUIInterfaces:Notification("FAILED TO USE ANIMATION", "You do not have any usable animations!")

                return
            end

            local v128 = math.random(1, #t2)

            p61 = t2[v128]
        end

        if not p60.ActiveAnimations[p61] then
            p60:LoadAnimation(p61)
        end

        local v129 = p60.ActiveAnimations[p61].Length
        local v130 = os.time()

        while v129 == 0 and v130 - v130 < 3 do
            task.wait()
            v129 = p60.ActiveAnimations[p61].Length
        end

        if v129 == 0 then
            warn("failed to load animation time")

            return
        end

        game.ReplicatedStorage.ReEvent:FireServer("AnimationDisplayRequest", p61, v129, u120)
    end
}
