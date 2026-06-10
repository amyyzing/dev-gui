# Route velocity and speed state

This page reflects the current live `page-1/qb-aim/logic.lua` route velocity path.

## Current route velocity model

The current solver wants a clean route direction and a bounded receiver velocity. It no longer uses the older route-speed ramp helpers.

```lua
local function routeVelocity(data, receiverRoot)
    local currentVelocity = currentReceiverRawVelocity(data, receiverRoot, data and data.vel or Vector3.zero)
    local currentSpeed = currentVelocity.Magnitude
    local previousDir = data and data.lastGoodDir
    local currentDir = currentSpeed >= STOP_SPEED_THRESHOLD and currentVelocity.Unit or previousDir

    if not currentDir then
        return Vector3.zero, Vector3.new(1, 0, 0), false, "standing"
    end

    local source = "current"
    if previousDir and currentVelocity.Magnitude >= CLEAN_MOVING_SPEED_MIN and previousDir:Dot(currentDir) < CUT_DOT_THRESHOLD then
        source = "cut_snap"
    end

    return currentDir * MAX_RUN_SPEED, currentDir, true, source
end
```

Relevant constants:

```lua
MAX_RUN_SPEED = 21
CLEAN_MOVING_SPEED_MIN = 5.0
STOP_SPEED_THRESHOLD = 2.0
CUT_DOT_THRESHOLD = 0.45
```

## Interaction with intercept solver

Route velocity feeds the universal fixed-speed solve:

```lua
target(t) = receiverStart + flat(wrVel) * t + catchOffset(routeDir, moving)
```

Where `catchOffset` is a spatial offset:

```lua
moving and routeDir * CATCH_AHEAD_STUDS or Vector3.zero
```

This means slants, streaks, posts, and crossings use the same projectile equation. Route direction only determines receiver motion and the optional catch-ahead vector.
