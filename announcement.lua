-- announcement popup used for bot messages.

local announcement={}

local function safeDisconnect(connection)
	if connection and typeof(connection)=="RBXScriptConnection" then
		pcall(function()
			connection:Disconnect()
		end)
	end
end

local function clampText(value,maxLen)
	local text=tostring(value or "")
	if #text>maxLen then
		return string.sub(text,1,maxLen)
	end

	return text
end

function announcement.new(app)
	local make=app.New
	local colors=app.colors
	local screenGui=app.SG
	local botApi=app.botApi
	local textService=game:GetService("TextService")
	local playerId=tostring(app.playerId or "")
	local getSessionId=app.getSessionId
	local wrapTextButton=app.wrapTextButton
	local api={}
	local alive=true
	local activeModal=nil
	local activeModalConnections={}
	local pollThread=nil
	local currentAnnouncementId=nil

	local function trackModalConnection(connection,bucket)
		if connection then
			table.insert(bucket or activeModalConnections,connection)
		end

		return connection
	end

	local function disconnectModalConnections()
		for _,connection in ipairs(activeModalConnections) do
			safeDisconnect(connection)
		end

		table.clear(activeModalConnections)
	end

	local function post(path,body)
		if not botApi or not botApi.Post then
			return nil
		end

		body=body or {}
		body.playerId=playerId
		if getSessionId then
			local ok,sessionId=pcall(getSessionId)
			if ok and sessionId then
				body.sessionId=tostring(sessionId)
			end
		end
		return botApi.Post(path,body)
	end

	local function markSeen(id)
		if not id then return end

		task.spawn(function()
			post("/announcement/seen",{
				announcementId=tostring(id),
			})
		end)
	end

	local function destroyModal(mark)
		if mark and currentAnnouncementId then
			markSeen(currentAnnouncementId)
		end

		currentAnnouncementId=nil
		disconnectModalConnections()

		if activeModal and activeModal.Parent then
			activeModal:Destroy()
		end

		activeModal=nil
	end

	local function makeButton(parent,text,x,width,bucket)
		local button=make("TextButton",{
			Position=UDim2.new(1,-x,1,-46),
			Size=UDim2.fromOffset(width or 104,30),
			BackgroundColor3=colors.bg,
			BorderSizePixel=0,
			Text=text,
			Font=Enum.Font.Gotham,
			TextSize=12,
			TextColor3=colors.text,
			AutoButtonColor=false,
			ZIndex=154,
		},parent)

		local wrap=wrapTextButton and wrapTextButton(button,colors.bg,2)

		trackModalConnection(button.MouseEnter:Connect(function()
			if wrap then
				wrap.BackgroundColor3=colors.card
			end
		end),bucket)

		trackModalConnection(button.MouseLeave:Connect(function()
			if wrap then
				wrap.BackgroundColor3=colors.bg
			end
		end),bucket)

		return button
	end

	local function showAnnouncement(announcement)
		if not alive or not screenGui or not screenGui.Parent or type(announcement)~="table" then
			return
		end

		local id=tostring(announcement.id or announcement.Id or "")
		if id=="" or currentAnnouncementId==id then
			return
		end

		destroyModal(false)
		currentAnnouncementId=id
		local modalConnections={}

		local title=clampText(announcement.title or announcement.Title or "Announcement",90)
		local description=clampText(announcement.description or announcement.Description or "",6000)
		local lineCount=1
		for _ in string.gmatch(description,"\n") do
			lineCount+=1
		end
		local bodyWidth=448
		local measuredHeight=math.max(44,lineCount*18)
		pcall(function()
			measuredHeight=math.max(measuredHeight,textService:GetTextSize(description,13,Enum.Font.Gotham,Vector2.new(bodyWidth,10000)).Y+18)
		end)
		local scrollHeight=math.clamp(math.floor(measuredHeight+18),74,330)
		local boxHeight=math.clamp(scrollHeight+120,210,470)
		local useScroll=measuredHeight>scrollHeight

		local modal=make("Frame",{
			Name="AnnouncementModal",
			BackgroundColor3=Color3.fromRGB(0,0,0),
			BackgroundTransparency=0.22,
			BorderSizePixel=0,
			Size=UDim2.new(1,0,1,0),
			ZIndex=150,
		},screenGui)

		local box=make("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.new(0.5,0,0.5,0),
			Size=UDim2.fromOffset(500,boxHeight),
			BackgroundColor3=colors.bg,
			BorderSizePixel=0,
			ZIndex=151,
		},modal)

		make("UIStroke",{Color=colors.stroke,Thickness=2,Transparency=0},box)
		make("UIPadding",{PaddingTop=UDim.new(0,14),PaddingLeft=UDim.new(0,16),PaddingRight=UDim.new(0,16),PaddingBottom=UDim.new(0,14)},box)

		make("TextLabel",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,-36,0,30),
			Text=string.upper(title),
			Font=Enum.Font.GothamMedium,
			TextSize=20,
			TextColor3=colors.text,
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=152,
		},box)

		local close=make("TextButton",{
			AnchorPoint=Vector2.new(1,0),
			Position=UDim2.new(1,0,0,0),
			Size=UDim2.fromOffset(28,24),
			BackgroundTransparency=1,
			BorderSizePixel=0,
			Text="x",
			Font=Enum.Font.GothamMedium,
			TextSize=14,
			TextColor3=colors.muted,
			AutoButtonColor=false,
			ZIndex=153,
		},box)

		local scroll=make("ScrollingFrame",{
			Position=UDim2.fromOffset(0,46),
			Size=UDim2.new(1,0,0,scrollHeight),
			CanvasSize=UDim2.fromOffset(0,math.max(scrollHeight,math.floor(measuredHeight+16))),
			AutomaticCanvasSize=Enum.AutomaticSize.Y,
			ScrollBarThickness=useScroll and 4 or 0,
			BackgroundColor3=colors.panel,
			BorderSizePixel=0,
			ZIndex=152,
		},box)

		make("UIStroke",{Color=colors.stroke,Thickness=1,Transparency=0},scroll)
		make("UIPadding",{PaddingTop=UDim.new(0,8),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingBottom=UDim.new(0,8)},scroll)

		local textBox=make("TextBox",{
			BackgroundTransparency=1,
			BorderSizePixel=0,
			ClearTextOnFocus=false,
			Text=description,
			Font=Enum.Font.Gotham,
			TextSize=13,
			TextColor3=colors.text,
			TextWrapped=true,
			TextXAlignment=Enum.TextXAlignment.Left,
			TextYAlignment=Enum.TextYAlignment.Top,
			Size=UDim2.new(1,-4,0,math.max(scrollHeight-16,math.floor(measuredHeight+8))),
			ZIndex=153,
		},scroll)

		pcall(function()
			textBox.TextEditable=false
		end)

		pcall(function()
			textBox.MultiLine=true
		end)

		local okButton=makeButton(box,"OK",104,104,modalConnections)

		local closeConn=nil
		local okConn=nil
		closeConn=trackModalConnection(close.Activated:Connect(function()
			destroyModal(true)
		end),modalConnections)

		okConn=trackModalConnection(okButton.Activated:Connect(function()
			destroyModal(true)
		end),modalConnections)

		activeModal=modal
		activeModalConnections=modalConnections
	end

	local function checkLatest()
		if not alive then return end
		if getSessionId then
			local ok,sessionId=pcall(getSessionId)
			if not ok or not sessionId or tostring(sessionId)=="" then
				return
			end
		end

		local result=post("/announcement/latest",{})
		if result and result.ok and result.announcement then
			showAnnouncement(result.announcement)
		end
	end

	function api.Refresh()
		checkLatest()
	end

	function api.Destroy()
		alive=false
		destroyModal(false)
	end

	pollThread=task.spawn(function()
		task.wait(1)
		while alive do
			checkLatest()
			task.wait(30)
		end
	end)

	return api
end

return announcement
