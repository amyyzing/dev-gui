local StrokeColour={}

local TweenService=game:GetService("TweenService")

local DEFAULTS={
	PrimaryR=12,
	PrimaryG=12,
	PrimaryB=12,

	StrokeR=182,
	StrokeG=180,
	StrokeB=180,

	GradientR=182,
	GradientG=180,
	GradientB=180,

	StrokeGradient=false,
	LiquidStroke=false,

	LiquidStrokeSpeed=1,
	LiquidStrokeDirection="Right",

	StrokeThickness=1,
	StrokeTransparency=0.84,
	CornerRadius=0,
	UILib="original",
	ThemePanelExpanded=false,
	ColoursPanelExpanded=false,
	HighlightPanelExpanded=false,
	HighlightSelectedMode="espOffense",
	HighlightSelectedState="open",
	ESPOffenseCustomColor=false,
	ESPDefenseCustomColor=false,
	QBAimHighlightCustomColor=false,
	ESPOffenseOpenCustomColor=false,
	ESPOffenseClosedCustomColor=false,
	ESPDefenseHolderCustomColor=false,
	ESPDefenseOpenCustomColor=false,
	ESPDefenseClosedCustomColor=false,
	ESPOffenseFillR=32,
	ESPOffenseFillG=202,
	ESPOffenseFillB=106,
	ESPOffenseOutlineR=32,
	ESPOffenseOutlineG=202,
	ESPOffenseOutlineB=106,
	ESPOffenseFillTransparency=0.5,
	ESPOffenseOutlineTransparency=0,
	ESPOffenseOpenFillR=32,
	ESPOffenseOpenFillG=202,
	ESPOffenseOpenFillB=106,
	ESPOffenseOpenOutlineR=32,
	ESPOffenseOpenOutlineG=202,
	ESPOffenseOpenOutlineB=106,
	ESPOffenseOpenFillTransparency=0.5,
	ESPOffenseOpenOutlineTransparency=0,
	ESPOffenseClosedFillR=254,
	ESPOffenseClosedFillG=94,
	ESPOffenseClosedFillB=86,
	ESPOffenseClosedOutlineR=254,
	ESPOffenseClosedOutlineG=94,
	ESPOffenseClosedOutlineB=86,
	ESPOffenseClosedFillTransparency=0.5,
	ESPOffenseClosedOutlineTransparency=0,
	ESPDefenseFillR=32,
	ESPDefenseFillG=202,
	ESPDefenseFillB=106,
	ESPDefenseOutlineR=32,
	ESPDefenseOutlineG=202,
	ESPDefenseOutlineB=106,
	ESPDefenseFillTransparency=0.5,
	ESPDefenseOutlineTransparency=0,
	ESPDefenseHolderFillR=21,
	ESPDefenseHolderFillG=103,
	ESPDefenseHolderFillB=251,
	ESPDefenseHolderOutlineR=21,
	ESPDefenseHolderOutlineG=103,
	ESPDefenseHolderOutlineB=251,
	ESPDefenseHolderFillTransparency=0.45,
	ESPDefenseHolderOutlineTransparency=0,
	ESPDefenseOpenFillR=32,
	ESPDefenseOpenFillG=202,
	ESPDefenseOpenFillB=106,
	ESPDefenseOpenOutlineR=32,
	ESPDefenseOpenOutlineG=202,
	ESPDefenseOpenOutlineB=106,
	ESPDefenseOpenFillTransparency=0.5,
	ESPDefenseOpenOutlineTransparency=0,
	ESPDefenseClosedFillR=254,
	ESPDefenseClosedFillG=94,
	ESPDefenseClosedFillB=86,
	ESPDefenseClosedOutlineR=254,
	ESPDefenseClosedOutlineG=94,
	ESPDefenseClosedOutlineB=86,
	ESPDefenseClosedFillTransparency=0.5,
	ESPDefenseClosedOutlineTransparency=0,
	QBAimHighlightFillR=21,
	QBAimHighlightFillG=103,
	QBAimHighlightFillB=251,
	QBAimHighlightOutlineR=32,
	QBAimHighlightOutlineG=202,
	QBAimHighlightOutlineB=106,
	QBAimHighlightFillTransparency=0.65,
	QBAimHighlightOutlineTransparency=0,
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

local COLOR_FIELDS={
	Primary={"PrimaryR","PrimaryG","PrimaryB"},
	Stroke={"StrokeR","StrokeG","StrokeB"},
	Gradient={"GradientR","GradientG","GradientB"},
}

local BOOL_FIELDS={
	StrokeGradient=true,
	LiquidStroke=true,
	ThemePanelExpanded=true,
	ColoursPanelExpanded=true,
	HighlightPanelExpanded=true,
	ESPOffenseCustomColor=true,
	ESPDefenseCustomColor=true,
	QBAimHighlightCustomColor=true,
	ESPOffenseOpenCustomColor=true,
	ESPOffenseClosedCustomColor=true,
	ESPDefenseHolderCustomColor=true,
	ESPDefenseOpenCustomColor=true,
	ESPDefenseClosedCustomColor=true,
}
local NUMBER_LIMITS={
	LiquidStrokeSpeed={0,2},
	StrokeThickness={0,8},
	StrokeTransparency={0,1},
	ESPOffenseFillTransparency={0,1},
	ESPOffenseOutlineTransparency={0,1},
	ESPOffenseOpenFillTransparency={0,1},
	ESPOffenseOpenOutlineTransparency={0,1},
	ESPOffenseClosedFillTransparency={0,1},
	ESPOffenseClosedOutlineTransparency={0,1},
	ESPDefenseFillTransparency={0,1},
	ESPDefenseOutlineTransparency={0,1},
	ESPDefenseHolderFillTransparency={0,1},
	ESPDefenseHolderOutlineTransparency={0,1},
	ESPDefenseOpenFillTransparency={0,1},
	ESPDefenseOpenOutlineTransparency={0,1},
	ESPDefenseClosedFillTransparency={0,1},
	ESPDefenseClosedOutlineTransparency={0,1},
	QBAimHighlightFillTransparency={0,1},
	QBAimHighlightOutlineTransparency={0,1},
}

local HIGHLIGHT_MODES={
	{Key="espOffense",Prefix="ESPOffense",Label="ESP Offense",Short="O",States={{Key="open",Suffix="Open",Label="Open"},{Key="closed",Suffix="Closed",Label="Closed"}}},
	{Key="espDefense",Prefix="ESPDefense",Label="ESP Defense",Short="D",States={{Key="holder",Suffix="Holder",Label="Holder"},{Key="open",Suffix="Open",Label="Open"},{Key="closed",Suffix="Closed",Label="Closed"}}},
	{Key="qbHighlight",Prefix="QBAimHighlight",Label="QB Highlight",Short="Q",States={{Key="target",Suffix="",Label="Target"}}},
}
local HIGHLIGHT_MODE_BY_KEY={}
local HIGHLIGHT_STATE_BY_MODE={}
for _,mode in ipairs(HIGHLIGHT_MODES) do
	HIGHLIGHT_MODE_BY_KEY[mode.Key]=mode
	HIGHLIGHT_STATE_BY_MODE[mode.Key]={}
	for _,state in ipairs(mode.States) do
		HIGHLIGHT_STATE_BY_MODE[mode.Key][state.Key]=state
	end
end
local HIGHLIGHT_DIAL_W=96
local HIGHLIGHT_DIAL_H=96
local HIGHLIGHT_DIAL_INNER_RADIUS=0.22
local HIGHLIGHT_DIAL_OUTER_RADIUS=0.43
local HIGHLIGHT_DIAL_GAP_DEG=8
local HIGHLIGHT_DIAL_GLOW_LAYERS={
	{pad=1,z=5},
	{pad=4,z=4},
	{pad=8,z=3},
}
local HIGHLIGHT_DIAL_ASSET_KEY={espOffense="speed",espDefense="gravity",qbHighlight="stamina"}
local HIGHLIGHT_DIAL_SECTORS={
	{key="espDefense",start=30,finish=150},
	{key="espOffense",start=150,finish=270},
	{key="qbHighlight",start=270,finish=390},
}

local function brightenColor(color,amount)
	amount=math.clamp(tonumber(amount) or 0,0,1)
	return color:Lerp(Color3.new(1,1,1),amount)
end

local function atan2(y,x)
	if x>0 then
		return math.atan(y/x)
	elseif x<0 and y>=0 then
		return math.atan(y/x)+math.pi
	elseif x<0 then
		return math.atan(y/x)-math.pi
	elseif y>0 then
		return math.pi*0.5
	elseif y<0 then
		return -math.pi*0.5
	end

	return 0
end

local function inAngleRange(angle,startAngle,finishAngle)
	local start=startAngle+HIGHLIGHT_DIAL_GAP_DEG
	local finish=finishAngle-HIGHLIGHT_DIAL_GAP_DEG

	if finish>360 then
		return angle>=start or angle<=(finish-360)
	end

	return angle>=start and angle<=finish
end

local function normalizedStyleValue(key,value,default)
	if BOOL_FIELDS[key] then
		return boolOrDefault(value,default)
	elseif key=="LiquidStrokeDirection" then
		return tostring(value or default)
	elseif key=="CornerRadius" then
		return 0
	elseif key=="UILib" then
		return DEFAULTS.UILib
	elseif type(default)=="number" then
		local n=numberOrDefault(value,default)
		local limits=NUMBER_LIMITS[key]
		return limits and math.clamp(n,limits[1],limits[2]) or n
	end

	return value or default
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
	for key,default in pairs(DEFAULTS) do
		style[key]=normalizedStyleValue(key,style[key],default)
	end
end

local function copyDefaultStyle(style)
	style=style or DEFAULTS

	local copy={}
	for key,default in pairs(DEFAULTS) do
		copy[key]=normalizedStyleValue(key,style[key],default)
	end
	return copy
end

local function colorFromStyle(style,prefix)
	local fields=COLOR_FIELDS[prefix] or COLOR_FIELDS.Stroke
	return Color3.fromRGB(clampByte(style[fields[1]]),clampByte(style[fields[2]]),clampByte(style[fields[3]]))
end

local function writeColorToStyle(style,prefix,c)
	local fields=COLOR_FIELDS[prefix] or COLOR_FIELDS.Stroke
	style[fields[1]]=math.floor(c.R*255+0.5)
	style[fields[2]]=math.floor(c.G*255+0.5)
	style[fields[3]]=math.floor(c.B*255+0.5)
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
	local UIS=ctx.UIS or game:GetService("UserInputService")
	local GuiService=game:GetService("GuiService")
	local buildSlider=ctx.buildSlider

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
	local updatePreview=function() end
	local paintChoices=function() end
	local syncPickerControls=function() paintChoices() end
	local setPickerFromColor=function() end
	local getActiveColor=function() return colorFromStyle(UI_STYLE,"Primary") end
	local connections={}
	local collapsiblePanels={}
	local sharedSliderControls={}

	local function pointerPosition(input)
		local inputType=typeof(input)
		if inputType=="Vector2" then
			return input
		elseif inputType=="Vector3" then
			return Vector2.new(input.X,input.Y)
		end

		local position=input and input.Position

		if typeof(position)=="Vector3" then
			return Vector2.new(position.X,position.Y)
		elseif typeof(position)=="Vector2" then
			return position
		end

		return UIS:GetMouseLocation()
	end

	local function guiInset()
		local ok,inset=pcall(function()
			return GuiService:GetGuiInset()
		end)

		if ok and typeof(inset)=="Vector2" then
			return inset
		end

		return Vector2.new(0,0)
	end

	local function distanceToRect(point,pos,size)
		local dx=0
		local dy=0

		if point.X<pos.X then
			dx=pos.X-point.X
		elseif point.X>pos.X+size.X then
			dx=point.X-(pos.X+size.X)
		end

		if point.Y<pos.Y then
			dy=pos.Y-point.Y
		elseif point.Y>pos.Y+size.Y then
			dy=point.Y-(pos.Y+size.Y)
		end

		return dx*dx+dy*dy
	end

	local function objectLocalPointer(object,input)
		local point=pointerPosition(input)
		local inset=guiInset()
		local pos=object.AbsolutePosition
		local size=object.AbsoluteSize
		local best=point
		local bestDistance=distanceToRect(point,pos,size)
		local candidates={
			point-inset,
			point+inset,
		}

		for _,candidate in ipairs(candidates) do
			local candidateDistance=distanceToRect(candidate,pos,size)
			if candidateDistance<bestDistance then
				best=candidate
				bestDistance=candidateDistance
			end
		end

		return best.X-pos.X,best.Y-pos.Y,math.max(size.X,1),math.max(size.Y,1)
	end

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

	local function applyUIStrokeTheme()
		if ctx.applyUIStrokeTheme then
			ctx.applyUIStrokeTheme()
		end
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
		UI_STYLE.StrokeGradient=false

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

		if gradientToggle then gradientToggle.set(false) end
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

	local function tweenStyleTo(c1)
		colourTweenToken=colourTweenToken+1

		local token=colourTweenToken
		local mainValue=Instance.new("Color3Value")
		local gradientValue=Instance.new("Color3Value")

		mainValue.Value=getUIStrokeColor()
		gradientValue.Value=getUIStrokeGradientColor()

		UI_STYLE.StrokeGradient=false

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
		local t2=TweenService:Create(gradientValue,info,{Value=c1})

		trackValueConnection(t2.Completed:Connect(function()
			if token==colourTweenToken then
				setMainColour(c1)
				setGradientColour(c1)

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

		for _,control in ipairs(sharedSliderControls) do
			if control and type(control.destroy)=="function" then
				pcall(control.destroy)
			elseif control and type(control.Destroy)=="function" then
				pcall(control.Destroy)
			end
		end
		table.clear(sharedSliderControls)

		for _,conn in ipairs(connections) do
			pcall(function()
				conn:Disconnect()
			end)
		end

		table.clear(connections)
	end

	function api.Reset()
		for key,value in pairs(defaultStyle) do
			UI_STYLE[key]=value
		end

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
		UI_STYLE.StrokeGradient=false
		UI_STYLE.LiquidStroke=false

		if gradientToggle then
			gradientToggle.set(false)
		end

		if liquidToggle then
			liquidToggle.set(false)
		end

		tweenStyleTo(c1 or c2 or getUIStrokeColor())
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
	local activeHighlightTarget="Fill"
	local highlightHoverMode=nil
	local pickerHue,pickerSat,pickerVal=0,0,1
	local colorDrag=nil
	local highlightPickerHue,highlightPickerSat,highlightPickerVal=0,0,1
	local highlightColorDrag=nil

	local targetButtons={}
	local modeButtons={}
	local highlightTargetButtons={}
	local highlightStateButtons={}
	local themeCards={}
	local quickChoices={}
	local rgbSliders={}
	local hsvSliders={}
	local highlightDialImages={}
	local highlightDialGlowImages={}
	local highlightDialHighlightImages={}
	local highlightFallbackSlices={}
	local highlightDialPaintTweens={}
	local highlightDialCanvas=nil
	local highlightDialCenterCap=nil
	local modeBodies={}
	local colorPreview,previewHex,hexBox
	local svBase,svCursor,hueCursor
	local highlightSvBase,highlightSvCursor,highlightHueCursor,highlightPreviewHex,highlightPickerPreview
	local highlightModeLabel,highlightPreview,highlightPreviewStroke,highlightFillTransparencySlider,highlightOutlineTransparencySlider
	local paintHighlightDial=function() end

	local function themeColor(role,fallback)
		return THEME[role] or fallback
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

		trackConnection(titleButton.Activated:Connect(function()
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
		local button=New("TextButton",{
			BackgroundColor3=themeColor("BUTTON",THEME.PANEL),
			BorderSizePixel=0,
			ClipsDescendants=false,
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
			Size=UDim2.new(1,0,0,3),
			Position=UDim2.new(0,0,1,-3),
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

		local function valueFromMouse(input)
			local x,_,w=objectLocalPointer(track,input)
			local pct=math.clamp(x/w,0,1)
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
				setValue(valueFromMouse(input),true)
			end
		end))

		trackConnection(UIS.InputChanged:Connect(function(input)
			if dragging and input.UserInputType==Enum.UserInputType.MouseMovement then
				setValue(valueFromMouse(input),true)
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

	local function makeHighlightSlider(parent,labelText,minVal,maxVal,startVal,decimals,fillColor,onChange)
		if buildSlider then
			local control=buildSlider(parent,labelText,minVal,maxVal,startVal,decimals,onChange)
			sharedSliderControls[#sharedSliderControls+1]=control
			tintSlider(control,fillColor)
			return control
		end

		return makeMiniSlider(parent,labelText,minVal,maxVal,startVal,decimals,fillColor,onChange)
	end

	local function normalizeHighlightMode(value)
		local key=tostring(value or DEFAULTS.HighlightSelectedMode)
		if HIGHLIGHT_MODE_BY_KEY[key] then
			return key
		end

		key=key:lower():gsub("%s+","")
		if key=="offense" or key=="espoffense" or key=="1" then
			return"espOffense"
		elseif key=="defense" or key=="espdefense" or key=="2" then
			return"espDefense"
		elseif key=="qb" or key=="qbaim" or key=="qbhighlight" or key=="3" then
			return"qbHighlight"
		end

		return DEFAULTS.HighlightSelectedMode
	end

	local function activeHighlightMode()
		UI_STYLE.HighlightSelectedMode=normalizeHighlightMode(UI_STYLE.HighlightSelectedMode)
		return HIGHLIGHT_MODE_BY_KEY[UI_STYLE.HighlightSelectedMode] or HIGHLIGHT_MODE_BY_KEY[DEFAULTS.HighlightSelectedMode]
	end

	local function normalizeHighlightState(value,mode)
		mode=mode or activeHighlightMode()
		local key=tostring(value or ""):lower():gsub("%s+","")
		local stateMap=HIGHLIGHT_STATE_BY_MODE[mode.Key] or {}
		if stateMap[key] then
			return key
		end

		local first=mode.States and mode.States[1]
		return first and first.Key or "target"
	end

	local function activeHighlightState()
		local mode=activeHighlightMode()
		UI_STYLE.HighlightSelectedState=normalizeHighlightState(UI_STYLE.HighlightSelectedState,mode)
		return (HIGHLIGHT_STATE_BY_MODE[mode.Key] or {})[UI_STYLE.HighlightSelectedState] or mode.States[1]
	end

	local function activeHighlightPrefix()
		local mode=activeHighlightMode()
		local state=activeHighlightState()
		return mode.Prefix..(state.Suffix or "")
	end

	local function highlightField(channel,suffix)
		return activeHighlightPrefix()..channel..suffix
	end

	local function highlightCustomField()
		return activeHighlightPrefix().."CustomColor"
	end

	local function highlightColor(channel)
		return Color3.fromRGB(
			clampByte(UI_STYLE[highlightField(channel,"R")]),
			clampByte(UI_STYLE[highlightField(channel,"G")]),
			clampByte(UI_STYLE[highlightField(channel,"B")])
		)
	end

	local function writeHighlightColor(channel,color)
		UI_STYLE[highlightField(channel,"R")]=math.floor(color.R*255+0.5)
		UI_STYLE[highlightField(channel,"G")]=math.floor(color.G*255+0.5)
		UI_STYLE[highlightField(channel,"B")]=math.floor(color.B*255+0.5)
		UI_STYLE[highlightCustomField()]=true
	end

	local function highlightTransparency(channel)
		return math.clamp(tonumber(UI_STYLE[highlightField(channel,"Transparency")]) or DEFAULTS[highlightField(channel,"Transparency")] or 0,0,1)
	end

	local function writeHighlightTransparency(channel,value)
		UI_STYLE[highlightField(channel,"Transparency")]=math.clamp(tonumber(value) or highlightTransparency(channel),0,1)
	end

	local function getActiveHighlightColor()
		return highlightColor(activeHighlightTarget)
	end

	local function writeActiveHighlightColor(color)
		writeHighlightColor(activeHighlightTarget,color)
	end

	getActiveColor=function()
		if activeTarget=="HighlightFill" or activeTarget=="HighlightOutline" then
			activeHighlightTarget=activeTarget=="HighlightFill" and "Fill" or "Outline"
			return getActiveHighlightColor()
		end

		if activeTarget=="Primary" then
			return getUIPrimaryColor()
		end

		return getUIStrokeColor()
	end

	setPickerFromColor=function(color)
		pickerHue,pickerSat,pickerVal=toHSV(color)
	end

	local function writeActiveColor(color)
		if activeTarget=="HighlightFill" or activeTarget=="HighlightOutline" then
			activeHighlightTarget=activeTarget=="HighlightFill" and "Fill" or "Outline"
			writeActiveHighlightColor(color)
			return
		end

		if activeTarget=="Primary" then
			setPrimaryColour(color)
		else
			setMainColour(color)
			setGradientColour(color)
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
		if target=="Gradient" then
			target="Stroke"
		end

		activeTarget=target
		setPickerFromColor(getActiveColor())
		syncPickerControls()
	end

	local function setActiveMode(mode)
		activeMode=mode
		syncPickerControls()
	end

	local function setHighlightMode(modeKey)
		UI_STYLE.HighlightSelectedMode=normalizeHighlightMode(modeKey)
		UI_STYLE.HighlightSelectedState=normalizeHighlightState(UI_STYLE.HighlightSelectedState,activeHighlightMode())
		setPickerFromColor(getActiveColor())
		syncPickerControls()
	end

	local function setHighlightState(stateKey)
		UI_STYLE.HighlightSelectedState=normalizeHighlightState(stateKey,activeHighlightMode())
		setPickerFromColor(getActiveColor())
		syncPickerControls()
	end

	local function setHighlightTarget(target)
		activeHighlightTarget=target=="Outline" and "Outline" or "Fill"
		activeTarget=activeHighlightTarget=="Fill" and "HighlightFill" or "HighlightOutline"
		setPickerFromColor(getActiveColor())
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
		Size=UDim2.new(1,0,0,34),
		ZIndex=5,
		LayoutOrder=1,
	},themePanel)

	New("UIGridLayout",{
		CellPadding=UDim2.fromOffset(6,0),
		CellSize=UDim2.new(0.1666667,-5,0,34),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},themeGrid)

	local themePresets={
		{Name="Dark",Primary=Color3.fromRGB(12,12,12),Stroke=Color3.fromRGB(182,180,180),Gradient=Color3.fromRGB(182,180,180),GradientOn=false},
		{Name="Light",Primary=Color3.fromRGB(238,238,238),Stroke=Color3.fromRGB(60,60,60),Gradient=Color3.fromRGB(60,60,60),GradientOn=false},
		{Name="Midnight",Primary=Color3.fromRGB(12,18,38),Stroke=Color3.fromRGB(72,98,158),Gradient=Color3.fromRGB(72,98,158),GradientOn=false},
		{Name="Crimson",Primary=Color3.fromRGB(58,17,24),Stroke=Color3.fromRGB(150,45,54),Gradient=Color3.fromRGB(150,45,54),GradientOn=false},
		{Name="Evergreen",Primary=Color3.fromRGB(18,36,34),Stroke=Color3.fromRGB(45,112,78),Gradient=Color3.fromRGB(45,112,78),GradientOn=false},
		{Name="Sakura",Primary=Color3.fromRGB(43,3,33),Stroke=Color3.fromRGB(215,136,236),Gradient=Color3.fromRGB(215,136,236),GradientOn=false},
	}

	local function applyThemePreset(preset)
		setPrimaryColour(preset.Primary)
		UI_STYLE.StrokeGradient=false
		UI_STYLE.LiquidStroke=false
		UI_STYLE.StrokeThickness=1
		UI_STYLE.StrokeTransparency=0.84
		syncColourControls()
		updateEverything()
		tweenStyleTo(preset.Stroke)
		setPickerFromColor(getActiveColor())
		syncPickerControls()
	end

	for i,preset in ipairs(themePresets) do
		local textColor=readableTextColor(preset.Primary)
		local card=New("TextButton",{
			BackgroundColor3=preset.Primary,
			BorderSizePixel=0,
			ClipsDescendants=false,
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
			Size=UDim2.new(1,0,0,2),
			Position=UDim2.new(0,0,1,-2),
			Visible=false,
			SkipThemeRole=true,
			ZIndex=8,
			CornerRole="Slider",
		},card)
		addCorner(marker,"Slider")

		local label=New("TextLabel",{
			BackgroundTransparency=1,
			Position=UDim2.fromOffset(6,0),
			Size=UDim2.new(1,-12,1,0),
			Text=preset.Name,
			Font=Enum.Font.GothamBold,
			TextSize=11,
			TextColor3=textColor,
			TextXAlignment=Enum.TextXAlignment.Center,
			TextYAlignment=Enum.TextYAlignment.Center,
			ZIndex=7,
		},card)

		trackConnection(card.Activated:Connect(function()
			applyThemePreset(preset)
		end))

		themeCards[#themeCards+1]={Preset=preset,Card=card,Marker=marker,Label=label}
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

	for i,target in ipairs({"Primary","Stroke"}) do
		local button,marker=makeFlatButton(targetRow,target,i)
		trackConnection(button.Activated:Connect(function()
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
		trackConnection(button.Activated:Connect(function()
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
		Color3.fromRGB(12,12,12),
		Color3.fromRGB(238,238,238),
		Color3.fromRGB(60,60,60),
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
			ClipsDescendants=false,
			Size=UDim2.fromOffset(30,24),
			ZIndex=6,
			LayoutOrder=i,
		},quickRow)
		addCorner(swatch,"Control")

		local marker=New("Frame",{
			BackgroundColor3=readableTextColor(color),
			BorderSizePixel=0,
			Size=UDim2.new(1,0,0,3),
			Position=UDim2.new(0,0,1,-3),
			Visible=false,
			SkipThemeRole=true,
			ZIndex=7,
			CornerRole="Slider",
		},swatch)
		addCorner(marker,"Slider")

		trackConnection(swatch.Activated:Connect(function()
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

	local function updateColorDrag(input)
		if colorDrag=="SV" and svSquare.AbsoluteSize.X>0 then
			local x,y,w,h=objectLocalPointer(svSquare,input)
			pickerSat=math.clamp(x/w,0,1)
			pickerVal=1-math.clamp(y/h,0,1)
			applyActiveColor(Color3.fromHSV(pickerHue,pickerSat,pickerVal),true)
		elseif colorDrag=="Hue" and hueStrip.AbsoluteSize.Y>0 then
			local _,y,_,h=objectLocalPointer(hueStrip,input)
			pickerHue=math.clamp(y/h,0,1)
			applyActiveColor(Color3.fromHSV(pickerHue,pickerSat,pickerVal),true)
		end
	end

	trackConnection(svSquare.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			colorDrag="SV"
			updateColorDrag(input)
		end
	end))

	trackConnection(hueStrip.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			colorDrag="Hue"
			updateColorDrag(input)
		end
	end))

	trackConnection(UIS.InputChanged:Connect(function(input)
		if colorDrag and input.UserInputType==Enum.UserInputType.MouseMovement then
			updateColorDrag(input)
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

	trackConnection(applyHex.Activated:Connect(commitHex))

	local syncHighlightControls

	local function setHighlightPickerFromColor(color)
		highlightPickerHue,highlightPickerSat,highlightPickerVal=toHSV(color)
	end

	local function syncHighlightPicker()
		local color=getActiveHighlightColor()
		setHighlightPickerFromColor(color)

		if highlightSvBase then
			highlightSvBase.BackgroundColor3=Color3.fromHSV(highlightPickerHue,1,1)
		end

		if highlightSvCursor then
			highlightSvCursor.Position=UDim2.new(highlightPickerSat,-4,1-highlightPickerVal,-4)
		end

		if highlightHueCursor then
			highlightHueCursor.Position=UDim2.new(0,0,highlightPickerHue,-1)
		end

		if highlightPickerPreview then
			highlightPickerPreview.BackgroundColor3=color
		end

		if highlightPreviewHex then
			highlightPreviewHex.Text=colorToHex(color)
		end
	end

	local function applyHighlightPickerColor(color)
		setHighlightPickerFromColor(color)
		writeActiveHighlightColor(color)
		syncHighlightControls()
		syncPickerControls()
		updateEverything()
	end

	local function updateHighlightColorDrag(input)
		if highlightColorDrag=="SV" and highlightSvBase and highlightSvBase.AbsoluteSize.X>0 then
			local x,y,w,h=objectLocalPointer(highlightSvBase,input)
			highlightPickerSat=math.clamp(x/w,0,1)
			highlightPickerVal=1-math.clamp(y/h,0,1)
			applyHighlightPickerColor(Color3.fromHSV(highlightPickerHue,highlightPickerSat,highlightPickerVal))
		elseif highlightColorDrag=="Hue" and highlightHueCursor and highlightHueCursor.Parent and highlightHueCursor.Parent.AbsoluteSize.Y>0 then
			local hueStrip=highlightHueCursor.Parent
			local _,y,_,h=objectLocalPointer(hueStrip,input)
			highlightPickerHue=math.clamp(y/h,0,1)
			applyHighlightPickerColor(Color3.fromHSV(highlightPickerHue,highlightPickerSat,highlightPickerVal))
		end
	end

	syncHighlightControls=function()
		local mode=activeHighlightMode()
		local state=activeHighlightState()
		local fillColor=highlightColor("Fill")
		local outlineColor=highlightColor("Outline")
		local activeAccent=getUIStrokeColor()
		local stateEnabled=UI_STYLE[highlightCustomField()]==true

		if highlightModeLabel then
			highlightModeLabel.Text=mode.Label.." / "..state.Label..(stateEnabled and " custom" or " default")
		end

		if highlightPreview then
			highlightPreview.BackgroundColor3=fillColor
			highlightPreview.BackgroundTransparency=highlightTransparency("Fill")
		end

		if highlightPreviewStroke then
			highlightPreviewStroke.Color=outlineColor
			highlightPreviewStroke.Transparency=highlightTransparency("Outline")
		end

		syncHighlightPicker()

		paintHighlightDial(false)

		local states=mode.States or {}
		local stateCount=math.max(#states,1)
		for index,entry in ipairs(highlightStateButtons) do
			local stateInfo=states[index]
			local visible=stateInfo~=nil
			entry.Button.Visible=visible
			entry.Button.Size=UDim2.new(visible and (1/stateCount) or 0,visible and -6 or 0,1,0)
			entry.Button.Text=visible and stateInfo.Label or ""
			entry.Key=visible and stateInfo.Key or nil
			entry.Marker.Visible=visible and stateInfo.Key==state.Key
			entry.Marker.BackgroundColor3=activeAccent
			entry.Button.BackgroundColor3=(visible and stateInfo.Key==state.Key) and themeColor("SECTION",THEME.CARD) or themeColor("BUTTON",THEME.PANEL)
		end

		for key,entry in pairs(highlightTargetButtons) do
			local selected=key==activeHighlightTarget
			entry.Button.BackgroundColor3=selected and themeColor("SECTION",THEME.CARD) or themeColor("BUTTON",THEME.PANEL)
			entry.Marker.Visible=selected
			entry.Marker.BackgroundColor3=activeAccent
		end

		if highlightFillTransparencySlider then
			highlightFillTransparencySlider.set(highlightTransparency("Fill"),false)
			tintSlider(highlightFillTransparencySlider,fillColor)
		end

		if highlightOutlineTransparencySlider then
			highlightOutlineTransparencySlider.set(highlightTransparency("Outline"),false)
			tintSlider(highlightOutlineTransparencySlider,outlineColor)
		end
	end

	local highlightPanel=makePanel(4,"Highlights","HighlightPanelExpanded")

	local highlightModeRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,98),
		ZIndex=5,
		LayoutOrder=1,
	},highlightPanel)

	highlightDialCanvas=New("Frame",{
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ClipsDescendants=false,
		Position=UDim2.fromOffset(0,1),
		Size=UDim2.fromOffset(HIGHLIGHT_DIAL_W,HIGHLIGHT_DIAL_H),
		ZIndex=6,
	},highlightModeRow)

	local function tweenHighlightDialObject(object,goal)
		if not object then return end
		local previous=highlightDialPaintTweens[object]
		if previous then
			previous:Cancel()
		end

		local tween=TweenService:Create(object,TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),goal)
		highlightDialPaintTweens[object]=tween
		tween.Completed:Connect(function()
			if highlightDialPaintTweens[object]==tween then
				highlightDialPaintTweens[object]=nil
			end
		end)
		tween:Play()
	end

	paintHighlightDial=function(animate)
		local selected=activeHighlightMode().Key
		local accent=getUIStrokeColor()
		local core=brightenColor(accent,0.10)
		local hover=brightenColor(accent,0.24)
		local glow=brightenColor(accent,0.38)
		local muted=themeColor("MUTED",Color3.fromRGB(118,122,132))

		for _,mode in ipairs(HIGHLIGHT_MODES) do
			local key=mode.Key
			local isSelected=key==selected
			local isHover=key==highlightHoverMode
			local isCustom=UI_STYLE[mode.Prefix.."CustomColor"]==true
			for _,state in ipairs(mode.States or {}) do
				if UI_STYLE[mode.Prefix..(state.Suffix or "").."CustomColor"]==true then
					isCustom=true
					break
				end
			end
			local color=muted
			local transparency=0.74
			local highlightTransparency=1
			local nearGlowTransparency=1
			local midGlowTransparency=1
			local farGlowTransparency=1

			if isSelected then
				color=isHover and hover or core
				transparency=isHover and 0.04 or 0.08
				highlightTransparency=isHover and 0.64 or 0.76
				nearGlowTransparency=isHover and 0.42 or 0.54
				midGlowTransparency=isHover and 0.62 or 0.72
				farGlowTransparency=isHover and 0.82 or 0.90
			elseif isCustom then
				color=core
				transparency=isHover and 0.24 or 0.40
				nearGlowTransparency=isHover and 0.72 or 0.92
				midGlowTransparency=isHover and 0.86 or 0.98
			elseif isHover then
				color=brightenColor(muted,0.13)
				transparency=0.60
			end

			local image=highlightDialImages[key]
			if image then
				if animate then
					tweenHighlightDialObject(image,{ImageColor3=color,ImageTransparency=transparency})
				else
					image.ImageColor3=color
					image.ImageTransparency=transparency
				end
			end

			local highlight=highlightDialHighlightImages[key]
			if highlight then
				if animate then
					tweenHighlightDialObject(highlight,{ImageColor3=Color3.new(1,1,1),ImageTransparency=highlightTransparency})
				else
					highlight.ImageColor3=Color3.new(1,1,1)
					highlight.ImageTransparency=highlightTransparency
				end
			end

			local glows=highlightDialGlowImages[key]
			if glows then
				for index,glowImage in ipairs(glows) do
					local glowTransparency=index==1 and nearGlowTransparency or (index==2 and midGlowTransparency or farGlowTransparency)
					if animate then
						tweenHighlightDialObject(glowImage,{ImageColor3=glow,ImageTransparency=glowTransparency})
					else
						glowImage.ImageColor3=glow
						glowImage.ImageTransparency=glowTransparency
					end
				end
			end

			local fallback=highlightFallbackSlices[key]
			if fallback then
				if animate then
					tweenHighlightDialObject(fallback,{BackgroundColor3=color,BackgroundTransparency=transparency})
				else
					fallback.BackgroundColor3=color
					fallback.BackgroundTransparency=transparency
				end
			end
		end

		if highlightDialCenterCap then
			local centerColor=themeColor("INPUT",THEME.PANEL)
			if animate then
				tweenHighlightDialObject(highlightDialCenterCap,{ImageColor3=centerColor})
			else
				highlightDialCenterCap.ImageColor3=centerColor
			end
		end
	end

	local function highlightModeAtPosition(position)
		if not highlightDialCanvas then
			return nil
		end

		local absoluteSize=highlightDialCanvas.AbsoluteSize
		local x,y=objectLocalPointer(highlightDialCanvas,position)
		local size=math.min(absoluteSize.X,absoluteSize.Y)

		if size<=0 then
			return nil
		end

		local dx=x-absoluteSize.X*0.5
		local dy=y-absoluteSize.Y*0.5
		local radius=math.sqrt(dx*dx+dy*dy)
		local inner=size*HIGHLIGHT_DIAL_INNER_RADIUS
		local outer=size*HIGHLIGHT_DIAL_OUTER_RADIUS

		if radius<inner or radius>outer then
			return nil
		end

		local angle=math.deg(atan2(-dy,dx))
		if angle<0 then
			angle=angle+360
		end

		for _,sector in ipairs(HIGHLIGHT_DIAL_SECTORS) do
			if inAngleRange(angle,sector.start,sector.finish) then
				return sector.key
			end
		end

		return nil
	end

	local function setHighlightHoverMode(modeKey)
		modeKey=modeKey and normalizeHighlightMode(modeKey) or nil
		if modeKey and not HIGHLIGHT_MODE_BY_KEY[modeKey] then
			modeKey=nil
		end

		if highlightHoverMode==modeKey then
			return
		end

		highlightHoverMode=modeKey
		paintHighlightDial(true)
	end

	local paramsDial=ctx.Page1GameParamsModule
	local assets=paramsDial and type(paramsDial.GetDialSliceAssets)=="function" and paramsDial.GetDialSliceAssets() or nil

	for _,mode in ipairs(HIGHLIGHT_MODES) do
		local assetKey=HIGHLIGHT_DIAL_ASSET_KEY[mode.Key]
		local pageAssets=assets and assets[assetKey]
		if pageAssets and pageAssets.slice and pageAssets.glow then
			highlightDialGlowImages[mode.Key]={}
			for _,layer in ipairs(HIGHLIGHT_DIAL_GLOW_LAYERS) do
				local pad=layer.pad
				local glowImage=New("ImageLabel",{
					BackgroundTransparency=1,
					Position=UDim2.new(0,-pad,0,-pad),
					Size=UDim2.new(1,pad*2,1,pad*2),
					Image=pageAssets.glow,
					ImageColor3=getUIStrokeColor(),
					ImageTransparency=1,
					ResampleMode=Enum.ResamplerMode.Default,
					ScaleType=Enum.ScaleType.Stretch,
					ZIndex=layer.z,
				},highlightDialCanvas)
				highlightDialGlowImages[mode.Key][#highlightDialGlowImages[mode.Key]+1]=glowImage
			end

			highlightDialImages[mode.Key]=New("ImageLabel",{
				BackgroundTransparency=1,
				Position=UDim2.fromScale(0,0),
				Size=UDim2.fromScale(1,1),
				Image=pageAssets.slice,
				ImageColor3=themeColor("INPUT",THEME.PANEL),
				ImageTransparency=0.74,
				ResampleMode=Enum.ResamplerMode.Default,
				ScaleType=Enum.ScaleType.Stretch,
				ZIndex=6,
			},highlightDialCanvas)

			highlightDialHighlightImages[mode.Key]=New("ImageLabel",{
				BackgroundTransparency=1,
				Position=UDim2.fromScale(0,0),
				Size=UDim2.fromScale(1,1),
				Image=pageAssets.slice,
				ImageColor3=Color3.new(1,1,1),
				ImageTransparency=1,
				ResampleMode=Enum.ResamplerMode.Default,
				ScaleType=Enum.ScaleType.Stretch,
				ZIndex=7,
			},highlightDialCanvas)
		else
			local index=mode.Key=="espDefense" and 1 or (mode.Key=="espOffense" and 2 or 3)
			local fallback=New("TextButton",{
				Position=UDim2.new((index-1)/3,1,0,8),
				Size=UDim2.new(1/3,-2,1,-16),
				BackgroundColor3=themeColor("INPUT",THEME.PANEL),
				BackgroundTransparency=0.74,
				BorderSizePixel=0,
				Text="",
				AutoButtonColor=false,
				Selectable=false,
				ZIndex=6,
				ThemeRole="INPUT",
			},highlightDialCanvas)
			addCorner(fallback,"Control")
			highlightFallbackSlices[mode.Key]=fallback
		end
	end

	if assets and assets._center then
		local centerSize=math.floor(HIGHLIGHT_DIAL_W*HIGHLIGHT_DIAL_INNER_RADIUS*2+8)
		highlightDialCenterCap=New("ImageLabel",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=UDim2.fromOffset(centerSize,centerSize),
			BackgroundTransparency=1,
			Image=assets._center,
			ImageColor3=themeColor("INPUT",THEME.PANEL),
			ImageTransparency=0.03,
			ResampleMode=Enum.ResamplerMode.Default,
			ScaleType=Enum.ScaleType.Stretch,
			ZIndex=8,
		},highlightDialCanvas)
	end

	local highlightDialHit=New("TextButton",{
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Position=UDim2.fromScale(0,0),
		Size=UDim2.fromScale(1,1),
		Text="",
		AutoButtonColor=false,
		Selectable=false,
		ZIndex=10,
	},highlightDialCanvas)

	trackConnection(highlightDialHit.InputBegan:Connect(function(input)
		if input.UserInputType~=Enum.UserInputType.MouseButton1 and input.UserInputType~=Enum.UserInputType.Touch then
			return
		end

		local modeKey=highlightModeAtPosition(input.Position)
		if modeKey then
			setHighlightMode(modeKey)
		end
	end))

	trackConnection(highlightDialHit.InputChanged:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then
			setHighlightHoverMode(highlightModeAtPosition(input.Position))
		end
	end))

	trackConnection(highlightDialHit.MouseLeave:Connect(function()
		setHighlightHoverMode(nil)
	end))

	highlightPreview=New("Frame",{
		BackgroundColor3=highlightColor("Fill"),
		BorderSizePixel=0,
		Position=UDim2.fromOffset(104,12),
		Size=UDim2.fromOffset(76,50),
		SkipThemeRole=true,
		ZIndex=6,
		CornerRole="Control",
	},highlightModeRow)
	addCorner(highlightPreview,"Control")
	highlightPreviewStroke=New("UIStroke",{Color=highlightColor("Outline"),Thickness=2,Transparency=highlightTransparency("Outline")},highlightPreview)
	highlightPreviewStroke:SetAttribute("StrokeRole","Fixed")

	highlightModeLabel=New("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(104,66),
		Size=UDim2.new(1,-108,0,20),
		Text="",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.MUTED,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},highlightModeRow)

	local highlightStateRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,28),
		ZIndex=5,
		LayoutOrder=2,
	},highlightPanel)
	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,8),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},highlightStateRow)

	for index=1,3 do
		local button,marker=makeFlatButton(highlightStateRow,"",index,0.333)
		local entry={Button=button,Marker=marker,Key=nil}
		trackConnection(button.Activated:Connect(function()
			if entry.Key then
				setHighlightState(entry.Key)
			end
		end))
		highlightStateButtons[index]=entry
	end

	local highlightTargetRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,28),
		ZIndex=5,
		LayoutOrder=3,
	},highlightPanel)
	New("UIListLayout",{
		FillDirection=Enum.FillDirection.Horizontal,
		Padding=UDim.new(0,8),
		SortOrder=Enum.SortOrder.LayoutOrder,
	},highlightTargetRow)

	for i,target in ipairs({"Fill","Outline"}) do
		local button,marker=makeFlatButton(highlightTargetRow,target,i,0.5)
		trackConnection(button.Activated:Connect(function()
			setHighlightTarget(target)
		end))
		highlightTargetButtons[target]={Button=button,Marker=marker}
	end

	local highlightPickerBody=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,128),
		ZIndex=5,
		LayoutOrder=4,
	},highlightPanel)

	highlightSvBase=New("Frame",{
		BackgroundColor3=Color3.fromRGB(255,0,0),
		BorderSizePixel=0,
		Position=UDim2.fromOffset(0,8),
		Size=UDim2.fromOffset(148,104),
		SkipThemeRole=true,
		ZIndex=6,
	},highlightPickerBody)
	addCorner(highlightSvBase,"Section")

	local highlightWhiteOverlay=New("Frame",{
		BackgroundColor3=Color3.fromRGB(255,255,255),
		BorderSizePixel=0,
		Size=UDim2.new(1,0,1,0),
		SkipThemeRole=true,
		ZIndex=7,
	},highlightSvBase)
	addCorner(highlightWhiteOverlay,"Section")
	New("UIGradient",{
		Transparency=NumberSequence.new({
			NumberSequenceKeypoint.new(0,0),
			NumberSequenceKeypoint.new(1,1),
		}),
	},highlightWhiteOverlay)

	local highlightBlackOverlay=New("Frame",{
		BackgroundColor3=Color3.fromRGB(0,0,0),
		BorderSizePixel=0,
		Size=UDim2.new(1,0,1,0),
		SkipThemeRole=true,
		ZIndex=8,
	},highlightSvBase)
	addCorner(highlightBlackOverlay,"Section")
	New("UIGradient",{
		Rotation=90,
		Transparency=NumberSequence.new({
			NumberSequenceKeypoint.new(0,1),
			NumberSequenceKeypoint.new(1,0),
		}),
	},highlightBlackOverlay)

	highlightSvCursor=New("Frame",{
		BackgroundColor3=Color3.fromRGB(255,255,255),
		BorderSizePixel=0,
		Size=UDim2.fromOffset(8,8),
		SkipThemeRole=true,
		ZIndex=9,
	},highlightSvBase)
	addCorner(highlightSvCursor,"Control")
	New("UIStroke",{Color=Color3.fromRGB(0,0,0),Thickness=1,Transparency=0.35,StrokeRole="Fixed"},highlightSvCursor)

	local highlightHueStrip=New("Frame",{
		BackgroundColor3=Color3.fromRGB(255,255,255),
		BorderSizePixel=0,
		Position=UDim2.fromOffset(158,8),
		Size=UDim2.fromOffset(18,104),
		SkipThemeRole=true,
		ZIndex=6,
	},highlightPickerBody)
	addCorner(highlightHueStrip,"Slider")
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
	},highlightHueStrip)

	highlightHueCursor=New("Frame",{
		BackgroundColor3=Color3.fromRGB(255,255,255),
		BorderSizePixel=0,
		Size=UDim2.new(1,0,0,3),
		SkipThemeRole=true,
		ZIndex=8,
	},highlightHueStrip)
	addCorner(highlightHueCursor,"Slider")

	highlightPickerPreview=New("Frame",{
		BackgroundColor3=getActiveHighlightColor(),
		BorderSizePixel=0,
		Position=UDim2.fromOffset(192,8),
		Size=UDim2.fromOffset(92,54),
		SkipThemeRole=true,
		ZIndex=6,
	},highlightPickerBody)
	addCorner(highlightPickerPreview,"Control")

	highlightPreviewHex=New("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(192,70),
		Size=UDim2.fromOffset(92,18),
		Text=colorToHex(getActiveHighlightColor()),
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},highlightPickerBody)

	trackConnection(highlightSvBase.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			highlightColorDrag="SV"
			updateHighlightColorDrag(input)
		end
	end))

	trackConnection(highlightHueStrip.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			highlightColorDrag="Hue"
			updateHighlightColorDrag(input)
		end
	end))

	trackConnection(UIS.InputChanged:Connect(function(input)
		if highlightColorDrag and input.UserInputType==Enum.UserInputType.MouseMovement then
			updateHighlightColorDrag(input)
		end
	end))

	trackConnection(UIS.InputEnded:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			highlightColorDrag=nil
		end
	end))

	local highlightTransparencyBody=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,101),
		ZIndex=5,
		LayoutOrder=5,
	},highlightPanel)
	New("UIListLayout",{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder},highlightTransparencyBody)

	highlightFillTransparencySlider=makeHighlightSlider(highlightTransparencyBody,"Fill Alpha",0,1,highlightTransparency("Fill"),2,highlightColor("Fill"),function(value)
		writeHighlightTransparency("Fill",value)
		syncHighlightControls()
		updateEverything()
	end)

	highlightOutlineTransparencySlider=makeHighlightSlider(highlightTransparencyBody,"Outline Alpha",0,1,highlightTransparency("Outline"),2,highlightColor("Outline"),function(value)
		writeHighlightTransparency("Outline",value)
		syncHighlightControls()
		updateEverything()
	end)

	paintChoices=function()
		local primary=getUIPrimaryColor()
		local stroke=getUIStrokeColor()
		local activeColor=getActiveColor()

		for _,entry in ipairs(themeCards) do
			local preset=entry.Preset
			local selected=colorsMatch(primary,preset.Primary) and colorsMatch(stroke,preset.Stroke)

			entry.Card.BackgroundColor3=selected and preset.Primary:Lerp(readableTextColor(preset.Primary),0.06) or preset.Primary
			entry.Marker.Visible=selected
			entry.Marker.BackgroundColor3=preset.Stroke
			entry.Label.TextColor3=readableTextColor(entry.Card.BackgroundColor3)
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

		if highlightModeLabel then
			syncHighlightControls()
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
