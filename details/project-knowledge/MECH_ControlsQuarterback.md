-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[2]:GetChildren()[1]:GetChildren()[6]:GetChildren()[1]:GetChildren()[38]
-- Took 0.24s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- Decompiled using ByteFall
-- discord.gg/bytefall
local u1 = nil

local function _getCachedAutoThrowingAbTest(p1)
    if u1 == nil then
        local v4, v5 = p1.Variables.ABTest.GetExperimentVariables("uf-auto-throw"):await()

        if v4 and v5 ~= nil then
            u1 = v5
        end
    end

    return u1
end

return {
    ResetQuarterbackArrows = function(p2)
        for v7 in pairs(p2.DirectionBeam) do
            p2:SetDirectionBeamTarget(v7, nil)
        end
    end,
    UpdatedQuarterbackPad = function(p3)
        local v9, v10 = p3.Variables.ABTest.GetExperimentVariables("uf-quarterback-ux"):await()

        if not v9 or not (p3.Variables.Functions.PlayerData:GetInstallDate() >= v10["install-cohort-date"]) or not v10["qb-pad-enabled"] then
            return
        end

        local v11 = p3.Variables.CurrentGameSettings or p3.Variables.CurrentMiniSettings
        local v12 = v11.GameInstance.Value.Replicated.QuarterbackPad
        local TeamIDValue = p3.Variables.LP.Replicated.TeamID.Value
        local u14 = TeamIDValue == v11.GameStatus.Offense.Value
        local u15 = p3.Variables.GlobalVariables:GetPlayerFromObjectValue(v11.GameStatus.ActiveQuarterback) == nil
        local v16 = p3.Variables.GlobalVariables:GetTeamPlayers(v11, TeamIDValue)

        for _, v in pairs(v16) do
            local vName = v11.Positions[TeamIDValue].Quarterbacks:FindFirstChild(v.Name)

            if not vName then
                vName = true

                if #v11.Positions[TeamIDValue].Quarterbacks:GetChildren() ~= 0 then
                    vName = p3.Variables.Functions.MutationsMode:IsMutationActive("GameRule_AllQBs")
                end
            end

            if v12.Transparency == 0.25 and vName and u14 and u15 then
                v12.Color = Color3.fromRGB(255, 102, 0)
                v12.Emitter.Enabled = true
                v12.Billboard.Enabled = true
                v12.Billboard.ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
                v12.Billboard.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

                local v20 = p3.Variables.Mechanics
                local vector3 = Vector3.new(0, v12.Size.Y / 2, 0)

                v20:SetDirectionBeamTarget(v, v12, vector3)
            else
                if u15 and u14 then
                    v12.Billboard.ImageLabel.ImageColor3 = Color3.fromRGB(200, 200, 200)
                    v12.Billboard.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                    v12.Billboard.Enabled = true
                else
                    v12.Billboard.ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
                    v12.Billboard.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    v12.Billboard.Enabled = false
                end

                v12.Color = Color3.fromRGB(79, 26, 0)
                v12.Emitter.Enabled = false
                v12.Emitter:Clear()
                p3.Variables.Mechanics:SetDirectionBeamTarget(v, nil)
            end
        end
    end,
    GetClosestReceiverNumber = function(p4)
        local vector2 = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
        local v24 = nil
        local n1 = math.huge

        for k, v in pairs(p4.Variables.ThrowTargets) do
            local v28 = workspace.CurrentCamera:WorldToViewportPoint(v.Box.Position)

            if v28.Z > 0 then
                local v29 = (Vector2.new(v28.X, v28.Y) - vector2).Magnitude

                if n1 > v29 and v29 < 200 then
                    n1 = v29
                    v24 = k
                end
            end
        end

        return v24
    end,
    UpdateControllerTargeting = function(p5)
        for _, v in pairs(p5.Variables.ThrowTargets) do
            v.Billboard.Number.Enabled = false
        end

        local v33 = p5:GetClosestReceiverNumber()

        if v33 then
            p5.MostRecentThrowNumber = v33
            p5.MostRecentThrowPlayer = p5.Variables.ThrowTargets[v33].Box.Name

            local v34 = p5.Variables.ThrowTargets[v33]

            v34.Billboard.Number.Enabled = true
            v34.Billboard.Number.ControllerKeybind.Image = p5.Variables.GlobalVariables:GetControllerButtonImage("ButtonR2")
        end
    end,
    CheckAutoThrowEnabled = function(p6)
        local v36 = p6.Variables.CurrentGameSettings or p6.Variables.CurrentMiniSettings

        if u1 == nil then
            local v37, v38 = p6.Variables.ABTest.GetExperimentVariables("uf-auto-throw"):await()

            if v37 and v38 ~= nil then
                u1 = v38
            end
        end

        local v39 = u1
        local u40 = false

        if v39 ~= nil then
            u40 = v39.enabled
        end

        local u41 = false

        if v39 ~= nil then
            u41 = v39._variantName
        end

        local v42 = os.time()
        local v43 = p6.Variables.Functions.PlayerData:GetInstallDate()
        local u44 = (v42 - v43) / 86400 < v39["new-user-days"] and true
        local v45 = p6.Variables.InputType == "Mobile" and v36.MechanicsUsed.AutoThrow.Value

        if not v45 then
            if p6.Variables.InputType == "Keyboard" and u40 then
                v45 = true

                if u41 ~= "keyboard" then
                    if p6.Variables.InputType == "Controller" and u40 then
                        v45 = true

                        if u41 ~= "controller" then
                            v45 = u44
                        end
                    else
                        v45 = u44
                    end
                end
            elseif p6.Variables.InputType == "Controller" and u40 then
                v45 = true

                if u41 ~= "controller" then
                    v45 = u44
                end
            else
                v45 = u44
            end
        end

        return v45
    end,
    CheckPowerSetting = function(_)
        return true
    end,
    Handoff = function(p8, p9)
        if p8:FilterAction("Handoff") == false and not p9 then
            return
        end

        local v49 = p8.Variables.CurrentGameSettings or p8.Variables.CurrentMiniSettings

        if not v49 or not v49.MechanicsUsed.Handoff.Value then
            return
        end

        if not p9 and not p8.HandoffActive then
            p8:PlayAnimation("UF_QuarterbackHandoff")
            p8.HandoffActive = true
            p8.Variables.EventCenter:Publish("ActionToggled", "Handoff", true)
            task.wait(0.21)

            if p8.HandoffActive then
                p8:PlayAnimation("UF_QuarterbackHandoffConstant")
            end
        else
            p8:StopAnimation("UF_QuarterbackHandoff")
            p8:StopAnimation("UF_QuarterbackHandoffConstant")
            p8.HandoffActive = false
            p8.Variables.EventCenter:Publish("ActionToggled", "Handoff", false)
        end

        v49.ReEvent:FireServer("Mechanics", "Handoff", p8.HandoffActive)
    end,
    Pumpfake = function(p10)
        if p10:FilterAction("Pumpfake") == false then
            return
        end

        if not p10.Variables.CurrentGameSettings and not p10.Variables.CurrentMiniSettings or not (p10.Variables.CurrentGameSettings or p10.Variables.CurrentMiniSettings).MechanicsUsed.Throwing.Value then
            return
        end

        if p10.Variables.LP.Character:FindFirstChild("Head") and p10.PumpDebounce then
            p10.PumpDebounce = false
            p10:PlayAnimation("UF_QuarterbackThrow", 1.35)
            task.wait(1)
            p10.PumpDebounce = true
        end
    end,
    FindPlayerToThrowTo = function(p11, p12, p13)
        if p11:FilterAction("CatchHikeThrow") == false then
            return
        end

        if not p11.Variables.CurrentGameSettings and not p11.Variables.CurrentMiniSettings or not (p11.Variables.CurrentGameSettings or p11.Variables.CurrentMiniSettings).MechanicsUsed.Throwing.Value then
            return
        end

        if p11.Variables.ThrowTargets[p12] ~= nil then
            p11.MostRecentThrowPlayer = p11.Variables.ThrowTargets[p12].Box.Name
            p11.MostRecentThrowNumber = p12
            p11:FootballThrow(p11.Variables.ThrowTargets[p12], p13)
        end

        p11.ThrowDebounce = false
    end,
    GetXboxCrosshairPosition = function(p14)
        local v55 = p14.Variables.HUD.XboxCrosshair.RealDot.AbsolutePosition
        local v56 = p14.Variables.HUD.XboxCrosshair.RealDot.AbsoluteSize

        return Vector2.new(v55.X + v56.X / 2, v55.Y + v56.Y / 2)
    end,
    FootballThrow = function(p15, p16, p17)
        local v60 = p15.Variables.CurrentGameSettings or p15.Variables.CurrentMiniSettings

        if not v60 or not v60.MechanicsUsed.Throwing.Value then
            return
        end

        local v61 = p15.BallEquipped and p15.BallEquipType == p15.DEF_QUARTERBACK and p15.Variables.GlobalVariables:PlayerCanThrow(v60) and not p15.HandoffActive and p15.Variables.LP.Character:FindFirstChild("Head")

        if v61 then
            local v62 = v60.GameInstance.Value.Replicated:FindFirstChild("ScrimmageLine")
            local v63 = p15.Variables.GlobalVariables:Vector3(v60, v61.Position)
            local v64 = p15.Variables.GlobalVariables:BeyondLineOfScrimmage(v60, v63)

            if v62 and v64 then
                return
            end

            p15:PlayAnimation("UF_QuarterbackThrow", 1.35)

            if p15:CheckAutoThrowEnabled() and p16 and not p15.Variables.Mechanics.ShiftLockEnabled and p15.Variables.TestData ~= nil and game.Players.LocalPlayer.Replicated.InstallDate.Value > p15.Variables.TestData.fromInstallDate then
                local HumanoidRootPart = p15.Variables.LP.Character.HumanoidRootPart
                local v66 = p16.Box
                local v67 = CFrame.new
                local v68 = HumanoidRootPart.Position
                local vector3 = Vector3.new(v66.Position.X, v66.Position.Y, v66.Position.Z)
                local v70 = v67(v68, vector3)

                game:GetService("TweenService"):Create(HumanoidRootPart, TweenInfo.new(0.5), { CFrame = v70 }):Play()
            end

            p15.BallEquipType = p15.DEF_NOBALL
            task.wait(0.26666666666666666)

            local v71 = p15.Variables.CurrentGameSettings or p15.Variables.CurrentMiniSettings

            if not v71 then
                return
            end

            p15.THROW_INDICATOR = false

            local v72 = p15.Variables.Functions.Utilities:ScreenPointToRay(p15.PlayerMouse.X, p15.PlayerMouse.Y)
            local n1 = v72.Origin + v72.Direction * 1000

            if p15.Variables.InputType == "Mobile" and p15.WorldTapPoint then
                n1 = p15.WorldTapPoint
                p15.WorldTapPoint = nil
            elseif p15.Variables.InputType == "Controller" then
                local v74 = p15:GetXboxCrosshairPosition()
                local v75 = p15.Variables.Functions.Utilities:ScreenPointToRay(v74.X, v74.Y)

                n1 = v75.Origin + v75.Direction * 1000
            end

            local v76 = p15.BallPower

            if p17 then
                v76 = p17
            end

            local t1 = { AutoThrow = false, Target = n1, Power = v76 }

            if p15:CheckAutoThrowEnabled() and p16 and not p15.Variables.Mechanics.ShiftLockEnabled and p15.Variables.TestData ~= nil and game.Players.LocalPlayer.Replicated.InstallDate.Value > p15.Variables.TestData.fromInstallDate then
                t1.AutoThrow = true
                t1.PlayerTarget = p16.Box
            end

            v71.ReEvent:FireServer("Mechanics", "ThrowBall", t1)
            p15.Variables.Functions.Input:XboxFocus(nil)
            p15:UnequipFootball()

            return
        end
    end,
    DisplayThrowingMeter = function(p18, p19, p20)
        local v81 = p18.Variables.CurrentGameSettings or p18.Variables.CurrentMiniSettings

        if v81 and v81.AssetsUsed.PowerMeter.Value then
            if p19 and p20 ~= false and not p18.Variables.PlayerData[p18.Variables.LP.Name].ProfileData.GameplaySettings.QBRememberPower then
                local v82 = tonumber(p18.Variables.PlayerData[p18.Variables.LP.Name].ProfileData.GameplaySettings.QBStartPower)

                p18.BallPower = math.clamp(v82 or 100, p18.Variables.FootballMath.Settings.MinPower, p18.Variables.FootballMath.Settings.MaxPower)
            end

            if p18.Variables.InputType ~= "Mobile" then
                p18.Variables.MechanicsGui.ThrowingMeter.Position = UDim2.new(0.5, 0, 0.77, 0)
            elseif p18.Variables.Functions.MobileControls:GetLayoutType() == p18.Variables.Functions.MobileControls.LAYOUT_TYPES.TABLET then
                p18.Variables.MechanicsGui.ThrowingMeter.Position = UDim2.new(0.5, 0, 0.7, 0)
            else
                p18.Variables.MechanicsGui.ThrowingMeter.Position = UDim2.new(0.5, 0, 0.66, 0)
            end

            p18.Variables.MechanicsGui.ThrowingMeter.Visible = p19
            p18:DisplayPower()

            return
        end

        p18.Variables.MechanicsGui.ThrowingMeter.Visible = false
    end,
    DisplayPower = function(p21)
        for _, v in pairs(p21.Variables.MechanicsGui.ThrowingMeter.ProgressCircle:GetChildren()) do
            local v86 = v.Bit
            local v87 = string.sub(v.Name, 5, #v.Name)

            v86.BackgroundTransparency = if tonumber(v87) <= p21.BallPower then 0 else 0.9
        end

        if p21:CheckPowerSetting() then
            p21.Variables.MechanicsGui.ThrowingMeter.ProgressText.Text = math.floor(p21.BallPower)
            p21.Variables.MechanicsGui.ThrowingMeter.ProgressTierText.Text = ""
            p21.Variables.MechanicsGui.ThrowingMeter.ProgressTier.Text = ""

            return
        end

        p21.Variables.MechanicsGui.ThrowingMeter.ProgressText.Text = ""
        p21.Variables.MechanicsGui.ThrowingMeter.ProgressTierText.Text = math.floor(p21.BallPower)
        p21.Variables.MechanicsGui.ThrowingMeter.ProgressTier.Text = math.floor(p21.BallPowerTier)
    end,
    BallPowerUp = function(p22)
        if p22:FilterAction("BallPowerUp") == false then
            return
        end

        if not p22.Variables.CurrentGameSettings and not p22.Variables.CurrentMiniSettings or not (p22.Variables.CurrentGameSettings or p22.Variables.CurrentMiniSettings).AssetsUsed.PowerMeter.Value then
            return
        end

        local v89 = p22:CheckPowerSetting()

        if p22.Variables.MechanicsGui.ThrowingMeter.Visible then
            if v89 then
                local v90 = tonumber(p22.Variables.PlayerData[p22.Variables.LP.Name].ProfileData.GameplaySettings.QBChange)

                p22.BallPower = math.clamp(p22.BallPower + (v90 or 5), p22.Variables.FootballMath.Settings.MinPower, p22.Variables.FootballMath.Settings.MaxPower)
            else
                p22.BallPowerTier = math.min(p22.BallPowerTier + 1, #p22.BallPowerTiers)
                p22.BallPower = p22.BallPowerTiers[p22.BallPowerTier]
            end

            p22:DisplayPower()

            return
        end
    end,
    BallPowerDown = function(p23)
        if p23:FilterAction("BallPowerDown") == false then
            return
        end

        if not p23.Variables.CurrentGameSettings and not p23.Variables.CurrentMiniSettings or not (p23.Variables.CurrentGameSettings or p23.Variables.CurrentMiniSettings).AssetsUsed.PowerMeter.Value then
            return
        end

        local v92 = p23:CheckPowerSetting()

        if p23.Variables.MechanicsGui.ThrowingMeter.Visible then
            if v92 then
                local v93 = tonumber(p23.Variables.PlayerData[p23.Variables.LP.Name].ProfileData.GameplaySettings.QBChange)

                p23.BallPower = math.clamp(p23.BallPower - (v93 or 5), p23.Variables.FootballMath.Settings.MinPower, p23.Variables.FootballMath.Settings.MaxPower)
            else
                p23.BallPowerTier = math.max(1, p23.BallPowerTier - 1)
                p23.BallPower = p23.BallPowerTiers[p23.BallPowerTier]
            end

            p23:DisplayPower()

            return
        end
    end,
    FindNextReceiver = function(p24, p25)
        if #p24.Variables.ThrowTargets > 0 then
            local v96 = p24.MostRecentThrowNumber
            local n1 = #p24.Variables.ThrowTargets

            for _ = 1, n1 do
                v96 += p25

                if v96 <= 0 then
                    v96 = n1
                elseif v96 > n1 then
                    v96 = 1
                end

                local v99 = p24.Variables.ThrowTargets[v96]

                if v99 and v99.Box and v99.Box.Parent then
                    p24.MostRecentThrowPlayer = p24.Variables.ThrowTargets[v96].Box.Name
                    p24.MostRecentThrowNumber = v96

                    return
                end
            end
        else
            p24.MostRecentThrowNumber = 1
            p24.MostRecentThrowPlayer = nil
        end
    end,
    HasBecomeRunner = function(p26)
        p26:ReceiverIcons(false)

        if p26.CameraMoveConnection then
            p26.CameraMoveConnection:Disconnect()
            p26.CameraMoveConnection = nil
        end

        if p26.ThumbstickMoveConnection then
            p26.ThumbstickMoveConnection:Disconnect()
            p26.ThumbstickMoveConnection = nil
        end

        if p26.CameraMoveDebounce then
            p26.CameraMoveDebounce:Disconnect()
            p26.CameraMoveDebounce = nil
        end
    end,
    FocusAutoThrowIcon = function(p27, p28)
        p28.Billboard.MobileNumber.Focus.Size = UDim2.new(1, 0, 1, 0)

        if not p28.FocusTween then
            local TweenService = game.TweenService
            local v104 = p28.Billboard.MobileNumber.Focus
            local v105 = TweenInfo.new(p27.KeyTimer)

            p28.FocusTween = TweenService:Create(v104, v105, { Size = UDim2.new(0.75, 0, 0.75, 0) })
        end

        p28.Billboard.MobileNumber.Focus.Visible = true
        p28.FocusTween:Play()
    end,
    UnfocusAutoThrowIcon = function(_, p30)
        if p30.FocusTween then
            p30.FocusTween:Cancel()
        end

        p30.Billboard.MobileNumber.Focus.Size = UDim2.new(1, 0, 1, 0)
        p30.Billboard.MobileNumber.Focus.Visible = false
    end,
    ReceiverIcons = function(p31, _)
        local v110 = p31.Variables.CurrentGameInstance or p31.Variables.CurrentMiniInstance
        local v111 = p31.Variables.PlayerData[game.Players.LocalPlayer.Name]
        local v112 = v111.ProfileData.GameplaySettings.MobileAssistIconSize
        local v113 = p31:CheckAutoThrowEnabled()
        local u114 = false

        if p31.Variables.InputType == "Mobile" then
            u114 = v111.ProfileData.GameplaySettings.MobileAutoThrow

            if u114 then
                u114 = false

                if p31.Variables.TestData ~= nil then
                    u114 = game.Players.LocalPlayer.Replicated.InstallDate.Value > p31.Variables.TestData.fromInstallDate
                end
            end
        end

        local u115

        if p31.Variables.InputType == "Keyboard" then
            u115 = v113
        else
            u115 = false

            if p31.Variables.InputType == "Controller" then
                u115 = v113
            end
        end

        if not u114 and not u115 then
            for _, v in pairs(v110.Replicated.Hitboxes:GetChildren()) do
                local v118 = p31.Variables.GlobalVariables:GetPlayer(v.Name)

                if v118 and p31.BallEquipType == p31.DEF_QUARTERBACK and v118 ~= p31.Variables.LP and v118.Replicated.GameID.Value == p31.Variables.LP.Replicated.GameID.Value and v118.Replicated.TeamID.Value == p31.Variables.LP.Replicated.TeamID.Value then
                    v.Receiver.Enabled = v110
                else
                    v.Receiver.Enabled = false
                end
            end

            return
        end

        for _, v in pairs(v110.Replicated.Hitboxes:GetChildren()) do
            v.Receiver.Enabled = false
        end

        for _, v in pairs(p31.Variables.ThrowTargets) do
            if v.ClickDownEvent then
                v.ClickDownEvent:Disconnect()
            end

            if v.ClickDownEvent2 then
                v.ClickDownEvent2:Disconnect()
            end

            if v.ClickUpEvent then
                v.ClickUpEvent:Disconnect()
            end

            if v.ClickUpEvent2 then
                v.ClickUpEvent2:Disconnect()
            end

            if v.FocusTween then
                v.FocusTween = nil
            end
        end

        p31.Variables.Gui.Billboards.AutoThrow:ClearAllChildren()

        local t2 = {}

        for _, v in pairs(v110.Replicated.Hitboxes:GetChildren()) do
            local v126 = p31.Variables.GlobalVariables:GetPlayer(v.Name)

            if p31.BallEquipType == p31.DEF_QUARTERBACK and v126 ~= p31.Variables.LP and v126.Replicated.GameID.Value == p31.Variables.LP.Replicated.GameID.Value and v126.Replicated.TeamID.Value == p31.Variables.LP.Replicated.TeamID.Value then
                local v127 = game.ReplicatedStorage.Assets.Storage.ThrowNumbers
                local clone = v127:Clone()

                clone.Parent = p31.Variables.Gui.Billboards.AutoThrow
                clone.MobileNumber.Size = UDim2.new(0, v127.MobileNumber.Size.X.Offset * v112, 0, v127.MobileNumber.Size.Y.Offset * v112)
                clone.MobileNumber.Enabled = false
                clone.Number.Size = UDim2.new(0, v127.Number.Size.X.Offset * v112, 0, v127.Number.Size.Y.Offset * v112)
                clone.Number.Enabled = false
                clone.MobileNumber.Adornee = v
                clone.Number.Adornee = v
                table.insert(t2, {
                    IsActive = true,
                    SelectingDown = false,
                    ClickUpEvent = false,
                    ClickDownEvent = false,
                    ClickUpEvent2 = false,
                    ClickDownEvent2 = false,
                    FocusTween = nil,
                    Box = v,
                    Billboard = clone
                })
            end
        end

        table.sort(t2, function(p33, p34)
            local v137 = p33.Box.Name:lower()
            local v138 = p34.Box.Name:lower()

            return v137 < v138
        end)
        p31.Variables.ThrowTargets = t2

        if p31.Variables.InputType == "Keyboard" then
            p31.Variables.ThrowTargets = t2

            for k, v in pairs(p31.Variables.ThrowTargets) do
                v.Billboard.Number.Keybind.TextLabel.Text = k
                v.Billboard.Number.ControllerKeybind.Visible = false
                v.Billboard.Number.Enabled = true
                v.IsActive = true
                v.TargetNumber = k
            end
        elseif p31.Variables.InputType == "Controller" then
            if not p31.ControllerUpdateConnection then
                p31.ControllerUpdateConnection = game:GetService("RunService").RenderStepped:Connect(function()
                    if p31.BallEquipType == p31.DEF_QUARTERBACK then
                        p31:UpdateControllerTargeting()
                    end
                end)
            end

            for _, v in pairs(p31.Variables.ThrowTargets) do
                v.Billboard.Number.ControllerKeybind.Image = p31.Variables.GlobalVariables:GetControllerButtonImage("ButtonR2")
                v.Billboard.Number.Keybind.Visible = false
                v.Billboard.Number.Enabled = false
            end
        elseif p31.Variables.InputType == "Mobile" then
            if not p31.Variables.TestData then
                p31.Variables.TestData = game.ReplicatedStorage.ReEvent.ReFunction:InvokeServer("GetABTestData", "MobileUX_ABTest")

                if p31.Variables.TestData and p31.Variables.TestData.autoThrowTimer and game.Players.LocalPlayer.Replicated.InstallDate.Value > p31.Variables.TestData.fromInstallDate then
                    p31.KeyTimer = p31.Variables.TestData.autoThrowTimer
                end
            end

            for k, v in pairs(p31.Variables.ThrowTargets) do
                if not v.ClickDownEvent then
                    v.ClickDownEvent = v.Billboard.MobileNumber.ImageLabel.MouseButton1Down:Connect(function()
                        if not v.IsActive then
                            return
                        end

                        if v.SelectingDown then
                            return
                        end

                        v.SelectingDown = true
                        p31:FocusAutoThrowIcon(v)

                        local n1 = 0

                        while n1 < p31.KeyTimer and v.SelectingDown do
                            n1 += 0.05
                            task.wait(0.05)
                        end

                        local n2 = if n1 >= p31.KeyTimer then 100 else 50

                        p31:UnfocusAutoThrowIcon(v)
                        p31:FindPlayerToThrowTo(k, n2)
                    end)
                end

                if not v.ClickDownEvent2 then
                    v.ClickDownEvent2 = v.Billboard.MobileNumber.ImageLabelBig.MouseButton1Down:Connect(function()
                        if not v.IsActive then
                            return
                        end

                        if v.SelectingDown then
                            return
                        end

                        v.SelectingDown = true
                        p31:FocusAutoThrowIcon(v)

                        local n1 = 0

                        while n1 < p31.KeyTimer and v.SelectingDown do
                            n1 += 0.05
                            task.wait(0.05)
                        end

                        if n1 >= p31.KeyTimer then
                            p31.BallPower = 100
                        else
                            p31.BallPower = 50
                        end

                        p31:UnfocusAutoThrowIcon(v)
                        p31:FindPlayerToThrowTo(k)
                    end)
                end

                if not v.ClickUpEvent then
                    v.ClickUpEvent = v.Billboard.MobileNumber.ImageLabel.MouseButton1Up:Connect(function()
                        v.SelectingDown = false
                    end)
                end

                if not v.ClickUpEvent2 then
                    v.ClickUpEvent2 = v.Billboard.MobileNumber.ImageLabelBig.MouseButton1Up:Connect(function()
                        v.SelectingDown = false
                    end)
                end

                v.Billboard.MobileNumber.ImageLabel.TextLabel.Text = k
                v.Billboard.MobileNumber.Enabled = v110
            end
        end
    end
}
