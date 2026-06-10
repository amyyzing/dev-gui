# QBAim game-source understanding markdown pack

This pack is markdown-only. It documents the client-visible game structure from decompiled source markdown, inferred module maps, and historical QBAim variants created during this chat.

The newest root-level `FootballMath.md`, `Mechanics.md`, `MECH_*`, and `GLOB_*` files are decompiled game-source markdowns. Treat those as stronger evidence than older inferred module notes. Files in `Inferred_Game_Modules/` remain useful as working maps, but they are not official source.

## Folder layout

- `Game_Structure/`: folder trees, game modes, remotes, replicated player/team data, football discovery.
- `Runtime_Flow/`: throw flow, animation/release timing, arc preview rig, UI/API state.
- `Tracking_And_Prediction_State/`: receiver tracking data, route state, cut/deceleration state.
- `Inferred_Game_Modules/`: markdown files shaped like game modules, such as `FootballMath.lua.md`, `GameRemotes.lua.md`, and `Mechanics.lua.md`.
- `Actual_QBAim_Source_As_Markdown/`: exact `.lua` files converted into `.md` code blocks.
- Root-level `FootballMath.md`, `Mechanics.md`, `MECH_*`, `GLOB_*`: decompiled game-source markdown references.
- `Game_Source_Findings.md`: compact list of source facts that affect current project code decisions.
- `Indices/`: constants, function index, file version map, and verification checklist.

## Main inference summary

The game exposes football actions through a `ReEvent` remote under game/minigame folders. The decompiled quarterback source confirms `FootballThrow` sends:

```lua
ReEvent:FireServer("Mechanics", "ThrowBall", {
    AutoThrow = false,
    Target = aimPoint,
    Power = BallPower,
})
```

The decompiled `FootballMath` source confirms `MaxPower = 100`, `MaximumPowerCoefficient = 0.95`, and gravity `-28`, so a display power of `100` corresponds to a modeled launch speed of `95`.

The game/client also appears to keep a `Mechanics` object reachable from globals or `PlayerScripts.ClientMain.Utilities.Variables`, with at least `PlayAnimation` and `UnequipFootball` functions. The QB throw animation name used by the script is `UF_QuarterbackThrow`.

The local visual throw arc comes from `Local.Center`, with `C2` used as the release reference. The current script clones `Center` only for preview visuals; math uses the original game `Center.C2` frame, not the clone and not ball Y.

## Current QBAim math notes

- C1 height defaults to `WR_MAX_Y = 14.00`, and is user-adjustable through the `Peak Height` QB Aim slider.
- The live solver uses a fixed-speed projectile intercept condition with local ball speed `95` and remote display power `100`.
- `Catch Ahead` is a spatial receiver offset in studs. The current default is `8.0`, with old `qbAimLeadDelay` state kept only as a compatibility mirror.
- Release timing moves both the original `Center.C2` origin and receiver start forward in time before the intercept solve.
- Vertical C2/release extrapolation is disabled. Release Y comes from original `Center.C2`, with QB jump correction currently zeroed.
- QB Aim no longer displays status/target text rows; the locked target is shown with a QB Aim-owned `Highlight`.
