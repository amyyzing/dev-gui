local Primary={}

local function makeLabel(New,THEME,parent,text,size)
	return New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,size or 18),
		Text=text,
		Font=Enum.Font.GothamBold,
		TextSize=size and 13 or 12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},parent)
end

function Primary.new(ctx,parent)
	local New=ctx.New
	local THEME=ctx.THEME
	local UI_STYLE=ctx.UI_STYLE
	local buildSlider=ctx.buildSlider
	local tintSlider=ctx.tintSlider or function() end
	local updateEverything=ctx.updateEverything or function() end
	local applyPrimaryColour=ctx.applyPrimaryColour or function() end

	local refs={}

	makeLabel(New,THEME,parent,"Primary Colours",20)

	local primaryPaletteRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,30),
		ZIndex=5,
	},parent)

	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,6),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},primaryPaletteRow)

	for _,colour in ipairs({
		Color3.fromRGB(28,28,28),
		Color3.fromRGB(238,238,238),
		Color3.fromRGB(90,90,90),
		Color3.fromRGB(58,17,24),
		Color3.fromRGB(12,18,38),
		Color3.fromRGB(18,36,34),
		Color3.fromRGB(42,30,54),
		Color3.fromRGB(24,24,30),
	}) do
		local swatch=New("TextButton",{
			Size=UDim2.fromOffset(34,24),
			BackgroundColor3=colour,
			BorderSizePixel=0,
			Text="",
			AutoButtonColor=false,
			SkipThemeRole=true,
			ZIndex=6,
		},primaryPaletteRow)

		New("UIStroke",{
			Color=THEME.STROKE,
			Thickness=1,
			Transparency=0,
		},swatch)

		swatch.MouseButton1Click:Connect(function()
			applyPrimaryColour(colour)
		end)
	end

	refs.pr=buildSlider(parent,"Primary red",0,255,UI_STYLE.PrimaryR,0,function(v)
		UI_STYLE.PrimaryR=v
		tintSlider(refs.pr)
		updateEverything()
	end)

	refs.pg=buildSlider(parent,"Primary green",0,255,UI_STYLE.PrimaryG,0,function(v)
		UI_STYLE.PrimaryG=v
		tintSlider(refs.pg)
		updateEverything()
	end)

	refs.pb=buildSlider(parent,"Primary blue",0,255,UI_STYLE.PrimaryB,0,function(v)
		UI_STYLE.PrimaryB=v
		tintSlider(refs.pb)
		updateEverything()
	end)

	return refs
end

return Primary
