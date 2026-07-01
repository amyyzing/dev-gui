-- App-owned UI map.
-- 495-ui-library defines reusable controls; this file tells this GUI which
-- profile, layout, and saved style defaults to install into those controls.
local uiMap={}

uiMap.DefaultProfileId="original"

uiMap.Profiles={
	original={
		Id="original",
		Name="Original",

		Style={
			Primary=Color3.fromRGB(12,12,12),
			Stroke=Color3.fromRGB(182,180,180),
			Gradient=Color3.fromRGB(182,180,180),
			GradientOn=false,
			StrokeThickness=1,
			StrokeTransparency=0.84,
		},

		Theme={},

		Shape={
			WindowRadius=0,
			SectionRadius=0,
			ControlRadius=0,
			SliderRadius=0,
			SliderHeight=26,
			SliderStyle="original",
			WindowStrokeTransparency=0.62,
			SectionStrokeTransparency=0.92,
			ControlStrokeTransparency=0.9,
			SliderStrokeTransparency=0.9,
			AccentStrokeTransparency=0.72,
		},

		Components={
			TextFont=Enum.Font.Gotham,
			TitleFont=Enum.Font.GothamBold,
			ControlFont=Enum.Font.GothamMedium,
			SectionPrefix=true,
			SectionPaddingX=12,
			SectionPaddingY=10,
			SectionGap=6,
			SectionHeaderHeight=22,
			SectionTitleSize=14,
			SectionSubtitleSize=11,
			SectionBackgroundTransparency=0,
			SectionStrokeTransparency=0.84,
			SectionBodyInset=2,
			SectionBodyGap=6,
			SliderRowHeight=48,
			SliderValueBoxWidth=58,
			SliderValueBoxVisible=true,
			SliderContainerTransparency=1,
			SliderContainerStrokeTransparency=1,
			SliderLabelX=12,
			SliderRightPadding=8,
			ToggleWidth=48,
			ToggleHeight=20,
			ToggleStyle="switch",
			TextBoxHeight=28,
			ButtonHeight=30,
			ControlStrokeTransparency=0.78,
		},

		Defaults={
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
		},

		mainFrame={
			Window={
				W=880,
				H=540,
				MinW=560,
				MinH=360,
				MaxW=1220,
				MaxH=820,
				StartY=80,
				MinimizedH=68,
			},

			Layout={
				RootPadding=8,
				MainGap=8,
				PageGap=8,
				ColumnGap=8,
				FooterGap=8,
				HeaderHeight=52,
				PageBarHeight=30,
				PageTabWidth=106,
				PageTabHeight=28,
				FooterHeight=34,
				TopButtonSize=28,
				TopButtonGap=6,
				TopButtonOuter=10,
			},
		},
	},
}

local function copyTable(source)
	local result={}

	for key,value in pairs(source or {}) do
		result[key]=value
	end

	return result
end

function uiMap.GetProfile(id)
	local profileId=tostring(id or uiMap.DefaultProfileId):lower()
	return uiMap.Profiles[profileId] or uiMap.Profiles[uiMap.DefaultProfileId]
end

function uiMap.GetDefaultProfile()
	return uiMap.GetProfile(uiMap.DefaultProfileId)
end

function uiMap.GetDefaultStyle()
	local profile=uiMap.GetDefaultProfile()
	local defaults=copyTable(profile and profile.Defaults)
	defaults.UILib=tostring(defaults.UILib or uiMap.DefaultProfileId)
	return defaults
end

function uiMap.GetDefaultWindow()
	local profile=uiMap.GetDefaultProfile()
	return copyTable(profile and profile.mainFrame and profile.mainFrame.Window)
end

return uiMap
