import json
import re
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


class BundleContracts(unittest.TestCase):
    def test_manifest_is_the_complete_runtime_module_inventory(self):
        manifest = json.loads((ROOT / "build" / "bundle-manifest.json").read_text(encoding="utf-8"))
        runtime = (ROOT / "runtime" / "loader-part-1.lua").read_text(encoding="utf-8")
        block = re.search(r"modulePaths=\{(.*?)\n\}", runtime, re.S).group(1)
        fixed_paths = set(re.findall(r'=\s*"([^"]+)"', block)) - {"gui/", "platforms/"}

        declared = set(manifest["modules"]) | set(manifest["uiLibrary"])
        for platform, paths in manifest["platforms"].items():
            self.assertIn(platform, {"pc", "mobile"})
            declared.update(paths)

        self.assertEqual(declared, fixed_paths | {
            "gui/pc.luau", "gui/mobile.luau",
            "platforms/pc/gui/mainframe.lua",
            "platforms/mobile/gui/mainframe.lua",
        })
        self.assertEqual(manifest["runtime"], [
            "runtime/loader-part-1.lua",
            "runtime/loader-part-2.lua",
            "runtime/loader-part-3.lua",
            "runtime/loader-part-4.lua",
            "runtime/loader-part-5.lua",
        ])

    def test_every_manifest_file_exists_in_its_repository(self):
        manifest = json.loads((ROOT / "build" / "bundle-manifest.json").read_text(encoding="utf-8"))
        ui_root = ROOT.parent / "495-ui-library"
        for relative in manifest["runtime"] + manifest["modules"]:
            self.assertTrue((ROOT / relative).is_file(), relative)
        for paths in manifest["platforms"].values():
            for relative in paths:
                self.assertTrue((ROOT / relative).is_file(), relative)
        for relative in manifest["uiLibrary"]:
            self.assertTrue((ui_root / relative).is_file(), relative)

    def test_legacy_loader_hands_off_to_production_gui(self):
        loader = (ROOT / "loader.lua").read_text(encoding="utf-8")
        self.assertIn('apiUrl="https://lint-bot-production.up.railway.app"', loader)
        self.assertIn('moduleSource="gui"', loader)
        self.assertIn('path="loader.lua"', loader)
        self.assertIn('fresh=true', loader)
        self.assertIn('sharedEnv.GUI_BOOT_CONFIG=guiConfig', loader)
        self.assertNotIn("DEV_GUI_BOOT_CONFIG", loader)
        self.assertNotIn("/bundle/get", loader)

    def test_runtime_prefers_bundle_factories_before_remote_calls(self):
        runtime = (ROOT / "runtime" / "loader-part-1.lua").read_text(encoding="utf-8")
        bundle_check = runtime.index("if bundledModuleFactories and bundledModuleFactories[modulePath] then")
        remote_fetch = runtime.index("if isExternalModulePath(modulePath) then", bundle_check)
        self.assertLess(bundle_check, remote_fetch)
        self.assertIn('setLoaderProgress("registering bundled modules"', runtime)
        self.assertNotIn("task.delay(0.48", runtime)

    def test_dev_gui_owns_section_creation(self):
        manifest = json.loads((ROOT / "build" / "bundle-manifest.json").read_text(encoding="utf-8"))
        runtime = (ROOT / "runtime" / "loader-part-1.lua").read_text(encoding="utf-8")

        self.assertNotIn("gui/gui-logic.lua", manifest["uiLibrary"])
        self.assertIn('GuiLogic="features/colors/gui.lua"', runtime)

    def test_theme_modules_have_no_legacy_names(self):
        manifest = json.loads((ROOT / "build" / "bundle-manifest.json").read_text(encoding="utf-8"))
        runtime = (ROOT / "runtime" / "loader-part-1.lua").read_text(encoding="utf-8")
        expected = {"raycast", "everforest", "proof", "linear", "material", "absolutely"}
        retired = {"dark", "light", "midnight", "crimson", "evergreen", "sakura"}
        theme_names = {
            Path(path).stem
            for path in manifest["uiLibrary"]
            if path.startswith("design/themes/")
        }

        self.assertEqual(theme_names, expected)
        for name in retired:
            self.assertNotIn(f"design/themes/{name}.lua", runtime)

    def test_migrated_entry_keeps_esp_unfilled_calibrate_and_player_logs(self):
        production = ROOT.parent / "gui"
        runtime1 = (production / "runtime" / "loader-part-1.lua").read_text(encoding="utf-8")
        runtime2 = (production / "runtime" / "loader-part-2.lua").read_text(encoding="utf-8")
        runtime5 = (production / "runtime" / "loader-part-5.lua").read_text(encoding="utf-8")

        self.assertIn('ESP="features/esp/gui.lua"', runtime1)
        self.assertIn('ESPLogic="features/esp/logic.lua"', runtime1)
        self.assertIn('{api="ESP",name="ESP"', runtime2)
        self.assertIn('botApi.Post("/player/log"', runtime5)

        for root in (ROOT, production):
            qb = (root / "features" / "qb-aim" / "logic.lua").read_text(encoding="utf-8")
            line = next(line for line in qb.splitlines() if "autoCalibrateButton=make" in line)
            self.assertIn('ThemeRole="MUTED"', line)
            self.assertIn("BackgroundTransparency=0.70", line)
            self.assertIn("AutoButtonColor=false", line)


if __name__ == "__main__":
    unittest.main()
