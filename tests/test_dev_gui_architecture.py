from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def read(relative_path: str) -> str:
    return (ROOT / relative_path).read_text(encoding="utf-8")


def test_loader_is_bound_to_dev_gui_source_and_dump_bootstrap():
    loader = read("loader.lua")
    assert 'MODULE_SOURCE="dev-gui"' in loader
    assert 'BOOTSTRAP_PATH="dump/runtime/bootstrap.lua"' in loader
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
    syntax = read("dump/syntax/init.lua")
    for name in (
        "Page", "Category", "Section", "Label", "Button", "Toggle", "Slider",
        "Input", "Dropdown", "Keybind", "Row", "Column", "Spacer", "Divider",
    ):
        assert name in syntax
    assert "UI.Special.ColorEditor" in syntax
    assert "UI.Special.Vector3Editor" in syntax


def test_dropdown_handle_is_declared_before_its_click_callback_closes_over_it():
    adapter = read("dump/adapters/ui-library.lua")
    dropdown = adapter.split("function api.createDropdown", 1)[1].split(
        "function api.createKeybind", 1
    )[0]
    assert "local button\n\t\tbutton=api.createButton" in dropdown
    assert "button.instance.Text=dropdownLabel(items[index])" in dropdown
    assert "button.set(dropdownLabel(items[index]))" not in dropdown


def test_discord_controller_has_no_ui_constructor_dependencies():
    controller = read("features/discord/controller.lua")
    for forbidden in ("makeSection", "wrapTextButton", 'make("', "app.UI", "colors"):
        assert forbidden not in controller

    view = read("features/discord/view.lua")
    assert "UI.createSection" in view
    assert "UI.createButton" in view
    assert "UI.createStatus" in view


def test_discord_refresh_clears_a_stale_invite_before_publishing():
    controller = read("features/discord/controller.lua")
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
        "dump/runtime/connections.lua",
        "dump/runtime/lifecycle.lua",
        "dump/runtime/input.lua",
        "dump/syntax/init.lua",
        "dump/ui/create.lua",
        "dump/adapters/ui-library.lua",
        "dump/services/api.lua",
        "dump/services/module-loader.lua",
        "dump/services/persistence.lua",
        "features/discord/controller.lua",
        "features/discord/view.lua",
    ):
        assert module_path in runtime


def test_documented_one_line_loader_uses_railway_not_private_github_raw():
    readme = read("README.md")
    assert 'game:HttpGet("https://lint-bot-production.up.railway.app/loader/dev-gui")' in readme
    assert "raw.githubusercontent.com" not in readme
