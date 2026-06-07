# Verification checklist

Use this when comparing the markdown map against actual in-game explorer output or decompiled modules.

## Folders

- Confirm whether current game uses `Workspace.Games` for gameplay.
- Confirm whether squads uses exactly one child under `Workspace.MiniGames`.
- Confirm whether Park creates more than one child under `Workspace.MiniGames`.
- Confirm whether `Local.Center` exists under the chosen folder.
- Confirm whether `Center` contains `C2`, `C3`, and a `Beam`.

## Remotes

- Confirm exact `ReEvent` path in gameplay.
- Confirm exact `ReEvent` path in squads.
- Confirm whether `ReEvent:FireServer("Mechanics", "ThrowBall", payload)` is still the active contract.
- Confirm whether `Power = 100` still maps to about `95` modeled studs/s.
- Confirm whether squads still needs `AutoThrow = false`.

## Mechanics

- Confirm whether `Mechanics` is stored in `Variables.Mechanics`.
- Confirm `PlayAnimation(animationName, speed)` signature.
- Confirm `UnequipFootball()` still exists and when the game normally calls it.

## Football object

- Confirm held football path in character.
- Confirm whether `GAMEOBJECTS` is still used.
- Confirm whether actual football part name is exactly `Football` or only contains `football` in ancestry.

## Player replication

- Confirm team path `Player.Replicated.TeamID`.
- Confirm active team IDs: `HomeTeam`, `AwayTeam`.
- Confirm whether spectators/park players have missing or invalid `TeamID`.

## Football math

- Confirm gravity used by actual ball is `28`.
- Confirm model ball speed is `95` for display power `100`.
- Confirm player jump peak is still about `13.85` studs.
- Confirm fixed C1 Y at `WR_MAX_Y` is correct in current gameplay.
- Confirm `Lead Adjust = 0.20` still behaves like the baseline calculator on medium/long throws.
- Confirm short throws do not receive full extra lead delay and no longer overlead as hard.
- Confirm larger lead adjust values advance C1 by receiver velocity before the intercept solve.
- Confirm C2 follows ball/Center C2 while jumping and does not drop during preview.
