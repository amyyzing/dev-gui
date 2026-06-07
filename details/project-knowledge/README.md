# QBAim game-source understanding markdown pack

This pack is markdown-only. It is not a research-paper pack and it is not PDF-based.

It documents the client-visible game structure inferred from the Lua scripts you sent and the updated QBAim variants created during this chat. It focuses on game source concepts: folder layout, remotes, `Mechanics`, football discovery, animation/release flow, `Center`/arc attachments, receiver replication, and the football-math contract.

Important source limit: I do not have the official Roblox game source, server scripts, or the actual `FootballMath.lua` module. Files named like `FootballMath.lua.md` are inferred module maps/skeletons based on the client script behavior and constants, not verified original files.

## Folder layout

- `Game_Structure/`: folder trees, game modes, remotes, replicated player/team data, football discovery.
- `Runtime_Flow/`: throw flow, animation/release timing, arc preview rig, UI/API state.
- `Tracking_And_Prediction_State/`: receiver tracking data, route state, cut/deceleration state.
- `Inferred_Game_Modules/`: markdown files shaped like game modules, such as `FootballMath.lua.md`, `GameRemotes.lua.md`, and `Mechanics.lua.md`.
- `Actual_QBAim_Source_As_Markdown/`: exact `.lua` files converted into `.md` code blocks.
- `Indices/`: constants, function index, file version map, and verification checklist.

## Main inference summary

The game appears to expose football actions through a `ReEvent` remote under game/minigame folders. Gameplay throws use `FireServer("Mechanics", "ThrowBall", { Target = plan.aimPoint, Power = 100 })`. Squads throws add `AutoThrow = false`. The client-visible `Power = 100` maps to the modeled ball speed of about `95` studs/s according to the script comment.

The game/client also appears to keep a `Mechanics` object reachable from globals or `PlayerScripts.ClientMain.Utilities.Variables`, with at least `PlayAnimation` and `UnequipFootball` functions. The QB throw animation name used by the script is `UF_QuarterbackThrow`.

The local visual throw arc comes from `Local.Center`, with `C2` used as release-height reference and `C1`/`C3`/`Beam` used for the preview arc.

## Current QBAim math notes

- C1 height defaults to `WR_MAX_Y`, about `13.85`, and is user-adjustable through the `Peak Height` QB Aim slider.
- The live solver uses a fixed-speed projectile intercept condition with local ball speed `95` and remote display power `100`.
- `Lead Adjust` is extra receiver prediction time. The current default is `0.20`, but the solver now tapers that extra delay by flight time so short throws do not receive the full compensation.
- Vertical C2/release extrapolation is disabled. During jump preview, C2 should follow the current ball/Center C2 reference instead of being pulled downward by player-gravity prediction.
- QB Aim no longer displays status/target text rows; the locked target is shown with a QB Aim-owned `Highlight`.
