import re
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def source(path):
    return (ROOT / path).read_text(encoding="utf-8")


class BootstrapContracts(unittest.TestCase):
    def test_runtime_config_comes_from_the_injected_chunk_environment(self):
        bootstrap = source("dump/start.lua")
        self.assertIn("local parentEnv=(getfenv and getfenv()) or _G", bootstrap)
        self.assertNotIn("getfenv(0)", bootstrap)
        self.assertIn('rawget(parentEnv,"DEV_GUI_RUNTIME_CONFIG")', bootstrap)

    def test_fresh_boot_is_forwarded_without_shared_disk_cache(self):
        bootstrap = source("dump/start.lua")
        self.assertIn("if fresh then body.fresh=true end", bootstrap)
        self.assertNotIn("readCachedSource", bootstrap)
        self.assertNotIn("gui-runtime-cache", bootstrap)

    def test_all_optional_pages_are_preloaded_on_every_platform(self):
        expected = 'PreloadPages={"maps","server","customize","page2","settings"}'
        self.assertIn(expected, source("gui/pc.luau"))
        self.assertIn(expected, source("gui/mobile.luau"))


class QBAimDefaultsContracts(unittest.TestCase):
    def test_new_user_qb_tuning_defaults_are_consistent(self):
        self.assertIn("qbAimLeadDelay=0.38", source("runtime/loader-part-1.lua"))
        self.assertIn("qbAimPeakHeight=14.2", source("runtime/loader-part-1.lua"))
        self.assertIn("qbAimQBDrift=0", source("runtime/loader-part-1.lua"))
        self.assertIn("qbAimQBYDrift=0", source("runtime/loader-part-1.lua"))
        self.assertIn("qbAimPeakHeight=14.2,", source("runtime/loader-part-2.lua"))
        self.assertIn("local defaultCatchHeight=14.2", source("features/qb-aim/logic.lua"))

        persistence = source("data-save/data-save.lua")
        self.assertIn('leadDelay=getValue(app,"qbAimLeadDelay",0.38)', persistence)
        self.assertIn('peakHeight=getValue(app,"qbAimPeakHeight",14.2)', persistence)
        self.assertIn('xyzDrift=getValue(app,"qbAimQBDrift",0)', persistence)
        self.assertIn('qbAim.peakHeight,8,20,14.2)', persistence)

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


class ParamsThemeContracts(unittest.TestCase):
    def test_light_theme_text_toggles_have_distinct_dark_states(self):
        params = source("features/params/gui.lua")
        self.assertIn("local function styleSettingToggle(toggle)", params)
        self.assertIn("Color3.fromRGB(8,8,10)", params)
        self.assertIn("Color3.fromRGB(112,112,124)", params)
        self.assertIn("label.TextTransparency=0", params)
        self.assertIn(
            "styleSettingToggle(buildToggleLabel(page,label",
            params,
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
    def test_footer_reset_only_targets_config_pages_and_first_run_defaults(self):
        pc_shell = source("platforms/pc/gui/mainframe.lua")
        mobile_shell = source("platforms/mobile/gui/mainframe.lua")
        runtime2 = source("runtime/loader-part-2.lua")
        runtime4 = source("runtime/loader-part-4.lua")

        for shell in (pc_shell, mobile_shell):
            self.assertIn("local resetVisibleValue=true", shell)
            self.assertIn(
                'local visible=activePageName=="main" or '
                'activePageName=="customize" or activePageName=="page2"',
                shell,
            )
            self.assertIn("resetBtn.Visible=visible", shell)
            self.assertIn("resetWrap.Visible=visible", shell)

        self.assertIn('type(api.Reset)=="function"', runtime2)
        for page in ("main", "page2", "customize"):
            self.assertIn(f'activePageName=="{page}"', runtime4)
        for page in ("maps", "settings", "server"):
            self.assertNotIn(f'elseif activePageName=="{page}"', runtime4)
        self.assertIn("pageHost.CanvasPosition=Vector2.new(0,0)", runtime4)

    def test_control_spacing_main_slider_strokes_and_loader_handoff(self):
        controls = source("features/colors/gui.lua")
        presets = source("features/hitbox-presets/logic.lua")
        loader = source("runtime/loader-part-1.lua")

        self.assertIn("local wrapInset=1", controls)
        self.assertIn('make("UIPadding",{PaddingTop=UDim.new(0,1)', presets)
        self.assertIn('ancestor:GetAttribute("NoSliderStroke")==true', controls)
        self.assertIn('container:SetAttribute("NoStroke",noStroke)', controls)
        self.assertIn('track:SetAttribute("NoStroke",noStroke)', controls)
        self.assertIn('fill:SetAttribute("NoStroke",noStroke)', controls)
        self.assertIn('valueBox:SetAttribute("NoStroke",noStroke)', controls)

        for path in (
            "platforms/pc/gui/mainframe.lua",
            "platforms/mobile/gui/mainframe.lua",
        ):
            shell = source(path)
            self.assertIn('settingsPage:SetAttribute("NoSliderStroke",true)', shell)
            self.assertIn("function api.RevealFromLoader()", shell)
            self.assertIn("Enum.EasingStyle.Quint", shell)

        self.assertIn('type(mainFrame.RevealFromLoader)=="function"', loader)

    def test_map_page_state_is_session_only_and_anti_material_starts_off(self):
        data_save = source("data-save/data-save.lua")
        self.assertNotIn("smoothPlastic=", data_save)
        self.assertNotIn("workspaceSettings", data_save)
        self.assertIn("settings.workspace=nil", data_save)
        self.assertIn("settings.Workspace=nil", data_save)

        runtime = source("runtime/loader-part-1.lua")
        self.assertIn("mapSettings={SmoothPlastic=false", runtime)

        maps = source("runtime/loader-part-3.lua")
        context = maps[maps.index("function makeMapCtx") : maps.index("function buildMapPage")]
        self.assertNotIn("requestPlayerAutosave()", context)

        startup = source("runtime/loader-part-5.lua")
        self.assertNotIn("mapSettings=mapSettings", startup)
        self.assertNotIn("mapSettings.SmoothPlastic and ensureRuntimePageBuilt", startup)

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
        self.assertIn("stopSpeedLock(false)", destroy)
        self.assertIn("stopGravityLock()", destroy)

    def test_folder_backed_params_target_game_params_number_values(self):
        params = source("features/params/logic.lua")
        expected = {
            'WalkSpeed="speedValue"',
            'JumpPower="jumpPowerValue"',
            'DivePower="divePowerValue"',
            'SprintStaminaRegenRate="staminaRegenValue"',
            'SprintStaminaDepleteRate="staminaDepleteValue"',
        }
        for mapping in expected:
            self.assertIn(mapping, params)
        self.assertIn('gameFolder:FindFirstChild("GameParams")', params)
        self.assertNotIn('Gravity="gravityValue"', params)

    def test_enabled_core_params_are_locked_immediately(self):
        params = source("features/params/logic.lua")
        self.assertIn("local immediateParamLocks={", params)
        self.assertIn("speedValue=true", params)
        self.assertIn("jumpPowerValue=true", params)
        self.assertIn("if immediateParamLocks[stateKey] then", params)
        self.assertIn('workspace:GetPropertyChangedSignal("Gravity")', params)
        self.assertIn('humanoid:GetPropertyChangedSignal("WalkSpeed")', params)

    def test_anti_material_only_changes_basepart_materials(self):
        materials = source("features/materials/logic.lua")
        self.assertIn("workspace:GetDescendants()", materials)
        self.assertIn("part.Material=Enum.Material.SmoothPlastic", materials)
        self.assertIn("workspace.DescendantAdded:Connect", materials)
        self.assertIn("workspace.DescendantRemoving:Connect", materials)
        self.assertIn("restorePart(worldSettings,inst)", materials)
        self.assertIn("for part in pairs(worldSettings.OriginalMaterials)", materials)
        self.assertNotIn("part and part.Parent", materials)
        self.assertIn("ws.OriginalMaterials={}", materials)
        self.assertNotIn('OriginalMaterials=setmetatable({}, {__mode="k"})', materials)
        self.assertIn("mapSettings={SmoothPlastic=false, OriginalMaterials={}}", source("runtime/loader-part-1.lua"))
        self.assertNotIn("OriginalVisuals", materials)
        self.assertNotIn("RenderFidelity", materials)
        self.assertNotIn("CastShadow", materials)
        self.assertNotIn("Reflectance", materials)


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
