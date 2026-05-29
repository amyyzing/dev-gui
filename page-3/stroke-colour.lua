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

local LIQUID_DIRECTIONS={
	{Key="Right",Label="RIGHT"},
	{Key="Left",Label="LEFT"},
	{Key="Down",Label="DOWN"},
	{Key="Up",Label="UP"},
	{Key="SpinCW",Label="SPIN"},
	{Key="SpinCCW",Label="REV"},
}

local THEME_PRESETS={
	{
		Name="ICE",
		Main=Color3.fromRGB(0,255,255),
		Second=Color3.fromRGB(255,255,255),
		Liquid=true,
		Speed=1.2,
		Direction="Right",
		Thickness=2,
		Transparency=0,
		Radius=0,
	},
	{
		Name="VOID",
		Main=Color3.fromRGB(180,80,255),
		Second=Color3.fromRGB(0,255,255),
		Liquid=true,
		Speed=1.6,
		Direction="SpinCW",
		Thickness=2,
		Transparency=0,
		Radius=4,
	},
	{
		Name="RUBY",
		Main=Color3.fromRGB(255,45,75),
		Second=Color3.fromRGB(255,170,0),
		Liquid=true,
		Speed=1.1,
		Direction="Right",
		Thickness=2,
		Transparency=0,
		Radius=0,
	},
	{
		Name="EMERALD",
		Main=Color3.fromRGB(0,255,130),
		Second=Color3.fromRGB(0,150,255),
		Liquid=true,
		Speed=1,
		Direction="Down",
		Thickness=2,
		Transparency=0,
		Radius=4,
	},
	{
		Name="GOLD",
		Main=Color3.fromRGB(255,220,80),
		Second=Color3.fromRGB(255,120,0),
		Liquid=true,
		Speed=0.8,
		Direction="Left",
		Thickness=2,
		Transparency=0,
		Radius=0,
	},
	{
		Name="CLEAN",
		Main=Color3.fromRGB(255,255,255),
		Second=Color3.fromRGB(130,130,130),
		Liquid=false,
		Speed=0,
		Direction="Right",
		Thickness=1,
		Transparency=0,
		Radius=0,
	},
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

	style.LiquidStrokeSpeed=math.clamp(numberOrDefault(style.LiquidStrokeSpeed,DEFAULTS.LiquidStrokeSpeed),0,5)
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

		LiquidStrokeSpeed=math.clamp(numberOrDefault(style.LiquidStrokeSpeed,DEFAULTS.LiquidStrokeSpeed),0,5),
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
	local speedSlider,thicknessSlider,transparencySlider,radiusSlider
	local gradientToggle,liquidToggle
	local previewBox,previewStroke
	local colourTweenToken=0
	local liquidConn=nil
	local liquidClock=0
	local directionButtons={}

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
		if UI_STYLE.LiquidStroke then
			grad.Color=ColorSequence.new({
				ColorSequenceKeypoint.new(0,c1),
				ColorSequenceKeypoint.new(0.45,c2),
				ColorSequenceKeypoint.new(0.55,c2),
				ColorSequenceKeypoint.new(1,c1),
			})
		else
			grad.Color=ColorSequence.new({
				ColorSequenceKeypoint.new(0,c1),
				ColorSequenceKeypoint.new(1,c2),
			})
		end
	end

	local function applyLiquidMotionToGradient(grad)
		if not grad then return end

		if not UI_STYLE.LiquidStroke then
			grad.Offset=Vector2.new(0,0)
			grad.Rotation=0
			return
		end

		local direction=tostring(UI_STYLE.LiquidStrokeDirection or "Right")
		local wave=(liquidClock%2)-1

		if direction=="Right" then
			grad.Rotation=0
			grad.Offset=Vector2.new(wave,0)

		elseif direction=="Left" then
			grad.Rotation=0
			grad.Offset=Vector2.new(-wave,0)

		elseif direction=="Down" then
			grad.Rotation=90
			grad.Offset=Vector2.new(0,wave)

		elseif direction=="Up" then
			grad.Rotation=90
			grad.Offset=Vector2.new(0,-wave)

		elseif direction=="SpinCW" then
			grad.Offset=Vector2.new(0,0)
			grad.Rotation=(liquidClock*180)%360

		elseif direction=="SpinCCW" then
			grad.Offset=Vector2.new(0,0)
			grad.Rotation=(-liquidClock*180)%360

		else
			grad.Rotation=0
			grad.Offset=Vector2.new(wave,0)
		end
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
				for _,obj in ipairs(SG:GetDescendants()) do
					if obj:IsA("UIGradient") and obj.Name=="StrokeGradient" then
						applyLiquidMotionToGradient(obj)
					end
				end
			end

			if previewBox then
				local grad=previewBox:FindFirstChild("PreviewGradient")
				if grad then
					applyLiquidMotionToGradient(grad)
				end
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
					if obj:IsA("UIStroke") then
						obj.Color=color
						obj.Thickness=UI_STYLE.StrokeThickness
						obj.Transparency=UI_STYLE.StrokeTransparency

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

							setGradientColors(gradient,color,color2)
							applyLiquidMotionToGradient(gradient)
						else
							if gradient then
								gradient:Destroy()
							end
						end

					elseif obj:IsA("UICorner") then
						obj.CornerRadius=UDim.new(0,UI_STYLE.CornerRadius)
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

	local function updatePreview()
		if not previewBox then return end

		local c1=getUIStrokeColor()
		local c2=getUIStrokeGradientColor()

		previewBox.BackgroundColor3=c1

		if previewStroke then
			previewStroke.Color=c1
			previewStroke.Thickness=UI_STYLE.StrokeThickness
			previewStroke.Transparency=UI_STYLE.StrokeTransparency
		end

		local corner=previewBox:FindFirstChildOfClass("UICorner")
		if corner then
			corner.CornerRadius=UDim.new(0,UI_STYLE.CornerRadius)
		end

		local grad=previewBox:FindFirstChild("PreviewGradient")

		if UI_STYLE.StrokeGradient or UI_STYLE.LiquidStroke then
			if not grad then
				grad=Instance.new("UIGradient")
				grad.Name="PreviewGradient"
				grad.Parent=previewBox
			end

			setGradientColors(grad,c1,c2)
			applyLiquidMotionToGradient(grad)
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

	local function refreshDirectionButtons()
		for _,entry in ipairs(directionButtons) do
			local selected=entry.Key==UI_STYLE.LiquidStrokeDirection

			if entry.Wrap then
				entry.Wrap.BackgroundColor3=selected and THEME.TEXT or THEME.BG
			end

			if entry.Button then
				entry.Button.TextColor3=selected and THEME.BG or THEME.TEXT
			end
		end
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
		if radiusSlider then radiusSlider.set(UI_STYLE.CornerRadius) end

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
		tintSlider(radiusSlider,THEME.TEXT)

		refreshDirectionButtons()
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

	local function makeSmallButton(parent,text,width,onClick)
		local btn=New("TextButton",{
			Size=UDim2.fromOffset(width or 54,24),
			BackgroundColor3=THEME.BG,
			BorderSizePixel=0,
			Text=text,
			Font=Enum.Font.Gotham,
			TextSize=10,
			TextColor3=THEME.TEXT,
			AutoButtonColor=false,
			ZIndex=6,
		},parent)

		local wrap=wrapTextButton(btn,THEME.BG,1)

		btn.MouseEnter:Connect(function()
			if wrap.BackgroundColor3~=THEME.TEXT then
				wrap.BackgroundColor3=Color3.fromRGB(35,35,35)
			end
		end)

		btn.MouseLeave:Connect(function()
			refreshDirectionButtons()
			if wrap.BackgroundColor3~=THEME.TEXT then
				wrap.BackgroundColor3=THEME.BG
			end
		end)

		btn.MouseButton1Click:Connect(onClick)

		return btn,wrap
	end

	local function applyThemePreset(preset)
		UI_STYLE.StrokeGradient=true
		UI_STYLE.LiquidStroke=preset.Liquid and true or false
		UI_STYLE.LiquidStrokeSpeed=math.clamp(tonumber(preset.Speed) or 1,0,5)
		UI_STYLE.LiquidStrokeDirection=tostring(preset.Direction or "Right")
		UI_STYLE.StrokeThickness=math.clamp(tonumber(preset.Thickness) or 2,0,8)
		UI_STYLE.StrokeTransparency=math.clamp(tonumber(preset.Transparency) or 0,0,1)
		UI_STYLE.CornerRadius=math.clamp(tonumber(preset.Radius) or 0,0,24)

		local gradientEnabled=true

		if not UI_STYLE.LiquidStroke and preset.Second==nil then
			gradientEnabled=false
		end

		syncColourControls()
		tweenStyleTo(preset.Main,preset.Second or preset.Main,gradientEnabled)
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

	function api.ApplyThemePreset(index)
		local preset=THEME_PRESETS[index]
		if preset then
			applyThemePreset(preset)
		end
	end

	clearPage()

	local presetSection=makeSection(page,1,"Customisation","Live preview and quick styles.")
	local colourSection=makeSection(page,2,"Colours","Tune the base stroke and gradient endpoint.")
	local motionSection=makeSection(page,3,"Liquid Motion","Animate the gradient and choose its flow direction.")
	local shapeSection=makeSection(page,4,"Border Shape","Control thickness, transparency, and corner radius.")

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

	New("UICorner",{CornerRadius=UDim.new(0,UI_STYLE.CornerRadius)},previewBox)

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
		Text="Theme presets",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},presetSection)

	local themeRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,30),
		ZIndex=5,
	},presetSection)

	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,6),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},themeRow)

	for i,preset in ipairs(THEME_PRESETS) do
		local btn=New("TextButton",{
			Size=UDim2.fromOffset(58,24),
			BackgroundColor3=preset.Main,
			BorderSizePixel=0,
			Text=preset.Name,
			Font=Enum.Font.GothamMedium,
			TextSize=9,
			TextColor3=Color3.fromRGB(0,0,0),
			AutoButtonColor=false,
			ZIndex=6,
		},themeRow)

		New("UIStroke",{
			Color=THEME.STROKE,
			Thickness=1,
			Transparency=0,
		},btn)

		local grad=Instance.new("UIGradient")
		grad.Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,preset.Main),
			ColorSequenceKeypoint.new(1,preset.Second or preset.Main),
		})
		grad.Parent=btn

		btn.MouseButton1Click:Connect(function()
			applyThemePreset(preset)
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

	rSlider=buildSlider(colourSection,"R",0,255,UI_STYLE.StrokeR,0,function(v)
		UI_STYLE.StrokeR=v
		tintSlider(rSlider,Color3.fromRGB(v,0,0))
		updateEverything()
	end)

	gSlider=buildSlider(colourSection,"G",0,255,UI_STYLE.StrokeG,0,function(v)
		UI_STYLE.StrokeG=v
		tintSlider(gSlider,Color3.fromRGB(0,v,0))
		updateEverything()
	end)

	bSlider=buildSlider(colourSection,"B",0,255,UI_STYLE.StrokeB,0,function(v)
		UI_STYLE.StrokeB=v
		tintSlider(bSlider,Color3.fromRGB(0,0,v))
		updateEverything()
	end)

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,16),
		Text="Quick colours",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},colourSection)

	local paletteRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,30),
		ZIndex=5,
	},colourSection)

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
		Text="Gradient end colour",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},colourSection)

	grSlider=buildSlider(colourSection,"R2",0,255,UI_STYLE.GradientR,0,function(v)
		UI_STYLE.GradientR=v
		tintSlider(grSlider,Color3.fromRGB(v,0,0))
		updateEverything()
	end)

	ggSlider=buildSlider(colourSection,"G2",0,255,UI_STYLE.GradientG,0,function(v)
		UI_STYLE.GradientG=v
		tintSlider(ggSlider,Color3.fromRGB(0,v,0))
		updateEverything()
	end)

	gbSlider=buildSlider(colourSection,"B2",0,255,UI_STYLE.GradientB,0,function(v)
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
		{Color3.fromRGB(0,255,255),Color3.fromRGB(170,70,255)},
		{Color3.fromRGB(255,70,180),Color3.fromRGB(80,120,255)},
		{Color3.fromRGB(0,255,120),Color3.fromRGB(0,160,255)},
		{Color3.fromRGB(255,150,0),Color3.fromRGB(0,230,255)},
		{Color3.fromRGB(120,70,255),Color3.fromRGB(255,80,200)},
		{Color3.fromRGB(255,255,255),Color3.fromRGB(0,255,255)},
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

	liquidToggle=buildToggleRow(motionSection,"Liquid Stroke",UI_STYLE.LiquidStroke,function(state)
		UI_STYLE.LiquidStroke=state and true or false

		if state then
			UI_STYLE.StrokeGradient=true
			if gradientToggle then
				gradientToggle.set(true)
			end
		end

		updateEverything()
	end)

	speedSlider=buildSlider(motionSection,"Liquid Speed",0,5,UI_STYLE.LiquidStrokeSpeed,2,function(v)
		UI_STYLE.LiquidStrokeSpeed=math.clamp(tonumber(v) or 0,0,5)
		updateEverything()
	end)

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,16),
		Text="Liquid direction",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},motionSection)

	local directionRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,30),
		ZIndex=5,
	},motionSection)

	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,6),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},directionRow)

	for _,item in ipairs(LIQUID_DIRECTIONS) do
		local btn,wrap=makeSmallButton(directionRow,item.Label,54,function()
			UI_STYLE.LiquidStrokeDirection=item.Key
			UI_STYLE.LiquidStroke=true
			UI_STYLE.StrokeGradient=true

			if liquidToggle then liquidToggle.set(true) end
			if gradientToggle then gradientToggle.set(true) end

			refreshDirectionButtons()
			updateEverything()
		end)

		table.insert(directionButtons,{
			Key=item.Key,
			Button=btn,
			Wrap=wrap,
		})
	end

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,16),
		Text="Shape and visibility",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},shapeSection)

	thicknessSlider=buildSlider(shapeSection,"Stroke Thickness",0,8,UI_STYLE.StrokeThickness,1,function(v)
		UI_STYLE.StrokeThickness=math.clamp(tonumber(v) or 0,0,8)
		updateEverything()
	end)

	transparencySlider=buildSlider(shapeSection,"Stroke Transparency",0,1,UI_STYLE.StrokeTransparency,2,function(v)
		UI_STYLE.StrokeTransparency=math.clamp(tonumber(v) or 0,0,1)
		updateEverything()
	end)

	radiusSlider=buildSlider(shapeSection,"Corner Radius",0,24,UI_STYLE.CornerRadius,0,function(v)
		UI_STYLE.CornerRadius=math.clamp(tonumber(v) or 0,0,24)
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
