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
	StrokeTransparency=0.72,
	CornerRadius=0,
	UILib="original",
	ThemePanelExpanded=false,
	ColoursPanelExpanded=false,
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

local function applyDefaultOverrides(style)
	if type(style)~="table" then
		return
	end

	for key,value in pairs(style) do
		if DEFAULTS[key]~=nil then
			DEFAULTS[key]=value
		end
	end
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
	style.UILib=DEFAULTS.UILib
	style.ThemePanelExpanded=boolOrDefault(style.ThemePanelExpanded,DEFAULTS.ThemePanelExpanded)
	style.ColoursPanelExpanded=boolOrDefault(style.ColoursPanelExpanded,DEFAULTS.ColoursPanelExpanded)
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
		UILib=DEFAULTS.UILib,
		ThemePanelExpanded=boolOrDefault(style.ThemePanelExpanded,DEFAULTS.ThemePanelExpanded),
		ColoursPanelExpanded=boolOrDefault(style.ColoursPanelExpanded,DEFAULTS.ColoursPanelExpanded),
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

	applyDefaultOverrides(ctx.DEFAULT_UI_STYLE)
	ensureStyleDefaults(UI_STYLE)

	local defaultStyle=copyDefaultStyle(ctx.DEFAULT_UI_STYLE or UI_STYLE)

	local api={}
	local prSlider,pgSlider,pbSlider
	local rSlider,gSlider,bSlider
	local grSlider,ggSlider,gbSlider
	local speedSlider,thicknessSlider,transparencySlider
	local gradientToggle,liquidToggle
	local colourTweenToken=0
	local liquidConn=nil
	local liquidClock=0
	local updatePreview=function() end
	local paintChoices=function() end
	local syncPickerControls=function() paintChoices() end
	local setPickerFromColor=function() end
	local getActiveColor=function() return colorFromStyle(UI_STYLE,"Primary") end
	local connections={}
	local collapsiblePanels={}

	local function trackConnection(conn)
		connections[#connections+1]=conn
		return conn
	end

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

			updatePreview()
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
								local role=obj.Parent and obj.Parent:GetAttribute("CornerRole") or "Control"
								obj.LineJoinMode=cornerRoleRadius(role)>0 and Enum.LineJoinMode.Round or Enum.LineJoinMode.Miter
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

		local valueConnections={}
		local function trackValueConnection(conn)
			valueConnections[#valueConnections+1]=conn
			return conn
		end
		local function cleanupValueConnections()
			for _,conn in ipairs(valueConnections) do
				pcall(function()
					conn:Disconnect()
				end)
			end
			table.clear(valueConnections)
		end

		trackValueConnection(mainValue.Changed:Connect(applyStep))
		trackValueConnection(gradientValue.Changed:Connect(applyStep))

		local info=TweenInfo.new(0.24,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		local t1=TweenService:Create(mainValue,info,{Value=c1})
		local t2=TweenService:Create(gradientValue,info,{Value=c2 or c1})

		trackValueConnection(t2.Completed:Connect(function()
			if token==colourTweenToken then
				setMainColour(c1)
				setGradientColour(c2 or c1)

				syncColourControls()
				updateEverything()
				syncPickerControls()
			end

			cleanupValueConnections()
			mainValue:Destroy()
			gradientValue:Destroy()
		end))

		t1:Play()
		t2:Play()
	end

	function api.Refresh()
		colourTweenToken=colourTweenToken+1
		ensureStyleDefaults(UI_STYLE)

		for _,panelApi in ipairs(collapsiblePanels) do
			panelApi.setExpanded(UI_STYLE[panelApi.stateKey],false,false)
		end

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

		table.clear(connections)
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
		UI_STYLE.UILib=defaultStyle.UILib
		UI_STYLE.ThemePanelExpanded=defaultStyle.ThemePanelExpanded
		UI_STYLE.ColoursPanelExpanded=defaultStyle.ColoursPanelExpanded

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
	local quickChoices={}
	local rgbSliders={}
	local hsvSliders={}
	local modeBodies={}
	local colorPreview,previewHex,hexBox
	local svBase,svCursor,hueCursor

	local function themeColor(role,fallback)
		return THEME[role] or fallback
	end

	local function currentLibStyleValue(key,fallback)
		return fallback
	end

	local function currentLibShape()
		return{}
	end

	local function cornerRoleRadius(role)
		local shape=currentLibShape()
		if role=="Window" then
			return tonumber(shape.WindowRadius) or 0
		elseif role=="Section" then
			return tonumber(shape.SectionRadius) or 0
		elseif role=="Slider" then
			return tonumber(shape.SliderRadius) or 0
		end

		return tonumber(shape.ControlRadius) or 0
	end

	local function addCorner(obj,role)
		if not obj then
			return nil
		end

		obj:SetAttribute("CornerRole",role or "Control")
		return New("UICorner",{CornerRadius=UDim.new(0,0)},obj)
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

	local function makePanel(order,title,stateKey)
		local panel=New("Frame",{
			BackgroundColor3=themeColor("SECTION",THEME.CARD),
			BackgroundTransparency=0.12,
			BorderSizePixel=0,
			Size=UDim2.new(1,0,0,0),
			AutomaticSize=Enum.AutomaticSize.Y,
			ZIndex=4,
			LayoutOrder=order,
			ThemeRole="SECTION",
			CornerRole="Section",
		},page)
		addCorner(panel,"Section")

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

		local expanded=UI_STYLE[stateKey] and true or false
		local header=New("Frame",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,0,24),
			ZIndex=5,
			LayoutOrder=1,
		},panel)

		local titleButton=New("TextButton",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,1,0),
			Text="",
			Font=Enum.Font.GothamBold,
			TextSize=13,
			TextColor3=THEME.TEXT,
			TextXAlignment=Enum.TextXAlignment.Left,
			AutoButtonColor=false,
			ZIndex=6,
		},header)

		local body=New("Frame",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,0,0),
			AutomaticSize=expanded and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
			Visible=expanded,
			ClipsDescendants=true,
			ZIndex=5,
			LayoutOrder=2,
		},panel)

		local bodyLayout=New("UIListLayout",{
			Padding=UDim.new(0,8),
			SortOrder=Enum.SortOrder.LayoutOrder,
		},body)

		local bodyTween=nil
		local lastHeight=0

		local function cancelTween()
			if bodyTween then
				bodyTween:Cancel()
				bodyTween=nil
			end
		end

		local function paint()
			titleButton.Text=(expanded and "[-] " or "[+] ")..title
			panel.BackgroundColor3=expanded and themeColor("SECTION",THEME.CARD) or themeColor("BUTTON",THEME.PANEL)
		end

		local function targetHeight()
			return math.max(lastHeight,math.floor(bodyLayout.AbsoluteContentSize.Y+0.5))
		end

		local function setExpanded(nextExpanded,animate,fire)
			expanded=nextExpanded and true or false
			UI_STYLE[stateKey]=expanded
			paint()
			cancelTween()

			if expanded then
				body.Visible=true
				body.AutomaticSize=Enum.AutomaticSize.None
				body.Size=UDim2.new(1,0,0,0)

				task.defer(function()
					if not expanded or not body.Parent then return end

					local height=targetHeight()
					lastHeight=height

					if animate then
						bodyTween=TweenService:Create(body,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,0,height)})
						bodyTween:Play()
						bodyTween.Completed:Connect(function()
							if expanded and body.Parent then
								body.AutomaticSize=Enum.AutomaticSize.Y
								body.Size=UDim2.new(1,0,0,0)
							end
						end)
					else
						body.AutomaticSize=Enum.AutomaticSize.Y
						body.Size=UDim2.new(1,0,0,0)
					end
				end)
			else
				lastHeight=targetHeight()
				body.AutomaticSize=Enum.AutomaticSize.None
				body.Visible=true
				body.Size=UDim2.new(1,0,0,lastHeight)

				if animate then
					bodyTween=TweenService:Create(body,TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{Size=UDim2.new(1,0,0,0)})
					bodyTween:Play()
					bodyTween.Completed:Connect(function()
						if not expanded and body.Parent then
							body.Visible=false
						end
					end)
				else
					body.Visible=false
					body.Size=UDim2.new(1,0,0,0)
				end
			end

			if fire and ctx.onChanged then
				pcall(ctx.onChanged,UI_STYLE)
			end
		end

		trackConnection(titleButton.MouseButton1Click:Connect(function()
			setExpanded(not expanded,true,true)
		end))

		trackConnection(header.InputBegan:Connect(function(input)
			if input.UserInputType==Enum.UserInputType.MouseButton1 then
				setExpanded(not expanded,true,true)
			end
		end))

		trackConnection(body:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			if expanded then
				lastHeight=targetHeight()
			end
		end))

		collapsiblePanels[#collapsiblePanels+1]={
			stateKey=stateKey,
			setExpanded=setExpanded,
		}

		paint()

		return body
	end

	local function makeFlatButton(parent,text,order,scale)
		local rounded=cornerRoleRadius("Control")>0
		local button=New("TextButton",{
			BackgroundColor3=themeColor("BUTTON",THEME.PANEL),
			BorderSizePixel=0,
			ClipsDescendants=rounded,
			Text=text,
			Font=Enum.Font.GothamMedium,
			TextSize=12,
			TextColor3=THEME.TEXT,
			AutoButtonColor=false,
			Size=UDim2.new(scale or 0.333,-6,1,0),
			ZIndex=6,
			LayoutOrder=order,
			ThemeRole="BUTTON",
			CornerRole="Control",
		},parent)
		addCorner(button,"Control")

		local marker=New("Frame",{
			BackgroundColor3=getUIStrokeColor(),
			BorderSizePixel=0,
			Size=rounded and UDim2.new(1,-24,0,2) or UDim2.new(1,0,0,3),
			Position=rounded and UDim2.new(0,12,1,-4) or UDim2.new(0,0,1,-3),
			Visible=false,
			SkipThemeRole=true,
			ZIndex=7,
			CornerRole="Slider",
		},button)
		addCorner(marker,"Slider")

		trackConnection(button.MouseEnter:Connect(function()
			button.BackgroundColor3=themeColor("SECTION",THEME.CARD)
		end))

		trackConnection(button.MouseLeave:Connect(function()
			paintChoices()
		end))

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
			BackgroundColor3=themeColor("INPUT",THEME.PANEL),
			BorderSizePixel=0,
			ClearTextOnFocus=false,
			Size=UDim2.fromOffset(48,24),
			Position=UDim2.new(1,-48,0,2),
			Text=tostring(startVal),
			Font=Enum.Font.GothamMedium,
			TextSize=12,
			TextColor3=THEME.TEXT,
			TextXAlignment=Enum.TextXAlignment.Center,
			ZIndex=6,
			ThemeRole="INPUT",
			CornerRole="Control",
		},row)
		addCorner(valueBox,"Control")

		local track=New("Frame",{
			BackgroundColor3=themeColor("SLIDER_BG",THEME.BG),
			BorderSizePixel=0,
			Position=UDim2.fromOffset(36,9),
			Size=UDim2.new(1,-92,0,10),
			ClipsDescendants=true,
			ZIndex=6,
			ThemeRole="SLIDER_BG",
			CornerRole="Slider",
		},row)
		addCorner(track,"Slider")

		local fill=New("Frame",{
			BackgroundColor3=fillColor or getUIStrokeColor(),
			BorderSizePixel=0,
			Size=UDim2.new(0,0,1,0),
			ClipsDescendants=true,
			SkipThemeRole=true,
			ZIndex=7,
		},track)
		addCorner(fill,"Slider")

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

		trackConnection(hit.InputBegan:Connect(function(input)
			if input.UserInputType==Enum.UserInputType.MouseButton1 then
				dragging=true
				valueBox:ReleaseFocus()
				setValue(valueFromMouse(),true)
			end
		end))

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

		trackConnection(valueBox.FocusLost:Connect(function()
			setValue(valueBox.Text,true)
		end))

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

	local introRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,46),
		ZIndex=5,
		LayoutOrder=1,
	},page)

	New("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(4,6),
		Size=UDim2.new(1,-8,0,22),
		Text="Appearance",
		Font=Enum.Font.GothamBold,
		TextSize=18,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},introRow)

	New("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(4,30),
		Size=UDim2.new(1,-8,0,16),
		Text="Open only the controls you need.",
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=THEME.MUTED,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},introRow)

	local themePanel=makePanel(2,"Theme","ThemePanelExpanded")

	local themeGrid=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,92),
		ZIndex=5,
		LayoutOrder=1,
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
		UI_STYLE.StrokeThickness=math.clamp(numberOrDefault(currentLibStyleValue("StrokeThickness",1),1),0,8)
		UI_STYLE.StrokeTransparency=math.clamp(numberOrDefault(currentLibStyleValue("StrokeTransparency",0.72),0.72),0,1)
		syncColourControls()
		updateEverything()
		tweenStyleTo(preset.Stroke,preset.Gradient,preset.GradientOn)
		setPickerFromColor(getActiveColor())
		syncPickerControls()
	end

	for i,preset in ipairs(themePresets) do
		local textColor=readableTextColor(preset.Primary)
		local rounded=cornerRoleRadius("Control")>0
		local card=New("TextButton",{
			BackgroundColor3=preset.Primary,
			BorderSizePixel=0,
			ClipsDescendants=rounded,
			Text="",
			AutoButtonColor=false,
			SkipThemeRole=true,
			ZIndex=6,
			LayoutOrder=i,
		},themeGrid)
		addCorner(card,"Control")

		local marker=New("Frame",{
			BackgroundColor3=preset.Stroke,
			BorderSizePixel=0,
			Size=rounded and UDim2.new(1,-22,0,2) or UDim2.new(1,0,0,3),
			Position=rounded and UDim2.new(0,11,1,-5) or UDim2.new(0,0,1,-3),
			Visible=false,
			SkipThemeRole=true,
			ZIndex=8,
			CornerRole="Slider",
		},card)
		addCorner(marker,"Slider")

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

		trackConnection(card.MouseButton1Click:Connect(function()
			applyThemePreset(preset)
		end))

		themeCards[#themeCards+1]={Preset=preset,Card=card,Marker=marker}
	end

	local colorPanel=makePanel(3,"Colours","ColoursPanelExpanded")

	local targetRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,28),
		ZIndex=5,
		LayoutOrder=1,
	},colorPanel)

	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,8),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},targetRow)

	for i,target in ipairs({"Primary","Stroke","Gradient"}) do
		local button,marker=makeFlatButton(targetRow,target,i)
		trackConnection(button.MouseButton1Click:Connect(function()
			setActiveTarget(target)
		end))

		targetButtons[target]={Button=button,Marker=marker}
	end

	local modeRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,28),
		ZIndex=5,
		LayoutOrder=2,
	},colorPanel)

	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,8),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},modeRow)

	for i,mode in ipairs({"Square","RGB","HSV","Hex"}) do
		local button,marker=makeFlatButton(modeRow,mode,i,0.25)
		trackConnection(button.MouseButton1Click:Connect(function()
			setActiveMode(mode)
		end))

		modeButtons[mode]={Button=button,Marker=marker}
	end

	local quickRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,26),
		ZIndex=5,
		LayoutOrder=3,
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
		local rounded=cornerRoleRadius("Control")>0
		local swatch=New("TextButton",{
			BackgroundColor3=color,
			BorderSizePixel=0,
			Text="",
			AutoButtonColor=false,
			SkipThemeRole=true,
			ClipsDescendants=rounded,
			Size=UDim2.fromOffset(30,24),
			ZIndex=6,
			LayoutOrder=i,
		},quickRow)
		addCorner(swatch,"Control")

		local marker=New("Frame",{
			BackgroundColor3=readableTextColor(color),
			BorderSizePixel=0,
			Size=rounded and UDim2.new(1,-10,0,2) or UDim2.new(1,0,0,3),
			Position=rounded and UDim2.new(0,5,1,-4) or UDim2.new(0,0,1,-3),
			Visible=false,
			SkipThemeRole=true,
			ZIndex=7,
			CornerRole="Slider",
		},swatch)
		addCorner(marker,"Slider")

		trackConnection(swatch.MouseButton1Click:Connect(function()
			applyActiveColor(color,false)
		end))

		quickChoices[#quickChoices+1]={Color=color,Marker=marker}
	end

	local pickerBody=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,128),
		ZIndex=5,
		LayoutOrder=4,
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
	addCorner(svSquare,"Section")

	local whiteOverlay=New("Frame",{
		BackgroundColor3=Color3.fromRGB(255,255,255),
		BorderSizePixel=0,
		Size=UDim2.new(1,0,1,0),
		SkipThemeRole=true,
		ZIndex=7,
	},svSquare)
	addCorner(whiteOverlay,"Section")
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
	addCorner(blackOverlay,"Section")
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
	addCorner(svCursor,"Control")
	New("UIStroke",{Color=Color3.fromRGB(0,0,0),Thickness=1,Transparency=0.35,StrokeRole="Fixed"},svCursor)

	local hueStrip=New("Frame",{
		BackgroundColor3=Color3.fromRGB(255,255,255),
		BorderSizePixel=0,
		Position=UDim2.fromOffset(158,8),
		Size=UDim2.fromOffset(18,104),
		SkipThemeRole=true,
		ZIndex=6,
	},squareBody)
	addCorner(hueStrip,"Slider")
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
	addCorner(hueCursor,"Slider")

	colorPreview=New("Frame",{
		BackgroundColor3=getActiveColor(),
		BorderSizePixel=0,
		Position=UDim2.fromOffset(192,8),
		Size=UDim2.fromOffset(92,54),
		SkipThemeRole=true,
		ZIndex=6,
	},squareBody)
	addCorner(colorPreview,"Control")

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

	trackConnection(svSquare.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			colorDrag="SV"
			updateColorDrag()
		end
	end))

	trackConnection(hueStrip.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			colorDrag="Hue"
			updateColorDrag()
		end
	end))

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
		BackgroundColor3=themeColor("INPUT",THEME.PANEL),
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
		ThemeRole="INPUT",
		CornerRole="Control",
	},hexBody)
	addCorner(hexBox,"Control")

	local applyHex=New("TextButton",{
		BackgroundColor3=themeColor("BUTTON",THEME.PANEL),
		BorderSizePixel=0,
		Position=UDim2.new(1,-96,0,8),
		Size=UDim2.fromOffset(96,32),
		Text="Apply",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		AutoButtonColor=false,
		ZIndex=6,
		ThemeRole="BUTTON",
		CornerRole="Control",
	},hexBody)
	addCorner(applyHex,"Control")

	local function commitHex()
		local color=parseHex(hexBox.Text)

		if color then
			applyActiveColor(color,false)
		else
			hexBox.Text=colorToHex(getActiveColor())
		end
	end

	trackConnection(hexBox.FocusLost:Connect(function()
		commitHex()
	end))

	trackConnection(applyHex.MouseButton1Click:Connect(commitHex))

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
			entry.Button.BackgroundColor3=selected and themeColor("SECTION",THEME.CARD) or themeColor("BUTTON",THEME.PANEL)
			entry.Marker.Visible=selected
			entry.Marker.BackgroundColor3=stroke
		end

		for key,entry in pairs(modeButtons) do
			local selected=key==activeMode
			entry.Button.BackgroundColor3=selected and themeColor("SECTION",THEME.CARD) or themeColor("BUTTON",THEME.PANEL)
			entry.Marker.Visible=selected
			entry.Marker.BackgroundColor3=stroke
		end

		for _,entry in ipairs(quickChoices) do
			entry.Marker.Visible=colorsMatch(activeColor,entry.Color)
			entry.Marker.BackgroundColor3=readableTextColor(entry.Color)
		end

		if applyHex then
			applyHex.BackgroundColor3=themeColor("BUTTON",THEME.PANEL)
		end

		if hexBox then
			hexBox.BackgroundColor3=themeColor("INPUT",THEME.PANEL)
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
