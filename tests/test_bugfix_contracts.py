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

    def test_loader_keeps_the_raycast_palette(self):
        runtime = source("runtime/loader-part-1.lua")

        self.assertIn("local loaderRaycast=guiThemes.raycast.Theme", runtime)
        self.assertIn("BackgroundColor3=loaderColors.accent", runtime)
        self.assertIn("isProblem and loaderColors.error or loaderColors.accent", runtime)
        self.assertGreaterEqual(runtime.count("not isFixedLoaderThemeInstance(instance)"), 2)


class QBAimDefaultsContracts(unittest.TestCase):
    def test_new_user_qb_tuning_defaults_are_consistent(self):
        self.assertIn("qbAimLeadDelay=0.38", source("runtime/loader-part-1.lua"))
        self.assertIn("qbAimPeakHeight=14.2", source("runtime/loader-part-1.lua"))
        self.assertIn("qbAimThrowDelay=0.1", source("runtime/loader-part-1.lua"))
        self.assertIn("qbAimPeakHeight=14.2,", source("runtime/loader-part-2.lua"))
        self.assertIn("qbAimThrowDelay=0.1,", source("runtime/loader-part-2.lua"))
        self.assertIn("local defaultCatchHeight=14.2", source("features/qb-aim/logic.lua"))
        self.assertIn("local defaultThrowDelay=0.10", source("features/qb-aim/logic.lua"))

        persistence = source("data-save/data-save.lua")
        self.assertIn('leadDelay=getValue(app,"qbAimLeadDelay",0.38)', persistence)
        self.assertIn('peakHeight=getValue(app,"qbAimPeakHeight",14.2)', persistence)
        self.assertIn('throwDelay=getValue(app,"qbAimThrowDelay",0.1)', persistence)
        self.assertIn('qbAim.peakHeight,8,20,14.2)', persistence)
        self.assertIn('qbAim.throwDelay,0,0.5,0.1)', persistence)

    def test_qb_reset_restores_every_qb_control_and_visual(self):
        logic = source("features/qb-aim/logic.lua")
        refresh = logic[logic.index("function api.Refresh()") : logic.index("function api.Reset()")]
        reset = logic[logic.index("function api.Reset()") : logic.index("function api.Destroy()")]

        for field in ("qbAimLeadDelay", "qbAimPeakHeight", "qbAimThrowDelay"):
            self.assertIn(f"state.{field}", refresh)

        for statement in (
            "state.qbAimTeamFilter=true",
            "state.qbAimShowArc=true",
            "state.qbAimTargetHighlight=true",
            "setLeadDelay(leadDelayBaseline,false)",
            "setPeakHeight(defaultCatchHeight,false)",
            "setThrowDelay(defaultThrowDelay,false)",
            "setEnabled(false)",
        ):
            self.assertIn(statement, reset)

    def test_safe_arc_is_removed_from_qb_aim_state_ui_and_persistence(self):
        production = "\n".join(
            source(path)
            for path in (
                "features/qb-aim/logic.lua",
                "runtime/loader-part-1.lua",
                "runtime/loader-part-2.lua",
                "runtime/loader-part-5.lua",
                "data-save/data-save.lua",
                "gui/description.lua",
            )
        )
        for removed in (
            "qbAimSafeArc",
            "SetSafeArcState",
            "Safe Arc",
            "trajectoryCanBeDefended",
            "interceptionCore",
        ):
            self.assertNotIn(removed, production)

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

    def test_player_settings_use_the_live_game_mode_instead_of_mode1(self):
        persistence = source("data-save/data-save.lua")
        runtime = source("runtime/loader-part-5.lua")
        main_runtime = source("runtime/loader-part-2.lua")
        self.assertIn('if type(app.getCurrentModeKey)=="function" then', persistence)
        self.assertIn("return r.modes[getModeKey(app)] or defaultSettings or {}", persistence)
        self.assertIn("defaultSettings=api.Collect()", persistence)
        self.assertIn("getCurrentModeKey=function()", runtime)
        self.assertIn("local modeChanged=nextModeKey~=currentModeKey", main_runtime)
        self.assertIn("pcall(DataSaveAPI.SaveNow)", main_runtime)
        self.assertIn("pcall(DataSaveAPI.SetMode,currentModeKey,true)", main_runtime)

    def test_legacy_player_settings_are_migrated_without_losing_modes(self):
        persistence = source("data-save/data-save.lua")
        self.assertIn("local rootVersion=3", persistence)
        self.assertIn('for _,modeKey in ipairs({"mode2","mode3"}) do', persistence)
        self.assertIn("raw.modes[modeKey]=cloneSettings(raw.modes.mode1)", persistence)
        self.assertIn("mode1=cloneSettings(legacy)", persistence)
        self.assertIn("mode2=cloneSettings(legacy)", persistence)
        self.assertIn("mode3=cloneSettings(legacy)", persistence)

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

    def test_throw_animation_uses_local_animator_when_mechanics_is_unavailable(self):
        logic = source("features/qb-aim/logic.lua")
        self.assertIn("local useLocalThrowFallback=true", logic)
        self.assertIn("return animator:LoadAnimation(animation)", logic)
        self.assertIn("track:Play(0.05,1,throwAnimationSpeed)", logic)
        self.assertIn('return ok,"local"', logic)

    def test_park_qb_c2_origin_stays_on_the_live_release_point(self):
        logic = source("features/qb-aim/logic.lua")
        self.assertIn('buildSlider(sectionBody,"Throw Delay"', logic)
        self.assertIn("local function recordQBOrigin(now,qbRoot,ball)", logic)
        self.assertIn("local function delayedQBOrigin(now,delay,currentPosition)", logic)
        self.assertIn("local targetTime=now-delay", logic)
        self.assertIn("previous.pos:Lerp(current.pos", logic)
        self.assertIn("local sampledOrigin=currentOrigin", logic)
        self.assertIn('if getModeKey(app)~="mode2" then', logic)
        self.assertIn("sampledOrigin=delayedQBOrigin(now,delay,currentOrigin)", logic)
        self.assertIn("plan.originHistoryDelay=appliedOriginDelay", logic)
        self.assertIn("setAttachmentCFrame(c2,xAxisCFrame(startPoint,plan.velocity)", logic)
        self.assertNotIn("workspace.Gravity*releaseDelay*releaseDelay", logic)
        self.assertNotIn(
            "preview.lastStartPoint:Lerp",
            logic,
        )

    def test_throw_delay_replaces_drift_without_moving_the_park_release_point(self):
        production = "\n".join(
            source(path)
            for path in (
                "features/qb-aim/logic.lua",
                "runtime/loader-part-1.lua",
                "runtime/loader-part-2.lua",
                "runtime/loader-part-5.lua",
                "data-save/data-save.lua",
                "gui/description.lua",
            )
        )
        for removed in (
            "qbAimQBDrift",
            "qbAimQBYDrift",
            "SetQBXYZDrift",
            "SetQBDrift",
            "SetQBYDrift",
            "XYZ Drift",
            "xyzDrift",
        ):
            self.assertNotIn(removed, production)

        logic = source("features/qb-aim/logic.lua")
        self.assertIn("local sampledOrigin=currentOrigin", logic)
        self.assertIn('if getModeKey(app)~="mode2" then', logic)
        self.assertIn("sampledOrigin=delayedQBOrigin(now,delay,currentOrigin)", logic)
        self.assertIn("buildPlan(receiver,ballPower,releaseBall,wrOffset or 0,sampledOrigin)", logic)
        self.assertIn("plan.originHistoryDelay=appliedOriginDelay", logic)
        self.assertIn("plan.receiverTimingOffset=wrOffset or 0", logic)
        self.assertNotIn("(wrOffset or 0)+delay", logic)
        self.assertNotIn("(wrOffset or 0)-delay", logic)

    def test_qb_peak_uses_the_field_plane_in_park_only(self):
        logic = source("features/qb-aim/logic.lua")
        math_source = source("features/qb-aim/math.lua")

        for removed in (
            "getPlayerTackleBox",
            "receiverCatchAnchor",
            "receiverAnchorPosition",
            "receiverAnchorSource",
            "catchAnchorMaxOffset",
            "catchAnchorBlend",
            'FindFirstChild("TackleBox")',
        ):
            self.assertNotIn(removed, logic)
            self.assertNotIn(removed, math_source)

        self.assertIn("local receiverPosition=receiverRoot.Position", logic)
        self.assertIn("receiverPosition=receiverPosition,", logic)
        self.assertIn("local receiverBasePosition=params.receiverPosition", math_source)
        self.assertIn("local function fieldGroundY(position)", logic)
        self.assertIn("for _,player in ipairs(currentPlayers()) do", logic)
        self.assertIn("params.FilterDescendantsInstances=ignore", logic)
        self.assertIn(
            "workspace:Raycast(position,Vector3.new(0,-220,0),params)", logic
        )
        self.assertIn("local catchY=catchHeight", logic)
        self.assertIn('if getModeKey(app)=="mode2" then', logic)
        self.assertIn("local groundY=0", logic)
        self.assertIn("groundY=fieldGroundY(receiverPosition)", logic)
        self.assertIn("if not groundY then", logic)
        self.assertIn("catchY=groundY+catchHeight", logic)
        self.assertIn("groundY=groundY,", logic)
        self.assertNotIn("fieldGroundY(catchPosition) or 0", logic)
        self.assertNotIn("catchPosition.Y+catchHeight", logic)

        self.assertIn("local function landing(originPosition,velocity,groundY)", math_source)
        self.assertIn("local height=originPosition.Y-groundY", math_source)
        self.assertIn(
            "landing(originPosition,worldVelocity,params.groundY)", math_source
        )

    def test_auto_calibrate_uses_one_throw_animation_and_stable_ball_release(self):
        logic = source("features/qb-aim/logic.lua")
        self.assertIn('Text="Auto Calibrate"', logic)
        self.assertIn(
            'BackgroundColor3=colors.muted,BackgroundTransparency=0.70',
            logic,
        )
        self.assertIn('ThemeRole="MUTED"', logic)
        self.assertIn("function api.AutoCalibrate()", logic)
        self.assertIn("animator.AnimationPlayed:Connect", logic)
        self.assertIn("startCalibration(os.clock(),currentHeldBall(),throwReleaseWait)", logic)
        self.assertIn("startCalibration(os.clock(),heldBall,throwReleaseWait)", logic)
        self.assertIn("startCalibration(os.clock(),heldBall,0)", logic)
        self.assertIn("if currentHeldBall()==calibration.ball then", logic)
        self.assertIn("now-calibration.missingSince<releaseConfirmStableTime", logic)
        self.assertIn(
            "local measured=calibration.missingSince-calibration.startedAt-calibration.animationTime",
            logic,
        )
        self.assertIn("setThrowDelay(measured,true)", logic)
        self.assertIn('"QBAimAutoCalibrate"', logic)

    def test_qb_preview_runs_from_c2_through_c1_to_ground_c3(self):
        logic = source("features/qb-aim/logic.lua")
        self.assertIn("local endPoint=plan.landing or catchPoint", logic)
        self.assertIn("local previewTime=plan.landingTime or catchTime", logic)
        self.assertIn("local catchVelocity=plan.velocity+gravityVector*catchTime", logic)
        self.assertIn("UpdateInterval=1/120", logic)
        self.assertIn(
            'addSchedulerJob("RenderStepped","QBAimPreview",arcSettings.UpdateInterval,previewStep)',
            logic,
        )
        self.assertIn("setAttachmentCFrame(c2,xAxisCFrame(startPoint,plan.velocity)", logic)
        self.assertIn("setAttachmentCFrame(c1,xAxisCFrame(catchPoint,catchVelocity)", logic)
        self.assertIn("setAttachmentCFrame(c3,xAxisCFrame(endPoint,endVelocity)", logic)
        self.assertIn("beam.Attachment0=c2", logic)
        self.assertIn("beam.Attachment1=c3", logic)
        self.assertIn("updateC1AndC3Info(plan,catchPoint,endPoint)", logic)
        self.assertNotIn("previewSmoothAmount", logic)
        self.assertNotIn("smoothedCatchPoint", logic)
        self.assertIn("if preview.visible==visible then return end", logic)
        self.assertIn("if not bound and not bindArcRigParts(center) then return nil end", logic)
        self.assertIn("instance.Enabled=visible and instance==preview.beam", logic)
        self.assertIn("descendant.Enabled=false", logic)

    def test_qb_arc_toggle_only_hides_the_existing_preview(self):
        logic = source("features/qb-aim/logic.lua")
        setter = logic[
            logic.index("function api.SetShowArcState") :
            logic.index("function api.SetTargetHighlightState")
        ]
        self.assertIn("hideQBTrailPreview()", setter)
        self.assertNotIn("clearPreviewVisuals", setter)
        self.assertNotIn("destroyPreviewCenter", setter)

    def test_receiver_prediction_keeps_the_binary_zero_or_21_speed_model(self):
        logic = source("features/qb-aim/logic.lua")
        self.assertIn("local maxRunSpeed=21", logic)
        self.assertIn("routeVelocity=rawVelocity.Unit*maxRunSpeed", logic)
        self.assertIn("state.routeVelocity=Vector3.zero", logic)


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
    def test_server_hide_arc_preserves_the_game_arc_and_excludes_qb_preview(self):
        arc = source("features/arc/logic.lua")
        runtime = source("runtime/loader-part-3.lua")
        refresh = source("runtime/loader-part-2.lua")
        cleanup = source("runtime/loader-part-1.lua")

        for ui_map in (source("gui/pc.luau"), source("gui/mobile.luau")):
            self.assertIn('{name="Arc",api="ArcAPI",order=1,title="Hide Arc"}', ui_map)

        self.assertIn('["Hide Arc"]={Title="HIDE ARC"', source("gui/description.lua"))
        for arc_root in (
            "Center",
            "BallMarker",
            "LandingMarker",
        ):
            self.assertIn(f"{arc_root}=true", arc)
        self.assertNotIn("BallMarker_BallTrackingUX=true", arc)
        self.assertNotIn("LandingMarker_BallTrackingUX=true", arc)
        self.assertIn("arcRootNames[ancestor.Name]", arc)
        self.assertIn('ancestor.Parent.Name=="Local"', arc)
        self.assertIn('ancestor.Name=="ClonedCenter"', arc)
        for visual_class in (
            "BasePart",
            "Decal",
            "Texture",
            "Attachment",
            "GuiObject",
            "GuiBase3d",
            "Beam",
            "Trail",
            "ParticleEmitter",
            "Highlight",
            "BillboardGui",
            "SurfaceGui",
        ):
            self.assertIn(f'instance:IsA("{visual_class}")', arc)
        self.assertIn('return "Transparency",1', arc)
        self.assertIn('return "Transparency",NumberSequence.new(1)', arc)
        self.assertIn('return "Opacity",0', arc)
        self.assertIn('return "Visible",false', arc)
        self.assertIn('return "Enabled",false', arc)
        self.assertIn("instance:GetPropertyChangedSignal(property)", arc)
        self.assertIn("instance[record.property]=record.hidden", arc)
        self.assertIn("instance[record.property]=record.desired", arc)
        self.assertNotIn(":Destroy()", arc)
        self.assertIn("lazyPageBuilders.server=buildServerPage", runtime)
        self.assertIn('elseif name=="server" then', refresh)
        self.assertIn('pcall(ArcAPI.Refresh)', refresh)
        self.assertIn('"ArcAPI"', cleanup)

    def test_normal_reexecution_cleans_the_previous_runtime(self):
        loader = source("loader.lua")
        runtime = source("runtime/loader-part-1.lua")
        self.assertIn('rawget(sharedEnv,"DEV_GUI_RUNTIME_CLEANUP")', loader)
        self.assertIn("sharedEnv.DEV_GUI_RUNTIME_CLEANUP=nil", loader)
        self.assertIn('type(cleanup)=="function"', loader)
        self.assertIn('CleanupGlobalName or "GUI_RUNTIME_CLEANUP"', runtime)
        self.assertIn("cleanupForManualReload()", runtime)
        self.assertIn("env[runtimeCleanupGlobalName]=nil", runtime)

    def test_player_execution_log_retries_before_giving_up(self):
        state = source("runtime/loader-part-2.lua")
        runtime = source("runtime/loader-part-5.lua")
        self.assertIn("playerLogSending=false", state)
        self.assertIn("if playerLogSent or playerLogSending then return end", runtime)
        self.assertIn("for attempt=1,3 do", runtime)
        self.assertIn("if attempt<3 then task.wait(2) end", runtime)
        self.assertLess(runtime.index("playerLogSent=true"), runtime.index("playerSessionId=result.sessionId"))

    def test_new_modules_use_the_injected_environment_source(self):
        runtime = source("runtime/loader-part-1.lua")
        self.assertIn("bootModuleSource.Id or bootModuleSource.id", runtime)
        self.assertIn('Source=appModuleSource.id', runtime)
        self.assertIn('local result=botApi.Post("/module/get",{path=modulePath})', runtime)
        self.assertIn('result=botApi.Post("/module/batch",{paths=apiPaths})', runtime)
        self.assertNotIn("mergedModuleFallback", runtime)
        self.assertNotIn('source="dev-gui"', runtime)

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
        self.assertIn('make("UIPadding",{PaddingTop=UDim.new(0,4),PaddingLeft=UDim.new(0,1),PaddingRight=UDim.new(0,1),PaddingBottom=UDim.new(0,4)},ownedList)', presets)
        self.assertIn('Size=UDim2.new(1,0,0,expandedOwned[code] and 178 or 32)', presets)
        self.assertIn('row:SetAttribute("NoStroke",true)', presets)
        self.assertNotIn('BorderStrokePosition=Enum.BorderStrokePosition.Inner', presets)
        self.assertIn('Size=UDim2.new(1,-20,0,30),Position=UDim2.fromOffset(10,1)', presets)
        self.assertIn('make("UIPadding",{PaddingTop=UDim.new(0,4),PaddingLeft=UDim.new(0,4),PaddingRight=UDim.new(0,4),PaddingBottom=UDim.new(0,4)},page2Wrap)', source("runtime/loader-part-4.lua"))
        self.assertIn('ancestor:GetAttribute("NoSliderStroke")==true', controls)
        self.assertIn('ancestor:GetAttribute("NoSectionStroke")==true', controls)
        self.assertIn("if sectionStrokeEnabled then", controls)
        self.assertIn('container:SetAttribute("NoStroke",noStroke)', controls)
        self.assertIn('track:SetAttribute("NoStroke",noStroke)', controls)
        self.assertIn('fill:SetAttribute("NoStroke",noStroke)', controls)
        self.assertIn('valueBox:SetAttribute("NoStroke",noStroke)', controls)
        self.assertIn("wrap.BackgroundTransparency=0.70", controls)
        self.assertIn("BackgroundTransparency=sliderTrackTransparency", controls)

        for path in (
            "platforms/pc/gui/mainframe.lua",
            "platforms/mobile/gui/mainframe.lua",
        ):
            shell = source(path)
            self.assertIn('settingsPage:SetAttribute("NoSliderStroke",true)', shell)
            self.assertIn('settingsPage:SetAttribute("NoSectionStroke",true)', shell)
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
