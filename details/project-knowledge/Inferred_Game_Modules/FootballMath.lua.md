# `FootballMath.lua` map

The root-level `details/project-knowledge/FootballMath.md` file now contains decompiled source markdown for the game module. This file is kept as a compact map of the parts relevant to QBAim.

## Confirmed settings

```lua
Settings.FPS = 60
Settings.TimeScale = 1
Settings.Gravity = -28
Settings.GravityVector = Vector3.new(0, Gravity / FPS, 0)
Settings.GravityVectorConstant = Vector3.new(0, Gravity, 0)
Settings.MaxPower = 100
Settings.MinPower = 30
Settings.MaximumPowerCoefficient = 0.95
Settings.MaxTimeInAir = 6
```

## Relevant formulas

Velocity for a pass:

```lua
local t = flightTime * TimeScale
return (target - GravityVectorConstant * t^2 / 2 - origin) / t
```

Position at time:

```lua
local t = time * TimeScale
return CFrame.new(GravityVectorConstant * t^2 / 2 + velocity * t + origin)
```

Display power:

```lua
DisplayPower = InitialVelocity.Magnitude * (1 / MaximumPowerCoefficient)
```

So:

```text
display power 100 -> modeled velocity magnitude 95
```

## Current QBAim mapping

- Remote power sent to game: `100`
- Ball speed used by model: `95`
- Ball gravity used by model: `28`
- Receiver target peak Y: `14.00` by default, adjustable by the `Peak Height` slider
- Receiver lead control: `Catch Ahead` in studs, not time delay
- Release origin: original game `Center.C2` frame when available
