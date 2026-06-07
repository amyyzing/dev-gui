# Receiver prediction state

This page replaces the older cut-reactive notes. The current live script uses a smoother axis-invariant predictor state rather than the hard cut/deceleration constants from the experimental branch.

## Main constants

```lua
PREDICTOR_HISTORY_MAX_AGE = 1.25
PREDICTOR_MIN_SAMPLES = 3
PREDICTOR_LS_BLEND = 0.45
PREDICTOR_VELOCITY_BLEND = 0.42
PREDICTOR_ACCEL_BLEND = 0.28
PREDICTOR_ACCEL_MAX = 48
PREDICTOR_ACCEL_TIME_MAX = 1.05
PREDICTOR_ACCEL_LEAD_SCALE = 0.22
PREDICTOR_ACCEL_LEAD_MAX = 9.5
PREDICTOR_CONFIDENCE_MIN = 0.30
PREDICTOR_CONFIDENCE_MAX = 1.00
PREDICTOR_STALE_AFTER = 0.35
```

## Predictor state source

```lua
local function predictionState(data,receiverPosition,fallbackVelocity)
	local now=os.clock()
	local rawVelocity=clampMagnitude(flat((data and data.rawVel) or fallbackVelocity or Vector3.zero),MAX_RUN_SPEED)
	local measuredVelocity=clampMagnitude(flat((data and data.vel) or rawVelocity or Vector3.zero),MAX_RUN_SPEED)
	local lsVelocity,lsQuality=leastSquaresVelocity(data,now)
	local blendedVelocity=measuredVelocity

	if lsVelocity and lsVelocity.Magnitude>=ROUTE_LOCK_MIN_SPEED then
		blendedVelocity=safeVectorLerp(measuredVelocity,lsVelocity,PREDICTOR_LS_BLEND*lsQuality)
	end

	blendedVelocity=clampMagnitude(blendedVelocity,MAX_RUN_SPEED)
	local acceleration=clampMagnitude(flat(data and data.accel or Vector3.zero),PREDICTOR_ACCEL_MAX)
	local sampleAge=data and data.lastSeen and math.max(now-data.lastSeen,0) or PREDICTOR_STALE_AFTER
	local ageConfidence=1-math.clamp(sampleAge/PREDICTOR_STALE_AFTER,0,1)
	local speedConfidence=math.clamp(rawVelocity.Magnitude/NORMAL_ROUTE_MIN_SPEED,0,1)
	local storedConfidence=math.clamp(data and data.confidence or PREDICTOR_CONFIDENCE_MIN,PREDICTOR_CONFIDENCE_MIN,PREDICTOR_CONFIDENCE_MAX)
	local confidence=math.clamp((0.35*storedConfidence+0.35*lsQuality+0.30*speedConfidence)*ageConfidence,PREDICTOR_CONFIDENCE_MIN,PREDICTOR_CONFIDENCE_MAX)

	return{
		position=receiverPosition,
		velocity=blendedVelocity,
		rawVelocity=rawVelocity,
		acceleration=acceleration,
		confidence=confidence,
		lsQuality=lsQuality,
		sampleAge=sampleAge,
		routeVelocity=blendedVelocity,
	}
end
```

## Current role

- The predictor estimates receiver X/Z velocity and acceleration.
- The fixed-speed intercept solver ignores receiver Y velocity because C1 Y is fixed at `WR_MAX_Y`.
- Acceleration fields are retained for diagnostics and old metadata, but the current intercept root uses `wrVel`, `qbVel`, gravity, and speed `95`.
