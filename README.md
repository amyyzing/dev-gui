# dev-gui

`dev-gui` is a development clone of [`amyyzing/gui`](https://github.com/amyyzing/gui) with an isolated Railway module source and a small declarative Luau UI surface.

## Loader

Once the matching Railway bot revision and `DEV_GUI_*` variables are deployed, the executor entry point is:

```lua
loadstring(game:HttpGet("https://lint-bot-production.up.railway.app/loader/dev-gui"))()
```

Optional boot flags use a clone-only global, so they do not alter the main GUI loader:

```lua
getgenv().DEV_GUI_BOOT_CONFIG = {
    Fresh = true,
    FetchTimeout = 30,
}
```

The client API key is only a routing boundary; an executor can inspect it. The private GitHub token remains server-side in Railway.
The deployed `DEV_GUI_KEY` must be `dev-gui`, matching the loader's clone-only routing key.

## Structure

- `loader.lua` is the stable entry and loads `dump/start.lua` through Railway.
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
- `DEV_GUI_TOKEN`
- `DEV_GUI_PLAYER_LOG_CHANNEL_ID`

The source has its own module allowlist, cache keys, stored player/preset/settings data, in-memory sessions, and optional player-log channel. It does not reuse the main GUI or Genesis credentials.
