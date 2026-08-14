import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


class PerformanceModeContracts(unittest.TestCase):
    def test_reduces_visual_cost_without_changing_gameplay_physics(self):
        logic = (ROOT / "features" / "materials" / "logic.lua").read_text(
            encoding="utf-8"
        )
        for expected in (
            "ParticleEmitter=true",
            "Trail=true",
            '"CastShadow",false',
            '"Reflectance",0',
            '"GlobalShadows",false',
            "Enum.RenderFidelity.Performance",
        ):
            self.assertIn(expected, logic)

        for protected in ("CanCollide", "CanTouch", "CanQuery", "AssemblyLinearVelocity"):
            self.assertNotIn(protected, logic)

    def test_is_reversible_and_watches_streamed_content(self):
        logic = (ROOT / "features" / "materials" / "logic.lua").read_text(
            encoding="utf-8"
        )
        self.assertIn("local function restoreWorld(worldSettings)", logic)
        self.assertIn("workspace.DescendantAdded:Connect", logic)
        self.assertNotIn("part and part.Parent and part:IsA", logic)
        self.assertIn("local changed=pcall(function()", logic)
        self.assertNotIn("RenderStepped", logic)
        self.assertNotIn("Heartbeat", logic)

    def test_ui_uses_performance_mode_name(self):
        for path in ("gui/pc.luau", "gui/mobile.luau", "runtime/loader-part-3.lua"):
            self.assertIn("Performance Mode", (ROOT / path).read_text(encoding="utf-8"))


if __name__ == "__main__":
    unittest.main()
