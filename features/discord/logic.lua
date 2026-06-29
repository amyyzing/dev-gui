-- loads, copies, and opens the community invite.

local Discord={}

function Discord.new(app,page)
	local New=app.New
	local THEME=app.THEME
	local makeSection=app.makeSection
	local wrapTextButton=app.wrapTextButton

	local api={}
	local alive=true
	local inviteLink=nil
	local linkButton=nil
	local statusLabel=nil
	local linkWrap=nil
	local connections={}

	local function connect(signal,fn)
		local connection=signal:Connect(fn)
		table.insert(connections,connection)
		return connection
	end

	local function getClipboardSetter()
		if type(setclipboard)=="function" then return setclipboard end
		if type(toclipboard)=="function" then return toclipboard end
		if typeof(Clipboard)=="table" and type(Clipboard.set)=="function" then return Clipboard.set end
		return nil
	end

	local function setStatus(text,color)
		if statusLabel then
			statusLabel.Text=text or ""
			statusLabel.TextColor3=color or THEME.MUTED
		end
	end

	local function paint()
		if not linkButton then return end

		if inviteLink and inviteLink~="" then
			linkButton.Text=inviteLink
			linkButton.TextColor3=THEME.TEXT
			if linkWrap then linkWrap.BackgroundColor3=THEME.BG end
			setStatus("click to copy",THEME.MUTED)
		else
			linkButton.Text="no invite link set"
			linkButton.TextColor3=THEME.MUTED
			if linkWrap then linkWrap.BackgroundColor3=THEME.BG end
			setStatus("no invite yet",THEME.MUTED)
		end
	end

	local function copyInvite()
		if not inviteLink or inviteLink=="" then
			setStatus("no invite yet",THEME.RED)
			return
		end

		local setter=getClipboardSetter()
		if not setter then
			setStatus("clipboard not here",THEME.RED)
			return
		end

		local ok,err=pcall(setter,inviteLink)
		if ok then
			setStatus("copied",THEME.GREEN)
		else
			setStatus("copy failed: "..tostring(err),THEME.RED)
		end
	end

	function api.Refresh()
		if not(app.BOT_API and app.BOT_API.Post) then
			paint()
			return
		end

		local ok,result=pcall(function()
			return app.BOT_API.Post("/invite-link/get",{})
		end)

		if ok and result and result.ok then
			inviteLink=result.inviteLink
		else
			setStatus("invite failed",THEME.RED)
		end

		paint()
	end

	function api.Destroy()
		alive=false
		for _,connection in ipairs(connections) do
			pcall(function()
				connection:Disconnect()
			end)
		end
		table.clear(connections)
	end

	local section=makeSection(page,3,"Discord","Community invite")

	linkButton=New("TextButton",{
		BackgroundColor3=THEME.BG,
		BorderSizePixel=0,
		Size=UDim2.new(1,-10,0,30),
		Position=UDim2.fromOffset(5,0),
		Text="loading invite...",
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=THEME.MUTED,
		SkipTextRole=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextTruncate=Enum.TextTruncate.AtEnd,
		AutoButtonColor=false,
		Selectable=true,
		ZIndex=6,
	},section)

	linkWrap=wrapTextButton(linkButton,THEME.BG,2)
	linkButton.Position=UDim2.fromOffset(10,0)
	linkButton.Size=UDim2.new(1,-20,1,0)

	connect(linkButton.MouseEnter,function()
		if linkWrap then linkWrap.BackgroundColor3=THEME.CARD end
		if inviteLink and inviteLink~="" then
			setStatus("copy",THEME.GREEN)
		end
	end)

	connect(linkButton.MouseLeave,function()
		if linkWrap then linkWrap.BackgroundColor3=THEME.BG end
		if statusLabel and statusLabel.Text=="copy" then
			paint()
		end
	end)

	connect(linkButton.Activated,copyInvite)

	statusLabel=New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,18),
		Text="getting invite...",
		Font=Enum.Font.Gotham,
		TextSize=11,
		TextColor3=THEME.MUTED,
		SkipTextRole=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},section)

	api.Refresh()

	task.spawn(function()
		while alive do
			task.wait(20)
			if alive then
				api.Refresh()
			end
		end
	end)

	return api
end

return Discord
