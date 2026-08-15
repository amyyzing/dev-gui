import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def source(path):
    return (ROOT / path).read_text(encoding="utf-8")


class MobileShellContracts(unittest.TestCase):
    def test_mobile_profile_uses_phone_sized_bounds_and_touch_targets(self):
        mobile = source("gui/mobile.luau")
        self.assertIn("MinW=320", mobile)
        self.assertIn("MinH=300", mobile)
        self.assertIn("PageBarHeight=42", mobile)
        self.assertIn("PageTabHeight=40", mobile)
        self.assertIn("TopButtonSize=36", mobile)

    def test_mobile_shell_tracks_touch_for_drag_and_resize(self):
        shell = source("platforms/mobile/gui/mainframe.lua")
        self.assertIn("inputType~=Enum.UserInputType.Touch", shell)
        self.assertIn("changed==activeResizeInput", shell)
        self.assertIn("i.UserInputType==Enum.UserInputType.Touch", shell)
        self.assertIn("i==activeDragInput", shell)
        self.assertIn('Name="ResizeHandle"', shell)
        self.assertIn("Size=UDim2.fromOffset(32,32)", shell)

    def test_mobile_resize_preserves_the_window_aspect_ratio(self):
        shell = source("platforms/mobile/gui/mainframe.lua")
        self.assertIn("local function proportionalResizeScale(dx,dy)", shell)
        self.assertIn("local resizeScale=proportionalResizeScale(dx,dy)", shell)
        self.assertIn("windowState.W=math.floor((startW*resizeScale)+0.5)", shell)
        self.assertIn("windowState.H=math.floor((startH*resizeScale)+0.5)", shell)
        self.assertNotIn(
            "windowState.W=math.clamp(startW-dx",
            shell,
        )

    def test_mobile_shell_fits_viewport_without_downscaling_controls(self):
        shell = source("platforms/mobile/gui/mainframe.lua")
        self.assertIn("uiScale.Scale=1", shell)
        self.assertIn("local availableW=math.max(280,vp.X-16)", shell)
        self.assertIn("local availableH=math.max(260,vp.Y-16)", shell)
        self.assertIn('make("ScrollingFrame"', shell)
        self.assertIn("CanvasPosition=Vector2.new(math.clamp(targetX,0,maxX),0)", shell)


class MobileFeatureContracts(unittest.TestCase):
    def test_qb_has_touch_actions_without_changing_throw_path(self):
        qb = source("features/qb-aim/logic.lua")
        self.assertIn("local function lockReceiverAtViewportCenter()", qb)
        self.assertIn("local function requestThrow(noAnimation)", qb)
        self.assertIn('Text="LOCK TARGET"', qb)
        self.assertIn('Text="THROW"', qb)
        self.assertIn("return requestThrow(false)", qb)

    def test_qb_controller_throw_consumes_the_native_game_action(self):
        qb = source("features/qb-aim/logic.lua")
        self.assertIn("contextActionService:BindActionAtPriority", qb)
        self.assertIn("return Enum.ContextActionResult.Sink", qb)
        self.assertIn("if isControllerQBAimInput(input) then return end", qb)
        self.assertIn("local function suppressNativeControllerInput(binding)", qb)
        self.assertIn("setting.Controller=blockedValue", qb)
        self.assertIn("runService.Heartbeat:Wait()", qb)
        self.assertIn("throwKeys[binding]=throwKeyState", qb)
        self.assertIn("task.defer(requestThrow,false)", qb)

    def test_qb_toggle_supports_controller_bindings(self):
        qb = source("features/qb-aim/logic.lua")
        self.assertIn('controllerToggleActionName="QBAim_ControllerToggle"', qb)
        self.assertIn('configuredBinding("getQBAimToggleKey",Enum.KeyCode.P)', qb)
        self.assertIn("setEnabled(not enabled)", qb)

    def test_mobile_preset_editor_can_apply_without_a_keybind(self):
        editor = source("features/preset-editor/logic.lua")
        runtime = source("runtime/loader-part-4.lua")
        self.assertIn("local isMobile=app.isMobile==true", editor)
        self.assertIn('keyBtn.Text="apply"', editor)
        self.assertIn("app.applyHitboxPreset(i)", editor)
        page_context = runtime[runtime.index("function makePage2Ctx()") :]
        self.assertIn('isMobile=runtimePlatform=="mobile"', page_context)

    def test_mobile_keybind_rows_have_aligned_touch_targets(self):
        keybinds = source("features/keybinds/logic.lua")
        self.assertIn('Name="BindTouchTarget"', keybinds)
        self.assertIn("isMobile and index>#rows-2", keybinds)
        self.assertIn('Name="KeybindBottomTouchPadding"', keybinds)
        self.assertIn("connect(touchTarget.Activated", keybinds)
        self.assertIn("api.CancelCapture()", keybinds)

    def test_color_draggers_accept_and_track_touch(self):
        colors = source("features/colors/logic.lua")
        self.assertIn("input==dragInput", colors)
        self.assertIn("input==colorDragInput", colors)
        self.assertIn("input==highlightColorDragInput", colors)
        self.assertGreaterEqual(
            colors.count("or input.UserInputType==Enum.UserInputType.Touch"),
            5,
        )

    def test_confirmation_dialogs_are_width_constrained(self):
        combined = "\n".join(
            source(path)
            for path in (
                "runtime/loader-part-4.lua",
                "features/data/logic.lua",
                "features/hitbox-presets/logic.lua",
            )
        )
        self.assertGreaterEqual(combined.count('make("UISizeConstraint"'), 5)
        self.assertNotIn("Size=UDim2.fromOffset(390,170)", combined)


if __name__ == "__main__":
    unittest.main()
