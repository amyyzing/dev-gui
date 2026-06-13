local EMPTY=""

local Description={}

Description.Categories={
	Main={
		Title="Control Panel",
		Description="Gameplay tools and settings",
		LoadedSuffix=EMPTY,
	},

	Pages={
		Main="Main",
		Maps="Map Editor",
		Server="Server",
		Customize="GUI Customizer",
		Keybinds="Keybinds",
		Settings="Settings",
	},

	PageDescriptions={
		Main="Gameplay tools",
		Maps="Map and workspace cleanup",
		Server="Server tools",
		Customize="Theme, layout, and color settings",
		Keybinds="Keyboard, mouse, and controller shortcuts",
		Settings="Profile, update, and community options",
	},

	Sections={
		Main={
			["Hitbox"]={Title="HITBOX",Description="Tackle Hitbox"},
			["Gravity"]={Title="GRAVITY",Description="Player Gravity"},
			["Speed"]={Title="SPEED",Description="Forced Speed"},
			["Game Params"]={Title="PARAMS",Description="Stamina, jump, and dive tuning"},
			["Boost"]={Title="AUTO BOOST",Description="Boost force, chance, and radius"},
			["ESP"]={Title="ESP",Description="Player highlights and possession filters"},
			["QB Aim"]={Title="QB AIM",Description="Receiver lock, arc preview, and throw timing"},
			["Testing"]={Title="TESTING",Description="Incoming throw C1 capture"},
		},

		Maps={
			["Map Editor"]={Title="MAP EDITOR",Description="Adjust map visuals"},
			["Anti Material"]={Title="ANTI-MATERIAL",Description="Simplify workspace materials"},
			["Map Cleaner"]={Title="MAP CLEANER",Description="Hide unused map geometry"},
			["Remove Ads"]={Title="REMOVE BILLBOARD",Description="Hide billboard advertisements"},
			["Workspace"]={Title="WORKSPACE",Description="Workspace visual cleanup"},
		},

		Customize={
			["Customisation"]={Title="CUSTOMIZATION",Description="Theme, layout, and window controls"},
			["Colours"]={Title="COLORS",Description="Fine-tune GUI colors"},
			["Primary Colours"]={Title="PRIMARY COLOURS",Description=EMPTY},
			["Secondary Colours"]={Title="SECONDARY COLOURS",Description=EMPTY},
			["Pulse Accent"]={Title="STROKE PATTERN",Description="Animated border accent style"},
			["Border Shape"]={Title="BORDER",Description="Window and control corner styling"},
			["Stroke Colour"]={Title="STROKE",Description="Border color and gradient settings"},
		},

		Keybinds={
			["Hitbox Presets"]={Title="PRESETS",Description="Your saved hitbox presets"},
			["Preset Editor"]={Title="SET EDITOR",Description="Edit preset sizes and bindings"},
			["Keybind Settings"]={Title="KEYBINDS",Description="Keyboard, mouse, and controller shortcuts"},
		},

		Settings={
			["Update"]={Title="UPDATE",Description="Reload latest GUI build"},
			["Player Data"]={Title="PLAYER DATA",Description="Saved settings and reset actions"},
			["Discord"]={Title="COMMUNITY",Description="Discord invite link"},
		},
	},

	Labels={
		ActionStatus=EMPTY,
		Reset=EMPTY,
		Ready=EMPTY,
		Busy=EMPTY,
	},

	Text={
		MainFrame={
			["untitled gui"]="Control Panel",
			["MAIN"]="Main",
			["MAPS"]="Maps",
			["SERVER"]="Server",
			["CUSTOMIZE"]="Customize",
			["KEYBINDS"]="Keybinds",
			["SETTINGS"]="Settings",
			["RESET"]="RESET",
			["[]"]="[]",
			["-"]="-",
			["+"]="+",
		},

		Loader={
			["Loading GUI"]="Loading GUI",
			["Preparing remote modules..."]="Preparing remote modules...",
			["Loading..."]="Loading...",
			["Closing... encountered error"]="Closing... encountered error",
			["Auto-refresh failed."]="Auto-refresh failed.",
		},

		Common={
			["ACTION"]="ACTION",
			["CANCEL"]="CANCEL",
			["SAVE"]="SAVE",
			["UPDATE GUI"]="UPDATE GUI",
			["UPDATING..."]="UPDATING...",
			["UPDATE FAILED"]="UPDATE FAILED",
			["YES"]="YES",
			["NO"]="NO",
			["DELETE"]="Delete",
			["EQUIP"]="Equip",
			["NIL"]="EMPTY",
			["PRESS..."]="PRESS...",
			["Off"]="Off",
			["Disabled"]="Disabled",
		},

		Hitbox={
			["Hitbox Toggle"]="Hitbox toggle",
			["HITBOX SIZE"]="Size (X, Y, Z)",
			["TRANSPARENCY"]="Transparency",
			["X"]="X size",
			["Y"]="Y size",
			["Z"]="Z size",
			["A"]="Alpha",
		},

		Movement={
			["G"]="Gravity",
			["S"]="Speed",
			["Force Speed"]="Force speed",
			["Speed Toggle"]="Speed",
		},

		GameParams={
			["SR"]="Stamina Regeneration",
			["SD"]="Stamina Depletion",
			["J"]="Jump",
			["D"]="Dive",
		},

		Boost={
			["Jump Boost"]="Jump Boost",
			["Always Boost"]="ALWAYS Boost",
			["Jump Boost Toggle"]="Jump Boost",
			["Always Boost Toggle"]="Always Boost",
			["F"]="Force",
			["C"]="Chance",
			["R"]="Radius",
		},

		ESP={
			["ESP"]="ESP",
			["ESP Toggle"]="ESP",
			["Gameplay only"]="Gameplay only",
			["Offense possession"]="Offense possession",
			["Defense active"]="Defense active",
		},

		QBAim={
			["Enabled"]="QB Aim",
			["Team Filter"]="Filter Team",
			["Show Arc"]="Aimbot Arc",
			["Lead Adjust"]="Lead Adjust",
			["Peak Height"]="Peak Height",
			["QB Drift"]="QB Drift",
			["QB Aim Lock Receiver"]="Select Receiver",
			["QB Aim Throw"]="Throw Selected Receiver",
			["QB Aim Toggle"]="Aimbot",
		},

		Testing={
			["Testing"]="Testing",
			["incoming C1 capture"]="incoming C1 capture",
			["Off"]="Off",
		},

		Maps={
			["SmoothPlastic"]="Smooth plastic",
			["Map Cleaner"]="Map cleaner",
			["Remove Ads"]="Remove ads",
			["Gameplay only."]="Gameplay only.",
			["Ads folder not found."]="Ads folder not found.",
			["Ads restored."]="Ads restored.",
			["Map objects restored."]="Map objects restored.",
		},

		Customize={
			["PREVIEW"]="Color Preview",
			["Live preview"]="Live preview",
			["Primary Colours"]="Primary Colours",
			["Secondary Colours"]="Secondary Colours",
			["Primary colour"]="Primary colour",
			["Primary red"]="Primary red",
			["Primary green"]="Primary green",
			["Primary blue"]="Primary blue",
			["Quick colours"]="Normal Color Presets",
			["Main stroke colour"]="Secondary Color",
			["Gradient end colour"]="Secondary Gradient",
			["Gradient presets"]="Gradient Preset",
			["Weight and opacity"]="Weight and opacity",
			["Main red"]="Main red",
			["Main green"]="Main green",
			["Main blue"]="Main blue",
			["Gradient red"]="Gradient red",
			["Gradient green"]="Gradient green",
			["Gradient blue"]="Gradient blue",
			["Pulse speed"]="Pulse speed",
			["Stroke thickness"]="Stroke thickness",
			["Stroke transparency"]="Stroke transparency",
			["Gradient Stroke"]="Gradient stroke",
			["Pulse Accent"]="Pulse Accent",
			["Primary colour module missing."]="Primary colour module missing.",
			["Secondary colour module missing."]="Secondary colour module missing.",
		},

		Presets={
			["SAVE PRESET"]="SAVE",
			["No saved presets yet."]="No saved presets yet.",
			["Name this preset"]="Name Preset:",
			["Preset name"]="Preset Name",
			["Save current preset?"]="Save current preset?",
			["This saves the preset to your owned preset list."]="This saves the preset to your owned preset list.",
		},

		Keybinds={
			["Toggle open / hide GUI"]="Open/Hide GUI",
		},

		PlayerData={
			["Cloud Profile"]="Data Status",
			["READY"]="READY",
			["BUSY"]="BUSY",
			["WIPE DATA"]="WIPE",
			["WIPE"]="WIPE",
			["Wipe your data?"]="Wipe your data?",
			["This WILL delete your data across all gamemodes. Continue?"]="This WILL delete your data across all gamemodes. Continue?",
			["Wiping player data..."]="Wiping player data...",
			["Player data wiped."]="Player data wiped.",
			["Saved settings and owned presets are available."]=EMPTY,
		},

		Discord={
			["Loading invite link..."]="Loading invite link...",
			["Fetching invite link..."]="Fetching invite link...",
			["No invite link set."]="No invite link set.",
			["Click to Copy"]="Click to Copy",
			["Copied"]="Copied",
			["Click the invite link to copy it."]="Click the invite link to copy it.",
			["Use /invite-link create in Discord to set this."]="Use /invite-link create in Discord to set this.",
			["No Discord invite link has been set."]="No Discord invite link has been set.",
			["Clipboard is not available in this executor."]="Clipboard is not available in this executor.",
			["Copied Discord invite link."]="Copied Discord invite link.",
			["Could not fetch Discord invite link."]="Could not fetch Discord invite link.",
		},
	},
}

Description.Main=Description.Categories.Main
Description.Pages=Description.Categories.Pages
Description.PageDescriptions=Description.Categories.PageDescriptions
Description.Labels=Description.Categories.Labels
Description.Sections={}
Description.Texts={}

local function mergeSections(group)
	for key,value in pairs(group) do
		if type(value)=="table" and (value.Title~=nil or value.Description~=nil) then
			Description.Sections[key]=value
		elseif type(value)=="table" then
			mergeSections(value)
		end
	end
end

local function mergeTexts(group)
	for key,value in pairs(group) do
		if type(value)=="table" then
			mergeTexts(value)
		else
			Description.Texts[key]=value
		end
	end
end

mergeSections(Description.Categories.Sections)
mergeTexts(Description.Categories.Text)

function Description.Get(path,fallback)
	local value=Description
	for part in tostring(path or ""):gmatch("[^%.]+") do
		if type(value)~="table" then
			return fallback
		end
		value=value[part]
	end

	if value==nil then
		return fallback
	end

	return value
end

function Description.Section(title,subtitle)
	local item=Description.Sections[tostring(title or "")]
	if type(item)~="table" then
		return title,subtitle
	end

	return item.Title or title,item.Description or subtitle
end

function Description.Text(raw)
	if type(raw)~="string" then
		return raw
	end

	local mapped=Description.Texts[raw]
	if mapped~=nil then
		return mapped
	end

	return raw
end

return Description
