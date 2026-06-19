# Studio GUI Preview

This folder contains the Roblox Studio preview harness for the GUI.

It renders through the actual Roblox GUI engine, so it is the closest preview path to 1:1 without joining the real game.

## How To Use

1. Start Rojo from the repo root:

   ```powershell
   .tools\rojo\rojo.exe serve default.project.json
   ```

2. Open a blank/baseplate place in Roblox Studio.
3. Connect the Rojo plugin.
4. Press **Play** or **Play Solo**.
5. The GUI mounts from `ReplicatedStorage.GuiSource` into `PlayerGui`.

## What It Loads

- Main
- Map Editor
- Server placeholder
- GUI Customizer
- Keybinds
- Settings

The harness stubs bot/network/gameplay dependencies so the panel can render without the football game. Gameplay loops should stay inert unless a feature is toggled inside the preview.

## File

`GuiRojoPreview.client.lua` is mapped by `default.project.json` into:

```txt
StarterPlayer.StarterPlayerScripts.GuiRojoPreview
```
