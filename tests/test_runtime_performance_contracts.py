import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def source(path):
    return (ROOT / path).read_text(encoding="utf-8")


class HitboxContracts(unittest.TestCase):
    def test_hitbox_targets_player_body_hitbox_not_catchbox(self):
        hitbox = source("features/hitbox/logic.lua")
        self.assertIn("local tackleBox=trackedTackleBoxValue and trackedTackleBoxValue.Value", hitbox)
        self.assertIn('part.Parent.Name=="Hitboxes"', hitbox)
        self.assertNotIn('targetHitboxName="CatchBox"', hitbox)

    def test_hitbox_follows_player_tacklebox_pointer(self):
        hitbox = source("features/hitbox/logic.lua")
        self.assertIn('replicated:FindFirstChild("TackleBox")', hitbox)
        self.assertIn('valueObject:GetPropertyChangedSignal("Value")', hitbox)
        self.assertIn("attachNode(node)", hitbox)
        self.assertIn("me.DescendantAdded:Connect", hitbox)

    def test_mode_roots_handle_additions_and_removals(self):
        hitbox = source("features/hitbox/logic.lua")
        self.assertIn("root.ChildAdded:Connect(queueRefresh)", hitbox)
        self.assertIn("root.ChildRemoved:Connect(queueRefresh)", hitbox)
        self.assertIn("workspace.ChildRemoved:Connect", hitbox)

    def test_hitbox_minimum_matches_presets(self):
        hitbox = source("features/hitbox/logic.lua")
        self.assertIn("local minHitboxSize=0.1", hitbox)
        self.assertNotIn("clampNumber(x,0.2,50", hitbox)

    def test_reapply_work_is_coalesced(self):
        hitbox = source("features/hitbox/logic.lua")
        self.assertIn("local dirtyParts=setmetatable", hitbox)
        self.assertIn("local pendingWrites=setmetatable", hitbox)
        self.assertIn("task.delay(hitboxReapplyInterval,flushPartReapply)", hitbox)
        self.assertNotIn("pendingReapply", hitbox)


class RuntimePerformanceContracts(unittest.TestCase):
    def test_ui_library_modules_are_batched(self):
        runtime = source("runtime/loader-part-1.lua")
        self.assertIn("local externalPaths={}", runtime)
        self.assertIn("paths=externalPaths", runtime)
        self.assertIn(
            'source=uiLibrarySource.id or "ui-library"',
            runtime,
        )

    def test_esp_control_poll_does_not_force_rebuild(self):
        esp = source("features/esp/logic.lua")
        self.assertIn(
            'scheduler.Register("Heartbeat","ESPControls",0.25,function()\n'
            "\t\t\tsyncControls(false)",
            esp,
        )
        self.assertIn("elseif refreshActive and nextApi", esp)

    def test_ball_tracker_has_longer_negative_cache(self):
        tracker = source("core/ball-tracker.lua")
        self.assertIn("local positiveBallCacheSeconds = 0.15", tracker)
        self.assertIn("local negativeBallCacheSeconds = 0.5", tracker)
        self.assertIn("findDirectFootballPart", tracker)


class BoostContracts(unittest.TestCase):
    def test_auto_boost_requires_foot_contact_on_head_top(self):
        boost = source("features/boost/logic.lua")
        self.assertIn("local boostScanInterval=0.05", boost)
        self.assertIn('for _,name in ipairs({"LeftFoot","RightFoot","Left Leg","Right Leg"})', boost)
        self.assertIn("local function projectedHalfExtent(part,axis)", boost)
        self.assertIn("local function isFootOnHeadTop(foot,head)", boost)
        self.assertIn("foot.Touched:Connect(function(hit)", boost)
        self.assertIn("hasFootOnOtherHead(character)", boost)
        self.assertNotIn("boostContactRadius", boost)
        self.assertNotIn("root.Touched:Connect(function(hit)", boost)

    def test_always_bypasses_chance_and_contact_only_attempts_once(self):
        boost = source("features/boost/logic.lua")
        self.assertIn("local contactActive=false", boost)
        self.assertIn("if contactActive then return false end", boost)
        self.assertIn("contactActive=true", boost)
        self.assertIn("contactActive=false", boost)
        self.assertIn("tryJumpBoost(root,state.jumpBoostTradeMode)", boost)
        self.assertIn("not ignoreChance and not rollBoostChance()", boost)
        self.assertNotIn("AssemblyLinearVelocity", boost)

    def test_bypass_cooldown_is_persisted_and_independent(self):
        boost = source("features/boost/logic.lua")
        self.assertIn('buildToggleRow(section,"bypass cooldown"', boost)
        self.assertIn("function api.SetBypassCooldownState(value,fire)", boost)
        self.assertIn("not state.boostBypassCooldown and not boostReady", boost)
        self.assertIn("if not state.boostBypassCooldown then", boost)

        data_save = source("data-save/data-save.lua")
        self.assertIn('bypassCooldown=getValue(app,"boostBypassCooldown",false)', data_save)
        self.assertIn('applyBoolean(app,"setBoostBypassCooldown","boostBypassCooldown",boost.bypassCooldown)', data_save)

        self.assertIn("boostBypassCooldown=false", source("runtime/loader-part-1.lua"))
        self.assertIn("boostBypassCooldown=false,", source("runtime/loader-part-2.lua"))
        self.assertIn('setBoostBypassCooldown={"boostBypassCooldown",true,"Boost","SetBypassCooldownState",true}', source("runtime/loader-part-5.lua"))


if __name__ == "__main__":
    unittest.main()
