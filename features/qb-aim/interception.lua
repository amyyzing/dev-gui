local interception={}

local DEFAULTS={
	coarseProbes=48,
	maxProbes=360,
	maxTimeStep=1/60,
	boundarySteps=12,
	defenderSpeed=21,
	reactionTime=0.12,
	catchRadius=2.75,
	lowerCatchOffset=-2.5,
	standingReach=6.5,
	verticalSlack=0,
	jumpHeight=7.2,
	jumpRiseTime=0.27,
	forwardEpsilon=-0.05,
}

local function setting(settings,key)
	local value=settings and settings[key]
	if value==nil then return DEFAULTS[key] end
	return value
end

local function flat(vector)
	return Vector3.new(vector.X,0,vector.Z)
end

local function horizontalDistance(a,b)
	local dx=a.X-b.X
	local dz=a.Z-b.Z
	return math.sqrt(dx*dx+dz*dz)
end

local function distanceToSegmentXZ(point,a,b)
	local segment=flat(b-a)
	local lengthSquared=segment:Dot(segment)
	if lengthSquared<=1e-9 then return horizontalDistance(point,a) end

	local alpha=math.clamp(flat(point-a):Dot(segment)/lengthSquared,0,1)
	return horizontalDistance(point,a+segment*alpha)
end

local function projectileAt(arc,time)
	return arc.origin+arc.velocity*time+0.5*arc.gravity*time*time
end

local function jumpOffsetAt(defender,time,settings)
	local reactionTime=math.max(0,defender.reactionTime or setting(settings,"reactionTime"))
	local jumpTime=math.max(0,time-reactionTime)
	local peak=math.max(0,defender.jumpHeight or setting(settings,"jumpHeight"))
	local riseTime=math.max(1e-4,defender.jumpRiseTime or setting(settings,"jumpRiseTime"))
	if jumpTime>=riseTime then return peak end

	local alpha=jumpTime/riseTime
	return peak*(2*alpha-alpha*alpha)
end

local function defenderPositionAt(defender,time,settings)
	local position=defender.position
	local velocity=defender.velocity or Vector3.zero
	local reactionTime=math.max(0,defender.reactionTime or setting(settings,"reactionTime"))
	return position+velocity*math.min(time,reactionTime)
end

local function defenderDimensions(defender,settings)
	local size=defender.boxSize
	if typeof(size)=="Vector3" then
		local halfWidth=math.max(size.X,size.Z)*0.5
		local halfHeight=size.Y*0.5
		return halfWidth,-halfHeight,halfHeight
	end

	local horizontalRadius=math.max(0,defender.catchRadius or setting(settings,"catchRadius"))
	local lowerOffset=defender.lowerCatchOffset or setting(settings,"lowerCatchOffset")
	local upperOffset=defender.standingReach or setting(settings,"standingReach")

	return horizontalRadius,lowerOffset,upperOffset
end

local function refineTransition(predicate,lo,hi,loValue,steps)
	local low=lo
	local high=hi
	local lowValue=loValue
	for _=1,steps do
		local mid=(low+high)*0.5
		local midValue=predicate(mid)
		if midValue==lowValue then
			low=mid
		else
			high=mid
		end
	end
	return(low+high)*0.5
end

local function predicateIntervals(predicate,minTime,maxTime,probeCount,boundarySteps)
	local intervals={}
	local previousTime=minTime
	local previousValue=predicate(minTime)
	local openTime=previousValue and minTime or nil

	for index=1,probeCount do
		local time=minTime+(maxTime-minTime)*(index/probeCount)
		local value=predicate(time)
		if value~=previousValue then
			local boundary=refineTransition(predicate,previousTime,time,previousValue,boundarySteps)
			if value then
				openTime=boundary
			elseif openTime then
				intervals[#intervals+1]={startTime=openTime,endTime=boundary}
				openTime=nil
			end
		end
		previousTime=time
		previousValue=value
	end

	if openTime then
		intervals[#intervals+1]={startTime=openTime,endTime=maxTime}
	end
	return intervals
end

local function intersectIntervals(horizontal,vertical)
	local windows={}
	local horizontalIndex=1
	local verticalIndex=1
	while horizontalIndex<=#horizontal and verticalIndex<=#vertical do
		local a=horizontal[horizontalIndex]
		local b=vertical[verticalIndex]
		local startTime=math.max(a.startTime,b.startTime)
		local endTime=math.min(a.endTime,b.endTime)
		if endTime>=startTime then
			windows[#windows+1]={startTime=startTime,endTime=endTime}
		end

		if a.endTime<b.endTime then
			horizontalIndex+=1
		else
			verticalIndex+=1
		end
	end
	return windows
end

local function broadPhaseAllows(arc,defender,maxTime,horizontalRadius,lowerOffset,upperOffset,settings)
	local maxReach=horizontalRadius
		+math.max(0,defender.speed or setting(settings,"defenderSpeed"))*maxTime
		+flat(defender.velocity or Vector3.zero).Magnitude*math.max(0,defender.reactionTime or setting(settings,"reactionTime"))
	local startPoint=projectileAt(arc,0)
	local endPoint=projectileAt(arc,maxTime)
	local horizontalGravity=flat(arc.gravity).Magnitude
	local minHorizontal=horizontalGravity<=1e-6
		and distanceToSegmentXZ(defender.position,startPoint,endPoint)
		or 0
	if minHorizontal>maxReach then return false end

	local minBallY=math.min(startPoint.Y,endPoint.Y)
	local maxBallY=math.max(startPoint.Y,endPoint.Y)
	if math.abs(arc.gravity.Y)>1e-9 then
		local extremeTime=-arc.velocity.Y/arc.gravity.Y
		if extremeTime>0 and extremeTime<maxTime then
			local extremeY=projectileAt(arc,extremeTime).Y
			minBallY=math.min(minBallY,extremeY)
			maxBallY=math.max(maxBallY,extremeY)
		end
	end

	local defenderMinY=defender.position.Y+lowerOffset
	local defenderMaxY=defender.position.Y+upperOffset
		+math.max(0,defender.jumpHeight or setting(settings,"jumpHeight"))
	return not(maxBallY<defenderMinY or minBallY>defenderMaxY)
end

local function defenderWindows(arc,defender,settings)
	if not(defender and typeof(defender.position)=="Vector3") then return{} end

	local minTime=math.max(0,arc.minTime or 0)
	local maxTime=math.max(minTime,arc.flightTime or 0)
	if maxTime<=minTime then return{} end

	local horizontalRadius,lowerOffset,upperOffset=defenderDimensions(defender,settings)
	if not broadPhaseAllows(arc,defender,maxTime,horizontalRadius,lowerOffset,upperOffset,settings) then
		return{}
	end

	local probeCount=math.ceil((maxTime-minTime)/math.max(1e-3,setting(settings,"maxTimeStep")))
	probeCount=math.clamp(probeCount,setting(settings,"coarseProbes"),setting(settings,"maxProbes"))
	local boundarySteps=math.max(4,math.floor(setting(settings,"boundarySteps")))
	local forward=arc.forward
	if typeof(forward)~="Vector3" then
		local flatVelocity=flat(arc.velocity)
		forward=flatVelocity.Magnitude>1e-6 and flatVelocity.Unit or nil
	end

	local function isForward(point)
		if not forward then return true end
		return flat(point-arc.origin):Dot(forward)>=setting(settings,"forwardEpsilon")
	end

	local function horizontalReachable(time)
		local ballPosition=projectileAt(arc,time)
		if not isForward(ballPosition) then return false end

		local position=defenderPositionAt(defender,time,settings)
		local reactionTime=math.max(0,defender.reactionTime or setting(settings,"reactionTime"))
		local runTime=math.max(0,time-reactionTime)
		local radius=horizontalRadius+math.max(0,defender.speed or setting(settings,"defenderSpeed"))*runTime
		return horizontalDistance(position,ballPosition)<=radius
	end

	local function verticallyCatchable(time)
		local ballPosition=projectileAt(arc,time)
		local position=defenderPositionAt(defender,time,settings)
		local jumpOffset=jumpOffsetAt(defender,time,settings)
		local minY=position.Y+jumpOffset+lowerOffset
		local maxY=position.Y+jumpOffset+upperOffset
		return ballPosition.Y>=minY and ballPosition.Y<=maxY
	end

	local horizontal=predicateIntervals(horizontalReachable,minTime,maxTime,probeCount,boundarySteps)
	if #horizontal==0 then return{} end
	local vertical=predicateIntervals(verticallyCatchable,minTime,maxTime,probeCount,boundarySteps)
	if #vertical==0 then return{} end

	local windows=intersectIntervals(horizontal,vertical)
	for _,window in ipairs(windows) do
		local time=window.startTime
		local point=projectileAt(arc,time)
		local position=defenderPositionAt(defender,time,settings)
		local reactionTime=math.max(0,defender.reactionTime or setting(settings,"reactionTime"))
		local runTime=math.max(0,time-reactionTime)
		local jumpOffset=jumpOffsetAt(defender,time,settings)
		window.player=defender.player
		window.defender=defender
		window.time=time
		window.point=point
		window.distance=horizontalDistance(position,point)
		window.reachableRadius=horizontalRadius+math.max(0,defender.speed or setting(settings,"defenderSpeed"))*runTime
		window.yMin=position.Y+jumpOffset+lowerOffset
		window.yMax=position.Y+jumpOffset+upperOffset
	end
	return windows
end

function interception.ProjectileAt(arc,time)
	return projectileAt(arc,time)
end

function interception.FindWindows(arc,defenders,settings)
	if not(arc and typeof(arc.origin)=="Vector3" and typeof(arc.velocity)=="Vector3" and typeof(arc.gravity)=="Vector3") then
		return{}
	end

	local windows={}
	for _,defender in ipairs(defenders or {}) do
		for _,window in ipairs(defenderWindows(arc,defender,settings)) do
			windows[#windows+1]=window
		end
	end
	table.sort(windows,function(a,b)
		return a.startTime<b.startTime
	end)
	return windows
end

function interception.Evaluate(arc,defenders,settings)
	local windows=interception.FindWindows(arc,defenders,settings)
	local first=windows[1]
	if not first then
		return false,{reason="no_interceptor",windows=windows}
	end

	return true,{
		reason="interception_window",
		windows=windows,
		player=first.player,
		defender=first.defender,
		time=first.time,
		point=first.point,
		distance=first.distance,
		reachableRadius=first.reachableRadius,
		yMin=first.yMin,
		yMax=first.yMax,
		startTime=first.startTime,
		endTime=first.endTime,
	}
end

local function sequenceColor(value,fallback)
	local valueType=typeof(value)
	if valueType=="Color3" then return value end
	if valueType=="ColorSequence" and value.Keypoints[1] then
		return value.Keypoints[1].Value
	end
	return fallback
end

function interception.BuildColorSequence(defaultColor,unsafeColor,windows,flightTime,wholeWarning)
	local safe=sequenceColor(defaultColor,Color3.new(1,1,1))
	local unsafe=sequenceColor(unsafeColor,Color3.fromRGB(254,94,86))
	if wholeWarning and windows and #windows>0 then
		return ColorSequence.new(unsafe)
	end
	if not windows or #windows==0 or not flightTime or flightTime<=0 then
		return typeof(defaultColor)=="ColorSequence" and defaultColor or ColorSequence.new(safe)
	end

	local merged={}
	for _,window in ipairs(windows) do
		local previous=merged[#merged]
		if previous and window.startTime<=previous.endTime then
			previous.endTime=math.max(previous.endTime,window.endTime)
		else
			merged[#merged+1]={startTime=window.startTime,endTime=window.endTime}
		end
	end

	local points={{time=0,color=safe,priority=0},{time=1,color=safe,priority=0}}
	local epsilon=0.002
	for index=1,math.min(#merged,4) do
		local window=merged[index]
		local startAlpha=math.clamp(window.startTime/flightTime,0,1)
		local endAlpha=math.clamp(window.endTime/flightTime,0,1)
		if startAlpha>0 then
			points[#points+1]={time=math.max(0,startAlpha-epsilon),color=safe,priority=1}
		end
		points[#points+1]={time=startAlpha,color=unsafe,priority=2}
		points[#points+1]={time=endAlpha,color=unsafe,priority=2}
		if endAlpha<1 then
			points[#points+1]={time=math.min(1,endAlpha+epsilon),color=safe,priority=3}
		end
	end

	table.sort(points,function(a,b)
		if math.abs(a.time-b.time)<=1e-6 then return a.priority<b.priority end
		return a.time<b.time
	end)

	local keypoints={}
	for _,point in ipairs(points) do
		local last=keypoints[#keypoints]
		if last and math.abs(last.Time-point.time)<=1e-6 then
			keypoints[#keypoints]=ColorSequenceKeypoint.new(point.time,point.color)
		else
			keypoints[#keypoints+1]=ColorSequenceKeypoint.new(point.time,point.color)
		end
	end
	return ColorSequence.new(keypoints)
end

return interception
