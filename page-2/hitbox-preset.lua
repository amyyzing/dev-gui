local HitboxPreset={}

local function trim(s)
	return tostring(s or ""):gsub("^%s*(.-)%s*$","%1")
end

local function makeCode(name)
	local base=string.upper(string.sub(string.gsub(tostring(name or ""),"[^%w]",""),1,3))
	if base=="" then base="GUI" end
	return base..tostring(math.random(100,999))
end

function HitboxPreset.new(ctx,ownedSection)
	local New=ctx.New
	local THEME=ctx.THEME
	local SG=ctx.SG
	local PRESETS=ctx.PRESETS
	local OWNED_PRESETS=ctx.OWNED_PRESETS or {}
	ctx.OWNED_PRESETS=OWNED_PRESETS

	local fmtNumber=ctx.fmtNumber
	local bindingToLabel=ctx.bindingToLabel
	local wrapTextButton=ctx.wrapTextButton
	local wrapTextBox=ctx.wrapTextBox

	local api={}
	local expandedOwned=ctx.expandedOwned or {}
	ctx.expandedOwned=expandedOwned

	local modalOverlay=nil
	local refreshAll=nil

	local ownedList=New("ScrollingFrame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,190),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,ScrollBarThickness=4,BorderSizePixel=0,ZIndex=5},ownedSection)
	New("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},ownedList)

	function api.SetRefreshAll(fn)
		refreshAll=fn
	end

	local function requestRefresh()
		api.Refresh()
		if refreshAll then refreshAll() end
		if ctx.refreshPage2UI then pcall(ctx.refreshPage2UI) end
		if ctx.rebuildOwnedList then pcall(ctx.rebuildOwnedList) end
	end

	local function applyEditorLocally(editor)
		editor=editor or {}

		for i=1,4 do
			local item=editor[i]
			if item and PRESETS[i] then
				PRESETS[i].key=item.key or item.Key or Enum.KeyCode.Unknown
				PRESETS[i].size=Vector3.new(tonumber(item.x or item.X) or 1,tonumber(item.y or item.Y) or 1,tonumber(item.z or item.Z) or 1)
			end
		end

		if ctx.requestPlayerAutosave then
			ctx.requestPlayerAutosave()
		end
	end

	local function applyOwnedPreset(preset,editor)
		if ctx.equipOwnedPreset then
			local ok,success,err=pcall(ctx.equipOwnedPreset,preset)
			if ok and success~=false then
				return true
			end

			if not ok then
				warn("HitboxPreset: equip failed:",success)
			elseif err then
				warn("HitboxPreset: equip failed:",err)
			end
		elseif ctx.applyPresetEditor then
			local ok,success,err=pcall(ctx.applyPresetEditor,editor)
			if ok and success~=false then
				return true
			end

			if not ok then
				warn("HitboxPreset: applyPresetEditor failed:",success)
			elseif err then
				warn("HitboxPreset: applyPresetEditor failed:",err)
			end
		end

		applyEditorLocally(editor)
		return true
	end

	local function deleteOwnedPreset(code,index)
		if ctx.deleteOwnedPreset then
			local ok,success,err=pcall(ctx.deleteOwnedPreset,code,index)
			if ok and success~=false then
				return true
			end

			if not ok then
				warn("HitboxPreset: delete failed:",success)
			elseif err then
				warn("HitboxPreset: delete failed:",err)
			end

			return false
		end

		table.remove(OWNED_PRESETS,index)
		expandedOwned[code]=nil
		return true
	end

	local function clearOwnedList()
		for _,child in ipairs(ownedList:GetChildren()) do
			if not child:IsA("UIListLayout") then
				child:Destroy()
			end
		end
	end

	local function addDetailLine(parent,text,order)
		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text=text,Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=8,LayoutOrder=order},parent)
	end

	local function makePresetActionButton(parent,label)
		local btn=New("TextButton",{Size=UDim2.fromOffset(92,26),BackgroundColor3=THEME.BG,BorderSizePixel=0,Text=label,Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.TEXT,AutoButtonColor=false,ZIndex=9},parent)
		local wrap=wrapTextButton(btn,THEME.BG,2)

		btn.MouseEnter:Connect(function()
			wrap.BackgroundColor3=Color3.fromRGB(43,43,43)
		end)

		btn.MouseLeave:Connect(function()
			wrap.BackgroundColor3=THEME.PANEL
		end)

		return btn
	end

	function api.Refresh()
		clearOwnedList()

		if #OWNED_PRESETS==0 then
			New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="No saved presets yet.",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},ownedList)
			return
		end

		for presetIndex,preset in ipairs(OWNED_PRESETS) do
			local code=tostring(preset.Code or preset.code or presetIndex)
			local name=tostring(preset.Name or preset.name or "Unnamed")
			local data=preset.Data or preset.data or {}
			local editor=data.PresetEditor or data.presetEditor or preset.presetEditor or {}

			local row=New("Frame",{BackgroundColor3=THEME.BG,BorderSizePixel=0,Size=UDim2.new(1,-6,0,expandedOwned[code] and 178 or 32),ZIndex=6},ownedList)
			New("UIStroke",{Color=THEME.STROKE,Thickness=1,Transparency=0},row)

			local toggle=New("TextButton",{BackgroundTransparency=1,Size=UDim2.new(1,-8,0,30),Position=UDim2.fromOffset(4,1),Text=(expandedOwned[code] and"[-] " or"[+] ")..name.."  |  "..code,Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,ZIndex=7},row)

			toggle.MouseButton1Click:Connect(function()
				expandedOwned[code]=not expandedOwned[code]
				api.Refresh()
			end)

			if expandedOwned[code] then
				local detail=New("Frame",{BackgroundTransparency=1,Position=UDim2.fromOffset(10,34),Size=UDim2.new(1,-20,0,136),ZIndex=7},row)
				New("UIListLayout",{Padding=UDim.new(0,2),SortOrder=Enum.SortOrder.LayoutOrder},detail)

				addDetailLine(detail,"Code: "..code,1)
				addDetailLine(detail,"Name: "..name,2)

				for i=1,4 do
					local item=editor[i] or {}
					addDetailLine(detail,"Preset "..i..": "..bindingToLabel(item.key or item.Key).." | X "..fmtNumber(item.x or item.X or 0,2).." | Y "..fmtNumber(item.y or item.Y or 0,2).." | Z "..fmtNumber(item.z or item.Z or 0,2),i+2)
				end

				local actionRow=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,28),ZIndex=8,LayoutOrder=7},detail)
				New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},actionRow)

				local equipBtn=makePresetActionButton(actionRow,"EQUIP")
				local deleteBtn=makePresetActionButton(actionRow,"DELETE")

				equipBtn.MouseButton1Click:Connect(function()
					applyOwnedPreset(preset,editor)
					requestRefresh()
				end)

				deleteBtn.MouseButton1Click:Connect(function()
					if deleteOwnedPreset(code,presetIndex) then
						requestRefresh()
					end
				end)
			end
		end
	end

	function api.AddPreset(name,collectFn)
		local cleanName=trim(name)
		if cleanName=="" then
			return false,"Name cannot be empty."
		end

		local ok,editor=pcall(collectFn)
		if not ok then
			return false,"Could not collect preset: "..tostring(editor)
		end

		if ctx.createOwnedPreset then
			local callOk,success,result=pcall(ctx.createOwnedPreset,cleanName,editor)
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
		local preset={Code=code,Name=cleanName,Data={PresetEditor=editor}}

		table.insert(OWNED_PRESETS,preset)
		expandedOwned[code]=true
		if ctx.requestPlayerAutosave then
			ctx.requestPlayerAutosave()
		end
		requestRefresh()

		return true,preset
	end

	local function closePresetModal()
		if modalOverlay then
			modalOverlay:Destroy()
			modalOverlay=nil
		end
	end

	local function modalButton(parent,text,x)
		local btn=New("TextButton",{Size=UDim2.fromOffset(96,30),Position=UDim2.fromOffset(x,118),BackgroundColor3=THEME.BG,BorderSizePixel=0,Text=text,Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.TEXT,AutoButtonColor=false,ZIndex=101},parent)
		local wrap=wrapTextButton(btn,THEME.BG,2)

		btn.MouseEnter:Connect(function()
			wrap.BackgroundColor3=Color3.fromRGB(43,43,43)
		end)

		btn.MouseLeave:Connect(function()
			wrap.BackgroundColor3=THEME.PANEL
		end)

		return btn
	end

	local function showNamePrompt(collectFn)
		closePresetModal()

		modalOverlay=New("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=0.35,BorderSizePixel=0,ZIndex=90},SG)

		local box=New("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset(360,188),BackgroundColor3=THEME.BG,BorderSizePixel=0,ZIndex=100},modalOverlay)
		New("UIStroke",{Color=THEME.STROKE,Thickness=2,Transparency=0},box)

		New("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,14),Size=UDim2.new(1,-32,0,22),Text="Name this preset",Font=Enum.Font.GothamMedium,TextSize=14,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=101},box)

		local nameBox=New("TextBox",{Size=UDim2.fromOffset(328,30),Position=UDim2.fromOffset(16,52),BackgroundColor3=THEME.BG,BorderSizePixel=0,ClearTextOnFocus=false,Text="",PlaceholderText="Preset name",TextColor3=THEME.TEXT,PlaceholderColor3=THEME.MUTED,TextXAlignment=Enum.TextXAlignment.Left,Font=Enum.Font.Gotham,TextSize=13,ZIndex=101},box)
		wrapTextBox(nameBox,THEME.BG,2)

		local warning=New("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,88),Size=UDim2.new(1,-32,0,18),Text="",Font=Enum.Font.Gotham,TextSize=11,TextColor3=THEME.RED,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=101},box)

		local cancel=modalButton(box,"CANCEL",146)
		local save=modalButton(box,"SAVE",248)

		cancel.MouseButton1Click:Connect(closePresetModal)

		save.MouseButton1Click:Connect(function()
			local ok,result=api.AddPreset(nameBox.Text,collectFn)
			if not ok then
				warning.Text=tostring(result)
				return
			end
			closePresetModal()
		end)

		task.defer(function()
			pcall(function()
				nameBox:CaptureFocus()
			end)
		end)
	end

	function api.ShowSaveConfirm(collectFn)
		closePresetModal()

		modalOverlay=New("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=0.35,BorderSizePixel=0,ZIndex=90},SG)

		local box=New("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset(360,166),BackgroundColor3=THEME.BG,BorderSizePixel=0,ZIndex=100},modalOverlay)
		New("UIStroke",{Color=THEME.STROKE,Thickness=2,Transparency=0},box)

		New("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,14),Size=UDim2.new(1,-32,0,22),Text="Save current preset?",Font=Enum.Font.GothamMedium,TextSize=14,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=101},box)

		New("TextLabel",{BackgroundTransparency=1,Position=UDim2.fromOffset(16,44),Size=UDim2.new(1,-32,0,42),Text="This saves the preset to your owned preset list.",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.MUTED,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,ZIndex=101},box)

		local no=modalButton(box,"NO",146)
		local yes=modalButton(box,"YES",248)

		no.MouseButton1Click:Connect(closePresetModal)
		yes.MouseButton1Click:Connect(function()
			showNamePrompt(collectFn)
		end)
	end

	api.Refresh()
	return api
end

return HitboxPreset
