# Inferred folder tree

This is the practical object tree used by QBAim. It is not official server source.

```text
Workspace
├── Games
│   └── <GameFolder>
│       ├── ReEvent?                         -- RemoteEvent candidate
│       ├── Replicated
│       │   ├── ReEvent?                     -- RemoteEvent candidate
│       │   └── Players
│       │       └── <LocalPlayerName>        -- membership marker
│       └── Local
│           └── Center                       -- arc rig source
│               ├── C2                       -- release attachment/reference
│               ├── C1?                      -- arc/catch attachment, created if missing
│               ├── C3                       -- endpoint attachment
│               └── Beam                     -- arc preview beam
│
├── MiniGames
│   └── <MiniGameFolder>
│       ├── ReEvent?                         -- squads RemoteEvent candidate
│       ├── Football?                        -- ball candidate
│       └── Local
│           └── Center                       -- arc rig source in one-minigame mode
│
└── <LocalPlayerName>
    ├── HumanoidRootPart / UpperTorso / Torso
    ├── Football?                            -- direct held football candidate
    └── GAMEOBJECTS
        └── Football?                        -- held football fallback

ReplicatedStorage
├── Games
│   └── <GameFolder>
│       ├── ReEvent?
│       └── Replicated
│           └── ReEvent?
└── MiniGames
    └── <MiniGameFolder>
        ├── ReEvent?
        └── Football?

Players
└── <Player>
    └── Replicated
        └── TeamID

LocalPlayer.PlayerScripts
└── ClientMain
    └── Utilities
        └── Variables                         -- ModuleScript candidate
            └── Mechanics                     -- table field after require
```
