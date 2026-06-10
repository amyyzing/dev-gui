# Input, UI, and exported QBAim API

## Default key roles

The script reads configurable keybinds through the `ctx` object:

| Action | Getter | Default |
|---|---|---|
| Toggle QBAim | `ctx.getQBAimToggleKey` | `P` |
| Lock receiver under cursor | `ctx.getQBAimLockKey` | `H` |
| Throw to locked receiver | `ctx.getQBAimThrowKey` | `T` |

## UI controls

The `QB Aim` section has:

- header toggle / enabled toggle
- `Team Filter`
- `Show Arc`
- `Catch Ahead`
- `Peak Height`

The older status and target text labels are removed. Target feedback is visual: when QB Aim is enabled and a receiver is locked, the receiver character gets a QB Aim-owned `Highlight` named `QBAimTargetHighlight`.

## Public API returned by `QBAim.new`

```lua
api.SetQBAimState(value)
api.SetTeamFilterState(value, fire)
api.SetShowArcState(value, fire)
api.SetLeadDelay(value, fire) -- compatibility alias for Catch Ahead
api.SetCatchAhead(value, fire)
api.SetPeakHeight(value, fire)
api.Refresh()
api.Reset()
api.Destroy()
```

## State keys used

```lua
state.qbAimEnabled
state.qbAimTeamFilter
state.qbAimShowArc
state.qbAimCatchAhead
state.qbAimLeadDelay -- compatibility mirror
state.qbAimPeakHeight
```

`ctx.onChanged(state)` is called when relevant user state changes.

## Toggle refresh behavior

The runtime refreshes active controls when a page/tab is activated. Main-page modules repaint from `PAGE1_STATE` through their `api.Refresh()` methods, and shared header toggles force a visual repaint even when the boolean value did not change.

Startup loading is split: core/main-page modules load through the loader, while secondary pages/modules are loaded on demand when their tabs are first built. Background auto-refresh is disabled by default; Discord/server `/update` should update hosted sources without continuous client polling.

Header toggle internal strokes are fixed-role strokes and use consistent thickness in enabled and disabled states. State should read through fill/color/transparency, not outline-weight changes.
