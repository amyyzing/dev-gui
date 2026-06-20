# Constants index

This tracks current live `features/qb-aim/logic.lua` constants plus game-source constants confirmed by markdown source.

## Game-source football constants

From `details/project-knowledge/FootballMath.md`:

```lua
Settings.FPS = 60
Settings.TimeScale = 1
Settings.Gravity = -28
Settings.MaxPower = 100
Settings.MinPower = 30
Settings.MaximumPowerCoefficient = 0.95
Settings.MaxTimeInAir = 6
```

- Display power `100` maps to modeled speed `95`.
- Ball gravity magnitude is `28`.

## Ball and remote

```lua
local BALL_G=28
local MODEL_BALL_SPEED=95
local REMOTE_DISPLAY_POWER=100
local GAMEPLAY_BALL_POWER=MODEL_BALL_SPEED
local SQUADS_BALL_POWER=MODEL_BALL_SPEED
```

## Receiver target and lead delay

```lua
local DEFAULT_WR_MAX_Y=14.00
local WR_MAX_Y=DEFAULT_WR_MAX_Y
local C1_SOLVE_Y_BIAS=0.00
local MAX_RUN_SPEED=21
local NORMAL_ROUTE_MIN_SPEED=19
local ROUTE_LOCK_MIN_SPEED=2.5
local ROUTE_SPEED_PARTIAL_GAIN=1.08
local WR_LEAD_DELAY=0.38
local LEAD_DELAY_ZERO_FLIGHT_TIME=0.70
local LEAD_DELAY_FULL_FLIGHT_TIME=1.35
```

- Default C1/catch Y is `14.00`.
- `Peak Height` persists through `state.qbAimPeakHeight`, clamped from `8.00` to `20.00`.
- `Lead Adjust` persists through `state.qbAimLeadDelay`, clamped from `0.00` to `1.50`.
- `leadDelayForFlightTime` tapers the extra receiver prediction from zero to `WR_LEAD_DELAY` as flight time moves from `0.70` to `1.35`.

## Receiver velocity estimation

```lua
local CLEAN_MOVING_SPEED_MIN=5.0
local CLEAN_CATCH_Y_TOLERANCE=0.35
local CLEAN_TARGET_MISS_TOLERANCE=0.35
local CLEAN_NEAR_TARGET_MISS_TOLERANCE=0.05
local PREDICTOR_HISTORY_MAX_AGE=1.25
local PREDICTOR_MIN_SAMPLES=3
local PREDICTOR_LS_BLEND=0.45
local PREDICTOR_VELOCITY_BLEND=0.42
local PREDICTOR_ACCEL_BLEND=0.28
local PREDICTOR_ACCEL_MAX=48
local PREDICTOR_AVERAGE_SAMPLES=5
```

- `routeVelocity` uses flat tracked, assembly, raw, and least-squares velocity.
- Moving receivers use `routeSpeed`, capped at `MAX_RUN_SPEED`.

## Release and C2

```lua
local QB_RELEASE_DELAY=0.25
local QB_LAUNCH_Y_BIAS=0
local QB_Y_RISE_FACTOR=0
local QB_Y_FALL_FACTOR=0
local QB_Y_MAX_CORRECTION=4.25
local C2_GROUND_FALLBACK_MARGIN=2.50
local C2_MAX_ABOVE_BALL=8.00
local QB_RELEASE_EXTRAPOLATE_HORIZONTAL=true
local QB_RELEASE_EXTRAPOLATE_VERTICAL=false
```

- The restored runtime uses the held ball/root position as base origin.
- Original game `Center.C2.Y` is used when it is within the ball-relative fallback range.
- Horizontal release extrapolation moves origin X/Z by QB root velocity during release wait.
- Vertical release extrapolation is disabled.

## Fixed-speed intercept solver

```lua
local MIN_T,MAX_T,DT=0.35,6,0.01
local INTERCEPT_SCAN_DT=0.025
local QB_INHERITANCE=0
local INTERCEPT_BISECTION_STEPS=12
local GLOBAL_MIN_ANGLE=-5
local GLOBAL_MAX_ANGLE=55
```

- The solver scans time and refines sign-change roots.
- Candidate throws must satisfy target miss and Y miss tolerances.
- `QB_INHERITANCE` remains `0`; QB movement shifts release position, not football velocity.

## Preview and animation

```lua
local ARC_PREVIEW_ENABLED=true
local ARC_PREVIEW_UPDATE_INTERVAL=0.035
local FREEZE_PREVIEW_WHILE_BALL_RELEASED=true
local PREVIEW_POST_THROW_FREEZE_MIN=0.75
local PREVIEW_MISSING_BALL_GRACE=0.2
local ARC_MAX_CURVE=400
local PREVIEW_SMOOTH=1.00
local C1_MARKER_ENABLED=true
local C1_MARKER_SIZE=1.65
local THROW_ANIMATION_NAME="UF_QuarterbackThrow"
local THROW_ANIMATION_SPEED=1.35
local THROW_ANIMATION_RELEASE_WAIT=0.26666666666666666
local QB_AIM_HIGHLIGHT_NAME="QBAimTargetHighlight"
```

- `THROW_ANIMATION_SPEED` and release wait match decompiled `MECH_ControlsQuarterback.FootballThrow`.
- The restored runtime uses normal `xAxisCFrame` preview attachment orientation, with no 90 degree preview roll.
