# ArcHandles

## Release-Relevant Notes

- Reviewed on 2026-06-24 from a ByteFall/Potassium dump.
- Script path from dump: `game:GetChildren()[117]:GetChildren()[21]:GetChildren()[5]:GetChildren()[2]:GetChildren()[8]:GetChildren()[10]`.
- This is an editor-style 3D rotation-handle widget named `BTArcHandles`, not the football QB throwing arc.
- It creates a `ScreenGui`, six side handle `ImageButton`s, and axis circle segments using `CylinderHandleAdornment`.
- It updates on `RenderStepped`, projects handles with `Camera:WorldToViewportPoint`, computes drag deltas with `ViewportPointToRay` / `ScreenPointToRay`, and calls `OnDrag(axis, angle)`.
- It has no `ThrowBall`, `UpdateFootball`, `SpawnPos`, `Power`, `Target`, `C2`, `C3`, `Center`, `FootballMath`, or release timing logic.
- Practical takeaway: this file is useful for UI/handle math and confirms an `ArcHandles` name in the game source, but it should not be used as evidence for QB throw origin, C1/C2/C3, or football arc behavior.

## Important Behaviors

- `CreateCircles()` creates 60 `CylinderHandleAdornment` slices for each axis.
- `CreateHandles()` creates image handles for each `Enum.NormalId` side and maps sides to axes:
  - `Top` / `Bottom` -> `Z`
  - `Left` / `Right` -> `Y`
  - `Front` / `Back` -> `X`
- `UpdateHandle()` positions each handle around the adornee based on camera FOV, viewport size, and adornee size.
- `UpdateCircle()` draws the visible axis rings around the adornee.
- `SetAdornee()` starts or hides the handle UI based on whether an adornee is present.

