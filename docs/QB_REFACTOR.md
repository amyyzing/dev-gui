# QB Runtime Refactor

## Bootstrap

`main.lua` is now the direct entry point. It fetches the five runtime files with one
`/module/batch` request, then uses concurrent `/module/get` requests only for files
missing from that response. Every source is size-checked and compiled before runtime
part 1 is executed.

The default API key is embedded for direct personal use. `GUI_BOOT_CONFIG` remains
optional and can override the key or cache settings:

```lua
getgenv().GUI_BOOT_CONFIG={
	ApiKey="mydayohmy",
	Version="release-id",
	Cache={Enabled=true,Folder="gui-runtime-cache"},
}

-- Run the contents of main.lua after setting the config.
```

Changing `Version` selects a fresh cache directory. A cached source that fails source
validation or compilation is ignored and fetched again. `Fresh=true` is available for
explicit cache bypasses; normal startup does not add unconditional cache-busting data.

`loader.lua` remains only as a temporary compatibility entry point. Runtime refreshes
now request `main.lua`, so the legacy file can be removed after a live executor smoke
test confirms direct startup and refresh behavior.

The key is present in both source and the client process. It must not be treated as a
secret or as an authorization boundary.

## Ballistic Solver

`features/qb-aim/math.lua` preserves the existing target, lead, angle, and scoring
contracts. It changes only time discovery:

- Builds the quartic intercept polynomial once.
- Uses 32 coarse probes for near-root fallback candidates.
- Partitions the derivative at the real roots of the second derivative.
- Refines all stationary points with safeguarded Newton/bisection steps.
- Refines roots on monotonic intervals, including tangent roots.
- Builds full throw candidates only for roots and four near-root seeds.

Callers may pass `stats={}` to `solve` to inspect `scalarEvaluations`,
`derivativeEvaluations`, and `candidateEvaluations`.

## Interception Detection

`features/qb-aim/interception.lua` is shared by QB Aim and Testing. For each eligible
defender it computes horizontal reachable intervals and vertical catchable intervals,
then intersects them into one or more interception windows.

The detector uses replicated tackle/catch-box dimensions when available, with the
character root as a fallback. It includes ball radius, present velocity during reaction
time, maximum run speed afterward, standing vertical reach, lower catch bounds, and a
finite jump-rise curve. Broad-phase horizontal and vertical bounds reject distant
defenders before interval refinement.

Unsafe windows are rendered as red segments of the existing beam. The shared module
also supports whole-beam warnings through the `wholeWarning` argument to
`BuildColorSequence`.

## Validation

Run:

```powershell
python -m pip install -r tests/requirements.txt
python -m unittest tests.test_qb_refactor
```

The tests compare 1,000 deterministic physical quartics with exact polynomial roots,
cover tangent roots, enforce a scalar-evaluation budget, and verify bootstrap/module
integration contracts. The edited Luau sources were also parser-checked, and the actual
ballistic/interception modules passed eight value-type-mock scenarios. A live Roblox
executor smoke test is still required for HTTP, filesystem-cache, Beam color, and UI
behavior.
