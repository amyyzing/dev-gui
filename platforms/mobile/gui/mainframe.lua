-- Mobile platform shell.
-- It currently mirrors the desktop shell, but this file is the place for
-- touch-first navigation and layout changes instead of changing the UI library.
local mainFrame={}

function mainFrame.new(app)
	local make=app.New or app.make
	local fusion=app.Fusion or app.fusion
	local colors=app.colors
	local description=app.Description or app.description or {}
	local windowState=app.windowState
	local screenGui=app.SG or app.screenGui
	local inputService=app.inputService
	local tweenService=app.TweenService
	local runService=app.RunService
	local contextActionService=game:GetService("ContextActionService")
	local safeDisconnect=app.safeDisconnect
	local wrapTextButton=app.wrapTextButton
	local attachHover=app.attachHover
	local isAlive=app.isAlive or function() return true end
	local getModeLabel=app.getModeLabel or function() return "Gameplay" end
	local getUIStrokeColor=app.getUIStrokeColor or function() return colors.stroke end
	local getCurrentUILibProfile=app.getCurrentUILibProfile
	local onPageActivated=app.onPageActivated
	local uiProfile=type(app.uiProfile)=="table" and app.uiProfile or {}
	local uiMap=type(app.uiMap)=="table" and app.uiMap or {}
	local mainFrameProfile={}
	local windowProfile={}
	local layoutProfile={}
	local componentProfile={}
	local textFont=Enum.Font.Gotham
	local titleFont=Enum.Font.GothamBold
	local controlFont=Enum.Font.GothamMedium

	local function loadProfile(profile)
		uiProfile=type(profile)=="table" and profile or {}
		mainFrameProfile=type(uiProfile.mainFrame)=="table" and uiProfile.mainFrame or {}
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

	windowState.W=tonumber(windowState.W) or layoutNumber(windowProfile,"W",880)
	windowState.H=tonumber(windowState.H) or layoutNumber(windowProfile,"H",540)
	windowState.MinW=tonumber(windowState.MinW) or layoutNumber(windowProfile,"MinW",560)
	windowState.MinH=tonumber(windowState.MinH) or layoutNumber(windowProfile,"MinH",360)
	windowState.MaxW=tonumber(windowState.MaxW) or layoutNumber(windowProfile,"MaxW",1220)
	windowState.MaxH=tonumber(windowState.MaxH) or layoutNumber(windowProfile,"MaxH",820)

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
	local footerHeight=34
	local topButtonSize=28
	local topButtonGap=6
	local topButtonOuter=10
	local navPlacement="top"
	local navIsLeft=false
	local navWidth=150
	local navGap=8
	local navTabGap=6
	local navTabPad=6
	local navTabInset=6
	local pageShellTransparency=0
	local pageSliderTransparency=0
	local rootStrokeTransparency=1
	local headerStrokeTransparency=0.86
	local pageShellStrokeTransparency=0.9
	local pageSliderStrokeTransparency=0.92
	local resizeHandleVisible=false
	local headerSubtitleVisible=true
	local headerSearchVisible=false
	local headerSearchPlaceholder="Search"
	local headerSearchWidth=210
	local headerSearchHeight=28
	local headerTitleX=16
	local headerTitleY=7
	local headerTitleSize=16
	local headerSubtitleY=26
	local headerSubtitleSize=11
	local pageSliderVisible=true
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
		footerHeight=layoutNumber(layoutProfile,"FooterHeight",34)
		topButtonSize=layoutNumber(layoutProfile,"TopButtonSize",28)
		topButtonGap=layoutNumber(layoutProfile,"TopButtonGap",6)
		topButtonOuter=layoutNumber(layoutProfile,"TopButtonOuter",10)
		navPlacement=tostring(layoutProfile.NavPlacement or "top"):lower()
		navIsLeft=navPlacement=="left"
		navWidth=layoutNumber(layoutProfile,"NavWidth",150)
		navGap=layoutNumber(layoutProfile,"NavGap",8)
		navTabGap=layoutNumber(layoutProfile,"NavTabGap",6)
		navTabPad=layoutNumber(layoutProfile,"NavTabPad",6)
		navTabInset=layoutNumber(layoutProfile,"NavTabInset",6)
		pageShellTransparency=layoutNumber(layoutProfile,"PageShellTransparency",0)
		pageSliderTransparency=layoutNumber(layoutProfile,"PageSliderTransparency",0)
		rootStrokeTransparency=1
		headerStrokeTransparency=layoutNumber(layoutProfile,"HeaderStrokeTransparency",0.86)
		pageShellStrokeTransparency=layoutNumber(layoutProfile,"PageShellStrokeTransparency",0.9)
		pageSliderStrokeTransparency=layoutNumber(layoutProfile,"PageSliderStrokeTransparency",0.92)
		resizeHandleVisible=layoutProfile.ResizeHandleVisible==true
		headerSubtitleVisible=layoutProfile.HeaderSubtitleVisible~=false
		headerSearchVisible=layoutProfile.HeaderSearchVisible==true
		headerSearchPlaceholder=tostring(layoutProfile.HeaderSearchPlaceholder or "Search")
		headerSearchWidth=layoutNumber(layoutProfile,"HeaderSearchWidth",210)
		headerSearchHeight=layoutNumber(layoutProfile,"HeaderSearchHeight",28)
		headerTitleX=layoutNumber(layoutProfile,"HeaderTitleX",16)
		headerTitleY=layoutNumber(layoutProfile,"HeaderTitleY",7)
		headerTitleSize=layoutNumber(layoutProfile,"HeaderTitleSize",16)
		headerSubtitleY=layoutNumber(layoutProfile,"HeaderSubtitleY",26)
		headerSubtitleSize=layoutNumber(layoutProfile,"HeaderSubtitleSize",11)
		pageSliderVisible=layoutProfile.PageSliderVisible~=false
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
		if description and type(description.Get)=="function" then
			local ok,value=pcall(description.Get,path,fallback)
			if ok and value~=nil then
				return value
			end
		end

		return fallback
	end

	local function text(raw)
		if description and type(description.Text)=="function" then
			local ok,value=pcall(description.Text,raw)
			if ok and value~=nil then
				return value
			end
		end

		return raw
	end

	local api={}
	local cleanupTasks={}
	local destroyed=false

	local function trackCleanup(taskItem)
		if taskItem then
			table.insert(cleanupTasks,taskItem)
		end

		return taskItem
	end

	local function connect(signal,fn)
		if destroyed then
			return nil
		end

		return trackCleanup(signal:Connect(fn))
	end

	local function activate(button,fn)
		if button and button:IsA("GuiButton") then
			button.Selectable=true
		end

		return connect(button.Activated,fn)
	end

	local function cleanupAll()
		if destroyed then return end
		destroyed=true

		for index=#cleanupTasks,1,-1 do
			local taskItem=cleanupTasks[index]
			cleanupTasks[index]=nil

			if typeof(taskItem)=="RBXScriptConnection" then
				pcall(function()
					taskItem:Disconnect()
				end)
			elseif type(taskItem)=="function" then
				pcall(taskItem)
			end
		end
	end

	local fusionScope=nil
	if type(fusion)=="table" and type(fusion.scoped)=="function" then
		fusionScope=fusion.scoped(fusion)
		trackCleanup(function()
			fusionScope:doCleanup()
		end)
	end

	local function makeFusionValue(initial)
		if fusionScope and type(fusionScope.Value)=="function" then
			return fusionScope:Value(initial)
		end
		return nil
	end

	local function makeFusionComputed(fn)
		if fusionScope and type(fusionScope.Computed)=="function" then
			return fusionScope:Computed(fn)
		end
		return nil
	end

	local function hydrateFusion(instance,properties)
		if instance and fusionScope and type(fusionScope.Hydrate)=="function" then
			fusionScope:Hydrate(instance)(properties)
		end
	end

	local function bumpFusionValue(value)
		if value and type(value.get)=="function" and type(value.set)=="function" then
			value:set((tonumber(value:get()) or 0)+1)
		end
	end

	local root=make("Frame",{AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,rootStartY),Size=UDim2.fromOffset(windowState.W,windowState.H),AutomaticSize=Enum.AutomaticSize.None,ClipsDescendants=true,BackgroundColor3=colors.bg,BorderSizePixel=0,ZIndex=2,Visible=true,CornerRole="Window"},screenGui)
	local uiMinimized=false
	local uiMinimizedValue=makeFusionValue(uiMinimized)
	local descriptionVersionValue=makeFusionValue(0)
	local profileVersionValue=makeFusionValue(0)
	local rootSizeTween=nil
	local rootPositionTween=nil

	local function getViewportSize()
		local camera=workspace.CurrentCamera
		return camera and camera.ViewportSize or Vector2.new(1920,1080)
	end

	local function clampRootPosition(position)
		local viewport=getViewportSize()
		local width=math.min(root.Size.X.Offset,viewport.X)
		local height=math.min(root.Size.Y.Offset,viewport.Y)
		local anchorX=(position.X.Scale*viewport.X)+position.X.Offset
		local anchorY=(position.Y.Scale*viewport.Y)+position.Y.Offset
		local margin=8
		local minX=(width*0.5)+margin
		local maxX=viewport.X-(width*0.5)-margin
		local maxY=viewport.Y-height-margin

		if maxX<minX then
			anchorX=viewport.X*0.5
		else
			anchorX=math.clamp(anchorX,minX,maxX)
		end

		anchorY=math.clamp(anchorY,margin,math.max(margin,maxY))
		return UDim2.fromOffset(math.floor(anchorX+0.5),math.floor(anchorY+0.5))
	end

	local function mouseInsideRoot()
		if not root or not root.Parent or not root.Visible then
			return false
		end

		if screenGui and screenGui.Enabled==false then
			return false
		end

		local mouse=inputService:GetMouseLocation()
		local pos=root.AbsolutePosition
		local size=root.AbsoluteSize
		return mouse.X>=pos.X and mouse.X<=pos.X+size.X and mouse.Y>=pos.Y and mouse.Y<=pos.Y+size.Y
	end

	contextActionService:BindActionAtPriority("HitboxUI_MouseInputSink",function(_,_,input)
		if input and mouseInsideRoot() then
			return Enum.ContextActionResult.Sink
		end

		return Enum.ContextActionResult.Pass
	end,false,Enum.ContextActionPriority.High.Value+1000,Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3)
	trackCleanup(function()
		contextActionService:UnbindAction("HitboxUI_MouseInputSink")
	end)

	local function tweenRootPosition(position,duration)
		if rootPositionTween then
			rootPositionTween:Cancel()
		end

		rootPositionTween=tweenService:Create(root,TweenInfo.new(duration or 0.08,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=clampRootPosition(position)})
		rootPositionTween:Play()
	end

	local function tweenRootSize(size,duration)
		if rootSizeTween then
			rootSizeTween:Cancel()
		end

		rootSizeTween=tweenService:Create(root,TweenInfo.new(duration or 0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=size})
		rootSizeTween:Play()
		return rootSizeTween
	end

	make("UICorner",{CornerRadius=UDim.new(0,0)},root)
	local rootStroke=make("UIStroke",{Color=colors.stroke,Thickness=1,Transparency=rootStrokeTransparency},root)
	rootStroke:SetAttribute("BaseStrokeTransparency",rootStrokeTransparency)
	rootStroke:SetAttribute("StrokeRole","Hidden")
	local rootPad=make("UIPadding",{PaddingTop=UDim.new(0,rootPadding),PaddingLeft=UDim.new(0,rootPadding),PaddingRight=UDim.new(0,rootPadding),PaddingBottom=UDim.new(0,rootPadding)},root)

	local uiScale=make("UIScale",{Scale=1},root)
	local updateResponsiveLayout

	local function updateScale()
		uiScale.Scale=1

		if updateResponsiveLayout then
			updateResponsiveLayout()
		end
	end

	updateScale()

	task.defer(function()
		local cam=workspace.CurrentCamera
		if cam and not destroyed then
			connect(cam:GetPropertyChangedSignal("ViewportSize"),updateScale)
		end
	end)

	local main=make("Frame",{Size=UDim2.new(1,0,1,0),AutomaticSize=Enum.AutomaticSize.None,BackgroundTransparency=1,ClipsDescendants=true,ZIndex=3},root)
	local mainLayout=make("UIListLayout",{Padding=UDim.new(0,mainGap),SortOrder=Enum.SortOrder.LayoutOrder},main)

	attachHover=attachHover or function() end

	local header=make("Frame",{Size=UDim2.new(1,0,0,headerHeight),BackgroundColor3=colors.topbar or colors.bg,BorderSizePixel=0,ZIndex=4,LayoutOrder=1,ThemeRole="TOPBAR",CornerRole="Section"},main)
	make("UICorner",{CornerRadius=UDim.new(0,0)},header)
	local headerStroke=make("UIStroke",{Color=colors.stroke,Thickness=1,Transparency=headerStrokeTransparency},header)
	headerStroke:SetAttribute("BaseStrokeTransparency",headerStrokeTransparency)
	local titleText=make("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(headerTitleX,headerTitleY),Size=UDim2.new(1,-180,0,18),Text=desc("Main.Title","untitled gui"),Font=titleFont,TextSize=headerTitleSize,TextColor3=colors.text,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=5},header)

	local subtitleText=make("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(headerTitleX,headerSubtitleY),Size=UDim2.new(1,-180,0,14),Text=desc("Main.Description",getModeLabel().." loaded"),Font=textFont,TextSize=headerSubtitleSize,TextColor3=colors.muted,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=5,Visible=headerSubtitleVisible},header)

	local function makeTopButton(text,xOffset)
		local b=make("TextButton",{Size=UDim2.fromOffset(topButtonSize,topButtonSize),Position=UDim2.new(1,xOffset,0.5,-topButtonSize/2),BackgroundColor3=colors.button or colors.bg,BorderSizePixel=0,Text=text,Font=controlFont,TextSize=17,TextColor3=colors.text,AutoButtonColor=false,Selectable=true,ZIndex=6,ThemeRole="BUTTON"},header)
		local wrap=wrapTextButton(b,colors.button or colors.bg,2)
		wrap:SetAttribute("ThemeRole","BUTTON")
		wrap:SetAttribute("CornerRole","Control")

		connect(b.MouseEnter,function()
			wrap.BackgroundColor3=colors.card
		end)

		connect(b.MouseLeave,function()
			wrap.BackgroundColor3=colors.button or colors.bg
		end)

		return b,wrap
	end

	local function topButtonX(index)
		return -(topButtonOuter+(topButtonSize*index)+(topButtonGap*(index-1)))
	end

	local function headerSearchInset()
		return topButtonOuter+(topButtonSize*2)+topButtonGap+12
	end

	local miniBtn,miniWrap=makeTopButton("-",topButtonX(2))
	local closeBtn,closeWrap=makeTopButton("x",topButtonX(1))

	hydrateFusion(miniBtn,{
		Text=makeFusionComputed(function(use)
			return use(uiMinimizedValue) and "+" or "-"
		end),
	})

	local headerSearch=make("Frame",{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-headerSearchInset(),0.5,0),Size=UDim2.fromOffset(headerSearchWidth,headerSearchHeight),BackgroundColor3=colors.input or colors.panel,BorderSizePixel=0,ZIndex=5,Visible=headerSearchVisible,ThemeRole="INPUT",CornerRole="Control"},header)
	make("UICorner",{CornerRadius=UDim.new(0,0)},headerSearch)
	local headerSearchStroke=make("UIStroke",{Color=colors.stroke,Thickness=1,Transparency=0.78},headerSearch)
	headerSearchStroke:SetAttribute("BaseStrokeTransparency",0.78)
	local headerSearchLabel=make("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(12,0),Size=UDim2.new(1,-24,1,0),Text=headerSearchPlaceholder,Font=textFont,TextSize=12,TextColor3=colors.muted,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6,TextRole="MUTED"},headerSearch)

	hydrateFusion(titleText,{
		Text=makeFusionComputed(function(use)
			use(descriptionVersionValue)
			return text(desc("Main.Title","untitled gui"))
		end),
		Font=makeFusionComputed(function(use)
			use(profileVersionValue)
			return titleFont
		end),
		TextSize=makeFusionComputed(function(use)
			use(profileVersionValue)
			return headerTitleSize
		end),
		Position=makeFusionComputed(function(use)
			use(profileVersionValue)
			return UDim2.fromOffset(headerTitleX,headerTitleY)
		end),
	})

	hydrateFusion(subtitleText,{
		Text=makeFusionComputed(function(use)
			use(descriptionVersionValue)
			return text(desc("Main.Description",getModeLabel().." loaded"))
		end),
		Font=makeFusionComputed(function(use)
			use(profileVersionValue)
			return textFont
		end),
		TextSize=makeFusionComputed(function(use)
			use(profileVersionValue)
			return headerSubtitleSize
		end),
		Position=makeFusionComputed(function(use)
			use(profileVersionValue)
			return UDim2.fromOffset(headerTitleX,headerSubtitleY)
		end),
		Visible=makeFusionComputed(function(use)
			use(profileVersionValue)
			return headerSubtitleVisible
		end),
	})

	hydrateFusion(headerSearch,{
		Visible=makeFusionComputed(function(use)
			use(profileVersionValue)
			return headerSearchVisible
		end),
		Size=makeFusionComputed(function(use)
			use(profileVersionValue)
			return UDim2.fromOffset(headerSearchWidth,headerSearchHeight)
		end),
		Position=makeFusionComputed(function(use)
			use(profileVersionValue)
			return UDim2.new(1,-headerSearchInset(),0.5,0)
		end),
	})

	hydrateFusion(headerSearchLabel,{
		Text=makeFusionComputed(function(use)
			use(profileVersionValue)
			return headerSearchPlaceholder
		end),
		Font=makeFusionComputed(function(use)
			use(profileVersionValue)
			return textFont
		end),
	})

	local pageShellWidth=navIsLeft and navWidth or ((pageTabWidth*6)+2)
	local pageArea=nil
	local pageParent=main
	local pageViewportParent=main
	local pageBarLayoutOrder=2
	local pageViewportLayoutOrder=3
	local pageBarSize=UDim2.new(1,0,0,pageBarHeight)

	if navIsLeft then
		pageArea=make("Frame",{Size=UDim2.new(1,0,0,384),BackgroundTransparency=1,ZIndex=3,LayoutOrder=2},main)
		make("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,navGap),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top},pageArea)
		pageParent=pageArea
		pageViewportParent=pageArea
		pageBarLayoutOrder=1
		pageViewportLayoutOrder=2
		pageBarSize=UDim2.fromOffset(navWidth,384)
	end

	local pageBar=make("ScrollingFrame",{Size=pageBarSize,CanvasSize=navIsLeft and UDim2.new(0,0,0,0) or UDim2.fromOffset(pageShellWidth,pageBarHeight),ScrollingDirection=navIsLeft and Enum.ScrollingDirection.Y or Enum.ScrollingDirection.X,ScrollBarThickness=navIsLeft and 0 or 2,ScrollBarImageColor3=colors.stroke,BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,ZIndex=4,LayoutOrder=pageBarLayoutOrder},pageParent)
	local pageShell=make("Frame",{Size=navIsLeft and UDim2.new(1,0,1,0) or UDim2.fromOffset(pageShellWidth,pageBarHeight),BackgroundColor3=colors.topbar or colors.bg,BackgroundTransparency=pageShellTransparency,BorderSizePixel=0,ClipsDescendants=true,ZIndex=5,ThemeRole="TOPBAR",CornerRole="Section"},pageBar)
	local pageShellScale=make("UIScale",{Scale=1},pageShell)
	make("UICorner",{CornerRadius=UDim.new(0,0)},pageShell)
	local pageShellStroke=make("UIStroke",{Color=colors.stroke,Thickness=1,Transparency=pageShellStrokeTransparency},pageShell)
	pageShellStroke:SetAttribute("BaseStrokeTransparency",pageShellStrokeTransparency)

	local pageSlider=make("Frame",{Size=tabSize(),Position=tabPosition(1),BackgroundColor3=colors.button or colors.card,BackgroundTransparency=pageSliderTransparency,BorderSizePixel=0,ZIndex=6,ThemeRole="BUTTON",CornerRole="Control"},pageShell)
	make("UICorner",{CornerRadius=UDim.new(0,0)},pageSlider)
	local pageSliderStroke=make("UIStroke",{Color=colors.stroke,Thickness=1,Transparency=pageSliderStrokeTransparency},pageSlider)
	pageSliderStroke:SetAttribute("BaseStrokeTransparency",pageSliderStrokeTransparency)
	pageSlider.Visible=pageSliderVisible

	local settingsTab=make("TextButton",{Size=tabSize(),Position=tabPosition(1),BackgroundTransparency=1,BorderSizePixel=0,Text=desc("Pages.Main","MAIN"),Font=controlFont,TextSize=11,TextColor3=colors.text,TextXAlignment=tabTextXAlignment,AutoButtonColor=false,ZIndex=7},pageShell)
	local mapsPageTab=make("TextButton",{Size=tabSize(),Position=tabPosition(2),BackgroundTransparency=1,BorderSizePixel=0,Text=desc("Pages.Maps","MAPS"),Font=controlFont,TextSize=11,TextColor3=colors.text,TextXAlignment=tabTextXAlignment,AutoButtonColor=false,ZIndex=7},pageShell)
	local serverPageTab=make("TextButton",{Size=tabSize(),Position=tabPosition(3),BackgroundTransparency=1,BorderSizePixel=0,Text=desc("Pages.Server","SERVER"),Font=controlFont,TextSize=11,TextColor3=colors.text,TextXAlignment=tabTextXAlignment,AutoButtonColor=false,ZIndex=7},pageShell)
	local uiSettingsTab=make("TextButton",{Size=tabSize(),Position=tabPosition(4),BackgroundTransparency=1,BorderSizePixel=0,Text=desc("Pages.Customize","CUSTOMIZE"),Font=controlFont,TextSize=11,TextColor3=colors.text,TextXAlignment=tabTextXAlignment,AutoButtonColor=false,ZIndex=7},pageShell)
	local futureTab=make("TextButton",{Size=tabSize(),Position=tabPosition(5),BackgroundTransparency=1,BorderSizePixel=0,Text=desc("Pages.Keybinds","KEYBINDS"),Font=controlFont,TextSize=11,TextColor3=colors.text,TextXAlignment=tabTextXAlignment,AutoButtonColor=false,ZIndex=7},pageShell)
	local settingsPageTab=make("TextButton",{Size=tabSize(),Position=tabPosition(6),BackgroundTransparency=1,BorderSizePixel=0,Text=desc("Pages.Settings","SETTINGS"),Font=controlFont,TextSize=11,TextColor3=colors.text,TextXAlignment=tabTextXAlignment,AutoButtonColor=false,ZIndex=7},pageShell)

	if navIsLeft then
		for _,tab in ipairs({settingsTab,mapsPageTab,serverPageTab,uiSettingsTab,futureTab,settingsPageTab}) do
			make("UIPadding",{Name="NavPadding",PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,8)},tab)
		end
	end

	local pageTabs={settingsTab,mapsPageTab,serverPageTab,uiSettingsTab,futureTab,settingsPageTab}

	local pageViewport=make("Frame",{Size=navIsLeft and UDim2.new(1,-(navWidth+navGap),1,0) or UDim2.new(1,0,0,384),BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,ZIndex=3,LayoutOrder=pageViewportLayoutOrder},pageViewportParent)
	local pageHost=make("ScrollingFrame",{Size=UDim2.new(1,0,1,0),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,ScrollBarThickness=4,BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,ZIndex=3},pageViewport)
	make("UIListLayout",{Padding=UDim.new(0,0),SortOrder=Enum.SortOrder.LayoutOrder},pageHost)
	make("UIPadding",{PaddingTop=UDim.new(0,2),PaddingLeft=UDim.new(0,3),PaddingRight=UDim.new(0,7),PaddingBottom=UDim.new(0,2)},pageHost)

	local settingsPage=make("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ClipsDescendants=true,Visible=true,ZIndex=3,LayoutOrder=1},pageHost)
	make("UIListLayout",{Padding=UDim.new(0,0),SortOrder=Enum.SortOrder.LayoutOrder},settingsPage)

	local mapPage=make("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ClipsDescendants=true,Visible=false,ZIndex=3,LayoutOrder=2},pageHost)
	make("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},mapPage)

	local serverPage=make("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ClipsDescendants=true,Visible=false,ZIndex=3,LayoutOrder=3},pageHost)
	make("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},serverPage)

	local uiSettingsPage=make("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ClipsDescendants=true,Visible=false,ZIndex=3,LayoutOrder=4},pageHost)
	make("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},uiSettingsPage)

	local futurePage=make("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ClipsDescendants=true,Visible=false,ZIndex=3,LayoutOrder=5},pageHost)
	make("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},futurePage)

	local actualSettingsPage=make("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ClipsDescendants=true,Visible=false,ZIndex=3,LayoutOrder=6},pageHost)
	make("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},actualSettingsPage)

	local activePageName="main"
	local activePageValue=makeFusionValue(activePageName)
	local resizeHandle=nil

	local mappedPages=nil
	if type(uiMap.GetPages)=="function" then
		local ok,result=pcall(uiMap.GetPages)
		if ok and type(result)=="table" then
			mappedPages=result
		end
	end

	if not mappedPages and type(uiMap.PageStructure)=="table" and type(uiMap.PageStructure.Tabs)=="table" then
		mappedPages=uiMap.PageStructure.Tabs
	end

	local pageSpecs=type(mappedPages)=="table" and mappedPages or type(uiMap.Pages)=="table" and uiMap.Pages or {
		{Id="main",DescriptionKey="Pages.Main",Fallback="MAIN"},
		{Id="maps",DescriptionKey="Pages.Maps",Fallback="MAPS"},
		{Id="server",DescriptionKey="Pages.Server",Fallback="SERVER"},
		{Id="customize",DescriptionKey="Pages.Customize",Fallback="CUSTOMIZE"},
		{Id="page2",DescriptionKey="Pages.Keybinds",Fallback="KEYBINDS"},
		{Id="settings",DescriptionKey="Pages.Settings",Fallback="SETTINGS"},
	}

	local function getPageIndex(name)
		for index,spec in ipairs(pageSpecs) do
			if spec.Id==name or spec.id==name then
				return index
			end
		end

		return 1
	end

	local function activePageIs(name)
		return makeFusionComputed(function(use)
			return use(activePageValue)==name
		end)
	end

	local function activeTabColor(name)
		return makeFusionComputed(function(use)
			use(profileVersionValue)
			return use(activePageValue)==name and colors.text or colors.muted
		end)
	end

	local function activeTabFont(name)
		return makeFusionComputed(function(use)
			use(profileVersionValue)
			return use(activePageValue)==name and titleFont or controlFont
		end)
	end

	local tabButtons={settingsTab,mapsPageTab,serverPageTab,uiSettingsTab,futureTab,settingsPageTab}
	local pageTabSpecs={}

	for index,spec in ipairs(pageSpecs) do
		local button=tabButtons[index]
		if button then
			pageTabSpecs[index]={
				button=button,
				page=spec.Id or spec.id,
				descriptionKey=spec.DescriptionKey or spec.descriptionKey,
				fallback=spec.Fallback or spec.fallback,
			}
		end
	end

	for _,spec in ipairs(pageTabSpecs) do
		local button=spec.button
		local pageName=spec.page
		local descriptionKey=spec.descriptionKey
		local fallback=spec.fallback

		hydrateFusion(button,{
			Text=makeFusionComputed(function(use)
				use(descriptionVersionValue)
				return text(desc(descriptionKey,fallback))
			end),
			TextColor3=activeTabColor(pageName),
			Font=activeTabFont(pageName),
		})
	end

	hydrateFusion(settingsPage,{Visible=activePageIs("main")})
	hydrateFusion(mapPage,{Visible=activePageIs("maps")})
	hydrateFusion(serverPage,{Visible=activePageIs("server")})
	hydrateFusion(uiSettingsPage,{Visible=activePageIs("customize")})
	hydrateFusion(futurePage,{Visible=activePageIs("page2")})
	hydrateFusion(actualSettingsPage,{Visible=activePageIs("settings")})

	local function setNavPadding(tab,enabled)
		local existing=tab:FindFirstChild("NavPadding")

		if enabled then
			if not existing then
				make("UIPadding",{Name="NavPadding",PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,8)},tab)
			end
		elseif existing then
			existing:Destroy()
		end
	end

	local function ensureNavParenting()
		pageShellWidth=navIsLeft and navWidth or ((pageTabWidth*6)+2)

		if navIsLeft then
			if not pageArea or not pageArea.Parent then
				pageArea=make("Frame",{Size=UDim2.new(1,0,0,384),BackgroundTransparency=1,ZIndex=3,LayoutOrder=2},main)
				make("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,navGap),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top},pageArea)
			end

			pageBar.Parent=pageArea
			pageBar.LayoutOrder=1
			pageViewport.Parent=pageArea
			pageViewport.LayoutOrder=2
		else
			pageBar.Parent=main
			pageBar.LayoutOrder=2
			pageViewport.Parent=main
			pageViewport.LayoutOrder=3

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
		for _,spec in ipairs(pageTabSpecs) do
			local active=activePageName==spec.page
			local button=spec.button
			button:SetAttribute("ThemeTextRole",active and "TEXT" or "MUTED")
			button.TextColor3=active and colors.text or colors.muted
			button.Font=active and titleFont or controlFont
		end
	end

	local function applyChromeProfile()
		rootStroke:SetAttribute("BaseStrokeTransparency",rootStrokeTransparency)
		rootStroke.Transparency=rootStrokeTransparency
		headerStroke:SetAttribute("BaseStrokeTransparency",headerStrokeTransparency)
		headerStroke.Transparency=headerStrokeTransparency
		pageShellStroke:SetAttribute("BaseStrokeTransparency",pageShellStrokeTransparency)
		pageShellStroke.Transparency=pageShellStrokeTransparency
		pageSliderStroke:SetAttribute("BaseStrokeTransparency",pageSliderStrokeTransparency)
		pageSliderStroke.Transparency=pageSliderStrokeTransparency
		pageSlider.Visible=pageSliderVisible
		if resizeHandle then
			resizeHandle.Visible=resizeHandleVisible
		end

		titleText.Position=UDim2.fromOffset(headerTitleX,headerTitleY)
		titleText.TextSize=headerTitleSize
		subtitleText.Position=UDim2.fromOffset(headerTitleX,headerSubtitleY)
		subtitleText.TextSize=headerSubtitleSize
		subtitleText.Visible=headerSubtitleVisible

		headerSearch.Visible=headerSearchVisible
		headerSearch.Size=UDim2.fromOffset(headerSearchWidth,headerSearchHeight)
		headerSearch.Position=UDim2.new(1,-headerSearchInset(),0.5,0)
		local searchText=headerSearch:FindFirstChildWhichIsA("TextLabel")
		if searchText then
			searchText.Text=headerSearchPlaceholder
			searchText.Font=textFont
		end
	end

	local refreshFooterResetButton=function() end

	local function setActivePage(name)
		activePageName=name or "main"
		if activePageValue then
			activePageValue:set(activePageName)
		end
		settingsPage.Visible=activePageName=="main"
		mapPage.Visible=activePageName=="maps"
		serverPage.Visible=activePageName=="server"
		uiSettingsPage.Visible=activePageName=="customize"
		futurePage.Visible=activePageName=="page2"
		actualSettingsPage.Visible=activePageName=="settings"

		local sliderPos=tabPosition(getPageIndex(activePageName))
		local sliderSize=tabSize()

		tweenService:Create(pageSlider,TweenInfo.new(0.12,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Position=sliderPos,Size=sliderSize}):Play()
		if not navIsLeft then
			local index=getPageIndex(activePageName)
			local viewportWidth=pageBar.AbsoluteSize.X
			local targetX=((index-0.5)*pageTabWidth)-(viewportWidth*0.5)
			local maxX=math.max(0,pageShellWidth-viewportWidth)
			tweenService:Create(pageBar,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
				CanvasPosition=Vector2.new(math.clamp(targetX,0,maxX),0),
			}):Play()
		end
		paintPageTabs()
		refreshFooterResetButton()
		if type(onPageActivated)=="function" then
			local activatedPage=activePageName
			task.defer(function()
				if activePageName==activatedPage then
					onPageActivated(activatedPage)
				end
			end)
		end
	end

	activate(settingsTab,function() setActivePage("main") end)
	activate(mapsPageTab,function() setActivePage("maps") end)
	activate(serverPageTab,function() setActivePage("server") end)
	activate(uiSettingsTab,function() setActivePage("customize") end)
	activate(futureTab,function() setActivePage("page2") end)
	activate(settingsPageTab,function() setActivePage("settings") end)

	local contentWrap=make("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ClipsDescendants=true,ZIndex=3,LayoutOrder=1},settingsPage)
	local contentLayout=make("UIListLayout",{Padding=UDim.new(0,columnGap),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Enum.FillDirection.Horizontal},contentWrap)

	local columnHalfGap=columnGap/2
	local leftCol=make("Frame",{Size=UDim2.new(0.5,-columnHalfGap,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ZIndex=3,LayoutOrder=1},contentWrap)
	make("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},leftCol)

	local rightCol=make("Frame",{Size=UDim2.new(0.5,-columnHalfGap,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ZIndex=3,LayoutOrder=2},contentWrap)
	make("UIListLayout",{Padding=UDim.new(0,pageGap),SortOrder=Enum.SortOrder.LayoutOrder},rightCol)

	updateResponsiveLayout=function()
		local vp=getViewportSize()
		local availableW=math.max(280,vp.X-16)
		local availableH=math.max(260,vp.Y-16)
		local maxW=math.min(windowState.MaxW,availableW)
		local maxH=math.min(windowState.MaxH,availableH)
		local minW=math.min(windowState.MinW,maxW)
		local minH=math.min(windowState.MinH,maxH)

		windowState.W=math.clamp(windowState.W,minW,maxW)
		windowState.H=math.clamp(windowState.H,minH,maxH)
		root.Size=UDim2.fromOffset(windowState.W,uiMinimized and minimizedRootH or windowState.H)
		root.Position=clampRootPosition(root.Position)

		local contentHeight=math.max(0,windowState.H-(rootPadding*2))
		local usedHeight=headerHeight+footerHeight+(mainGap*2)
		if not navIsLeft then
			usedHeight=usedHeight+pageBarHeight+mainGap
		end
		local pageHeight=math.max(150,contentHeight-usedHeight)
		if navIsLeft then
			pageArea.Size=UDim2.new(1,0,0,pageHeight)
			pageBar.Size=UDim2.fromOffset(navWidth,pageHeight)
			pageShell.Size=UDim2.new(1,0,1,0)
			pageViewport.Size=UDim2.new(1,-(navWidth+navGap),1,0)
			pageHost.Size=UDim2.new(1,0,1,0)
			pageShellScale.Scale=1
		else
			pageBar.Size=UDim2.new(1,0,0,pageBarHeight)
			pageBar.CanvasSize=UDim2.fromOffset(pageShellWidth,pageBarHeight)
			pageShell.Size=UDim2.fromOffset(pageShellWidth,pageBarHeight)
			pageViewport.Size=UDim2.new(1,0,0,pageHeight)
			pageHost.Size=UDim2.new(1,0,1,0)
			pageShellScale.Scale=1
		end

		local compact=windowState.W<720 or vp.X<1100
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

	local footer=make("Frame",{BackgroundColor3=colors.bg,BackgroundTransparency=0,Size=UDim2.new(1,0,0,footerHeight),ZIndex=8,LayoutOrder=4,ThemeRole="BG"},main)
	make("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,footerGap),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Right,VerticalAlignment=Enum.VerticalAlignment.Center},footer)

	function api.RefreshESPStatus() end
	function api.RefreshActionStatus() end

	local function makeFooterBtn(text,width)
		local b=make("TextButton",{Size=UDim2.fromOffset(width or 96,30),BackgroundColor3=colors.button or colors.bg,Text=string.upper(text),TextColor3=colors.text,Font=controlFont,TextSize=12,AutoButtonColor=false,Selectable=true,BorderSizePixel=0,ZIndex=6,ThemeRole="BUTTON"},footer)
		local wrap=wrapTextButton(b,colors.button or colors.bg,2)
		wrap:SetAttribute("ThemeRole","BUTTON")
		wrap:SetAttribute("CornerRole","Control")

		connect(b.MouseEnter,function()
			wrap.BackgroundColor3=colors.card
		end)

		connect(b.MouseLeave,function()
			wrap.BackgroundColor3=colors.button or colors.bg
		end)

		return b,wrap
	end

	local resetBtn,resetWrap=makeFooterBtn("Reset",94)
	local resetVisibleValue=makeFusionComputed(function(use)
		local page=use(activePageValue)
		return page~="settings" and page~="maps" and page~="server"
	end)

	hydrateFusion(resetBtn,{
		Visible=resetVisibleValue,
		Text=makeFusionComputed(function(use)
			use(descriptionVersionValue)
			return text("RESET")
		end),
	})
	hydrateFusion(resetWrap,{Visible=resetVisibleValue})

	refreshFooterResetButton=function()
		local showReset=activePageName~="settings" and activePageName~="maps" and activePageName~="server"
		resetBtn.Visible=showReset
		resetBtn.Text=text("RESET")
		resetWrap.Visible=showReset
	end

	refreshFooterResetButton()

	local toastHost=make("Frame",{
		Name="ToastHost",
		AnchorPoint=Vector2.new(1,1),
		Position=UDim2.new(1,-12,1,-12),
		Size=UDim2.new(1,-24,0,190),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		ZIndex=80,
	},screenGui)
	make("UISizeConstraint",{MaxSize=Vector2.new(320,190)},toastHost)
	make("UIListLayout",{
		FillDirection=Enum.FillDirection.Vertical,
		Padding=UDim.new(0,8),
		SortOrder=Enum.SortOrder.LayoutOrder,
		HorizontalAlignment=Enum.HorizontalAlignment.Right,
		VerticalAlignment=Enum.VerticalAlignment.Bottom,
	},toastHost)

	local toastOrder=0
	local function showToast(message,variant,duration)
		toastOrder=toastOrder+1
		variant=tostring(variant or "info"):lower()
		duration=tonumber(duration) or 2.2

		local color=colors.button or colors.bg
		local textColor=colors.text
		if variant=="error" or variant=="danger" then
			color=colors.red
			textColor=Color3.fromRGB(0,0,0)
		elseif variant=="success" then
			color=colors.green
			textColor=Color3.fromRGB(0,0,0)
		end

		local toast=make("Frame",{
			BackgroundColor3=color,
			BackgroundTransparency=0.04,
			BorderSizePixel=0,
			Size=UDim2.fromOffset(300,34),
			ZIndex=81,
			LayoutOrder=toastOrder,
			SkipThemeRole=true,
			CornerRole="Control",
		},toastHost)
		make("UICorner",{CornerRadius=UDim.new(0,0)},toast)
		local toastStroke=make("UIStroke",{Color=colors.stroke,Thickness=1,Transparency=0.35},toast)
		toastStroke:SetAttribute("BaseStrokeTransparency",0.35)
		make("TextLabel",{
			BackgroundTransparency=1,
			Position=UDim2.fromOffset(12,0),
			Size=UDim2.new(1,-24,1,0),
			Text=tostring(message or ""),
			Font=textFont,
			TextSize=12,
			TextColor3=textColor,
			SkipTextRole=true,
			TextXAlignment=Enum.TextXAlignment.Left,
			TextTruncate=Enum.TextTruncate.AtEnd,
			ZIndex=82,
			SkipThemeRole=true,
		},toast)

		toast.BackgroundTransparency=1
		toastStroke.Transparency=1
		for _,instance in ipairs(toast:GetDescendants()) do
			if instance:IsA("TextLabel") then
				instance.TextTransparency=1
			end
		end

		tweenService:Create(toast,TweenInfo.new(0.14,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency=0.04}):Play()
		tweenService:Create(toastStroke,TweenInfo.new(0.14,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Transparency=0.35}):Play()
		for _,instance in ipairs(toast:GetDescendants()) do
			if instance:IsA("TextLabel") then
				tweenService:Create(instance,TweenInfo.new(0.14,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency=0}):Play()
			end
		end

		task.delay(duration,function()
			if not toast or not toast.Parent then return end
			local fade=TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
			tweenService:Create(toast,fade,{BackgroundTransparency=1}):Play()
			tweenService:Create(toastStroke,fade,{Transparency=1}):Play()
			for _,instance in ipairs(toast:GetDescendants()) do
				if instance:IsA("TextLabel") then
					tweenService:Create(instance,fade,{TextTransparency=1}):Play()
				end
			end

			task.delay(0.2,function()
				if toast then toast:Destroy() end
			end)
		end)
	end

	resizeHandle=make("TextButton",{Name="ResizeHandle",AutoButtonColor=false,Size=UDim2.fromOffset(32,32),AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,6,1,-6),BackgroundColor3=getUIStrokeColor(),BackgroundTransparency=0.18,BorderSizePixel=0,Text="",Visible=resizeHandleVisible,ZIndex=30,SkipThemeRole=true},root)
	make("UICorner",{CornerRadius=UDim.new(0,0)},resizeHandle)
	local resizeStroke=make("UIStroke",{Color=colors.bg,Thickness=1,Transparency=0.25},resizeHandle)

	local resizeHovering=false
	local resizing=false

	local function paintResizeHandle(held)
		local targetSize=held and 38 or (resizeHovering and 35 or 32)
		local targetTransparency=held and 0.02 or (resizeHovering and 0.08 or 0.18)

		tweenService:Create(resizeHandle,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
			Size=UDim2.fromOffset(targetSize,targetSize),
			BackgroundColor3=getUIStrokeColor(),
			BackgroundTransparency=targetTransparency,
		}):Play()

		tweenService:Create(resizeStroke,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
			Color=held and (colors.text or Color3.new(1,1,1)) or (colors.bg or Color3.new()),
			Thickness=1,
			Transparency=(held or resizeHovering) and 0.08 or 0.25,
		}):Play()
	end

	connect(resizeHandle.MouseEnter,function()
		resizeHovering=true
		paintResizeHandle(resizing)
	end)

	connect(resizeHandle.MouseLeave,function()
		resizeHovering=false
		paintResizeHandle(resizing)
	end)

	do
		local startPointer=nil
		local startW,startH=0,0
		local startPos=nil
		local resizeMoveConn=nil
		local activeResizeInput=nil

		local function inputPosition(input)
			if input and input.UserInputType==Enum.UserInputType.Touch then
				return Vector2.new(input.Position.X,input.Position.Y)
			end

			return inputService:GetMouseLocation()
		end

		local function stopResize()
			resizing=false
			paintResizeHandle(false)
			safeDisconnect(resizeMoveConn)
			resizeMoveConn=nil
			activeResizeInput=nil
		end

		connect(resizeHandle.InputBegan,function(input)
			local inputType=input.UserInputType
			if inputType~=Enum.UserInputType.MouseButton1 and inputType~=Enum.UserInputType.Touch then return end

			resizing=true
			paintResizeHandle(true)
			activeResizeInput=input
			startPointer=inputPosition(input)
			startW,startH=windowState.W,windowState.H
			startPos=root.Position
			safeDisconnect(resizeMoveConn)

			resizeMoveConn=connect(inputService.InputChanged,function(changed)
				if not resizing or not isAlive() then return end
				local isMouseMove=activeResizeInput and activeResizeInput.UserInputType==Enum.UserInputType.MouseButton1 and changed.UserInputType==Enum.UserInputType.MouseMovement
				local isTouchMove=changed==activeResizeInput
				if not isMouseMove and not isTouchMove then return end

				local cur=inputPosition(isTouchMove and changed or activeResizeInput)
				local scale=uiScale.Scale
				if scale<=0 then scale=1 end

				local dx=(cur.X-startPointer.X)/scale
				local dy=(cur.Y-startPointer.Y)/scale

				windowState.W=math.clamp(startW-dx,windowState.MinW,windowState.MaxW)
				windowState.H=math.clamp(startH+dy,windowState.MinH,windowState.MaxH)

				local usedDx=startW-windowState.W
				root.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+(usedDx*0.5),startPos.Y.Scale,startPos.Y.Offset)

				if updateResponsiveLayout then
					updateResponsiveLayout()
				end
			end)
		end)

		connect(inputService.InputEnded,function(input)
			if input==activeResizeInput or (activeResizeInput and activeResizeInput.UserInputType==Enum.UserInputType.MouseButton1 and input.UserInputType==Enum.UserInputType.MouseButton1) then
				stopResize()
			end
		end)
	end

	local function setBodyVisible(visible)
		if pageArea then
			pageArea.Visible=visible
		end
		pageBar.Visible=visible
		pageViewport.Visible=visible
		pageHost.Visible=visible
		footer.Visible=visible
		resizeHandle.Visible=visible
	end

	local function minimize()
		if uiMinimized then return end
		uiMinimized=true
		if uiMinimizedValue then
			uiMinimizedValue:set(true)
		end
		miniBtn.Text="+"
		root.Visible=true
		setBodyVisible(true)

		local tween=tweenRootSize(UDim2.fromOffset(windowState.W,minimizedRootH),0.22)
		tween.Completed:Connect(function()
			if uiMinimized then
				setBodyVisible(false)
			end
		end)
	end

	local function restore()
		if not uiMinimized then return end
		uiMinimized=false
		if uiMinimizedValue then
			uiMinimizedValue:set(false)
		end
		miniBtn.Text="-"
		root.Visible=true
		setBodyVisible(true)
		tweenRootSize(UDim2.fromOffset(windowState.W,windowState.H),0.22)
	end

	activate(miniBtn,function()
		if uiMinimized then
			restore()
		else
			minimize()
		end
	end)

	local dragConn=nil

	do
		local dragging=false
		local startPointer,startPos
		local activeDragInput=nil
		local lastDragTween=0
		local lastDragTarget=nil

		local function stopDrag()
			dragging=false
			safeDisconnect(dragConn)
			dragConn=nil
			activeDragInput=nil
		end

		local function updateDrag()
			if not isAlive() then
				stopDrag()
				return
			end

			local cur=inputService:GetMouseLocation()
			if activeDragInput and activeDragInput.UserInputType==Enum.UserInputType.Touch then
				cur=Vector2.new(activeDragInput.Position.X,activeDragInput.Position.Y)
			end
			local scale=uiScale.Scale
			if scale<=0 then scale=1 end

			local delta=(cur-startPointer)/scale
			local target=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
			local now=os.clock()

			if not lastDragTarget or math.abs(target.X.Offset-lastDragTarget.X.Offset)>1 or math.abs(target.Y.Offset-lastDragTarget.Y.Offset)>1 then
				if now-lastDragTween>=0.025 then
					lastDragTween=now
					lastDragTarget=target
					tweenRootPosition(target,0.075)
				end
			end
		end

		connect(header.InputBegan,function(i)
			if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
				dragging=true
				activeDragInput=i
				startPointer=i.UserInputType==Enum.UserInputType.Touch and Vector2.new(i.Position.X,i.Position.Y) or inputService:GetMouseLocation()
				startPos=root.Position
				lastDragTween=0
				lastDragTarget=nil

				if rootPositionTween then
					rootPositionTween:Cancel()
					rootPositionTween=nil
				end

				safeDisconnect(dragConn)
				dragConn=connect(runService.RenderStepped,updateDrag)
			end
		end)

		connect(inputService.InputEnded,function(i)
			if dragging and (i==activeDragInput or (activeDragInput and activeDragInput.UserInputType==Enum.UserInputType.MouseButton1 and i.UserInputType==Enum.UserInputType.MouseButton1)) then
				stopDrag()
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

	function api.resetGui(animate)
		local rootHeight=(root and root.AbsoluteSize and root.AbsoluteSize.Y) or windowState.H or 540
		local defaultPosition=clampRootPosition(UDim2.new(0.5,0,0.5,-math.floor(rootHeight/2)))
		if animate==false then
			if rootPositionTween then
				rootPositionTween:Cancel()
				rootPositionTween=nil
			end
			root.Position=defaultPosition
		else
			tweenRootPosition(defaultPosition,0.18)
		end
		return defaultPosition
	end

	function api.RefreshTheme()
		pageShell.BackgroundTransparency=pageShellTransparency
		pageSlider.BackgroundTransparency=pageSliderTransparency
		applyChromeProfile()
		paintPageTabs()
		paintResizeHandle(resizing)
		bumpFusionValue(profileVersionValue)
	end

	function api.ApplyProfile(profile)
		loadProfile(profile or currentProfile())
		loadLayoutNumbers()

		windowState.MinW=layoutNumber(windowProfile,"MinW",windowState.MinW or 560)
		windowState.MinH=layoutNumber(windowProfile,"MinH",windowState.MinH or 360)
		windowState.MaxW=layoutNumber(windowProfile,"MaxW",windowState.MaxW or 1220)
		windowState.MaxH=layoutNumber(windowProfile,"MaxH",windowState.MaxH or 820)
		windowState.W=math.clamp(windowState.W,windowState.MinW,windowState.MaxW)
		windowState.H=math.clamp(windowState.H,windowState.MinH,windowState.MaxH)

		columnHalfGap=columnGap/2
		rootPad.PaddingTop=UDim.new(0,rootPadding)
		rootPad.PaddingLeft=UDim.new(0,rootPadding)
		rootPad.PaddingRight=UDim.new(0,rootPadding)
		rootPad.PaddingBottom=UDim.new(0,rootPadding)
		mainLayout.Padding=UDim.new(0,mainGap)
		header.Size=UDim2.new(1,0,0,headerHeight)
		footer.Size=UDim2.new(1,0,0,footerHeight)
		miniWrap.Size=UDim2.fromOffset(topButtonSize,topButtonSize)
		miniWrap.Position=UDim2.new(1,topButtonX(2),0.5,-topButtonSize/2)
		miniBtn.Size=UDim2.new(1,0,1,0)
		miniBtn.Position=UDim2.fromOffset(0,0)
		closeWrap.Size=UDim2.fromOffset(topButtonSize,topButtonSize)
		closeWrap.Position=UDim2.new(1,topButtonX(1),0.5,-topButtonSize/2)
		closeBtn.Size=UDim2.new(1,0,1,0)
		closeBtn.Position=UDim2.fromOffset(0,0)
		titleText.Font=titleFont
		subtitleText.Font=textFont
		pageShell.BackgroundTransparency=pageShellTransparency
		pageSlider.BackgroundTransparency=pageSliderTransparency
		applyChromeProfile()

		ensureNavParenting()
		applyTabGeometry()
		updateResponsiveLayout()
		paintPageTabs()
		bumpFusionValue(profileVersionValue)
	end

	function api.RefreshText(newDescription)
		description=newDescription or description
		bumpFusionValue(descriptionVersionValue)
		titleText.Text=text(desc("Main.Title","untitled gui"))
		subtitleText.Text=text(desc("Main.Description",getModeLabel().." loaded"))
		for _,spec in ipairs(pageTabSpecs) do
			spec.button.Text=text(desc(spec.descriptionKey,spec.fallback))
		end
		paintPageTabs()
		refreshFooterResetButton()
	end

	function api.Destroy()
		safeDisconnect(dragConn)
		dragConn=nil
		cleanupAll()
	end

	api.root=root
	api.fusionScope=fusionScope
	api.activePageValue=activePageValue
	api.uiMinimizedValue=uiMinimizedValue
	api.uiScale=uiScale
	api.main=main
	api.header=header
	api.subtitleText=subtitleText
	api.modeSubtitle=subtitleText
	api.closeBtn=closeBtn
	api.resetBtn=resetBtn
	api.toastHost=toastHost
	api.ShowToast=showToast
	api.pageBar=pageBar
	api.pageViewport=pageViewport
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

return mainFrame
