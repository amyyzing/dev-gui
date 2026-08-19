from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def read(relative_path: str) -> str:
    return (ROOT / relative_path).read_text(encoding="utf-8")


def test_dump_file_names_stay_short_and_flat():
    assert {path.name for path in (ROOT / "dump").glob("*.lua")} == {
        "api.lua", "conn.lua", "create.lua", "init.lua", "input.lua", "lib.lua",
        "life.lua", "load.lua", "save.lua", "start.lua", "ui.lua",
    }
    assert not any(path.is_file() for path in (ROOT / "dump").glob("*/*.lua"))


def test_loader_is_bound_to_dev_gui_source_and_dump_bootstrap():
    loader = read("loader.lua")
    assert 'MODULE_SOURCE="dev-gui"' in loader
    assert 'BOOTSTRAP_PATH="dump/start.lua"' in loader
    assert 'DEFAULT_API_KEY="dev-gui"' in loader
    assert "DEV_GUI_BOOT_CONFIG" in loader
    assert "GUI_BOOT_CONFIG" not in loader.replace("DEV_GUI_BOOT_CONFIG", "")


def test_runtime_identity_does_not_reuse_main_gui_names():
    runtime = read("runtime/loader-part-1.lua")
    assert 'return "dev-gui"' in runtime
    assert 'screenGuiName or "DevGuiUI"' in runtime
    assert '"devGuiRefreshModules"' in runtime
    assert "_G.refreshModules" not in runtime
    assert 'screenGuiName="HitboxUI"' not in runtime
    assert '"HitboxUI_DarkInfluenced_GUIOnly"' not in runtime


def test_dump_init_is_the_single_composition_boundary():
    dump_init = read("dump/init.lua")
    assert 'AppId="dev-gui"' in dump_init
    assert "UI=required.Syntax.new" in dump_init
    assert "Runtime={" in dump_init
    assert "Services={" in dump_init


def test_public_syntax_stays_small_and_options_based():
    syntax = read("dump/ui.lua")
    for name in (
        "Page", "Category", "Section", "Label", "Button", "Toggle", "Slider",
        "Input", "Dropdown", "Keybind", "Row", "Column", "Spacer", "Divider",
    ):
        assert name in syntax
    assert "UI.Special.ColorEditor" in syntax
    assert "UI.Special.Vector3Editor" in syntax


def test_dropdown_handle_is_declared_before_its_click_callback_closes_over_it():
    adapter = read("dump/lib.lua")
    dropdown = adapter.split("function api.createDropdown", 1)[1].split(
        "function api.createKeybind", 1
    )[0]
    assert "local button\n\t\tbutton=api.createButton" in dropdown
    assert "button.instance.Text=dropdownLabel(items[index])" in dropdown
    assert "button.set(dropdownLabel(items[index]))" not in dropdown


def test_discord_controller_has_no_ui_constructor_dependencies():
    controller = read("features/discord/core.lua")
    for forbidden in ("makeSection", "wrapTextButton", 'make("', "app.UI", "colors"):
        assert forbidden not in controller

    view = read("features/discord/view.lua")
    assert "UI.createSection" in view
    assert "UI.createButton" in view
    assert "UI.createStatus" in view


def test_discord_refresh_clears_a_stale_invite_before_publishing():
    controller = read("features/discord/core.lua")
    assert controller.count("snapshot.inviteLink=nil") >= 2
    assert "snapshot.inviteLink=inviteLink" in controller


def test_process_global_context_actions_are_dev_gui_namespaced():
    qb_aim = read("features/qb-aim/logic.lua")
    assert '"DevGui_QBAim_ControllerThrow"' in qb_aim
    assert '"DevGui_QBAim_ControllerToggle"' in qb_aim
    assert '"QBAim_ControllerThrow"' not in qb_aim
    assert '"QBAim_ControllerToggle"' not in qb_aim

    for platform in ("pc", "mobile"):
        mainframe = read(f"platforms/{platform}/gui/mainframe.lua")
        assert '"DevGui_MouseInputSink"' in mainframe
        assert '"HitboxUI_MouseInputSink"' not in mainframe


def test_new_modules_are_registered_for_remote_loading():
    runtime = read("runtime/loader-part-1.lua")
    for module_path in (
        "dump/init.lua",
        "dump/conn.lua",
        "dump/life.lua",
        "dump/input.lua",
        "dump/ui.lua",
        "dump/create.lua",
        "dump/lib.lua",
        "dump/api.lua",
        "dump/load.lua",
        "dump/save.lua",
        "features/discord/core.lua",
        "features/discord/view.lua",
    ):
        assert module_path in runtime


def test_documented_one_line_loader_uses_railway_not_private_github_raw():
    readme = read("README.md")
    assert 'game:HttpGet("https://lint-bot-production.up.railway.app/loader/dev-gui")' in readme
    assert "raw.githubusercontent.com" not in readme


def test_reworked_theme_list_is_complete_and_raycast_is_default():
    runtime = read("runtime/loader-part-1.lua")
    colors = read("features/colors/logic.lua")
    data_save = read("data-save/data-save.lua")

    expected = {
        "raycast": "Raycast",
        "everforest": "Everforest",
        "proof": "Proof",
        "linear": "Linear",
        "material": "Material",
        "absolutely": "Absolutely",
    }
    for theme_id, label in expected.items():
        assert (
            f'{theme_id}=makeTheme("{theme_id}","{label}"' in runtime
            or f'{theme_id}=proofTheme' in runtime
        )

    assert '{"raycast","everforest","proof","linear","material","absolutely"}' in colors
    assert 'everforest=makeTheme("everforest","Everforest",{253,246,227},{141,161,1},{53,167,124},squareShape,softTones)' in runtime
    assert 'local proofTheme=makeTheme("proof","Proof",{245,243,237},{61,117,93},{95,106,194},squareShape,nil)' in runtime
    assert 'topbar=Color3.fromRGB(239,237,230)' in runtime
    assert 'text=Color3.fromRGB(47,49,45)' in runtime
    assert 'muted=Color3.fromRGB(75,77,72)' in runtime
    assert 'if id=="catppuccin" then id="everforest" end' in data_save
    assert 'if id=="dracula" then id="proof" end' in data_save
    assert "themes=devThemes" in read("runtime/loader-part-3.lua")

    for path in ("gui/pc.luau", "gui/mobile.luau"):
        assert 'uiMap.LibraryProfileId="raycast"' in read(path)

    assert 'UILib="raycast"' in colors
    assert 'UILib="raycast"' in data_save
    assert 'return validThemes[id] and id or "raycast"' in data_save
    for old_label in ("Dark", "Light", "Midnight", "Crimson", "Evergreen", "Sakura"):
        assert f'Name="{old_label}"' not in colors


def test_square_header_avatar_spans_title_block_and_shifts_text_on_both_platforms():
    runtime = read("runtime/loader-part-1.lua")
    assert "WindowRadius=0,SectionRadius=0,ControlRadius=0,SliderRadius=0" in runtime
    assert 'if role=="Avatar" then' not in runtime

    for platform in ("pc", "mobile"):
        mainframe = read(f"platforms/{platform}/gui/mainframe.lua")
        module_scope, constructor = mainframe.split("function mainFrame.new(app)", 1)
        assert "local function avatarSize" in module_scope
        assert "local function titleX" in module_scope
        assert "local function titleSize" in module_scope
        assert "local function headerAvatarSize" not in constructor
        assert "local playerAvatar" not in constructor
        assert "api.avatar=make" in constructor
        assert 'Name="PlayerAvatar"' in mainframe
        assert '"rbxthumb://type=AvatarHeadShot&id="' in mainframe
        assert "(subtitleY+14)-titleY" in mainframe
        assert "titleXValue+avatarSize(titleY,subtitleY)+10" in mainframe
        assert 'CornerRole="Control"' in mainframe
        assert 'CornerRadius=UDim.new(0,999)' not in mainframe
        assert 'local getUIStrokeGradientColor=app.getUIStrokeGradientColor or getUIStrokeColor' in mainframe
        assert 'local avatarStroke=make("UIStroke",{Color=getUIStrokeGradientColor(),Thickness=1,Transparency=0.35,StrokeRole="Fixed"},api.avatar)' in mainframe
        assert 'avatarStroke.Color=getUIStrokeGradientColor()' in mainframe
        assert "UDim2.fromOffset(titleX(headerTitleX,headerTitleY,headerSubtitleY),headerTitleY)" in mainframe
        assert "UDim2.fromOffset(titleX(headerTitleX,headerTitleY,headerSubtitleY),headerSubtitleY)" in mainframe


def test_auto_boost_is_in_the_left_column():
    module_line = '{api="Boost",name="Boost",column="left",order=2,title="Boost"}'
    for path in ("gui/pc.luau", "gui/mobile.luau", "runtime/loader-part-2.lua"):
        assert module_line in read(path)


def test_square_controls_and_colour_picker_are_clipped():
    runtime = read("runtime/loader-part-1.lua")
    colors = read("features/colors/logic.lua")

    assert 'if class=="UICorner" and parent and parent:IsA("GuiObject") then' in runtime
    assert "parent.ClipsDescendants=true" in runtime
    assert 'local activeMode="Square"' in colors
    assert '{"Square","RGB","HSV","Hex"}' in colors
    assert colors.count("Size=UDim2.fromOffset(104,104)") == 2
    assert colors.count('addCorner(svSquare,"Section")') == 1
    assert colors.count('addCorner(highlightSvBase,"Section")') == 1
    assert colors.count("Size=UDim2.new(1,-4,0,3)") == 2
    assert "hueCursor.Position=UDim2.new(0,2,pickerHue,-1)" in colors
    assert "highlightHueCursor.Position=UDim2.new(0,2,highlightPickerHue,-1)" in colors
