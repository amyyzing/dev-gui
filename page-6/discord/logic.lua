local Discord={}

function Discord.new(ctx,page)
	local New=ctx.New
	local THEME=ctx.THEME
	local makeSection=ctx.makeSection
	local wrapTextButton=ctx.wrapTextButton

	local api={}
	local alive=true
	local inviteLink=nil
	local linkButton=nil
	local statusLabel=nil
	local linkWrap=nil
	local connections={}

	local function connect(signal,fn)
		local conn=signal:Connect(fn)
		table.insert(connections,conn)
		return conn
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
			setStatus("Click the invite link to copy it.",THEME.MUTED)
		else
			linkButton.Text="No invite link set."
			linkButton.TextColor3=THEME.MUTED
			if linkWrap then linkWrap.BackgroundColor3=THEME.BG end
			setStatus("Use /invite-link create in Discord to set this.",THEME.MUTED)
		end
	end

	local function copyInvite()
		if not inviteLink or inviteLink=="" then
			setStatus("No Discord invite link has been set.",THEME.RED)
			return
		end

		local setter=getClipboardSetter()
		if not setter then
			setStatus("Clipboard is not available in this executor.",THEME.RED)
			return
		end

		local ok,err=pcall(setter,inviteLink)
		if ok then
			setStatus("Copied Discord invite link.",THEME.GREEN)
		else
			setStatus("Copy failed: "..tostring(err),THEME.RED)
		end
	end

	function api.Refresh()
		if not(ctx.BOT_API and ctx.BOT_API.Post) then
			paint()
			return
		end

		local ok,result=pcall(function()
			return ctx.BOT_API.Post("/invite-link/get",{})
		end)

		if ok and result and result.ok then
			inviteLink=result.inviteLink
		else
			setStatus("Could not fetch Discord invite link.",THEME.RED)
		end

		paint()
	end

	function api.Destroy()
		alive=false
		for _,conn in ipairs(connections) do
			pcall(function()
				conn:Disconnect()
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
		Text="Loading invite link...",
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=THEME.MUTED,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextTruncate=Enum.TextTruncate.AtEnd,
		AutoButtonColor=false,
		ZIndex=6,
	},section)

	linkWrap=wrapTextButton(linkButton,THEME.BG,2)
	linkButton.Position=UDim2.fromOffset(10,0)
	linkButton.Size=UDim2.new(1,-20,1,0)

	connect(linkButton.MouseEnter,function()
		if linkWrap then linkWrap.BackgroundColor3=THEME.CARD end
		if inviteLink and inviteLink~="" then
			setStatus("Click to Copy",THEME.GREEN)
		end
	end)

	connect(linkButton.MouseLeave,function()
		if linkWrap then linkWrap.BackgroundColor3=THEME.BG end
		if statusLabel and statusLabel.Text=="Click to Copy" then
			paint()
		end
	end)

	connect(linkButton.MouseButton1Click,copyInvite)

	statusLabel=New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,18),
		Text="Fetching invite link...",
		Font=Enum.Font.Gotham,
		TextSize=11,
		TextColor3=THEME.MUTED,
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
