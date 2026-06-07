# Throw animation and release timing

The script separates animation start from actual throw release.

## Constants

```lua
PLAY_THROW_ANIMATION = true
THROW_ANIMATION_NAME = "UF_QuarterbackThrow"
THROW_ANIMATION_SPEED = 1.35
THROW_ANIMATION_RELEASE_WAIT = 0.26666666666666666
PLAY_THROW_LOCAL_FALLBACK = false
```

## Animation discovery

If local fallback is enabled, the script searches these containers for an `Animation` named `UF_QuarterbackThrow`:

1. `ReplicatedStorage`
2. `LP.PlayerScripts`
3. `LP.Character`

```lua
local function findThrowAnimation()
	local containers={
		ReplicatedStorage,
		LP:FindFirstChild("PlayerScripts"),
		LP.Character,
	}

	for _,container in ipairs(containers) do
		local animation=container and container:FindFirstChild(THROW_ANIMATION_NAME,true)
		if animation and animation:IsA("Animation") and animation.AnimationId~="" then
			return animation
		end
	end

	return nil
end
```

## Animation play path

Preferred path uses the game's `Mechanics` object:

```lua
local function playThrowAnimation()
	if not PLAY_THROW_ANIMATION or not getHeldBall() then return false end

	local mechanics=getGlobalMechanics()
	if mechanics and type(mechanics.PlayAnimation)=="function" then
		local ok=pcall(function()
			mechanics:PlayAnimation(THROW_ANIMATION_NAME,THROW_ANIMATION_SPEED)
		end)
		if ok then
			return true,"mechanics"
		end
	end

	if PLAY_THROW_LOCAL_FALLBACK then
		local ok=playLocalThrowAnimation()
		return ok,"local"
	end

	return false,"none"
end
```

## Release-time planning

The script calculates a preliminary plan at animation start using the expected release offset. During the release wait, it continuously updates the plan each heartbeat using the remaining time until release. At the end, it builds one final no-offset plan and sends the remote.

Current release-origin behavior:

- Horizontal release extrapolation is enabled, so the origin X/Z follows QB movement during release wait.
- Vertical release extrapolation is disabled, so C2/origin Y stays tied to the current ball/Center C2 reference instead of being projected downward by player gravity during jump preview.
- Receiver release prediction uses `releaseOffset` directly. The `WR_LEAD_DELAY` slider remains default `0.20`, but its extra receiver prediction is now tapered by solved flight time, with near-zero effect on very short throws and full effect by about `1.35s`.

```lua
	local function buildReleasePlan(receiver,ballPower,releaseBall,fallbackPlan)
		if THROW_ANIMATION_RELEASE_WAIT<=0 then
			return buildPlan(receiver,ballPower,0,releaseBall)
		end

		local endAt=os.clock()+THROW_ANIMATION_RELEASE_WAIT
		local latestPlan=nil
		local latestBall=nil

		while os.clock()<endAt do
			local remaining=math.max(endAt-os.clock(),0)
			latestPlan,latestBall=buildPlan(receiver,ballPower,remaining,releaseBall)
			if latestPlan then
				previewPlan(latestPlan)
			end
			RunService.Heartbeat:Wait()
		end

		local finalPlan,finalBall=buildPlan(receiver,ballPower,0,releaseBall)
		return finalPlan or latestPlan or fallbackPlan,finalBall or latestBall or releaseBall
	end
```
