local PlayerData={}

local function clearArray(t)
	for i=#t,1,-1 do
		table.remove(t,i)
	end
end

function PlayerData.new(ctx,page,deps)
	deps=deps or {}

	local New=ctx.New
	local THEME=ctx.THEME
	local SG=ctx.SG
	local makeSection=ctx.makeSection
	local wrapTextButton=ctx.wrapTextButton

	local api={}
	local statusLabel=nil
	local statusPill=nil
	local statusPillText=nil
	local busy=false
	local connections={}

	local function trackConnection(conn,bucket)
		if conn then
			table.insert(bucket or connections,conn)
		end

		return conn
	end

	local function disconnectConnections(bucket)
		for _,conn in ipairs(bucket) do
			pcall(function()
				conn:Disconnect()
			end)
		end

		table.clear(bucket)
	end

	local function setStatus(text,color)
		if statusLabel then
			statusLabel.Text=text or ""
			statusLabel.TextColor3=color or THEME.MUTED
		end

		if statusPill then
			statusPill.BackgroundColor3=(color==THEME.GREEN or color==THEME.RED) and color or THEME.BG
		end

		if statusPillText then
			statusPillText.Text=busy and "BUSY" or "READY"
			statusPillText.TextColor3=(color==THEME.GREEN or color==THEME.RED) and Color3.fromRGB(0,0,0) or THEME.MUTED
		end
	end

	local function modalButton(parent,text,x,danger,bucket)
		local normalBg=danger and THEME.RED or THEME.BG
		local hoverBg=danger and Color3.fromRGB(255,124,118) or THEME.CARD
		local leaveBg=danger and THEME.RED or THEME.PANEL
		local textColor=danger and Color3.fromRGB(0,0,0) or THEME.TEXT
		local btn=New("TextButton",{
			Position=UDim2.fromOffset(x,120),
			Size=UDim2.fromOffset(104,30),
			BackgroundColor3=normalBg,
			BorderSizePixel=0,
			Text=text,
			Font=Enum.Font.Gotham,
			TextSize=12,
			TextColor3=textColor,
			AutoButtonColor=false,
			ZIndex=102,
		},parent)

		local wrap=wrapTextButton(btn,normalBg,2)
		wrap.BackgroundColor3=normalBg
		if danger then
			wrap:SetAttribute("ThemeRole","RED")
		end

		trackConnection(btn.MouseEnter:Connect(function()
			wrap.BackgroundColor3=hoverBg
		end),bucket)

		trackConnection(btn.MouseLeave:Connect(function()
			wrap.BackgroundColor3=leaveBg
		end),bucket)

		return btn
	end

	local function showConfirmModal(titleText,bodyText,yesText,onYes,options)
		if ctx.showConfirmModal then
			ctx.showConfirmModal(titleText,bodyText,yesText,onYes,options)
			return
		end

		local modal=New("Frame",{
			BackgroundColor3=Color3.fromRGB(0,0,0),
			BackgroundTransparency=0.25,
			BorderSizePixel=0,
			Size=UDim2.new(1,0,1,0),
			ZIndex=100,
		},SG)
		local modalConnections={}
		local function closeModal()
			disconnectConnections(modalConnections)
			if modal and modal.Parent then
				modal:Destroy()
			end
		end

		local box=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.new(0.5,0,0.5,0),
			Size=UDim2.fromOffset(390,170),
			BackgroundColor3=THEME.BG,
			BorderSizePixel=0,
			ZIndex=101,
		},modal)

		New("UIStroke",{Color=THEME.STROKE,Thickness=2,Transparency=0},box)

		New("TextLabel",{
			BackgroundTransparency=1,
			Position=UDim2.fromOffset(16,14),
			Size=UDim2.new(1,-32,0,24),
			Text=titleText,
			Font=Enum.Font.GothamMedium,
			TextSize=14,
			TextColor3=THEME.TEXT,
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=102,
		},box)

		New("TextLabel",{
			BackgroundTransparency=1,
			Position=UDim2.fromOffset(16,48),
			Size=UDim2.new(1,-32,0,54),
			Text=bodyText,
			Font=Enum.Font.Gotham,
			TextSize=12,
			TextWrapped=true,
			TextColor3=THEME.MUTED,
			TextXAlignment=Enum.TextXAlignment.Left,
			TextYAlignment=Enum.TextYAlignment.Top,
			ZIndex=102,
		},box)

		local danger=options and options.danger==true
		local no=modalButton(box,"CANCEL",160,false,modalConnections)
		local yes=modalButton(box,yesText or"YES",274,danger,modalConnections)

		trackConnection(no.MouseButton1Click:Connect(closeModal),modalConnections)

		trackConnection(yes.MouseButton1Click:Connect(function()
			closeModal()
			if onYes then onYes() end
		end),modalConnections)
	end

	local function getPlayerId()
		if ctx.playerId then return tostring(ctx.playerId) end
		if ctx.me and ctx.me.UserId then return tostring(ctx.me.UserId) end

		local lp=game:GetService("Players").LocalPlayer
		return lp and tostring(lp.UserId) or ""
	end

	local function wipeLocal()
		if ctx.OWNED_PRESETS then
			clearArray(ctx.OWNED_PRESETS)
		end

		if ctx.expandedOwned then
			for k in pairs(ctx.expandedOwned) do
				ctx.expandedOwned[k]=nil
			end
		end

		if deps.Workspace and deps.Workspace.SetEnabled then
			deps.Workspace.SetEnabled(false)
		elseif ctx.WorkspaceAPI and ctx.WorkspaceAPI.SetEnabled then
			ctx.WorkspaceAPI.SetEnabled(false)
		end

		if deps.MapCleaner and deps.MapCleaner.SetEnabled then
			deps.MapCleaner.SetEnabled(false)
		end

		if ctx.resetMainPageDefaults then pcall(ctx.resetMainPageDefaults) end
		if ctx.resetCustomizePageDefaults then pcall(ctx.resetCustomizePageDefaults) end
		if ctx.resetKeybindPresetPageDefaults then pcall(ctx.resetKeybindPresetPageDefaults) end
		if ctx.rebuildOwnedList then pcall(ctx.rebuildOwnedList) end
		if ctx.refreshPage2UI then pcall(ctx.refreshPage2UI) end
		if ctx.refreshSettingsPage then pcall(ctx.refreshSettingsPage) end
	end

	function api.Wipe()
		if busy then return end
		busy=true
		setStatus("Wiping player data...",THEME.MUTED)

		if ctx.BOT_API and ctx.BOT_API.Post then
			local ok,result=pcall(function()
				return ctx.BOT_API.Post("/player/wipe",{
					playerId=getPlayerId(),
				})
			end)

			if not ok then
				busy=false
				setStatus("Wipe failed: "..tostring(result),THEME.RED)
				return
			end

			if not result or not result.ok then
				busy=false
				setStatus("Wipe failed: "..tostring(result and result.error or "unknown error"),THEME.RED)
				return
			end
		end

		wipeLocal()
		busy=false
		setStatus("Player data wiped.",THEME.GREEN or THEME.TEXT)
	end

	function api.ShowConfirm()
		showConfirmModal(
			"Wipe your data?",
			"This WILL delete your data across all gamemodes. Continue?",
			"WIPE",
			function()
				api.Wipe()
			end,
			{danger=true}
		)
	end

	function api.Destroy()
		disconnectConnections(connections)
	end

	local dataSection=makeSection(page,2,"Player Data","Saved settings",{
		headerButton={
			text="WIPE DATA",
			width=92,
			danger=true,
			onClick=api.ShowConfirm,
		},
	})

	local statusRow=New("Frame",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,34),
		ZIndex=5,
	},dataSection)

	New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,-76,1,0),
		Text="Cloud Profile",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=THEME.TEXT,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},statusRow)

	statusPill=New("Frame",{
		Size=UDim2.fromOffset(64,22),
		Position=UDim2.new(1,-64,0.5,-11),
		BackgroundColor3=THEME.BG,
		BorderSizePixel=0,
		ZIndex=6,
	},statusRow)

	New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},statusPill)

	statusPillText=New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,1,0),
		Text="READY",
		Font=Enum.Font.GothamMedium,
		TextSize=10,
		TextColor3=THEME.MUTED,
		TextXAlignment=Enum.TextXAlignment.Center,
		ZIndex=7,
	},statusPill)

	statusLabel=New("TextLabel",{
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,0,18),
		Text="",
		Font=Enum.Font.Gotham,
		TextSize=11,
		TextColor3=THEME.MUTED,
		TextWrapped=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextYAlignment=Enum.TextYAlignment.Top,
		ZIndex=6,
	},dataSection)

	return api
end

return PlayerData
