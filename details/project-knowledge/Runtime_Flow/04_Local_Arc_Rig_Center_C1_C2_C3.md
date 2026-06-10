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

| Attachment | Current role |
|---|---|
| `C2` | Original `Center.C2` is the release-origin frame used by math. Cloned `C2` is visual-only. |
| `C1` | Catch/intercept marker for preview. Created on the clone if missing. |
| `C3` | Preview beam endpoint, currently placed at the same catch point as C1. |
| `Beam` | Preview curve wired as cloned `C2 -> C3`. |

## Release frame rule

Current code reads the original game C2 frame:

```lua
local function originalC2Frame()
    local center = originalCenter()
    local c2 = center and center:FindFirstChild("C2", true)
    return c2 and attachmentCFrame(c2)
end
```

`origin()` uses that original C2 position when available. It no longer uses ball position as the primary release source, because the game throw is anchored to the arc/release rig rather than the visible ball part.

## Preview clone rule

The clone is display-only:

```lua
preview.center = original:Clone()
preview.center.Name = "ClonedCenter"
```

The cloned attachments are updated from the plan:

```lua
setAttachmentCFrame(c2, previewArcCFrame(p2, plan.velocity))
setAttachmentCFrame(c1, previewArcCFrame(p1, plan.velocity + G * plan.time))
setAttachmentCFrame(c3, previewArcCFrame(p3, endVelocity))
```

`previewArcCFrame` applies a 90 degree roll to match the live arc plane:

```lua
xAxisCFrame(position, vector) * CFrame.Angles(math.rad(90), 0, 0)
```

Do not read from cloned C2 for math; it can be stale or self-referential.
