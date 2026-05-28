local StrokeColour={}

local function clampByte(v)
	return math.clamp(math.floor((tonumber(v) or 0)+0.5),0,255)
end

local function copyDefaultStyle(style)
	return{
		StrokeR=style.StrokeR,
		StrokeG=style.StrokeG,
		StrokeB=style.StrokeB,
		GradientR=style.GradientR,
		GradientG=style.GradientG,
		GradientB=style.GradientB,
		StrokeGradient=style.StrokeGradient and true or false,
		LiquidStroke=style.LiquidStroke and true or false,
	}
end

local function colorFromStyle(style,prefix)
	if prefix=="Gradient" then
		return Color3.fromRGB(clampByte(style.GradientR),clampByte(style.GradientG),clampByte(style.GradientB))
	end

	return Color3.fromRGB(clampByte(style.StrokeR),clampByte(style.StrokeG),clampByte(style.StrokeB))
end

function StrokeColour.new(ctx,page)
	local New=ctx.New
	local THEME=ctx.THEME
	local UI_STYLE=ctx.UI_STYLE
	local SG=ctx.SG
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local buildToggleRow=ctx.buildToggleRow
	local wrapTextButton=ctx.wrapTextButton

	local defaultStyle=copyDefaultStyle(ctx.DEFAULT_UI_STYLE or UI_STYLE)

	local api={}
	local rSlider,gSlider,bSlider
	local grSlider,ggSlider,gbSlider
	local gradientToggle
	local liquidToggle
	local previewBox

	local function getUIStrokeColor()
		if ctx.getUIStrokeColor then
			return ctx.getUIStrokeColor()
		end

		return colorFromStyle(UI_STYLE,"Stroke")
	end

	local function getUIStrokeGradientColor()
		if ctx.getUIStrokeGradientColor then
			return ctx.getUIStrokeGradientColor()
		end

		return colorFromStyle(UI_STYLE,"Gradient")
	end

	local function applyUIStrokeTheme()
		if ctx.applyUIStrokeTheme then
			ctx.applyUIStrokeTheme()
			return
		end

		local color=getUIStrokeColor()
		local color2=getUIStrokeGradientColor()
		THEME.STROKE=color

		if not SG then return end

		for _,obj in ipairs(SG:GetDescendants()) do
			if obj:IsA("UIStroke") then
				obj.Color=color
				pcall(function()
					obj.LineJoinMode=Enum.LineJoinMode.Round
				end)

				local gradient=obj:FindFirstChild("StrokeGradient")
				if UI_STYLE.StrokeGradient or UI_STYLE.LiquidStroke then
					if not gradient then
						gradient=Instance.new("UIGradient")
						gradient.Name="StrokeGradient"
						gradient.Parent=obj
					end

					gradient.Rotation=0
					if UI_STYLE.LiquidStroke then
						gradient.Color=ColorSequence.new({
							ColorSequenceKeypoint.new(0,color),
							ColorSequenceKeypoint.new(0.5,color2),
							ColorSequenceKeypoint.new(1,color),
						})
					else
						gradient.Color=ColorSequence.new({
							ColorSequenceKeypoint.new(0,color),
							ColorSequenceKeypoint.new(1,color2),
						})
					end
				else
					if gradient then
						gradient:Destroy()
					end
				end
			end
		end
	end

	local function tintSlider(slider,color)
		if ctx.tintSlider then
			ctx.tintSlider(slider,color)
			return
		end

		if slider and slider.fill then slider.fill.BackgroundColor3=color end
		if slider and slider.knob then slider.knob.BackgroundColor3=color end
	end

	local function clearPage()
		for _,child in ipairs(page:GetChildren()) do
			if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
				child:Destroy()
			end
		end
	end

	local function updatePreview()
		if not previewBox then return end

		local c1=getUIStrokeColor()
		local c2=getUIStrokeGradientColor()
		previewBox.BackgroundColor3=c1

		local grad=previewBox:FindFirstChild("PreviewGradient")
		if UI_STYLE.StrokeGradient or UI_STYLE.LiquidStroke then
			if not grad then
				grad=Instance.new("UIGradient")
				grad.Name="PreviewGradient"
				grad.Parent=previewBox
			end

			grad.Rotation=0
			if UI_STYLE.LiquidStroke then
				grad.Color=ColorSequence.new({
					ColorSequenceKeypoint.new(0,c1),
					ColorSequenceKeypoint.new(0.5,c2),
					ColorSequenceKeypoint.new(1,c1),
				})
			else
				grad.Color=ColorSequence.new({
					ColorSequenceKeypoint.new(0,c1),
					ColorSequenceKeypoint.new(1,c2),
				})
			end
		else
			if grad then
				grad:Destroy()
			end
		end
	end

	local function updateEverything()
		applyUIStrokeTheme()
		updatePreview()

		if ctx.onChanged then
			pcall(ctx.onChanged,UI_STYLE)
		end
	end

	local function setMainColour(c)
		UI_STYLE.StrokeR=math.floor(c.R*255+0.5)
		UI_STYLE.StrokeG=math.floor(c.G*255+0.5)
		UI_STYLE.StrokeB=math.floor(c.B*255+0.5)
	end

	local function setGradientColour(c)
		UI_STYLE.GradientR=math.floor(c.R*255+0.5)
		UI_STYLE.GradientG=math.floor(c.G*255+0.5)
		UI_STYLE.GradientB=math.floor(c.B*255+0.5)
	end

	function api.Refresh()
		if rSlider then rSlider.set(UI_STYLE.StrokeR) end
		if gSlider then gSlider.set(UI_STYLE.StrokeG) end
		if bSlider then bSlider.set(UI_STYLE.StrokeB) end
		if grSlider then grSlider.set(UI_STYLE.GradientR) end
		if ggSlider then ggSlider.set(UI_STYLE.GradientG) end
		if gbSlider then gbSlider.set(UI_STYLE.GradientB) end
		if gradientToggle then gradientToggle.set(UI_STYLE.StrokeGradient) end
		if liquidToggle then liquidToggle.set(UI_STYLE.LiquidStroke) end

		tintSlider(rSlider,Color3.fromRGB(clampByte(UI_STYLE.StrokeR),0,0))
		tintSlider(gSlider,Color3.fromRGB(0,clampByte(UI_STYLE.StrokeG),0))
		tintSlider(bSlider,Color3.fromRGB(0,0,clampByte(UI_STYLE.StrokeB)))
		tintSlider(grSlider,Color3.fromRGB(clampByte(UI_STYLE.GradientR),0,0))
		tintSlider(ggSlider,Color3.fromRGB(0,clampByte(UI_STYLE.GradientG),0))
		tintSlider(gbSlider,Color3.fromRGB(0,0,clampByte(UI_STYLE.GradientB)))

		updateEverything()
	end

	function api.Reset()
		UI_STYLE.StrokeR=defaultStyle.StrokeR
		UI_STYLE.StrokeG=defaultStyle.StrokeG
		UI_STYLE.StrokeB=defaultStyle.StrokeB
		UI_STYLE.GradientR=defaultStyle.GradientR
		UI_STYLE.GradientG=defaultStyle.GradientG
		UI_STYLE.GradientB=defaultStyle.GradientB
		UI_STYLE.StrokeGradient=defaultStyle.StrokeGradient
		UI_STYLE.LiquidStroke=defaultStyle.LiquidStroke
		api.Refresh()
	end

	function api.ApplyMainColour(c)
		setMainColour(c)
		UI_STYLE.StrokeGradient=false

		if gradientToggle then
			gradientToggle.set(false)
		end

		api.Refresh()
	end

	function api.ApplyGradient(c1,c2)
		setMainColour(c1)
		setGradientColour(c2)
		UI_STYLE.StrokeGradient=true

		if gradientToggle then
			gradientToggle.set(true)
		end

		api.Refresh()
	end

	clearPage()

	local strokeSettings=makeSection(page,1,"Stroke Colour","Colour thingy, have fun!")

	local previewRow=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,36),ZIndex=5},strokeSettings)

	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-150,1,0),Text="Colour preview",Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},previewRow)

	previewBox=New("Frame",{Size=UDim2.fromOffset(130,24),Position=UDim2.new(1,-130,0.5,-12),BackgroundColor3=getUIStrokeColor(),BorderSizePixel=0,ZIndex=6},previewRow)

	New("UIStroke",{Color=THEME.STROKE,Thickness=2,Transparency=0},previewBox)

	rSlider=buildSlider(strokeSettings,"R",0,255,UI_STYLE.StrokeR,0,function(v)
		UI_STYLE.StrokeR=v
		tintSlider(rSlider,Color3.fromRGB(v,0,0))
		updateEverything()
	end)

	gSlider=buildSlider(strokeSettings,"G",0,255,UI_STYLE.StrokeG,0,function(v)
		UI_STYLE.StrokeG=v
		tintSlider(gSlider,Color3.fromRGB(0,v,0))
		updateEverything()
	end)

	bSlider=buildSlider(strokeSettings,"B",0,255,UI_STYLE.StrokeB,0,function(v)
		UI_STYLE.StrokeB=v
		tintSlider(bSlider,Color3.fromRGB(0,0,v))
		updateEverything()
	end)

	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text="Palette",Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},strokeSettings)

	local paletteRow=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,30),ZIndex=5},strokeSettings)
	New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},paletteRow)

	for _,c in ipairs({
		Color3.fromRGB(255,255,255),
		Color3.fromRGB(0,255,255),
		Color3.fromRGB(255,0,0),
		Color3.fromRGB(0,255,0),
		Color3.fromRGB(0,120,255),
		Color3.fromRGB(180,80,255),
		Color3.fromRGB(255,210,0),
		Color3.fromRGB(130,130,130),
	}) do
		local swatch=New("TextButton",{Size=UDim2.fromOffset(28,24),BackgroundColor3=c,BorderSizePixel=0,Text="",AutoButtonColor=false,ZIndex=6},paletteRow)

		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},swatch)

		swatch.MouseButton1Click:Connect(function()
			api.ApplyMainColour(c)
		end)
	end

	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text="Gradient end colour",Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},strokeSettings)

	grSlider=buildSlider(strokeSettings,"R2",0,255,UI_STYLE.GradientR,0,function(v)
		UI_STYLE.GradientR=v
		tintSlider(grSlider,Color3.fromRGB(v,0,0))
		updateEverything()
	end)

	ggSlider=buildSlider(strokeSettings,"G2",0,255,UI_STYLE.GradientG,0,function(v)
		UI_STYLE.GradientG=v
		tintSlider(ggSlider,Color3.fromRGB(0,v,0))
		updateEverything()
	end)

	gbSlider=buildSlider(strokeSettings,"B2",0,255,UI_STYLE.GradientB,0,function(v)
		UI_STYLE.GradientB=v
		tintSlider(gbSlider,Color3.fromRGB(0,0,v))
		updateEverything()
	end)

	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text="Gradient presets",Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},strokeSettings)

	local presetRow=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,30),ZIndex=5},strokeSettings)
	New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},presetRow)

	for _,pair in ipairs({
		{Color3.fromRGB(0,255,255),Color3.fromRGB(170,70,255)},
		{Color3.fromRGB(255,70,180),Color3.fromRGB(80,120,255)},
		{Color3.fromRGB(0,255,120),Color3.fromRGB(0,160,255)},
		{Color3.fromRGB(255,150,0),Color3.fromRGB(0,230,255)},
		{Color3.fromRGB(120,70,255),Color3.fromRGB(255,80,200)},
		{Color3.fromRGB(255,255,255),Color3.fromRGB(0,255,255)},
	}) do
		local btn=New("TextButton",{Size=UDim2.fromOffset(38,24),BackgroundColor3=pair[1],BorderSizePixel=0,Text="",AutoButtonColor=false,ZIndex=6},presetRow)

		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},btn)

		local grad=Instance.new("UIGradient")
		grad.Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,pair[1]),
			ColorSequenceKeypoint.new(1,pair[2]),
		})
		grad.Parent=btn

		btn.MouseButton1Click:Connect(function()
			api.ApplyGradient(pair[1],pair[2])
		end)
	end

	gradientToggle=buildToggleRow(strokeSettings,"Gradient Stroke",UI_STYLE.StrokeGradient,function(state)
		UI_STYLE.StrokeGradient=state and true or false
		updateEverything()
	end)

	liquidToggle=buildToggleRow(strokeSettings,"Liquid Stroke",UI_STYLE.LiquidStroke,function(state)
		UI_STYLE.LiquidStroke=state and true or false
		if state then
			UI_STYLE.StrokeGradient=true
			if gradientToggle then
				gradientToggle.set(true)
			end
		end
		updateEverything()
	end)

	local resetRow=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,30),ZIndex=5},strokeSettings)

	local resetBtn=New("TextButton",{Size=UDim2.fromOffset(120,28),Position=UDim2.new(1,-120,0,0),BackgroundColor3=THEME.BG,BorderSizePixel=0,Text="RESET",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.TEXT,AutoButtonColor=false,ZIndex=6},resetRow)

	local resetWrap=wrapTextButton(resetBtn,THEME.BG,2)

	resetBtn.MouseEnter:Connect(function()
		resetWrap.BackgroundColor3=Color3.fromRGB(43,43,43)
	end)

	resetBtn.MouseLeave:Connect(function()
		resetWrap.BackgroundColor3=THEME.BG
	end)

	resetBtn.MouseButton1Click:Connect(api.Reset)

	api.Refresh()

	return api
end

return StrokeColour
