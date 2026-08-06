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
