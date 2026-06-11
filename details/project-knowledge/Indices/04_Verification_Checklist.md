# Verification checklist

Use this when comparing project assumptions against live Explorer output or decompiled modules.

## Folders

- Confirm whether current gameplay uses `Workspace.Games`.
- Confirm whether squads uses exactly one child under `Workspace.MiniGames`.
- Confirm whether Park creates more than one child under `Workspace.MiniGames`.
- Confirm whether `Local.Center` exists under the chosen folder.
- Confirm whether `Center` contains original `C2`, `C3`, and a `Beam`.

## Remotes

- Confirm exact `ReEvent` path in gameplay.
- Confirm exact `ReEvent` path in squads.
- Confirm `ReEvent:FireServer("Mechanics", "ThrowBall", payload)` is still active.
- Confirm whether gameplay accepts omitted `AutoThrow` or should always receive `AutoThrow=false`.
- Confirm whether squads still needs `AutoThrow=false`.
- Confirm whether custom power is active in the current mode.
- Confirm display `Power = 100` still maps to modeled speed `95`.
- Capture incoming `UpdateFootball` after local release and compare `SpawnPos` to C2/C3/ball/root.

## Mechanics

- Confirm `Mechanics` is reachable through `Variables.Mechanics` or the existing global fallbacks.
- Confirm `PlayAnimation("UF_QuarterbackThrow", 1.35)` still succeeds.
- Confirm the game still waits `0.26666666666666666` seconds before remote release.
- Confirm `UnequipFootball()` still exists and is called immediately after `ThrowBall`.

## Football object

- Confirm held football path in character.
- Confirm whether `GAMEOBJECTS` is still used.
- Confirm whether actual football part name is exactly `Football` or only contains `football` in ancestry.

## Arc and release

- Confirm original `Center.C2.WorldCFrame` is available while holding the ball.
- Confirm cloned `ClonedCenter.C2` is never used for math.
- Confirm restored preview plane matches the game arc.
- Confirm C2 Y follows the QB body while jumping and does not fall back to ground/ball Y.
- Confirm hiding the arc makes the clone invisible without destroying the original `Center`.

## Football math

- Confirm gravity is still `-28`.
- Confirm `MaximumPowerCoefficient` is still `0.95`.
- Confirm default C1/catch target Y at `WR_MAX_Y = 14.00` is correct in current gameplay.
- Confirm `Peak Height` changes target Y and persists through refresh/save.
- Confirm `Lead Adjust = 0.38` is the restored baseline.
- Confirm `Lead Adjust = 0` produces pure catch-time intercept behavior.
- Confirm larger lead adjust values increase receiver prediction time.

## UI feedback

- Confirm locked QB Aim receiver is highlighted.
- Confirm the old status/target text rows are gone.
- Confirm `Show Arc` hides all cloned arc descendants.
