-- Script Path: game:GetService("ReplicatedStorage").Assets.Modules.Client.Mechanics.Modules.General.MECH_ControlsQuarterback

local t = {}
local v1 = nil

local function _getCachedAutoThrowingAbTest(p1) --[[ _getCachedAutoThrowingAbTest | Line: 9 | Upvalues: v1 (ref) ]]
    if v1 ~= nil then
        return v1
    end

    local v12, v2 = p1.Variables.ABTest.GetExperimentVariables("uf-auto-throw"):await()

    if not v12 or v2 == nil then
        return v1
    end

    v1 = v2

    return v2
end

function t.ResetQuarterbackArrows(p1) --[[ ResetQuarterbackArrows | Line: 20 ]]
    for k in pairs(p1.DirectionBeam) do
        p1:SetDirectionBeamTarget(k, nil)
    end
end
function t.UpdatedQuarterbackPad(p1) --[[ UpdatedQuarterbackPad | Line: 26 ]]
    local v1, v2 = p1.Variables.ABTest.GetExperimentVariables("uf-quarterback-ux"):await()

    if not (v1 and (p1.Variables.Functions.PlayerData:GetInstallDate() >= v2["install-cohort-date"] and v2["qb-pad-enabled"])) then
        return
    end

    local v3 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings
    local QuarterbackPad = v3.GameInstance.Value.Replicated.QuarterbackPad
    local TeamID = p1.Variables.LP.Replicated.TeamID.Value
    local isValue = TeamID == v3.GameStatus.Offense.Value
    local v4 = if p1.Variables.GlobalVariables:GetPlayerFromObjectValue(v3.GameStatus.ActiveQuarterback) == nil then true else false

    for k, v in pairs((p1.Variables.GlobalVariables:GetTeamPlayers(v3, TeamID))) do
        if QuarterbackPad.Transparency == 0.25 and ((v3.Positions[TeamID].Quarterbacks:FindFirstChild(v.Name) or (if #v3.Positions[TeamID].Quarterbacks:GetChildren() == 0 then true else p1.Variables.Functions.MutationsMode:IsMutationActive("GameRule_AllQBs"))) and (isValue and v4)) then
            QuarterbackPad.Color = Color3.fromRGB(255, 102, 0)
            QuarterbackPad.Emitter.Enabled = true
            QuarterbackPad.Billboard.Enabled = true
            QuarterbackPad.Billboard.ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
            QuarterbackPad.Billboard.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            p1.Variables.Mechanics:SetDirectionBeamTarget(v, QuarterbackPad, (Vector3.new(0, QuarterbackPad.Size.Y / 2, 0)))

            continue
        end

        if v4 and isValue then
            QuarterbackPad.Billboard.ImageLabel.ImageColor3 = Color3.fromRGB(200, 200, 200)
            QuarterbackPad.Billboard.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            QuarterbackPad.Billboard.Enabled = true
        else
            QuarterbackPad.Billboard.ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
            QuarterbackPad.Billboard.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            QuarterbackPad.Billboard.Enabled = false
        end

        QuarterbackPad.Color = Color3.fromRGB(79, 26, 0)
        QuarterbackPad.Emitter.Enabled = false
        QuarterbackPad.Emitter:Clear()
        p1.Variables.Mechanics:SetDirectionBeamTarget(v, nil)
    end
end
function t.GetClosestReceiverNumber(p1) --[[ GetClosestReceiverNumber | Line: 69 ]]
    local v3 = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
    local v4 = (1 / 0)
    local v5 = nil

    for k, v in pairs(p1.Variables.ThrowTargets) do
        local v6 = workspace.CurrentCamera:WorldToViewportPoint(v.Box.Position)

        if v6.Z > 0 then
            local Magnitude = (Vector2.new(v6.X, v6.Y) - v3).Magnitude

            if Magnitude < v4 and Magnitude < 200 then
                v4 = Magnitude
                v5 = k
            end
        end
    end

    return v5
end
function t.UpdateControllerTargeting(p1) --[[ UpdateControllerTargeting | Line: 95 ]]
    for k, v in pairs(p1.Variables.ThrowTargets) do
        v.Billboard.Number.Enabled = false
    end

    local v1 = p1:GetClosestReceiverNumber()

    if not v1 then
        return
    end

    p1.MostRecentThrowNumber = v1
    p1.MostRecentThrowPlayer = p1.Variables.ThrowTargets[v1].Box.Name

    local v2 = p1.Variables.ThrowTargets[v1]

    v2.Billboard.Number.Enabled = true
    v2.Billboard.Number.ControllerKeybind.Image = p1.Variables.GlobalVariables:GetControllerButtonImage("ButtonR2")
end
function t.CheckAutoThrowEnabled(p1) --[[ CheckAutoThrowEnabled | Line: 111 | Upvalues: v1 (ref) ]]
    if v1 == nil then
        local v2, v3 = p1.Variables.ABTest.GetExperimentVariables("uf-auto-throw"):await()

        if v2 and v3 ~= nil then
            v1 = v3
        end
    end

    local v4 = v1
    local v5 = if v4 == nil then false else v4.enabled
    local v6 = if v4 == nil then false else v4._variantName
    local v7 = (os.time() - p1.Variables.Functions.PlayerData:GetInstallDate()) / 86400 < v4["new-user-days"]

    return p1.Variables.InputType == "Mobile" and (p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings).MechanicsUsed.AutoThrow.Value or (if p1.Variables.InputType == "Keyboard" and (v5 and v6 == "keyboard") then true elseif p1.Variables.InputType == "Controller" and v5 then if v6 == "controller" then true else v7 else v7)
end
function t.CheckPowerSetting(p1) --[[ CheckPowerSetting | Line: 129 ]]
    if p1.Variables.CurrentGameSettings then
        return true
    end

    local CurrentMiniSettings = p1.Variables.CurrentMiniSettings

    return true
end
function t.Handoff(p1, p2) --[[ Handoff | Line: 136 ]]
    if p1:FilterAction("Handoff") == false and not p2 then
        return
    end

    local v1 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

    if not v1 or v1 and not v1.MechanicsUsed.Handoff.Value then
        return
    end

    if p2 or p1.HandoffActive then
        p1:StopAnimation("UF_QuarterbackHandoff")
        p1:StopAnimation("UF_QuarterbackHandoffConstant")
        p1.HandoffActive = false
        p1.Variables.EventCenter:Publish("ActionToggled", "Handoff", false)
    else
        p1:PlayAnimation("UF_QuarterbackHandoff")
        p1.HandoffActive = true
        p1.Variables.EventCenter:Publish("ActionToggled", "Handoff", true)
        task.wait(0.21)

        if p1.HandoffActive then
            p1:PlayAnimation("UF_QuarterbackHandoffConstant")
        end
    end

    v1.ReEvent:FireServer("Mechanics", "Handoff", p1.HandoffActive)
end
function t.Pumpfake(p1) --[[ Pumpfake | Line: 161 ]]
    if p1:FilterAction("Pumpfake") == false then
        return
    end

    local v1 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

    if not v1 or v1 and not v1.MechanicsUsed.Throwing.Value then
        return
    end

    if not (p1.Variables.LP.Character:FindFirstChild("Head") and p1.PumpDebounce) then
        return
    end

    p1.PumpDebounce = false
    p1:PlayAnimation("UF_QuarterbackThrow", 1.35)
    task.wait(1)
    p1.PumpDebounce = true
end
function t.FindPlayerToThrowTo(p1, p2, p3) --[[ FindPlayerToThrowTo | Line: 179 ]]
    if p1:FilterAction("CatchHikeThrow") == false then
        return
    end

    local v1 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

    if not v1 or v1 and not v1.MechanicsUsed.Throwing.Value then
        return
    end

    if p1.Variables.ThrowTargets[p2] ~= nil then
        p1.MostRecentThrowPlayer = p1.Variables.ThrowTargets[p2].Box.Name
        p1.MostRecentThrowNumber = p2
        p1:FootballThrow(p1.Variables.ThrowTargets[p2], p3)
    end

    p1.ThrowDebounce = false
end
function t.GetXboxCrosshairPosition(p1) --[[ GetXboxCrosshairPosition | Line: 217 ]]
    local AbsolutePosition = p1.Variables.HUD.XboxCrosshair.RealDot.AbsolutePosition
    local AbsoluteSize = p1.Variables.HUD.XboxCrosshair.RealDot.AbsoluteSize

    return Vector2.new(AbsolutePosition.X + AbsoluteSize.X / 2, AbsolutePosition.Y + AbsoluteSize.Y / 2)
end
function t.FootballThrow(p1, p2, p3) --[[ FootballThrow | Line: 223 ]]
    local v1 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

    if not v1 or v1 and not v1.MechanicsUsed.Throwing.Value then
        return
    end

    if not p1.BallEquipped or (p1.BallEquipType ~= p1.DEF_QUARTERBACK or (not p1.Variables.GlobalVariables:PlayerCanThrow(v1) or p1.HandoffActive)) then
        return
    end

    local Head = p1.Variables.LP.Character:FindFirstChild("Head")

    if not Head then
        return
    end

    local ScrimmageLine = v1.GameInstance.Value.Replicated:FindFirstChild("ScrimmageLine")

    if ScrimmageLine and p1.Variables.GlobalVariables:BeyondLineOfScrimmage(v1, (p1.Variables.GlobalVariables:Vector3(v1, Head.Position))) then
        return
    end

    p1:PlayAnimation("UF_QuarterbackThrow", 1.35)

    if p1:CheckAutoThrowEnabled() and (p2 and (not p1.Variables.Mechanics.ShiftLockEnabled and (p1.Variables.TestData ~= nil and game.Players.LocalPlayer.Replicated.InstallDate.Value > p1.Variables.TestData.fromInstallDate))) then
        local HumanoidRootPart = p1.Variables.LP.Character.HumanoidRootPart
        local Box = p2.Box
        local t = {}

        t.CFrame = CFrame.new(HumanoidRootPart.Position, (Vector3.new(Box.Position.X, Box.Position.Y, Box.Position.Z)))
        game:GetService("TweenService"):Create(HumanoidRootPart, TweenInfo.new(0.5), t):Play()
    end

    p1.BallEquipType = p1.DEF_NOBALL
    task.wait(0.26666666666666666)

    local v4 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

    if not v4 then
        return
    end

    p1.THROW_INDICATOR = false

    local v5 = p1.Variables.Functions.Utilities:ScreenPointToRay(p1.PlayerMouse.X, p1.PlayerMouse.Y)
    local v6 = v5.Origin + v5.Direction * 1000

    if p1.Variables.InputType == "Mobile" and p1.WorldTapPoint then
        v6 = p1.WorldTapPoint
        p1.WorldTapPoint = nil
    elseif p1.Variables.InputType == "Controller" then
        local v7 = p1:GetXboxCrosshairPosition()
        local v8 = p1.Variables.Functions.Utilities:ScreenPointToRay(v7.X, v7.Y)

        v6 = v8.Origin + v8.Direction * 1000
    end

    local BallPower = p1.BallPower

    if p3 then
        BallPower = p3
    end

    local t = {
        AutoThrow = false,
        Target = v6,
        Power = BallPower
    }

    if p1:CheckAutoThrowEnabled() and (p2 and (not p1.Variables.Mechanics.ShiftLockEnabled and (p1.Variables.TestData ~= nil and game.Players.LocalPlayer.Replicated.InstallDate.Value > p1.Variables.TestData.fromInstallDate))) then
        t.AutoThrow = true
        t.PlayerTarget = p2.Box
    end

    v4.ReEvent:FireServer("Mechanics", "ThrowBall", t)
    p1.Variables.Functions.Input:XboxFocus(nil)
    p1:UnequipFootball()
end
function t.DisplayThrowingMeter(p1, p2, p3) --[[ DisplayThrowingMeter | Line: 292 ]]
    local v1 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

    if v1 and v1.AssetsUsed.PowerMeter.Value then
        if p2 and (p3 ~= false and not p1.Variables.PlayerData[p1.Variables.LP.Name].ProfileData.GameplaySettings.QBRememberPower) then
            p1.BallPower = math.clamp(tonumber(p1.Variables.PlayerData[p1.Variables.LP.Name].ProfileData.GameplaySettings.QBStartPower) or 100, p1.Variables.FootballMath.Settings.MinPower, p1.Variables.FootballMath.Settings.MaxPower)
        end

        if if p1.Variables.InputType == "Mobile" then true else false then
            if p1.Variables.Functions.MobileControls:GetLayoutType() == p1.Variables.Functions.MobileControls.LAYOUT_TYPES.TABLET then
                p1.Variables.MechanicsGui.ThrowingMeter.Position = UDim2.new(0.5, 0, 0.7, 0)
            else
                p1.Variables.MechanicsGui.ThrowingMeter.Position = UDim2.new(0.5, 0, 0.66, 0)
            end
        else
            p1.Variables.MechanicsGui.ThrowingMeter.Position = UDim2.new(0.5, 0, 0.77, 0)
        end

        p1.Variables.MechanicsGui.ThrowingMeter.Visible = p2
        p1:DisplayPower()
    else
        p1.Variables.MechanicsGui.ThrowingMeter.Visible = false
    end
end
function t.DisplayPower(p1) --[[ DisplayPower | Line: 322 ]]
    for k, v in pairs(p1.Variables.MechanicsGui.ThrowingMeter.ProgressCircle:GetChildren()) do
        v.Bit.BackgroundTransparency = if tonumber((string.sub(v.Name, 5, #v.Name))) <= p1.BallPower then 0 else 0.9
    end

    if p1:CheckPowerSetting() then
        p1.Variables.MechanicsGui.ThrowingMeter.ProgressText.Text = math.floor(p1.BallPower)
        p1.Variables.MechanicsGui.ThrowingMeter.ProgressTierText.Text = ""
        p1.Variables.MechanicsGui.ThrowingMeter.ProgressTier.Text = ""
    else
        p1.Variables.MechanicsGui.ThrowingMeter.ProgressText.Text = ""
        p1.Variables.MechanicsGui.ThrowingMeter.ProgressTierText.Text = math.floor(p1.BallPower)
        p1.Variables.MechanicsGui.ThrowingMeter.ProgressTier.Text = math.floor(p1.BallPowerTier)
    end
end
function t.BallPowerUp(p1) --[[ BallPowerUp | Line: 340 ]]
    if p1:FilterAction("BallPowerUp") == false then
        return
    end

    local v1 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

    if not v1 or v1 and not v1.AssetsUsed.PowerMeter.Value then
        return
    end

    local v2 = p1:CheckPowerSetting()

    if not p1.Variables.MechanicsGui.ThrowingMeter.Visible then
        return
    end

    if v2 then
        p1.BallPower = math.clamp(p1.BallPower + (tonumber(p1.Variables.PlayerData[p1.Variables.LP.Name].ProfileData.GameplaySettings.QBChange) or 5), p1.Variables.FootballMath.Settings.MinPower, p1.Variables.FootballMath.Settings.MaxPower)
    else
        p1.BallPowerTier = math.min(p1.BallPowerTier + 1, #p1.BallPowerTiers)
        p1.BallPower = p1.BallPowerTiers[p1.BallPowerTier]
    end

    p1:DisplayPower()
end
function t.BallPowerDown(p1) --[[ BallPowerDown | Line: 365 ]]
    if p1:FilterAction("BallPowerDown") == false then
        return
    end

    local v1 = p1.Variables.CurrentGameSettings or p1.Variables.CurrentMiniSettings

    if not v1 or v1 and not v1.AssetsUsed.PowerMeter.Value then
        return
    end

    local v2 = p1:CheckPowerSetting()

    if not p1.Variables.MechanicsGui.ThrowingMeter.Visible then
        return
    end

    if v2 then
        p1.BallPower = math.clamp(p1.BallPower - (tonumber(p1.Variables.PlayerData[p1.Variables.LP.Name].ProfileData.GameplaySettings.QBChange) or 5), p1.Variables.FootballMath.Settings.MinPower, p1.Variables.FootballMath.Settings.MaxPower)
    else
        p1.BallPowerTier = math.max(1, p1.BallPowerTier - 1)
        p1.BallPower = p1.BallPowerTiers[p1.BallPowerTier]
    end

    p1:DisplayPower()
end
function t.FindNextReceiver(p1, p2) --[[ FindNextReceiver | Line: 390 ]]
    if not (#p1.Variables.ThrowTargets > 0) then
        p1.MostRecentThrowNumber = 1
        p1.MostRecentThrowPlayer = nil

        return
    end

    local MostRecentThrowNumber = p1.MostRecentThrowNumber
    local v1 = #p1.Variables.ThrowTargets

    for i = 1, v1 do
        MostRecentThrowNumber = MostRecentThrowNumber + p2

        if MostRecentThrowNumber <= 0 then
            MostRecentThrowNumber = v1
        elseif v1 < MostRecentThrowNumber then
            MostRecentThrowNumber = 1
        end

        local v2 = p1.Variables.ThrowTargets[MostRecentThrowNumber]

        if v2 and (v2.Box and v2.Box.Parent) then
            p1.MostRecentThrowPlayer = p1.Variables.ThrowTargets[MostRecentThrowNumber].Box.Name
            p1.MostRecentThrowNumber = MostRecentThrowNumber

            return
        end
    end
end
function t.HasBecomeRunner(p1) --[[ HasBecomeRunner | Line: 429 ]]
    p1:ReceiverIcons(false)

    if p1.CameraMoveConnection then
        p1.CameraMoveConnection:Disconnect()
        p1.CameraMoveConnection = nil
    end

    if p1.ThumbstickMoveConnection then
        p1.ThumbstickMoveConnection:Disconnect()
        p1.ThumbstickMoveConnection = nil
    end

    if not p1.CameraMoveDebounce then
        return
    end

    p1.CameraMoveDebounce:Disconnect()
    p1.CameraMoveDebounce = nil
end
function t.FocusAutoThrowIcon(p1, p2) --[[ FocusAutoThrowIcon | Line: 445 ]]
    p2.Billboard.MobileNumber.Focus.Size = UDim2.new(1, 0, 1, 0)

    if not p2.FocusTween then
        p2.FocusTween = game.TweenService:Create(p2.Billboard.MobileNumber.Focus, TweenInfo.new(p1.KeyTimer), {
            Size = UDim2.new(0.75, 0, 0.75, 0)
        })
    end

    p2.Billboard.MobileNumber.Focus.Visible = true
    p2.FocusTween:Play()
end
function t.UnfocusAutoThrowIcon(p1, p2) --[[ UnfocusAutoThrowIcon | Line: 464 ]]
    if p2.FocusTween then
        p2.FocusTween:Cancel()
    end

    p2.Billboard.MobileNumber.Focus.Size = UDim2.new(1, 0, 1, 0)
    p2.Billboard.MobileNumber.Focus.Visible = false
end
function t.ReceiverIcons(p1, p2) --[[ ReceiverIcons | Line: 472 ]]
    local v1 = p1.Variables.CurrentGameInstance or p1.Variables.CurrentMiniInstance
    local v2 = p1.Variables.PlayerData[game.Players.LocalPlayer.Name]
    local MobileAssistIconSize = v2.ProfileData.GameplaySettings.MobileAssistIconSize

    if (if p1.Variables.InputType == "Mobile" then v2.ProfileData.GameplaySettings.MobileAutoThrow and (if p1.Variables.TestData == nil then false elseif game.Players.LocalPlayer.Replicated.InstallDate.Value > p1.Variables.TestData.fromInstallDate then true else false) else false) or (if p1.Variables.InputType == "Keyboard" or p1.Variables.InputType == "Controller" then p1:CheckAutoThrowEnabled() else false) then
        for k, v in pairs(v1.Replicated.Hitboxes:GetChildren()) do
            v.Receiver.Enabled = false
        end

        for k, v in pairs(p1.Variables.ThrowTargets) do
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

        p1.Variables.Gui.Billboards.AutoThrow:ClearAllChildren()

        local t = {}

        for k, v in pairs(v1.Replicated.Hitboxes:GetChildren()) do
            local v6 = p1.Variables.GlobalVariables:GetPlayer(v.Name)

            if p1.BallEquipType == p1.DEF_QUARTERBACK and (v6 ~= p1.Variables.LP and (v6.Replicated.GameID.Value == p1.Variables.LP.Replicated.GameID.Value and v6.Replicated.TeamID.Value == p1.Variables.LP.Replicated.TeamID.Value)) then
                local ThrowNumbers = game.ReplicatedStorage.Assets.Storage.ThrowNumbers
                local v7 = ThrowNumbers:Clone()

                v7.Parent = p1.Variables.Gui.Billboards.AutoThrow
                v7.MobileNumber.Size = UDim2.new(0, ThrowNumbers.MobileNumber.Size.X.Offset * MobileAssistIconSize, 0, ThrowNumbers.MobileNumber.Size.Y.Offset * MobileAssistIconSize)
                v7.MobileNumber.Enabled = false
                v7.Number.Size = UDim2.new(0, ThrowNumbers.Number.Size.X.Offset * MobileAssistIconSize, 0, ThrowNumbers.Number.Size.Y.Offset * MobileAssistIconSize)
                v7.Number.Enabled = false
                v7.MobileNumber.Adornee = v
                v7.Number.Adornee = v
                table.insert(t, {
                    IsActive = true,
                    SelectingDown = false,
                    ClickUpEvent = false,
                    ClickDownEvent = false,
                    ClickUpEvent2 = false,
                    ClickDownEvent2 = false,
                    FocusTween = nil,
                    Box = v,
                    Billboard = v7
                })
            end
        end

        table.sort(t, function(p1, p2) --[[ Line: 554 ]]
            return p1.Box.Name:lower() < p2.Box.Name:lower()
        end)
        p1.Variables.ThrowTargets = t

        if p1.Variables.InputType == "Keyboard" then
            p1.Variables.ThrowTargets = t

            for k, v in pairs(p1.Variables.ThrowTargets) do
                v.Billboard.Number.Keybind.TextLabel.Text = k
                v.Billboard.Number.ControllerKeybind.Visible = false
                v.Billboard.Number.Enabled = true
                v.IsActive = true
                v.TargetNumber = k
            end
        elseif p1.Variables.InputType == "Controller" then
            if not p1.ControllerUpdateConnection then
                p1.ControllerUpdateConnection = game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 571 | Upvalues: p1 (copy) ]]
                    if p1.BallEquipType ~= p1.DEF_QUARTERBACK then
                        return
                    end

                    p1:UpdateControllerTargeting()
                end)
            end

            for k, v in pairs(p1.Variables.ThrowTargets) do
                v.Billboard.Number.ControllerKeybind.Image = p1.Variables.GlobalVariables:GetControllerButtonImage("ButtonR2")
                v.Billboard.Number.Keybind.Visible = false
                v.Billboard.Number.Enabled = false
            end
        else
            if p1.Variables.InputType ~= "Mobile" then
                return
            end

            if not p1.Variables.TestData then
                p1.Variables.TestData = game.ReplicatedStorage.ReEvent.ReFunction:InvokeServer("GetABTestData", "MobileUX_ABTest")

                if p1.Variables.TestData and (p1.Variables.TestData.autoThrowTimer and game.Players.LocalPlayer.Replicated.InstallDate.Value > p1.Variables.TestData.fromInstallDate) then
                    p1.KeyTimer = p1.Variables.TestData.autoThrowTimer
                end
            end

            for k, v in pairs(p1.Variables.ThrowTargets) do
                if not v.ClickDownEvent then
                    v.ClickDownEvent = v.Billboard.MobileNumber.ImageLabel.MouseButton1Down:Connect(function() --[[ Line: 595 | Upvalues: v (copy), p1 (copy), k (copy) ]]
                        if not v.IsActive then
                            return
                        end

                        if v.SelectingDown then
                            return
                        end

                        v.SelectingDown = true
                        p1:FocusAutoThrowIcon(v)

                        local sum = 0

                        while sum < p1.KeyTimer and v.SelectingDown do
                            task.wait(0.05)
                            sum = sum + 0.05
                        end

                        local v1 = if p1.KeyTimer <= sum then 100 else 50

                        p1:UnfocusAutoThrowIcon(v)
                        p1:FindPlayerToThrowTo(k, v1)
                    end)
                end

                if not v.ClickDownEvent2 then
                    v.ClickDownEvent2 = v.Billboard.MobileNumber.ImageLabelBig.MouseButton1Down:Connect(function() --[[ Line: 618 | Upvalues: v (copy), p1 (copy), k (copy) ]]
                        if not v.IsActive then
                            return
                        end

                        if v.SelectingDown then
                            return
                        end

                        v.SelectingDown = true
                        p1:FocusAutoThrowIcon(v)

                        local sum = 0

                        while sum < p1.KeyTimer and v.SelectingDown do
                            task.wait(0.05)
                            sum = sum + 0.05
                        end

                        if p1.KeyTimer <= sum then
                            p1.BallPower = 100
                        else
                            p1.BallPower = 50
                        end

                        p1:UnfocusAutoThrowIcon(v)
                        p1:FindPlayerToThrowTo(k)
                    end)
                end

                if not v.ClickUpEvent then
                    v.ClickUpEvent = v.Billboard.MobileNumber.ImageLabel.MouseButton1Up:Connect(function() --[[ Line: 640 | Upvalues: v (copy) ]]
                        v.SelectingDown = false
                    end)
                end

                if not v.ClickUpEvent2 then
                    v.ClickUpEvent2 = v.Billboard.MobileNumber.ImageLabelBig.MouseButton1Up:Connect(function() --[[ Line: 645 | Upvalues: v (copy) ]]
                        v.SelectingDown = false
                    end)
                end

                v.Billboard.MobileNumber.ImageLabel.TextLabel.Text = k
                v.Billboard.MobileNumber.Enabled = v1
            end
        end
    else
        for k, v in pairs(v1.Replicated.Hitboxes:GetChildren()) do
            local v8 = p1.Variables.GlobalVariables:GetPlayer(v.Name)

            if v8 and (p1.BallEquipType == p1.DEF_QUARTERBACK and (v8 ~= p1.Variables.LP and (v8.Replicated.GameID.Value == p1.Variables.LP.Replicated.GameID.Value and v8.Replicated.TeamID.Value == p1.Variables.LP.Replicated.TeamID.Value))) then
                v.Receiver.Enabled = v1

                continue
            end

            v.Receiver.Enabled = false
        end
    end
end

return t
