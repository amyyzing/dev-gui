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

Use two independent timing values:

```text
Server XZ Lead = horizontal server-position estimate
Server Y Lead  = vertical server-position estimate
```

Recommended starting values:

```text
Server XZ Lead = 0.15 seconds
Server Y Lead  = 0.15 seconds
```

The predicted release origin is:

```text
baseXZ = held football XZ, falling back to QB root XZ
baseY  = validated C2 Y, falling back to football/root Y

predictedXZ = baseXZ + QB horizontal velocity * ServerXZLead

predictedY =
    baseY
    + QB vertical velocity * ServerYLead
    - 0.5 * playerGravity * ServerYLead^2
```

The key details are:

1. C2 is used only as a Y reference.
2. C2 XZ is not combined with horizontal drift.
3. Horizontal drift uses actual assembly velocity, not keyboard-state detection.
4. XZ and Y lead values are independently configurable.
5. The same predicted origin is used by both preview and throw solving.
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

Persist these two fields:

```text
qbAimQBDrift  = Server XZ Lead
qbAimQBYDrift = Server Y Lead
```

Keep the old names temporarily for compatibility. The UI labels should make their real meanings clear:

```text
Server XZ Lead
Server Y Lead
```

When loading older settings:

```text
if Server Y Lead is absent:
    copy the saved old QB drift value
```

This preserves existing users' tuning.

## Preview/throw consistency

Both preview and locked throw plans must call the same origin function with the same fixed XZ and Y lead settings.

Correct:

```text
preview origin = fixed server-origin prediction
throw origin   = fixed server-origin prediction
```

Incorrect:

```text
preview origin = live C2
throw origin   = football + drift
```

The preview can still be frozen when the throw begins. The important part is that the frozen plan and outgoing `Target` were produced from the same predicted origin.

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
2. Server Y Lead
3. Lead Adjust
4. Peak Height
```

Do not tune receiver lead to compensate for a release-origin error.

## Expected tuning range

A practical fixed range is:

```text
Server XZ Lead: 0.12–0.18
Server Y Lead:  0.10–0.18
```

If forward and backward movement errors have opposite signs, the time estimate is wrong.

If both directions have the same world-space sideways bias, that suggests a static hand/mesh offset rather than timing. Add a small static offset only after timing is stable.

## Optional static offsets

Do not add these by default. If repeated tests show a consistent bias independent of movement direction, add:

```text
Server Forward Offset
Server Side Offset
```

Those should be aim-relative or character-relative constants and should remain fixed. They should never be learned automatically.

## What this does not solve

This model cannot guarantee exact alignment during:

- major ping spikes;
- server frame stalls;
- abrupt movement direction changes after the plan locks;
- animation cancellation;
- possession replication races;
- server-side anti-cheat or validation changes.

That is acceptable. The purpose is stable near-alignment under ordinary conditions.

## Applying the implementation

A strict source-editing helper is included at:

```text
details/project-knowledge/Patches/apply_qb_aim_fixed_server_origin.py
```

From the repository root, validate the expected source contexts:

```bash
python details/project-knowledge/Patches/apply_qb_aim_fixed_server_origin.py --check
```

Apply the implementation:

```bash
python details/project-knowledge/Patches/apply_qb_aim_fixed_server_origin.py --apply
```

Then inspect the diff:

```bash
git diff --check
git diff -- features/qb-aim/logic.lua runtime/loader-part-1.lua runtime/loader-part-2.lua runtime/loader-part-5.lua data-save/data-save.lua
```

The helper stops instead of guessing if the current source no longer matches the reviewed revision.

Then run the normal loader/module validation and test with:

```text
Lead Adjust   = current preferred value
Peak Height   = 14
Server XZ Lead = 0.15
Server Y Lead  = 0.15
```
