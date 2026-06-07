# Mode detection

Mode detection is inferred from the available `Games` and `MiniGames` folders.

## Mode keys

| Mode key | Meaning in script | Detection |
|---|---|---|
| `mode1` | Gameplay | `Workspace.Games` has at least one child, or fallback default. |
| `mode2` | Park | `Workspace.MiniGames` or `ReplicatedStorage.MiniGames` has more than one child. Unsupported by QBAim throw flow. |
| `mode3` | Squads | `Workspace.MiniGames` or `ReplicatedStorage.MiniGames` has exactly one child. |

## Inferred resolver source

```lua
local function getModeKey(ctx)
	local miniGames=Workspace:FindFirstChild("MiniGames")
	local miniCount=miniGames and #miniGames:GetChildren() or 0
	if miniCount>1 then
		return"mode2"
	elseif miniCount==1 then
		return"mode3"
	end

	local games=Workspace:FindFirstChild("Games")
	if games and #games:GetChildren()>0 then
		return"mode1"
	end

	if ctx.getCurrentModeKey then
		local ok,modeKey=pcall(ctx.getCurrentModeKey)
		if ok and modeKey then
			return tostring(modeKey)
		end
	end

	local replicatedMiniGames=ReplicatedStorage:FindFirstChild("MiniGames")
	local replicatedMiniCount=replicatedMiniGames and #replicatedMiniGames:GetChildren() or 0
	if replicatedMiniCount>1 then
		return"mode2"
	elseif replicatedMiniCount==1 then
		return"mode3"
	end

	local replicatedGames=ReplicatedStorage:FindFirstChild("Games")
	if replicatedGames and #replicatedGames:GetChildren()>0 then
		return"mode1"
	end

	return"mode1"
end
```

## Notes

`mode1` and `mode3` are considered available. `mode2` is recognized but the throw flow treats Park as unsupported/unknown.
