# Route velocity and speed state

This page reflects the restored `features/qb-aim/logic.lua` route velocity path.

## Route speed

The restored script uses a partial route-speed ramp:

```lua
local function routeSpeed(speed)
    local clamped = math.clamp(speed or 0, 0, MAX_RUN_SPEED)
    if clamped < ROUTE_LOCK_MIN_SPEED then
        return 0
    end

    if clamped >= NORMAL_ROUTE_MIN_SPEED then
        return MAX_RUN_SPEED
    end

    return math.clamp(clamped * ROUTE_SPEED_PARTIAL_GAIN, ROUTE_LOCK_MIN_SPEED, MAX_RUN_SPEED)
end
```

Current relevant constants:

```lua
MAX_RUN_SPEED = 21
NORMAL_ROUTE_MIN_SPEED = 19
ROUTE_LOCK_MIN_SPEED = 2.5
ROUTE_SPEED_PARTIAL_GAIN = 1.08
```

## Route velocity source

`routeVelocity` blends tracked/assembly/raw/least-squares velocity, then applies `routeSpeed`:

```lua
local rawVelocity, source = currentReceiverRawVelocity(data, receiverRoot, data and data.vel or Vector3.zero)
local speed = routeSpeed(rawVelocity.Magnitude)
if speed <= 0 then
    return Vector3.zero, "standing", { source = source }
end

local velocity = rawVelocity.Unit * speed
return velocity, "clean", state
```

## Interaction with intercept solver

Route velocity feeds the fixed-speed solve:

```lua
receiverStart = receiverMaxAt(receiverRoot.Position + wrVel * releaseOffset)
target = receiverStart + flat(wrVel) * (flightTime + leadDelayForFlightTime(flightTime))
```

Route labels are diagnostics only. The solver should still decide validity through projectile math.
