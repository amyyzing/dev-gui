local env = (getfenv and getfenv()) or _G
local Tokens = rawget(env, "DesignTokens") or rawget(env, "DesignTokensModule")

if not Tokens and script and script.Parent and script.Parent.Parent then
	Tokens = require(script.Parent.Parent.tokens)
end

assert(Tokens, "DesignTokens must load before crimson theme")

return {
	id = "crimson",
	name = "Crimson",
	values = {
		[Tokens.Color.Surface.Window] = Color3.fromRGB(77, 13, 22),
		[Tokens.Color.Surface.Panel] = Color3.fromRGB(92, 43, 50),
		[Tokens.Color.Surface.Section] = Color3.fromRGB(96, 49, 56),
		[Tokens.Color.Surface.Control] = Color3.fromRGB(82, 27, 37),

		[Tokens.Color.Accent.Primary] = Color3.fromRGB(175, 47, 62),
		[Tokens.Color.Accent.Hover] = Color3.fromRGB(205, 66, 82),
		[Tokens.Color.Accent.Pressed] = Color3.fromRGB(135, 31, 45),

		[Tokens.Color.Stroke.Normal] = Color3.fromRGB(196, 93, 107),
		[Tokens.Color.Stroke.Soft] = Color3.fromRGB(112, 48, 58),
		[Tokens.Color.Stroke.Focus] = Color3.fromRGB(217, 84, 100),
	},
}
