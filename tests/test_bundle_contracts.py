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

    def test_normal_loader_uses_main_credentials_and_reexecution_cleanup(self):
        loader = (ROOT / "loader.lua").read_text(encoding="utf-8")
        self.assertIn("GUI_BOOT_CONFIG", loader)
        self.assertIn('local apiUrl="https://lint-bot-production.up.railway.app"', loader)
        self.assertIn('local apiKey="mydayohmy"', loader)
        self.assertIn('local moduleSource="gui"', loader)
        self.assertNotIn("config.ApiKey", loader)
        self.assertNotIn("config.ApiUrl", loader)
        self.assertIn('path="main.lua"', loader)
        self.assertIn('apiUrl.."/module/get"', loader)
        self.assertIn('{"GUI_RUNTIME_CLEANUP","DEV_GUI_RUNTIME_CLEANUP"}', loader)
        self.assertIn("sharedEnv.DEV_GUI_BOOT_CONFIG=nil", loader)
        self.assertIn('contextActions:UnbindAction(actionName)', loader)
        self.assertNotIn('source="dev-gui"', loader)

        runtime = (ROOT / "runtime" / "loader-part-1.lua").read_text(encoding="utf-8")
        self.assertIn('bootConfig.Fresh=true', runtime)
        self.assertIn('env.GUI_RUNTIME_CLEANUP=function()', runtime)

    def test_runtime_prefers_bundle_factories_before_remote_calls(self):
        runtime = (ROOT / "runtime" / "loader-part-1.lua").read_text(encoding="utf-8")
        bundle_check = runtime.index("if bundledModuleFactories and bundledModuleFactories[modulePath] then")
        remote_fetch = runtime.index("if isExternalModulePath(modulePath) then", bundle_check)
        self.assertLess(bundle_check, remote_fetch)
        self.assertIn('setLoaderProgress("registering bundled modules"', runtime)
        self.assertNotIn("task.delay(0.48", runtime)

    def test_gui_owns_section_creation(self):
        manifest = json.loads((ROOT / "build" / "bundle-manifest.json").read_text(encoding="utf-8"))
        runtime = (ROOT / "runtime" / "loader-part-1.lua").read_text(encoding="utf-8")

        self.assertNotIn("gui/gui-logic.lua", manifest["uiLibrary"])
        self.assertIn('GuiLogic="features/colors/gui.lua"', runtime)

    def test_ui_library_owns_the_current_theme_catalog(self):
        manifest = json.loads((ROOT / "build" / "bundle-manifest.json").read_text(encoding="utf-8"))
        ui_root = ROOT.parent / "495-ui-library"
        library_map = (ui_root / "gui" / "library-map.lua").read_text(encoding="utf-8")
        expected = {"raycast", "everforest", "proof", "linear", "material", "absolutely"}

        self.assertEqual(
            {Path(path).stem for path in manifest["uiLibrary"] if path.startswith("design/themes/")},
            expected,
        )
        self.assertIn('libraryMap.DefaultProfileId="raycast"', library_map)
        self.assertIn('UnfilledRole="MUTED"', library_map)
        self.assertIn('UnfilledTransparency=0.70', library_map)
        for theme in expected:
            self.assertIn(f'{theme}=profile("{theme}"', library_map)

        for path in (ROOT / "gui" / "pc.luau", ROOT / "gui" / "mobile.luau"):
            source = path.read_text(encoding="utf-8")
            self.assertLess(source.index("libraryMap.GetProfile(profileId)"), source.index("guiThemes[profileId]"))

    def test_auto_calibrate_uses_the_unfilled_control_role(self):
        qb = (ROOT / "features" / "qb-aim" / "logic.lua").read_text(encoding="utf-8")
        line = next(line for line in qb.splitlines() if "autoCalibrateButton=make" in line)
        self.assertIn("BackgroundColor3=colors.MUTED or colors.muted", line)
        self.assertIn("BackgroundTransparency=0.70", line)
        self.assertIn('ThemeRole="MUTED"', line)
        self.assertIn("AutoButtonColor=false", line)


if __name__ == "__main__":
    unittest.main()
