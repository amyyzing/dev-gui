# Constants index

This file tracks the current live `page-1/qb-aim/logic.lua` constants that matter for throw math, preview behavior, remotes, and receiver prediction.

## Ball and remote

```lua
local BALL_G=28
local MODEL_BALL_SPEED=95
local REMOTE_DISPLAY_POWER=100
local GAMEPLAY_BALL_POWER=MODEL_BALL_SPEED
local SQUADS_BALL_POWER=MODEL_BALL_SPEED
```

- The local projectile math solves with speed `95`.
- The game remote still sends display power `100`.
- Do not collapse these into one value unless the server contract changes.

## Receiver peak target

```lua
local PLAYER_G=196.2
local JUMP_POWER=55.5
local WR_STANDING_TOP_Y=6.00
local WR_MAX_Y=WR_STANDING_TOP_Y+(JUMP_POWER*JUMP_POWER)/(2*PLAYER_G)
local C1_Y_MIN=WR_MAX_Y
local C1_Y_MAX=WR_MAX_Y
local C1_Y_FIXED=WR_MAX_Y
local C1_Y_POTENTIAL_EXPONENT=1.00
local C1_SOLVE_Y_BIAS=0.00
```

- Current C1 Y is fixed at `WR_MAX_Y`, about `13.85`.
- The old `13.00 -> 13.85` route-dominance range is not active in the live solver.

## Receiver velocity and lead adjustment

```lua
local MAX_RUN_SPEED=21
local NORMAL_ROUTE_MIN_SPEED=19
local ROUTE_LOCK_MIN_SPEED=2.5
local ROUTE_LOCK_MAX_AGE=1.5
local WR_LEAD_DELAY=0.2
local LEAD_DELAY_BASELINE=0.20
local LEAD_DELAY_ZERO_FLIGHT_TIME=0.70
local LEAD_DELAY_FULL_FLIGHT_TIME=1.35
local ROUTE_SPEED_PARTIAL_GAIN=1.08
```

- `WR_LEAD_DELAY` is extra receiver prediction time.
- The intercept target starts from `receiverRoot.Position + wrVel * releaseOffset`.
- The extra lead delay is applied inside the intercept equation as `wrVel * leadDelayForFlightTime(t)`.
- `leadDelayForFlightTime(t)` ramps from `0` at `0.70s` flight time to full `WR_LEAD_DELAY` at `1.35s`.
- `0.20` is the baseline calculator value.

## Axis-invariant predictor support

```lua
local ADAPTIVE_LEAD_ENABLED=true
local PREDICTOR_HISTORY_MAX_AGE=1.25
local PREDICTOR_MIN_SAMPLES=3
local PREDICTOR_LS_BLEND=0.45
local PREDICTOR_VELOCITY_BLEND=0.42
local PREDICTOR_ACCEL_BLEND=0.28
local PREDICTOR_ACCEL_MAX=48
local PREDICTOR_ACCEL_TIME_MAX=1.05
local PREDICTOR_ACCEL_LEAD_SCALE=0.22
local PREDICTOR_ACCEL_LEAD_MAX=9.5
local PREDICTOR_CONFIDENCE_MIN=0.30
local PREDICTOR_CONFIDENCE_MAX=1.00
local PREDICTOR_STALE_AFTER=0.35
```

- These still affect receiver velocity estimation and diagnostics.
- They should not reintroduce route-bucket C1 validity rules.

## Release and C2 preview

```lua
local QB_RELEASE_DELAY=0.25
local QB_XZ_RELEASE_FACTOR=0
local QB_LAUNCH_Y_BIAS=0
local QB_RELEASE_EXTRAPOLATE_HORIZONTAL=true
local QB_RELEASE_EXTRAPOLATE_VERTICAL=false
local C2_GROUND_FALLBACK_MARGIN=2.50
local C2_MAX_ABOVE_BALL=8.00
```

- Horizontal release extrapolation remains enabled.
- Vertical release extrapolation is disabled so preview C2 follows the current ball/Center C2 reference instead of being pulled down by player gravity while jumping.

## Fixed-speed intercept solver

```lua
local MIN_T,MAX_T,DT=0.35,6,0.01
local QB_INHERITANCE=0
local INTERCEPT_BISECTION_STEPS=12
local SPEED_TOLERANCE=1.25
local CATCH_TOLERANCE=2.0
local GLOBAL_MIN_ANGLE=-5
local GLOBAL_MAX_ANGLE=55
```

- The solver scans `MIN_T -> MAX_T`, refines sign-change roots with bisection, and accepts only tight near-root fallbacks.
- `QB_INHERITANCE` remains `0`; QB movement shifts the release position but is not added to the football velocity.

## Preview

```lua
local ARC_PREVIEW_ENABLED=true
local ARC_PREVIEW_UPDATE_INTERVAL=0.035
local RECEIVER_TRACK_INTERVAL=0.05
local FREEZE_PREVIEW_WHILE_BALL_RELEASED=true
local PREVIEW_POST_THROW_FREEZE_MIN=0.75
local PREVIEW_MISSING_BALL_GRACE=0.2
local ARC_MAX_CURVE=400
local PREVIEW_SMOOTH=0.28
local C1_MARKER_ENABLED=true
local C1_MARKER_SIZE=1.65
```

- `C2` is the start/release attachment.
- `C1` and `C3` are both placed on the intercept catch point in the current preview path.
