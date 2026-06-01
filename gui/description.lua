local EMPTY=""

local Description={}

-- Main frame
Description.Main={
	Title="untitled gui",
	Description="hello",
	LoadedSuffix=EMPTY,
}

-- Page labels
Description.Pages={
	Main="Main",
	Maps="Map Editor",
	Server="Server",
	Customize="GUI Customizer",
	Keybinds="Keybinds",
	Settings="Settings",
}

-- Page descriptions
Description.PageDescriptions={
	Main=EMPTY,
	Maps=EMPTY,
	Server=EMPTY,
	Customize=EMPTY,
	Keybinds=EMPTY,
	Settings=EMPTY,
}

-- Page 1 categories
Description.Sections={
	["Hitbox"]={Title="HITBOX",Description="Tackle Hitbox"},
	["Gravity"]={Title="GRAVITY",Description="Player Gravity"},
	["Speed"]={Title="SPEED",Description="Forced Speed"},
	["Game Params"]={Title="PARAMS",Description="Stamina, jump, and dive tuning"},
	["Boost"]={Title="AUTO BOOST",Description="Configure your boost"},
	["ESP"]={Title="ESP",Description="WR/DB coverage esp, self-explanatory for league players"},
	["QB Aim"]={Title="QB AIM",Description="Receiver lock, arc preview, and throw timing"},

-- Page 2 categories
	["Map Editor"]={Title="MAP EDITOR",Description="Change the map how you want!"},
	["Anti Material"]={Title="ANTI-MATERIAL",Description="Get rid of materials"},
	["Map Cleaner"]={Title="MAP CLEANER",Description="Remove the large chunk of the map you'll never touch under the field"},
	["Remove Ads"]={Title="REMOVE BILLBOARD",Description="Remove the ad billboard. I KNOW your pain"},
	["Workspace"]={Title="WORKSPACE",Description="Workspace visual cleanup"},

-- Page 4 categories
	["Customisation"]={Title="CUSTOMIZATION",Description="Customize your GUI here"},
	["Colours"]={Title="COLORS",Description="Precise customization of GUI color"},
	["Primary Colours"]={Title="PRIMARY COLOURS",Description=EMPTY},
	["Secondary Colours"]={Title="SECONDARY COLOURS",Description=EMPTY},
	["Pulse Accent"]={Title="STROKE PATTERN",Description="Some stuff that moves around in your GUI secondary."},
	["Border Shape"]={Title="BORDER",Description="Your Border Thing"},
	["Stroke Colour"]={Title="STROKE",Description="Change stroke in GUI"},

-- Page 5 categories
	["Hitbox Presets"]={Title="PRESETS",Description="Your saved presets hitbox presets here"},
	["Preset Editor"]={Title="SET EDITOR",Description="Edit sets here"},
	["Keybind Settings"]={Title="KEYBINDS",Description="Change your keybinds here. There ARE a lot of things. Get used to it!"},

-- Page 6 categories
	["Player Data"]={Title="WIPE DATA",Description="Yes. Self explanatory. Applies to all gamemodes."},
	["Discord"]={Title="SOCIALS",Description="Discord invite link"},
}

-- Miscellaneous labels
Description.Labels={
	ActionStatus=EMPTY,
	Reset=EMPTY,
	Ready=EMPTY,
	Busy=EMPTY,
}

-- Static control labels
Description.Texts={
	["untitled gui"]="untitled gui",
	["MAIN"]="Main",
	["MAPS"]="Maps",
	["SERVER"]="Server",
	["CUSTOMIZE"]="Customize",
	["KEYBINDS"]="Keybinds",
	["SETTINGS"]="Settings",
	["RESET"]="RESET",
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
	["Hitbox Toggle"]="Hitbox toggle",
	["HITBOX SIZE"]="Size (X, Y, Z)",
	["TRANSPARENCY"]="Transparency",
	["Force Speed"]="Force speed",
	["Jump Boost"]="Jump Boost",
	["Always Boost"]="ALWAYS Boost",
	["ESP"]="ESP",
	["Enabled"]="QB Aim",
	["Team Filter"]="Filter Team",
	["Show Arc"]="Aimbot Arc",
	["LD"]="Lead Adjust",
	["SR"]="Stamina Regeneration",
	["SD"]="Stamina Depletion",
	["SmoothPlastic"]="Smooth plastic",
	["Map Cleaner"]="Map cleaner",
	["Remove Ads"]="Remove ads",
	["Gradient Stroke"]="Gradient stroke",
	["Pulse Accent"]="Pulse Accent",
	["Cloud Profile"]="Data Status",
	["READY"]="READY",
	["BUSY"]="BUSY",
	["WIPE DATA"]="WIPE",
	["Saved settings and owned presets are available."]=EMPTY,
	["Loading invite link..."]="Loading invite link...",
	["Fetching invite link..."]="Fetching invite link...",
	["No invite link set."]="No invite link set.",
	["Click to Copy"]="Click to Copy",
	["Copied"]="Copied",
	["Toggle open / hide GUI"]="Open/Hide GUI",
	["Jump Boost Toggle"]="Jump Boost",
	["Always Boost Toggle"]="Always Boost",
	["ESP Toggle"]="ESP",
	["Speed Toggle"]="Speed",
	["QB Aim Lock Receiver"]="Select Receiver",
	["QB Aim Throw"]="Throw Selected Receiver",
	["QB Aim Toggle"]="Aimbot",
	["SAVE PRESET"]="SAVE",
	["No saved presets yet."]="No saved presets yet.",
	["Name this preset"]="Name Preset:",
	["Preset name"]="Preset Name",
	["Save current preset?"]="Save current preset?",
	["This saves the preset to your owned preset list."]="This saves the preset to your owned preset list.",
	["CANCEL"]="CANCEL",
	["SAVE"]="SAVE",
	["YES"]="YES",
	["NO"]="NO",
	["EQUIP"]="Equip",
	["DELETE"]="Delete",
	["NIL"]="EMPTY",
	["PRESS..."]="PRESS...",
	["Off"]="Off",
	["Disabled"]="Disabled",
	["Target: none"]="Target: none",
	["A"]="Alpha",
	["G"]="Gravity",
	["S"]="Speed",
	["J"]="Jump",
	["D"]="Dive",
	["F"]="Force",
	["C"]="Chance",
	["R"]="Radius",
	["R2"]="Red",
	["G2"]="Green",
	["B2"]="Blue",
	["PR"]="Primary red",
	["PG"]="Primary green",
	["PB"]="Primary blue",
	["X"]="X size",
	["Y"]="Y size",
	["Z"]="Z size",
}

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
