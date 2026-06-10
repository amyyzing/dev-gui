-- Script Path: game:GetService("ReplicatedStorage").Assets.Modules.Client.Mechanics

local t = {
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

t.BallEquipType = t.DEF_NOBALL
t.ThrowKeysPressed = {
    [Enum.KeyCode.ButtonR2] = {
        Count = 0,
        Name = "R2",
        Events = {}
    },
    [Enum.KeyCode.One] = {
        Count = 0,
        Name = "1",
        Events = {}
    },
    [Enum.KeyCode.Two] = {
        Count = 0,
        Name = "2",
        Events = {}
    },
    [Enum.KeyCode.Three] = {
        Count = 0,
        Name = "3",
        Events = {}
    },
    [Enum.KeyCode.Four] = {
        Count = 0,
        Name = "4",
        Events = {}
    },
    [Enum.KeyCode.Five] = {
        Count = 0,
        Name = "5",
        Events = {}
    },
    [Enum.KeyCode.Six] = {
        Count = 0,
        Name = "6",
        Events = {}
    },
    [Enum.KeyCode.Seven] = {
        Count = 0,
        Name = "7",
        Events = {}
    },
    [Enum.KeyCode.Eight] = {
        Count = 0,
        Name = "8",
        Events = {}
    },
    [Enum.KeyCode.Nine] = {
        Count = 0,
        Name = "9",
        Events = {}
    },
    [Enum.KeyCode.Zero] = {
        Count = 0,
        Name = "0",
        Events = {}
    },
    [Enum.KeyCode.KeypadOne] = {
        Count = 0,
        Name = "1",
        Events = {}
    },
    [Enum.KeyCode.KeypadTwo] = {
        Count = 0,
        Name = "2",
        Events = {}
    },
    [Enum.KeyCode.KeypadThree] = {
        Count = 0,
        Name = "3",
        Events = {}
    },
    [Enum.KeyCode.KeypadFour] = {
        Count = 0,
        Name = "4",
        Events = {}
    },
    [Enum.KeyCode.KeypadFive] = {
        Count = 0,
        Name = "5",
        Events = {}
    },
    [Enum.KeyCode.KeypadSix] = {
        Count = 0,
        Name = "6",
        Events = {}
    },
    [Enum.KeyCode.KeypadSeven] = {
        Count = 0,
        Name = "7",
        Events = {}
    },
    [Enum.KeyCode.KeypadEight] = {
        Count = 0,
        Name = "8",
        Events = {}
    },
    [Enum.KeyCode.KeypadNine] = {
        Count = 0,
        Name = "9",
        Events = {}
    },
    [Enum.KeyCode.KeypadZero] = {
        Count = 0,
        Name = "0",
        Events = {}
    }
}
t.MostRecentThrowPlayer = nil
t.MostRecentThrowNumber = 1
t.KeysPressed = {}
t.HitStickColor = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 0)),
    ColorSequenceKeypoint.new(0.499, Color3.fromRGB(255, 170, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 70, 70)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70))
})
t.TruckingColor = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 0, 0)),
    ColorSequenceKeypoint.new(0.499, Color3.fromRGB(170, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 70, 70)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70))
})
t.SprintStatus = false
t.StaminaActive = false
t.TruckingStatus = false
t.HitStickStatus = false
t.THROW_INDICATOR = false
t.BallEquipped = false
t.HandoffActive = false
t.SpinDebounce = true
t.PumpDebounce = true
t.JumpDebounce = true
t.PlayerCanDive = true
t.PlayerDiving = false
t.PlayerIsJumping = false
t.ThrowDebounce = false
t.ShiftLockEnabled = false
t.CFrameAnimationMove = false
t.MovementChanged = false
t.Directional = {
    Forward = false,
    Left = false,
    Right = false,
    Backward = false
}
t.ActiveAnimations = {}
t.ActiveTeamAnimations = {}
t.SyncedAnimations = {}
t.Footballs = {}
t.Fingers = {}
t.BallVector = Vector3.new()
t.PlayerVector = Vector3.new()
t.CamVector = Vector3.new()
t.CenVector = Vector3.new()
t.RootVector = Vector3.new()
t.CarrierVector = Vector3.new()
t.LiveControlType = "None"
t.Reset = 0
t.DirectionBeam = {}
t.Alignment = Instance.new("AlignOrientation")
t.Alignment.RigidityEnabled = true
t.Alignment.ReactionTorqueEnabled = true
t.AlignAttachment = Instance.new("Attachment")
t.Alignment.Attachment0 = t.AlignAttachment
t.Alignment.Mode = Enum.OrientationAlignmentMode.OneAttachment
t.GyroActive = false
t.LastAimingPosition = nil
t.Stamina = 100
t.SprintDepletePerSecondRate = 10
t.SprintRegenPerSecondRate = 10
t.TruckingCost = 50
t.HitStickCost = 50
t.BallPower = 100
t.BallPowerTier = 3
t.BallPowerTiers = { 65, 85, 100 }
t.KeyTimer = 0.2
t.WalkSpeedFactors = {
    Normal = 18,
    Bike = 0,
    GolfCart = 0,
    Hoverboard = 0,
    Sprint = 0,
    Server = 0,
    Trucking = 0
}
t.OffsetBump = 0.3
function t.new(p1, p2) --[[ new | Line: 122 | Upvalues: t (copy) ]]
    t.Variables = p1

    for k, v in pairs((require(script[p2]))) do
        local Modules = script.Modules

        for k2, v2 in pairs(v) do
            Modules = Modules[v2]
        end

        for k2, v2 in pairs(require(Modules)) do
            t[k2] = v2
        end
    end

    return t
end

return t
