# Architecture Direction

This project should move toward a hybrid structure: shared infrastructure for lifecycle, state, theming, UI primitives, and platform access; vertical feature folders for feature-specific views, controllers, state, and domain logic.

## Dependency Rules

- `domain/` contains pure math and imports no UI, stores, pages, services, or Roblox discovery code.
- `platform/` wraps Roblox and game-specific APIs.
- `services/` may import `platform/` and `domain/`, but not feature views or pages.
- Feature controllers may use state slices, services, schedulers, and feature-local domain modules.
- Feature views may use UI components, selectors, and actions, but not remotes or world services.
- Pages compose feature views and should not contain gameplay logic.
- The app bootstrap is the only layer that knows the complete dependency graph.

## Migration Order

1. Add lifecycle and contracts: `Scope`, `Scheduler`, state slices, and theme tokens.
2. Build the design system: tokens, resolver, theme binding, UI primitive, then shared controls.
3. Add compatibility adapters so existing controls can delegate to the new UI library.
4. Migrate simple pages first: Settings, Keybinds, then GUI Customizer.
5. Extract shared services: player cache, ball tracker, highlights, remote adapters, world observer.
6. Migrate complex features: ESP, game params, and QB Aim last.
7. Remove compatibility code only after all pages and features use the new contracts.

## Current Runtime Contracts

- `core/scope.lua` owns cleanup for connections, instances, functions, nested scopes, destroyable tables, cancellable delayed callbacks, and arbitrary cleanup tasks. `destroy()` is idempotent; `cancelAll()` is an alias for cleanup without marking the scope destroyed.
- `core/scheduler.lua` is the preferred owner for repeated `RenderStepped`, `Heartbeat`, interval, and delayed jobs. Jobs are named, cancellable, pausable, and expose timing stats through `stats()`, `jobStats(name)`, and `resetStats()`.
- `runtime/loader-part-1.lua` exposes shared services through `RuntimeServices`: `Janitor`, `Scheduler`, `StateStore`, `ThemeStore`, `PlayerCache`, and `BallTracker`.

New feature code should depend on these contracts instead of adding feature-local connection arrays or direct repeated `RunService` loops.

## Feature Shape

Feature modules should avoid receiving one giant `ctx`. Use narrow dependencies:

```lua
local feature = QBAim.new({
	state = qbAimState,
	scheduler = scheduler,
	players = playerCache,
	ballTracker = ballTracker,
	footballRemote = footballRemote,
	solver = solver,
})
```

Recommended lifecycle:

```lua
feature:mount(parent)
feature:start()
feature:stop()
feature:destroy()
```

`mount` builds view instances. `start` activates gameplay jobs. `stop` disables jobs. `destroy` must be idempotent and clear every connection, tween, instance, and scheduled callback.
