local Hitbox={}

function Hitbox.new(ctx,parent)
	local New=ctx.New
	local THEME=ctx.THEME
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local fmtNumber=ctx.fmtNumber
	local TweenService=game:GetService("TweenService")
	local state=ctx.State
	local api={}
	local toggleWrap=nil
	local tKnob=nil
	local boxX=nil
	local boxY=nil
	local boxZ=nil
	local transparencySlider=nil

	local function changed()
		if ctx.onChanged then pcall(ctx.onChanged,state) end
	end

	local function paintToggle()
		if not toggleWrap or not tKnob then return end
		local ti=TweenInfo.new(0.12,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
		local bg=state.hitboxOn and THEME.GREEN or THEME.CARD
		local pos=state.hitboxOn and UDim2.new(1,-22,0,2) or UDim2.fromOffset(2,2)
		TweenService:Create(toggleWrap,ti,{BackgroundColor3=bg}):Play()
		TweenService:Create(tKnob,ti,{Position=pos,BackgroundColor3=THEME.TEXT}):Play()
	end

	function api.SetHitboxLock(value)
		state.hitboxOn=value and true or false
		paintToggle()
		changed()
	end

	function api.Refresh()
		if boxX then boxX.Text="X: "..fmtNumber(state.sizeX,2) end
		if boxY then boxY.Text="Y: "..fmtNumber(state.sizeY,2) end
		if boxZ then boxZ.Text="Z: "..fmtNumber(state.sizeZ,2) end
		if transparencySlider then transparencySlider.set(state.targetTransparency) end
		paintToggle()
	end

	function api.Reset()
		state.hitboxOn=false
		state.sizeX=2.52
		state.sizeY=5.4
		state.sizeZ=1.41
		state.targetTransparency=0.7
		api.Refresh()
		changed()
	end

	local section=makeSection(parent,1,"Hitbox","")

	local hitboxToggleRow=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,30),ZIndex=5},section)
	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,-76,1,0),Text="Hitbox Toggle",Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},hitboxToggleRow)

	toggleWrap=New("Frame",{Size=UDim2.fromOffset(58,24),Position=UDim2.new(1,-58,0.5,-12),BackgroundColor3=THEME.CARD,BorderSizePixel=0,ZIndex=6},hitboxToggleRow)
	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},toggleWrap)

	tKnob=New("Frame",{Size=UDim2.fromOffset(20,20),Position=UDim2.fromOffset(2,2),BackgroundColor3=THEME.TEXT,BorderSizePixel=0,ZIndex=7},toggleWrap)
	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},tKnob)

	toggleWrap.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 then
			api.SetHitboxLock(not state.hitboxOn)
		end
	end)

	tKnob.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 then
			api.SetHitboxLock(not state.hitboxOn)
		end
	end)

	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text="HITBOX SIZE",Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)

	local sizeReadout=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,24),ZIndex=5},section)
	New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,0),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Left},sizeReadout)

	local function makeReadout(prefix)
		return New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(0.333,0,1,0),Text=prefix,Font=Enum.Font.Gotham,TextSize=13,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=6},sizeReadout)
	end

	boxX=makeReadout("X: "..fmtNumber(state.sizeX,2))
	boxY=makeReadout("Y: "..fmtNumber(state.sizeY,2))
	boxZ=makeReadout("Z: "..fmtNumber(state.sizeZ,2))

	New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text="TRANSPARENCY",Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},section)

	transparencySlider=buildSlider(section,"A",0,1,state.targetTransparency,2,function(v)
		state.targetTransparency=v
		changed()
	end)

	api.Refresh()
	return api
end

return Hitbox
