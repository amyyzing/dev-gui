local discord={}

function discord.new(app,page)
	local make=app.New
	local colors=app.colors
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
			statusLabel.TextColor3=color or colors.muted
		end
	end

	local function paint()
		if not linkButton then return end

		if inviteLink and inviteLink~="" then
			linkButton.Text=inviteLink
			linkButton.TextColor3=colors.text
			if linkWrap then linkWrap.BackgroundColor3=colors.bg end
			setStatus("click to copy",colors.muted)
		else
			linkButton.Text="no invite link set"
			linkButton.TextColor3=colors.muted
			if linkWrap then linkWrap.BackgroundColor3=colors.bg end
			setStatus("no invite yet",colors.muted)
		end
	end

	local function copyInvite()
		if not inviteLink or inviteLink=="" then
			setStatus("no invite yet",colors.red)
			return
		end

		local setter=getClipboardSetter()
		if not setter then
			setStatus("clipboard not here",colors.red)
			return
		end

		local ok,err=pcall(setter,inviteLink)
		if ok then
			setStatus("copied",colors.green)
		else
			setStatus("copy failed: "..tostring(err),colors.red)
		end
	end

	function api.Refresh()
		if not(app.botApi and app.botApi.Post) then
			paint()
			return
		end

		local ok,result=pcall(function()
			return app.botApi.Post("/invite-link/get",{})
		end)

		if ok and result and result.ok then
			inviteLink=result.inviteLink
		else
			setStatus("invite failed",colors.red)
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

	linkButton=make("TextButton",{
		BackgroundColor3=colors.bg,
		BorderSizePixel=0,
		Size=UDim2.new(1,-10,0,30),
		Position=UDim2.fromOffset(5,0),
		Text="loading invite...",
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextColor3=colors.muted,
		SkipTextRole=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextTruncate=Enum.TextTruncate.AtEnd,
		AutoButtonColor=false,
		Selectable=true,
		ZIndex=6,
	},section)

	linkWrap=wrapTextButton(linkButton,colors.bg,2)
	linkButton.Position=UDim2.fromOffset(10,0)
	linkButton.Size=UDim2.new(1,-20,1,0)

	connect(linkButton.MouseEnter,function()
		if linkWrap then linkWrap.BackgroundColor3=colors.card end
		if inviteLink and inviteLink~="" then
			setStatus("copy",colors.green)
		end
	end)

	connect(linkButton.MouseLeave,function()
		if linkWrap then linkWrap.BackgroundColor3=colors.bg end
		if statusLabel and statusLabel.Text=="copy" then
			paint()
		end
	end)

	connect(linkButton.Activated,copyInvite)

	statusLabel=make("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,18),
		Text="getting invite...",
		Font=Enum.Font.Gotham,
		TextSize=11,
		TextColor3=colors.muted,
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

return discord
