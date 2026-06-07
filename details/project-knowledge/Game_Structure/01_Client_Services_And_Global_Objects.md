# Client services and global objects

The QBAim module depends on these Roblox services:

```lua
local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local Workspace=game:GetService("Workspace")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
```

The active local player is stored as:

```lua
local LP=Players.LocalPlayer
```

## Core client-side references

| Name | Meaning |
|---|---|
| `Workspace.Games` | Primary gameplay game folders. |
| `Workspace.MiniGames` | Park/squads/minigame runtime folders. |
| `ReplicatedStorage.Games` | Replicated fallback for game folders/remotes. |
| `ReplicatedStorage.MiniGames` | Replicated fallback for minigame folders/remotes. |
| `LP.Character` or `Workspace[LP.Name]` | Current local character. |
| `PlayerScripts.ClientMain.Utilities.Variables` | Inferred client utility module location used to find `Variables.Mechanics`. |
| `_G` / `getgenv()` | Global fallback locations for `Mechanics` or `Variables.Mechanics`. |

## Root-part resolution

The root resolver checks common body root names in this order:

```text
HumanoidRootPart -> UpperTorso -> Torso
```

That root is used for QB origin, receiver tracking, cursor targeting, and football proximity checks.
