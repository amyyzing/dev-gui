# QB Aim fixed server-origin compensation

## Purpose

This guide defines a stable, semi-fixed correction for the difference between the local QB/football position and the server-authoritative football `SpawnPos`.

The goal is not to make a client-only prediction perfectly match every latency spike. The goal is to keep the normal movement error small and consistent—roughly one stud or less in common movement cases—without per-throw auto calibration.

## Why a fixed model is appropriate

The native throw request sends `Target`, `Power`, and `AutoThrow`, but it does not send the football release origin. The server therefore chooses the real `SpawnPos` from its own replicated character/football state.

A changing network delay means no fixed client estimate can be exact every time. An adaptive estimator can also be destabilized by:

- packet spikes;
- animation interruptions;
- possession transitions;
- abrupt velocity changes;
- unusual server frame timing;
- bad `UpdateFootball` observations.

For this project, a fixed correction is preferable because it is deterministic, easy to test, and cannot be permanently moved by an outlier.

## Fixed model

Use two independent timing values plus one fixed vertical offset:

```text
Server XZ Lead  = horizontal server-position estimate
Jump Y Lead     = airborne vertical timing estimate
Server Y Offset = fixed standing/release-height offset
```

Recommended starting values:

```text
Server XZ Lead  = 0.06 seconds
Jump Y Lead     = 0.08 seconds
Server Y Offset = 0.00 studs
```

The predicted release origin is:

```text
baseXZ = held football XZ, falling back to QB root XZ
baseY  = validated C2 Y, falling back to football/root Y

predictedXZ = baseXZ + QB horizontal velocity * ServerXZLead

predictedY =
    baseY
    + airborne(QB vertical velocity * JumpYLead - 0.5 * playerGravity * JumpYLead^2)
    + ServerYOffset
```

The key details are:

1. C2 is used only as a Y reference.
2. C2 XZ is not combined with horizontal drift.
3. Horizontal drift uses actual assembly velocity, not keyboard-state detection.
4. XZ lead, airborne Y lead, and fixed Y offset are independently configurable.
5. Preview locks receiver intent, then the fire-frame throw rebases or re-solves from the current predicted origin.
6. No ping reading, feedback learning, or automatic calibration is used.

## Why C2 should only provide Y

The game's original C2 belongs to the local arc/preview rig. Its XZ can already be displaced by the current preview calculation. Adding QB velocity drift to the full C2 position can therefore double-count horizontal movement.

C2 Y remains useful because the release height and animation pose can be closer to the real hand/ball height than the root or football mesh. Its Y should be validated independently; its XZ distance should not decide whether its Y is usable.

## Why key-state movement detection should not control origin drift

The existing movement-aware velocity helper can zero horizontal velocity when no keyboard movement key is held. That can be wrong when:

- the QB is still physically moving after releasing a key;
- movement comes from a controller or touch input;
- another game system applies velocity;
- the character is sliding, being pushed, or transitioning between states.

The server observes replicated physical motion, not the local keyboard key list. Use `AssemblyLinearVelocity`, apply a small dead zone, and cap extreme values.

Recommended values:

```text
Horizontal dead zone = 0.75 studs/s
Horizontal speed cap = 24 studs/s
```

## Settings and persistence

Persist these semantic fields:

```text
qbAim.serverOriginLeadXZ = Server XZ Lead
qbAim.serverOriginLeadY  = Jump Y Lead
qbAim.serverOriginYOffset = Server Y Offset
```

Keep the older internal state names temporarily for compatibility:

```text
qbAimQBDrift  -> Server XZ Lead
qbAimQBYDrift -> Jump Y Lead
```

The UI labels should make their real meanings clear:

```text
Server XZ Lead
Jump Y Lead
Server Y Offset
```

When loading older settings:

```text
if serverOriginLeadXZ is absent:
    read serverXZLead, qbDrift, or xyzDrift

if serverOriginLeadY is absent:
    read serverYLead or copy the loaded XZ lead

if serverOriginYOffset is absent:
    read serverYOffset or use 0
```

This preserves existing users' tuning.

## Preview/throw consistency

The preview plan is built at keypress to keep the UI responsive and lock receiver intent. The actual remote target is corrected at the fire frame.

Correct:

```text
keypress preview = fixed server-origin prediction + WR animation-window prediction
fire-frame throw = current fixed server-origin prediction
fire-frame path  = safe rebase to locked C1, or fresh solve if rebase speed error is too high
```

Incorrect:

```text
preview origin = live C2
throw origin   = football + drift
throw target   = old keypress plan after the QB moved through the animation wait
```

The preview can still be frozen when the throw begins. The important part is that the outgoing `Target` is produced from the origin that exists at remote-fire time, not only from the origin that existed at keypress.

## Suggested testing matrix

Keep receiver speed and route consistent while testing the origin correction.

Test each case at least five times:

```text
1. Standing QB, standing WR
2. Forward-moving QB, standing WR
3. Backpedaling QB, standing WR
4. Left strafe, standing WR
5. Right strafe, standing WR
6. Forward-moving QB, moving WR
7. Backpedaling QB, moving WR
8. Rising jump
9. Falling jump
10. Diagonal movement plus jump
```

Tune in this order:

```text
1. Server XZ Lead
2. Jump Y Lead
3. Server Y Offset
4. Lead Adjust
5. Peak Height
```

Do not tune receiver lead to compensate for a release-origin error.

## Expected tuning range

A practical fixed range is:

```text
Server XZ Lead: 0.03-0.08
Jump Y Lead:    0.03-0.10
Server Y Offset: usually near 0
```

If forward and backward movement errors have opposite signs, the time estimate is wrong.

If both directions have the same world-space sideways bias, that suggests a static hand/mesh offset rather than timing. Add a small static offset only after timing is stable.

## Optional static offsets

The runtime includes these hooks at zero by default. If repeated tests show a consistent bias independent of movement direction, adjust them only after timing is stable:

```text
Server Forward Offset
Server Side Offset
```

Those should be aim-relative or character-relative constants and should remain fixed. They should never be learned automatically.

## Optional read-only diagnostics

The runtime includes a disabled-by-default diagnostic flag. When enabled in source, it records the predicted origin used for the outgoing throw and compares it with incoming `UpdateFootball` payloads that expose `SpawnPos`.

This is intentionally read-only:

```text
Predicted origin: client-side solver origin
Server SpawnPos: incoming UpdateFootball SpawnPos
Error XZ: horizontal distance between them
Error Y: vertical difference
```

It should log evidence only. It should not auto-calibrate `Server XZ Lead`, `Jump Y Lead`, or `Server Y Offset`.

## What this does not solve

This model cannot guarantee exact alignment during:

- major ping spikes;
- server frame stalls;
- abrupt movement direction changes after the plan locks;
- animation cancellation;
- possession replication races;
- server-side anti-cheat or validation changes.

That is acceptable. The purpose is stable near-alignment under ordinary conditions.

## Implementation status

The runtime implementation is applied directly in the project files. There is no separate patch helper to run; verify the live files instead.

From the repository root, inspect the diff:

```bash
git diff --check
git diff -- features/qb-aim/logic.lua runtime/loader-part-1.lua runtime/loader-part-2.lua runtime/loader-part-5.lua data-save/data-save.lua
```

The old strict helper was removed after the runtime files were updated directly, because exact source replacements became stale once the implementation used semantic server-origin names.

Then run the normal loader/module validation and test with:

```text
Lead Adjust   = current preferred value
Peak Height   = 14
Server XZ Lead  = 0.06
Jump Y Lead     = 0.08
Server Y Offset = 0
```
