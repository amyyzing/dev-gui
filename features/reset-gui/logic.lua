local resetGui={}

function resetGui.new(app,page)
	local make=app.New or app.make
	local colors=app.colors
	local makeSection=app.makeSection
	local wrapTextButton=app.wrapTextButton

	local api={}
	local connections={}
	local statusLabel=nil
	local button=nil
	local buttonWrap=nil

	local function connect(signal,fn)
		local connection=signal:Connect(fn)
		table.insert(connections,connection)
		return connection
	end

	local function setStatus(text,color)
		if statusLabel then
			statusLabel.Text=text or ""
			statusLabel.TextColor3=color or colors.muted
		end
	end

	local function resetGui()
		local ok=false

		if app.mainFrame and type(app.mainFrame.resetGui)=="function" then
			ok=pcall(app.mainFrame.resetGui,true)
		elseif app.root then
			ok=pcall(function()
				local height=(app.root.AbsoluteSize and app.root.AbsoluteSize.Y) or 540
				app.root.Position=UDim2.new(0.5,0,0.5,-math.floor(height/2))
			end)
		end

		if ok then
			setStatus("position reset",colors.green)
			if app.mainFrame and type(app.mainFrame.ShowToast)=="function" then
				app.mainFrame.ShowToast("GUI position reset.", "success", 1.6)
			end
			if type(app.scheduleSave)=="function" then
				app.scheduleSave()
			end
		else
			setStatus("reset failed",colors.red)
		end
	end

	function api.Refresh()
		setStatus("",colors.muted)
	end

	function api.Destroy()
		for _,connection in ipairs(connections) do
			pcall(function()
				connection:Disconnect()
			end)
		end
		table.clear(connections)
	end

	local section=makeSection(page,2,"GUI Position","Move the panel back to the default spot")
	local function buttonBaseColor()
		return colors.button or colors.bg
	end

	local function buttonHoverColor()
		local base=buttonBaseColor()
		local lum=(base.R*0.2126)+(base.G*0.7152)+(base.B*0.0722)
		local toward=lum<0.55 and Color3.new(1,1,1) or Color3.new(0,0,0)
		return base:Lerp(toward,0.08)
	end

	local normalBg=buttonBaseColor()

	button=make("TextButton",{
		BackgroundColor3=normalBg,
		BorderSizePixel=0,
		Size=UDim2.new(1,-20,0,30),
		Position=UDim2.fromOffset(10,0),
		Text="reset position",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=colors.text,
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

	connect(button.Activated,resetGui)

	statusLabel=make("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,18),
		Text="",
		Font=Enum.Font.Gotham,
		TextSize=11,
		TextColor3=colors.muted,
		SkipTextRole=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},section)

	return api
end

return resetGui
