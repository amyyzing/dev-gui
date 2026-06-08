# Route velocity and speed state

This page reflects the current live `page-1/qb-aim/logic.lua` route velocity path.

## Route speed

The live script uses partial route speed:

```lua
local function routeSpeed(speed)
	local clamped=math.clamp(speed or 0,0,MAX_RUN_SPEED)
	if clamped<ROUTE_LOCK_MIN_SPEED then
		return 0
	end

	if clamped>=NORMAL_ROUTE_MIN_SPEED then
		return MAX_RUN_SPEED
	end

	return math.clamp(clamped*ROUTE_SPEED_PARTIAL_GAIN,ROUTE_LOCK_MIN_SPEED,MAX_RUN_SPEED)
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

`routeVelocity` uses `predictionState`, `updateStable`, and the measured receiver velocity. The H lock keeps the receiver identity stable, but the velocity can still blend toward current measured movement.

```lua
local function routeVelocity(receiver,data,origin,receiverRoot,routeLock)
	local state=predictionState(data,receiverRoot.Position,data and data.vel or Vector3.zero)
	local measuredVelocity=clampMagnitude(flat(state.velocity or Vector3.zero),MAX_RUN_SPEED)
	local measuredSpeed=measuredVelocity.Magnitude
	local adjustedSpeed=routeSpeed(measuredSpeed)
	local stableDirection,stableSpeed=updateStable(data)
	local velocity=Vector3.zero

	if stableDirection and stableSpeed>0 then
		velocity=stableDirection*stableSpeed
		if measuredSpeed>=ROUTE_LOCK_MIN_SPEED and adjustedSpeed>0 then
			local reactiveVelocity=measuredVelocity.Unit*adjustedSpeed
			velocity=safeVectorLerp(velocity,reactiveVelocity,math.clamp((state.confidence or 0)*0.38,0,0.38))
		end
	elseif measuredSpeed>=ROUTE_LOCK_MIN_SPEED and adjustedSpeed>0 then
		velocity=measuredVelocity.Unit*adjustedSpeed
	else
		state.routeVelocity=Vector3.zero
		return Vector3.zero,"standing",state
	end

	velocity=clampMagnitude(flat(velocity),MAX_RUN_SPEED)
	state.routeVelocity=velocity
	return velocity,movementShape(origin,receiverRoot.Position,velocity),state
end
```

## Interaction with intercept solver

The route velocity is no longer used to create route-bucket extra lead as the primary validity rule. It feeds `wrVel` into the fixed-speed intercept solve:

```lua
receiverStart = receiverMaxAt(receiverRoot.Position + wrVel * releaseOffset)
target = targetAtTime(receiverStart, wrVel, flightTime, leadDelayForFlightTime(flightTime))
```

Then the solver chooses a time where a `MODEL_BALL_SPEED = 95` projectile can hit that peak-height moving target.
