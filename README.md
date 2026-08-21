# dev-gui

The testing Untitled GUI source. It uses its own repository, Railway service,
client key, loader state, GUI name, cleanup callback, and module cache.

```lua
loadstring(game:HttpGet("https://dev-gui-api-production.up.railway.app/loader/dev-gui"))()
```

The Railway bridge routes code and assets to `amyyzing/dev-gui` with the dev key,
while player settings, presets, announcements, and player logs use the same storage
as `/gui`. Optional loader overrides use `getgenv().DEV_GUI_BOOT_CONFIG`.

Run `./sync.ps1` from a clean worktree to fetch and merge the current `/gui` source.
Dev-only features and environment routing stay in this repository.
