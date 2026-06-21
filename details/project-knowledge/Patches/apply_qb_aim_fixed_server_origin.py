#!/usr/bin/env python3
"""Apply the fixed, non-adaptive QB server-origin compensation update.

Run from the repository root:

    python details/project-knowledge/Patches/apply_qb_aim_fixed_server_origin.py --check
    python details/project-knowledge/Patches/apply_qb_aim_fixed_server_origin.py --apply

The script is intentionally strict. It stops when the expected source context is
missing instead of guessing around a changed file.
"""

from __future__ import annotations

import argparse
from pathlib import Path
import sys


def replace_once(text: str, old: str, new: str, label: str) -> tuple[str, str]:
    old_count = text.count(old)
    new_count = text.count(new)

    if new_count >= 1 and old in new:
        remaining = text.replace(new, "", 1)
        if remaining.count(old) == 0:
            return text, "already-applied"

    if old_count == 1:
        return text.replace(old, new, 1), "changed"

    if old_count == 0 and new_count >= 1:
        return text, "already-applied"

    if old_count == 0:
        raise RuntimeError(f"{label}: expected source context was not found")

    raise RuntimeError(f"{label}: expected source context occurred {old_count} times")


def logic_replacements() -> list[tuple[str, str, str]]:
    return [
        (
            "constants: C2 and horizontal server prediction",
            '''local C2_GROUND_FALLBACK_MARGIN=2.50
local C2_MAX_ABOVE_BALL=8.00
local C2_MAX_RELEASE_DISTANCE=12.00
local QB_RELEASE_EXTRAPOLATE_HORIZONTAL=true
local QB_RELEASE_EXTRAPOLATE_VERTICAL=true''',
            '''local C2_GROUND_FALLBACK_MARGIN=2.50
local C2_MAX_ABOVE_BALL=8.00
local C2_MAX_Y_DELTA=10.00
local QB_RELEASE_EXTRAPOLATE_HORIZONTAL=true
local QB_RELEASE_EXTRAPOLATE_VERTICAL=true
local QB_SERVER_HORIZONTAL_DEADZONE=0.75
local QB_SERVER_HORIZONTAL_SPEED_MAX=24''',
        ),
        (
            "constants: independent fixed XZ/Y lead",
            '''-- Separate timing terms. Do not use the full animation delay to move C2/origin.
-- The release-origin drift is unified across X/Y/Z: one time value moves the whole origin vector.
local QB_RELEASE_ORIGIN_DRIFT_TIME=0.15
local QB_RELEASE_VERTICAL_DRIFT_TIME=QB_RELEASE_ORIGIN_DRIFT_TIME -- kept as alias for internal compatibility
local QB_RELEASE_VERTICAL_DRIFT_MAX=6.00''',
            '''-- Fixed server-origin prediction. These values are intentionally not auto-tuned.
-- XZ estimates where the server will see the moving QB when it creates SpawnPos.
-- Y remains separate because release height and jump motion have different error behavior.
local QB_RELEASE_ORIGIN_DRIFT_TIME=0.15
local QB_RELEASE_VERTICAL_DRIFT_TIME=0.15
local QB_RELEASE_VERTICAL_DRIFT_MAX=6.00''',
        ),
        (
            "movement velocity: physical velocity instead of local key gate",
            '''local function movementAwareRootVelocity(rootPart)
\tlocal velocity=rootPart and rootPart.AssemblyLinearVelocity or Vector3.zero
\tif rootPart and not rootHasMoveInput(rootPart) then
\t\treturn Vector3.new(0,velocity.Y,0)
\tend

\treturn velocity
end''',
            '''local function movementAwareRootVelocity(rootPart)
\tlocal velocity=rootPart and rootPart.AssemblyLinearVelocity or Vector3.zero
\tlocal horizontal=flat(velocity)

\tif horizontal.Magnitude<QB_SERVER_HORIZONTAL_DEADZONE then
\t\thorizontal=Vector3.zero
\telseif horizontal.Magnitude>QB_SERVER_HORIZONTAL_SPEED_MAX then
\t\thorizontal=horizontal.Unit*QB_SERVER_HORIZONTAL_SPEED_MAX
\tend

\treturn Vector3.new(horizontal.X,velocity.Y,horizontal.Z)
end''',
        ),
        (
            "state: independent saved Y lead",
            '''\tif state.qbAimQBDrift==nil then
\t\tstate.qbAimQBDrift=QB_RELEASE_ORIGIN_DRIFT_TIME
\tend


\tWR_LEAD_DELAY=math.clamp(tonumber(state.qbAimLeadDelay) or WR_LEAD_DELAY,LEAD_DELAY_MIN,LEAD_DELAY_MAX)
\tWR_MAX_Y=math.clamp(tonumber(state.qbAimPeakHeight) or WR_MAX_Y,PEAK_HEIGHT_MIN,PEAK_HEIGHT_MAX)
\tQB_RELEASE_ORIGIN_DRIFT_TIME=math.clamp(tonumber(state.qbAimQBDrift) or QB_RELEASE_ORIGIN_DRIFT_TIME,QB_DRIFT_MIN,QB_DRIFT_MAX)
\tQB_RELEASE_VERTICAL_DRIFT_TIME=QB_RELEASE_ORIGIN_DRIFT_TIME
\tstate.qbAimPeakHeight=WR_MAX_Y
\tstate.qbAimQBDrift=QB_RELEASE_ORIGIN_DRIFT_TIME
\tstate.qbAimQBYDrift=QB_RELEASE_VERTICAL_DRIFT_TIME''',
            '''\tif state.qbAimQBDrift==nil then
\t\tstate.qbAimQBDrift=QB_RELEASE_ORIGIN_DRIFT_TIME
\tend

\tif state.qbAimQBYDrift==nil then
\t\tstate.qbAimQBYDrift=tonumber(state.qbAimQBDrift) or QB_RELEASE_VERTICAL_DRIFT_TIME
\tend

\tWR_LEAD_DELAY=math.clamp(tonumber(state.qbAimLeadDelay) or WR_LEAD_DELAY,LEAD_DELAY_MIN,LEAD_DELAY_MAX)
\tWR_MAX_Y=math.clamp(tonumber(state.qbAimPeakHeight) or WR_MAX_Y,PEAK_HEIGHT_MIN,PEAK_HEIGHT_MAX)
\tQB_RELEASE_ORIGIN_DRIFT_TIME=math.clamp(tonumber(state.qbAimQBDrift) or QB_RELEASE_ORIGIN_DRIFT_TIME,QB_DRIFT_MIN,QB_DRIFT_MAX)
\tQB_RELEASE_VERTICAL_DRIFT_TIME=math.clamp(tonumber(state.qbAimQBYDrift) or QB_RELEASE_VERTICAL_DRIFT_TIME,QB_Y_DRIFT_MIN,QB_Y_DRIFT_MAX)
\tstate.qbAimPeakHeight=WR_MAX_Y
\tstate.qbAimQBDrift=QB_RELEASE_ORIGIN_DRIFT_TIME
\tstate.qbAimQBYDrift=QB_RELEASE_VERTICAL_DRIFT_TIME''',
        ),
        (
            "setters: decouple XZ and Y",
            '''\tlocal function setQBDrift(value,showStatus)
\t\tlocal numberValue=tonumber(value)
\t\tif not numberValue then
\t\t\tupdateQBDriftVisuals()
\t\t\treturn false
\t\tend

\t\tQB_RELEASE_ORIGIN_DRIFT_TIME=math.clamp(numberValue,QB_DRIFT_MIN,QB_DRIFT_MAX)
\t\tQB_RELEASE_VERTICAL_DRIFT_TIME=QB_RELEASE_ORIGIN_DRIFT_TIME
\t\tstate.qbAimQBDrift=QB_RELEASE_ORIGIN_DRIFT_TIME
\t\tstate.qbAimQBYDrift=QB_RELEASE_VERTICAL_DRIFT_TIME
\t\tupdateQBDriftVisuals()
\t\tupdateQBYDriftVisuals()
\t\tif showStatus then
\t\t\tchanged()
\t\tend
\t\treturn true
\tend

\tlocal function setQBYDrift(value,showStatus)
\t\t-- Compatibility shim: X/Y/Z release-origin drift is one shared value.
\t\treturn setQBDrift(value,showStatus)
\tend''',
            '''\tlocal function setQBDrift(value,showStatus)
\t\tlocal numberValue=tonumber(value)
\t\tif not numberValue then
\t\t\tupdateQBDriftVisuals()
\t\t\treturn false
\t\tend

\t\tQB_RELEASE_ORIGIN_DRIFT_TIME=math.clamp(numberValue,QB_DRIFT_MIN,QB_DRIFT_MAX)
\t\tstate.qbAimQBDrift=QB_RELEASE_ORIGIN_DRIFT_TIME
\t\tupdateQBDriftVisuals()
\t\tif showStatus then
\t\t\tchanged()
\t\tend
\t\treturn true
\tend

\tlocal function setQBYDrift(value,showStatus)
\t\tlocal numberValue=tonumber(value)
\t\tif not numberValue then
\t\t\tupdateQBYDriftVisuals()
\t\t\treturn false
\t\tend

\t\tQB_RELEASE_VERTICAL_DRIFT_TIME=math.clamp(numberValue,QB_Y_DRIFT_MIN,QB_Y_DRIFT_MAX)
\t\tstate.qbAimQBYDrift=QB_RELEASE_VERTICAL_DRIFT_TIME
\t\tupdateQBYDriftVisuals()
\t\tif showStatus then
\t\t\tchanged()
\t\tend
\t\treturn true
\tend''',
        ),
        (
            "origin: use C2 only for Y and fixed velocity lead for XZ",
            '''\tlocal function origin(qbRoot,ball,xzReleaseOffset,yReleaseOffset)
\t\txzReleaseOffset=xzReleaseOffset or 0
\t\t-- X/Y/Z share the same release-origin drift time unless explicitly overridden.
\t\tyReleaseOffset=yReleaseOffset
\t\tif yReleaseOffset==nil then
\t\t\tyReleaseOffset=xzReleaseOffset
\t\tend

\t\tlocal rootVelocity=movementAwareRootVelocity(qbRoot)
\t\tlocal fallbackPosition=ball and ball.Position or qbRoot.Position
\t\tlocal c2Pos=c2Position()
\t\tlocal useC2=false
\t\tif c2Pos then
\t\t\tlocal referencePosition=ball and ball.Position or qbRoot.Position
\t\t\tlocal yValid=c2Pos.Y>=referencePosition.Y-C2_GROUND_FALLBACK_MARGIN and c2Pos.Y<=referencePosition.Y+C2_MAX_ABOVE_BALL
\t\t\tlocal distanceValid=(c2Pos-referencePosition).Magnitude<=C2_MAX_RELEASE_DISTANCE
\t\t\tuseC2=yValid and distanceValid
\t\tend

\t\tlocal basePosition=useC2 and c2Pos or fallbackPosition
\t\tlocal y=basePosition.Y

\t\tlocal dx,dz=0,0
\t\tif QB_RELEASE_EXTRAPOLATE_HORIZONTAL and xzReleaseOffset>0 then
\t\t\tdx=rootVelocity.X*xzReleaseOffset
\t\t\tdz=rootVelocity.Z*xzReleaseOffset
\t\tend

\t\tif QB_RELEASE_EXTRAPOLATE_VERTICAL and yReleaseOffset>0 then
\t\t\tlocal verticalVelocity=releaseVerticalVelocity(qbRoot,ball)
\t\t\tlocal airborne=math.abs(verticalVelocity)>=QB_AIRBORNE_VY_EPSILON or qbRoot.Position.Y>QB_GROUND_ROOT_Y+QB_AIRBORNE_Y_EPSILON
\t\t\tif airborne then
\t\t\t\tlocal yOffset=verticalVelocity*yReleaseOffset-0.5*PLAYER_G*yReleaseOffset*yReleaseOffset
\t\t\t\ty=y+math.clamp(yOffset,-QB_RELEASE_VERTICAL_DRIFT_MAX,QB_RELEASE_VERTICAL_DRIFT_MAX)
\t\t\tend
\t\tend

\t\treturn Vector3.new(basePosition.X+dx,y+QB_LAUNCH_Y_BIAS+qbYCorrection(qbRoot),basePosition.Z+dz)
\tend''',
            '''\tlocal function origin(qbRoot,ball,xzReleaseOffset,yReleaseOffset)
\t\txzReleaseOffset=xzReleaseOffset or 0
\t\tif yReleaseOffset==nil then
\t\t\tyReleaseOffset=QB_RELEASE_VERTICAL_DRIFT_TIME
\t\tend

\t\tlocal rootVelocity=movementAwareRootVelocity(qbRoot)
\t\tlocal fallbackPosition=ball and ball.Position or qbRoot.Position
\t\tlocal c2Pos=c2Position()
\t\tlocal y=fallbackPosition.Y

\t\tif c2Pos then
\t\t\tlocal rootY=qbRoot.Position.Y
\t\t\tlocal ballY=ball and ball.Position.Y or rootY
\t\t\tlocal yDelta=math.min(math.abs(c2Pos.Y-rootY),math.abs(c2Pos.Y-ballY))
\t\t\tlocal yValid=yDelta<=C2_MAX_Y_DELTA
\t\t\t\tand c2Pos.Y>=math.min(rootY,ballY)-C2_GROUND_FALLBACK_MARGIN
\t\t\t\tand c2Pos.Y<=math.max(rootY,ballY)+C2_MAX_ABOVE_BALL

\t\t\tif yValid then
\t\t\t\t-- C2 belongs to the local preview rig. Keep its useful release height,
\t\t\t\t-- but never take its XZ and then add server-position drift on top.
\t\t\t\ty=c2Pos.Y
\t\t\tend
\t\tend

\t\tlocal dx,dz=0,0
\t\tif QB_RELEASE_EXTRAPOLATE_HORIZONTAL and xzReleaseOffset>0 then
\t\t\tdx=rootVelocity.X*xzReleaseOffset
\t\t\tdz=rootVelocity.Z*xzReleaseOffset
\t\tend

\t\tif QB_RELEASE_EXTRAPOLATE_VERTICAL and yReleaseOffset>0 then
\t\t\tlocal verticalVelocity=releaseVerticalVelocity(qbRoot,ball)
\t\t\tlocal airborne=math.abs(verticalVelocity)>=QB_AIRBORNE_VY_EPSILON or qbRoot.Position.Y>QB_GROUND_ROOT_Y+QB_AIRBORNE_Y_EPSILON
\t\t\tif airborne then
\t\t\t\tlocal yOffset=verticalVelocity*yReleaseOffset-0.5*PLAYER_G*yReleaseOffset*yReleaseOffset
\t\t\t\ty=y+math.clamp(yOffset,-QB_RELEASE_VERTICAL_DRIFT_MAX,QB_RELEASE_VERTICAL_DRIFT_MAX)
\t\t\tend
\t\tend

\t\treturn Vector3.new(fallbackPosition.X+dx,y+QB_LAUNCH_Y_BIAS+qbYCorrection(qbRoot),fallbackPosition.Z+dz)
\tend''',
        ),
        (
            "buildPlan: pass independent Y lead",
            '''\tlocal function buildPlan(receiver,ballPower,releaseOffset,releaseBall,receiverReleaseOffset)''',
            '''\tlocal function buildPlan(receiver,ballPower,releaseOffset,releaseBall,receiverReleaseOffset,yReleaseOffset)''',
        ),
        (
            "buildPlan: call origin with independent Y lead",
            '''\t\treleaseOffset=releaseOffset or 0
\t\treceiverReleaseOffset=receiverReleaseOffset==nil and releaseOffset or receiverReleaseOffset
\t\tlocal originPosition=origin(qbRoot,ball,releaseOffset)''',
            '''\t\treleaseOffset=releaseOffset or 0
\t\treceiverReleaseOffset=receiverReleaseOffset==nil and releaseOffset or receiverReleaseOffset
\t\tyReleaseOffset=yReleaseOffset==nil and QB_RELEASE_VERTICAL_DRIFT_TIME or yReleaseOffset
\t\tlocal originPosition=origin(qbRoot,ball,releaseOffset,yReleaseOffset)''',
        ),
        (
            "throw plan: independent Y lead variable",
            '''\t\tlocal lockedQBOffset=QB_RELEASE_ORIGIN_DRIFT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY
\t\tlocal lockedWROffset=WR_RELEASE_PREDICT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY''',
            '''\t\tlocal lockedQBOffset=QB_RELEASE_ORIGIN_DRIFT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY
\t\tlocal lockedQBYOffset=QB_RELEASE_VERTICAL_DRIFT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY
\t\tlocal lockedWROffset=WR_RELEASE_PREDICT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY''',
        ),
        (
            "throw plan: build with independent Y lead",
            '''\t\tlocal lockedPlan=buildPlan(receiver,power,lockedQBOffset,heldBall,lockedWROffset)''',
            '''\t\tlocal lockedPlan=buildPlan(receiver,power,lockedQBOffset,heldBall,lockedWROffset,lockedQBYOffset)''',
        ),
        (
            "UI: split XZ and Y sliders",
            '''\t\tqbDriftSliderControl=buildSlider(sectionBody,"QB XYZ Drift",QB_DRIFT_MIN,QB_DRIFT_MAX,QB_RELEASE_ORIGIN_DRIFT_TIME,2,function(value)
\t\t\tapi.SetQBDrift(value,true)
\t\tend)''',
            '''\t\tqbDriftSliderControl=buildSlider(sectionBody,"Server XZ Lead",QB_DRIFT_MIN,QB_DRIFT_MAX,QB_RELEASE_ORIGIN_DRIFT_TIME,2,function(value)
\t\t\tapi.SetQBDrift(value,true)
\t\tend)
\t\tqbYDriftSliderControl=buildSlider(sectionBody,"Server Y Lead",QB_Y_DRIFT_MIN,QB_Y_DRIFT_MAX,QB_RELEASE_VERTICAL_DRIFT_TIME,2,function(value)
\t\t\tapi.SetQBYDrift(value,true)
\t\tend)''',
        ),
        (
            "UI fallback: split XZ and Y text boxes",
            '''\t\tNew("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-80,0,24),Text="QB XYZ Drift",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7},qbDriftFrame)
\t\taddConnection(qbDriftBox.FocusLost:Connect(function()
\t\t\tsetQBDrift(qbDriftBox.Text,true)
\t\tend))''',
            '''\t\tNew("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-80,0,24),Text="Server XZ Lead",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7},qbDriftFrame)
\t\taddConnection(qbDriftBox.FocusLost:Connect(function()
\t\t\tsetQBDrift(qbDriftBox.Text,true)
\t\tend))
\t\tqbYDriftFrame=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,26),ZIndex=6},sectionBody)
\t\tqbYDriftBox=New("TextBox",{BackgroundColor3=THEME.BG,BorderSizePixel=0,Position=UDim2.new(1,-72,0,0),Size=UDim2.fromOffset(72,24),Text=string.format("%.2f",QB_RELEASE_VERTICAL_DRIFT_TIME),ClearTextOnFocus=false,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=7},qbYDriftFrame)
\t\tNew("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-80,0,24),Text="Server Y Lead",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7},qbYDriftFrame)
\t\taddConnection(qbYDriftBox.FocusLost:Connect(function()
\t\t\tsetQBYDrift(qbYDriftBox.Text,true)
\t\tend))''',
        ),
        (
            "preview plan: pass fixed XZ/Y lead separately",
            '''\t\tlocal previewQBOffset=QB_RELEASE_ORIGIN_DRIFT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY
\t\tlocal previewWROffset=WR_RELEASE_PREDICT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY
\t\tlocal plan=buildPlan(trackedReceiver,nil,previewQBOffset,heldBall,previewWROffset)''',
            '''\t\tlocal previewQBOffset=QB_RELEASE_ORIGIN_DRIFT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY
\t\tlocal previewQBYOffset=QB_RELEASE_VERTICAL_DRIFT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY
\t\tlocal previewWROffset=WR_RELEASE_PREDICT_TIME+THROW_TARGET_LOCK_EXTRA_DELAY
\t\tlocal plan=buildPlan(trackedReceiver,nil,previewQBOffset,heldBall,previewWROffset,previewQBYOffset)''',
        ),
    ]


def simple_replacements() -> dict[str, list[tuple[str, str, str]]]:
    return {
        "runtime/loader-part-1.lua": [
            (
                "runtime globals: fixed origin defaults",
                '''qbAimLeadDelay=0.38
qbAimPeakHeight=14.00''',
                '''qbAimLeadDelay=0.38
qbAimPeakHeight=14.00
qbAimQBDrift=0.15
qbAimQBYDrift=0.15''',
            )
        ],
        "runtime/loader-part-2.lua": [
            (
                "PAGE1 defaults: fixed origin settings",
                '''\tqbAimLeadDelay=0.38,
\tqbAimPeakHeight=14.00,
\ttestingEnabled=false,''',
                '''\tqbAimLeadDelay=0.38,
\tqbAimPeakHeight=14.00,
\tqbAimQBDrift=0.15,
\tqbAimQBYDrift=0.15,
\ttestingEnabled=false,''',
            )
        ],
        "runtime/loader-part-5.lua": [
            (
                "data-save setters: fixed origin settings",
                '''\tsetQBAimLeadDelay={"qbAimLeadDelay",false,"QBAim","SetLeadDelay",true},
\tsetQBAimPeakHeight={"qbAimPeakHeight",false,"QBAim","SetPeakHeight",true},
\tsetTestingState={"testingEnabled",true,"Testing","SetTestingState",true},''',
                '''\tsetQBAimLeadDelay={"qbAimLeadDelay",false,"QBAim","SetLeadDelay",true},
\tsetQBAimPeakHeight={"qbAimPeakHeight",false,"QBAim","SetPeakHeight",true},
\tsetQBAimQBDrift={"qbAimQBDrift",false,"QBAim","SetQBDrift",true},
\tsetQBAimQBYDrift={"qbAimQBYDrift",false,"QBAim","SetQBYDrift",true},
\tsetTestingState={"testingEnabled",true,"Testing","SetTestingState",true},''',
            )
        ],
        "data-save/data-save.lua": [
            (
                "save payload: fixed origin settings",
                '''\t\t\t\tleadDelay=getValue(ctx,"qbAimLeadDelay",0.38),
\t\t\t\tpeakHeight=getValue(ctx,"qbAimPeakHeight",14.00),
\t\t\t},''',
                '''\t\t\t\tleadDelay=getValue(ctx,"qbAimLeadDelay",0.38),
\t\t\t\tpeakHeight=getValue(ctx,"qbAimPeakHeight",14.00),
\t\t\t\tserverXZLead=getValue(ctx,"qbAimQBDrift",0.15),
\t\t\t\tserverYLead=getValue(ctx,"qbAimQBYDrift",getValue(ctx,"qbAimQBDrift",0.15)),
\t\t\t},''',
            ),
            (
                "load payload: fixed origin settings and legacy fallback",
                '''\t\tapplyClamped(ctx,"setQBAimLeadDelay","qbAimLeadDelay",qbAim.leadDelay,0,1.5,0.38)
\t\tapplyClamped(ctx,"setQBAimPeakHeight","qbAimPeakHeight",qbAim.peakHeight,8,20,14.00)

\t\tlocal testing=settings.testing or {}''',
                '''\t\tapplyClamped(ctx,"setQBAimLeadDelay","qbAimLeadDelay",qbAim.leadDelay,0,1.5,0.38)
\t\tapplyClamped(ctx,"setQBAimPeakHeight","qbAimPeakHeight",qbAim.peakHeight,8,20,14.00)
\t\tlocal legacyDrift=qbAim.qbDrift or qbAim.xyzDrift
\t\tlocal savedXZLead=qbAim.serverXZLead
\t\tif savedXZLead==nil then savedXZLead=legacyDrift end
\t\tlocal savedYLead=qbAim.serverYLead
\t\tif savedYLead==nil then savedYLead=savedXZLead end
\t\tapplyClamped(ctx,"setQBAimQBDrift","qbAimQBDrift",savedXZLead,0,0.25,0.15)
\t\tapplyClamped(ctx,"setQBAimQBYDrift","qbAimQBYDrift",savedYLead,0,0.35,0.15)

\t\tlocal testing=settings.testing or {}''',
            ),
        ],
    }


def collect_changes(repo: Path) -> tuple[dict[Path, str], list[str]]:
    plans: dict[str, list[tuple[str, str, str]]] = {
        "features/qb-aim/logic.lua": logic_replacements(),
        **simple_replacements(),
    }

    outputs: dict[Path, str] = {}
    statuses: list[str] = []

    for relative, replacements in plans.items():
        path = repo / relative
        if not path.is_file():
            raise RuntimeError(f"missing file: {relative}")

        text = path.read_text(encoding="utf-8-sig")
        changed = False

        for label, old, new in replacements:
            text, status = replace_once(text, old, new, f"{relative}: {label}")
            statuses.append(f"{relative}: {label}: {status}")
            changed = changed or status == "changed"

        if changed:
            outputs[path] = text

    return outputs, statuses


def main() -> int:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--check", action="store_true", help="validate all replacement contexts without writing")
    mode.add_argument("--apply", action="store_true", help="apply the replacements")
    parser.add_argument("--repo", type=Path, default=Path.cwd(), help="repository root")
    args = parser.parse_args()

    repo = args.repo.resolve()

    try:
        outputs, statuses = collect_changes(repo)
    except RuntimeError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1

    for status in statuses:
        print(status)

    if args.check:
        print(f"Check complete. {len(outputs)} file(s) would change.")
        return 0

    for path, text in outputs.items():
        path.write_text(text, encoding="utf-8", newline="\n")
        print(f"wrote {path.relative_to(repo)}")

    print(f"Applied fixed server-origin compensation to {len(outputs)} file(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
