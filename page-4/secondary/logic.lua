local Secondary={}

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

local function buildColourRow(New,THEME,parent,width)
	local row=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,30),
		ZIndex=5,
	},parent)

	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,6),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},row)

	return row,width or 28
end

function Secondary.new(ctx,parent)
	local New=ctx.New
	local THEME=ctx.THEME
	local UI_STYLE=ctx.UI_STYLE
	local buildSlider=ctx.buildSlider
	local tintSlider=ctx.tintSlider or function() end
	local updateEverything=ctx.updateEverything or function() end
	local applyMainColour=ctx.applyMainColour or function() end
	local applyGradient=ctx.applyGradient or function() end

	local refs={}
	local connections={}
	local function connect(signal,fn)
		local conn=signal:Connect(fn)
		table.insert(connections,conn)
		return conn
	end

	makeLabel(New,THEME,parent,"Secondary Colours",20)
	makeLabel(New,THEME,parent,"Quick colours")

	local paletteRow,paletteWidth=buildColourRow(New,THEME,parent,28)
	for _,colour in ipairs({
		Color3.fromRGB(255,255,255),
		Color3.fromRGB(0,255,255),
		Color3.fromRGB(255,0,0),
		Color3.fromRGB(0,255,0),
		Color3.fromRGB(0,120,255),
		Color3.fromRGB(180,80,255),
		Color3.fromRGB(255,210,0),
		Color3.fromRGB(130,130,130),
	}) do
		local swatch=New("TextButton",{
			Size=UDim2.fromOffset(paletteWidth,24),
			BackgroundColor3=colour,
			BorderSizePixel=0,
			Text="",
			AutoButtonColor=false,
			SkipThemeRole=true,
			ZIndex=6,
		},paletteRow)

		New("UIStroke",{
			Color=THEME.STROKE,
			Thickness=1,
			Transparency=0,
		},swatch)

		connect(swatch.MouseButton1Click,function()
			applyMainColour(colour)
		end)
	end

	makeLabel(New,THEME,parent,"Gradient presets")

	local gradientRow,gradientWidth=buildColourRow(New,THEME,parent,38)
	for _,pair in ipairs({
		{Color3.fromRGB(32,202,106),Color3.fromRGB(21,103,251)},
		{Color3.fromRGB(254,94,86),Color3.fromRGB(255,210,80)},
		{Color3.fromRGB(195,195,195),Color3.fromRGB(76,76,76)},
		{Color3.fromRGB(0,255,255),Color3.fromRGB(255,0,190)},
		{Color3.fromRGB(150,255,80),Color3.fromRGB(80,70,255)},
		{Color3.fromRGB(255,255,255),Color3.fromRGB(45,45,45)},
		{Color3.fromRGB(255,130,0),Color3.fromRGB(0,230,255)},
		{Color3.fromRGB(200,90,255),Color3.fromRGB(255,70,80)},
	}) do
		local btn=New("TextButton",{
			Size=UDim2.fromOffset(gradientWidth,24),
			BackgroundColor3=pair[1],
			BorderSizePixel=0,
			Text="",
			AutoButtonColor=false,
			SkipThemeRole=true,
			ZIndex=6,
		},gradientRow)

		New("UIStroke",{
			Color=THEME.STROKE,
			Thickness=1,
			Transparency=0,
		},btn)

		local grad=Instance.new("UIGradient")
		grad.Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,pair[1]),
			ColorSequenceKeypoint.new(1,pair[2]),
		})
		grad.Parent=btn

		connect(btn.MouseButton1Click,function()
			applyGradient(pair[1],pair[2])
		end)
	end

	makeLabel(New,THEME,parent,"Main stroke colour")

	refs.r=buildSlider(parent,"Main red",0,255,UI_STYLE.StrokeR,0,function(v)
		UI_STYLE.StrokeR=v
		updateEverything()
		tintSlider(refs.r,Color3.fromRGB(v,0,0))
	end)

	refs.g=buildSlider(parent,"Main green",0,255,UI_STYLE.StrokeG,0,function(v)
		UI_STYLE.StrokeG=v
		updateEverything()
		tintSlider(refs.g,Color3.fromRGB(0,v,0))
	end)

	refs.b=buildSlider(parent,"Main blue",0,255,UI_STYLE.StrokeB,0,function(v)
		UI_STYLE.StrokeB=v
		updateEverything()
		tintSlider(refs.b,Color3.fromRGB(0,0,v))
	end)

	makeLabel(New,THEME,parent,"Gradient end colour")

	refs.gr=buildSlider(parent,"Gradient red",0,255,UI_STYLE.GradientR,0,function(v)
		UI_STYLE.GradientR=v
		updateEverything()
		tintSlider(refs.gr,Color3.fromRGB(v,0,0))
	end)

	refs.gg=buildSlider(parent,"Gradient green",0,255,UI_STYLE.GradientG,0,function(v)
		UI_STYLE.GradientG=v
		updateEverything()
		tintSlider(refs.gg,Color3.fromRGB(0,v,0))
	end)

	refs.gb=buildSlider(parent,"Gradient blue",0,255,UI_STYLE.GradientB,0,function(v)
		UI_STYLE.GradientB=v
		updateEverything()
		tintSlider(refs.gb,Color3.fromRGB(0,0,v))
	end)

	function refs.Destroy()
		for _,conn in ipairs(connections) do
			pcall(function()
				conn:Disconnect()
			end)
		end
		table.clear(connections)

		for _,control in ipairs({refs.r,refs.g,refs.b,refs.gr,refs.gg,refs.gb}) do
			if control and control.Destroy then
				pcall(control.Destroy)
			end
		end
	end

	return refs
end

return Secondary
