-- Sakura

local env = (getfenv and getfenv()) or _G
local designTokens = rawget(env, "DesignTokens") or rawget(env, "DesignTokensModule")

if not designTokens and script and script.Parent and script.Parent.Parent then
	designTokens = require(script.Parent.Parent.tokens)
end

assert(designTokens, "DesignTokens must load before sakura theme")

return {
	id = "sakura",
	name = "Sakura",
	values = {
		[designTokens.Color.Surface.Window] = Color3.fromRGB(43, 3, 33),
		[designTokens.Color.Surface.Panel] = Color3.fromRGB(72, 25, 58),
		[designTokens.Color.Surface.Section] = Color3.fromRGB(86, 38, 70),
		[designTokens.Color.Surface.Control] = Color3.fromRGB(56, 16, 45),

		[designTokens.Color.Accent.Primary] = Color3.fromRGB(215, 136, 236),
		[designTokens.Color.Accent.Hover] = Color3.fromRGB(232, 168, 246),
		[designTokens.Color.Accent.Pressed] = Color3.fromRGB(184, 93, 207),

		[designTokens.Color.Stroke.Normal] = Color3.fromRGB(215, 136, 236),
		[designTokens.Color.Stroke.Soft] = Color3.fromRGB(106, 55, 91),
		[designTokens.Color.Stroke.Focus] = Color3.fromRGB(232, 168, 246),
	},
}
