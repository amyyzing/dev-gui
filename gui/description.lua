local EMPTY="[EMPTY TEXT]"

local Description={}

-- Main frame
Description.Main={
	Title=EMPTY,
	Description=EMPTY,
	LoadedSuffix=EMPTY,
}

-- Page labels
Description.Pages={
	Main=EMPTY,
	Maps=EMPTY,
	Server=EMPTY,
	Customize=EMPTY,
	Keybinds=EMPTY,
	Settings=EMPTY,
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
	["Hitbox"]={Title=EMPTY,Description=EMPTY},
	["Gravity"]={Title=EMPTY,Description=EMPTY},
	["Speed"]={Title=EMPTY,Description=EMPTY},
	["Game Params"]={Title=EMPTY,Description=EMPTY},
	["Boost"]={Title=EMPTY,Description=EMPTY},
	["ESP"]={Title=EMPTY,Description=EMPTY},
	["QB Aim"]={Title=EMPTY,Description=EMPTY},

-- Page 2 categories
	["Map Editor"]={Title=EMPTY,Description=EMPTY},
	["Anti Material"]={Title=EMPTY,Description=EMPTY},
	["Map Cleaner"]={Title=EMPTY,Description=EMPTY},
	["Remove Ads"]={Title=EMPTY,Description=EMPTY},
	["Workspace"]={Title=EMPTY,Description=EMPTY},

-- Page 4 categories
	["Customisation"]={Title=EMPTY,Description=EMPTY},
	["Colours"]={Title=EMPTY,Description=EMPTY},
	["Pulse Accent"]={Title=EMPTY,Description=EMPTY},
	["Border Shape"]={Title=EMPTY,Description=EMPTY},
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

return Description
