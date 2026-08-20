# gui

The main Untitled GUI source. It uses the main Railway API, credential, saved data,
and module source.

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/amyyzing/gui/main/loader.lua"))()
```

`loader.lua` is the stable entry point. It fetches `main.lua`, then the runtime and
feature modules through Railway. Optional overrides use `getgenv().GUI_BOOT_CONFIG`.

The `dump/` directory contains the small declarative UI/runtime layer introduced in
the development repository. Theme header assets live under `assets/headers/`.
