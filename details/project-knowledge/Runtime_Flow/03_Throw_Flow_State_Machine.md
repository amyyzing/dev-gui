# Throw flow state machine

```text
Throw key
  -> QB Aim enabled and current mode available
  -> receiver locked and targetable
  -> held football exists
  -> choose model speed 95 for current mode
  -> build pre-animation plan at release offset 0.2666667
  -> play UF_QuarterbackThrow at speed 1.35
  -> update plan during release wait
  -> build final plan at release offset 0
  -> fire Mechanics/ThrowBall remote with display power 100
  -> freeze preview briefly
```

## Source-backed remote timing

`MECH_ControlsQuarterback.FootballThrow` confirms the game client:

1. plays `UF_QuarterbackThrow` at `1.35`
2. waits `0.26666666666666666`
3. sends `ReEvent:FireServer("Mechanics", "ThrowBall", payload)`
4. calls `UnequipFootball()`

## Current restored solve model

The restored solver solves a fixed-speed projectile intercept against a lead-delay target:

```lua
leadDelay = leadDelayForFlightTime(t)
target(t) = receiverStart + flat(wrVel) * (t + leadDelay)
neededDisplacement = target(t) - origin - flat(qbVel) * QB_INHERITANCE * t - 0.5 * G * t * t
F(t) = neededDisplacement:Dot(neededDisplacement) - MODEL_BALL_SPEED^2 * t^2
```

Where:

- `origin` starts from held ball/root position.
- original `Center.C2.Y` can replace origin Y if it passes the fallback range.
- `receiverStart` is receiver position moved by release-time receiver motion and forced to `WR_MAX_Y`.
- `QB_INHERITANCE = 0`, so inherited velocity is currently zero.

After a valid time is chosen:

```lua
requiredVelocity = neededDisplacement / time
throwVelocity = requiredVelocity.Unit * MODEL_BALL_SPEED
worldVelocity = throwVelocity + flat(qbVel) * QB_INHERITANCE
aimPoint = origin + requiredVelocity.Unit * AIM_SCALE
```

Candidate acceptance uses target miss and Y miss tolerances. Invalid throws return no plan instead of forcing a route-bucket fallback.

## Plan build path

```lua
local targetVelocity = routeVelocity(data, receiverRoot)
return solve(qbRoot, ball, receiverRoot, targetVelocity, ballPower, releaseOffset), ball
```
