# Throw animation and release timing

The project mirrors the game's quarterback throw timing.

## Source-backed constants

Confirmed by `MECH_ControlsQuarterback.md`:

```lua
p1:PlayAnimation("UF_QuarterbackThrow", 1.35)
task.wait(0.26666666666666666)
ReEvent:FireServer("Mechanics", "ThrowBall", payload)
p1:UnequipFootball()
```

Live project constants:

```lua
PLAY_THROW_ANIMATION = true
THROW_ANIMATION_NAME = "UF_QuarterbackThrow"
THROW_ANIMATION_SPEED = 1.35
THROW_ANIMATION_RELEASE_WAIT = 0.26666666666666666
PLAY_THROW_LOCAL_FALLBACK = false
```

## Animation play path

Preferred path uses the game's `Mechanics` object:

```lua
mechanics:PlayAnimation("UF_QuarterbackThrow", 1.35)
```

Local animation fallback is disabled by default.

## Release-time planning

The restored script builds a preliminary release-offset plan, plays the throw animation, updates the plan during the release wait, then builds one final plan at release.

Current behavior:

- Base origin comes from the held football when available, otherwise QB root.
- Original `Center.C2.Y` can replace origin Y when it is near the ball.
- Horizontal release extrapolation moves origin X/Z by QB root velocity during the animation wait.
- Vertical release extrapolation is disabled.
- Receiver release prediction moves receiver start by `wrVel * releaseOffset`.
- `Lead Adjust` is a max extra receiver prediction time, tapered by flight time.

The release loop should remain aligned with the source wait:

```lua
local endAt = os.clock() + THROW_ANIMATION_RELEASE_WAIT
while os.clock() < endAt do
    local remaining = math.max(endAt - os.clock(), 0)
    latestPlan = buildPlan(receiver, ballPower, remaining, releaseBall)
    RunService.Heartbeat:Wait()
end

local finalPlan = buildPlan(receiver, ballPower, 0, releaseBall)
```
