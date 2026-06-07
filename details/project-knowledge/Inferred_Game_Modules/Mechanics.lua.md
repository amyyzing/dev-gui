# Inferred `Mechanics.lua`

This is not the official game file. It documents the `Mechanics` methods that QBAim expects to exist.

```lua
local Mechanics = {}

function Mechanics:PlayAnimation(animationName, speed)
    -- Expected by QBAim.
    -- Used as: Mechanics:PlayAnimation("UF_QuarterbackThrow", 1.35)
end

function Mechanics:UnequipFootball()
    -- Expected by QBAim after a gameplay ThrowBall remote succeeds.
end

return Mechanics
```

## Lookup sources

`Mechanics` may be available as:

```lua
getgenv().Mechanics
getgenv().Variables.Mechanics
_G.Mechanics
_G.Variables.Mechanics
require(LocalPlayer.PlayerScripts.ClientMain.Utilities.Variables).Mechanics
```

## Minimum valid object

The resolver treats the object as valid if it has either `PlayAnimation` or `UnequipFootball`.
