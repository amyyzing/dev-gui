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

    for field in ("autoSTHold", "jpvHold", "stickyHeadHold"):
        assert f"{field}=" in data_save

    assert 'keybinds.jpvToggle' in data_save

    for key in ("autoSTKey", "jpvKey", "stickyHeadKey"):
        assert f"{key}=true" in persistent


def test_auto_st_keeps_the_supplied_intercept_and_side_alignment():
    source = read("features/auto-st/logic.lua")
    assert "Vector3.new(0,-28,0)" in source
    assert "for time=0.03,1.2,0.04 do" in source
    assert "Vector3.new(unit.Z,0,-unit.X)" in source
    assert "rootPart.CFrame:Lerp(targetCFrame,alignSpeed)" in source
    assert "state.autoSTEnabled=false" in source
    assert "Enum.KeyCode.ButtonL2" in source


def test_jpv_and_sticky_head_keep_the_supplied_defaults_and_lifecycle():
    jpv = read("features/jpv/logic.lua")
    sticky = read("features/sticky-head/logic.lua")

    assert "pullDuration=0.50" in jpv
    assert "state.jpvPullValue=clamp(state.jpvPullValue,0.01,2,1)" in jpv
    assert "state.jpvMaxDistance=clamp(state.jpvMaxDistance,1,50,10)" in jpv
    assert "state.jpvMaxDistance*10" in jpv
    assert "ball.Position+Vector3.new(0,2.5,0)" in jpv
    assert "state.jpvEnabled=false" in jpv
    assert "characterConnection=localPlayer.CharacterAdded:Connect(bindCharacter)" in jpv
    assert "if enabled and holding then" in jpv
    assert "inputService.InputEnded:Connect" in jpv
    assert "not enabled or not holding or not pullActive" in jpv

    assert "state.stickyHeadRange=clamp(state.stickyHeadRange,1,50,10)" in sticky
    assert "state.stickyHeadSmoothness=clamp(state.stickyHeadSmoothness,1,100,12)" in sticky
    assert "state.stickyHeadStrength=clamp(state.stickyHeadStrength,1,100,12)" in sticky
    assert "state.stickyHeadEnabled=false" in sticky
    assert "Enum.KeyCode.ButtonL1" in sticky
    assert "head.Position+Vector3.new(0,2.5,0)" in sticky


def test_dev_update_reuses_only_the_dev_loader_configuration():
    runtime = read("runtime/loader-part-1.lua")
    loader = read("loader.lua")
    assert 'LoaderConfigGlobalName or "GUI_BOOT_CONFIG"' in runtime
    assert "rawget(env,loaderConfigGlobalName)" in runtime
    assert "env[loaderConfigGlobalName]=bootConfig" in runtime
    assert 'rawget(sharedEnv,"DEV_GUI_RUNTIME_CLEANUP")' in loader
    assert 'rawget(sharedEnv,"GUI_RUNTIME_CLEANUP")' not in loader
