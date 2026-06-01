local EMPTY="[EMPTY TEXT]"

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
	["Game Params"]={Title="PARAMS",Description="Your Athleticism Setting..."},
	["Boost"]={Title="AUTO BOOST",Description="Configure your boost"},
	["ESP"]={Title="ESP",Description="WR/DB coverage esp, self-explanatory for league players"},
	["QB Aim"]={Title="QB AIMBOT",Description="bad aim lol"},

-- Page 2 categories
	["Map Editor"]={Title="MAP EDITOR",Description="Change the map how you want!"},
	["Anti Material"]={Title="ANTI-MATERIAL",Description="Get rid of materials"},
	["Map Cleaner"]={Title="MAP CLEANER",Description="Remove the large chunk of the map you'll never touch under the field"},
	["Remove Ads"]={Title="REMOVE BILLBOARD",Description="Remove the ad billboard. I KNOW your pain"},
	["Workspace"]={Title="Hi" ,Description="IDK"},

-- Page 4 categories
	["Customisation"]={Title="CUSTOMIZATION",Description="Customize your GUI here"},
	["Colours"]={Title="COLORS",Description="Precise customization of GUI color"},
	["Pulse Accent"]={Title="STROKE PATTERN",Description="Some stuff that moves around in your GUI secondary."},
	["Border Shape"]={Title="BORDER",Description="Your Border Thing"},
	["Stroke Colour"]={Title="STROKE",Description="Change stroke in GUI"},

-- Page 5 categories
	["Hitbox Presets"]={Title="PRESETS",Description="Your saved presets hitbox presets here"},
	["Preset Editor"]={Title="SET EDITOR",Description="Edit sets here"},
	["Keybind Settings"]={Title="KEYBINDS",Description="Change your keybinds here. There ARE a lot of things. Get used to it!"},

-- Page 6 categories
	["Player Data"]={Title="WIPE DATA",Description="Yes. Self explanatory. Applies to all gamemodes."},
	["Discord"]={Title="SOCIALS",Description="Idk.. just discord atm :)"},
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
	["untitled gui"]=EMPTY,
	["MAIN"]=EMPTY,
	["MAPS"]=EMPTY,
	["SERVER"]=EMPTY,
	["CUSTOMIZE"]=EMPTY,
	["KEYBINDS"]=EMPTY,
	["SETTINGS"]=EMPTY,
	["RESET"]=EMPTY,
	["PREVIEW"]=EMPTY,
	["Live preview"]="Color Preview",
	["Quick colours"]="Normal Color Presets",
	["Main stroke colour"]="Primary Color",
	["Gradient end colour"]="Secondary Color",
	["Gradient presets"]="Gradient Preset",
	["Weight and opacity"]="Stuff?",
	["Hitbox Toggle"]="Hitbox Changer",
	["HITBOX SIZE"]="Size (X, Y, Z)",
	["TRANSPARENCY"]="Transparency,
	["Force Speed"]="Toggle Speed",
	["+12 Stam / -8 Stam"]=EMPTY,
	["Jump Boost"]="Enable Boost",
	["Always Boost"]="ALWAYS Boost",
	["ESP"]="Toggle ESP",
	["Enabled"]="IDK DUDE",
	["Team Filter"]="Filter Team",
	["Show Arc"]="Aimbot Arc",
	["LD"]="Lead Adjust",
	["SR"]="Stamina Regeneration",
	["SD"]="Stamina Depletion",
	["SmoothPlastic"]="Enable",
	["Map Cleaner"]="Enable",
	["Remove Ads"]="Enable",
	["Gradient Stroke"]="Enable",
	["Pulse Accent"]="Enable",
	["Cloud Profile"]="Data Status",
	["READY"]="READY",
	["BUSY"]="BUSY",
	["WIPE DATA"]="WIPE",
	["Saved settings and owned presets are available."]="You sure...?",
	["Loading invite link..."]="Loading invite link...",
	["Fetching invite link..."]="Fetching invite link...",
	["No invite link set."]="No invite link set.",
	["Click to Copy"]="Click to Copy",
	["Copied"]="Copied Link",
	["Toggle open / hide GUI"]="Open/Hide GUI",
	["Hitbox Toggle"]="Hitbox",
	["Jump Boost Toggle"]="Jump Boost",
	["Always Boost Toggle"]="Always Boost,
	["ESP Toggle"]="ESP",
	["Speed Toggle"]="Speed,
	["QB Aim Lock Receiver"]="Select Receiver",
	["QB Aim Throw"]="Throw Selected Receiver",
	["QB Aim Toggle"]="Aimbot",
	["SAVE PRESET"]="SAVE",
	["No saved presets yet."]="*cricket noises*",
	["Name this preset"]="Name Preset:",
	["Preset name"]="Preset Name",
	["Save current preset?"]="Save ts?",
	["This saves the preset to your owned preset list."]="This is going to your saved presets",
	["CANCEL"]="CANCEL",
	["SAVE"]="SAVE",
	["YES"]="YE",
	["NO"]="WE G",
	["EQUIP"]="Equip",
	["DELETE"]="Delete",
	["NIL"]="EMPTY",
	["PRESS..."]="WHAT?",
	["Off"]="Off",
	["Disabled"]="Disabled",
	["Target: none"]="WHO?",
	["A"]=EMPTY,
	["G"]=EMPTY,
	["S"]=EMPTY,
	["J"]=EMPTY,
	["D"]=EMPTY,
	["F"]=EMPTY,
	["C"]=EMPTY,
	["R"]=EMPTY,
	["R2"]=EMPTY,
	["G2"]=EMPTY,
	["B2"]=EMPTY,
	["X"]=EMPTY,
	["Y"]=EMPTY,
	["Z"]=EMPTY,
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
