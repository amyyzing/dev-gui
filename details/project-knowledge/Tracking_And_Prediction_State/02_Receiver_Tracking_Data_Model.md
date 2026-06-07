# Receiver tracking data model

Each non-local player gets an entry in `receiverData`.

## Base fields from original version

```lua
receiverData[player] = {
    pos = receiverRoot.Position,
    vel = receiverRoot.AssemblyLinearVelocity or Vector3.zero,
    t = now,
    vh = {},
    ph = {{ t = now, pos = receiverRoot.Position }},
    sdir = nil,
    sspeed = 0,
    stime = 0,
    src = "seeded",
}
```

## Added fields in cut-reactive versions

The cut-reactive versions also track short-horizon route state, including:

```lua
lsVel
predVel
rawVel
rawSpeed
lastRawVel
lastRawSpeed
accel
cutStrength
decelStrength
stopStrength
confidence
lastMoveAt
```

Exact field names may vary by version, but the concept is the same: raw current velocity is kept separate from smoothed/predicted velocity, and cut/deceleration strength dampens stale route prediction.

## Update cadence

Receiver tracking is throttled by:

```lua
RECEIVER_TRACK_INTERVAL = 0.05
```

So route state updates roughly every 50 ms.

## Position history

Position history is stored in `ph`. Original version kept around `1.25s`; cut-reactive version shortens useful least-squares history to about `0.38s` to reduce stale cuts.
