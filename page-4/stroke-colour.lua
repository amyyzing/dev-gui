local StrokeColour={}

local TweenService=game:GetService("TweenService")
local RunService=game:GetService("RunService")

local DEFAULTS={
	PrimaryR=28,
	PrimaryG=28,
	PrimaryB=28,

	StrokeR=76,
	StrokeG=76,
	StrokeB=76,

	GradientR=45,
	GradientG=45,
	GradientB=45,

	StrokeGradient=false,
	LiquidStroke=false,

	LiquidStrokeSpeed=1,
	LiquidStrokeDirection="Right",

	StrokeThickness=1,
	StrokeTransparency=0.55,
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
	style.PrimaryR=numberOrDefault(style.PrimaryR,DEFAULTS.PrimaryR)
	style.PrimaryG=numberOrDefault(style.PrimaryG,DEFAULTS.PrimaryG)
	style.PrimaryB=numberOrDefault(style.PrimaryB,DEFAULTS.PrimaryB)

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
	style.CornerRadius=0
end

local function copyDefaultStyle(style)
	style=style or DEFAULTS

	return{
		PrimaryR=numberOrDefault(style.PrimaryR,DEFAULTS.PrimaryR),
		PrimaryG=numberOrDefault(style.PrimaryG,DEFAULTS.PrimaryG),
		PrimaryB=numberOrDefault(style.PrimaryB,DEFAULTS.PrimaryB),

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
		CornerRadius=0,
	}
end

local function colorFromStyle(style,prefix)
	if prefix=="Primary" then
		return Color3.fromRGB(clampByte(style.PrimaryR),clampByte(style.PrimaryG),clampByte(style.PrimaryB))
	end

	if prefix=="Gradient" then
		return Color3.fromRGB(clampByte(style.GradientR),clampByte(style.GradientG),clampByte(style.GradientB))
	end

	return Color3.fromRGB(clampByte(style.StrokeR),clampByte(style.StrokeG),clampByte(style.StrokeB))
end

local function writeColorToStyle(style,prefix,c)
	if prefix=="Primary" then
		style.PrimaryR=math.floor(c.R*255+0.5)
		style.PrimaryG=math.floor(c.G*255+0.5)
		style.PrimaryB=math.floor(c.B*255+0.5)
	elseif prefix=="Gradient" then
		style.GradientR=math.floor(c.R*255+0.5)
		style.GradientG=math.floor(c.G*255+0.5)
		style.GradientB=math.floor(c.B*255+0.5)
	else
		style.StrokeR=math.floor(c.R*255+0.5)
		style.StrokeG=math.floor(c.G*255+0.5)
		style.StrokeB=math.floor(c.B*255+0.5)
	end
end

local function colorsMatch(a,b)
	if not (a and b) then
		return false
	end

	return math.abs(a.R-b.R)<0.01 and math.abs(a.G-b.G)<0.01 and math.abs(a.B-b.B)<0.01
end

local function readableTextColor(color)
	local luminance=(color.R*0.2126)+(color.G*0.7152)+(color.B*0.0722)

	if luminance<0.55 then
		return Color3.fromRGB(245,245,245)
	end

	return Color3.fromRGB(18,18,18)
end

function StrokeColour.new(ctx,page)
	local New=ctx.New
	local THEME=ctx.THEME
	local UI_STYLE=ctx.UI_STYLE
	local SG=ctx.SG
	local UIS=ctx.UIS or game:GetService("UserInputService")
	local externalThemeApplier=ctx.applyUIStrokeTheme~=nil

	ensureStyleDefaults(UI_STYLE)

	local defaultStyle=copyDefaultStyle(ctx.DEFAULT_UI_STYLE or UI_STYLE)

	local api={}
	local prSlider,pgSlider,pbSlider
	local rSlider,gSlider,bSlider
	local grSlider,ggSlider,gbSlider
	local speedSlider,thicknessSlider,transparencySlider
	local gradientToggle,liquidToggle
	local previewBox,previewStroke,previewText
	local colourTweenToken=0
	local liquidConn=nil
	local liquidClock=0
	local updatePreview=nil
	local paintChoices=function() end
	local syncPickerControls=function() paintChoices() end
	local setPickerFromColor=function() end
	local getActiveColor=function() return colorFromStyle(UI_STYLE,"Primary") end
	local connections={}

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

	local function getUIPrimaryColor()
		if ctx.getUIPrimaryColor then
			return ctx.getUIPrimaryColor()
		end

		return colorFromStyle(UI_STYLE,"Primary")
	end

	local function tintSlider(slider,color)
		local sliderColor=color or getUIStrokeColor()
		if ctx.tintSlider then
			ctx.tintSlider(slider,sliderColor)
			return
		end

		if slider and slider.fill then
			slider.fill:SetAttribute("ThemeRole",nil)
			slider.fill.BackgroundColor3=sliderColor
		end
		if slider and slider.knob then
			slider.knob:SetAttribute("ThemeRole",nil)
			slider.knob.BackgroundColor3=sliderColor
		end
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
							if obj:GetAttribute("BaseStrokeTransparency")==nil then
								obj:SetAttribute("BaseStrokeTransparency",obj.Transparency)
							end

							local baseTransparency=tonumber(obj:GetAttribute("BaseStrokeTransparency")) or obj.Transparency
							local styleTransparency=tonumber(UI_STYLE.StrokeTransparency) or DEFAULTS.StrokeTransparency

							obj.Color=UI_STYLE.LiquidStroke and getPulseColor() or color
							obj.Thickness=UI_STYLE.StrokeThickness
							obj.Transparency=math.clamp(math.max(baseTransparency,styleTransparency),0,1)

							pcall(function()
								obj.LineJoinMode=Enum.LineJoinMode.Miter
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

		local primary=getUIPrimaryColor()
		previewBox.BackgroundColor3=primary

		if previewText then
			local luminance=(primary.R*0.2126)+(primary.G*0.7152)+(primary.B*0.0722)
			previewText.TextColor3=luminance<0.55 and Color3.fromRGB(245,245,245) or Color3.fromRGB(18,18,18)
		end

		if previewStroke then
			previewStroke.Color=getPulseColor()
			previewStroke.Thickness=UI_STYLE.StrokeThickness
			previewStroke.Transparency=math.clamp(UI_STYLE.StrokeTransparency+(getPulseAlpha()*0.08),0,1)
		end

		local oldFillGradient=previewBox:FindFirstChild("PreviewGradient")
		if oldFillGradient then
			oldFillGradient:Destroy()
		end

		local grad=previewStroke and previewStroke:FindFirstChild("PreviewGradient")

		if UI_STYLE.StrokeGradient or UI_STYLE.LiquidStroke then
			if not grad then
				grad=Instance.new("UIGradient")
				grad.Name="PreviewGradient"
				grad.Parent=previewStroke
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

	local function setPrimaryColour(c)
		writeColorToStyle(UI_STYLE,"Primary",c)
	end

	local function setGradientColour(c)
		writeColorToStyle(UI_STYLE,"Gradient",c)
	end

	local function syncColourControls()
		if prSlider then prSlider.set(UI_STYLE.PrimaryR) end
		if pgSlider then pgSlider.set(UI_STYLE.PrimaryG) end
		if pbSlider then pbSlider.set(UI_STYLE.PrimaryB) end

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

		tintSlider(prSlider,Color3.fromRGB(clampByte(UI_STYLE.PrimaryR),0,0))
		tintSlider(pgSlider,Color3.fromRGB(0,clampByte(UI_STYLE.PrimaryG),0))
		tintSlider(pbSlider,Color3.fromRGB(0,0,clampByte(UI_STYLE.PrimaryB)))

		tintSlider(rSlider,Color3.fromRGB(clampByte(UI_STYLE.StrokeR),0,0))
		tintSlider(gSlider,Color3.fromRGB(0,clampByte(UI_STYLE.StrokeG),0))
		tintSlider(bSlider,Color3.fromRGB(0,0,clampByte(UI_STYLE.StrokeB)))

		tintSlider(grSlider,Color3.fromRGB(clampByte(UI_STYLE.GradientR),0,0))
		tintSlider(ggSlider,Color3.fromRGB(0,clampByte(UI_STYLE.GradientG),0))
		tintSlider(gbSlider,Color3.fromRGB(0,0,clampByte(UI_STYLE.GradientB)))

		tintSlider(speedSlider,getUIStrokeColor())
		tintSlider(thicknessSlider,getUIStrokeColor())
		tintSlider(transparencySlider,getUIStrokeColor())
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
			syncPickerControls()
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
				syncPickerControls()
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
		syncPickerControls()
	end

	function api.Destroy()
		colourTweenToken=colourTweenToken+1
		stopLiquidAnimation()

		for _,conn in ipairs(connections) do
			pcall(function()
				conn:Disconnect()
			end)
		end
	end

	function api.Reset()
		UI_STYLE.PrimaryR=defaultStyle.PrimaryR
		UI_STYLE.PrimaryG=defaultStyle.PrimaryG
		UI_STYLE.PrimaryB=defaultStyle.PrimaryB

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

	function api.ApplyPrimaryColour(c)
		setPrimaryColour(c)
		syncColourControls()
		updateEverything()
		syncPickerControls()
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
		setPickerFromColor(getActiveColor())
		syncPickerControls()
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
		setPickerFromColor(getActiveColor())
		syncPickerControls()
	end

	clearPage()

	local pageLayout=page:FindFirstChildOfClass("UIListLayout")
	if pageLayout then
		pageLayout.Padding=UDim.new(0,10)
	end

	if not page:FindFirstChild("CustomizePagePadding") then
		New("UIPadding",{
			Name="CustomizePagePadding",
			PaddingTop=UDim.new(0,2),
			PaddingLeft=UDim.new(0,4),
			PaddingRight=UDim.new(0,4),
			PaddingBottom=UDim.new(0,2),
		},page)
	end

	local activeTarget="Primary"
	local activeMode="Square"
	local pickerHue,pickerSat,pickerVal=0,0,1
	local colorDrag=nil

	local targetButtons={}
	local modeButtons={}
	local themeCards={}
	local borderChoices={}
	local quickChoices={}
	local rgbSliders={}
	local hsvSliders={}
	local modeBodies={}
	local colorPreview,previewHex,hexBox
	local svBase,svCursor,hueCursor

	local function trackConnection(conn)
		connections[#connections+1]=conn
		return conn
	end

	local function toHSV(color)
		local ok,h,s,v=pcall(function()
			return Color3.toHSV(color)
		end)

		if ok then
			return h,s,v
		end

		return color:ToHSV()
	end

	local function colorToHex(color)
		return string.format("#%02X%02X%02X",
			clampByte(color.R*255),
			clampByte(color.G*255),
			clampByte(color.B*255)
		)
	end

	local function parseHex(value)
		local hex=tostring(value or ""):gsub("#",""):gsub("%s","")

		if #hex==3 then
			hex=hex:sub(1,1)..hex:sub(1,1)..hex:sub(2,2)..hex:sub(2,2)..hex:sub(3,3)..hex:sub(3,3)
		end

		if #hex~=6 or hex:find("[^%x]") then
			return nil
		end

		return Color3.fromRGB(
			tonumber(hex:sub(1,2),16),
			tonumber(hex:sub(3,4),16),
			tonumber(hex:sub(5,6),16)
		)
	end

	local function makeLabel(parent,text,order,size,muted)
		return New("TextLabel",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,0,size and 20 or 18),
			Text=text,
			Font=Enum.Font.GothamBold,
			TextSize=size or 13,
			TextColor3=muted and THEME.MUTED or THEME.TEXT,
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=6,
			LayoutOrder=order,
		},parent)
	end

	local function makePanel(order)
		local panel=New("Frame",{
			BackgroundColor3=THEME.CARD,
			BackgroundTransparency=0.12,
			BorderSizePixel=0,
			Size=UDim2.new(1,0,0,0),
			AutomaticSize=Enum.AutomaticSize.Y,
			ZIndex=4,
			LayoutOrder=order,
			ThemeRole="CARD",
		},page)

		New("UIPadding",{
			PaddingTop=UDim.new(0,12),
			PaddingLeft=UDim.new(0,14),
			PaddingRight=UDim.new(0,14),
			PaddingBottom=UDim.new(0,12),
		},panel)

		New("UIListLayout",{
			Padding=UDim.new(0,8),
			SortOrder=Enum.SortOrder.LayoutOrder,
		},panel)

		return panel
	end

	local function makeFlatButton(parent,text,order,scale)
		local button=New("TextButton",{
			BackgroundColor3=THEME.PANEL,
			BorderSizePixel=0,
			Text=text,
			Font=Enum.Font.GothamMedium,
			TextSize=12,
			TextColor3=THEME.TEXT,
			AutoButtonColor=false,
			Size=UDim2.new(scale or 0.333,-6,1,0),
			ZIndex=6,
			LayoutOrder=order,
			SkipThemeRole=true,
		},parent)

		local marker=New("Frame",{
			BackgroundColor3=getUIStrokeColor(),
			BorderSizePixel=0,
			Size=UDim2.new(1,0,0,3),
			Position=UDim2.new(0,0,1,-3),
			Visible=false,
			SkipThemeRole=true,
			ZIndex=7,
		},button)

		button.MouseEnter:Connect(function()
			button.BackgroundColor3=THEME.CARD
		end)

		button.MouseLeave:Connect(function()
			paintChoices()
		end)

		return button,marker
	end

	local function makeMiniSlider(parent,labelText,minVal,maxVal,startVal,decimals,fillColor,onChange)
		local row=New("Frame",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,0,28),
			ZIndex=5,
		},parent)

		New("TextLabel",{
			BackgroundTransparency=1,
			Position=UDim2.fromOffset(0,0),
			Size=UDim2.fromOffset(34,28),
			Text=labelText,
			Font=Enum.Font.GothamBold,
			TextSize=12,
			TextColor3=THEME.TEXT,
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=6,
		},row)

		local valueBox=New("TextBox",{
			BackgroundColor3=THEME.PANEL,
			BorderSizePixel=0,
			ClearTextOnFocus=true,
			Size=UDim2.fromOffset(48,24),
			Position=UDim2.new(1,-48,0,2),
			Text=tostring(startVal),
			Font=Enum.Font.GothamMedium,
			TextSize=12,
			TextColor3=THEME.TEXT,
			TextXAlignment=Enum.TextXAlignment.Center,
			ZIndex=6,
			ThemeRole="PANEL",
		},row)

		local track=New("Frame",{
			BackgroundColor3=THEME.BG,
			BorderSizePixel=0,
			Position=UDim2.fromOffset(36,9),
			Size=UDim2.new(1,-92,0,10),
			ZIndex=6,
			ThemeRole="BG",
		},row)

		local fill=New("Frame",{
			BackgroundColor3=fillColor or getUIStrokeColor(),
			BorderSizePixel=0,
			Size=UDim2.new(0,0,1,0),
			SkipThemeRole=true,
			ZIndex=7,
		},track)

		local hit=New("TextButton",{
			BackgroundTransparency=1,
			Text="",
			Size=UDim2.new(1,0,1,10),
			Position=UDim2.new(0,0,0,-5),
			ZIndex=8,
			AutoButtonColor=false,
		},track)

		local value=startVal
		local dragging=false

		local function roundTo(v,d)
			local m=10^d
			return math.floor(v*m+0.5)/m
		end

		local function setVisual(v)
			local pct=math.clamp((v-minVal)/(maxVal-minVal),0,1)
			fill.Size=UDim2.new(pct,0,1,0)
			valueBox.Text=decimals==0 and tostring(math.floor(v+0.5)) or string.format("%."..decimals.."f",v)
		end

		local function valueFromMouse()
			local mouse=UIS:GetMouseLocation()
			local pct=math.clamp((mouse.X-track.AbsolutePosition.X)/math.max(track.AbsoluteSize.X,1),0,1)
			return roundTo(minVal+(maxVal-minVal)*pct,decimals)
		end

		local function setValue(v,fire)
			value=roundTo(math.clamp(tonumber(v) or value,minVal,maxVal),decimals)
			setVisual(value)

			if fire and onChange then
				onChange(value)
			end
		end

		hit.InputBegan:Connect(function(input)
			if input.UserInputType==Enum.UserInputType.MouseButton1 then
				dragging=true
				setValue(valueFromMouse(),true)
			end
		end)

		trackConnection(UIS.InputChanged:Connect(function(input)
			if dragging and input.UserInputType==Enum.UserInputType.MouseMovement then
				setValue(valueFromMouse(),true)
			end
		end))

		trackConnection(UIS.InputEnded:Connect(function(input)
			if input.UserInputType==Enum.UserInputType.MouseButton1 then
				dragging=false
			end
		end))

		valueBox.FocusLost:Connect(function()
			local n=tonumber(valueBox.Text)
			if n then
				setValue(n,true)
			else
				setVisual(value)
			end
		end)

		setValue(startVal,false)

		return{set=function(v,fire) setValue(v,fire) end,get=function() return value end,fill=fill,box=valueBox}
	end

	getActiveColor=function()
		if activeTarget=="Primary" then
			return getUIPrimaryColor()
		end

		if activeTarget=="Gradient" then
			return getUIStrokeGradientColor()
		end

		return getUIStrokeColor()
	end

	setPickerFromColor=function(color)
		pickerHue,pickerSat,pickerVal=toHSV(color)
	end

	local function writeActiveColor(color)
		if activeTarget=="Primary" then
			setPrimaryColour(color)
		elseif activeTarget=="Gradient" then
			UI_STYLE.StrokeGradient=true
			setGradientColour(color)
		else
			setMainColour(color)
		end

		syncColourControls()
		updateEverything()
	end

	local function applyActiveColor(color,keepPicker)
		if not keepPicker then
			setPickerFromColor(color)
		end

		writeActiveColor(color)
		syncPickerControls()
	end

	local function setActiveTarget(target)
		activeTarget=target
		setPickerFromColor(getActiveColor())
		syncPickerControls()
	end

	local function setActiveMode(mode)
		activeMode=mode
		syncPickerControls()
	end

	local previewRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,60),
		ZIndex=5,
		LayoutOrder=1,
	},page)

	New("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(4,6),
		Size=UDim2.new(1,-128,0,22),
		Text="Appearance",
		Font=Enum.Font.GothamBold,
		TextSize=18,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},previewRow)

	New("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(4,30),
		Size=UDim2.new(1,-128,0,16),
		Text="Small theme controls with softer borders.",
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=THEME.MUTED,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},previewRow)

	previewBox=New("Frame",{
		AnchorPoint=Vector2.new(1,0.5),
		Size=UDim2.fromOffset(92,44),
		Position=UDim2.new(1,-4,0.5,0),
		BackgroundColor3=getUIPrimaryColor(),
		BorderSizePixel=0,
		SkipThemeRole=true,
		ZIndex=6,
	},previewRow)

	previewStroke=New("UIStroke",{
		Color=getUIStrokeColor(),
		Thickness=UI_STYLE.StrokeThickness,
		Transparency=UI_STYLE.StrokeTransparency,
	},previewBox)

	previewText=New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,1,0),
		Text="Preview",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=Color3.fromRGB(0,0,0),
		ZIndex=7,
	},previewBox)

	local themePanel=makePanel(2)
	makeLabel(themePanel,"Theme",1,13,false)

	local themeGrid=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,92),
		ZIndex=5,
		LayoutOrder=2,
	},themePanel)

	New("UIGridLayout",{
		CellPadding=UDim2.fromOffset(8,8),
		CellSize=UDim2.new(0.333,-6,0,42),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},themeGrid)

	local themePresets={
		{Name="Void",Primary=Color3.fromRGB(28,28,28),Stroke=Color3.fromRGB(76,76,76),Gradient=Color3.fromRGB(45,45,45),GradientOn=false},
		{Name="Polar",Primary=Color3.fromRGB(238,238,238),Stroke=Color3.fromRGB(190,190,190),Gradient=Color3.fromRGB(115,115,115),GradientOn=false},
		{Name="Midnight",Primary=Color3.fromRGB(12,18,38),Stroke=Color3.fromRGB(72,98,158),Gradient=Color3.fromRGB(21,103,251),GradientOn=true},
		{Name="Crimson",Primary=Color3.fromRGB(58,17,24),Stroke=Color3.fromRGB(150,45,54),Gradient=Color3.fromRGB(254,94,86),GradientOn=true},
		{Name="Evergreen",Primary=Color3.fromRGB(18,36,34),Stroke=Color3.fromRGB(45,112,78),Gradient=Color3.fromRGB(32,202,106),GradientOn=true},
		{Name="Steel",Primary=Color3.fromRGB(24,27,34),Stroke=Color3.fromRGB(96,110,132),Gradient=Color3.fromRGB(158,170,188),GradientOn=true},
	}

	local function applyThemePreset(preset)
		setPrimaryColour(preset.Primary)
		UI_STYLE.LiquidStroke=false
		UI_STYLE.StrokeThickness=1
		UI_STYLE.StrokeTransparency=0.55
		syncColourControls()
		updateEverything()
		tweenStyleTo(preset.Stroke,preset.Gradient,preset.GradientOn)
		setPickerFromColor(getActiveColor())
		syncPickerControls()
	end

	for i,preset in ipairs(themePresets) do
		local textColor=readableTextColor(preset.Primary)
		local card=New("TextButton",{
			BackgroundColor3=preset.Primary,
			BorderSizePixel=0,
			Text="",
			AutoButtonColor=false,
			SkipThemeRole=true,
			ZIndex=6,
			LayoutOrder=i,
		},themeGrid)

		local marker=New("Frame",{
			BackgroundColor3=preset.Stroke,
			BorderSizePixel=0,
			Size=UDim2.new(1,0,0,3),
			Position=UDim2.new(0,0,1,-3),
			Visible=false,
			SkipThemeRole=true,
			ZIndex=8,
		},card)

		New("TextLabel",{
			BackgroundTransparency=1,
			Position=UDim2.fromOffset(9,8),
			Size=UDim2.new(1,-18,0,18),
			Text=preset.Name,
			Font=Enum.Font.GothamBold,
			TextSize=12,
			TextColor3=textColor,
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=7,
		},card)

		card.MouseButton1Click:Connect(function()
			applyThemePreset(preset)
		end)

		themeCards[#themeCards+1]={Preset=preset,Card=card,Marker=marker}
	end

	local colorPanel=makePanel(3)
	makeLabel(colorPanel,"Colours",1,13,false)

	local targetRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,28),
		ZIndex=5,
		LayoutOrder=2,
	},colorPanel)

	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,8),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},targetRow)

	for i,target in ipairs({"Primary","Stroke","Gradient"}) do
		local button,marker=makeFlatButton(targetRow,target,i)
		button.MouseButton1Click:Connect(function()
			setActiveTarget(target)
		end)

		targetButtons[target]={Button=button,Marker=marker}
	end

	local modeRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,28),
		ZIndex=5,
		LayoutOrder=3,
	},colorPanel)

	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,8),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},modeRow)

	for i,mode in ipairs({"Square","RGB","HSV","Hex"}) do
		local button,marker=makeFlatButton(modeRow,mode,i,0.25)
		button.MouseButton1Click:Connect(function()
			setActiveMode(mode)
		end)

		modeButtons[mode]={Button=button,Marker=marker}
	end

	local quickRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,26),
		ZIndex=5,
		LayoutOrder=4,
	},colorPanel)

	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,7),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},quickRow)

	for i,color in ipairs({
		Color3.fromRGB(28,28,28),
		Color3.fromRGB(238,238,238),
		Color3.fromRGB(76,76,76),
		Color3.fromRGB(32,202,106),
		Color3.fromRGB(21,103,251),
		Color3.fromRGB(254,94,86),
		Color3.fromRGB(180,80,255),
		Color3.fromRGB(255,210,0),
		Color3.fromRGB(0,210,210),
	}) do
		local swatch=New("TextButton",{
			BackgroundColor3=color,
			BorderSizePixel=0,
			Text="",
			AutoButtonColor=false,
			SkipThemeRole=true,
			Size=UDim2.fromOffset(30,24),
			ZIndex=6,
			LayoutOrder=i,
		},quickRow)

		local marker=New("Frame",{
			BackgroundColor3=readableTextColor(color),
			BorderSizePixel=0,
			Size=UDim2.new(1,0,0,3),
			Position=UDim2.new(0,0,1,-3),
			Visible=false,
			SkipThemeRole=true,
			ZIndex=7,
		},swatch)

		swatch.MouseButton1Click:Connect(function()
			applyActiveColor(color,false)
		end)

		quickChoices[#quickChoices+1]={Color=color,Marker=marker}
	end

	local pickerBody=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,128),
		ZIndex=5,
		LayoutOrder=5,
	},colorPanel)

	for _,mode in ipairs({"Square","RGB","HSV","Hex"}) do
		modeBodies[mode]=New("Frame",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,1,0),
			Visible=false,
			ZIndex=5,
		},pickerBody)
	end

	local squareBody=modeBodies.Square
	local svSquare=New("Frame",{
		BackgroundColor3=Color3.fromRGB(255,0,0),
		BorderSizePixel=0,
		Position=UDim2.fromOffset(0,8),
		Size=UDim2.fromOffset(148,104),
		SkipThemeRole=true,
		ZIndex=6,
	},squareBody)
	svBase=svSquare

	local whiteOverlay=New("Frame",{
		BackgroundColor3=Color3.fromRGB(255,255,255),
		BorderSizePixel=0,
		Size=UDim2.new(1,0,1,0),
		SkipThemeRole=true,
		ZIndex=7,
	},svSquare)
	New("UIGradient",{
		Transparency=NumberSequence.new({
			NumberSequenceKeypoint.new(0,0),
			NumberSequenceKeypoint.new(1,1),
		}),
	},whiteOverlay)

	local blackOverlay=New("Frame",{
		BackgroundColor3=Color3.fromRGB(0,0,0),
		BorderSizePixel=0,
		Size=UDim2.new(1,0,1,0),
		SkipThemeRole=true,
		ZIndex=8,
	},svSquare)
	New("UIGradient",{
		Rotation=90,
		Transparency=NumberSequence.new({
			NumberSequenceKeypoint.new(0,1),
			NumberSequenceKeypoint.new(1,0),
		}),
	},blackOverlay)

	svCursor=New("Frame",{
		BackgroundColor3=Color3.fromRGB(255,255,255),
		BorderSizePixel=0,
		Size=UDim2.fromOffset(8,8),
		SkipThemeRole=true,
		ZIndex=9,
	},svSquare)
	New("UIStroke",{Color=Color3.fromRGB(0,0,0),Thickness=1,Transparency=0.35},svCursor)

	local hueStrip=New("Frame",{
		BackgroundColor3=Color3.fromRGB(255,255,255),
		BorderSizePixel=0,
		Position=UDim2.fromOffset(158,8),
		Size=UDim2.fromOffset(18,104),
		SkipThemeRole=true,
		ZIndex=6,
	},squareBody)
	New("UIGradient",{
		Rotation=90,
		Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,Color3.fromHSV(0,1,1)),
			ColorSequenceKeypoint.new(0.17,Color3.fromHSV(0.17,1,1)),
			ColorSequenceKeypoint.new(0.33,Color3.fromHSV(0.33,1,1)),
			ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),
			ColorSequenceKeypoint.new(0.67,Color3.fromHSV(0.67,1,1)),
			ColorSequenceKeypoint.new(0.83,Color3.fromHSV(0.83,1,1)),
			ColorSequenceKeypoint.new(1,Color3.fromHSV(1,1,1)),
		}),
	},hueStrip)

	hueCursor=New("Frame",{
		BackgroundColor3=Color3.fromRGB(255,255,255),
		BorderSizePixel=0,
		Size=UDim2.new(1,0,0,3),
		SkipThemeRole=true,
		ZIndex=8,
	},hueStrip)

	colorPreview=New("Frame",{
		BackgroundColor3=getActiveColor(),
		BorderSizePixel=0,
		Position=UDim2.fromOffset(192,8),
		Size=UDim2.fromOffset(92,54),
		SkipThemeRole=true,
		ZIndex=6,
	},squareBody)

	previewHex=New("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(192,70),
		Size=UDim2.fromOffset(92,18),
		Text=colorToHex(getActiveColor()),
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},squareBody)

	local function updateColorDrag()
		local mouse=UIS:GetMouseLocation()

		if colorDrag=="SV" and svSquare.AbsoluteSize.X>0 then
			pickerSat=math.clamp((mouse.X-svSquare.AbsolutePosition.X)/svSquare.AbsoluteSize.X,0,1)
			pickerVal=1-math.clamp((mouse.Y-svSquare.AbsolutePosition.Y)/svSquare.AbsoluteSize.Y,0,1)
			applyActiveColor(Color3.fromHSV(pickerHue,pickerSat,pickerVal),true)
		elseif colorDrag=="Hue" and hueStrip.AbsoluteSize.Y>0 then
			pickerHue=math.clamp((mouse.Y-hueStrip.AbsolutePosition.Y)/hueStrip.AbsoluteSize.Y,0,1)
			applyActiveColor(Color3.fromHSV(pickerHue,pickerSat,pickerVal),true)
		end
	end

	svSquare.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			colorDrag="SV"
			updateColorDrag()
		end
	end)

	hueStrip.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			colorDrag="Hue"
			updateColorDrag()
		end
	end)

	trackConnection(UIS.InputChanged:Connect(function(input)
		if colorDrag and input.UserInputType==Enum.UserInputType.MouseMovement then
			updateColorDrag()
		end
	end))

	trackConnection(UIS.InputEnded:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			colorDrag=nil
		end
	end))

	local rgbBody=modeBodies.RGB
	New("UIListLayout",{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder},rgbBody)
	rgbSliders.R=makeMiniSlider(rgbBody,"R",0,255,0,0,Color3.fromRGB(255,0,0),function()
		applyActiveColor(Color3.fromRGB(rgbSliders.R.get(),rgbSliders.G.get(),rgbSliders.B.get()),false)
	end)
	rgbSliders.G=makeMiniSlider(rgbBody,"G",0,255,0,0,Color3.fromRGB(0,255,0),function()
		applyActiveColor(Color3.fromRGB(rgbSliders.R.get(),rgbSliders.G.get(),rgbSliders.B.get()),false)
	end)
	rgbSliders.B=makeMiniSlider(rgbBody,"B",0,255,0,0,Color3.fromRGB(0,120,255),function()
		applyActiveColor(Color3.fromRGB(rgbSliders.R.get(),rgbSliders.G.get(),rgbSliders.B.get()),false)
	end)

	local hsvBody=modeBodies.HSV
	New("UIListLayout",{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder},hsvBody)
	hsvSliders.H=makeMiniSlider(hsvBody,"H",0,360,0,0,getUIStrokeColor(),function()
		pickerHue=math.clamp(hsvSliders.H.get()/360,0,1)
		pickerSat=math.clamp(hsvSliders.S.get()/100,0,1)
		pickerVal=math.clamp(hsvSliders.V.get()/100,0,1)
		applyActiveColor(Color3.fromHSV(pickerHue,pickerSat,pickerVal),true)
	end)
	hsvSliders.S=makeMiniSlider(hsvBody,"S",0,100,0,0,getUIStrokeColor(),function()
		pickerHue=math.clamp(hsvSliders.H.get()/360,0,1)
		pickerSat=math.clamp(hsvSliders.S.get()/100,0,1)
		pickerVal=math.clamp(hsvSliders.V.get()/100,0,1)
		applyActiveColor(Color3.fromHSV(pickerHue,pickerSat,pickerVal),true)
	end)
	hsvSliders.V=makeMiniSlider(hsvBody,"V",0,100,0,0,getUIStrokeColor(),function()
		pickerHue=math.clamp(hsvSliders.H.get()/360,0,1)
		pickerSat=math.clamp(hsvSliders.S.get()/100,0,1)
		pickerVal=math.clamp(hsvSliders.V.get()/100,0,1)
		applyActiveColor(Color3.fromHSV(pickerHue,pickerSat,pickerVal),true)
	end)

	local hexBody=modeBodies.Hex
	hexBox=New("TextBox",{
		BackgroundColor3=THEME.PANEL,
		BorderSizePixel=0,
		ClearTextOnFocus=false,
		Position=UDim2.fromOffset(0,8),
		Size=UDim2.new(1,-104,0,32),
		Text=colorToHex(getActiveColor()),
		Font=Enum.Font.GothamMedium,
		TextSize=13,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
		ThemeRole="PANEL",
	},hexBody)

	local applyHex=New("TextButton",{
		BackgroundColor3=THEME.PANEL,
		BorderSizePixel=0,
		Position=UDim2.new(1,-96,0,8),
		Size=UDim2.fromOffset(96,32),
		Text="Apply",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		AutoButtonColor=false,
		ZIndex=6,
		SkipThemeRole=true,
	},hexBody)

	local function commitHex()
		local color=parseHex(hexBox.Text)

		if color then
			applyActiveColor(color,false)
		else
			hexBox.Text=colorToHex(getActiveColor())
		end
	end

	hexBox.FocusLost:Connect(function()
		commitHex()
	end)

	applyHex.MouseButton1Click:Connect(commitHex)

	local borderPanel=makePanel(4)
	makeLabel(borderPanel,"Border",1,13,false)

	local borderRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,34),
		ZIndex=5,
		LayoutOrder=2,
	},borderPanel)

	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,8),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},borderRow)

	local borderOptions={
		{Name="Soft",Thickness=1,Transparency=0.72},
		{Name="Default",Thickness=1,Transparency=0.55},
		{Name="Strong",Thickness=2,Transparency=0.35},
	}

	for i,option in ipairs(borderOptions) do
		local button,marker=makeFlatButton(borderRow,option.Name,i)

		button.MouseButton1Click:Connect(function()
			UI_STYLE.StrokeThickness=option.Thickness
			UI_STYLE.StrokeTransparency=option.Transparency
			syncColourControls()
			updateEverything()
			syncPickerControls()
		end)

		borderChoices[#borderChoices+1]={Option=option,Button=button,Marker=marker}
	end

	paintChoices=function()
		local primary=getUIPrimaryColor()
		local stroke=getUIStrokeColor()
		local gradient=getUIStrokeGradientColor()
		local strokeGradient=UI_STYLE.StrokeGradient or UI_STYLE.LiquidStroke
		local activeColor=getActiveColor()

		for _,entry in ipairs(themeCards) do
			local preset=entry.Preset
			local selected=colorsMatch(primary,preset.Primary) and colorsMatch(stroke,preset.Stroke)

			if preset.GradientOn then
				selected=selected and strokeGradient and colorsMatch(gradient,preset.Gradient)
			else
				selected=selected and not strokeGradient
			end

			entry.Card.BackgroundColor3=selected and preset.Primary:Lerp(readableTextColor(preset.Primary),0.06) or preset.Primary
			entry.Marker.Visible=selected
			entry.Marker.BackgroundColor3=preset.Stroke
		end

		for key,entry in pairs(targetButtons) do
			local selected=key==activeTarget
			entry.Button.BackgroundColor3=selected and THEME.BG or THEME.PANEL
			entry.Marker.Visible=selected
			entry.Marker.BackgroundColor3=stroke
		end

		for key,entry in pairs(modeButtons) do
			local selected=key==activeMode
			entry.Button.BackgroundColor3=selected and THEME.BG or THEME.PANEL
			entry.Marker.Visible=selected
			entry.Marker.BackgroundColor3=stroke
		end

		for _,entry in ipairs(quickChoices) do
			entry.Marker.Visible=colorsMatch(activeColor,entry.Color)
			entry.Marker.BackgroundColor3=readableTextColor(entry.Color)
		end

		for _,entry in ipairs(borderChoices) do
			local option=entry.Option
			local selected=math.abs((tonumber(UI_STYLE.StrokeThickness) or 0)-option.Thickness)<0.05
				and math.abs((tonumber(UI_STYLE.StrokeTransparency) or 0)-option.Transparency)<0.05

			entry.Button.BackgroundColor3=selected and THEME.BG or THEME.PANEL
			entry.Marker.Visible=selected
			entry.Marker.BackgroundColor3=stroke
		end

		if applyHex then
			applyHex.BackgroundColor3=THEME.PANEL
		end
	end

	syncPickerControls=function()
		local color=getActiveColor()
		pickerHue,pickerSat,pickerVal=toHSV(color)

		if svBase then
			svBase.BackgroundColor3=Color3.fromHSV(pickerHue,1,1)
		end

		if svCursor then
			svCursor.Position=UDim2.new(pickerSat,-4,1-pickerVal,-4)
		end

		if hueCursor then
			hueCursor.Position=UDim2.new(0,0,pickerHue,-1)
		end

		if colorPreview then
			colorPreview.BackgroundColor3=color
		end

		if previewHex then
			previewHex.Text=colorToHex(color)
		end

		if hexBox then
			hexBox.Text=colorToHex(color)
		end

		if rgbSliders.R then
			rgbSliders.R.set(clampByte(color.R*255),false)
			rgbSliders.G.set(clampByte(color.G*255),false)
			rgbSliders.B.set(clampByte(color.B*255),false)
		end

		if hsvSliders.H then
			hsvSliders.H.set(math.floor((pickerHue*360)+0.5),false)
			hsvSliders.S.set(math.floor((pickerSat*100)+0.5),false)
			hsvSliders.V.set(math.floor((pickerVal*100)+0.5),false)

			local stroke=getUIStrokeColor()
			hsvSliders.H.fill.BackgroundColor3=stroke
			hsvSliders.S.fill.BackgroundColor3=stroke
			hsvSliders.V.fill.BackgroundColor3=stroke
		end

		for mode,body in pairs(modeBodies) do
			body.Visible=mode==activeMode
		end

		paintChoices()
	end

	api.Refresh()

	return api
end

return StrokeColour
