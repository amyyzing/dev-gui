local qbAimMath={}

local ballGravity=28
local gravityVector=Vector3.new(0,-ballGravity,0)
local defaultBallSpeed=95

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
	return originPosition+velocity*time+0.5*gravityVector*time*time
end

local function landing(originPosition,velocity)
	local discriminant=velocity.Y*velocity.Y+2*ballGravity*originPosition.Y
	if discriminant<0 then return nil,nil end

	local time=(velocity.Y+math.sqrt(discriminant))/ballGravity
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
	local neededDisplacement=target-originPosition-inheritedVelocity*time-0.5*gravityVector*time*time
	return neededDisplacement:Dot(neededDisplacement)-ballSpeed*ballSpeed*time*time
end

local function interceptPolynomial(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed)
	local inheritance=params.qbInheritance or 0
	local inheritedVelocity=flat(qbVel or Vector3.zero)*inheritance
	local receiverDelay=leadDelay(params,0)
	local a=receiverStart+flat(wrVel)*receiverDelay-originPosition
	local b=flat(wrVel)-inheritedVelocity
	local c=-0.5*gravityVector

	return{
		c0=a:Dot(a),
		c1=2*a:Dot(b),
		c2=b:Dot(b)+2*a:Dot(c)-ballSpeed*ballSpeed,
		c3=2*b:Dot(c),
		c4=c:Dot(c),
	}
end

local function countEvaluation(stats,key)
	if type(stats)=="table" then
		stats[key]=(stats[key] or 0)+1
	end
end

local function polynomialValue(polynomial,time,stats)
	countEvaluation(stats,"scalarEvaluations")
	return((((polynomial.c4*time+polynomial.c3)*time+polynomial.c2)*time+polynomial.c1)*time+polynomial.c0)
end

local function polynomialDerivative(polynomial,time,stats)
	countEvaluation(stats,"derivativeEvaluations")
	return((4*polynomial.c4*time+3*polynomial.c3)*time+2*polynomial.c2)*time+polynomial.c1
end

local function polynomialSecondDerivative(polynomial,time)
	return(12*polynomial.c4*time+6*polynomial.c3)*time+2*polynomial.c2
end

local function oppositeSigns(a,b)
	return(a<0 and b>0) or(a>0 and b<0)
end

local function realQuadraticRoots(a,b,c)
	if math.abs(a)<=1e-12 then
		if math.abs(b)<=1e-12 then return{} end
		return{-c/b}
	end

	local discriminant=b*b-4*a*c
	if discriminant<-1e-12 then return{} end
	if math.abs(discriminant)<=1e-12 then return{-b/(2*a)} end

	local root=math.sqrt(math.max(0,discriminant))
	local q=-0.5*(b+(b>=0 and root or -root))
	if math.abs(q)<=1e-12 then
		return{(-b-root)/(2*a),(-b+root)/(2*a)}
	end
	return{q/a,c/q}
end

local function valueTolerance(polynomial,time,ballSpeed)
	local scale=math.max(
		1,
		math.abs(polynomial.c0),
		math.abs(polynomial.c1*time),
		math.abs(polynomial.c2*time*time),
		math.abs(polynomial.c3*time*time*time),
		math.abs(polynomial.c4*time*time*time*time),
		ballSpeed*ballSpeed*time*time
	)
	return scale*1e-10
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
		mathOk=true,
		receiverPredictionDelay=receiverPredictionDelay,
		receiverPredictionDelayScale=leadValue>0 and receiverPredictionDelay/leadValue or 0,
	}
end

local function interceptCandidate(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,time,shape,predictorState,includeLeadInfo,polynomial,stats)
	if time<=0 then return nil end
	countEvaluation(stats,"candidateEvaluations")

	local inheritance=params.qbInheritance or 0
	local inheritedVelocity=flat(qbVel or Vector3.zero)*inheritance
	local target,receiverLeadDelay=targetAtTime(params,receiverStart,wrVel,time)
	local neededDisplacement=target-originPosition-inheritedVelocity*time-0.5*gravityVector*time*time
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
	local residual=math.abs(polynomial and polynomialValue(polynomial,time,stats) or interceptValue(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,time))
	local verticalVelocityAtCatch=worldVelocity.Y+gravityVector.Y*time
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
		mathOk=true,
	}
end

local function betterIntercept(candidate,current)
	if not current then return true end
	if candidate.score+1e-6<current.score then return true end
	if current.score+1e-6<candidate.score then return false end
	return candidate.time<current.time
end

local function refineRoot(polynomial,lo,hi,loValue,hiValue,iterations,ballSpeed,stats)
	local low=lo
	local high=hi
	local lowValue=loValue or polynomialValue(polynomial,low,stats)
	local highValue=hiValue or polynomialValue(polynomial,high,stats)
	local current=(low+high)*0.5

	for _=1,iterations do
		local value=polynomialValue(polynomial,current,stats)
		if math.abs(value)<=valueTolerance(polynomial,current,ballSpeed) then
			return current
		end

		if oppositeSigns(lowValue,value) then
			high=current
			highValue=value
		else
			low=current
			lowValue=value
		end

		local derivative=polynomialDerivative(polynomial,current,stats)
		local nextTime=nil
		if math.abs(derivative)>1e-9 then
			nextTime=current-value/derivative
		end
		if not nextTime or nextTime<=low or nextTime>=high then
			nextTime=(low+high)*0.5
		end
		current=nextTime
	end

	local lowAbs=math.abs(lowValue)
	local highAbs=math.abs(highValue)
	if lowAbs<highAbs then
		return low
	end
	return high
end

local function refineStationaryPoint(polynomial,lo,hi,loValue,hiValue,iterations,stats)
	local low=lo
	local high=hi
	local lowValue=loValue or polynomialDerivative(polynomial,low,stats)
	local highValue=hiValue or polynomialDerivative(polynomial,high,stats)
	local current=(low+high)*0.5

	for _=1,iterations do
		local value=polynomialDerivative(polynomial,current,stats)
		if math.abs(value)<=1e-8 then
			return current
		end

		if oppositeSigns(lowValue,value) then
			high=current
			highValue=value
		else
			low=current
			lowValue=value
		end

		local second=polynomialSecondDerivative(polynomial,current)
		local nextTime=nil
		if math.abs(second)>1e-9 then
			nextTime=current-value/second
		end
		if not nextTime or nextTime<=low or nextTime>=high then
			nextTime=(low+high)*0.5
		end
		current=nextTime
	end

	if math.abs(lowValue)<math.abs(highValue) then
		return low
	end
	return high
end

local function refineNearSeed(polynomial,time,lo,hi,iterations,stats)
	local current=time
	for _=1,iterations do
		local value=polynomialValue(polynomial,current,stats)
		local derivative=polynomialDerivative(polynomial,current,stats)
		if math.abs(derivative)<=1e-9 then break end

		local nextTime=math.clamp(current-value/derivative,lo,hi)
		if math.abs(nextTime-current)<=1e-7 then
			return nextTime
		end
		current=nextTime
	end
	return current
end

function qbAimMath.ballAt(originPosition,velocity,time)
	return ballAt(originPosition,velocity,time)
end

function qbAimMath.solve(params)
	local ballSpeed=params.ballPower or defaultBallSpeed
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
	local polynomial=interceptPolynomial(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed)
	local bestRoot=nil
	local bestNear=nil
	local minT=params.minTime or 0.35
	local maxT=params.maxTime or 6
	local probeCount=math.max(8,math.floor(params.coarseProbes or 32))
	local refinementSteps=math.max(12,math.floor(params.refinementSteps or params.bisectionSteps or 18))
	local stats=params.stats
	local samples={}
	local roots={}
	local nearSeeds={}

	local function addRoot(time)
		if not time or time<minT-1e-6 or time>maxT+1e-6 then return end
		time=math.clamp(time,minT,maxT)
		for _,existing in ipairs(roots) do
			if math.abs(existing-time)<=1e-4 then return end
		end
		roots[#roots+1]=time
	end

	local function considerNear(time)
		local candidate=interceptCandidate(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,time,params.shape,params.predictorState,false,polynomial,stats)
		if candidate and candidate.targetMiss<=(params.nearTargetMissTolerance or 0.05) and candidate.yError<=(params.catchYTolerance or 0.35) and betterIntercept(candidate,bestNear) then
			bestNear=candidate
		end
	end

	local function considerRoot(time)
		local candidate=interceptCandidate(params,originPosition,receiverStart,wrVel,qbVel,ballSpeed,time,params.shape,params.predictorState,false,polynomial,stats)
		if candidate and candidate.targetMiss<=(params.targetMissTolerance or 0.35) and candidate.yError<=(params.catchYTolerance or 0.35) and betterIntercept(candidate,bestRoot) then
			bestRoot=candidate
		end
	end

	for index=0,probeCount do
		local alpha=index/probeCount
		local time=minT+(maxT-minT)*alpha
		local value=polynomialValue(polynomial,time,stats)
		samples[#samples+1]={time=time,value=value}
		nearSeeds[#nearSeeds+1]={time=time,value=math.abs(value),index=#samples}
		if math.abs(value)<=valueTolerance(polynomial,time,ballSpeed) then
			addRoot(time)
		end
	end

	local derivativePartitions={minT,maxT}
	for _,time in ipairs(realQuadraticRoots(12*polynomial.c4,6*polynomial.c3,2*polynomial.c2)) do
		if time>minT+1e-7 and time<maxT-1e-7 then
			derivativePartitions[#derivativePartitions+1]=time
		end
	end
	table.sort(derivativePartitions)

	local stationaryPoints={}
	local function addStationary(time)
		if time<minT-1e-6 or time>maxT+1e-6 then return end
		for _,existing in ipairs(stationaryPoints) do
			if math.abs(existing-time)<=1e-5 then return end
		end
		stationaryPoints[#stationaryPoints+1]=math.clamp(time,minT,maxT)
	end

	for index=1,#derivativePartitions-1 do
		local lo=derivativePartitions[index]
		local hi=derivativePartitions[index+1]
		local loValue=polynomialDerivative(polynomial,lo,stats)
		local hiValue=polynomialDerivative(polynomial,hi,stats)
		if math.abs(loValue)<=1e-8 then addStationary(lo) end
		if math.abs(hiValue)<=1e-8 then addStationary(hi) end
		if oppositeSigns(loValue,hiValue) then
			addStationary(refineStationaryPoint(polynomial,lo,hi,loValue,hiValue,refinementSteps,stats))
		end
	end
	table.sort(stationaryPoints)

	local monotonicPartitions={minT}
	for _,time in ipairs(stationaryPoints) do
		if time>minT+1e-6 and time<maxT-1e-6 then
			monotonicPartitions[#monotonicPartitions+1]=time
		end
		local value=polynomialValue(polynomial,time,stats)
		if math.abs(value)<=valueTolerance(polynomial,time,ballSpeed)*16 then addRoot(time) end
	end
	monotonicPartitions[#monotonicPartitions+1]=maxT

	for index=1,#monotonicPartitions-1 do
		local lo=monotonicPartitions[index]
		local hi=monotonicPartitions[index+1]
		local loValue=polynomialValue(polynomial,lo,stats)
		local hiValue=polynomialValue(polynomial,hi,stats)
		if oppositeSigns(loValue,hiValue) then
			addRoot(refineRoot(polynomial,lo,hi,loValue,hiValue,refinementSteps,ballSpeed,stats))
		end
	end

	table.sort(roots)
	for _,time in ipairs(roots) do
		considerRoot(time)
	end

	if not bestRoot then
		table.sort(nearSeeds,function(a,b)
			return a.value<b.value
		end)
		for index=1,math.min(4,#nearSeeds) do
			local seed=nearSeeds[index]
			local sampleIndex=seed.index
			local lo=samples[math.max(1,sampleIndex-1)].time
			local hi=samples[math.min(#samples,sampleIndex+1)].time
			considerNear(refineNearSeed(polynomial,seed.time,lo,hi,refinementSteps,stats))
		end
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

return qbAimMath
