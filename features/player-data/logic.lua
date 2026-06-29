-- save/load/wipe controls for player settings.

local PlayerData={}

local function clearArray(t)
	for i=#t,1,-1 do
		table.remove(t,i)
	end
end

function PlayerData.new(app,page,deps)
	deps=deps or {}

	local New=app.New
	local THEME=app.THEME
	local SG=app.SG
	local makeSection=app.makeSection
	local wrapTextButton=app.wrapTextButton

	local api={}
	local statusLabel=nil
	local statusPill=nil
	local statusPillText=nil
	local busy=false
	local connections={}

	local function trackConnection(connection,bucket)
		if connection then
			table.insert(bucket or connections,connection)
		end

		return connection
	end

	local function disconnectConnections(bucket)
		for _,connection in ipairs(bucket) do
			pcall(function()
				connection:Disconnect()
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
		local function baseColor()
			return danger and THEME.RED or (THEME.BUTTON or THEME.BG)
		end

		local function hoverColor()
			local base=baseColor()
			local lum=(base.R*0.2126)+(base.G*0.7152)+(base.B*0.0722)
			local toward=lum<0.55 and Color3.new(1,1,1) or Color3.new(0,0,0)
			return base:Lerp(toward,0.08)
		end

		local normalBg=baseColor()
		local textColor=danger and Color3.fromRGB(0,0,0) or THEME.TEXT
		local button=New("TextButton",{
			Position=UDim2.fromOffset(x,120),
			Size=UDim2.fromOffset(104,30),
			BackgroundColor3=normalBg,
			BorderSizePixel=0,
			Text=text,
			Font=Enum.Font.Gotham,
			TextSize=12,
			TextColor3=textColor,
			SkipTextRole=danger,
			AutoButtonColor=false,
			Selectable=true,
			ZIndex=102,
		},parent)

		local wrap=wrapTextButton(button,normalBg,2)
		wrap.BackgroundColor3=normalBg
		if danger then
			wrap:SetAttribute("ThemeRole","RED")
		end

		trackConnection(button.MouseEnter:Connect(function()
			wrap.BackgroundColor3=hoverColor()
		end),bucket)

		trackConnection(button.MouseLeave:Connect(function()
			wrap.BackgroundColor3=baseColor()
		end),bucket)

		return button
	end

	local function showConfirmModal(titleText,bodyText,yesText,onYes,options)
		if app.showConfirmModal then
			app.showConfirmModal(titleText,bodyText,yesText,onYes,options)
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

		trackConnection(no.Activated:Connect(closeModal),modalConnections)

		trackConnection(yes.Activated:Connect(function()
			closeModal()
			if onYes then onYes() end
		end),modalConnections)
	end

	local function getPlayerId()
		if app.playerId then return tostring(app.playerId) end
		if app.me and app.me.UserId then return tostring(app.me.UserId) end

		local lp=game:GetService("Players").LocalPlayer
		return lp and tostring(lp.UserId) or ""
	end

	local function wipeLocal()
		if app.OWNED_PRESETS then
			clearArray(app.OWNED_PRESETS)
		end

		if app.expandedOwned then
			for k in pairs(app.expandedOwned) do
				app.expandedOwned[k]=nil
			end
		end

		if deps.Workspace and deps.Workspace.SetEnabled then
			deps.Workspace.SetEnabled(false)
		elseif app.WorkspaceAPI and app.WorkspaceAPI.SetEnabled then
			app.WorkspaceAPI.SetEnabled(false)
		end

		if deps.MapCleaner and deps.MapCleaner.SetEnabled then
			deps.MapCleaner.SetEnabled(false)
		end

		if app.resetMainPageDefaults then pcall(app.resetMainPageDefaults) end
		if app.resetCustomizePageDefaults then pcall(app.resetCustomizePageDefaults) end
		if app.resetKeybindPresetPageDefaults then pcall(app.resetKeybindPresetPageDefaults) end
		if app.rebuildOwnedList then pcall(app.rebuildOwnedList) end
		if app.refreshPage2UI then pcall(app.refreshPage2UI) end
		if app.refreshSettingsPage then pcall(app.refreshSettingsPage) end
	end

	function api.Wipe()
		if busy then return end
		busy=true
		setStatus("wiping...",THEME.MUTED)

		if app.BOT_API and app.BOT_API.Post then
			local ok,result=pcall(function()
				return app.BOT_API.Post("/player/wipe",{
					playerId=getPlayerId(),
				})
			end)

			if not ok then
				busy=false
				setStatus("wipe failed: "..tostring(result),THEME.RED)
				return
			end

			if not result or not result.ok then
				busy=false
				setStatus("wipe failed: "..tostring(result and result.error or "unknown"),THEME.RED)
				return
			end
		end

		wipeLocal()
		busy=false
		setStatus("data wiped",THEME.GREEN or THEME.TEXT)
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

	local dataSection=makeSection(page,2,"Player Data","",{
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
		SkipTextRole=true,
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
		SkipTextRole=true,
		TextWrapped=true,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextYAlignment=Enum.TextYAlignment.Top,
		ZIndex=6,
	},dataSection)

	return api
end

return PlayerData
