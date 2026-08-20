# dev-gui

`dev-gui` is a development clone of [`amyyzing/gui`](https://github.com/amyyzing/gui) with its own Railway module source and a small declarative Luau UI surface.

## Loader

Once the matching Railway bot revision and `DEV_GUI_*` variables are deployed, the executor entry point is:

```lua
loadstring(game:HttpGet("https://dev-gui-api-production.up.railway.app/loader/dev-gui"))()
```

Optional boot flags use a clone-only global, so they do not alter the main GUI loader:

```lua
getgenv().DEV_GUI_BOOT_CONFIG = {
    Debug = true,
}
```

The normal loader requests one platform bundle and never reads or writes a disk
cache. During the current game session it may reuse a validated compiled bundle
from process memory after Railway confirms the build is unchanged. Set
`Development = true` only when explicitly testing fresh modular source.

The client uses its own API credential and Railway volume. Saved player data,
presets, announcements, settings, and session memory are isolated from the main
GUI. The fixed `dev-gui` module source makes Railway fetch code only from this
repository instead of `gui`.

## Structure

- `loader.lua` is the stable, memory-only bundled entry.
- `build/bundle-manifest.json` is the authoritative bundle inventory.
- `dump/start.lua` is retained as the modular development and recovery path.
- `dump/init.lua` is the only public entry into implementation details.
- `dump/ui.lua` exposes the small `UI.createThing(parent, options)` API.
- `dump/lib.lua` is the only file that knows the positional 495 UI-library helpers.
- `features/*/controller.lua` owns behavior; `view.lua` owns composition.

The Discord settings feature is the first migrated controller/view example. Existing features continue to run through the legacy runtime while they are migrated incrementally.

## Railway isolation

The companion `lint-bot` revision runs as a separate API-only Railway service
with:

- `API_ONLY=true`
- `API_SERVICE_SOURCE=dev-gui`
- `PRESET_API_KEY`
- `DEV_GUI_CLIENT_KEY`
- `DEV_GUI_OWNER`
- `DEV_GUI_REPO`
- `DEV_GUI_BRANCH`
- `DEV_GUI_TOKEN` (optional for a public repository)

The service has its own module allowlist, cache keys, volume-backed data, and
in-memory sessions. It does not start another Discord client and does not reuse
the main GUI or Genesis credentials.
