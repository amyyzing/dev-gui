local playerData={}

local function clearArray(t)
	table.clear(t)
end

function playerData.new(app,page,deps)
	deps=deps or {}

	local make=app.New or app.make
	local colors=app.colors
	local screenGui=app.SG or app.screenGui
	local makeSection=app.makeSection
	local wrapTextButton=app.wrapTextButton

	local api={}
	local wipeButton=nil
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

	local function canWipe()
		return type(app.botApi)=="table" and type(app.botApi.Post)=="function"
	end

	local function updateWipeButton()
		if not wipeButton then
			return
		end

		if busy then
			wipeButton.Text="wiping..."
		elseif canWipe() then
			wipeButton.Text="wipe"
		else
			wipeButton.Text="not ready..."
		end

		wipeButton.Active=not busy and canWipe()
		wipeButton.Selectable=wipeButton.Active
	end

	local function modalButton(parent,text,x,danger,bucket)
		local function baseColor()
			return danger and colors.red or (colors.button or colors.bg)
		end

		local function hoverColor()
			local base=baseColor()
			local lum=(base.R*0.2126)+(base.G*0.7152)+(base.B*0.0722)
			local toward=lum<0.55 and Color3.new(1,1,1) or Color3.new(0,0,0)
			return base:Lerp(toward,0.08)
		end

		local normalBg=baseColor()
		local textColor=danger and Color3.fromRGB(0,0,0) or colors.text
		local button=make("TextButton",{
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

		local modal=make("Frame",{
			BackgroundColor3=Color3.fromRGB(0,0,0),
			BackgroundTransparency=0.25,
			BorderSizePixel=0,
			Size=UDim2.new(1,0,1,0),
			ZIndex=100,
		},screenGui)
		local modalConnections={}
		local function closeModal()
			disconnectConnections(modalConnections)
			if modal and modal.Parent then
				modal:Destroy()
			end
		end

		local box=make("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.new(0.5,0,0.5,0),
			Size=UDim2.fromOffset(390,170),
			BackgroundColor3=colors.bg,
			BorderSizePixel=0,
			ZIndex=101,
		},modal)

		make("UIStroke",{Color=colors.stroke,Thickness=2,Transparency=0},box)

		make("TextLabel",{
			BackgroundTransparency=1,
			Position=UDim2.fromOffset(16,14),
			Size=UDim2.new(1,-32,0,24),
			Text=titleText,
			Font=Enum.Font.GothamMedium,
			TextSize=14,
			TextColor3=colors.text,
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=102,
		},box)

		make("TextLabel",{
			BackgroundTransparency=1,
			Position=UDim2.fromOffset(16,48),
			Size=UDim2.new(1,-32,0,54),
			Text=bodyText,
			Font=Enum.Font.Gotham,
			TextSize=12,
			TextWrapped=true,
			TextColor3=colors.muted,
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
		if app.savedPresets then
			clearArray(app.savedPresets)
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

		if deps.mapCleaner and deps.mapCleaner.SetEnabled then
			deps.mapCleaner.SetEnabled(false)
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
		if not canWipe() then
			updateWipeButton()
			return
		end

		busy=true
		updateWipeButton()

		local ok,result=pcall(function()
			return app.botApi.Post("/player/wipe",{
				playerId=getPlayerId(),
			})
		end)

		if not ok or not result or not result.ok then
			busy=false
			updateWipeButton()
			return
		end

		wipeLocal()
		busy=false
		updateWipeButton()
	end

	function api.ShowConfirm()
		if busy then return end
		if not canWipe() then
			updateWipeButton()
			return
		end

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

	local _,sectionControls=makeSection(page,2,"Player Data","",{
		headerOnly=true,
		headerButton={
			text="wipe",
			width=104,
			danger=true,
			onClick=api.ShowConfirm,
		},
	})

	wipeButton=sectionControls and sectionControls.headerButton
	updateWipeButton()

	return api
end

return playerData
