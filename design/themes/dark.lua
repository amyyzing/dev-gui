local Tokens = require(script.Parent.Parent.tokens)

return {
	id = "dark",
	name = "Dark",
	values = {
		[Tokens.Color.Surface.Window] = Color3.fromRGB(12, 12, 12),
		[Tokens.Color.Surface.Panel] = Color3.fromRGB(24, 24, 24),
		[Tokens.Color.Surface.Section] = Color3.fromRGB(31, 31, 31),
		[Tokens.Color.Surface.Control] = Color3.fromRGB(22, 22, 22),

		[Tokens.Color.Accent.Primary] = Color3.fromRGB(32, 202, 106),
		[Tokens.Color.Accent.Hover] = Color3.fromRGB(46, 219, 125),
		[Tokens.Color.Accent.Pressed] = Color3.fromRGB(24, 170, 88),

		[Tokens.Color.Stroke.Normal] = Color3.fromRGB(182, 180, 180),
		[Tokens.Color.Stroke.Soft] = Color3.fromRGB(82, 82, 82),
		[Tokens.Color.Stroke.Focus] = Color3.fromRGB(32, 202, 106),
	},
}
