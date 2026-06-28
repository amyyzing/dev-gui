-- design glue. resolves theme tokens into concrete gui colours.

local Tokens = {}

Tokens.Color = {
	Text = {
		Primary = "color.text.primary",
		Muted = "color.text.muted",
		Inverse = "color.text.inverse",
		Danger = "color.text.danger",
		Success = "color.text.success",
	},

	Surface = {
		Window = "color.surface.window",
		Panel = "color.surface.panel",
		Section = "color.surface.section",
		Control = "color.surface.control",
	},

	Accent = {
		Primary = "color.accent.primary",
		Hover = "color.accent.hover",
		Pressed = "color.accent.pressed",
	},

	Stroke = {
		Normal = "color.stroke.normal",
		Soft = "color.stroke.soft",
		Focus = "color.stroke.focus",
	},
}

Tokens.Typography = {
	Title = "typography.title",
	SectionTitle = "typography.sectionTitle",
	Body = "typography.body",
	Caption = "typography.caption",
	Control = "typography.control",
}

Tokens.Space = {
	XSmall = "space.xs",
	Small = "space.sm",
	Medium = "space.md",
	Large = "space.lg",
	XLarge = "space.xl",
}

Tokens.Radius = {
	None = "radius.none",
	Small = "radius.sm",
	Medium = "radius.md",
}

Tokens.Motion = {
	Fast = "motion.fast",
	Normal = "motion.normal",
	Slow = "motion.slow",
}

Tokens.Component = {
	Toggle = {
		TrackOn = "component.toggle.trackOn",
		TrackOff = "component.toggle.trackOff",
		Fill = "component.toggle.fill",
		Tick = "component.toggle.tick",
	},

	Slider = {
		Track = "component.slider.track",
		Fill = "component.slider.fill",
		Stroke = "component.slider.stroke",
	},

	Input = {
		Background = "component.input.background",
		FocusStroke = "component.input.focusStroke",
	},
}

Tokens.Defaults = {
	[Tokens.Space.XSmall] = 4,
	[Tokens.Space.Small] = 6,
	[Tokens.Space.Medium] = 10,
	[Tokens.Space.Large] = 14,
	[Tokens.Space.XLarge] = 18,

	[Tokens.Radius.None] = 0,
	[Tokens.Radius.Small] = 0,
	[Tokens.Radius.Medium] = 0,

	[Tokens.Motion.Fast] = 0.12,
	[Tokens.Motion.Normal] = 0.18,
	[Tokens.Motion.Slow] = 0.28,
}

return Tokens
