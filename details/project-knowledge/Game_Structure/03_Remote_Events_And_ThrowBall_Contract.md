# Remote events and `ThrowBall` contract

This file documents the game remote shape from both decompiled source and project lookup code.

## Decompiled gameplay payload

`MECH_ControlsQuarterback.FootballThrow` sends:

```lua
local payload = {
    AutoThrow = false,
    Target = aimPoint,
    Power = BallPower,
}

ReEvent:FireServer("Mechanics", "ThrowBall", payload)
```

After firing, the game client calls:

```lua
UnequipFootball()
```

`BallPower` defaults to `100` in `Mechanics.md`. The power meter can adjust it between `FootballMath.Settings.MinPower` and `FootballMath.Settings.MaxPower`.

## Current QBAim payloads

Gameplay:

```lua
reEvent:FireServer("Mechanics", "ThrowBall", {
    Target = plan.aimPoint,
    Power = 100,
})
```

Squads/minigame:

```lua
reEvent:FireServer("Mechanics", "ThrowBall", {
    Target = plan.aimPoint,
    AutoThrow = false,
    Power = 100,
})
```

Notes:

- Gameplay source includes `AutoThrow=false`; current QBAim omits it for gameplay but includes it for squads. If behavior diverges, add `AutoThrow=false` to gameplay too.
- Custom-power support should solve with `Power * 0.95`, not always `95`.
- Current script intentionally uses display power `100`, so local solve speed remains `95`.

## Gameplay `ReEvent` lookup

Gameplay lookup searches:

1. `Workspace.Games.<gameFolder>.ReEvent`
2. `Workspace.Games.<gameFolder>.Replicated.ReEvent`
3. `ReplicatedStorage.Games.<gameFolder>.ReEvent`
4. `ReplicatedStorage.Games.<gameFolder>.Replicated.ReEvent`

The workspace-side path is accepted only when the corresponding `Replicated.Players` folder contains the local player name.

## Squads/minigame `ReEvent` lookup

Squads lookup checks the first child folder/model inside:

1. `ReplicatedStorage.MiniGames`
2. `Workspace.MiniGames`
3. `Workspace.Games.MiniGames`
4. `ReplicatedStorage.Games.MiniGames`

It returns the first child minigame folder containing a `ReEvent` RemoteEvent.

## Incoming throw observation

Incoming throw/ball replication can appear through:

```lua
ReplicatedStorage.ReEvent:OnClientEvent("UpdateFootball", football, {
    CenterWorld = ...,
    GameID = ...,
    Power = 95,
    Target = ...,
    SpawnPos = ...,
    LaunchTime = ...,
})
```

This is useful for testing because it exposes server/model values after another player releases the ball.
