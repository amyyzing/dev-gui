# Source version map

| File | Bytes | SHA-256 prefix | Notes |
|---|---:|---|---|
| `features/qb-aim/logic.lua` | 84180 | `3f5e34d3ca0ba22c` | Current live repo source with fire-frame rebase/fresh solve, smaller server-origin lead defaults, Jump Y Lead, Server Y Offset, scaled receiver route speed, and optional read-only origin diagnostics. |
| `data-save/data-save.lua` | 39017 | `76667f16f374a166` | Runtime persistence source; saves canonical Server XZ Lead, Jump Y Lead, and Server Y Offset fields while restoring legacy drift aliases. |
| `runtime/loader-part-1.lua` | 69476 | `b53f6346a4c4847e` | Runtime bootstrap defaults with smaller QB server-origin lead, Server Y Offset state, and non-blocking optional service loading. |
| `runtime/loader-part-2.lua` | 14632 | `3aa8ae08b4a8a694` | Page 1 default state with smaller QB server-origin lead and Server Y Offset state. |
| `runtime/loader-part-5.lua` | 13587 | `80c5b05bf8c27989` | Data-save bridge including Server Y Offset setter. |
| `Patches/QBAim_Fixed_Server_Origin_Compensation.md` | 8530 | `c37670c1c14d0b29` | Reviewed implementation guide for fixed server-origin compensation, updated for fire-frame rebase and canonical Y offset settings. |
| `Indices/01_Constants_Index.md` | 5021 | `c5cc736250e64c8f` | Current constants summary for fixed server-origin compensation. |
| `Runtime_Flow/04_Local_Arc_Rig_Center_C1_C2_C3.md` | 2100 | `bbbbc13d9e3c2569` | Current C2/C1/C3 runtime-flow note for C2-Y-only release reference. |
| `FootballMath.md` | 22430 | `1536b0751ae8321b` | Decompiled game-source markdown; confirms gravity, power coefficient, pass velocity, and beam math. |
| `Mechanics.md` | 5049 | `94609a84d5a01bd6` | Decompiled game-source markdown; confirms mechanics state, ball power defaults, and module load shape. |
| `MECH_ControlsQuarterback.md` | 27693 | `0d70c717ca36af8c` | Decompiled game-source markdown; confirms FootballThrow animation wait and ThrowBall payload. |
| `MECH_ControlsCatchHikeThrow.md` | 10028 | `e3f356e3a30cbc9d` | Decompiled game-source markdown; catch/hike/throw entry flow. |
| `MECH_Animations.md` | 16822 | `c7c01b9420cc458e` | Decompiled game-source markdown; confirms PlayAnimation loader/signature. |
| `MECH_ControlsFootball.md` | 925 | `8ee6250f498462ba` | Decompiled game-source markdown; confirms football gravity and timescale setters. |
| `MECH_ControlsBallControl.md` | 1225 | `2b355e8209752dfb` | Decompiled game-source markdown; ball-control reference. |
| `MECH_ControlsDrive.md` | 16459 | `cda8d2a05d44e5df` | Decompiled game-source markdown; drive controls reference. |
| `MECH_ControlsJump.md` | 7993 | `77f74777838067f3` | Decompiled game-source markdown; jump/dive movement reference. |
| `MECH_Gyro.md` | 3310 | `74abc9def65c3e8a` | Decompiled game-source markdown; orientation/gyro reference. |
| `MECH_WalkSpeed.md` | 2390 | `c7331e3978ac86c6` | Decompiled game-source markdown; walk speed reference. |
| `GLOB_MechanicActions.md` | 16342 | `ee5f3c97f102760c` | Decompiled game-source markdown; dive/knockback action reference. |
| `QBAim_TangentDominance_SignedRangeRate(2).lua` | 62056 | `6e1fb3fc3d7a559e` | Historical QBAim source converted to markdown in `Actual_QBAim_Source_As_Markdown/`. |
| `QBAim_AdaptiveVectorPredictor.lua` | 69739 | `d29945c5dc0d1ef4` | Historical QBAim source converted to markdown in `Actual_QBAim_Source_As_Markdown/`. |
| `QBAim_CutReactivePredictor.lua` | 78823 | `e78af990e7722bdd` | Historical QBAim source converted to markdown in `Actual_QBAim_Source_As_Markdown/`. |
| `QBAim_CutReactivePeakC1.lua` | 79079 | `81266239ac6dd272` | Historical QBAim source converted to markdown in `Actual_QBAim_Source_As_Markdown/`. |
