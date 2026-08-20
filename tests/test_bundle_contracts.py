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

    def test_production_loader_is_one_bundle_request_with_safe_fallback(self):
        loader = (ROOT / "loader.lua").read_text(encoding="utf-8")
        self.assertEqual(loader.count('API_URL.."/bundle/get"'), 1)
        self.assertIn('status==304 and cachedChunk', loader)
        self.assertIn('writeBundleCache(bundleSource,buildId)', loader)
        self.assertIn('runModularFallback', loader)
        self.assertIn('config.Development==true or config.UseModules==true', loader)

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


if __name__ == "__main__":
    unittest.main()
