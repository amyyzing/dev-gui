-- preset save, equip, delete, and import actions.

local hitboxPresets={}

local function trim(s)
	return tostring(s or ""):gsub("^%s*(.-)%s*$","%1")
end

local function makeCode(name)
	local base=string.upper(string.sub(string.gsub(tostring(name or ""),"[^%w]",""),1,3))
	if base=="" then base="GUI" end
	return base..tostring(math.random(100,999))
end

function hitboxPresets.new(app,ownedSection)
	local make=app.New
	local colors=app.colors
	local screenGui=app.SG
	local hitboxPresets=app.hitboxPresets
	local savedPresets=app.savedPresets or {}
	app.savedPresets=savedPresets

	local fmtNumber=app.fmtNumber
	local bindingToLabel=app.bindingToLabel
	local wrapTextButton=app.wrapTextButton
	local wrapTextBox=app.wrapTextBox

	local api={}
	local expandedOwned=app.expandedOwned or {}
	app.expandedOwned=expandedOwned

	local modalOverlay=nil
	local refreshAll=nil
	local connections={}
	local listConnections={}
	local modalConnections={}
	local importBox=nil
	local importWarning=nil
	local requestImport=nil

	local function trackConnection(connection,bucket)
		bucket=bucket or connections
		table.insert(bucket,connection)
		return connection
	end

	local function disconnectAll(bucket)
		for _,connection in ipairs(bucket) do
			pcall(function()
				connection:Disconnect()
			end)
		end
		table.clear(bucket)
	end

	local importRow=make("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,54),ZIndex=5,LayoutOrder=0},ownedSection)
	importBox=make("TextBox",{
		BackgroundColor3=colors.bg,
		BorderSizePixel=0,
		ClearTextOnFocus=false,
		PlaceholderText="preset code",
		Text="",
		Font=Enum.Font.GothamMedium,
		TextSize=12,
		TextColor3=colors.text,
		PlaceholderColor3=colors.muted,
		TextXAlignment=Enum.TextXAlignment.Center,
		Size=UDim2.new(1,-104,0,28),
		Position=UDim2.fromOffset(0,0),
		ZIndex=6,
	},importRow)
	wrapTextBox(importBox,colors.bg,2)

	local importButton=make("TextButton",{
		BackgroundColor3=colors.button or colors.bg,
		BorderSizePixel=0,
		Text="import",
		Font=Enum.Font.GothamMedium,
		TextSize=11,
		TextColor3=colors.text,
		AutoButtonColor=false,
		Position=UDim2.new(1,-96,0,0),
		Size=UDim2.fromOffset(96,28),
		ZIndex=6,
		ThemeRole="BUTTON",
	},importRow)
	local importButtonWrap=wrapTextButton(importButton,colors.button or colors.bg,2)
	importButtonWrap:SetAttribute("ThemeRole","BUTTON")

	importWarning=make("TextLabel",{
		BackgroundTransparency=1,
		Position=UDim2.fromOffset(0,34),
		Size=UDim2.new(1,0,0,16),
		Text="",
		Font=Enum.Font.Gotham,
		TextSize=11,
		TextColor3=colors.red,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=6,
	},importRow)

	trackConnection(importButton.MouseEnter:Connect(function()
		importButtonWrap.BackgroundColor3=colors.card
	end))

	trackConnection(importButton.MouseLeave:Connect(function()
		importButtonWrap.BackgroundColor3=colors.button or colors.bg
	end))

	trackConnection(importButton.Activated:Connect(function()
		if requestImport then requestImport() end
	end))

	trackConnection(importBox.FocusLost:Connect(function(enterPressed)
		if enterPressed and requestImport then
			requestImport()
		end
	end))

	local ownedList=make("ScrollingFrame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,190),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,ScrollBarThickness=4,BorderSizePixel=0,ZIndex=5},ownedSection)
	make("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},ownedList)

	function api.SetRefreshAll(fn)
		refreshAll=fn
	end

	local function requestRefresh()
		api.Refresh()
		if refreshAll then refreshAll() end
		if app.refreshPage2UI then pcall(app.refreshPage2UI) end
		if app.rebuildOwnedList then pcall(app.rebuildOwnedList) end
	end

	local function applyEditorLocally(editor)
		editor=editor or {}

		for i=1,4 do
			local item=editor[i]
			if item and hitboxPresets[i] then
				hitboxPresets[i].key=item.key or item.Key or Enum.KeyCode.Unknown
				hitboxPresets[i].size=Vector3.new(tonumber(item.x or item.X) or 1,tonumber(item.y or item.Y) or 1,tonumber(item.z or item.Z) or 1)
			end
		end

		if app.requestPlayerAutosave then
			app.requestPlayerAutosave()
		end
	end

	local function applyOwnedPreset(preset,editor)
		if app.equipOwnedPreset then
			local ok,success,err=pcall(app.equipOwnedPreset,preset)
			if ok and success~=false then
				return true
			end

			if not ok then
				warn("preset equip failed:",success)
			elseif err then
				warn("preset equip failed:",err)
			end
		elseif app.applyPresetEditor then
			local ok,success,err=pcall(app.applyPresetEditor,editor)
			if ok and success~=false then
				return true
			end

			if not ok then
				warn("preset editor apply failed:",success)
			elseif err then
				warn("preset editor apply failed:",err)
			end
		end

		applyEditorLocally(editor)
		return true
	end

	local function deleteOwnedPreset(code,index)
		if app.deleteOwnedPreset then
			local ok,success,err=pcall(app.deleteOwnedPreset,code,index)
			if ok and success~=false then
				return true
			end

			if not ok then
				warn("preset delete failed:",success)
			elseif err then
				warn("preset delete failed:",err)
			end

			return false
		end

		table.remove(savedPresets,index)
		expandedOwned[code]=nil
		return true
	end

	local function clearOwnedList()
		disconnectAll(listConnections)
		for _,child in ipairs(ownedList:GetChildren()) do
			if not child:IsA("UIListLayout") then
				child:Destroy()
			end
		end
	end

	local function addDetailLine(parent,text,order)
		make("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text=text,Font=Enum.Font.Gotham,TextSize=11,TextColor3=colors.muted,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=8,LayoutOrder=order},parent)
	end

	local function makePresetActionButton(parent,label,bucket)
		local normalBg=colors.button or colors.bg
		local button=make("TextButton",{Size=UDim2.fromOffset(92,26),BackgroundColor3=normalBg,BorderSizePixel=0,Text=label,Font=Enum.Font.Gotham,TextSize=11,TextColor3=colors.text,AutoButtonColor=false,ZIndex=9,ThemeRole="BUTTON"},parent)
		local wrap=wrapTextButton(button,normalBg,2)
		wrap:SetAttribute("ThemeRole","BUTTON")

		trackConnection(button.MouseEnter:Connect(function()
			wrap.BackgroundColor3=colors.card
		end),bucket)

		trackConnection(button.MouseLeave:Connect(function()
			wrap.BackgroundColor3=colors.button or colors.bg
		end),bucket)

		return button
	end

	function api.Refresh()
		clearOwnedList()

		if #savedPresets==0 then
			make("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="No saved presets yet.",Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.muted,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},ownedList)
			return
		end

		for presetIndex,preset in ipairs(savedPresets) do
			local code=tostring(preset.Code or preset.code or presetIndex)
			local name=tostring(preset.Name or preset.name or "Unnamed")
			local data=preset.Data or preset.data or {}
			local editor=data.presetEditor or data.presetEditor or preset.presetEditor or {}

			local row=make("Frame",{BackgroundColor3=colors.bg,BorderSizePixel=0,Size=UDim2.new(1,-6,0,expandedOwned[code] and 178 or 32),ZIndex=6},ownedList)
			make("UIStroke",{Color=colors.stroke,Thickness=1,Transparency=0},row)

			local toggle=make("TextButton",{BackgroundTransparency=1,Size=UDim2.new(1,-8,0,30),Position=UDim2.fromOffset(4,1),Text=(expandedOwned[code] and"[-] " or"[+] ")..name.."  |  "..code,Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=colors.text,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,ZIndex=7},row)

			trackConnection(toggle.Activated:Connect(function()
				expandedOwned[code]=not expandedOwned[code]
				api.Refresh()
			end),listConnections)

			if expandedOwned[code] then
				local detail=make("Frame",{BackgroundTransparency=1,Position=UDim2.fromOffset(10,34),Size=UDim2.new(1,-20,0,136),ZIndex=7},row)
				make("UIListLayout",{Padding=UDim.new(0,2),SortOrder=Enum.SortOrder.LayoutOrder},detail)

				addDetailLine(detail,"Code: "..code,1)
				addDetailLine(detail,"Name: "..name,2)

				for i=1,4 do
					local item=editor[i] or {}
					addDetailLine(detail,"Preset "..i..": "..bindingToLabel(item.key or item.Key).." | X "..fmtNumber(item.x or item.X or 0,2).." | Y "..fmtNumber(item.y or item.Y or 0,2).." | Z "..fmtNumber(item.z or item.Z or 0,2),i+2)
				end

				local actionRow=make("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,28),ZIndex=8,LayoutOrder=7},detail)
				make("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},actionRow)

				local equipBtn=makePresetActionButton(actionRow,"EQUIP",listConnections)
				local deleteBtn=makePresetActionButton(actionRow,"DELETE",listConnections)

				trackConnection(equipBtn.Activated:Connect(function()
					applyOwnedPreset(preset,editor)
					requestRefresh()
				end),listConnections)

				trackConnection(deleteBtn.Activated:Connect(function()
					if deleteOwnedPreset(code,presetIndex) then
						requestRefresh()
					end
				end),listConnections)
			end
		end
	end

	function api.AddPreset(name,collectFn)
		local cleanName=trim(name)
		if cleanName=="" then
			return false,"name missing"
		end

		local ok,editor=pcall(collectFn)
		if not ok then
			return false,"preset broke: "..tostring(editor)
		end

		if app.createOwnedPreset then
			local callOk,success,result=pcall(app.createOwnedPreset,cleanName,editor)
			if not callOk then
				return false,tostring(success)
			end

			if not success then
				return false,tostring(result)
			end

			local code=tostring(result.Code or result.code or "")
			if code~="" then
				expandedOwned[code]=true
			end

			requestRefresh()
			return true,result
		end

		local code=makeCode(cleanName)
		local preset={Code=code,Name=cleanName,Data={presetEditor=editor}}

		table.insert(savedPresets,preset)
		expandedOwned[code]=true
		if app.requestPlayerAutosave then
			app.requestPlayerAutosave()
		end
		requestRefresh()

		return true,preset
	end

	function api.ImportPreset(code)
		local cleanCode=trim(code)
		if cleanCode=="" then
			return false,"paste a code"
		end

		if app.importOwnedPreset then
			local ok,success,result=pcall(app.importOwnedPreset,cleanCode)
			if not ok then
				return false,tostring(success)
			end

			if success==false then
				return false,tostring(result)
			end

			requestRefresh()
			return true,result
		end

		return false,"preset import missing"
	end

	local function closePresetModal()
		disconnectAll(modalConnections)
		if modalOverlay then
			modalOverlay:Destroy()
			modalOverlay=nil
		end
	end

	local function modalButton(parent,text,x)
		local normalBg=colors.button or colors.bg
		local button=make("TextButton",{Size=UDim2.fromOffset(96,30),Position=UDim2.fromOffset(x,118),BackgroundColor3=normalBg,BorderSizePixel=0,Text=text,Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.text,AutoButtonColor=false,ZIndex=101,ThemeRole="BUTTON"},parent)
		local wrap=wrapTextButton(button,normalBg,2)
		wrap:SetAttribute("ThemeRole","BUTTON")

		trackConnection(button.MouseEnter:Connect(function()
			wrap.BackgroundColor3=colors.card
		end),modalConnections)

		trackConnection(button.MouseLeave:Connect(function()
			wrap.BackgroundColor3=colors.button or colors.bg
		end),modalConnections)

		return button
	end

	local function showImportConfirm(code)
		closePresetModal()
		code=trim(code)

		modalOverlay=make("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=0.35,BorderSizePixel=0,ZIndex=90},screenGui)

		local box=make("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset(380,166),BackgroundColor3=colors.bg,BorderSizePixel=0,ZIndex=100},modalOverlay)
		make("UIStroke",{Color=colors.stroke,Thickness=2,Transparency=0},box)

		make("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,14),Size=UDim2.new(1,-32,0,22),Text="import?",Font=Enum.Font.GothamMedium,TextSize=14,TextColor3=colors.text,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=101},box)
		make("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,44),Size=UDim2.new(1,-32,0,42),Text="add "..code.."?",Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.muted,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,ZIndex=101},box)

		local no=modalButton(box,"NO",166)
		local yes=modalButton(box,"YES",268)

		trackConnection(no.Activated:Connect(closePresetModal),modalConnections)
		trackConnection(yes.Activated:Connect(function()
			local ok,result=api.ImportPreset(code)
			if not ok then
				if importWarning then importWarning.Text=tostring(result) end
				closePresetModal()
				return
			end

			if importBox then importBox.Text="" end
			if importWarning then importWarning.Text="" end
			closePresetModal()
		end),modalConnections)
	end

	requestImport=function()
		local code=trim(importBox and importBox.Text or "")
		if code=="" then
			if importWarning then importWarning.Text="enter a preset code" end
			return
		end

		if importWarning then importWarning.Text="" end
		showImportConfirm(code)
	end

	local function showNamePrompt(collectFn)
		closePresetModal()

		modalOverlay=make("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=0.35,BorderSizePixel=0,ZIndex=90},screenGui)

		local box=make("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset(360,188),BackgroundColor3=colors.bg,BorderSizePixel=0,ZIndex=100},modalOverlay)
		make("UIStroke",{Color=colors.stroke,Thickness=2,Transparency=0},box)

		make("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,14),Size=UDim2.new(1,-32,0,22),Text="name it",Font=Enum.Font.GothamMedium,TextSize=14,TextColor3=colors.text,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=101},box)

		local nameBox=make("TextBox",{Size=UDim2.fromOffset(328,30),Position=UDim2.fromOffset(16,52),BackgroundColor3=colors.bg,BorderSizePixel=0,ClearTextOnFocus=false,Text="",PlaceholderText="name",TextColor3=colors.text,PlaceholderColor3=colors.muted,TextXAlignment=Enum.TextXAlignment.Left,Font=Enum.Font.Gotham,TextSize=13,ZIndex=101},box)
		wrapTextBox(nameBox,colors.bg,2)

		local warning=make("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,88),Size=UDim2.new(1,-32,0,18),Text="",Font=Enum.Font.Gotham,TextSize=11,TextColor3=colors.red,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=101},box)

		local cancel=modalButton(box,"CANCEL",146)
		local save=modalButton(box,"SAVE",248)

		trackConnection(cancel.Activated:Connect(closePresetModal),modalConnections)

		trackConnection(save.Activated:Connect(function()
			local ok,result=api.AddPreset(nameBox.Text,collectFn)
			if not ok then
				warning.Text=tostring(result)
				return
			end
			closePresetModal()
		end),modalConnections)

		task.defer(function()
			pcall(function()
				nameBox:CaptureFocus()
			end)
		end)
	end

	function api.ShowSaveConfirm(collectFn)
		closePresetModal()

		modalOverlay=make("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=0.35,BorderSizePixel=0,ZIndex=90},screenGui)

		local box=make("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset(360,166),BackgroundColor3=colors.bg,BorderSizePixel=0,ZIndex=100},modalOverlay)
		make("UIStroke",{Color=colors.stroke,Thickness=2,Transparency=0},box)

		make("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,14),Size=UDim2.new(1,-32,0,22),Text="save?",Font=Enum.Font.GothamMedium,TextSize=14,TextColor3=colors.text,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=101},box)

		make("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,44),Size=UDim2.new(1,-32,0,42),Text="saves this preset",Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.muted,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,ZIndex=101},box)

		local no=modalButton(box,"NO",146)
		local yes=modalButton(box,"YES",248)

		trackConnection(no.Activated:Connect(closePresetModal),modalConnections)
		trackConnection(yes.Activated:Connect(function()
			showNamePrompt(collectFn)
		end),modalConnections)
	end

	function api.Destroy()
		closePresetModal()
		clearOwnedList()
		disconnectAll(connections)
		refreshAll=nil
	end

	api.Refresh()
	return api
end

return hitboxPresets
