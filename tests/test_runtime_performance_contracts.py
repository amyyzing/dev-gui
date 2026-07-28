import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def source(path):
    return (ROOT / path).read_text(encoding="utf-8")


class HitboxContracts(unittest.TestCase):
    def test_hitbox_targets_only_catchbox(self):
        hitbox = source("features/hitbox/logic.lua")
        self.assertIn('local targetHitboxName="CatchBox"', hitbox)
        self.assertIn(
            'return part and part:IsA("BasePart") and part.Name==targetHitboxName',
            hitbox,
        )

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


if __name__ == "__main__":
    unittest.main()
