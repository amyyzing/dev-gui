from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def read(relative_path: str) -> str:
    return (ROOT / relative_path).read_text(encoding="utf-8")


def test_dump_file_names_stay_short_and_flat():
    assert {path.name for path in (ROOT / "dump").glob("*.lua")} == {
        "api.lua", "conn.lua", "create.lua", "init.lua", "input.lua", "lib.lua",
        "life.lua", "load.lua", "save.lua", "start.lua", "ui.lua",
    }
    assert not any(path.is_file() for path in (ROOT / "dump").glob("*/*.lua"))


def test_loader_is_bound_to_main_gui_source_and_credentials():
    loader = read("loader.lua")
    dump_start = read("dump/start.lua")
    runtime = read("runtime/loader-part-1.lua")
    assert 'path="main.lua"' in loader
    assert 'source=moduleSource' in loader
    assert 'local moduleSource="gui"' in loader
    assert 'local apiKey="mydayohmy"' in loader
    assert "config.ApiKey" not in loader
    assert "config.ApiUrl" not in loader
    assert 'TRUSTED_API_URL="https://lint-bot-production.up.railway.app"' in dump_start
    assert 'trustedApiUrl="https://lint-bot-production.up.railway.app"' in runtime
    assert "dev-gui-api-production.up.railway.app" not in loader + dump_start + runtime
    assert "GUI_BOOT_CONFIG" in loader
    assert "sharedEnv.DEV_GUI_BOOT_CONFIG=nil" in loader
    assert 'source="dev-gui"' not in loader + read("main.lua") + runtime
    assert "gui-runtime-cache" not in read("main.lua")
    assert "readCachedSource" not in read("main.lua")


def test_runtime_uses_main_gui_names():
    runtime = read("runtime/loader-part-1.lua")
    assert 'return "gui"' in runtime
    assert 'screenGuiName or "HitboxUI"' in runtime
    assert '"refreshModules"' in runtime
    assert '"HitboxUI_DarkInfluenced_GUIOnly"' in runtime
    assert "DevGuiUI" not in runtime


def test_dump_init_is_the_single_composition_boundary():
    dump_init = read("dump/init.lua")
    assert 'AppId="gui"' in dump_init
    assert "UI=required.Syntax.new" in dump_init
    assert "Runtime={" in dump_init
    assert "Services={" in dump_init


def test_public_syntax_stays_small_and_options_based():
    syntax = read("dump/ui.lua")
    for name in (
        "Page", "Category", "Section", "Label", "Button", "Toggle", "Slider",
        "Input", "Dropdown", "Keybind", "Row", "Column", "Spacer", "Divider",
    ):
        assert name in syntax
    assert "UI.Special.ColorEditor" in syntax
    assert "UI.Special.Vector3Editor" in syntax


def test_dropdown_handle_is_declared_before_its_click_callback_closes_over_it():
    adapter = read("dump/lib.lua")
    dropdown = adapter.split("function api.createDropdown", 1)[1].split(
        "function api.createKeybind", 1
    )[0]
    assert "local button\n\t\tbutton=api.createButton" in dropdown
    assert "button.instance.Text=dropdownLabel(items[index])" in dropdown
    assert "button.set(dropdownLabel(items[index]))" not in dropdown


def test_discord_controller_has_no_ui_constructor_dependencies():
    controller = read("features/discord/core.lua")
    for forbidden in ("makeSection", "wrapTextButton", 'make("', "app.UI", "colors"):
        assert forbidden not in controller

    view = read("features/discord/view.lua")
    assert "UI.createSection" in view
    assert "UI.createButton" in view
    assert "UI.createStatus" in view


def test_discord_refresh_clears_a_stale_invite_before_publishing():
    controller = read("features/discord/core.lua")
    assert controller.count("snapshot.inviteLink=nil") >= 2
    assert "snapshot.inviteLink=inviteLink" in controller


def test_process_global_context_actions_use_main_gui_names():
    qb_aim = read("features/qb-aim/logic.lua")
    assert '"QBAim_ControllerThrow"' in qb_aim
    assert '"QBAim_ControllerToggle"' in qb_aim
    assert '"DevGui_QBAim_ControllerThrow"' not in qb_aim
    assert '"DevGui_QBAim_ControllerToggle"' not in qb_aim

    for platform in ("pc", "mobile"):
        mainframe = read(f"platforms/{platform}/gui/mainframe.lua")
        assert '"HitboxUI_MouseInputSink"' in mainframe
        assert '"DevGui_MouseInputSink"' not in mainframe


def test_new_modules_are_registered_for_remote_loading():
    runtime = read("runtime/loader-part-1.lua")
    for module_path in (
        "dump/init.lua",
        "dump/conn.lua",
        "dump/life.lua",
        "dump/input.lua",
        "dump/ui.lua",
        "dump/create.lua",
        "dump/lib.lua",
        "dump/api.lua",
        "dump/load.lua",
        "dump/save.lua",
        "features/discord/core.lua",
        "features/discord/view.lua",
    ):
        assert module_path in runtime


def test_documented_one_line_loader_uses_railway_not_private_github_raw():
    readme = read("README.md")
    assert 'game:HttpGet("https://raw.githubusercontent.com/amyyzing/gui/main/loader.lua")' in readme


def test_reworked_theme_list_is_complete_and_raycast_is_default():
    runtime = read("runtime/loader-part-1.lua")
    colors = read("features/colors/logic.lua")
    data_save = read("data-save/data-save.lua")

    expected = {
        "raycast": ("Raycast", "{16,16,16}", "{255,99,99}", "{207,47,152}"),
        "everforest": ("Everforest", "{253,246,227}", "{147,178,89}", "{223,105,186}"),
        "proof": ("Proof", "{245,243,237}", "{61,117,93}", "{95,106,194}"),
        "linear": ("Linear", "{15,15,17}", "{96,106,204}", "{194,161,255}"),
        "material": ("Material", "{33,33,33}", "{128,203,196}", "{199,146,234}"),
        "absolutely": ("Absolutely", "{45,45,43}", "{204,125,94}", "{204,125,94}"),
    }
    for theme_id, (label, primary, accent, secondary) in expected.items():
        assert f'{theme_id}=exactTheme("{theme_id}","{label}",{primary},{accent},{secondary}' in runtime

    expected_text = {
        "raycast": ("{254,254,254}", "{102,102,102}"),
        "everforest": ("{92,106,114}", "{147,159,145}"),
        "proof": ("{47,49,45}", "{75,77,72}"),
        "linear": ("{227,228,230}", "{99,107,123}"),
        "material": ("{238,255,255}", "{103,103,103}"),
        "absolutely": ("{249,249,247}", "{178,178,176}"),
    }
    for text, muted in expected_text.values():
        assert f"text={text},muted={muted}" in runtime

    assert '{"raycast","everforest","proof","linear","material","absolutely"}' in colors
    assert "softTones" not in runtime
    assert "theme.Theme[role]=Color3.fromRGB(value[1],value[2],value[3])" in runtime
    assert "Text=palette.text" in colors
    assert "Muted=palette.muted" in colors
    assert "local textColor=preset.Text or readableTextColor(preset.Primary)" in colors
    assert "instance.TextColor3=colors[textRole]" in runtime
    assert 'if id=="catppuccin" then id="everforest" end' in data_save
    assert 'if id=="dracula" then id="proof" end' in data_save
    assert "local function migrateThemeColors" in data_save
    assert "if tonumber(style[field])~=old[i] then return id end" in data_save
    assert "themes=guiThemes" in read("runtime/loader-part-5.lua")
    assert "themes=guiThemes" in read("runtime/loader-part-3.lua")

    for path in ("gui/pc.luau", "gui/mobile.luau"):
        assert 'uiMap.LibraryProfileId="raycast"' in read(path)

    assert 'UILib="raycast"' in colors
    assert 'UILib="raycast"' in data_save
    assert "PrimaryR=16" in colors and "GradientR=207" in colors
    assert "PrimaryR=16" in data_save and "GradientR=207" in data_save
    assert 'return validThemes[id] and id or "raycast"' in data_save
    for old_label in ("Dark", "Light", "Midnight", "Crimson", "Evergreen", "Sakura"):
        assert f'Name="{old_label}"' not in colors


def test_square_header_avatar_spans_title_block_and_shifts_text_on_both_platforms():
    runtime = read("runtime/loader-part-1.lua")
    assert "WindowRadius=0,SectionRadius=0,ControlRadius=0,SliderRadius=0" in runtime
    assert 'if role=="Avatar" then' not in runtime

    for platform in ("pc", "mobile"):
        mainframe = read(f"platforms/{platform}/gui/mainframe.lua")
        module_scope, constructor = mainframe.split("function mainFrame.new(app)", 1)
        assert "local function avatarSize" in module_scope
        assert "local function titleX" in module_scope
        assert "local function titleSize" in module_scope
        assert "local function headerAvatarSize" not in constructor
        assert "local playerAvatar" not in constructor
        assert "api.avatar=make" in constructor
        assert 'Name="PlayerAvatar"' in mainframe
        assert '"rbxthumb://type=AvatarHeadShot&id="' in mainframe
        assert "(subtitleY+14)-titleY" in mainframe
        assert "titleXValue+avatarSize(titleY,subtitleY)+10" in mainframe
        assert 'CornerRole="Control"' in mainframe
        assert 'CornerRadius=UDim.new(0,999)' not in mainframe
        assert 'BackgroundTransparency=1' in mainframe
        assert 'local avatarStroke=make("UIStroke",{Color=getUIStrokeColor(),Thickness=1,Transparency=0.35,StrokeRole="Fixed"},api.avatar)' in mainframe
        assert 'avatarStroke.Color=getUIStrokeColor()' in mainframe
        assert 'TextColor3=colors.text,TextRole="TEXT"' in mainframe
        assert 'Name="ResizeHandle"' in mainframe
        assert 'BackgroundTransparency=0.18,BorderSizePixel=0,Text="",Visible=resizeHandleVisible' in mainframe
        assert 'local resizeStroke=make("UIStroke"' in mainframe
        assert "BackgroundTransparency=targetTransparency" in mainframe
        assert 'BackgroundTransparency=0,BorderSizePixel=0,Size=UDim2.new(1,0,0,footerHeight)' in mainframe
        assert "UDim2.fromOffset(titleX(headerTitleX,headerTitleY,headerSubtitleY),headerTitleY)" in mainframe
        assert "UDim2.fromOffset(titleX(headerTitleX,headerTitleY,headerSubtitleY),headerSubtitleY)" in mainframe


def test_auto_boost_is_in_the_left_column():
    module_line = '{api="Boost",name="Boost",column="left",order=2,title="Boost"}'
    for path in ("gui/pc.luau", "gui/mobile.luau", "runtime/loader-part-2.lua"):
        assert module_line in read(path)


def test_square_controls_and_colour_picker_are_clipped():
    runtime = read("runtime/loader-part-1.lua")
    colors = read("features/colors/logic.lua")

    assert 'if class=="UICorner" and parent and parent:IsA("GuiObject") then' in runtime
    assert "parent.ClipsDescendants=true" in runtime
    assert 'local activeMode="Square"' in colors
    assert '{"Square","RGB","HSV","Hex"}' in colors
    assert colors.count("Size=UDim2.fromOffset(104,104)") == 2
    assert colors.count('addCorner(svSquare,"Section")') == 1
    assert colors.count('addCorner(highlightSvBase,"Section")') == 1
    assert colors.count("Size=UDim2.new(1,-4,0,3)") == 2
    assert "math.floor(-3*pickerHue+0.5)" in colors
    assert "math.floor(-3*highlightPickerHue+0.5)" in colors
    assert "math.clamp(point.X-pos.X,0,size.X)" in colors
    assert "math.clamp(point.Y-pos.Y,0,size.Y)" in colors


def test_requested_control_copy_and_spacing_contracts():
    hitbox = read("features/hitbox/logic.lua")
    testing = read("features/testing/gui.lua")
    colors = read("features/colors/logic.lua")
    runtime = read("runtime/loader-part-1.lua")

    assert 'Text="size"' in hitbox
    assert 'buildSlider(section,"transparency"' in hitbox
    assert 'Text="TRANSPARENCY"' not in hitbox
    assert 'buildSlider(section,"Alpha"' not in hitbox
    assert "stroke=false" in hitbox
    assert "if sectionStrokeEnabled then" in read("features/colors/gui.lua")
    assert 'sec:SetAttribute("NoStroke",not sectionStrokeEnabled)' in read("features/colors/gui.lua")
    assert 'parent:GetAttribute("NoStroke")==true' in runtime
    assert 'strokeParent:GetAttribute("NoStroke")==true' in runtime
    assert 'makeSection(parent,5,"Testing","",{' in testing
    assert 'label=target=="Stroke" and "Secondary" or target' in colors
    assert 'button.Size=UDim2.new(0.5,-4,1,0)' in colors
    assert 'for _,instance in ipairs(screenGui:GetDescendants()) do' in runtime


def test_params_selector_uses_fixed_masked_segments_and_main_pages_tween():
    params = read("features/params/gui.lua")
    assert "local isSelected=pageKey==selected" in params
    assert "selectorRoot" not in params
    assert 'tweenObject(wheelImages[pageKey],{ImageColor3=targetColor,ImageTransparency=targetTransparency})' in params

    for platform in ("pc", "mobile"):
        shell = read(f"platforms/{platform}/gui/mainframe.lua")
        assert "local function turnPage(" in shell
        assert "frame.Rotation=direction*3" in shell
        assert "Position=UDim2.fromScale(0,0)" in shell


def test_theme_and_idle_controls_refresh_immediately():
    colors = read("features/colors/logic.lua")
    gui_logic = read("features/colors/gui.lua")
    theme_apply = colors[colors.index("local function applyThemePreset"):colors.index("for i,preset in ipairs")]

    assert "setPrimaryColour(preset.Primary)" in theme_apply
    assert "setMainColour(preset.Stroke)" in theme_apply
    assert "updateEverything()" in theme_apply
    assert "tweenStyleTo" not in theme_apply
    assert 'TextRole="TEXT"' in gui_logic
    assert 'label:SetAttribute("ThemeTextRole",state and "STROKE" or "TEXT")' in gui_logic
    assert gui_logic.count('ThemeRole="MUTED"') >= 1
    assert 'local trackRole="MUTED"' in gui_logic
    assert 'local sliderTrackTransparency=0.70' in gui_logic


def test_theme_palette_can_be_unlocked_and_text_refreshes():
    runtime = read("runtime/loader-part-1.lua")
    colors = read("features/colors/logic.lua")

    assert "if style.UseThemePalette~=false then" in runtime
    assert "style.UseThemePalette=true" in colors
    assert "style.UseThemePalette=false" in colors
    assert 'style.UseThemePalette~=false' in colors
    assert 'Font=Enum.Font.Gotham,' in colors
    assert 'Font=Enum.Font.GothamBold,\n\t\t\tTextSize=11' not in colors


def test_header_art_is_center_cropped_for_every_theme():
    runtime = read("runtime/loader-part-1.lua")
    names = {"raycast", "everforest", "proof", "linear", "material", "absolutely"}
    for name in names:
        image = ROOT / "assets" / "headers" / f"{name}.png"
        assert image.is_file() and image.stat().st_size > 1000
        assert f'{name}="https://raw.githubusercontent.com/amyyzing/gui/main/assets/headers/{name}.png"' in runtime

    for platform in ("pc", "mobile"):
        shell = read(f"platforms/{platform}/gui/mainframe.lua")
        assert 'Name="HeaderArt"' in shell
        assert "ScaleType=Enum.ScaleType.Crop" in shell
        assert 'local style=type(app.style)=="table" and app.style or {}' in shell
        assert 'api.headerArt.Image=""' in shell
        assert "api.headerArt.Visible=false" in shell
        assert 'if style.UseThemePalette==false or type(app.getHeaderArt)~="function" then' in shell
        assert "pcall(app.getHeaderArt,id)" in shell
        assert "function api.RefreshTheme()\n\t\tapi.RefreshHeaderArt()" in shell
        assert "avatarStroke.Color=getUIStrokeColor()" in shell


def test_rgb_labels_bypass_description_aliases():
    runtime = read("runtime/loader-part-1.lua")
    colors = read("features/colors/logic.lua")
    description = read("gui/description.lua")

    assert '["R"]="radius"' in description
    assert '["G"]="gravity"' in description
    assert "local skipTranslation=properties.SkipTranslation" in runtime
    assert "if not skipTranslation and properties.Text~=nil" in runtime
    assert "SkipTranslation=true" in colors


def test_params_selector_stays_inside_its_ring_and_gaps_are_not_clickable():
    params = read("features/params/gui.lua")
    assert 'local canvas=make("Frame",{' in params
    assert "local wheelGapDegrees=12" in params
    assert "sector.start+wheelGapDegrees/2" in params
    assert "sector.finish-wheelGapDegrees/2" in params
    assert "local start=startAngle+wheelGapDegrees" not in params
    assert "selectorInsideClipBounds" not in params
    assert params.count("BorderSizePixel=0") >= 8
    assert "local selectorGlow=" not in params
    assert "local selectorGlows=" not in params
    assert "ZIndex=12" not in params


def test_customizer_wheel_only_accents_active_or_hovered_modes():
    colors = read("features/colors/logic.lua")
    assert "local isSelected=key==selected" in colors
    assert "local isHover=key==highlightHoverMode" in colors
    assert "elseif isCustom then" not in colors


def test_gui_controls_use_an_authorized_module_path():
    loader = read("runtime/loader-part-1.lua")
    assert 'GuiLogic="features/colors/gui.lua"' in loader
    assert '"gui/gui-logic.lua"' not in loader
    assert "setLoadedModule(name,loadedModule)" in loader
    assert "return setLoadedModule(name,loadedModule)" not in loader


def test_colour_modes_are_independent_and_complete():
    colors = read("features/colors/logic.lua")

    assert 'rgbSliders.R=makeMiniSlider(rgbBody,"R"' in colors
    assert 'rgbSliders.G=makeMiniSlider(rgbBody,"G"' in colors
    assert 'rgbSliders.B=makeMiniSlider(rgbBody,"B"' in colors
    assert 'hsvSliders.H=makeMiniSlider(hsvBody,"Hue"' in colors
    assert 'hsvSliders.S=makeMiniSlider(hsvBody,"Sat"' in colors
    assert 'hsvSliders.V=makeMiniSlider(hsvBody,"Val"' in colors
    assert "local function commitHex()" in colors
    assert "applyActiveColor(color,false)" in colors
    assert 'activeTarget=activeHighlightTarget' not in colors
    assert 'activeTarget=="HighlightFill"' not in colors
    assert "highlightColorDragOffset=pointerOffset" in colors
    assert "colorDragOffset=pointerOffset" in colors
