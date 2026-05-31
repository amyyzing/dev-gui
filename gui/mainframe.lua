local MainFrame={}

function MainFrame.new(ctx)
	local New=ctx.New
	local THEME=ctx.THEME
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
	local getUIStrokeColor=ctx.getUIStrokeColor or function() return THEME.STROKE end
	local getUIStrokeGradientColor=ctx.getUIStrokeGradientColor or function() return THEME.GREEN or THEME.ACC or THEME.TEXT end

	local api={}
	local MINIMIZED_ROOT_H=68

	local root=New("Frame",{AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,80),Size=UDim2.fromOffset(UI_WINDOW.W,UI_WINDOW.H),AutomaticSize=Enum.AutomaticSize.None,ClipsDescendants=true,BackgroundColor3=THEME.BG,BorderSizePixel=0,ZIndex=2,Visible=true},SG)
	local uiMinimized=false
	local rootSizeTween=nil
	local rootPositionTween=nil

	local function mouseInsideRoot()
		if not root or not root.Parent or not root.Visible then
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

	New("UICorner",{CornerRadius=UDim.new(0,8)},root)
	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.15},root)
	New("UIPadding",{PaddingTop=UDim.new(0,8),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingBottom=UDim.new(0,8)},root)

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
	New("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},main)

	attachHover=attachHover or function() end

	local header=New("Frame",{Size=UDim2.new(1,0,0,52),BackgroundColor3=THEME.BG,BorderSizePixel=0,ZIndex=4,LayoutOrder=1},main)
	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.25},header)
	New("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,7),Size=UDim2.new(1,-180,0,18),Text="untitled gui",Font=Enum.Font.Gotham,TextSize=16,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=5},header)

	local modeSubtitle=New("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,26),Size=UDim2.new(1,-180,0,14),Text=getModeLabel().." loaded",Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=5},header)

	local function makeTopButton(text,xOffset)
		local b=New("TextButton",{Size=UDim2.fromOffset(28,28),Position=UDim2.new(1,xOffset,0.5,-14),BackgroundColor3=THEME.BG,BorderSizePixel=0,Text=text,Font=Enum.Font.Gotham,TextSize=17,TextColor3=THEME.TEXT,AutoButtonColor=false,ZIndex=6},header)
		local wrap=wrapTextButton(b,THEME.BG,2)

		b.MouseEnter:Connect(function()
			wrap.BackgroundColor3=Color3.fromRGB(43,43,43)
		end)

		b.MouseLeave:Connect(function()
			wrap.BackgroundColor3=THEME.PANEL
		end)

		return b
	end

	local miniBtn=makeTopButton("-", -72)
	local closeBtn=makeTopButton("x", -38)

	local pageBar=New("Frame",{Size=UDim2.new(1,0,0,30),BackgroundTransparency=1,ZIndex=4,LayoutOrder=2},main)
	local pageShell=New("Frame",{Size=UDim2.fromOffset(644,30),BackgroundColor3=THEME.BG,BorderSizePixel=0,ZIndex=5},pageBar)
	local pageShellScale=New("UIScale",{Scale=1},pageShell)
	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.35},pageShell)

	local pageSlider=New("Frame",{Size=UDim2.fromOffset(106,28),Position=UDim2.fromOffset(1,1),BackgroundColor3=THEME.CARD,BorderSizePixel=0,ZIndex=6},pageShell)
	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0.45},pageSlider)

	local settingsTab=New("TextButton",{Size=UDim2.fromOffset(106,28),Position=UDim2.fromOffset(1,1),BackgroundTransparency=1,BorderSizePixel=0,Text="MAIN",Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.TEXT,AutoButtonColor=false,ZIndex=7},pageShell)
	local futureTab=New("TextButton",{Size=UDim2.fromOffset(204,28),Position=UDim2.fromOffset(107,1),BackgroundTransparency=1,BorderSizePixel=0,Text="KEYBINDS & PRESETS",Font=Enum.Font.Gotham,TextSize=10,TextColor3=THEME.TEXT,AutoButtonColor=false,ZIndex=7},pageShell)
	local uiSettingsTab=New("TextButton",{Size=UDim2.fromOffset(112,28),Position=UDim2.fromOffset(311,1),BackgroundTransparency=1,BorderSizePixel=0,Text="CUSTOMIZE",Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.TEXT,AutoButtonColor=false,ZIndex=7},pageShell)
	local mapsPageTab=New("TextButton",{Size=UDim2.fromOffset(88,28),Position=UDim2.fromOffset(423,1),BackgroundTransparency=1,BorderSizePixel=0,Text="MAPS",Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.TEXT,AutoButtonColor=false,ZIndex=7},pageShell)
	local settingsPageTab=New("TextButton",{Size=UDim2.fromOffset(132,28),Position=UDim2.fromOffset(511,1),BackgroundTransparency=1,BorderSizePixel=0,Text="SETTINGS",Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.TEXT,AutoButtonColor=false,ZIndex=7},pageShell)

	local pageHost=New("ScrollingFrame",{Size=UDim2.new(1,0,0,384),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,ScrollBarThickness=4,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=3,LayoutOrder=3},main)
	New("UIListLayout",{Padding=UDim.new(0,0),SortOrder=Enum.SortOrder.LayoutOrder},pageHost)
	New("UIPadding",{PaddingTop=UDim.new(0,2),PaddingLeft=UDim.new(0,3),PaddingRight=UDim.new(0,7),PaddingBottom=UDim.new(0,2)},pageHost)

	local settingsPage=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=true,ZIndex=3,LayoutOrder=1},pageHost)
	New("UIListLayout",{Padding=UDim.new(0,0),SortOrder=Enum.SortOrder.LayoutOrder},settingsPage)

	local futurePage=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false,ZIndex=3,LayoutOrder=2},pageHost)
	New("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},futurePage)

	local uiSettingsPage=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false,ZIndex=3,LayoutOrder=3},pageHost)
	New("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},uiSettingsPage)

	local mapPage=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false,ZIndex=3,LayoutOrder=4},pageHost)
	New("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},mapPage)

	local actualSettingsPage=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false,ZIndex=3,LayoutOrder=5},pageHost)
	New("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},actualSettingsPage)

	local activePageName="main"

	local function paintPageTabs()
		settingsTab.TextColor3=activePageName=="main" and THEME.TEXT or THEME.MUTED
		futureTab.TextColor3=activePageName=="page2" and THEME.TEXT or THEME.MUTED
		uiSettingsTab.TextColor3=activePageName=="customize" and THEME.TEXT or THEME.MUTED
		mapsPageTab.TextColor3=activePageName=="maps" and THEME.TEXT or THEME.MUTED
		settingsPageTab.TextColor3=activePageName=="settings" and THEME.TEXT or THEME.MUTED
	end

	local refreshFooterResetButton=function() end

	local function setActivePage(name)
		activePageName=name or "main"
		settingsPage.Visible=activePageName=="main"
		futurePage.Visible=activePageName=="page2"
		uiSettingsPage.Visible=activePageName=="customize"
		mapPage.Visible=activePageName=="maps"
		actualSettingsPage.Visible=activePageName=="settings"

		local sliderPos=UDim2.fromOffset(1,1)
		local sliderSize=UDim2.fromOffset(106,28)

		if activePageName=="page2" then
			sliderPos=UDim2.fromOffset(107,1)
			sliderSize=UDim2.fromOffset(204,28)
		elseif activePageName=="customize" then
			sliderPos=UDim2.fromOffset(311,1)
			sliderSize=UDim2.fromOffset(112,28)
		elseif activePageName=="maps" then
			sliderPos=UDim2.fromOffset(423,1)
			sliderSize=UDim2.fromOffset(88,28)
		elseif activePageName=="settings" then
			sliderPos=UDim2.fromOffset(511,1)
			sliderSize=UDim2.fromOffset(132,28)
		end

		TweenService:Create(pageSlider,TweenInfo.new(0.12,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Position=sliderPos,Size=sliderSize}):Play()
		paintPageTabs()
		refreshFooterResetButton()
	end

	settingsTab.MouseButton1Click:Connect(function() setActivePage("main") end)
	futureTab.MouseButton1Click:Connect(function() setActivePage("page2") end)
	uiSettingsTab.MouseButton1Click:Connect(function() setActivePage("customize") end)
	mapsPageTab.MouseButton1Click:Connect(function() setActivePage("maps") end)
	settingsPageTab.MouseButton1Click:Connect(function() setActivePage("settings") end)

	settingsTab.MouseEnter:Connect(paintPageTabs)
	settingsTab.MouseLeave:Connect(paintPageTabs)
	futureTab.MouseEnter:Connect(paintPageTabs)
	futureTab.MouseLeave:Connect(paintPageTabs)
	uiSettingsTab.MouseEnter:Connect(paintPageTabs)
	uiSettingsTab.MouseLeave:Connect(paintPageTabs)
	mapsPageTab.MouseEnter:Connect(paintPageTabs)
	mapsPageTab.MouseLeave:Connect(paintPageTabs)
	settingsPageTab.MouseEnter:Connect(paintPageTabs)
	settingsPageTab.MouseLeave:Connect(paintPageTabs)

	local contentWrap=New("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ZIndex=3,LayoutOrder=1},settingsPage)
	local contentLayout=New("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Enum.FillDirection.Horizontal},contentWrap)

	local leftCol=New("Frame",{Size=UDim2.new(0.5,-4,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ZIndex=3,LayoutOrder=1},contentWrap)
	New("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},leftCol)

	local rightCol=New("Frame",{Size=UDim2.new(0.5,-4,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,ZIndex=3,LayoutOrder=2},contentWrap)
	New("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},rightCol)

	updateResponsiveLayout=function()
		local cam=workspace.CurrentCamera
		local vp=cam and cam.ViewportSize or Vector2.new(1920,1080)

		UI_WINDOW.W=math.clamp(UI_WINDOW.W,UI_WINDOW.MinW,math.min(UI_WINDOW.MaxW,math.max(560,vp.X-40)))
		UI_WINDOW.H=math.clamp(UI_WINDOW.H,UI_WINDOW.MinH,math.min(UI_WINDOW.MaxH,math.max(360,vp.Y-120)))
		root.Size=UDim2.fromOffset(UI_WINDOW.W,uiMinimized and MINIMIZED_ROOT_H or UI_WINDOW.H)

		local pageHeight=math.max(170,UI_WINDOW.H-156)
		pageHost.Size=UDim2.new(1,0,0,pageHeight)
		pageShellScale.Scale=math.min(1,math.max(0.82,(UI_WINDOW.W-16)/644))

		local compact=UI_WINDOW.W<720 or vp.X<1100
		if compact then
			contentLayout.FillDirection=Enum.FillDirection.Vertical
			leftCol.Size=UDim2.new(1,0,0,0)
			rightCol.Size=UDim2.new(1,0,0,0)
		else
			contentLayout.FillDirection=Enum.FillDirection.Horizontal
			leftCol.Size=UDim2.new(0.5,-4,0,0)
			rightCol.Size=UDim2.new(0.5,-4,0,0)
		end
	end

	updateResponsiveLayout()

	local footer=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,34),ZIndex=4,LayoutOrder=4},main)
	New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Right,VerticalAlignment=Enum.VerticalAlignment.Center},footer)

	function api.RefreshESPStatus() end
	function api.RefreshActionStatus() end

	local function makeFooterBtn(text,width)
		local b=New("TextButton",{Size=UDim2.fromOffset(width or 96,30),BackgroundColor3=THEME.BG,Text=string.upper(text),TextColor3=THEME.TEXT,Font=Enum.Font.Gotham,TextSize=12,AutoButtonColor=false,BorderSizePixel=0,ZIndex=6},footer)
		local wrap=wrapTextButton(b,THEME.BG,2)

		b.MouseEnter:Connect(function()
			wrap.BackgroundColor3=Color3.fromRGB(43,43,43)
		end)

		b.MouseLeave:Connect(function()
			wrap.BackgroundColor3=THEME.PANEL
		end)

		return b,wrap
	end

	local resetBtn,resetWrap=makeFooterBtn("Reset",94)

	refreshFooterResetButton=function()
		local showReset=activePageName~="settings" and activePageName~="maps"
		resetBtn.Visible=showReset
		resetBtn.Text="RESET"
		resetWrap.Visible=showReset
	end

	refreshFooterResetButton()

	local fab=New("TextButton",{Name="FAB",Visible=false,AutoButtonColor=false,Size=UDim2.fromOffset(42,42),AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-16,1,-16),BackgroundColor3=THEME.BG,BorderSizePixel=0,Text="[]",TextColor3=THEME.TEXT,Font=Enum.Font.Gotham,TextSize=16,ZIndex=20},SG)
	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},fab)
	attachHover(fab,THEME.BG,THEME.TEXT,THEME.TEXT,Color3.fromRGB(0,0,0))

	local resizeHandle=New("TextButton",{Name="ResizeHandle",AutoButtonColor=false,Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,7,1,-7),BackgroundColor3=getUIStrokeColor():Lerp(THEME.TEXT,0.22),BackgroundTransparency=0.02,BorderSizePixel=0,Text="",ZIndex=30},root)
	New("UICorner",{CornerRadius=UDim.new(1,0)},resizeHandle)
	local resizeStroke=New("UIStroke",{Color=getUIStrokeColor(),Thickness=1,Transparency=0.05},resizeHandle)
	local resizeGlow=New("UIGradient",{Rotation=45,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,getUIStrokeColor():Lerp(THEME.TEXT,0.45)),ColorSequenceKeypoint.new(1,getUIStrokeGradientColor():Lerp(THEME.TEXT,0.1))})},resizeHandle)

	local resizeHovering=false
	local resizing=false

	local function resizeColorSet(held)
		local stroke=getUIStrokeColor()
		local accent=getUIStrokeGradientColor()
		local base=stroke:Lerp(THEME.TEXT,0.22)

		if held then
			return accent:Lerp(THEME.TEXT,0.12),accent,ColorSequence.new({
				ColorSequenceKeypoint.new(0,THEME.TEXT),
				ColorSequenceKeypoint.new(0.5,accent:Lerp(THEME.TEXT,0.28)),
				ColorSequenceKeypoint.new(1,stroke:Lerp(accent,0.55)),
			})
		end

		if resizeHovering then
			return accent:Lerp(THEME.TEXT,0.2),stroke:Lerp(accent,0.65),ColorSequence.new({
				ColorSequenceKeypoint.new(0,stroke:Lerp(THEME.TEXT,0.5)),
				ColorSequenceKeypoint.new(0.45,accent:Lerp(THEME.TEXT,0.35)),
				ColorSequenceKeypoint.new(1,stroke:Lerp(accent,0.75)),
			})
		end

		return base,stroke,ColorSequence.new({
			ColorSequenceKeypoint.new(0,stroke:Lerp(THEME.TEXT,0.45)),
			ColorSequenceKeypoint.new(1,accent:Lerp(THEME.TEXT,0.1)),
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

		local tween=tweenRootSize(UDim2.fromOffset(UI_WINDOW.W,MINIMIZED_ROOT_H),0.22)
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
		paintResizeHandle(resizing)
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
	api.actualSettingsPage=actualSettingsPage
	api.leftCol=leftCol
	api.rightCol=rightCol
	api.footer=footer

	setActivePage("main")

	return api
end

return MainFrame
