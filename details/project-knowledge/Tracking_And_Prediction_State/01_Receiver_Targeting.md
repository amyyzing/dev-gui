# Receiver targeting

Receiver lock is cursor-based. The script projects each targetable player's root position into screen space and selects the one with the smallest 2D mouse distance.

## Targetability rules

A player is targetable when:

1. The player is not the local player.
2. The player has a character root.
3. The player passes team filtering if team filtering is enabled.
4. The projected root position is on-screen.

## Lock source

```lua
	local function lockReceiverUnderCursor()
		if not(enabled and isAvailable()) then return end

		local camera=Workspace.CurrentCamera
		local mouse=LP:GetMouse()
		local best=nil
		local bestDistance=math.huge

		for _,player in ipairs(Players:GetPlayers()) do
			local receiverRoot=player~=LP and player.Character and root(player.Character)
			if receiverRoot and camera and canTargetReceiver(player) then
				local screenPoint,onScreen=camera:WorldToViewportPoint(receiverRoot.Position)
				if onScreen then
					local distance=(Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenPoint.X,screenPoint.Y)).Magnitude
					if distance<bestDistance then
						best=player
						bestDistance=distance
					end
				end
			end
		end

		if best then
			ensureReceiverData(best,best.Character and root(best.Character))
			trackedReceiver=best
			selectedRouteLock=lockRoute(best)
			previewFrozen=false
			preview.ballMissingSince=nil
			preview.p1,preview.p2,preview.p3=nil,nil,nil
			setTargetText()
			setStatus("Locked "..best.Name)
		else
			setStatus(state.qbAimTeamFilter~=false and "No teammate under cursor" or "No receiver under cursor")
		end
	end
```

## Route lock meaning

The `H` lock selects the receiver only. In the newer versions, route direction stays reactive instead of staying permanently locked to the initial direction.
