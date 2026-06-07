# Throw flow state machine

This is the main throw state flow.

```text
Input T / throw key
  ↓
QBAim enabled and mode available?
  ↓
Receiver locked and targetable?
  ↓
Held football exists?
  ↓
Select power by mode:
  mode1 -> GAMEPLAY_BALL_POWER = 95
  mode3 -> SQUADS_BALL_POWER = 95
  ↓
Build pre-animation release-offset plan
  using fixed-speed intercept at 95 studs/s
  receiver start = WR peak position + wrVel * (releaseOffset + lead adjust)
  ↓
Play throw animation
  ↓
During 0.2666667s release wait:
  update throw plan every Heartbeat
  update arc preview if plan exists
  ↓
Build final plan at release
  using releaseOffset = 0 but still applying lead adjust
  ↓
Send remote:
  mode1 -> Gameplay ReEvent Mechanics/ThrowBall
  mode3 -> Squads ReEvent Mechanics/ThrowBall
  ↓
Freeze preview briefly after throw
```

## Main throw function

```lua
	local function throwTo(receiver)
		if not(enabled and isAvailable()) then return end

		if not canTargetReceiver(receiver) then
			trackedReceiver=nil
			selectedRouteLock=nil
			clearPreviewVisuals()
			setTargetText()
			setStatus(state.qbAimTeamFilter~=false and "Target not teammate" or "No receiver locked")
			return
		end

		local heldBall=getHeldBall()
		if not heldBall then
			clearPreviewForMissingBall("No ball held")
			return
		end

		local modeKey=getModeKey(ctx)
		local power=modeKey=="mode3" and SQUADS_BALL_POWER or GAMEPLAY_BALL_POWER
		local receiverRoot=receiver and receiver.Character and root(receiver.Character)
		if not receiverRoot then
			setStatus("No receiver locked")
			return
		end

		local preAnimationPlan=buildPlan(receiver,power,THROW_ANIMATION_RELEASE_WAIT,heldBall)
		if not preAnimationPlan then
			setStatus("No release-time throw solution")
			return
		end

		playThrowAnimation()

		local plan=buildReleasePlan(receiver,power,heldBall,preAnimationPlan)
		if not plan then
			setStatus("No release-time throw solution")
			return
		end

		local ok,err
		if modeKey=="mode1" then
			ok,err=fireGameplayThrow(plan)
		elseif modeKey=="mode3" then
			ok,err=fireSquadsThrow(plan)
		else
			ok,err=false,"Park route unknown"
		end

		if ok then
			freezePreviewAtCurrentPlan(plan)
			setStatus(currentModeText().." release-time throw sent")
		else
			setStatus(err or "Throw failed")
		end
	end
```

## Current solve model

The current `solve` path does not choose a throw by route/distance angle buckets. It scans time and solves the fixed-speed intercept condition:

```lua
F(t) = |receiverStart - origin + (wrVel - qbVel * QB_INHERITANCE) * t - 0.5 * G * t * t|^2 - MODEL_BALL_SPEED^2 * t * t
```

After a valid time is chosen:

```lua
requiredVelocity = neededDisplacement / time
throwVelocity = requiredVelocity.Unit * MODEL_BALL_SPEED
worldVelocity = throwVelocity + qbVel * QB_INHERITANCE
aimPoint = origin + requiredVelocity.Unit * AIM_SCALE
```

`QB_INHERITANCE` is currently `0`, so QB movement changes the release origin but does not add to the modeled football velocity.

## Plan build path

```lua
	local function buildPlan(receiver,ballPower,releaseOffset,releaseBall)
		if not canTargetReceiver(receiver) then
			return nil,nil
		end

		local character=LP.Character
		local qbRoot=root(character)
		local ball=releaseBall or getHeldBall()
		local receiverRoot=receiver and receiver.Character and root(receiver.Character)
		local data=receiverData[receiver] or ensureReceiverData(receiver,receiverRoot)

		if not(qbRoot and ball and receiverRoot and data) then
			return nil
		end

		releaseOffset=releaseOffset or 0
		local originPosition=origin(qbRoot,ball,releaseOffset)
		local targetVelocity,shape,predictorState=routeVelocity(receiver,data,originPosition,receiverRoot,selectedRouteLock)
		return solve(qbRoot,ball,receiverRoot,targetVelocity,shape,ballPower or currentBallPower(),releaseOffset,predictorState),ball
	end
```
