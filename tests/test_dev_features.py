from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def read(path: str) -> str:
    return (ROOT / path).read_text(encoding="utf-8")


def test_dev_features_are_registered_on_the_right_side():
    manifest = read("build/bundle-manifest.json")
    runtime = read("runtime/loader-part-1.lua")
    for name in ("auto-st", "jpv", "sticky-head"):
        assert f'"features/{name}/gui.lua"' in manifest
        assert f'"features/{name}/logic.lua"' in manifest
        assert f'features/{name}/gui.lua' in runtime
        assert f'features/{name}/logic.lua' in runtime

    for path in ("gui/pc.luau", "gui/mobile.luau", "runtime/loader-part-2.lua"):
        source = read(path)
        assert '{api="AutoST",name="AutoST",column="right",order=6,title="Auto ST"}' in source
        assert '{api="JPV",name="JPV",column="right",order=7,title="Jump Pull Vector"}' in source
        assert '{api="StickyHead",name="StickyHead",column="right",order=8,title="Sticky Head"}' in source


def test_dev_feature_categories_have_no_descriptions():
    expected = (
        ("features/auto-st/logic.lua", 'makeSection(parent,6,"Auto ST","",{'),
        ("features/jpv/logic.lua", 'makeSection(parent,7,"Jump Pull Vector","",{'),
        ("features/sticky-head/logic.lua", 'makeSection(parent,8,"Sticky Head","",{'),
    )
    for path, section in expected:
        assert section in read(path)


def test_feature_toggles_are_session_only_but_values_and_keys_are_saved():
    data_save = read("data-save/data-save.lua")
    defaults = read("runtime/loader-part-2.lua")
    persistent = read("runtime/loader-part-5.lua")

    for state_name in ("autoSTEnabled", "jpvEnabled", "stickyHeadEnabled"):
        assert f"{state_name}=false" in defaults
        assert f'getValue(app,"{state_name}"' not in data_save

    for state_name in (
        "jpvPullValue", "jpvMaxDistance", "stickyHeadRange",
        "stickyHeadSmoothness", "stickyHeadStrength",
    ):
        assert f'getValue(app,"{state_name}"' in data_save

    for field in ("autoSTToggle", "jpvToggle", "stickyHeadToggle"):
        assert f"{field}=" in data_save

    for legacy_field in ("keybinds.autoSTHold", "keybinds.jpvHold", "keybinds.stickyHeadHold"):
        assert legacy_field not in data_save

    for key in ("autoSTKey", "jpvKey", "stickyHeadKey"):
        assert f"{key}=true" in persistent


def test_dev_feature_keybinds_have_no_hidden_fallbacks():
    runtime = read("runtime/loader-part-1.lua")
    reset = read("runtime/loader-part-4.lua")
    keybinds = read("features/keybinds/logic.lua")
    data_save = read("data-save/data-save.lua")

    assert "autoSTKey=Enum.KeyCode.Unknown" in runtime
    assert "autoSTKey=Enum.KeyCode.Unknown" in reset
    assert 'ensure("autoSTKey")' in keybinds
    assert 'getValue(app,"autoSTKey",Enum.KeyCode.Unknown)' in data_save
    for source in (runtime, reset, keybinds, data_save):
        assert "autoSTKey=Enum.KeyCode.V" not in source


def test_auto_st_uses_fixed_right_anchor_and_bounded_shortest_yaw():
    source = read("features/auto-st/logic.lua")
    assert "relativeVelocity:Dot(relativeVelocity)" in source
    assert "-relativePosition:Dot(relativeVelocity)/speedSquared" in source
    assert "rightAnchor=center+desiredRight*rightAnchorOffset" in source
    assert "targetYaw=yawFromRight(anchorDirection.Unit)" in source
    assert "nextBallScanAt=now+ballScanInterval" in source
    assert 'for _,rootName in ipairs({"Games","MiniGames"})' in source
    assert "refreshKnownFootballCandidates()" in source
    assert "shortestAngle(currentYaw,targetYaw)" in source
    assert "math.clamp(yawError,-turnRate*dt,turnRate*dt)" in source
    assert "humanoid.AutoRotate=false" in source
    assert 'scheduler.Register("RenderStepped",schedulerJobId,alignmentInterval' in source
    assert source.count("workspace:GetDescendants()") == 1
    assert "state.autoSTEnabled=false" in source
    assert "Enum.KeyCode.ButtonL2" not in source


def test_jpv_and_sticky_head_keep_the_supplied_defaults_and_lifecycle():
    auto_st = read("features/auto-st/logic.lua")
    jpv = read("features/jpv/logic.lua")
    sticky = read("features/sticky-head/logic.lua")

    for source in (auto_st, jpv, sticky):
        assert "setEnabled(not enabled)" in source
        assert "inputService.InputEnded:Connect" not in source

    assert "pullDuration=0.50" in jpv
    assert "state.jpvPullValue=clamp(state.jpvPullValue,0.01,2,1)" in jpv
    assert "state.jpvMaxDistance=clamp(state.jpvMaxDistance,1,50,10)" in jpv
    assert "state.jpvMaxDistance*10" in jpv
    assert "ball.Position+Vector3.new(0,2.5,0)" in jpv
    assert "state.jpvEnabled=false" in jpv
    assert "characterConnection=localPlayer.CharacterAdded:Connect(bindCharacter)" in jpv
    assert "if enabled then" in jpv

    assert "state.stickyHeadRange=clamp(state.stickyHeadRange,1,50,10)" in sticky
    assert "state.stickyHeadSmoothness=clamp(state.stickyHeadSmoothness,1,100,12)" in sticky
    assert "state.stickyHeadStrength=clamp(state.stickyHeadStrength,1,100,12)" in sticky
    assert "state.stickyHeadEnabled=false" in sticky
    assert "Enum.KeyCode.ButtonL1" not in sticky
    assert "head.Position+Vector3.new(0,2.5,0)" in sticky


def test_dev_update_reuses_only_the_dev_loader_configuration():
    runtime = read("runtime/loader-part-1.lua")
    loader = read("loader.lua")
    assert 'LoaderConfigGlobalName or "GUI_BOOT_CONFIG"' in runtime
    assert "rawget(env,loaderConfigGlobalName)" in runtime
    assert "env[loaderConfigGlobalName]=bootConfig" in runtime
    assert 'rawget(sharedEnv,"DEV_GUI_RUNTIME_CLEANUP")' in loader
    assert 'rawget(sharedEnv,"GUI_RUNTIME_CLEANUP")' not in loader
