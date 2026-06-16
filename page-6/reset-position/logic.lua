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
				ctx.root.Position=UDim2.new(0.5,0,0,80)
			end)
		end

		if ok then
			setStatus("GUI position reset.",THEME.GREEN)
			if ctx.MainFrame and type(ctx.MainFrame.ShowToast)=="function" then
				ctx.MainFrame.ShowToast("GUI position reset.", "success", 1.6)
			end
			if type(ctx.scheduleSave)=="function" then
				ctx.scheduleSave()
			end
		else
			setStatus("Could not reset GUI position.",THEME.RED)
		end
	end

	function api.Refresh()
		setStatus("Moves the panel back to its default position.",THEME.MUTED)
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
		Text="RESET GUI POSITION",
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
		Text="Moves the panel back to its default position.",
		Font=Enum.Font.Gotham,
		TextSize=11,
		TextColor3=THEME.MUTED,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},section)

	return api
end

return ResetPosition
