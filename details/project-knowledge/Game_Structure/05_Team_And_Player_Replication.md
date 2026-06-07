# Team and player replication

The script infers team membership from each player's `Replicated.TeamID` value.

## Valid team IDs

```lua
local VALID_TEAM_IDS={
    HomeTeam=true,
    AwayTeam=true,
}
```

## Player team path

```text
Player
└── Replicated
    └── TeamID  -- StringValue, IntValue, NumberValue, or Value-like object
```

## Same-team logic

A target is considered same-team only if both local player and receiver have valid `TeamID` values and the strings match.

## Team filter behavior

When `state.qbAimTeamFilter` is enabled, the receiver must be on the same `HomeTeam`/`AwayTeam` as the local player. If it is disabled, any non-local player can be targetable.

## Gameplay membership check

For gameplay remote discovery, `Workspace.Games.<game>.Replicated.Players` must contain `LP.Name` before that workspace game folder is accepted.
