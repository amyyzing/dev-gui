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
	["ESP"]={"ESP"=EMPTY,Description="WR/DB coverage esp, self-explanatory for league players"},
	["QB Aim"]={Title="QB AIMBOT",Description="bad aim lol"},

-- Page 2 categories
	["Map Editor"]={Title="Map Editor",Description="Change the map how you want!"},
	["Anti Material"]={Title="Anti-Material",Description="Get rid of materials"},
	["Map Cleaner"]={Title="Map Cleaner",Description="Remove the large chunk of the map you'll never touch under the field"},
	["Remove Ads"]={Title="Billboard Remove",Description="Remove the ad billboard. I KNOW your pain"},
	["Workspace"]={Title="Hi" ,Description="IDK"},

-- Page 4 categories
	["Customisation"]={Title="Customization",Description="Customize your GUI here"},
	["Colours"]={Title="Colors",Description="Precise customization of GUI color"},
	["Pulse Accent"]={Title="Stroke Customization",Description="Some stuff that moves around in your GUI secondary."},
	["Border Shape"]={Title="Border",Description="Your Border Thing"},
	["Stroke Colour"]={Title=EMPTY,Description=EMPTY},

-- Page 5 categories
	["Hitbox Presets"]={Title=EMPTY,Description=EMPTY},
	["Preset Editor"]={Title=EMPTY,Description=EMPTY},
	["Keybind Settings"]={Title=EMPTY,Description=EMPTY},

-- Page 6 categories
	["Player Data"]={Title=EMPTY,Description=EMPTY},
	["Discord"]={Title=EMPTY,Description=EMPTY},
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
	["Live preview"]=EMPTY,
	["Quick colours"]=EMPTY,
	["Main stroke colour"]=EMPTY,
	["Gradient end colour"]=EMPTY,
	["Gradient presets"]=EMPTY,
	["Weight and opacity"]=EMPTY,
	["Hitbox Toggle"]=EMPTY,
	["HITBOX SIZE"]=EMPTY,
	["TRANSPARENCY"]=EMPTY,
	["Force Speed"]=EMPTY,
	["+12 Stam / -8 Stam"]=EMPTY,
	["Jump Boost"]=EMPTY,
	["Always Boost"]=EMPTY,
	["ESP"]=EMPTY,
	["Enabled"]=EMPTY,
	["Team Filter"]=EMPTY,
	["Show Arc"]=EMPTY,
	["LD"]=EMPTY,
	["SR"]=EMPTY,
	["SD"]=EMPTY,
	["SmoothPlastic"]=EMPTY,
	["Map Cleaner"]=EMPTY,
	["Remove Ads"]=EMPTY,
	["Gradient Stroke"]=EMPTY,
	["Pulse Accent"]=EMPTY,
	["Cloud Profile"]=EMPTY,
	["READY"]=EMPTY,
	["BUSY"]=EMPTY,
	["WIPE DATA"]=EMPTY,
	["Saved settings and owned presets are available."]=EMPTY,
	["Loading invite link..."]=EMPTY,
	["Fetching invite link..."]=EMPTY,
	["No invite link set."]=EMPTY,
	["Click to Copy"]=EMPTY,
	["Copied"]=EMPTY,
	["Toggle open / hide GUI"]=EMPTY,
	["Hitbox Toggle"]=EMPTY,
	["Jump Boost Toggle"]=EMPTY,
	["Always Boost Toggle"]=EMPTY,
	["ESP Toggle"]=EMPTY,
	["Speed Toggle"]=EMPTY,
	["QB Aim Lock Receiver"]=EMPTY,
	["QB Aim Throw"]=EMPTY,
	["QB Aim Toggle"]=EMPTY,
	["SAVE PRESET"]=EMPTY,
	["No saved presets yet."]=EMPTY,
	["Name this preset"]=EMPTY,
	["Preset name"]=EMPTY,
	["Save current preset?"]=EMPTY,
	["This saves the preset to your owned preset list."]=EMPTY,
	["CANCEL"]=EMPTY,
	["SAVE"]=EMPTY,
	["YES"]=EMPTY,
	["NO"]=EMPTY,
	["EQUIP"]=EMPTY,
	["DELETE"]=EMPTY,
	["NIL"]=EMPTY,
	["PRESS..."]=EMPTY,
	["Off"]=EMPTY,
	["Disabled"]=EMPTY,
	["Target: none"]=EMPTY,
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
