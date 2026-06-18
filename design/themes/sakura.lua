local Tokens = require(script.Parent.Parent.tokens)

return {
	id = "sakura",
	name = "Sakura",
	values = {
		[Tokens.Color.Surface.Window] = Color3.fromRGB(43, 3, 33),
		[Tokens.Color.Surface.Panel] = Color3.fromRGB(72, 25, 58),
		[Tokens.Color.Surface.Section] = Color3.fromRGB(86, 38, 70),
		[Tokens.Color.Surface.Control] = Color3.fromRGB(56, 16, 45),

		[Tokens.Color.Accent.Primary] = Color3.fromRGB(215, 136, 236),
		[Tokens.Color.Accent.Hover] = Color3.fromRGB(232, 168, 246),
		[Tokens.Color.Accent.Pressed] = Color3.fromRGB(184, 93, 207),

		[Tokens.Color.Stroke.Normal] = Color3.fromRGB(215, 136, 236),
		[Tokens.Color.Stroke.Soft] = Color3.fromRGB(106, 55, 91),
		[Tokens.Color.Stroke.Focus] = Color3.fromRGB(232, 168, 246),
	},
}
