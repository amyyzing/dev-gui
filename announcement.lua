local Announcement={}

local function safeDisconnect(conn)
	if conn and typeof(conn)=="RBXScriptConnection" then
		pcall(function()
			conn:Disconnect()
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

function Announcement.new(ctx)
	local New=ctx.New
	local THEME=ctx.THEME
	local SG=ctx.SG
	local BOT_API=ctx.BOT_API
	local playerId=tostring(ctx.playerId or "")
	local getSessionId=ctx.getSessionId
	local wrapTextButton=ctx.wrapTextButton
	local api={}
	local alive=true
	local activeModal=nil
	local pollThread=nil
	local currentAnnouncementId=nil

	local function post(path,body)
		if not BOT_API or not BOT_API.Post then
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
		return BOT_API.Post(path,body)
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

		if activeModal and activeModal.Parent then
			activeModal:Destroy()
		end

		activeModal=nil
	end

	local function makeButton(parent,text,x,width)
		local button=New("TextButton",{
			Position=UDim2.new(1,-x,1,-46),
			Size=UDim2.fromOffset(width or 104,30),
			BackgroundColor3=THEME.BG,
			BorderSizePixel=0,
			Text=text,
			Font=Enum.Font.Gotham,
			TextSize=12,
			TextColor3=THEME.TEXT,
			AutoButtonColor=false,
			ZIndex=154,
		},parent)

		local wrap=wrapTextButton and wrapTextButton(button,THEME.BG,2)

		button.MouseEnter:Connect(function()
			if wrap then
				wrap.BackgroundColor3=THEME.CARD
			end
		end)

		button.MouseLeave:Connect(function()
			if wrap then
				wrap.BackgroundColor3=THEME.BG
			end
		end)

		return button
	end

	local function showAnnouncement(announcement)
		if not alive or not SG or not SG.Parent or type(announcement)~="table" then
			return
		end

		local id=tostring(announcement.id or announcement.Id or "")
		if id=="" or currentAnnouncementId==id then
			return
		end

		destroyModal(false)
		currentAnnouncementId=id

		local title=clampText(announcement.title or announcement.Title or "Announcement",90)
		local description=clampText(announcement.description or announcement.Description or "",6000)
		local lineCount=1
		for _ in string.gmatch(description,"\n") do
			lineCount+=1
		end

		local modal=New("Frame",{
			Name="AnnouncementModal",
			BackgroundColor3=Color3.fromRGB(0,0,0),
			BackgroundTransparency=0.22,
			BorderSizePixel=0,
			Size=UDim2.new(1,0,1,0),
			ZIndex=150,
		},SG)

		local box=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.new(0.5,0,0.5,0),
			Size=UDim2.fromOffset(500,360),
			BackgroundColor3=THEME.BG,
			BorderSizePixel=0,
			ZIndex=151,
		},modal)

		New("UIStroke",{Color=THEME.STROKE,Thickness=2,Transparency=0},box)
		New("UIPadding",{PaddingTop=UDim.new(0,14),PaddingLeft=UDim.new(0,16),PaddingRight=UDim.new(0,16),PaddingBottom=UDim.new(0,14)},box)

		New("TextLabel",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,-36,0,24),
			Text=string.upper(title),
			Font=Enum.Font.GothamMedium,
			TextSize=16,
			TextColor3=THEME.TEXT,
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=152,
		},box)

		local close=New("TextButton",{
			AnchorPoint=Vector2.new(1,0),
			Position=UDim2.new(1,0,0,0),
			Size=UDim2.fromOffset(28,24),
			BackgroundTransparency=1,
			BorderSizePixel=0,
			Text="x",
			Font=Enum.Font.GothamMedium,
			TextSize=14,
			TextColor3=THEME.MUTED,
			AutoButtonColor=false,
			ZIndex=153,
		},box)

		local scroll=New("ScrollingFrame",{
			Position=UDim2.fromOffset(0,38),
			Size=UDim2.new(1,0,1,-92),
			CanvasSize=UDim2.fromOffset(0,math.max(230,lineCount*18+24)),
			AutomaticCanvasSize=Enum.AutomaticSize.Y,
			ScrollBarThickness=4,
			BackgroundColor3=THEME.PANEL,
			BorderSizePixel=0,
			ZIndex=152,
		},box)

		New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},scroll)
		New("UIPadding",{PaddingTop=UDim.new(0,8),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingBottom=UDim.new(0,8)},scroll)

		local textBox=New("TextBox",{
			BackgroundTransparency=1,
			BorderSizePixel=0,
			ClearTextOnFocus=false,
			Text=description,
			Font=Enum.Font.Gotham,
			TextSize=13,
			TextColor3=THEME.TEXT,
			TextWrapped=true,
			TextXAlignment=Enum.TextXAlignment.Left,
			TextYAlignment=Enum.TextYAlignment.Top,
			Size=UDim2.new(1,-4,0,math.max(214,lineCount*18+16)),
			ZIndex=153,
		},scroll)

		pcall(function()
			textBox.TextEditable=false
		end)

		pcall(function()
			textBox.MultiLine=true
		end)

		local okButton=makeButton(box,"OK",104,104)

		local closeConn=nil
		local okConn=nil
		closeConn=close.Activated:Connect(function()
			safeDisconnect(closeConn)
			safeDisconnect(okConn)
			destroyModal(true)
		end)

		okConn=okButton.Activated:Connect(function()
			safeDisconnect(closeConn)
			safeDisconnect(okConn)
			destroyModal(true)
		end)

		activeModal=modal
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

return Announcement
