# Local arc rig: `Center`, `C1`, `C2`, `C3`, `Beam`

The arc preview is not created from scratch. The script clones the game's existing `Local.Center` object and manipulates its attachments/beam.

## Center lookup

```text
localFolder()
  ├── one Workspace.MiniGames child -> first MiniGame.Local
  └── otherwise -> first Workspace.Games child.Local

originalCenter()
  └── localFolder().Center
```

## Attachment roles

| Attachment | Role |
|---|---|
| `C2` | Start/release attachment. Also used as a release-height reference for ball origin if its Y value is near the ball. |
| `C1` | Mid/catch solve/marker attachment. Created if missing. In latest script C1 height is fixed to `WR_MAX_Y`. |
| `C3` | End/catch attachment for beam endpoint. |
| `Beam` | Arc visualization. Uses `C2` as `Attachment0` and `C3` as `Attachment1`. |

Current behavior notes:

- `QB_RELEASE_EXTRAPOLATE_VERTICAL=false`, so preview C2 does not apply player-gravity vertical prediction during the throw animation wait.
- C2 Y comes from the current ball/Center C2 reference when that value is near the ball.
- C1 and C3 use the intercept catch point in the current preview path.

## C2 release-height reference

```lua
	local function c2Y()
		-- Use the game's original Center.C2 only as a release-height reference.
		-- Do not read from the cloned preview C2 here, because that creates stale/self-referential C2 values.
		local center=originalCenter()
		local c2=center and center:FindFirstChild("C2",true)
		local cf=c2 and attachmentCFrame(c2)
		return cf and cf.Position.Y
	end
```

## Arc rig binding

```lua
	local function arcRig()
		local original,folder=originalCenter()
		if original and folder and (not preview.center or preview.orig~=original or not preview.center.Parent) then
			destroyPreviewCenter()
			preview.center=original:Clone()
			preview.center.Name="ClonedCenter"
			preview.center.Parent=folder
			prepPreviewObject(preview.center)
			preview.orig=original
		end

		local center=preview.center
		if not(center and center.Parent and bindArcRigParts(center)) then return nil end

		setPreviewCenterVisible(state.qbAimShowArc~=false)
		return preview.c2,preview.c1,preview.c3,preview.beam
	end
```

## Preview plan update

```lua
	local function previewPlan(plan)
		if not(ARC_PREVIEW_ENABLED and plan and state.qbAimShowArc~=false) then
			if state.qbAimShowArc==false then
				hideQBTrailPreview()
			end

			return
		end

		preview.ballMissingSince=nil
		local c2,c1,c3,beam=arcRig()
		if not(c2 and c1 and c3 and beam) then return end

		local startPoint=plan.origin
		local endPoint=plan.target or plan.c1Point
		local previewTime=plan.time
		if not(startPoint and endPoint and previewTime) then return end

		local endVelocity=plan.velocity+G*previewTime
		local p2=startPoint
		local p1=endPoint
		local p3=endPoint

		if preview.p2 then
			p2=preview.p2:Lerp(p2,PREVIEW_SMOOTH)
		end

		if preview.p1 and (p1-preview.p1).Magnitude<=28 then
			p1=preview.p1:Lerp(p1,PREVIEW_SMOOTH)
		end

		if preview.p3 and (p3-preview.p3).Magnitude<=45 then
			p3=preview.p3:Lerp(p3,PREVIEW_SMOOTH)
		end

		preview.p1,preview.p2,preview.p3=p1,p2,p3
		setAttachmentCFrame(c2,xAxisCFrame(p2,plan.velocity))
		setAttachmentCFrame(c1,xAxisCFrame(p1,plan.velocity+G*plan.time))
		setAttachmentCFrame(c3,xAxisCFrame(p3,endVelocity))
		updateC1AndC3Info(plan,p1,p3)
		beam.Attachment0=c2
		beam.Attachment1=c3
		beam.CurveSize0=math.clamp(plan.velocity.Magnitude*previewTime/3,-ARC_MAX_CURVE,ARC_MAX_CURVE)
		beam.CurveSize1=math.clamp(endVelocity.Magnitude*previewTime/3,-ARC_MAX_CURVE,ARC_MAX_CURVE)
		setPreviewCenterVisible(true)
		beam.Enabled=true
	end
```
