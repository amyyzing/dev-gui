-- midnight theme colors.

local env = (getfenv and getfenv()) or _G
local Tokens = rawget(env, "DesignTokens") or rawget(env, "DesignTokensModule")

if not Tokens and script and script.Parent and script.Parent.Parent then
	Tokens = require(script.Parent.Parent.tokens)
end

assert(Tokens, "DesignTokens must load before midnight theme")

return {
	id = "midnight",
	name = "Midnight",
	values = {
		[Tokens.Color.Surface.Window] = Color3.fromRGB(12, 18, 38),
		[Tokens.Color.Surface.Panel] = Color3.fromRGB(24, 31, 56),
		[Tokens.Color.Surface.Section] = Color3.fromRGB(35, 43, 70),
		[Tokens.Color.Surface.Control] = Color3.fromRGB(22, 27, 50),

		[Tokens.Color.Accent.Primary] = Color3.fromRGB(72, 98, 158),
		[Tokens.Color.Accent.Hover] = Color3.fromRGB(93, 124, 190),
		[Tokens.Color.Accent.Pressed] = Color3.fromRGB(52, 74, 124),

		[Tokens.Color.Stroke.Normal] = Color3.fromRGB(72, 98, 158),
		[Tokens.Color.Stroke.Soft] = Color3.fromRGB(45, 55, 86),
		[Tokens.Color.Stroke.Focus] = Color3.fromRGB(93, 124, 190),
	},
}
