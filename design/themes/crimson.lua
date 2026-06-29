-- crimson theme colors.

local env = (getfenv and getfenv()) or _G
local designTokens = rawget(env, "DesignTokens") or rawget(env, "DesignTokensModule")

if not designTokens and script and script.Parent and script.Parent.Parent then
	designTokens = require(script.Parent.Parent.tokens)
end

assert(designTokens, "DesignTokens must load before crimson theme")

return {
	id = "crimson",
	name = "Crimson",
	values = {
		[designTokens.Color.Surface.Window] = Color3.fromRGB(77, 13, 22),
		[designTokens.Color.Surface.Panel] = Color3.fromRGB(92, 43, 50),
		[designTokens.Color.Surface.Section] = Color3.fromRGB(96, 49, 56),
		[designTokens.Color.Surface.Control] = Color3.fromRGB(82, 27, 37),

		[designTokens.Color.Accent.Primary] = Color3.fromRGB(175, 47, 62),
		[designTokens.Color.Accent.Hover] = Color3.fromRGB(205, 66, 82),
		[designTokens.Color.Accent.Pressed] = Color3.fromRGB(135, 31, 45),

		[designTokens.Color.Stroke.Normal] = Color3.fromRGB(196, 93, 107),
		[designTokens.Color.Stroke.Soft] = Color3.fromRGB(112, 48, 58),
		[designTokens.Color.Stroke.Focus] = Color3.fromRGB(217, 84, 100),
	},
}
