# Inferred `FootballMath.lua`

This is not the official game file. It is an inferred module skeleton matching the constants and equations visible in QBAim.

```lua
local FootballMath = {}

FootballMath.YARDS_TO_STUDS = 3
FootballMath.BALL_G = 28
FootballMath.G = Vector3.new(0, -FootballMath.BALL_G, 0)
FootballMath.MODEL_BALL_SPEED = 95
FootballMath.REMOTE_DISPLAY_POWER = 100
FootballMath.QB_INHERITANCE = 0
FootballMath.PLAYER_G = 196.2
FootballMath.JUMP_POWER = 55.5
FootballMath.WR_STANDING_TOP_Y = 6.00
FootballMath.WR_MAX_Y = FootballMath.WR_STANDING_TOP_Y + (FootballMath.JUMP_POWER * FootballMath.JUMP_POWER) / (2 * FootballMath.PLAYER_G)

function FootballMath.Flat(v)
    return Vector3.new(v.X, 0, v.Z)
end

function FootballMath.DistXZ(a, b)
    return (FootballMath.Flat(b) - FootballMath.Flat(a)).Magnitude
end

function FootballMath.VelocityNeeded(originPosition, targetPosition, time)
    return (targetPosition - originPosition - 0.5 * FootballMath.G * time * time) / time
end

function FootballMath.BallAt(originPosition, velocity, time)
    return originPosition + velocity * time + 0.5 * FootballMath.G * time * time
end

function FootballMath.Landing(originPosition, velocity)
    local discriminant = velocity.Y * velocity.Y + 2 * FootballMath.BALL_G * originPosition.Y
    if discriminant < 0 then return nil, nil end
    local time = (velocity.Y + math.sqrt(discriminant)) / FootballMath.BALL_G
    if time <= 0 then return nil, nil end
    return FootballMath.BallAt(originPosition, velocity, time), time
end

function FootballMath.ReceiverJumpPeak(position)
    return Vector3.new(position.X, FootballMath.WR_MAX_Y, position.Z)
end

function FootballMath.InterceptValue(originPosition, receiverStart, wrVel, qbVel, ballSpeed, time)
    local inheritedVelocity = qbVel * FootballMath.QB_INHERITANCE
    local neededDisplacement = receiverStart - originPosition + (wrVel - inheritedVelocity) * time - 0.5 * FootballMath.G * time * time
    return neededDisplacement:Dot(neededDisplacement) - ballSpeed * ballSpeed * time * time
end

function FootballMath.RequiredInterceptVelocity(originPosition, receiverStart, wrVel, qbVel, time)
    local inheritedVelocity = qbVel * FootballMath.QB_INHERITANCE
    local neededDisplacement = receiverStart - originPosition + (wrVel - inheritedVelocity) * time - 0.5 * FootballMath.G * time * time
    return neededDisplacement / time
end

return FootballMath
```

## Known mapping from QBAim

- Remote power sent to game: `100`
- Ball speed used by model: `95`
- Ball gravity used by model: `28`
- Player gravity used for jump peak: `196.2`
- Jump power used for peak: `55.5`
- Receiver peak target Y: about `13.85`
- Current live solver advances receiver start by `wrVel * (releaseOffset + WR_LEAD_DELAY)` before solving.
- Current default `WR_LEAD_DELAY`: `0.20`
- Current vertical release extrapolation: disabled
