-- light theme colors.

local env = (getfenv and getfenv()) or _G
local Tokens = rawget(env, "DesignTokens") or rawget(env, "DesignTokensModule")

if not Tokens and script and script.Parent and script.Parent.Parent then
	Tokens = require(script.Parent.Parent.tokens)
end

assert(Tokens, "DesignTokens must load before light theme")

return {
	id = "light",
	name = "Light",
	values = {
		[Tokens.Color.Surface.Window] = Color3.fromRGB(238, 238, 238),
		[Tokens.Color.Surface.Panel] = Color3.fromRGB(230, 230, 230),
		[Tokens.Color.Surface.Section] = Color3.fromRGB(244, 244, 244),
		[Tokens.Color.Surface.Control] = Color3.fromRGB(222, 222, 222),

		[Tokens.Color.Accent.Primary] = Color3.fromRGB(60, 60, 60),
		[Tokens.Color.Accent.Hover] = Color3.fromRGB(20, 20, 20),
		[Tokens.Color.Accent.Pressed] = Color3.fromRGB(90, 90, 90),

		[Tokens.Color.Stroke.Normal] = Color3.fromRGB(60, 60, 60),
		[Tokens.Color.Stroke.Soft] = Color3.fromRGB(188, 188, 188),
		[Tokens.Color.Stroke.Focus] = Color3.fromRGB(60, 60, 60),
	},
}
