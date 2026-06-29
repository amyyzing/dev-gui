-- central page/category labels so the loader and panel say the same thing.

local EMPTY=""

local Description={}

Description.Categories={
	Main={
		Title="Control Panel",
		Description=EMPTY,
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
		Main=EMPTY,
		Maps=EMPTY,
		Server=EMPTY,
		Customize=EMPTY,
		Keybinds=EMPTY,
		Settings=EMPTY,
	},

	Sections={
		Main={
			["Hitbox"]={Title="HITBOX",Description=EMPTY},
			["Game Params"]={Title="PARAMS",Description=EMPTY},
			["Boost"]={Title="AUTO BOOST",Description=EMPTY},
			["ESP"]={Title="ESP",Description=EMPTY},
			["QB Aim"]={Title="QB AIM",Description=EMPTY},
			["Testing"]={Title="TESTING",Description=EMPTY},
		},

		Maps={
			["Map Editor"]={Title="MAP EDITOR",Description=EMPTY},
			["Anti Material"]={Title="ANTI-MATERIAL",Description=EMPTY},
			["Map Cleaner"]={Title="MAP CLEANER",Description=EMPTY},
			["Remove Ads"]={Title="REMOVE BILLBOARD",Description=EMPTY},
			["Workspace"]={Title="WORKSPACE",Description=EMPTY},
		},

		Customize={
			["Customisation"]={Title="CUSTOMIZATION",Description=EMPTY},
			["Colours"]={Title="COLORS",Description=EMPTY},
			["Primary Colours"]={Title="PRIMARY COLOURS",Description=EMPTY},
			["Secondary Colours"]={Title="SECONDARY COLOURS",Description=EMPTY},
			["Pulse Accent"]={Title="STROKE PATTERN",Description=EMPTY},
			["Border Shape"]={Title="BORDER",Description=EMPTY},
			["Stroke Colour"]={Title="STROKE",Description=EMPTY},
		},

		Keybinds={
			["Hitbox Presets"]={Title="PRESETS",Description=EMPTY},
			["Preset Editor"]={Title="SET EDITOR",Description=EMPTY},
			["Keybind Settings"]={Title="KEYBINDS",Description=EMPTY},
		},

		Settings={
			["Update"]={Title="UPDATE",Description=EMPTY},
			["Player Data"]={Title="PLAYER DATA",Description=EMPTY},
			["Discord"]={Title="COMMUNITY",Description=EMPTY},
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

		Hitbox={
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

		GameParams={
			["SR"]="stamina regen",
			["SD"]="stamina drain",
			["J"]="jump",
			["D"]="dive",
		},

		Boost={
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

		ESP={
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
			["QB XZ Drift"]="xyz drift",
			["QB Y Drift"]="xyz drift",
			["XYZ Drift"]="xyz drift",
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

		Testing={
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

		PlayerData={
			["Cloud Profile"]="data",
			["READY"]="ready",
			["BUSY"]="busy",
			["WIPE DATA"]="wipe",
			["WIPE"]="wipe",
			["Wipe your data?"]="wipe data?",
			["This WILL delete your data across all gamemodes. Continue?"]="this deletes all saved gui data",
			["Wiping player data..."]="wiping...",
			["Player data wiped."]="data wiped",
			["Saved settings and owned presets are available."]=EMPTY,
		},

		Discord={
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
