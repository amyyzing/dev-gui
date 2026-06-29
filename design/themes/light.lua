local env = (getfenv and getfenv()) or _G
local designTokens = rawget(env, "DesignTokens") or rawget(env, "DesignTokensModule")

if not designTokens and script and script.Parent and script.Parent.Parent then
	designTokens = require(script.Parent.Parent.tokens)
end

assert(designTokens, "DesignTokens must load before light theme")

return {
	id = "light",
	name = "Light",
	values = {
		[designTokens.Color.Surface.Window] = Color3.fromRGB(238, 238, 238),
		[designTokens.Color.Surface.Panel] = Color3.fromRGB(230, 230, 230),
		[designTokens.Color.Surface.Section] = Color3.fromRGB(244, 244, 244),
		[designTokens.Color.Surface.Control] = Color3.fromRGB(222, 222, 222),

		[designTokens.Color.Accent.Primary] = Color3.fromRGB(60, 60, 60),
		[designTokens.Color.Accent.Hover] = Color3.fromRGB(20, 20, 20),
		[designTokens.Color.Accent.Pressed] = Color3.fromRGB(90, 90, 90),

		[designTokens.Color.Stroke.Normal] = Color3.fromRGB(60, 60, 60),
		[designTokens.Color.Stroke.Soft] = Color3.fromRGB(188, 188, 188),
		[designTokens.Color.Stroke.Focus] = Color3.fromRGB(60, 60, 60),
	},
}
