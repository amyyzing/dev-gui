local MainFrame={}

function MainFrame.new(ctx)
	local New=ctx.New
	local THEME=ctx.THEME
	local Description=ctx.Description or {}
	local UI_WINDOW=ctx.UI_WINDOW
	local SG=ctx.SG
	local UIS=ctx.UIS
	local TweenService=ctx.TweenService
	local RunService=ctx.RunService
	local ContextActionService=game:GetService("ContextActionService")
	local safeDisconnect=ctx.safeDisconnect
	local wrapTextButton=ctx.wrapTextButton
	local attachHover=ctx.attachHover
	local isAlive=ctx.isAlive or function() return true end
	local getModeLabel=ctx.getModeLabel or function() return "Gameplay" end
	local getUIPrimaryColor=ctx.getUIPrimaryColor or function() return THEME.BG end
	local getUIStrokeColor=ctx.getUIStrokeColor or function() return THEME.STROKE end
	local getUIStrokeGradientColor=ctx.getUIStrokeGradientColor or function() return THEME.GREEN or THEME.ACC or THEME.TEXT end
	local getCurrentUILibProfile=ctx.getCurrentUILibProfile
	local uiProfile=type(ctx.UI_PROFILE)=="table" and ctx.UI_PROFILE or {}
	local mainFrameProfile={}
	local windowProfile={}
	local layoutProfile={}
	local componentProfile={}
	local textFont=Enum.Font.Gotham
	local titleFont=Enum.Font.GothamBold
	local controlFont=Enum.Font.GothamMedium

	local function loadProfile(profile)
		uiProfile=type(profile)=="table" and profile or {}
		mainFrameProfile=type(uiProfile.MainFrame)=="table" and uiProfile.MainFrame or {}
		windowProfile=type(mainFrameProfile.Window)=="table" and mainFrameProfile.Window or {}
		layoutProfile=type(mainFrameProfile.Layout)=="table" and mainFrameProfile.Layout or {}
		componentProfile=type(uiProfile.Components)=="table" and uiProfile.Components or {}
		textFont=componentProfile.TextFont or Enum.Font.Gotham
		titleFont=componentProfile.TitleFont or Enum.Font.GothamBold
		controlFont=componentProfile.ControlFont or Enum.Font.GothamMedium
	end

	local function currentProfile()
		if type(getCurrentUILibProfile)=="function" then
			local ok,profile=pcall(getCurrentUILibProfile)
			if ok and type(profile)=="table" then
				return profile
			end
		end

		return uiProfile
	end

	loadProfile(uiProfile)

	local function layoutNumber(profile,key,fallback)
		local value=tonumber(profile and profile[key])
		if value==nil then
			return fallback
		end

		return value
	end

	UI_WINDOW.W=tonumber(UI_WINDOW.W) or layoutNumber(windowProfile,"W",880)
	UI_WINDOW.H=tonumber(UI_WINDOW.H) or layoutNumber(windowProfile,"H",540)
	UI_WINDOW.MinW=tonumber(UI_WINDOW.MinW) or layoutNumber(windowProfile,"MinW",560)
	UI_WINDOW.MinH=tonumber(UI_WINDOW.MinH) or layoutNumber(windowProfile,"MinH",360)
	UI_WINDOW.MaxW=tonumber(UI_WINDOW.MaxW) or layoutNumber(windowProfile,"MaxW",1220)
	UI_WINDOW.MaxH=tonumber(UI_WINDOW.MaxH) or layoutNumber(windowProfile,"MaxH",820)

	local rootStartY=80
	local minimizedRootH=68
	local rootPadding=8
	local mainGap=8
	local pageGap=8
	local columnGap=8
	local footerGap=8
	local headerHeight=52
	local pageBarHeight=30
	local pageTabWidth=106
	local pageTabHeight=28
	local pageHostReserve=156
	local footerHeight=34
	local topButtonSize=28
	local fabSize=42
	local navPlacement="top"
	local navIsLeft=false
	local navWidth=150
	local navGap=8
	local navTabGap=6
	local navTabPad=6
	local navTabInset=6
	local pageShellTransparency=0
	local pageSliderTransparency=0
	local tabTextXAlignment=Enum.TextXAlignment.Center

	local function loadLayoutNumbers()
		rootStartY=layoutNumber(windowProfile,"StartY",80)
		minimizedRootH=layoutNumber(windowProfile,"MinimizedH",68)
		rootPadding=layoutNumber(layoutProfile,"RootPadding",8)
		mainGap=layoutNumber(layoutProfile,"MainGap",8)
		pageGap=layoutNumber(layoutProfile,"PageGap",8)
		columnGap=layoutNumber(layoutProfile,"ColumnGap",8)
		footerGap=layoutNumber(layoutProfile,"FooterGap",8)
		headerHeight=layoutNumber(layoutProfile,"HeaderHeight",52)
		pageBarHeight=layoutNumber(layoutProfile,"PageBarHeight",30)
		pageTabWidth=layoutNumber(layoutProfile,"PageTabWidth",106)
		pageTabHeight=layoutNumber(layoutProfile,"PageTabHeight",28)
		pageHostReserve=layoutNumber(layoutProfile,"PageHostReserve",156)
		footerHeight=layoutNumber(layoutProfile,"FooterHeight",34)
		topButtonSize=layoutNumber(layoutProfile,"TopButtonSize",28)
		fabSize=layoutNumber(layoutProfile,"FabSize",42)
		navPlacement=tostring(layoutProfile.NavPlacement or "top"):lower()
		navIsLeft=navPlacement=="left"
		navWidth=layoutNumber(layoutProfile,"NavWidth",150)
		navGap=layoutNumber(layoutProfile,"NavGap",8)
		navTabGap=layoutNumber(layoutProfile,"NavTabGap",6)
		navTabPad=layoutNumber(layoutProfile,"NavTabPad",6)
		navTabInset=layoutNumber(layoutProfile,"NavTabInset",6)
		pageShellTransparency=layoutNumber(layoutProfile,"PageShellTransparency",0)
		pageSliderTransparency=layoutNumber(layoutProfile,"PageSliderTransparency",0)
		tabTextXAlignment=navIsLeft and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center
	end

	loadLayoutNumbers()

	local function pageTabOffset(index)
		return ((index-1)*pageTabWidth)+1
	end

	local function tabSize()
		if navIsLeft then
			return UDim2.fromOffset(math.max(1,navWidth-(navTabInset*2)),pageTabHeight)
		end

		return UDim2.fromOffset(pageTabWidth,pageTabHeight)
	end

	local function tabPosition(index)
		if navIsLeft then
			return UDim2.fromOffset(navTabInset,navTabPad+((index-1)*(pageTabHeight+navTabGap)))
		end

		return UDim2.fromOffset(pageTabOffset(index),1)
	end

	local function desc(path,fallback)
		if Description and type(Description.Get)=="function" then
			local ok,value=pcall(Description.Get,path,fallback)
			if ok and value~=nil then
				return value
			end
		end

		return fallback
	end

	local function text(raw)
		if Description and type(Description.Text)=="function" then
			local ok,value=pcall(Description.Text,raw)
			if ok and value~=nil then
				return value
			end
		end

		return raw
	end

	local api={}

	local root=New("Frame",{AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,rootStartY),Size=UDim2.fromOffset(UI_WINDOW.W,UI_WINDOW.H),AutomaticSize=Enum.AutomaticSize.None,ClipsDescendants=true,BackgroundColor3=THEME.BG,BorderSizePixel=0,ZIndex=2,Visible=true,CornerRole="Window"},SG)
	local uiMinimized=false
	local rootSizeTween=nil
	local rootPositionTween=nil

	local function mouseInsideRoot()
		if not root or not root.Parent or not root.Visible then
			return false
		end

		if SG and SG.Enabled==false then
			return false
		end

		local mouse=UIS:GetMouseLocation()
		local pos=root.AbsolutePosition
		local size=root.AbsoluteSize
		return mouse.X>=pos.X and mouse.X<=pos.X+size.X and mouse.Y>=pos.Y and mouse.Y<=pos.Y+size.Y
	end

	ContextActionService:BindActionAtPriority("HitboxUI_MouseInputSink",function(_,_,input)
		if input and mouseInsideRoot() then
			return Enum.ContextActionResult.Sink
		end

		return Enum.ContextActionResult.Pass
	end,false,Enum.ContextActionPriority.High.Value+1000,Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3)

	local function tweenRootPosition(position,duration)
		if rootPositionTween then
			rootPositionTween:Cancel()
		end

		rootPositionTween=TweenService:Create(root,TweenInfo.new(duration or 0.08,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=position})
		rootPositionTween:Play()
	end

	local function tweenRootSize(size,duration)
		if rootSizeTween then
			rootSizeTween:Cancel()
		end

		rootSizeTween=TweenService:Create(root,TweenInfo.new(duration or 0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=size})
		rootSizeTween:Play()
		return rootSizeTween
	end

	New("UICorner",{CornerRadius=UDim.new(0,0)},root)
	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.15},root)
	New("UIPadding",{PaddingTop=UDim.new(0,rootPadding),PaddingLeft=UDim.new(0,rootPadding),PaddingRight=UDim.new(0,rootPadding),PaddingBottom=UDim.new(0,rootPadding)},root)

	local uiScale=New("UIScale",{Scale=1},root)
	local updateResponsiveLayout

	local function updateScale()
		local cam=workspace.CurrentCamera
		local vp=cam and cam.ViewportSize or Vector2.new(1920,1080)
		local s=math.clamp(math.min(vp.X/1920,vp.Y/1080),0.78,1.08)
		uiScale.Scale=s

		if updateResponsiveLayout then
			updateResponsiveLayout()
		end
	end

	updateScale()

	task.defer(function()
		local cam=workspace.CurrentCamera
		if cam then
			cam:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)
		end
	end)

	local main=New("Frame",{Size=UDim2.new(1,0,1,0),AutomaticSize=Enum.AutomaticSize.None,BackgroundTransparency=1,ZIndex=3},root)
	local mainLayout=New("UIListLayout",{Padding=UDim.new(0,mainGap),SortOrder=Enum.SortOrder.LayoutOrder},main)

	attachHover=attachHover or function() end

	local header=New("Frame",{Size=UDim2.new(1,0,0,headerHeight),BackgroundColor3=THEME.TOPBAR or THEME.BG,BorderSizePixel=0,ZIndex=4,LayoutOrder=1,ThemeRole="TOPBAR",CornerRole="Section"},main)
	New("UICorner",{CornerRadius=UDim.new(0,0)},header)
	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.25},header)
	local titleLabel=New("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,7),Size=UDim2.new(1,-180,0,18),Text=desc("Main.Title","untitled gui"),Font=titleFont,TextSize=16,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=5},header)

	local modeSubtitle=New("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,26),Size=UDim2.new(1,-180,0,14),Text=desc("Main.Description",getModeLabel().." loaded"),Font=textFont,TextSize=11,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=5},header)

	local function makeTopButton(text,xOffset)
		local b=New("TextButton",{Size=UDim2.fromOffset(topButtonSize,topButtonSize),Position=UDim2.new(1,xOffset,0.5,-topButtonSize/2),BackgroundColor3=THEME.BUTTON or THEME.BG,BorderSizePixel=0,Text=text,Font=controlFont,TextSize=17,TextColor3=THEME.TEXT,AutoButtonColor=false,ZIndex=6,ThemeRole="BUTTON"},header)
		local wrap=wrapTextButton(b,THEME.BUTTON or THEME.BG,2)
		wrap:SetAttribute("ThemeRole","BUTTON")
		wrap:SetAttribute("CornerRole","Control")

		b.MouseEnter:Connect(function()
			wrap.BackgroundColor3=THEME.CARD
		end)

		b.MouseLeave:Connect(function()
			wrap.BackgroundColor3=THEME.BUTTON or THEME.BG
		end)

		return b
	end

	local topButtonGap=layoutNumber(layoutProfile,"TopButtonGap",6)
	local topButtonOuter=layoutNumber(layoutProfile,"TopButtonOuter",10)
	local miniBtn=makeTopButton("-", -(topButtonSize*2+topButtonGap+topButtonOuter))
	local closeBtn=makeTopButton("x", -(topButtonSize+topButtonOuter))

	local pageShellWidth=navIsLeft and navWidth or ((pageTabWidth*6)+2)
	local pageArea=nil
	local pageParent=main
	local pageHostParent=main
	local pageBarLayoutOrder=2
	local pageHostLayoutOrder=3
	local pageBarSize=UDim2.new(1,0,0,pageBarHeight)

	if navIsLeft then
		pageArea=New("Frame",{Size=UDim2.new(1,0,0,384),BackgroundTransparency=1,ZIndex=3,LayoutOrder=2},main)
		New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,navGap),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top},pageArea)
		pageParent=pageArea
		pageHostParent=pageArea
		pageBarLayoutOrder=1
		pageHostLayoutOrder=2
		pageBarSize=UDim2.fromOffset(navWidth,384)
	end

	local pageBar=New("Frame",{Size=pageBarSize,BackgroundTransparency=1,ZIndex=4,LayoutOrder=pageBarLayoutOrder},pageParent)
	local pageShell=New("Frame",{Size=navIsLeft and UDim2.new(1,0,1,0) or UDim2.fromOffset(pageShellWidth,pageBarHeight),BackgroundColor3=THEME.TOPBAR or THEME.BG,BackgroundTransparency=pageShellTransparency,BorderSizePixel=0,ZIndex=5,ThemeRole="TOPBAR",CornerRole="Section"},pageBar)
	local pageShellScale=New("UIScale",{Scale=1},pageShell)
	New("UICorner",{CornerRadius=UDim.new(0,0)},pageShell)
	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.35},pageShell)

	local pageSlider=New("Frame",{Size=tabSize(),Position=tabPosition(1),BackgroundColor3=THEME.BUTTON or THEME.CARD,BackgroundTransparency=pageSliderTransparency,BorderSizePixel=0,ZIndex=6,ThemeRole="BUTTON",CornerRole="Control"},pageShell)
	New("UICorner",{CornerRadius=UDim.new(0,0)},pageSlider)
	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.45},pageSlider)

	local settingsTab=New("TextButton",{Size=tabSize(),Position=tabPosition(1),BackgroundTransparency=1,BorderSizePixel=0,Text=desc("Pages.Main","MAIN"),Font=controlFont,TextSize=11,TextColor3=THEME.TEXT,TextXAlignment=tabTextXAlignment,AutoButtonColor=false,ZIndex=7},pageShell)
	local mapsPageTab=New("TextButton",{Size=tabSize(),Position=tabPosition(2),BackgroundTransparency=1,BorderSizePixel=0,Text=desc("Pages.Maps","MAPS"),Font=controlFont,TextSize=11,TextColor3=THEME.TEXT,TextXAlignment=tabTextXAlignment,AutoButtonColor=false,ZIndex=7},pageShell)
	local serverPageTab=New("TextButton",{Size=tabSize(),Position=tabPosition(3),BackgroundTransparency=1,BorderSizePixel=0,Text=desc("Pages.Server","SERVER"),Font=controlFont,TextSize=11,TextColor3=THEME.TEXT,TextXAlignment=tabTextXAlignment,AutoButtonColor=false,ZIndex=7},pageShell)
	local uiSettingsTab=New("TextButton",{Size=tabSize(),Position=tabPosition(4),BackgroundTransparency=1,BorderSizePixel=0,Text=desc("Pages.Customize","CUSTOMIZE"),Font=controlFont,TextSize=11,TextColor3=THEME.TEXT,TextXAlignment=tabTextXAlignment,AutoButtonColor=false,ZIndex=7},pageShell)
	local futureTab=New("TextButton",{Size=tabSize(),Position=tabPosition(5),BackgroundTransparency=1,BorderSizePixel=0,Text=desc("Pages.Keybinds","KEYBINDS"),Font=controlFont,TextSize=11,TextColor3=THEME.TEXT,TextXAlignment=tabTextXAlignment,AutoButtonColor=false,ZIndex=7},pageShell)
	local settingsPageTab=New("TextButton",{Size=tabSize(),Position=tabPosition(6),BackgroundTransparency=1,BorderSizePixel=0,Text=desc("Pages.Settings","SETTINGS"),Font=controlFont,TextSize=11,TextColor3=THEME.TEXT,TextXAlignment=tabTextXAlignment,AutoButtonColor=false,ZIndex=7},pageShell)

	if navIsLeft then
		for _,tab in ipairs({settingsTab,mapsPageTab,serverPageTab,uiSettingsTab,futureTab,settingsPageTab}) do
			New("UIPadding",{Name="NavPadding",PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,8)},tab)
		end
	end

	local pageTabs={settingsTab,mapsPageTab,serverPageTab,uiSettingsTab,futureTab,settingsPageTab}

	local pageHost=New("ScrollingFrame",{Size=navIsLeft and UDim2.new(1,-(navWidth+navGap),1,0) or UDim2.new(1,0,0,384),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,ScrollBarThickness=4,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=3,LayoutOrder=pageHostLayoutOrder},pageHostParent)
	New("UIListLayout",{Padding=UDim.new(0,0),SortOrder=Enum.SortOrder.LayoutOrder},pageHost)
	New("UIPadding",{PaddingTop=UDim.new(0,2),PaddingLeft=UDim.new(0,3),PaddingRight=UDim.new(0,7),PaddingBottom=UDim.new(0,2)},pageHost)

	local settingsPage=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=true,ZIndex=3,LayoutOrder=1},pageHost)
	New("UIListLayout",{Padding=UDim.new(0,0),SortOrder=Enum.SortOrder.LayoutOrder},settingsPage)

	local mapPage=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false,ZIndex=3,LayoutOrder=2},pageHost)
	New("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},mapPage)

	local serverPage=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false,ZIndex=3,LayoutOrder=3},pageHost)
	New("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},serverPage)

	local uiSettingsPage=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false,ZIndex=3,LayoutOrder=4},pageHost)
	New("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},uiSettingsPage)

	local futurePage=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false,ZIndex=3,LayoutOrder=5},pageHost)
	New("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},futurePage)

	local actualSettingsPage=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false,ZIndex=3,LayoutOrder=6},pageHost)
	New("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},actualSettingsPage)

	local activePageName="main"
	local function getPageIndex(name)
		return ({main=1,maps=2,server=3,customize=4,page2=5,settings=6})[name] or 1
	end

	local function setNavPadding(tab,enabled)
		local existing=tab:FindFirstChild("NavPadding")

		if enabled then
			if not existing then
				New("UIPadding",{Name="NavPadding",PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,8)},tab)
			end
		elseif existing then
			existing:Destroy()
		end
	end

	local function ensureNavParenting()
		pageShellWidth=navIsLeft and navWidth or ((pageTabWidth*6)+2)

		if navIsLeft then
			if not pageArea or not pageArea.Parent then
				pageArea=New("Frame",{Size=UDim2.new(1,0,0,384),BackgroundTransparency=1,ZIndex=3,LayoutOrder=2},main)
				New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,navGap),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top},pageArea)
			end

			pageBar.Parent=pageArea
			pageBar.LayoutOrder=1
			pageHost.Parent=pageArea
			pageHost.LayoutOrder=2
		else
			pageBar.Parent=main
			pageBar.LayoutOrder=2
			pageHost.Parent=main
			pageHost.LayoutOrder=3

			if pageArea and pageArea.Parent then
				pageArea:Destroy()
			end
			pageArea=nil
		end
	end

	local function applyTabGeometry()
		for index,tab in ipairs(pageTabs) do
			tab.Size=tabSize()
			tab.Position=tabPosition(index)
			tab.TextXAlignment=tabTextXAlignment
			tab.Font=controlFont
			setNavPadding(tab,navIsLeft)
		end

		pageSlider.Size=tabSize()
		pageSlider.Position=tabPosition(getPageIndex(activePageName))
	end

	local function paintPageTabs()
		settingsTab:SetAttribute("ThemeTextRole",activePageName=="main" and "TEXT" or "MUTED")
		mapsPageTab:SetAttribute("ThemeTextRole",activePageName=="maps" and "TEXT" or "MUTED")
		serverPageTab:SetAttribute("ThemeTextRole",activePageName=="server" and "TEXT" or "MUTED")
		uiSettingsTab:SetAttribute("ThemeTextRole",activePageName=="customize" and "TEXT" or "MUTED")
		futureTab:SetAttribute("ThemeTextRole",activePageName=="page2" and "TEXT" or "MUTED")
		settingsPageTab:SetAttribute("ThemeTextRole",activePageName=="settings" and "TEXT" or "MUTED")
		settingsTab.TextColor3=activePageName=="main" and THEME.TEXT or THEME.MUTED
		mapsPageTab.TextColor3=activePageName=="maps" and THEME.TEXT or THEME.MUTED
		serverPageTab.TextColor3=activePageName=="server" and THEME.TEXT or THEME.MUTED
		uiSettingsTab.TextColor3=activePageName=="customize" and THEME.TEXT or THEME.MUTED
		futureTab.TextColor3=activePageName=="page2" and THEME.TEXT or THEME.MUTED
		settingsPageTab.TextColor3=activePageName=="settings" and THEME.TEXT or THEME.MUTED
		settingsTab.Font=activePageName=="main" and titleFont or controlFont
		mapsPageTab.Font=activePageName=="maps" and titleFont or controlFont
		serverPageTab.Font=activePageName=="server" and titleFont or controlFont
		uiSettingsTab.Font=activePageName=="customize" and titleFont or controlFont
		futureTab.Font=activePageName=="page2" and titleFont or controlFont
		settingsPageTab.Font=activePageName=="settings" and titleFont or controlFont
	end

	local refreshFooterResetButton=function() end

	local function setActivePage(name)
		activePageName=name or "main"
		settingsPage.Visible=activePageName=="main"
		mapPage.Visible=activePageName=="maps"
		serverPage.Visible=activePageName=="server"
		uiSettingsPage.Visible=activePageName=="customize"
		futurePage.Visible=activePageName=="page2"
		actualSettingsPage.Visible=activePageName=="settings"

		local sliderPos=tabPosition(getPageIndex(activePageName))
		local sliderSize=tabSize()

		TweenService:Create(pageSlider,TweenInfo.new(0.12,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Position=sliderPos,Size=sliderSize}):Play()
		paintPageTabs()
		refreshFooterResetButton()
	end

	settingsTab.MouseButton1Click:Connect(function() setActivePage("main") end)
	mapsPageTab.MouseButton1Click:Connect(function() setActivePage("maps") end)
	serverPageTab.MouseButton1Click:Connect(function() setActivePage("server") end)
	uiSettingsTab.MouseButton1Click:Connect(function() setActivePage("customize") end)
	futureTab.MouseButton1Click:Connect(function() setActivePage("page2") end)
	settingsPageTab.MouseButton1Click:Connect(function() setActivePage("settings") end)

	local contentWrap=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ZIndex=3,LayoutOrder=1},settingsPage)
	local contentLayout=New("UIListLayout",{Padding=UDim.new(0,columnGap),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Enum.FillDirection.Horizontal},contentWrap)

	local columnHalfGap=columnGap/2
	local leftCol=New("Frame",{Size=UDim2.new(0.5,-columnHalfGap,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ZIndex=3,LayoutOrder=1},contentWrap)
	New("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},leftCol)

	local rightCol=New("Frame",{Size=UDim2.new(0.5,-columnHalfGap,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ZIndex=3,LayoutOrder=2},contentWrap)
	New("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},rightCol)

	updateResponsiveLayout=function()
		local cam=workspace.CurrentCamera
		local vp=cam and cam.ViewportSize or Vector2.new(1920,1080)

		UI_WINDOW.W=math.clamp(UI_WINDOW.W,UI_WINDOW.MinW,math.min(UI_WINDOW.MaxW,math.max(560,vp.X-40)))
		UI_WINDOW.H=math.clamp(UI_WINDOW.H,UI_WINDOW.MinH,math.min(UI_WINDOW.MaxH,math.max(360,vp.Y-120)))
		root.Size=UDim2.fromOffset(UI_WINDOW.W,uiMinimized and minimizedRootH or UI_WINDOW.H)

		local pageHeight=math.max(170,UI_WINDOW.H-pageHostReserve)
		if navIsLeft then
			pageArea.Size=UDim2.new(1,0,0,pageHeight)
			pageBar.Size=UDim2.fromOffset(navWidth,pageHeight)
			pageShell.Size=UDim2.new(1,0,1,0)
			pageHost.Size=UDim2.new(1,-(navWidth+navGap),1,0)
			pageShellScale.Scale=1
		else
			pageBar.Size=UDim2.new(1,0,0,pageBarHeight)
			pageShell.Size=UDim2.fromOffset(pageShellWidth,pageBarHeight)
			pageHost.Size=UDim2.new(1,0,0,pageHeight)
			pageShellScale.Scale=math.min(1,math.max(0.72,(UI_WINDOW.W-16)/pageShellWidth))
		end

		local compact=UI_WINDOW.W<720 or vp.X<1100
		if compact then
			contentLayout.FillDirection=Enum.FillDirection.Vertical
			leftCol.Size=UDim2.new(1,0,0,0)
			rightCol.Size=UDim2.new(1,0,0,0)
		else
			contentLayout.FillDirection=Enum.FillDirection.Horizontal
			leftCol.Size=UDim2.new(0.5,-columnHalfGap,0,0)
			rightCol.Size=UDim2.new(0.5,-columnHalfGap,0,0)
		end
	end

	updateResponsiveLayout()

	local footer=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,footerHeight),ZIndex=4,LayoutOrder=4},main)
	New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,footerGap),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Right,VerticalAlignment=Enum.VerticalAlignment.Center},footer)

	function api.RefreshESPStatus() end
	function api.RefreshActionStatus() end

	local function makeFooterBtn(text,width)
		local b=New("TextButton",{Size=UDim2.fromOffset(width or 96,30),BackgroundColor3=THEME.BUTTON or THEME.BG,Text=string.upper(text),TextColor3=THEME.TEXT,Font=controlFont,TextSize=12,AutoButtonColor=false,BorderSizePixel=0,ZIndex=6,ThemeRole="BUTTON"},footer)
		local wrap=wrapTextButton(b,THEME.BUTTON or THEME.BG,2)
		wrap:SetAttribute("ThemeRole","BUTTON")
		wrap:SetAttribute("CornerRole","Control")

		b.MouseEnter:Connect(function()
			wrap.BackgroundColor3=THEME.CARD
		end)

		b.MouseLeave:Connect(function()
			wrap.BackgroundColor3=THEME.BUTTON or THEME.BG
		end)

		return b,wrap
	end

	local resetBtn,resetWrap=makeFooterBtn("Reset",94)

	refreshFooterResetButton=function()
		local showReset=activePageName~="settings" and activePageName~="maps" and activePageName~="server"
		resetBtn.Visible=showReset
		resetBtn.Text=text("RESET")
		resetWrap.Visible=showReset
	end

	refreshFooterResetButton()

	local fab=New("TextButton",{Name="FAB",Visible=false,AutoButtonColor=false,Size=UDim2.fromOffset(fabSize,fabSize),AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-16,1,-16),BackgroundColor3=THEME.BUTTON or THEME.BG,BorderSizePixel=0,Text="[]",TextColor3=THEME.TEXT,Font=controlFont,TextSize=16,ZIndex=20,ThemeRole="BUTTON",CornerRole="Control"},SG)
	New("UICorner",{CornerRadius=UDim.new(0,0)},fab)
	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},fab)
	fab.MouseEnter:Connect(function()
		fab.BackgroundColor3=THEME.CARD
	end)

	fab.MouseLeave:Connect(function()
		fab.BackgroundColor3=THEME.BUTTON or THEME.BG
	end)

	local resizeHandle=New("TextButton",{Name="ResizeHandle",AutoButtonColor=false,Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,7,1,-7),BackgroundColor3=THEME.CARD,BackgroundTransparency=0.02,BorderSizePixel=0,Text="",ZIndex=30,ThemeRole="CARD"},root)
	New("UICorner",{CornerRadius=UDim.new(0,0)},resizeHandle)
	local resizeStroke=New("UIStroke",{Color=getUIStrokeColor(),Thickness=1,Transparency=0.05},resizeHandle)
	local resizeGlow=New("UIGradient",{Rotation=45,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,getUIStrokeColor()),ColorSequenceKeypoint.new(1,getUIStrokeGradientColor())})},resizeHandle)

	local resizeHovering=false
	local resizing=false

	local function resizeColorSet(held)
		local stroke=getUIStrokeColor()
		local accent=getUIStrokeGradientColor()
		local primary=getUIPrimaryColor()
		local base=primary:Lerp(stroke,0.18)

		if held then
			return primary:Lerp(accent,0.35),accent:Lerp(stroke,0.2),ColorSequence.new({
				ColorSequenceKeypoint.new(0,primary:Lerp(accent,0.25)),
				ColorSequenceKeypoint.new(0.5,accent:Lerp(primary,0.2)),
				ColorSequenceKeypoint.new(1,primary:Lerp(stroke,0.35)),
			})
		end

		if resizeHovering then
			return primary:Lerp(accent,0.22),stroke:Lerp(accent,0.65),ColorSequence.new({
				ColorSequenceKeypoint.new(0,primary:Lerp(stroke,0.16)),
				ColorSequenceKeypoint.new(0.45,accent:Lerp(primary,0.25)),
				ColorSequenceKeypoint.new(1,primary:Lerp(accent,0.32)),
			})
		end

		return base,stroke,ColorSequence.new({
			ColorSequenceKeypoint.new(0,primary),
			ColorSequenceKeypoint.new(1,stroke),
		})
	end

	local function paintResizeHandle(held)
		local targetSize=held and 18 or (resizeHovering and 16 or 14)
		local targetColor,targetStroke,targetGradient=resizeColorSet(held)
		local targetTransparency=held and 0 or (resizeHovering and 0.01 or 0.02)

		resizeGlow.Color=targetGradient

		TweenService:Create(resizeHandle,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
			Size=UDim2.fromOffset(targetSize,targetSize),
			BackgroundColor3=targetColor,
			BackgroundTransparency=targetTransparency,
		}):Play()

		TweenService:Create(resizeStroke,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
			Color=targetStroke,
			Thickness=held and 2 or 1,
			Transparency=(held or resizeHovering) and 0 or 0.05,
		}):Play()

		TweenService:Create(resizeGlow,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
			Rotation=held and 180 or (resizeHovering and 90 or 45),
		}):Play()
	end

	resizeHandle.MouseEnter:Connect(function()
		resizeHovering=true
		paintResizeHandle(resizing)
	end)

	resizeHandle.MouseLeave:Connect(function()
		resizeHovering=false
		paintResizeHandle(resizing)
	end)

	do
		local startMouse=nil
		local startW,startH=0,0
		local startPos=nil
		local resizeMoveConn=nil

		local function stopResize()
			resizing=false
			paintResizeHandle(false)
			safeDisconnect(resizeMoveConn)
			resizeMoveConn=nil
		end

		resizeHandle.InputBegan:Connect(function(input)
			if input.UserInputType~=Enum.UserInputType.MouseButton1 then return end

			resizing=true
			paintResizeHandle(true)
			startMouse=UIS:GetMouseLocation()
			startW,startH=UI_WINDOW.W,UI_WINDOW.H
			startPos=root.Position
			safeDisconnect(resizeMoveConn)

			resizeMoveConn=UIS.InputChanged:Connect(function(changed)
				if not resizing or not isAlive() then return end
				if changed.UserInputType~=Enum.UserInputType.MouseMovement then return end

				local cur=UIS:GetMouseLocation()
				local scale=uiScale.Scale
				if scale<=0 then scale=1 end

				local dx=(cur.X-startMouse.X)/scale
				local dy=(cur.Y-startMouse.Y)/scale

				UI_WINDOW.W=math.clamp(startW-dx,UI_WINDOW.MinW,UI_WINDOW.MaxW)
				UI_WINDOW.H=math.clamp(startH+dy,UI_WINDOW.MinH,UI_WINDOW.MaxH)

				local usedDx=startW-UI_WINDOW.W
				root.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+(usedDx*0.5),startPos.Y.Scale,startPos.Y.Offset)

				if updateResponsiveLayout then
					updateResponsiveLayout()
				end
			end)
		end)

		UIS.InputEnded:Connect(function(input)
			if input.UserInputType==Enum.UserInputType.MouseButton1 then
				stopResize()
			end
		end)
	end

	local function setBodyVisible(visible)
		if pageArea then
			pageArea.Visible=visible
		end
		pageBar.Visible=visible
		pageHost.Visible=visible
		footer.Visible=visible
		resizeHandle.Visible=visible
	end

	local function minimize()
		if uiMinimized then return end
		uiMinimized=true
		fab.Visible=false
		miniBtn.Text="+"
		root.Visible=true
		setBodyVisible(true)

		local tween=tweenRootSize(UDim2.fromOffset(UI_WINDOW.W,minimizedRootH),0.22)
		tween.Completed:Connect(function()
			if uiMinimized then
				setBodyVisible(false)
			end
		end)
	end

	local function restore()
		if not uiMinimized then return end
		uiMinimized=false
		fab.Visible=false
		miniBtn.Text="-"
		root.Visible=true
		setBodyVisible(true)
		tweenRootSize(UDim2.fromOffset(UI_WINDOW.W,UI_WINDOW.H),0.22)
	end

	miniBtn.MouseButton1Click:Connect(function()
		if uiMinimized then
			restore()
		else
			minimize()
		end
	end)

	fab.MouseButton1Click:Connect(restore)

	do
		local dragging=false
		local startMouse,startPos
		local lastDragTween=0
		local lastDragTarget=nil

		header.InputBegan:Connect(function(i)
			if i.UserInputType==Enum.UserInputType.MouseButton1 then
				dragging=true
				startMouse=UIS:GetMouseLocation()
				startPos=root.Position
				lastDragTween=0
				lastDragTarget=nil

				if rootPositionTween then
					rootPositionTween:Cancel()
					rootPositionTween=nil
				end
			end
		end)

		UIS.InputEnded:Connect(function(i)
			if i.UserInputType==Enum.UserInputType.MouseButton1 then
				dragging=false
			end
		end)

		RunService.RenderStepped:Connect(function()
			if not isAlive() or not dragging then return end

			local cur=UIS:GetMouseLocation()
			local scale=uiScale.Scale
			if scale<=0 then scale=1 end

			local delta=(cur-startMouse)/scale
			local target=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
			local now=os.clock()

			if not lastDragTarget or math.abs(target.X.Offset-lastDragTarget.X.Offset)>1 or math.abs(target.Y.Offset-lastDragTarget.Y.Offset)>1 then
				if now-lastDragTween>=0.025 then
					lastDragTween=now
					lastDragTarget=target
					tweenRootPosition(target,0.075)
				end
			end
		end)
	end

	function api.SetActivePage(name)
		setActivePage(name)
	end

	function api.GetActivePageName()
		return activePageName
	end

	function api.RefreshFooterResetButton()
		refreshFooterResetButton()
	end

	function api.UpdateResponsiveLayout()
		updateResponsiveLayout()
	end

	function api.RefreshTheme()
		pageShell.BackgroundTransparency=pageShellTransparency
		pageSlider.BackgroundTransparency=pageSliderTransparency
		paintPageTabs()
		paintResizeHandle(resizing)
	end

	function api.ApplyProfile(profile)
		loadProfile(profile or currentProfile())
		loadLayoutNumbers()

		UI_WINDOW.MinW=layoutNumber(windowProfile,"MinW",UI_WINDOW.MinW or 560)
		UI_WINDOW.MinH=layoutNumber(windowProfile,"MinH",UI_WINDOW.MinH or 360)
		UI_WINDOW.MaxW=layoutNumber(windowProfile,"MaxW",UI_WINDOW.MaxW or 1220)
		UI_WINDOW.MaxH=layoutNumber(windowProfile,"MaxH",UI_WINDOW.MaxH or 820)
		UI_WINDOW.W=math.clamp(UI_WINDOW.W,UI_WINDOW.MinW,UI_WINDOW.MaxW)
		UI_WINDOW.H=math.clamp(UI_WINDOW.H,UI_WINDOW.MinH,UI_WINDOW.MaxH)

		columnHalfGap=columnGap/2
		mainLayout.Padding=UDim.new(0,mainGap)
		header.Size=UDim2.new(1,0,0,headerHeight)
		footer.Size=UDim2.new(1,0,0,footerHeight)
		titleLabel.Font=titleFont
		modeSubtitle.Font=textFont
		pageShell.BackgroundTransparency=pageShellTransparency
		pageSlider.BackgroundTransparency=pageSliderTransparency

		ensureNavParenting()
		applyTabGeometry()
		updateResponsiveLayout()
		paintPageTabs()
	end

	function api.RefreshText(newDescription)
		Description=newDescription or Description
		titleLabel.Text=text(desc("Main.Title","untitled gui"))
		modeSubtitle.Text=text(desc("Main.Description",getModeLabel().." loaded"))
		settingsTab.Text=text(desc("Pages.Main","MAIN"))
		mapsPageTab.Text=text(desc("Pages.Maps","MAPS"))
		serverPageTab.Text=text(desc("Pages.Server","SERVER"))
		uiSettingsTab.Text=text(desc("Pages.Customize","CUSTOMIZE"))
		futureTab.Text=text(desc("Pages.Keybinds","KEYBINDS"))
		settingsPageTab.Text=text(desc("Pages.Settings","SETTINGS"))
		paintPageTabs()
		refreshFooterResetButton()
	end

	function api.Destroy()
		pcall(function()
			ContextActionService:UnbindAction("HitboxUI_MouseInputSink")
		end)
	end

	api.root=root
	api.uiScale=uiScale
	api.main=main
	api.header=header
	api.modeSubtitle=modeSubtitle
	api.closeBtn=closeBtn
	api.resetBtn=resetBtn
	api.pageBar=pageBar
	api.pageHost=pageHost
	api.settingsPage=settingsPage
	api.futurePage=futurePage
	api.uiSettingsPage=uiSettingsPage
	api.mapPage=mapPage
	api.serverPage=serverPage
	api.actualSettingsPage=actualSettingsPage
	api.leftCol=leftCol
	api.rightCol=rightCol
	api.footer=footer

	setActivePage("main")

	return api
end

return MainFrame
