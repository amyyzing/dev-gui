-- Mobile GUI map.
-- This file maps the app structure. Reusable element appearance is pulled from
-- 495-ui-library through UILibraryMapModule.
local env=(getfenv and getfenv()) or _G
local libraryMap=rawget(env,"UILibraryMapModule") or {}

local uiMap={}

uiMap.Platform="mobile"
uiMap.LibraryProfileId="original"
uiMap.DefaultProfileId=uiMap.LibraryProfileId

uiMap.LoaderGui={
	PreloadPages={"maps","server","customize","page2","settings"},
	Phases={"setup","modules","gui","ready"},

	Text={
		Title="untitled gui",
		Subtitle="loading files and gui",
		InitialStatus="loading modules...",
		ReadyTitle="ready",
		ReadySubtitle="",
		ReadyStatus="all loaded",
	},

	Box={
		W=480,
		H=320,
	},
}

uiMap.MainBackgroundGui={
	Shell={
		Module="platforms/mobile/gui/mainframe.lua",
	},

	Window={
		W=880,
		H=540,
		MinW=560,
		MinH=360,
		MaxW=1220,
		MaxH=820,
		StartY=80,
		MinimizedH=68,
	},

	Layout={
		RootPadding=8,
		MainGap=8,
		PageGap=8,
		ColumnGap=8,
		FooterGap=8,
		HeaderHeight=52,
		PageBarHeight=30,
		PageTabWidth=106,
		PageTabHeight=28,
		FooterHeight=34,
		TopButtonSize=28,
		TopButtonGap=6,
		TopButtonOuter=10,
	},
}

uiMap.CategoryStructure={
	main={
		Columns={
			left={Order=1},
			right={Order=2},
		},
	},

	keybinds={
		Sections={
			owned={order=1,title="Hitbox Presets",subtitle="Your saved presets"},
			editor={order=2,title="Preset Editor",subtitle="edit hotkeys and hitbox sizes and save (maybe?)"},
			bind={order=3,title="Keybind Settings",subtitle=""},
		},
	},
}

uiMap.PageStructure={
	Tabs={
		{Id="main",Host="settingsPage",Order=1,DescriptionKey="Pages.Main",Fallback="MAIN",DefaultVisible=true},
		{Id="maps",Host="mapPage",Order=2,DescriptionKey="Pages.Maps",Fallback="MAPS"},
		{Id="server",Host="serverPage",Order=3,DescriptionKey="Pages.Server",Fallback="SERVER"},
		{Id="customize",Host="uiSettingsPage",Order=4,DescriptionKey="Pages.Customize",Fallback="CUSTOMIZE"},
		{Id="page2",Host="futurePage",Order=5,DescriptionKey="Pages.Keybinds",Fallback="KEYBINDS"},
		{Id="settings",Host="actualSettingsPage",Order=6,DescriptionKey="Pages.Settings",Fallback="SETTINGS"},
	},

	Pages={
		main={
			Host="settingsPage",
			Categories="main",
			Modules={
				{api="Hitbox",name="Hitbox",column="left",order=1,title="Hitbox"},
				{api="GameParams",name="Params",column="left",order=2,title="Game Params"},
				{api="Boost",name="Boost",column="right",order=2,title="Boost"},
				{api="ESP",name="ESP",column="right",order=3,title="ESP"},
				{api="QBAim",name="QBAim",column="right",order=4,title="QB Aim"},
				{api="Testing",name="Testing",column="right",order=5,title="Testing"},
			},
		},

		maps={
			Host="mapPage",
			Modules={
				{name="MapEditor",api="MapEditorAPI",order=0,title="Map Editor"},
				{name="Materials",api="MaterialsAPI",order=1,title="Anti Material"},
				{name="MapCleaner",api="MapCleanerAPI",order=2,title="Map Cleaner"},
				{name="Ads",api="AdsAPI",order=3,title="Remove Ads"},
			},
		},

		server={
			Host="serverPage",
			Modules={},
		},

		customize={
			Host="uiSettingsPage",
			Modules={
				{name="Colors",api="ColorsAPI",order=1,title="Colors"},
			},
		},

		page2={
			Host="futurePage",
			Categories="keybinds",
			Modules={
				{api="hitboxPresets",name="HitboxPresets",section="owned",title="Hitbox Presets"},
				{api="keybinds",name="Keybinds",section="bind",title="Keybind Settings"},
				{api="presetEditor",name="PresetEditor",section="editor",title="Preset Editor",requires="keybinds",extras="keybindPresetEditor"},
			},
		},

		settings={
			Host="actualSettingsPage",
			Modules={
				{name="ResetGui",api="ResetGuiAPI",order=2,title="GUI Position"},
				{name="PlayerData",api="PlayerDataAPI",order=3,title="Player Data"},
				{name="Discord",api="DiscordAPI",order=4,title="Discord"},
			},
		},
	},
}

uiMap.Structure={
	LoaderGui=uiMap.LoaderGui,
	MainBackgroundGui=uiMap.MainBackgroundGui,
	PageStructure=uiMap.PageStructure,
	CategoryStructure=uiMap.CategoryStructure,
}

uiMap.Shell=uiMap.MainBackgroundGui.Shell
uiMap.MainBackground=uiMap.MainBackgroundGui
uiMap.MainFrame={
	Window=uiMap.MainBackgroundGui.Window,
	Layout=uiMap.MainBackgroundGui.Layout,
}
uiMap.Pages=uiMap.PageStructure.Tabs
uiMap.MainPage={
	Columns=uiMap.CategoryStructure.main.Columns,
	Modules=uiMap.PageStructure.Pages.main.Modules,
}
uiMap.MapPage=uiMap.PageStructure.Pages.maps
uiMap.KeybindPage={
	Sections=uiMap.CategoryStructure.keybinds.Sections,
	Modules=uiMap.PageStructure.Pages.page2.Modules,
}
uiMap.SettingsPage=uiMap.PageStructure.Pages.settings

uiMap.AppStyleDefaults={
	ThemePanelExpanded=false,
	ColoursPanelExpanded=false,
	HighlightPanelExpanded=false,
	HighlightSelectedMode="espOffense",
	HighlightSelectedState="open",
	ESPOffenseCustomColor=false,
	ESPDefenseCustomColor=false,
	QBAimHighlightCustomColor=false,
	ESPOffenseOpenCustomColor=false,
	ESPOffenseClosedCustomColor=false,
	ESPDefenseHolderCustomColor=false,
	ESPDefenseOpenCustomColor=false,
	ESPDefenseClosedCustomColor=false,
	ESPOffenseFillR=32,
	ESPOffenseFillG=202,
	ESPOffenseFillB=106,
	ESPOffenseOutlineR=32,
	ESPOffenseOutlineG=202,
	ESPOffenseOutlineB=106,
	ESPOffenseFillTransparency=0.5,
	ESPOffenseOutlineTransparency=0,
	ESPOffenseOpenFillR=32,
	ESPOffenseOpenFillG=202,
	ESPOffenseOpenFillB=106,
	ESPOffenseOpenOutlineR=32,
	ESPOffenseOpenOutlineG=202,
	ESPOffenseOpenOutlineB=106,
	ESPOffenseOpenFillTransparency=0.5,
	ESPOffenseOpenOutlineTransparency=0,
	ESPOffenseClosedFillR=254,
	ESPOffenseClosedFillG=94,
	ESPOffenseClosedFillB=86,
	ESPOffenseClosedOutlineR=254,
	ESPOffenseClosedOutlineG=94,
	ESPOffenseClosedOutlineB=86,
	ESPOffenseClosedFillTransparency=0.5,
	ESPOffenseClosedOutlineTransparency=0,
	ESPDefenseFillR=32,
	ESPDefenseFillG=202,
	ESPDefenseFillB=106,
	ESPDefenseOutlineR=32,
	ESPDefenseOutlineG=202,
	ESPDefenseOutlineB=106,
	ESPDefenseFillTransparency=0.5,
	ESPDefenseOutlineTransparency=0,
	ESPDefenseHolderFillR=21,
	ESPDefenseHolderFillG=103,
	ESPDefenseHolderFillB=251,
	ESPDefenseHolderOutlineR=21,
	ESPDefenseHolderOutlineG=103,
	ESPDefenseHolderOutlineB=251,
	ESPDefenseHolderFillTransparency=0.45,
	ESPDefenseHolderOutlineTransparency=0,
	ESPDefenseOpenFillR=32,
	ESPDefenseOpenFillG=202,
	ESPDefenseOpenFillB=106,
	ESPDefenseOpenOutlineR=32,
	ESPDefenseOpenOutlineG=202,
	ESPDefenseOpenOutlineB=106,
	ESPDefenseOpenFillTransparency=0.5,
	ESPDefenseOpenOutlineTransparency=0,
	ESPDefenseClosedFillR=254,
	ESPDefenseClosedFillG=94,
	ESPDefenseClosedFillB=86,
	ESPDefenseClosedOutlineR=254,
	ESPDefenseClosedOutlineG=94,
	ESPDefenseClosedOutlineB=86,
	ESPDefenseClosedFillTransparency=0.5,
	ESPDefenseClosedOutlineTransparency=0,
	QBAimHighlightFillR=21,
	QBAimHighlightFillG=103,
	QBAimHighlightFillB=251,
	QBAimHighlightOutlineR=32,
	QBAimHighlightOutlineG=202,
	QBAimHighlightOutlineB=106,
	QBAimHighlightFillTransparency=0.65,
	QBAimHighlightOutlineTransparency=0,
}

local function copyTable(source)
	local result={}

	for key,value in pairs(source or {}) do
		result[key]=value
	end

	return result
end

local function mergeTables(...)
	local result={}

	for index=1,select("#",...) do
		for key,value in pairs(select(index,...) or {}) do
			result[key]=value
		end
	end

	return result
end

function uiMap.GetLoaderGui()
	return uiMap.LoaderGui or {}
end

function uiMap.GetMainBackgroundGui()
	return uiMap.MainBackgroundGui or uiMap.MainBackground or {}
end

function uiMap.GetPageStructure()
	return uiMap.PageStructure or {}
end

function uiMap.GetCategoryStructure(id)
	local categories=uiMap.CategoryStructure or {}
	if id then
		return categories[tostring(id)] or {}
	end

	return categories
end

function uiMap.GetPages()
	local pageStructure=uiMap.GetPageStructure()
	return pageStructure.Tabs or uiMap.Pages or {}
end

function uiMap.GetPage(id)
	local pageStructure=uiMap.GetPageStructure()
	local pages=pageStructure.Pages or {}
	return pages[tostring(id or "")] or {}
end

function uiMap.GetPageModules(id)
	return uiMap.GetPage(id).Modules
end

function uiMap.GetPageCategories(id)
	local page=uiMap.GetPage(id)
	if type(page.Categories)=="table" then
		return page.Categories
	end

	local category=uiMap.GetCategoryStructure(page.Categories)
	return category.Sections or category
end

function uiMap.GetPageColumns(id)
	local page=uiMap.GetPage(id)
	if type(page.Columns)=="table" then
		return page.Columns
	end

	return uiMap.GetCategoryStructure(page.Categories).Columns
end

function uiMap.GetLibraryProfile(id)
	if type(libraryMap.GetProfile)=="function" then
		return libraryMap.GetProfile(id or uiMap.LibraryProfileId)
	end

	return libraryMap.Profiles and libraryMap.Profiles[uiMap.LibraryProfileId] or {}
end

function uiMap.GetProfile(id)
	local profile=copyTable(uiMap.GetLibraryProfile(id))
	local mainBackground=uiMap.GetMainBackgroundGui()
	profile.mainFrame={
		Window=copyTable(mainBackground.Window),
		Layout=copyTable(mainBackground.Layout),
	}
	profile.Defaults=uiMap.GetDefaultStyle(id)
	return profile
end

function uiMap.GetDefaultProfile()
	return uiMap.GetProfile(uiMap.DefaultProfileId)
end

function uiMap.GetDefaultStyle(id)
	local libraryDefaults={}

	if type(libraryMap.GetDefaultStyle)=="function" then
		libraryDefaults=libraryMap.GetDefaultStyle(id or uiMap.LibraryProfileId)
	else
		libraryDefaults=uiMap.GetLibraryProfile(id).Defaults or {}
	end

	local defaults=mergeTables(libraryDefaults,uiMap.AppStyleDefaults,{UILib=uiMap.LibraryProfileId})
	defaults.UILib=tostring(defaults.UILib or uiMap.LibraryProfileId)
	return defaults
end

function uiMap.GetDefaultWindow()
	return copyTable(uiMap.GetMainBackgroundGui().Window)
end

return uiMap
