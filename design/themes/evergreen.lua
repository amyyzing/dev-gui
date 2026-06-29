-- evergreen theme colors.

local env = (getfenv and getfenv()) or _G
local designTokens = rawget(env, "DesignTokens") or rawget(env, "DesignTokensModule")

if not designTokens and script and script.Parent and script.Parent.Parent then
	designTokens = require(script.Parent.Parent.tokens)
end

assert(designTokens, "DesignTokens must load before evergreen theme")

return {
	id = "evergreen",
	name = "Evergreen",
	values = {
		[designTokens.Color.Surface.Window] = Color3.fromRGB(18, 36, 34),
		[designTokens.Color.Surface.Panel] = Color3.fromRGB(28, 49, 45),
		[designTokens.Color.Surface.Section] = Color3.fromRGB(36, 61, 55),
		[designTokens.Color.Surface.Control] = Color3.fromRGB(20, 42, 38),

		[designTokens.Color.Accent.Primary] = Color3.fromRGB(45, 112, 78),
		[designTokens.Color.Accent.Hover] = Color3.fromRGB(59, 143, 101),
		[designTokens.Color.Accent.Pressed] = Color3.fromRGB(34, 88, 61),

		[designTokens.Color.Stroke.Normal] = Color3.fromRGB(45, 112, 78),
		[designTokens.Color.Stroke.Soft] = Color3.fromRGB(42, 77, 67),
		[designTokens.Color.Stroke.Focus] = Color3.fromRGB(59, 143, 101),
	},
}
