local Tokens = require(script.Parent.tokens)

local Resolver = {}

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
	local surface = values[Tokens.Color.Surface.Window] or Color3.fromRGB(12, 12, 12)
	local lum = luminance(surface)

	if lum > 0.72 then
		values[Tokens.Color.Text.Primary] = Color3.fromRGB(12, 12, 12)
		values[Tokens.Color.Text.Muted] = Color3.fromRGB(76, 76, 76)
		values[Tokens.Color.Text.Inverse] = Color3.fromRGB(245, 245, 245)
	else
		values[Tokens.Color.Text.Primary] = Color3.fromRGB(245, 245, 245)
		values[Tokens.Color.Text.Muted] = Color3.fromRGB(184, 184, 184)
		values[Tokens.Color.Text.Inverse] = Color3.fromRGB(12, 12, 12)
	end

	values[Tokens.Color.Text.Danger] = values[Tokens.Color.Text.Danger] or Color3.fromRGB(254, 94, 86)
	values[Tokens.Color.Text.Success] = values[Tokens.Color.Text.Success] or values[Tokens.Color.Accent.Primary]
end

function Resolver.resolve(theme, overrides)
	assert(type(theme) == "table", "Theme must be a table")

	local values = clone(Tokens.Defaults)

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

return Resolver
