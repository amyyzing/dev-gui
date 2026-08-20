-- Just the descriptions
local blank=""

local description={}

description.Categories={
	Main={
		Title="untitled gui",
		description=blank,
		LoadedSuffix=blank,
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
		Main=blank,
		Maps=blank,
		Server=blank,
		Customize=blank,
		Keybinds=blank,
		Settings=blank,
	},

	Sections={
		Main={
			["Hitbox"]={Title="HITBOX",description=blank},
			["Game Params"]={Title="PARAMS",description=blank},
			["Boost"]={Title="AUTO BOOST",description=blank},
			["ESP"]={Title="ESP",description=blank},
			["QB Aim"]={Title="QB AIM",description=blank},
			["Testing"]={Title="TESTING",description=blank},
		},

		Maps={
			["Map Editor"]={Title="MAP EDITOR",description=blank},
			["Anti Material"]={Title="ANTI-MATERIAL",description=blank},
			["Map Cleaner"]={Title="MAP CLEANER",description=blank},
			["Remove Ads"]={Title="REMOVE BILLBOARD",description=blank},
			["Workspace"]={Title="WORKSPACE",description=blank},
		},

		Customize={
			["Customisation"]={Title="CUSTOMIZATION",description=blank},
			["Colours"]={Title="COLORS",description=blank},
			["Primary Colours"]={Title="PRIMARY COLOURS",description=blank},
			["Secondary Colours"]={Title="SECONDARY COLOURS",description=blank},
			["Pulse Accent"]={Title="STROKE PATTERN",description=blank},
			["Border Shape"]={Title="BORDER",description=blank},
			["Colors"]={Title="COLORS",description=blank},
		},

		Keybinds={
			["Hitbox Presets"]={Title="PRESETS",description=blank},
			["Preset Editor"]={Title="SET EDITOR",description=blank},
			["Keybind Settings"]={Title="KEYBINDS",description=blank},
		},

		Settings={
			["Update"]={Title="UPDATE",description=blank},
			["Player Data"]={Title="PLAYER DATA",description=blank},
			["Discord"]={Title="COMMUNITY",description=blank},
		},
	},

	Labels={
		actionStatus=blank,
		reset=blank,
		ready=blank,
		busy=blank,
	},

	Text={
		mainFrame={
			["untitled gui"]="untitled gui",
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
			["Loading GUI"]="loading gui",
			["Preparing remote modules..."]="loading modules...",
			["Loading..."]="loading...",
			["Closing... encountered error"]="close had an error",
			["Auto-refresh failed."]="auto refresh failed",
		},

		Common={
			["ACTION"]="action",
			["CANCEL"]="cancel",
			["SAVE"]="save",
			["UPDATE GUI"]="update gui",
			["UPDATING..."]="updating",
			["UPDATE FAILED"]="update failed",
			["YES"]="yes",
			["NO"]="no",
			["DELETE"]="delete",
			["EQUIP"]="equip",
			["NIL"]="empty",
			["PRESS..."]="press...",
			["Off"]="off",
			["Disabled"]="off",
		},

		hitbox={
			["Hitbox Toggle"]="hitbox",
			["HITBOX SIZE"]="size",
			["TRANSPARENCY"]="transparency",
			["X"]="x",
			["Y"]="y",
			["Z"]="z",
			["A"]="alpha",
		},

		Movement={
			["G"]="gravity",
			["S"]="speed",
			["Force Speed"]="speed",
		},

		gameParams={
			["SR"]="stamina regen",
			["SD"]="stamina drain",
			["J"]="jump",
			["D"]="dive",
		},

		boost={
			["Jump Boost"]="boost",
			["Always Boost"]="always",
			["Jump Boost Toggle"]="boost",
			["Always Boost Toggle"]="always",
			["F"]="force",
			["C"]="chance",
			["R"]="radius",
			["Force"]="force",
			["Chance"]="chance",
			["Radius"]="radius",
		},

		esp={
			["ESP"]="ESP",
			["ESP Toggle"]="ESP",
			["Gameplay only"]="game only",
			["Offense possession"]="Offense possession",
			["Defense active"]="Defense active",
		},

		QBAim={
			["Enabled"]="qb aim",
			["Team Filter"]="team",
			["Show Arc"]="arc",
			["Safe Arc"]="safe arc",
			["Target Highlight"]="highlight",
			["Lead Adjust"]="lead",
			["Peak Height"]="peak",
			["Throw Delay"]="throw delay",
			["QB Aim Lock Receiver"]="pick wr",
			["QB Aim Throw"]="throw",
			["QB Aim Toggle"]="aimbot",
			["Throw already in progress"]="already throwing",
			["Unsafe throw blocked"]="not safe",
			["no ball"]="no ball",
			["throw failed"]="throw failed",
			["game remote missing"]="game remote missing",
			["squads remote missing"]="squads remote missing",
			["receiver tracking missing"]="wr not tracked",
		},

		testing={
			["Testing"]="Testing",
			["incoming C1 capture"]="c1",
			["WR C1 and QB arc safety"]="c1",
			["WR"]="WR",
			["QB"]="QB",
			["Off"]="Off",
		},

		Maps={
			["SmoothPlastic"]="smooth",
			["Map Cleaner"]="map cleaner",
			["Remove Ads"]="remove ads",
			["Gameplay only."]="game only",
			["Ads folder not found."]="no ads folder",
			["Ads restored."]="ads back",
			["Map objects restored."]="map back",
		},

		Customize={
			["PREVIEW"]="preview",
			["Live preview"]="preview",
			["Primary Colours"]="primary",
			["Secondary Colours"]="secondary",
			["Primary colour"]="primary",
			["Primary red"]="red",
			["Primary green"]="green",
			["Primary blue"]="blue",
			["Quick colours"]="presets",
			["Main stroke colour"]="stroke",
			["Gradient end colour"]="gradient",
			["Gradient presets"]="gradient",
			["Weight and opacity"]="size",
			["Main red"]="red",
			["Main green"]="green",
			["Main blue"]="blue",
			["Gradient red"]="red",
			["Gradient green"]="green",
			["Gradient blue"]="blue",
			["Pulse speed"]="speed",
			["Stroke thickness"]="thickness",
			["Stroke transparency"]="transparency",
			["Gradient Stroke"]="gradient",
			["Pulse Accent"]="pulse",
			["Primary colour module missing."]="primary colour missing",
			["Secondary colour module missing."]="secondary colour missing",
		},

		Presets={
			["SAVE PRESET"]="save",
			["No saved presets yet."]="no presets",
			["Name this preset"]="name",
			["Preset name"]="name",
			["Save current preset?"]="save this?",
			["This saves the preset to your owned preset list."]="it saves this preset",
		},

		Keybinds={
			["Toggle open / hide GUI"]="open gui",
		},

		playerData={
			["Cloud Profile"]="data",
			["READY"]="ready",
			["BUSY"]="busy",
			["WIPE DATA"]="wipe",
			["WIPE"]="wipe",
			["Wipe your data?"]="wipe data?",
			["This WILL delete your data across all gamemodes. Continue?"]="this deletes all saved gui data",
			["Wiping player data..."]="wiping...",
			["Player data wiped."]="data wiped",
			["Saved settings and owned presets are available."]=blank,
		},

		discord={
			["Loading invite link..."]="loading invite...",
			["Fetching invite link..."]="getting invite...",
			["No invite link set."]="no invite link set",
			["Click to Copy"]="copy",
			["Copied"]="copied",
			["Click the invite link to copy it."]="click to copy",
			["Use /invite-link create in Discord to set this."]="no invite yet",
			["No Discord invite link has been set."]="no invite yet",
			["Clipboard is not available in this executor."]="clipboard not here",
			["Copied Discord invite link."]="copied",
			["Could not fetch Discord invite link."]="invite failed",
		},
	},
}

description.Main=description.Categories.Main
description.Pages=description.Categories.Pages
description.PageDescriptions=description.Categories.PageDescriptions
description.Labels=description.Categories.Labels
description.Sections={}
description.Texts={}

local function mergeSections(group)
	for key,value in pairs(group) do
		if type(value)=="table" and (value.Title~=nil or value.Description~=nil) then
			description.Sections[key]=value
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
			description.Texts[key]=value
		end
	end
end

mergeSections(description.Categories.Sections)
mergeTexts(description.Categories.Text)

function description.Get(path,fallback)
	local value=description
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

function description.Section(title,subtitle)
	local item=description.Sections[tostring(title or "")]
	if type(item)~="table" then
		return title,subtitle
	end

	return item.Title or title,item.Description or subtitle
end

function description.Text(raw)
	if type(raw)~="string" then
		return raw
	end

	local mapped=description.Texts[raw]
	if mapped~=nil then
		return mapped
	end

	return raw
end

return description
