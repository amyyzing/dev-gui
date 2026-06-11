# Game source findings

This file is the short, source-backed entry point for facts that should guide future project edits.

## Football math

Source: `FootballMath.md`

- `FootballMath.Settings.Gravity = -28`.
- `FootballMath.Settings.TimeScale = 1`.
- `FootballMath.Settings.MaxPower = 100`.
- `FootballMath.Settings.MinPower = 30`.
- `FootballMath.Settings.MaximumPowerCoefficient = 0.95`.
- `GetVelocityForPass(origin, target, time)` uses:

```lua
(target - GravityVectorConstant * time^2 / 2 - origin) / time
```

- Therefore display power `100` maps to modeled speed `95`.
- Preview beam orientation should follow `FootballMath:BeamDirection`, which builds endpoint CFrames from the projectile velocity and gravity curve. If a cloned beam is upright while the game beam is flat, the clone's attachment basis is wrong, not the projectile equation.

## Throw flow

Sources: `Mechanics.md`, `MECH_ControlsQuarterback.md`, `MECH_Animations.md`

- `Mechanics.BallPower` defaults to `100`.
- Ball power tiers are `{65, 85, 100}` when tiered power is active.
- `FootballThrow` plays `UF_QuarterbackThrow` at speed `1.35`.
- It waits `0.26666666666666666` seconds before firing the throw remote.
- It builds the target from a screen ray by default: `ray.Origin + ray.Direction * 1000`.
- It sends:

```lua
ReEvent:FireServer("Mechanics", "ThrowBall", {
    AutoThrow = false,
    Target = target,
    Power = BallPower,
})
```

- Then it calls `UnequipFootball()`.

## Release origin

Source-backed implication from `FootballThrow`, incoming `UpdateFootball`, and the live arc rig:

- The ball's visible part position is not the right source of truth for release math.
- The incoming `UpdateFootball.SpawnPos` value is the strongest available evidence for the true server/model release position.
- The restored runtime uses original `Local.Center.C2` as a Y-height reference when it is near the ball, while X/Z come from the held ball/root path.
- The cloned `ClonedCenter.C2` remains preview-only to avoid feedback loops.

## Current project choices

- Keep `MODEL_BALL_SPEED = 95` when remote display power is `100`.
- Keep `REMOTE_DISPLAY_POWER = 100` unless custom-power support is added intentionally.
- Keep `THROW_ANIMATION_RELEASE_WAIT = 0.26666666666666666`.
- Keep `THROW_ANIMATION_SPEED = 1.35`.
- Keep projectile gravity magnitude `28`.
- Treat `Lead Adjust` as a restored time-based receiver prediction control.
- Use captured `UpdateFootball.SpawnPos` to decide whether a future release-origin change should use full `Center.C2`, `Center.C3`, ball position, or another offset.
