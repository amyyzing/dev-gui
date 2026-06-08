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
- `Peak Height` slider or fallback textbox

The older status and target text labels are removed. Target feedback is now visual: when QB Aim is enabled and a receiver is locked, the receiver character gets a QB Aim-owned `Highlight` named `QBAimTargetHighlight`.

## Public API returned by `QBAim.new`

```lua
api.SetQBAimState(value)
api.SetTeamFilterState(value, fire)
api.SetShowArcState(value, fire)
api.SetLeadDelay(value, fire)
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
state.qbAimLeadDelay
state.qbAimPeakHeight
```

`ctx.onChanged(state)` is called when relevant user state changes.

## Toggle refresh behavior

The runtime refreshes the active page controls when a page/tab is activated. Main-page modules repaint from `PAGE1_STATE` through their `api.Refresh()` methods, and shared header toggles force a visual repaint even when the boolean value did not change. The forced repaint is skipped while a header-toggle state tween is running, so refresh sync does not cancel the click animation. This keeps saved toggle state consistent after rejoin, lazy page construction, and tab switches.

Startup loading is intentionally split: core/main-page modules load through the loader, while Maps, Customize, Page2, and Settings modules are loaded on demand when their tabs are first built.

Header toggle internal strokes are fixed-role strokes and use the same thickness in enabled and disabled states. State should read through fill/color/transparency, not outline-weight changes. Header switches use named enabled/disabled visual presets so initial creation, hard refresh, and animation all apply the same rail, marker, glow, and tick values.
