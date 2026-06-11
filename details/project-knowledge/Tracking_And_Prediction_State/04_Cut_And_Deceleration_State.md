# Cut and deceleration state

The restored runtime uses a softer receiver velocity model rather than the later fixed spatial-offset direction snap.

## Current constants

```lua
CLEAN_MOVING_SPEED_MIN = 5.0
NORMAL_ROUTE_MIN_SPEED = 19
ROUTE_LOCK_MIN_SPEED = 2.5
PREDICTOR_LS_BLEND = 0.45
PREDICTOR_VELOCITY_BLEND = 0.42
PREDICTOR_ACCEL_BLEND = 0.28
```

## Current behavior

- Receiver velocity is flattened to X/Z.
- Stored tracked velocity, AssemblyLinearVelocity, raw delta velocity, and least-squares velocity can contribute.
- `routeSpeed` maps partial movement speeds toward a model route speed capped at `21`.
- Heavy experimental cut/deceleration fields are not primary throw math in the restored version.

## Solver role

Prediction state only affects `wrVel`.

The fixed-speed intercept still decides validity through projectile physics:

```lua
F(t) = |neededDisplacement|^2 - MODEL_BALL_SPEED^2 * t^2
```

Receiver Y velocity remains ignored because target Y is fixed to `WR_MAX_Y`.
