# dev-gui

`dev-gui` is a development clone of [`amyyzing/gui`](https://github.com/amyyzing/gui) with its own Railway module source and a small declarative Luau UI surface.

## Loader

Once the matching Railway bot revision and `DEV_GUI_*` variables are deployed, the executor entry point is:

```lua
loadstring(game:HttpGet("https://lint-bot-production.up.railway.app/loader/dev-gui"))()
```

Optional boot flags use a clone-only global, so they do not alter the main GUI loader:

```lua
getgenv().DEV_GUI_BOOT_CONFIG = {
    Debug = true,
}
```

Production startup downloads one commit-pinned PC or mobile bundle and caches the
last compiled build in `dev-gui-cache`. Set `Fresh = true` to redownload the
current bundle, or `Development = true` to use the modular Railway loader while
working on individual files.

The client uses the same API credential, saved player data, presets, announcements,
Discord settings, and session memory as the main GUI. The fixed `dev-gui` module
source still makes Railway fetch code from this repository instead of `gui`.
The testing repository keeps its own `DEV_GUI_TOKEN` GitHub setting.

## Structure

- `loader.lua` is the stable entry and normally executes one raw Railway bundle.
- `build/bundle-manifest.json` is the authoritative bundle inventory.
- `dump/start.lua` is retained as the modular development and recovery path.
- `dump/init.lua` is the only public entry into implementation details.
- `dump/ui.lua` exposes the small `UI.createThing(parent, options)` API.
- `dump/lib.lua` is the only file that knows the positional 495 UI-library helpers.
- `features/*/controller.lua` owns behavior; `view.lua` owns composition.

The Discord settings feature is the first migrated controller/view example. Existing features continue to run through the legacy runtime while they are migrated incrementally.

## Railway isolation

The companion `lint-bot` revision uses a third source named `dev-gui` with:

- `DEV_GUI_KEY`
- `DEV_GUI_OWNER`
- `DEV_GUI_REPO`
- `DEV_GUI_BRANCH`
- `DEV_GUI_TOKEN` (optional for a public repository)
- `DEV_GUI_PLAYER_LOG_CHANNEL_ID`

The source has its own module allowlist, cache keys, stored player/preset/settings data, in-memory sessions, and optional player-log channel. It does not reuse the main GUI or Genesis credentials.
