# Input, UI, and exported QBAim API

## Default key roles

The script reads configurable keybinds through the `ctx` object, with these defaults:

| Action | Getter | Default |
|---|---|---|
| Toggle QBAim | `ctx.getQBAimToggleKey` | `P` |
| Lock receiver under cursor | `ctx.getQBAimLockKey` | `H` |
| Throw to locked receiver | `ctx.getQBAimThrowKey` | `T` |

## UI controls

The script creates a `QB Aim` section with:

- header toggle / enabled toggle
- `Team Filter`
- `Show Arc`
- `Lead Adjust` slider or fallback textbox
- status label
- target label

## Public API returned by `QBAim.new`

```lua
api.SetQBAimState(value)
api.SetTeamFilterState(value, fire)
api.SetShowArcState(value, fire)
api.SetLeadDelay(value, fire)
api.Refresh()
api.Reset()
api.Destroy()
```

## State keys used

```lua
state.qbAimEnabled
state.qbAimTeamFilter
state.qbAimShowArc
state.qbAimLeadDelay
```

`ctx.onChanged(state)` is called when relevant user state changes.
