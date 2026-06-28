-- projectile math only. no gui state belongs in this file.

local QBAimMath={}

local BALL_G=28
local G=Vector3.new(0,-BALL_G,0)
local DEFAULT_BALL_SPEED=95

local function flat(v)
	return Vector3.new(v.X,0,v.Z)
end

local function unit(v,fallback)
	if v.Magnitude<1e-6 then
		return fallback or Vector3.new(1,0,0)
	end

	return v.Unit
end

local function clampMagnitude(v,maxMagnitude)
	if not v then
		return Vector3.zero
	end

	if v.Magnitude>maxMagnitude and maxMagnitude>0 then
		return v.Unit*maxMagnitude
	end

	return v
end

local function distXZ(a,b)
	return (flat(b)-flat(a)).Magnitude
end

local function ballAt(originPosition,velocity,time)
	return originPosition+velocity*time+0.5*G*time*time
end

local function landing(originPosition,velocity)
	local discriminant=velocity.Y*velocity.Y+2*BALL_G*originPosition.Y
	if discriminant<0 then return nil,nil end

	local time=(velocity.Y+math.sqrt(discriminant))/BALL_G
	if time<=0 then return nil,nil end

	return ballAt(originPosition,velocity,time),time
end

local function leadDelay(params,time)
	return math.max(params.leadDelay or 0,0)
end

local function receiverMaxAt(position,catchY)
	return Vector3.new(position.X,catchY,position.Z)
end

local function targetAtTime(params,receiverStart,wrVel,time)
	local delay=leadDelay(params,time)
	local target=receiverStart+flat(wrVel)*(time+delay)
	local catchY=(params.catchY or receiverStart.Y)+(params.solveYBias or 0)
	return Vector3.new(target.X,catchY,target.Z),delay
end

local function interceptValue(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,time)
	local inheritance=params.qbInheritance or 0
	local inheritedVelocity=flat(qbVel or Vector3.zero)*inheritance
	local target=targetAtTime(params,receiverStart,wrVel,time)
	local neededDisplacement=target-originPosition-inheritedVelocity*time-0.5*G*time*time
	return neededDisplacement:Dot(neededDisplacement)-ballSpeed*ballSpeed*time*time
end

local function interceptLeadInfo(params,originPosition,target,wrVel,time,predictorState)
	local wrFlat=flat(wrVel)
	local speed=math.max(wrFlat.Magnitude,1e-6)
	local losVector=flat(target-originPosition)
	local losDir=unit(losVector,wrFlat.Magnitude>0 and wrFlat.Unit or Vector3.new(1,0,0))
	local away=wrFlat:Dot(losDir)
	local awayShare=math.clamp(away/speed,-1,1)
	local lateralSpeed=(wrFlat-losDir*away).Magnitude
	local lateralShare=math.clamp(lateralSpeed/speed,0,1)
	local receiverPredictionDelay=leadDelay(params,time)
	local confidenceMin=params.predictorConfidenceMin or 0.30
	local confidenceMax=params.predictorConfidenceMax or 1.00
	local predictorConfidence=math.clamp(predictorState and predictorState.confidence or 1,confidenceMin,confidenceMax)
	local catchY=params.catchY or target.Y
	local leadBaseline=math.max(params.leadDelayBaseline or 0.01,0.01)
	local leadValue=params.leadDelay or 0
	local tangentDenominator=awayShare*awayShare+lateralShare*lateralShare+(params.tangentDominanceEpsilon or 1e-6)

	return{
		flightLeadXZ=wrFlat*time,
		accelerationLeadXZ=Vector3.zero,
		extraLeadXZ=wrFlat*receiverPredictionDelay,
		radialExtraLeadXZ=Vector3.zero,
		tangentExtraLeadXZ=wrFlat*receiverPredictionDelay,
		extraLeadTime=receiverPredictionDelay,
		radialExtraTime=0,
		tangentExtraTime=receiverPredictionDelay,
		tangentBaseTime=0,
		tangentReactiveTime=receiverPredictionDelay,
		radialBaseTime=0,
		radialLDTime=0,
		adaptiveLeadScale=1,
		leadUserScale=math.clamp(leadValue/leadBaseline,0,2.25),
		predictorConfidence=predictorConfidence,
		radialFlightScale=1,
		tangentFlightScale=1,
		accelTime=0,
		magnitudeChangePotential=0,
		c1Height=catchY,
		c1HeightMin=catchY,
		c1HeightMax=catchY,
		c1SolveYBias=params.solveYBias or 0,
		distance3DNow=(target-originPosition).Magnitude,
		distanceXZNow=distXZ(originPosition,target),
		distanceScale=1,
		awayShare=awayShare,
		positiveAwayShare=math.clamp(awayShare,0,1),
		radialShareAbs=math.abs(awayShare),
		lateralShare=lateralShare,
		routeBalance=1-math.abs(math.abs(awayShare)-lateralShare),
		balanceLeadScale=1,
		radialGain=0,
		tangentGain=0,
		losRate=0,
		losDamping=1,
		reactiveLosDamping=1,
		tangentAlignment=1,
		tangentAlignmentBoost=1,
		tangentBalanceBoost=1,
		tangentDominance=(lateralShare*lateralShare)/tangentDenominator,
		tangentBalancePeak=1,
		tangentDominanceScale=1,
		closingShare=math.clamp(-awayShare,0,1),
		tangentClosingScale=1,
		tangentSignedScale=1,
		routeAway=away,
		routeSide=lateralSpeed,
		routeElevation=0,
		routeSpeed=wrFlat.Magnitude,
		fixedIntercept=true,
		cleanMath=true,
		receiverPredictionDelay=receiverPredictionDelay,
		receiverPredictionDelayScale=leadValue>0 and receiverPredictionDelay/leadValue or 0,
	}
end

local function interceptCandidate(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,time,shape,predictorState,includeLeadInfo)
	if time<=0 then return nil end

	local inheritance=params.qbInheritance or 0
	local inheritedVelocity=flat(qbVel or Vector3.zero)*inheritance
	local target,receiverLeadDelay=targetAtTime(params,receiverStart,wrVel,time)
	local neededDisplacement=target-originPosition-inheritedVelocity*time-0.5*G*time*time
	local requiredVelocity=neededDisplacement/time
	local requiredSpeed=requiredVelocity.Magnitude
	if requiredSpeed<=1e-6 then return nil end

	local direction=requiredVelocity.Unit
	local angle=math.deg(math.asin(math.clamp(direction.Y,-1,1)))
	if angle<(params.minAngle or -5) or angle>(params.maxAngle or 55) then return nil end

	local throwVelocity=direction*ballSpeed
	local worldVelocity=throwVelocity+inheritedVelocity
	local catchPosition=ballAt(originPosition,worldVelocity,time)
	local targetMiss=(catchPosition-target).Magnitude
	local catchY=(params.catchY or receiverStart.Y)+(params.solveYBias or 0)
	local yError=math.abs(catchPosition.Y-catchY)
	local speedError=math.abs(requiredSpeed-ballSpeed)
	local residual=math.abs(interceptValue(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,time))
	local verticalVelocityAtCatch=worldVelocity.Y+G.Y*time
	local landingPosition,landingTime=landing(originPosition,worldVelocity)
	local leadDistance=flat(wrVel).Magnitude*receiverLeadDelay

	return{
		score=targetMiss*1000+speedError*100+time*0.5+math.max(verticalVelocityAtCatch-10,0)*0.25,
		time=time,
		totalLeadTime=time+receiverLeadDelay,
		receiverPredictionDelay=receiverLeadDelay,
		receiverPredictionDelayScale=(params.leadDelay or 0)>0 and receiverLeadDelay/(params.leadDelay or 1) or 0,
		receiverLeadDistance=leadDistance,
		origin=originPosition,
		target=target,
		c1Point=target,
		requiredVelocity=requiredVelocity,
		requiredSpeed=requiredSpeed,
		direction=direction,
		throwVelocity=throwVelocity,
		worldVelocity=worldVelocity,
		velocity=worldVelocity,
		speed=ballSpeed,
		aimPoint=originPosition+direction*(params.aimScale or 1000),
		angleDeg=angle,
		preferredAngle=angle,
		minDesiredAngle=params.minAngle or -5,
		maxAngle=params.maxAngle or 55,
		totalErr=targetMiss,
		targetMiss=targetMiss,
		yError=yError,
		speedError=speedError,
		verticalVelocityAtCatch=verticalVelocityAtCatch,
		interceptResidual=residual,
		missEstimate=targetMiss,
		ballAtCatch=catchPosition,
		landing=landingPosition,
		landingTime=landingTime,
		flatDistNow=distXZ(originPosition,receiverStart),
		movementShape=shape,
		predictorState=predictorState,
		leadInfo=includeLeadInfo and interceptLeadInfo(params,originPosition,target,wrVel,time,predictorState) or nil,
		cleanMath=true,
	}
end

local function betterIntercept(candidate,current)
	if not current then return true end
	if candidate.score+1e-6<current.score then return true end
	if current.score+1e-6<candidate.score then return false end
	return candidate.time<current.time
end

local function refineInterceptTime(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,lo,hi,loValue)
	local low=lo
	local high=hi
	local lowValue=loValue or interceptValue(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,low)

	for _=1,(params.bisectionSteps or 12) do
		local mid=(low+high)*0.5
		local midValue=interceptValue(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,mid)

		if math.abs(midValue)<1e-5 then
			return mid
		end

		if (lowValue<0 and midValue>0) or (lowValue>0 and midValue<0) then
			high=mid
		else
			low=mid
			lowValue=midValue
		end
	end

	return(low+high)*0.5
end

function QBAimMath.ballAt(originPosition,velocity,time)
	return ballAt(originPosition,velocity,time)
end

function QBAimMath.solve(params)
	local ballSpeed=params.ballPower or DEFAULT_BALL_SPEED
	local qbReleaseOffset=params.qbReleaseOffset or 0
	local receiverReleaseOffset=params.receiverReleaseOffset
	if receiverReleaseOffset==nil then
		receiverReleaseOffset=qbReleaseOffset
	end

	local maxRunSpeed=params.maxRunSpeed or 21
	local wrVel=clampMagnitude(flat(params.targetVelocity or Vector3.zero),maxRunSpeed)
	local qbVel=clampMagnitude(flat(params.qbVelocity or Vector3.zero),maxRunSpeed)
	local originPosition=params.originPosition
	local receiverBasePosition=params.receiverAnchorPosition or params.receiverPosition
	if not(originPosition and receiverBasePosition) then
		return nil
	end

	local receiverReleasePosition=receiverBasePosition+wrVel*receiverReleaseOffset
	local receiverStart=receiverMaxAt(receiverReleasePosition,params.catchY or receiverReleasePosition.Y)
	local bestRoot=nil
	local bestNear=nil
	local minT=params.minTime or 0.35
	local maxT=params.maxTime or 6
	local dt=params.dt or 0.01
	local previousTime=minT
	local previousValue=interceptValue(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,previousTime)

	local function considerNear(time)
		local candidate=interceptCandidate(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,time,params.shape,params.predictorState,false)
		if candidate and candidate.targetMiss<=(params.nearTargetMissTolerance or 0.05) and candidate.yError<=(params.catchYTolerance or 0.35) and betterIntercept(candidate,bestNear) then
			bestNear=candidate
		end
	end

	local function considerRoot(time)
		local candidate=interceptCandidate(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,time,params.shape,params.predictorState,false)
		if candidate and candidate.targetMiss<=(params.targetMissTolerance or 0.35) and candidate.yError<=(params.catchYTolerance or 0.35) and betterIntercept(candidate,bestRoot) then
			bestRoot=candidate
		end
	end

	considerNear(previousTime)

	for time=minT+dt,maxT,dt do
		local value=interceptValue(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,time)
		considerNear(time)

		if math.abs(value)<1e-8 then
			considerRoot(time)
		elseif math.abs(previousValue)<1e-8 then
			considerRoot(previousTime)
		elseif (previousValue<0 and value>0) or (previousValue>0 and value<0) then
			considerRoot(refineInterceptTime(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,previousTime,time,previousValue))
		end

		previousTime=time
		previousValue=value
	end

	local best=bestRoot or bestNear
	if best and not best.leadInfo then
		best.leadInfo=interceptLeadInfo(params,originPosition,best.target,wrVel,best.time,params.predictorState)
	end
	if best then
		best.qbReleaseOffset=qbReleaseOffset
		best.qbSharedReleaseOffset=qbReleaseOffset
		best.receiverReleaseOffset=receiverReleaseOffset
		best.receiverAnchorSource=params.receiverAnchorSource or "root"
		best.receiverAnchorPosition=receiverBasePosition
		best.futureReleaseOriginLatch=qbReleaseOffset>0
		best.remoteFireDelayed=params.remoteFireDelayed~=false
	end

	return best
end

return QBAimMath
