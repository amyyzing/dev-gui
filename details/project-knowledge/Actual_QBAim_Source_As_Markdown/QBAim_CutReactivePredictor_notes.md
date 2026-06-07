# QBAim_CutReactivePredictor_notes.md

# QBAim_CutReactivePredictor changes

This update addresses the issue that the previous adaptive model was still too smooth and slow to react to route changes.

## Core changes

1. Route speed is now binary by default.
   - Moving route intent maps to 21 studs/s.
   - Stop/curl/deceleration intent maps to 0 studs/s.
   - The old partial-speed middle range was removed because it created imaginary 8-17 studs/s routes that do not match the user-observed movement model.

2. The long least-squares window was shortened.
   - Previous history window: 1.25 s.
   - New history window: 0.38 s.
   - Least-squares velocity is now only a steady-route stabilizer. It is ignored when cut/deceleration strength is active.

3. Lerp smoothing is now gated.
   - Steady routes still get mild smoothing.
   - Cuts snap hard toward the newest raw velocity vector.
   - Deceleration clears old route hold instead of letting the prior route vector continue.

4. Deceleration detection was added.
   - Uses speed drop per sample.
   - Uses braking acceleration opposite the previous route direction.
   - Uses raw speed thresholds to classify stop/curl behavior.

5. Cut detection was added.
   - Uses the dot product between the newest raw velocity and prior raw velocity.
   - A large direction change collapses confidence and forces the route vector to the new direction.

6. Acceleration is no longer blindly added as extra lead.
   - Forward acceleration can add a small amount of lead.
   - Sideways/braking/cut acceleration is treated as uncertainty and lead damping.

7. The lead formula now dampens both extra lead and flight horizon during unstable movement.
   - Cut strength reduces extra lead.
   - Deceleration strength strongly reduces flight horizon.
   - Stop strength collapses predicted receiver movement.

## Practical result expected

This version should react better to:
- curls
- stops
- comeback cuts
- speed outs after a stem
- whip routes
- zig/double-move direction changes after the cut is already visible

It cannot predict a future cut before the receiver physically shows it. It should, however, recover faster once the cut starts because the old route vector is no longer held through heavy smoothing.
