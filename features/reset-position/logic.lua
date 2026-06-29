-- logic half for this feature. avoid starting loops unless the feature is enabled.

local ResetPosition={}

function ResetPosition.new(ctx,page)
	local New=ctx.New
	local THEME=ctx.THEME
	local makeSection=ctx.makeSection
	local wrapTextButton=ctx.wrapTextButton

	local api={}
	local connections={}
	local statusLabel=nil
	local button=nil
	local buttonWrap=nil

	local function connect(signal,fn)
		local conn=signal:Connect(fn)
		table.insert(connections,conn)
		return conn
	end

	local function setStatus(text,color)
		if statusLabel then
			statusLabel.Text=text or ""
			statusLabel.TextColor3=color or THEME.MUTED
		end
	end

	local function resetPosition()
		local ok=false

		if ctx.MainFrame and type(ctx.MainFrame.ResetPosition)=="function" then
			ok=pcall(ctx.MainFrame.ResetPosition,true)
		elseif ctx.root then
			ok=pcall(function()
				local height=(ctx.root.AbsoluteSize and ctx.root.AbsoluteSize.Y) or 540
				ctx.root.Position=UDim2.new(0.5,0,0.5,-math.floor(height/2))
			end)
		end

		if ok then
			setStatus("position reset",THEME.GREEN)
			if ctx.MainFrame and type(ctx.MainFrame.ShowToast)=="function" then
				ctx.MainFrame.ShowToast("GUI position reset.", "success", 1.6)
			end
			if type(ctx.scheduleSave)=="function" then
				ctx.scheduleSave()
			end
		else
			setStatus("reset failed",THEME.RED)
		end
	end

	function api.Refresh()
		setStatus("",THEME.MUTED)
	end

	function api.Destroy()
		for _,conn in ipairs(connections) do
			pcall(function()
				conn:Disconnect()
			end)
		end
		table.clear(connections)
	end

	local section=makeSection(page,2,"GUI Position","Move the panel back to the default spot")
	local function buttonBaseColor()
		return THEME.BUTTON or THEME.BG
	end

	local function buttonHoverColor()
		local base=buttonBaseColor()
		local lum=(base.R*0.2126)+(base.G*0.7152)+(base.B*0.0722)
		local toward=lum<0.55 and Color3.new(1,1,1) or Color3.new(0,0,0)
		return base:Lerp(toward,0.08)
	end

	local normalBg=buttonBaseColor()

	button=New("TextButton",{
		BackgroundColor3=normalBg,
		BorderSizePixel=0,
		Size=UDim2.new(1,-20,0,30),
		Position=UDim2.fromOffset(10,0),
		Text="reset position",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		AutoButtonColor=false,
		Selectable=true,
		ZIndex=6,
	},section)

	buttonWrap=wrapTextButton(button,normalBg,2)
	buttonWrap.BackgroundColor3=normalBg
	buttonWrap:SetAttribute("ThemeRole","BUTTON")
	buttonWrap:SetAttribute("CornerRole","Control")
	button.Size=UDim2.new(1,0,1,0)
	button.Position=UDim2.fromOffset(0,0)

	connect(button.MouseEnter,function()
		buttonWrap.BackgroundColor3=buttonHoverColor()
	end)

	connect(button.MouseLeave,function()
		buttonWrap.BackgroundColor3=buttonBaseColor()
	end)

	connect(button.Activated,resetPosition)

	statusLabel=New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,18),
		Text="",
		Font=Enum.Font.Gotham,
		TextSize=11,
		TextColor3=THEME.MUTED,
		SkipTextRole=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},section)

	return api
end

return ResetPosition
