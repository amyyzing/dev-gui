local env = (getfenv and getfenv()) or _G
local designTokens = rawget(env, "DesignTokens") or rawget(env, "DesignTokensModule")

if not designTokens and script and script.Parent then
	designTokens = require(script.Parent.tokens)
end

assert(designTokens, "DesignTokens must load before DesignThemeResolver")

local themeResolver = {}

local function luminance(color)
	return 0.2126 * color.R + 0.7152 * color.G + 0.0722 * color.B
end

local function clone(source)
	local result = {}

	for key, value in pairs(source or {}) do
		result[key] = value
	end

	return result
end

local function resolveText(values)
	local surface = values[designTokens.Color.Surface.Window] or Color3.fromRGB(12, 12, 12)
	local lum = luminance(surface)

	if lum > 0.72 then
		values[designTokens.Color.Text.Primary] = Color3.fromRGB(12, 12, 12)
		values[designTokens.Color.Text.Muted] = Color3.fromRGB(76, 76, 76)
		values[designTokens.Color.Text.Inverse] = Color3.fromRGB(245, 245, 245)
	else
		values[designTokens.Color.Text.Primary] = Color3.fromRGB(245, 245, 245)
		values[designTokens.Color.Text.Muted] = Color3.fromRGB(184, 184, 184)
		values[designTokens.Color.Text.Inverse] = Color3.fromRGB(12, 12, 12)
	end

	values[designTokens.Color.Text.Danger] = values[designTokens.Color.Text.Danger] or Color3.fromRGB(254, 94, 86)
	values[designTokens.Color.Text.Success] = values[designTokens.Color.Text.Success] or values[designTokens.Color.Accent.Primary]
end

function themeResolver.resolve(theme, overrides)
	assert(type(theme) == "table", "Theme must be a table")

	local values = clone(designTokens.Defaults)

	for token, value in pairs(theme.values or {}) do
		values[token] = value
	end

	for token, value in pairs(overrides or {}) do
		values[token] = value
	end

	resolveText(values)

	return {
		id = theme.id,
		name = theme.name,
		values = values,
		get = function(_, token)
			return values[token]
		end,
	}
end

return themeResolver
