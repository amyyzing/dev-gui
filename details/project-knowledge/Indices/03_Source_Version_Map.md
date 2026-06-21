# Source version map

| File | Bytes | SHA-256 prefix | Notes |
|---|---:|---|---|
| `features/qb-aim/logic.lua` | 79003 | `3de2728aaec8fbb4` | Current live repo source with semantic fixed server-origin constants, separate Server XZ/Y lead, stricter C2-Y validation, zero static offset hooks, and optional read-only origin diagnostics. |
| `data-save/data-save.lua` | 38996 | `f370b1a8854c4673` | Runtime persistence source; saves semantic Server XZ/Y lead fields and restores with legacy drift fallback. |
| `Patches/QBAim_Fixed_Server_Origin_Compensation.md` | 7565 | `d11500d3dcfe76cd` | Reviewed implementation guide for fixed server-origin compensation; helper removed after direct runtime implementation. |
| `Indices/01_Constants_Index.md` | 4661 | `409a8f0824219c0d` | Current constants summary for fixed server-origin compensation. |
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
