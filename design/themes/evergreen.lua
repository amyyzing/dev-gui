-- theme preset. keep values obvious so screenshots are easy to reason about.

local env = (getfenv and getfenv()) or _G
local Tokens = rawget(env, "DesignTokens") or rawget(env, "DesignTokensModule")

if not Tokens and script and script.Parent and script.Parent.Parent then
	Tokens = require(script.Parent.Parent.tokens)
end

assert(Tokens, "DesignTokens must load before evergreen theme")

return {
	id = "evergreen",
	name = "Evergreen",
	values = {
		[Tokens.Color.Surface.Window] = Color3.fromRGB(18, 36, 34),
		[Tokens.Color.Surface.Panel] = Color3.fromRGB(28, 49, 45),
		[Tokens.Color.Surface.Section] = Color3.fromRGB(36, 61, 55),
		[Tokens.Color.Surface.Control] = Color3.fromRGB(20, 42, 38),

		[Tokens.Color.Accent.Primary] = Color3.fromRGB(45, 112, 78),
		[Tokens.Color.Accent.Hover] = Color3.fromRGB(59, 143, 101),
		[Tokens.Color.Accent.Pressed] = Color3.fromRGB(34, 88, 61),

		[Tokens.Color.Stroke.Normal] = Color3.fromRGB(45, 112, 78),
		[Tokens.Color.Stroke.Soft] = Color3.fromRGB(42, 77, 67),
		[Tokens.Color.Stroke.Focus] = Color3.fromRGB(59, 143, 101),
	},
}
