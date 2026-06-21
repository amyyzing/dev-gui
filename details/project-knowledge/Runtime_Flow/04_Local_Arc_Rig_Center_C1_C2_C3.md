# Local arc rig: `Center`, `C1`, `C2`, `C3`, `Beam`

The arc preview clones the game's existing `Local.Center` object. The original and the clone have different responsibilities.

## Center lookup

```text
localFolder()
  -> one Workspace.MiniGames child: first MiniGame.Local
  -> otherwise: first Workspace.Games child.Local

originalCenter()
  -> localFolder().Center
```

## Attachment roles

| Attachment | Current restored role |
|---|---|
| `C2` | Original `Center.C2.Y` is used as release-height reference if near the ball. Cloned `C2` is visual-only. |
| `C1` | Catch/intercept marker for preview. Created on the clone if missing. |
| `C3` | Preview beam endpoint, currently placed at the same catch point as C1. |
| `Beam` | Preview curve wired as cloned `C2 -> C3`. |

## Release-height rule

Current restored code reads only original C2 Y:

```lua
local function c2Y()
    local center = originalCenter()
    local c2 = center and center:FindFirstChild("C2", true)
    local cf = c2 and attachmentCFrame(c2)
    return cf and cf.Position.Y
end
```

`origin()` starts from ball/root position and only replaces Y with `c2Y()` when it is near the ball:

```lua
if centerY and centerY >= baseY - C2_GROUND_FALLBACK_MARGIN and centerY <= baseY + C2_MAX_ABOVE_BALL then
    y = centerY
end
```

## Preview clone rule

The clone is display-only:

```lua
preview.center = original:Clone()
preview.center.Name = "ClonedCenter"
```

The cloned attachments are updated from the plan with normal `xAxisCFrame`:

```lua
setAttachmentCFrame(c2, xAxisCFrame(p2, plan.velocity))
setAttachmentCFrame(c1, xAxisCFrame(p1, plan.velocity + G * plan.time))
setAttachmentCFrame(c3, xAxisCFrame(p3, endVelocity))
```

Do not read from cloned C2 for math; it can be stale or self-referential.
