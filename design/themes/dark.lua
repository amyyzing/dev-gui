-- Dark

local env = (getfenv and getfenv()) or _G
local designTokens = rawget(env, "DesignTokens") or rawget(env, "DesignTokensModule")

if not designTokens and script and script.Parent and script.Parent.Parent then
	designTokens = require(script.Parent.Parent.tokens)
end

assert(designTokens, "DesignTokens must load before dark theme")

return {
	id = "dark",
	name = "Dark",
	values = {
		[designTokens.Color.Surface.Window] = Color3.fromRGB(12, 12, 12),
		[designTokens.Color.Surface.Panel] = Color3.fromRGB(24, 24, 24),
		[designTokens.Color.Surface.Section] = Color3.fromRGB(31, 31, 31),
		[designTokens.Color.Surface.Control] = Color3.fromRGB(22, 22, 22),

		[designTokens.Color.Accent.Primary] = Color3.fromRGB(32, 202, 106),
		[designTokens.Color.Accent.Hover] = Color3.fromRGB(46, 219, 125),
		[designTokens.Color.Accent.Pressed] = Color3.fromRGB(24, 170, 88),

		[designTokens.Color.Stroke.Normal] = Color3.fromRGB(182, 180, 180),
		[designTokens.Color.Stroke.Soft] = Color3.fromRGB(82, 82, 82),
		[designTokens.Color.Stroke.Focus] = Color3.fromRGB(32, 202, 106),
	},
}
