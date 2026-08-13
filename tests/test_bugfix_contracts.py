import re
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def source(path):
    return (ROOT / path).read_text(encoding="utf-8")


class BootstrapContracts(unittest.TestCase):
    def test_fresh_boot_bypasses_disk_cache(self):
        bootstrap = source("main.lua")
        self.assertIn(
            "local source=not fresh and readCachedSource(path) or nil",
            bootstrap,
        )

    def test_all_optional_pages_are_preloaded_on_every_platform(self):
        expected = 'PreloadPages={"maps","server","customize","page2","settings"}'
        self.assertIn(expected, source("gui/pc.luau"))
        self.assertIn(expected, source("gui/mobile.luau"))


class QBAimDefaultsContracts(unittest.TestCase):
    def test_safe_arc_defaults_off_across_runtime_and_persistence(self):
        self.assertIn('safeArc=getValue(app,"qbAimSafeArc",false)', source("data-save/data-save.lua"))
        self.assertIn("qbAimSafeArc=false", source("runtime/loader-part-1.lua"))
        self.assertIn("qbAimSafeArc=false,", source("runtime/loader-part-2.lua"))
        self.assertIn(
            'setQBAimSafeArc={"qbAimSafeArc",false,"QBAim","SetSafeArcState",true}',
            source("runtime/loader-part-5.lua"),
        )

        logic = source("features/qb-aim/logic.lua")
        self.assertIn("state.qbAimSafeArc=false", logic)
        self.assertIn('buildToggleRow(sectionBody,"Safe Arc",state.qbAimSafeArc==true', logic)

    def test_park_uses_the_active_minigame_session(self):
        logic = source("features/qb-aim/logic.lua")
        self.assertIn(
            'return modeKey=="mode1" or modeKey=="mode2" or modeKey=="mode3"',
            logic,
        )
        self.assertIn("local function getPlayerGameID(player)", logic)
        self.assertIn("getPlayerGameID(player)==gameID", logic)
        self.assertIn("if not allowSingleFallback then", logic)
        self.assertIn(
            'elseif modeKey=="mode2" or modeKey=="mode3" then',
            logic,
        )
        self.assertNotIn('return false,"park unknown"', logic)

    def test_window_resize_handle_is_visible(self):
        for path in ("gui/pc.luau", "gui/mobile.luau"):
            self.assertIn("ResizeHandleVisible=true", source(path))

    def test_throw_animation_falls_back_to_pump_fake_without_delaying_release(self):
        logic = source("features/qb-aim/logic.lua")
        self.assertIn("function qbAim._playPumpFakeAnimation(mechanics)", logic)
        self.assertIn("task.spawn(function()", logic)
        self.assertIn("pcall(mechanics.Pumpfake,mechanics)", logic)
        self.assertIn("if ok and played==true then", logic)
        self.assertIn('return true,"pumpfake"', logic)

    def test_qb_c2_origin_is_not_visually_lerped_but_keeps_jump_prediction(self):
        logic = source("features/qb-aim/logic.lua")
        self.assertIn('buildSlider(sectionBody,"XYZ Drift"', logic)
        self.assertIn("local useHorizontalReleasePrediction=true", logic)
        self.assertIn("local useVerticalReleasePrediction=true", logic)
        self.assertIn("local smoothedStartPoint=startPoint", logic)
        self.assertNotIn(
            "preview.lastStartPoint:Lerp(smoothedStartPoint,previewSmoothAmount)",
            logic,
        )


class PresetContracts(unittest.TestCase):
    def test_editor_keeps_data_and_api_separate(self):
        editor = source("features/preset-editor/logic.lua")
        self.assertIn("local presetData=app.hitboxPresets", editor)
        self.assertIn("local hitboxPresetsApi=hitboxPresets", editor)
        self.assertIn("hitboxPresetsApi.ShowSaveConfirm(api.Collect)", editor)
        self.assertNotIn("local hitboxPresets=app.hitboxPresets", editor)

    def test_preset_editor_payload_accepts_both_field_casings(self):
        paths = [
            "data-save/data-save.lua",
            "runtime/loader-part-2.lua",
            "features/hitbox-presets/logic.lua",
        ]
        combined = "\n".join(source(path) for path in paths)
        self.assertIn("data.PresetEditor", combined)
        self.assertIn("preset.PresetEditor", combined)
        self.assertIsNone(
            re.search(
                r"(\b[A-Za-z_][A-Za-z0-9_.]*presetEditor)"
                r"\s+or\s+\1",
                combined,
            )
        )


class LifecycleContracts(unittest.TestCase):
    def test_fallback_player_data_modal_is_destroyed(self):
        player_data = source("features/data/logic.lua")
        self.assertIn("local function closeActiveModal()", player_data)
        destroy = player_data[player_data.index("function api.Destroy()") :]
        self.assertIn("closeActiveModal()", destroy)

    def test_colour_panel_tweens_ignore_stale_completions(self):
        colors = source("features/colors/logic.lua")
        self.assertIn("local bodyTransitionToken=0", colors)
        self.assertIn("bodyTween~=tween", colors)
        self.assertIn(
            "playbackState~=Enum.PlaybackState.Completed",
            colors,
        )

    def test_shared_caches_do_not_reactivate_after_destroy(self):
        player_cache = source("core/player-cache.lua")
        ball_tracker = source("core/ball-tracker.lua")
        self.assertIn(
            "if self._destroyed or not player or self._entries[player] then",
            player_cache,
        )
        self.assertIn("if self._destroyed or not player then", ball_tracker)

    def test_game_params_restore_values_they_override(self):
        params = source("features/params/logic.lua")
        self.assertIn("local originalGravity=workspace.Gravity", params)
        self.assertIn("local originalWalkSpeeds=setmetatable", params)
        self.assertIn("local originalNumberValues=setmetatable", params)
        self.assertIn("restoreInactiveNumberValues()", params)
        destroy = params[params.index("function api.Destroy()") :]
        self.assertIn("restoreAllNumberValues()", destroy)
        self.assertIn("restoreGravity()", destroy)


class RuntimeFallbackContracts(unittest.TestCase):
    def test_style_fallback_does_not_self_reference_parameter(self):
        runtime = source("runtime/loader-part-1.lua")
        self.assertIn(
            "function applyDefaultUIStyleFields(targetStyle,force)",
            runtime,
        )
        self.assertIn("targetStyle=targetStyle or style", runtime)
        self.assertNotIn("style=style or style", runtime)

    def test_esp_helpers_fall_back_to_players_service(self):
        defense = source("features/esp-defense/logic.lua")
        offense = source("features/esp-offense/logic.lua")
        expected = (
            "for _,player in ipairs(playerList or players:GetPlayers()) do"
        )
        self.assertIn(expected, defense)
        self.assertIn(expected, offense)


if __name__ == "__main__":
    unittest.main()
