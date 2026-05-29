local StrokeColour={}

local TweenService=game:GetService("TweenService")
local RunService=game:GetService("RunService")

local DEFAULTS={
	StrokeR=255,
	StrokeG=255,
	StrokeB=255,

	GradientR=255,
	GradientG=255,
	GradientB=255,

	StrokeGradient=false,
	LiquidStroke=false,

	LiquidStrokeSpeed=1,
	LiquidStrokeDirection="Right",

	StrokeThickness=2,
	StrokeTransparency=0,
	CornerRadius=0,
}

local function clampByte(v)
	return math.clamp(math.floor((tonumber(v) or 0)+0.5),0,255)
end

local function numberOrDefault(v,default)
	v=tonumber(v)
	if v==nil then
		return default
	end
	return v
end

local function boolOrDefault(v,default)
	if v==nil then
		return default
	end
	return v and true or false
end

local function ensureStyleDefaults(style)
	style.StrokeR=numberOrDefault(style.StrokeR,DEFAULTS.StrokeR)
	style.StrokeG=numberOrDefault(style.StrokeG,DEFAULTS.StrokeG)
	style.StrokeB=numberOrDefault(style.StrokeB,DEFAULTS.StrokeB)

	style.GradientR=numberOrDefault(style.GradientR,DEFAULTS.GradientR)
	style.GradientG=numberOrDefault(style.GradientG,DEFAULTS.GradientG)
	style.GradientB=numberOrDefault(style.GradientB,DEFAULTS.GradientB)

	style.StrokeGradient=boolOrDefault(style.StrokeGradient,DEFAULTS.StrokeGradient)
	style.LiquidStroke=boolOrDefault(style.LiquidStroke,DEFAULTS.LiquidStroke)

	style.LiquidStrokeSpeed=math.clamp(numberOrDefault(style.LiquidStrokeSpeed,DEFAULTS.LiquidStrokeSpeed),0,2)
	style.LiquidStrokeDirection=tostring(style.LiquidStrokeDirection or DEFAULTS.LiquidStrokeDirection)

	style.StrokeThickness=math.clamp(numberOrDefault(style.StrokeThickness,DEFAULTS.StrokeThickness),0,8)
	style.StrokeTransparency=math.clamp(numberOrDefault(style.StrokeTransparency,DEFAULTS.StrokeTransparency),0,1)
	style.CornerRadius=math.clamp(numberOrDefault(style.CornerRadius,DEFAULTS.CornerRadius),0,24)
end

local function copyDefaultStyle(style)
	style=style or DEFAULTS

	return{
		StrokeR=numberOrDefault(style.StrokeR,DEFAULTS.StrokeR),
		StrokeG=numberOrDefault(style.StrokeG,DEFAULTS.StrokeG),
		StrokeB=numberOrDefault(style.StrokeB,DEFAULTS.StrokeB),

		GradientR=numberOrDefault(style.GradientR,DEFAULTS.GradientR),
		GradientG=numberOrDefault(style.GradientG,DEFAULTS.GradientG),
		GradientB=numberOrDefault(style.GradientB,DEFAULTS.GradientB),

		StrokeGradient=boolOrDefault(style.StrokeGradient,DEFAULTS.StrokeGradient),
		LiquidStroke=boolOrDefault(style.LiquidStroke,DEFAULTS.LiquidStroke),

		LiquidStrokeSpeed=math.clamp(numberOrDefault(style.LiquidStrokeSpeed,DEFAULTS.LiquidStrokeSpeed),0,2),
		LiquidStrokeDirection=tostring(style.LiquidStrokeDirection or DEFAULTS.LiquidStrokeDirection),

		StrokeThickness=math.clamp(numberOrDefault(style.StrokeThickness,DEFAULTS.StrokeThickness),0,8),
		StrokeTransparency=math.clamp(numberOrDefault(style.StrokeTransparency,DEFAULTS.StrokeTransparency),0,1),
		CornerRadius=math.clamp(numberOrDefault(style.CornerRadius,DEFAULTS.CornerRadius),0,24),
	}
end

local function colorFromStyle(style,prefix)
	if prefix=="Gradient" then
		return Color3.fromRGB(clampByte(style.GradientR),clampByte(style.GradientG),clampByte(style.GradientB))
	end

	return Color3.fromRGB(clampByte(style.StrokeR),clampByte(style.StrokeG),clampByte(style.StrokeB))
end

local function writeColorToStyle(style,prefix,c)
	if prefix=="Gradient" then
		style.GradientR=math.floor(c.R*255+0.5)
		style.GradientG=math.floor(c.G*255+0.5)
		style.GradientB=math.floor(c.B*255+0.5)
	else
		style.StrokeR=math.floor(c.R*255+0.5)
		style.StrokeG=math.floor(c.G*255+0.5)
		style.StrokeB=math.floor(c.B*255+0.5)
	end
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
	local externalThemeApplier=ctx.applyUIStrokeTheme~=nil

	ensureStyleDefaults(UI_STYLE)

	local defaultStyle=copyDefaultStyle(ctx.DEFAULT_UI_STYLE or UI_STYLE)

	local api={}
	local rSlider,gSlider,bSlider
	local grSlider,ggSlider,gbSlider
	local speedSlider,thicknessSlider,transparencySlider
	local gradientToggle,liquidToggle
	local previewBox,previewStroke
	local colourTweenToken=0
	local liquidConn=nil
	local liquidClock=0
	local updatePreview=nil

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

	local function tintSlider(slider,color)
		if ctx.tintSlider then
			ctx.tintSlider(slider,color)
			return
		end

		if slider and slider.fill then slider.fill.BackgroundColor3=color end
		if slider and slider.knob then slider.knob.BackgroundColor3=color end
	end

	local function setGradientColors(grad,c1,c2)
		grad.Offset=Vector2.new(0,0)
		grad.Rotation=0
		grad.Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,c1),
			ColorSequenceKeypoint.new(1,c2),
		})
	end

	local function getPulseAlpha()
		if not UI_STYLE.LiquidStroke then
			return 0
		end

		return (math.sin(liquidClock*math.pi*2)+1)*0.5
	end

	local function getPulseColor()
		local c1=getUIStrokeColor()
		local c2=getUIStrokeGradientColor()

		if not UI_STYLE.LiquidStroke then
			return c1
		end

		return c1:Lerp(c2,0.18+(getPulseAlpha()*0.26))
	end

	local function isTextObject(obj)
		return obj and (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox"))
	end

	local function stopLiquidAnimation()
		if liquidConn then
			liquidConn:Disconnect()
			liquidConn=nil
		end
	end

	local function startLiquidAnimation()
		stopLiquidAnimation()

		if not UI_STYLE.LiquidStroke then
			return
		end

		if (tonumber(UI_STYLE.LiquidStrokeSpeed) or 0)<=0 then
			return
		end

		liquidConn=RunService.RenderStepped:Connect(function(dt)
			if not SG or not SG.Parent then
				stopLiquidAnimation()
				return
			end

			liquidClock=liquidClock+(dt*(tonumber(UI_STYLE.LiquidStrokeSpeed) or 1))

			if not externalThemeApplier then
				local pulseColor=getPulseColor()
				local pulseTransparency=math.clamp(UI_STYLE.StrokeTransparency+(getPulseAlpha()*0.08),0,1)

				for _,obj in ipairs(SG:GetDescendants()) do
					if obj:IsA("UIStroke") and not isTextObject(obj.Parent) then
						obj.Color=pulseColor
						obj.Transparency=pulseTransparency
					end
				end
			end

			if updatePreview then
				updatePreview()
			end
		end)
	end

	local function refreshLiquidAnimation()
		if UI_STYLE.LiquidStroke and (tonumber(UI_STYLE.LiquidStrokeSpeed) or 0)>0 then
			startLiquidAnimation()
		else
			stopLiquidAnimation()
		end
	end

	local function applyUIStrokeTheme()
		if ctx.applyUIStrokeTheme then
			ctx.applyUIStrokeTheme()
		else
			local color=getUIStrokeColor()
			local color2=getUIStrokeGradientColor()
			THEME.STROKE=color

			if SG then
				for _,obj in ipairs(SG:GetDescendants()) do
					if isTextObject(obj) then
						obj.TextStrokeTransparency=1

					elseif obj:IsA("UIStroke") then
						local textParent=isTextObject(obj.Parent)
						local gradient=obj:FindFirstChild("StrokeGradient")

						if textParent then
							if gradient then
								gradient:Destroy()
							end
							if tostring(obj.Parent.Text or "")~="" then
								obj.Transparency=1
							else
								obj.Color=Color3.fromRGB(76,76,76)
							end
						else
							obj.Color=UI_STYLE.LiquidStroke and getPulseColor() or color
							obj.Thickness=UI_STYLE.StrokeThickness
							obj.Transparency=UI_STYLE.StrokeTransparency

							pcall(function()
								obj.LineJoinMode=Enum.LineJoinMode.Round
							end)

							if UI_STYLE.StrokeGradient or UI_STYLE.LiquidStroke then
								if not gradient then
									gradient=Instance.new("UIGradient")
									gradient.Name="StrokeGradient"
									gradient.Parent=obj
								end

								setGradientColors(gradient,color,color2)
							else
								if gradient then
									gradient:Destroy()
								end
							end
						end
					end
				end
			end
		end

		refreshLiquidAnimation()
	end

	local function clearPage()
		for _,child in ipairs(page:GetChildren()) do
			if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
				child:Destroy()
			end
		end
	end

	updatePreview=function()
		if not previewBox then return end

		local c1=getUIStrokeColor()
		local c2=getUIStrokeGradientColor()

		previewBox.BackgroundColor3=c1

		if previewStroke then
			previewStroke.Color=getPulseColor()
			previewStroke.Thickness=UI_STYLE.StrokeThickness
			previewStroke.Transparency=math.clamp(UI_STYLE.StrokeTransparency+(getPulseAlpha()*0.08),0,1)
		end

		local grad=previewBox:FindFirstChild("PreviewGradient")

		if UI_STYLE.StrokeGradient or UI_STYLE.LiquidStroke then
			if not grad then
				grad=Instance.new("UIGradient")
				grad.Name="PreviewGradient"
				grad.Parent=previewBox
			end

			setGradientColors(grad,c1,c2)
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
		writeColorToStyle(UI_STYLE,"Stroke",c)
	end

	local function setGradientColour(c)
		writeColorToStyle(UI_STYLE,"Gradient",c)
	end

	local function syncColourControls()
		if rSlider then rSlider.set(UI_STYLE.StrokeR) end
		if gSlider then gSlider.set(UI_STYLE.StrokeG) end
		if bSlider then bSlider.set(UI_STYLE.StrokeB) end

		if grSlider then grSlider.set(UI_STYLE.GradientR) end
		if ggSlider then ggSlider.set(UI_STYLE.GradientG) end
		if gbSlider then gbSlider.set(UI_STYLE.GradientB) end

		if speedSlider then speedSlider.set(UI_STYLE.LiquidStrokeSpeed) end
		if thicknessSlider then thicknessSlider.set(UI_STYLE.StrokeThickness) end
		if transparencySlider then transparencySlider.set(UI_STYLE.StrokeTransparency) end

		if gradientToggle then gradientToggle.set(UI_STYLE.StrokeGradient) end
		if liquidToggle then liquidToggle.set(UI_STYLE.LiquidStroke) end

		tintSlider(rSlider,Color3.fromRGB(clampByte(UI_STYLE.StrokeR),0,0))
		tintSlider(gSlider,Color3.fromRGB(0,clampByte(UI_STYLE.StrokeG),0))
		tintSlider(bSlider,Color3.fromRGB(0,0,clampByte(UI_STYLE.StrokeB)))

		tintSlider(grSlider,Color3.fromRGB(clampByte(UI_STYLE.GradientR),0,0))
		tintSlider(ggSlider,Color3.fromRGB(0,clampByte(UI_STYLE.GradientG),0))
		tintSlider(gbSlider,Color3.fromRGB(0,0,clampByte(UI_STYLE.GradientB)))

		tintSlider(speedSlider,THEME.TEXT)
		tintSlider(thicknessSlider,THEME.TEXT)
		tintSlider(transparencySlider,THEME.TEXT)
	end

	local function tweenStyleTo(c1,c2,gradientEnabled)
		colourTweenToken=colourTweenToken+1

		local token=colourTweenToken
		local mainValue=Instance.new("Color3Value")
		local gradientValue=Instance.new("Color3Value")

		mainValue.Value=getUIStrokeColor()
		gradientValue.Value=getUIStrokeGradientColor()

		UI_STYLE.StrokeGradient=gradientEnabled and true or false

		local function applyStep()
			if token~=colourTweenToken then return end

			setMainColour(mainValue.Value)
			setGradientColour(gradientValue.Value)

			syncColourControls()
			updateEverything()
		end

		mainValue.Changed:Connect(applyStep)
		gradientValue.Changed:Connect(applyStep)

		local info=TweenInfo.new(0.24,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		local t1=TweenService:Create(mainValue,info,{Value=c1})
		local t2=TweenService:Create(gradientValue,info,{Value=c2 or c1})

		t2.Completed:Connect(function()
			if token==colourTweenToken then
				setMainColour(c1)
				setGradientColour(c2 or c1)

				syncColourControls()
				updateEverything()
			end

			mainValue:Destroy()
			gradientValue:Destroy()
		end)

		t1:Play()
		t2:Play()
	end

	function api.Refresh()
		colourTweenToken=colourTweenToken+1
		ensureStyleDefaults(UI_STYLE)
		syncColourControls()
		updateEverything()
	end

	function api.Destroy()
		colourTweenToken=colourTweenToken+1
		stopLiquidAnimation()
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

		UI_STYLE.LiquidStrokeSpeed=defaultStyle.LiquidStrokeSpeed
		UI_STYLE.LiquidStrokeDirection=defaultStyle.LiquidStrokeDirection

		UI_STYLE.StrokeThickness=defaultStyle.StrokeThickness
		UI_STYLE.StrokeTransparency=defaultStyle.StrokeTransparency
		UI_STYLE.CornerRadius=defaultStyle.CornerRadius

		api.Refresh()
	end

	function api.ApplyMainColour(c)
		UI_STYLE.StrokeGradient=false
		UI_STYLE.LiquidStroke=false

		if gradientToggle then
			gradientToggle.set(false)
		end

		if liquidToggle then
			liquidToggle.set(false)
		end

		tweenStyleTo(c,c,false)
	end

	function api.ApplyGradient(c1,c2)
		UI_STYLE.StrokeGradient=true
		UI_STYLE.LiquidStroke=false

		if gradientToggle then
			gradientToggle.set(true)
		end

		if liquidToggle then
			liquidToggle.set(false)
		end

		tweenStyleTo(c1,c2,true)
	end

	local function buildPage3Slider(parent,titleText,shortLabel,minVal,maxVal,startVal,decimals,onChange)
		local row=New("Frame",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,0,54),
			ZIndex=5,
		},parent)

		New("TextLabel",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,0,18),
			Text=titleText,
			Font=Enum.Font.GothamMedium,
			TextSize=12,
			TextColor3=THEME.MUTED,
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=6,
		},row)

		local sliderHost=New("Frame",{
			BackgroundTransparency=1,
			Position=UDim2.fromOffset(0,20),
			Size=UDim2.new(1,0,0,32),
			ZIndex=5,
		},row)

		return buildSlider(sliderHost,shortLabel,minVal,maxVal,startVal,decimals,onChange)
	end

	clearPage()

	local presetSection=makeSection(page,1,"Customisation","Live preview and quick styles.")
	local colourSection=makeSection(page,2,"Colours","Tune the base stroke and gradient endpoint.")
	local motionSection=makeSection(page,3,"Pulse Accent","A slow accent pulse. No moving stroke effects.")
	local shapeSection=makeSection(page,4,"Border Shape","Control border weight and opacity.")

	local previewRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,42),
		ZIndex=5,
	},presetSection)

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,-170,1,0),
		Text="Live preview",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.MUTED,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},previewRow)

	previewBox=New("Frame",{
		Size=UDim2.fromOffset(150,30),
		Position=UDim2.new(1,-150,0.5,-15),
		BackgroundColor3=getUIStrokeColor(),
		BorderSizePixel=0,
		ZIndex=6,
	},previewRow)

	New("UICorner",{CornerRadius=UDim.new(0,4)},previewBox)

	previewStroke=New("UIStroke",{
		Color=getUIStrokeColor(),
		Thickness=UI_STYLE.StrokeThickness,
		Transparency=UI_STYLE.StrokeTransparency,
	},previewBox)

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,1,0),
		Text="PREVIEW",
		Font=Enum.Font.GothamMedium,
		TextSize=11,
		TextColor3=Color3.fromRGB(0,0,0),
		ZIndex=7,
	},previewBox)

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,16),
		Text="Quick colours",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},presetSection)

	local paletteRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,30),
		ZIndex=5,
	},presetSection)

	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,6),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},paletteRow)

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
		local swatch=New("TextButton",{
			Size=UDim2.fromOffset(28,24),
			BackgroundColor3=c,
			BorderSizePixel=0,
			Text="",
			AutoButtonColor=false,
			ZIndex=6,
		},paletteRow)

		New("UIStroke",{
			Color=THEME.STROKE,
			Thickness=1,
			Transparency=0,
		},swatch)

		swatch.MouseButton1Click:Connect(function()
			api.ApplyMainColour(c)
		end)
	end

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,16),
		Text="Main stroke colour",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},colourSection)

	rSlider=buildPage3Slider(colourSection,"Main red","R",0,255,UI_STYLE.StrokeR,0,function(v)
		UI_STYLE.StrokeR=v
		tintSlider(rSlider,Color3.fromRGB(v,0,0))
		updateEverything()
	end)

	gSlider=buildPage3Slider(colourSection,"Main green","G",0,255,UI_STYLE.StrokeG,0,function(v)
		UI_STYLE.StrokeG=v
		tintSlider(gSlider,Color3.fromRGB(0,v,0))
		updateEverything()
	end)

	bSlider=buildPage3Slider(colourSection,"Main blue","B",0,255,UI_STYLE.StrokeB,0,function(v)
		UI_STYLE.StrokeB=v
		tintSlider(bSlider,Color3.fromRGB(0,0,v))
		updateEverything()
	end)

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,16),
		Text="Gradient end colour",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},colourSection)

	grSlider=buildPage3Slider(colourSection,"Gradient red","R2",0,255,UI_STYLE.GradientR,0,function(v)
		UI_STYLE.GradientR=v
		tintSlider(grSlider,Color3.fromRGB(v,0,0))
		updateEverything()
	end)

	ggSlider=buildPage3Slider(colourSection,"Gradient green","G2",0,255,UI_STYLE.GradientG,0,function(v)
		UI_STYLE.GradientG=v
		tintSlider(ggSlider,Color3.fromRGB(0,v,0))
		updateEverything()
	end)

	gbSlider=buildPage3Slider(colourSection,"Gradient blue","B2",0,255,UI_STYLE.GradientB,0,function(v)
		UI_STYLE.GradientB=v
		tintSlider(gbSlider,Color3.fromRGB(0,0,v))
		updateEverything()
	end)

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,16),
		Text="Gradient presets",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},colourSection)

	local presetRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,30),
		ZIndex=5,
	},colourSection)

	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,6),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},presetRow)

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
			Size=UDim2.fromOffset(38,24),
			BackgroundColor3=pair[1],
			BorderSizePixel=0,
			Text="",
			AutoButtonColor=false,
			ZIndex=6,
		},presetRow)

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

		btn.MouseButton1Click:Connect(function()
			api.ApplyGradient(pair[1],pair[2])
		end)
	end

	gradientToggle=buildToggleRow(colourSection,"Gradient Stroke",UI_STYLE.StrokeGradient,function(state)
		UI_STYLE.StrokeGradient=state and true or false

		if not UI_STYLE.StrokeGradient then
			UI_STYLE.LiquidStroke=false
			if liquidToggle then
				liquidToggle.set(false)
			end
		end

		updateEverything()
	end)

	liquidToggle=buildToggleRow(motionSection,"Pulse Accent",UI_STYLE.LiquidStroke,function(state)
		UI_STYLE.LiquidStroke=state and true or false

		if state then
			UI_STYLE.StrokeGradient=true
			if gradientToggle then
				gradientToggle.set(true)
			end
		end

		updateEverything()
	end)

	speedSlider=buildPage3Slider(motionSection,"Pulse speed","SPD",0,2,math.clamp(UI_STYLE.LiquidStrokeSpeed,0,2),2,function(v)
		UI_STYLE.LiquidStrokeSpeed=math.clamp(tonumber(v) or 0,0,2)
		updateEverything()
	end)

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,16),
		Text="Weight and opacity",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},shapeSection)

	thicknessSlider=buildPage3Slider(shapeSection,"Stroke thickness","W",0,6,math.clamp(UI_STYLE.StrokeThickness,0,6),1,function(v)
		UI_STYLE.StrokeThickness=math.clamp(tonumber(v) or 0,0,8)
		updateEverything()
	end)

	transparencySlider=buildPage3Slider(shapeSection,"Stroke transparency","A",0,1,UI_STYLE.StrokeTransparency,2,function(v)
		UI_STYLE.StrokeTransparency=math.clamp(tonumber(v) or 0,0,1)
		updateEverything()
	end)

	local resetRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,30),
		ZIndex=5,
	},shapeSection)

	local resetBtn=New("TextButton",{
		Size=UDim2.fromOffset(120,28),
		Position=UDim2.new(1,-120,0,0),
		BackgroundColor3=THEME.BG,
		BorderSizePixel=0,
		Text="RESET",
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=THEME.TEXT,
		AutoButtonColor=false,
		ZIndex=6,
	},resetRow)

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
