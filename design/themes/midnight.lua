-- midnight theme colors.

local env = (getfenv and getfenv()) or _G
local designTokens = rawget(env, "DesignTokens") or rawget(env, "DesignTokensModule")

if not designTokens and script and script.Parent and script.Parent.Parent then
	designTokens = require(script.Parent.Parent.tokens)
end

assert(designTokens, "DesignTokens must load before midnight theme")

return {
	id = "midnight",
	name = "Midnight",
	values = {
		[designTokens.Color.Surface.Window] = Color3.fromRGB(12, 18, 38),
		[designTokens.Color.Surface.Panel] = Color3.fromRGB(24, 31, 56),
		[designTokens.Color.Surface.Section] = Color3.fromRGB(35, 43, 70),
		[designTokens.Color.Surface.Control] = Color3.fromRGB(22, 27, 50),

		[designTokens.Color.Accent.Primary] = Color3.fromRGB(72, 98, 158),
		[designTokens.Color.Accent.Hover] = Color3.fromRGB(93, 124, 190),
		[designTokens.Color.Accent.Pressed] = Color3.fromRGB(52, 74, 124),

		[designTokens.Color.Stroke.Normal] = Color3.fromRGB(72, 98, 158),
		[designTokens.Color.Stroke.Soft] = Color3.fromRGB(45, 55, 86),
		[designTokens.Color.Stroke.Focus] = Color3.fromRGB(93, 124, 190),
	},
}
