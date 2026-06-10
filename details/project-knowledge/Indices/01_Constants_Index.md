# Constants index

This tracks current live `page-1/qb-aim/logic.lua` constants plus game-source constants confirmed by the new markdown source.

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

Implications:

- Display power `100` maps to modeled speed `95`.
- Ball gravity magnitude is `28`.
- The project should keep display power and model speed separate unless custom-power support is added deliberately.

## Ball and remote

```lua
local BALL_G=28
local MODEL_BALL_SPEED=95
local REMOTE_DISPLAY_POWER=100
local GAMEPLAY_BALL_POWER=MODEL_BALL_SPEED
local SQUADS_BALL_POWER=MODEL_BALL_SPEED
```

- The local projectile math solves with speed `95`.
- The game remote sends display power `100`.

## Receiver target and catch ahead

```lua
local DEFAULT_WR_MAX_Y=14.00
local WR_MAX_Y=DEFAULT_WR_MAX_Y
local C1_SOLVE_Y_BIAS=0.00
local MAX_RUN_SPEED=21
local CATCH_AHEAD_STUDS=8.0
local CATCH_AHEAD_MIN=0.00
local CATCH_AHEAD_MAX=16.00
```

- Default C1/catch Y is `14.00`.
- `Peak Height` persists through `state.qbAimPeakHeight`, clamped from `8.00` to `20.00`.
- `Catch Ahead` is a spatial offset in studs along route direction.
- Old `qbAimLeadDelay` state is a compatibility mirror, not current runtime math.

## Receiver velocity estimation

```lua
local CLEAN_MOVING_SPEED_MIN=5.0
local STOP_SPEED_THRESHOLD=2.0
local CUT_DOT_THRESHOLD=0.45
local PREDICTOR_HISTORY_MAX_AGE=1.25
local PREDICTOR_MIN_SAMPLES=3
local PREDICTOR_LS_BLEND=0.45
local PREDICTOR_VELOCITY_BLEND=0.42
local PREDICTOR_ACCEL_BLEND=0.28
local PREDICTOR_ACCEL_MAX=48
local PREDICTOR_AVERAGE_SAMPLES=5
```

- `routeVelocity` uses flat measured/averaged receiver velocity.
- Moving receivers are modeled at `MAX_RUN_SPEED` in their current route direction.
- Strong direction cuts can snap route direction with `routeSource = "cut_snap"`.

## Release and C2

```lua
local QB_RELEASE_DELAY=0.25
local QB_LAUNCH_Y_BIAS=0
local QB_Y_RISE_FACTOR=0
local QB_Y_FALL_FACTOR=0
local QB_Y_MAX_CORRECTION=4.25
local QB_RELEASE_EXTRAPOLATE_HORIZONTAL=true
local QB_RELEASE_EXTRAPOLATE_VERTICAL=false
```

- The solver uses the original game `Center.C2` world frame as release origin when available.
- Horizontal release extrapolation moves the C2 origin by QB root X/Z velocity during release wait.
- Vertical release extrapolation is disabled; current Y comes from original `Center.C2` plus zeroed QB jump correction.
- The cloned preview `ClonedCenter.C2` is visual-only and must not drive math.

## Fixed-speed intercept solver

```lua
local MIN_T,MAX_T,DT=0.35,6,0.01
local INTERCEPT_SCAN_DT=0.025
local QB_INHERITANCE=0
local INTERCEPT_BISECTION_STEPS=12
local INTERCEPT_MIN_SEARCH_STEPS=14
local SPEED_ERROR_TOLERANCE=0.50
local MISS_TOLERANCE=1.50
local GLOBAL_MIN_ANGLE=-5
local GLOBAL_MAX_ANGLE=55
```

- The solver scans time, refines sign-change roots, and also refines local minima of speed error.
- Candidate throws must satisfy speed, target miss, and Y miss tolerances.
- `QB_INHERITANCE` remains `0`; QB movement shifts release position, not football velocity.

## Preview and animation

```lua
local ARC_PREVIEW_ENABLED=true
local ARC_PREVIEW_UPDATE_INTERVAL=0.035
local ARC_PREVIEW_ROLL=math.rad(90)
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
- `ARC_PREVIEW_ROLL` corrects cloned beam attachment orientation.
- The locked receiver is shown through a QB Aim-owned highlight, separate from ESP highlights.
