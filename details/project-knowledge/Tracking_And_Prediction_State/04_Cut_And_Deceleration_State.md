# Cut and deceleration state

The current live script keeps only a small cut/stop reaction layer. Older experimental branches tracked heavier deceleration and acceleration lead fields, but those are not primary runtime throw math now.

## Current constants

```lua
CLEAN_MOVING_SPEED_MIN = 5.0
STOP_SPEED_THRESHOLD = 2.0
CUT_DOT_THRESHOLD = 0.45
```

## Current behavior

- Receiver velocity is flattened to X/Z.
- If current speed is below `STOP_SPEED_THRESHOLD`, the route can be treated as standing unless a previous direction is still usable.
- If the current direction sharply disagrees with the previous good direction, `routeSource` becomes `"cut_snap"`.
- Moving receivers use `currentDir * MAX_RUN_SPEED`.

This keeps direction changes responsive without restoring the older route-bucket scorer.

## Solver role

Cut/deceleration state only affects `wrVel`, `routeDir`, and `moving`.

The fixed-speed intercept still decides validity through projectile physics:

```lua
F(t) = |neededDisplacement|^2 - MODEL_BALL_SPEED^2 * t^2
```

Receiver Y velocity remains ignored because target Y is fixed to `WR_MAX_Y`.
