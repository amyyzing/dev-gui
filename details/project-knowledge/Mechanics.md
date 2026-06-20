-- Script Path: game:GetChildren()[117]:GetChildren()[12]:GetChildren()[3]:GetChildren()[2]:GetChildren()[1]
-- Took 0.07s to decompile.
-- Executor: YuBX (2.0.0.0-YB)

-- Decompiled using ByteFall
-- discord.gg/bytefall
local t1 = {
    Variables = nil,
    DEF_CARRIER = "Receiver",
    DEF_QUARTERBACK = "Quarterback",
    DEF_PUNTER = "Punter",
    DEF_NOBALL = "NoBall",
    DEF_UNCAUGHT = "UncaughtReceiver",
    StaminaTween = nil,
    ShiftConn = nil,
    PlayerMouse = nil,
    ThumbstickAngle = nil
}

t1.BallEquipType = t1.DEF_NOBALL

local t2 = {}

t2[Enum.KeyCode.ButtonR2] = {
    Count = 0,
    Name = "R2",
    Events = {}
}
t2[Enum.KeyCode.One] = {
    Count = 0,
    Name = "1",
    Events = {}
}
t2[Enum.KeyCode.Two] = {
    Count = 0,
    Name = "2",
    Events = {}
}
t2[Enum.KeyCode.Three] = {
    Count = 0,
    Name = "3",
    Events = {}
}
t2[Enum.KeyCode.Four] = {
    Count = 0,
    Name = "4",
    Events = {}
}
t2[Enum.KeyCode.Five] = {
    Count = 0,
    Name = "5",
    Events = {}
}
t2[Enum.KeyCode.Six] = {
    Count = 0,
    Name = "6",
    Events = {}
}
t2[Enum.KeyCode.Seven] = {
    Count = 0,
    Name = "7",
    Events = {}
}
t2[Enum.KeyCode.Eight] = {
    Count = 0,
    Name = "8",
    Events = {}
}
t2[Enum.KeyCode.Nine] = {
    Count = 0,
    Name = "9",
    Events = {}
}
t2[Enum.KeyCode.Zero] = {
    Count = 0,
    Name = "0",
    Events = {}
}
t2[Enum.KeyCode.KeypadOne] = {
    Count = 0,
    Name = "1",
    Events = {}
}
t2[Enum.KeyCode.KeypadTwo] = {
    Count = 0,
    Name = "2",
    Events = {}
}
t2[Enum.KeyCode.KeypadThree] = {
    Count = 0,
    Name = "3",
    Events = {}
}
t2[Enum.KeyCode.KeypadFour] = {
    Count = 0,
    Name = "4",
    Events = {}
}
t2[Enum.KeyCode.KeypadFive] = {
    Count = 0,
    Name = "5",
    Events = {}
}
t2[Enum.KeyCode.KeypadSix] = {
    Count = 0,
    Name = "6",
    Events = {}
}
t2[Enum.KeyCode.KeypadSeven] = {
    Count = 0,
    Name = "7",
    Events = {}
}
t2[Enum.KeyCode.KeypadEight] = {
    Count = 0,
    Name = "8",
    Events = {}
}
t2[Enum.KeyCode.KeypadNine] = {
    Count = 0,
    Name = "9",
    Events = {}
}
t2[Enum.KeyCode.KeypadZero] = {
    Count = 0,
    Name = "0",
    Events = {}
}
t1.ThrowKeysPressed = t2
t1.MostRecentThrowPlayer = nil
t1.MostRecentThrowNumber = 1
t1.KeysPressed = {}
t1.HitStickColor = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 0)),
    ColorSequenceKeypoint.new(0.499, Color3.fromRGB(255, 170, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 70, 70)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70))
})
t1.TruckingColor = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 0, 0)),
    ColorSequenceKeypoint.new(0.499, Color3.fromRGB(170, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 70, 70)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70))
})
t1.SprintStatus = false
t1.StaminaActive = false
t1.TruckingStatus = false
t1.HitStickStatus = false
t1.THROW_INDICATOR = false
t1.BallEquipped = false
t1.HandoffActive = false
t1.SpinDebounce = true
t1.PumpDebounce = true
t1.JumpDebounce = true
t1.PlayerCanDive = true
t1.PlayerDiving = false
t1.PlayerIsJumping = false
t1.ThrowDebounce = false
t1.ShiftLockEnabled = false
t1.CFrameAnimationMove = false
t1.MovementChanged = false
t1.Directional = { Forward = false, Left = false, Right = false, Backward = false }
t1.ActiveAnimations = {}
t1.ActiveTeamAnimations = {}
t1.SyncedAnimations = {}
t1.Footballs = {}
t1.Fingers = {}
t1.BallVector = Vector3.new()
t1.PlayerVector = Vector3.new()
t1.CamVector = Vector3.new()
t1.CenVector = Vector3.new()
t1.RootVector = Vector3.new()
t1.CarrierVector = Vector3.new()
t1.LiveControlType = "None"
t1.Reset = 0
t1.DirectionBeam = {}
t1.Alignment = Instance.new("AlignOrientation")
t1.Alignment.RigidityEnabled = true
t1.Alignment.ReactionTorqueEnabled = true
t1.AlignAttachment = Instance.new("Attachment")
t1.Alignment.Attachment0 = t1.AlignAttachment
t1.Alignment.Mode = Enum.OrientationAlignmentMode.OneAttachment
t1.GyroActive = false
t1.LastAimingPosition = nil
t1.Stamina = 100
t1.SprintDepletePerSecondRate = 10
t1.SprintRegenPerSecondRate = 10
t1.TruckingCost = 50
t1.HitStickCost = 50
t1.BallPower = 100
t1.BallPowerTier = 3
t1.BallPowerTiers = { 65, 85, 100 }
t1.KeyTimer = 0.2
t1.WalkSpeedFactors = {
    Normal = 18,
    Bike = 0,
    GolfCart = 0,
    Hoverboard = 0,
    Sprint = 0,
    Server = 0,
    Trucking = 0
}
t1.OffsetBump = 0.3

function t1.new(p1, p2)
    t1.Variables = p1

    local v5 = require(script[p2])

    for _, v in pairs(v5) do
        local v8 = script.Modules

        for _, v2 in pairs(v) do
            v8 = v8[v2]
        end

        for k, v3 in pairs(require(v8)) do
            t1[k] = v3
        end
    end

    return t1
end

return t1
