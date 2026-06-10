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

## Current solve model

The current solver does not use route/distance angle buckets. It solves fixed-speed projectile interception:

```lua
target(t) = receiverStart + flat(wrVel) * t + catchOffset(routeDir, moving)
neededDisplacement = target(t) - origin - inheritedVelocity * t - 0.5 * G * t * t
F(t) = neededDisplacement:Dot(neededDisplacement) - MODEL_BALL_SPEED^2 * t^2
```

Where:

- `origin` comes from original `Center.C2`, moved by release-time horizontal QB motion.
- `receiverStart` is receiver position moved by release-time receiver motion and forced to `WR_MAX_Y`.
- `catchOffset` is `routeDir * CATCH_AHEAD_STUDS` only when receiver is moving.
- `QB_INHERITANCE = 0`, so `inheritedVelocity` is currently zero.

After a valid time is chosen:

```lua
requiredVelocity = neededDisplacement / time
throwVelocity = requiredVelocity.Unit * MODEL_BALL_SPEED
worldVelocity = throwVelocity + flat(qbVel) * QB_INHERITANCE
aimPoint = origin + requiredVelocity.Unit * AIM_SCALE
```

Candidate acceptance requires tight speed and miss tolerances. Invalid throws return no plan instead of falling back to a route-bucket scorer.

## Plan build path

```lua
local targetVelocity, routeDir, moving, routeSource = routeVelocity(data, receiverRoot)
return solve(qbRoot, ball, receiverRoot, targetVelocity, routeDir, moving, routeSource, ballPower, releaseOffset), ball
```

The route direction affects only receiver velocity and spatial catch-ahead. It should not reintroduce route-specific validity rules.
