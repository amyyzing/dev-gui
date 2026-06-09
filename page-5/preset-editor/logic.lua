local PresetEditor={}

function PresetEditor.new(ctx,editorSection,keybinds,hitboxPresets)
	local New=ctx.New
	local THEME=ctx.THEME
	local PRESETS=ctx.PRESETS
	local DEFAULT_PRESETS=ctx.DEFAULT_PRESETS
	local fmtNumber=ctx.fmtNumber
	local bindingToLabel=ctx.bindingToLabel
	local wrapTextBox=ctx.wrapTextBox
	local placeWrappedBox=ctx.placeWrappedBox
	local placeWrappedButton=ctx.placeWrappedButton
	local setWrappedButtonBg=ctx.setWrappedButtonBg

	local api={}
	local presetRows={}
	local refreshAll=nil
	local suppressKeyButtonClickUntil=0

	function api.SetRefreshAll(fn)
		refreshAll=fn
	end

	local function requestRefresh()
		api.Refresh()
		if refreshAll then refreshAll() end
	end

	local function setPresetSize(index,x,y,z)
		if ctx.setPresetSize then
			local ok,success,err=pcall(ctx.setPresetSize,index,x,y,z)
			if ok and success~=false then
				return
			end

			if not ok then
				warn("PresetEditor: setPresetSize failed:",success)
			elseif err then
				warn("PresetEditor: setPresetSize failed:",err)
			end
		end

		local p=PRESETS[index]
		if not p then return end

		p.size=Vector3.new(
			math.clamp(tonumber(x) or p.size.X,0.1,50),
			math.clamp(tonumber(y) or p.size.Y,0.1,50),
			math.clamp(tonumber(z) or p.size.Z,0.1,50)
		)

		if ctx.requestPlayerAutosave then
			ctx.requestPlayerAutosave()
		end
	end

	local function setPresetKey(index,binding)
		if ctx.setPresetKey then
			local ok,success,err=pcall(ctx.setPresetKey,index,binding)
			if ok and success~=false then
				return
			end

			if not ok then
				warn("PresetEditor: setPresetKey failed:",success)
			elseif err then
				warn("PresetEditor: setPresetKey failed:",err)
			end
		end

		if PRESETS[index] then
			PRESETS[index].key=binding or Enum.KeyCode.Unknown
		end

		if ctx.requestPlayerAutosave then
			ctx.requestPlayerAutosave()
		end
	end

	local function resetPreset(index)
		if ctx.resetPreset then
			local ok,success,err=pcall(ctx.resetPreset,index)
			if ok and success~=false then
				return
			end

			if not ok then
				warn("PresetEditor: resetPreset failed:",success)
			elseif err then
				warn("PresetEditor: resetPreset failed:",err)
			end
		end

		if PRESETS[index] and DEFAULT_PRESETS[index] then
			PRESETS[index].key=DEFAULT_PRESETS[index].key
			PRESETS[index].size=DEFAULT_PRESETS[index].size
		end

		if ctx.requestPlayerAutosave then
			ctx.requestPlayerAutosave()
		end
	end

	local function makeBox(parent,w,txt,placeholder)
		if ctx.makeBox then
			return ctx.makeBox(parent,w,txt,placeholder)
		end

		local normalBg=THEME.INPUT or THEME.PANEL
		local b=New("TextBox",{Size=UDim2.fromOffset(w,28),BackgroundColor3=normalBg,BorderSizePixel=0,ClearTextOnFocus=false,Text=txt or"",PlaceholderText=placeholder or"",Font=Enum.Font.Gotham,TextSize=13,TextColor3=THEME.TEXT,PlaceholderColor3=THEME.MUTED,ZIndex=6,ThemeRole="INPUT"},parent)
		local wrap,stroke=wrapTextBox(b,normalBg,2)
		wrap:SetAttribute("ThemeRole","INPUT")

		b.Focused:Connect(function()
			wrap.BackgroundColor3=THEME.INPUT or THEME.PANEL
			stroke.Thickness=2
		end)

		b.FocusLost:Connect(function()
			wrap.BackgroundColor3=THEME.INPUT or THEME.PANEL
			stroke.Thickness=2
		end)

		return b
	end

	function api.Collect()
		local savedPresets={}

		for i=1,4 do
			local p=PRESETS[i]
			table.insert(savedPresets,{
				x=p.size.X,
				y=p.size.Y,
				z=p.size.Z,
				key=p.key,
			})
		end

		return savedPresets
	end

	local saveRow=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,30),ZIndex=5},editorSection)
	local saveBtn=keybinds.MakeBindButton(saveRow,0,0,150)
	placeWrappedButton(saveBtn,UDim2.new(1,-150,0,0))
	saveBtn.Text="SAVE PRESET"

	saveBtn.Activated:Connect(function()
		if hitboxPresets and hitboxPresets.ShowSaveConfirm then
			hitboxPresets.ShowSaveConfirm(api.Collect)
		elseif hitboxPresets and hitboxPresets.AddPreset then
			hitboxPresets.AddPreset("Custom Preset",api.Collect)
		else
			warn("PresetEditor: hitboxPresets module is missing ShowSaveConfirm/AddPreset.")
		end
	end)

	local function buildPresetRow(i)
		local row=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,62),ZIndex=5},editorSection)

		New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,14),Text="Preset "..i.." (Hitbox)",Font=Enum.Font.Gotham,TextSize=12,TextColor3=THEME.TEXT,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},row)

		local keyBtn=keybinds.MakeBindButton(row,0,18,78)

		local xBox=makeBox(row,78,"","X")
		placeWrappedBox(xBox,UDim2.fromOffset(84,18))

		local yBox=makeBox(row,78,"","Y")
		placeWrappedBox(yBox,UDim2.fromOffset(168,18))

		local zBox=makeBox(row,78,"","Z")
		placeWrappedBox(zBox,UDim2.fromOffset(252,18))

		local resetBtn=keybinds.MakeBindButton(row,0,18,70)
		placeWrappedButton(resetBtn,UDim2.new(1,-70,0,18))
		resetBtn.Text="RESET"

		local function applyPresetSize()
			local p=PRESETS[i]
			if not p then return end

			setPresetSize(i,xBox.Text,yBox.Text,zBox.Text)
			p=PRESETS[i]

			xBox.Text=fmtNumber(p.size.X,2)
			yBox.Text=fmtNumber(p.size.Y,2)
			zBox.Text=fmtNumber(p.size.Z,2)
		end

		xBox.FocusLost:Connect(applyPresetSize)
		yBox.FocusLost:Connect(applyPresetSize)
		zBox.FocusLost:Connect(applyPresetSize)

		keyBtn.Activated:Connect(function()
			if os.clock()<suppressKeyButtonClickUntil then
				return
			end

			local active=keybinds.GetActiveCapture and keybinds.GetActiveCapture()
			if active and active.button==keyBtn then
				setPresetKey(i,"MouseButton1")
				if keybinds.CancelCapture then
					keybinds.CancelCapture()
				end
				requestRefresh()
				return
			end

			keybinds.StartCapture(keyBtn,function()
				return PRESETS[i].key
			end,function(v)
				setPresetKey(i,v)
			end)
		end)

		keyBtn.InputBegan:Connect(function(input)
			local active=keybinds.GetActiveCapture and keybinds.GetActiveCapture()
			if not(active and active.button==keyBtn) then return end

			if input.UserInputType==Enum.UserInputType.MouseButton1 then
				suppressKeyButtonClickUntil=os.clock()+0.25
			end

			if keybinds.CaptureInput and keybinds.CaptureInput(input) then
				requestRefresh()
			end
		end)

		resetBtn.Activated:Connect(function()
			resetPreset(i)
			api.Refresh()
			if refreshAll then refreshAll() end
		end)

		table.insert(presetRows,{keyBtn=keyBtn,xBox=xBox,yBox=yBox,zBox=zBox})
	end

	for i=1,4 do
		buildPresetRow(i)
	end

	function api.Refresh()
		for i,item in ipairs(presetRows) do
			local p=PRESETS[i]
			local active=keybinds.GetActiveCapture and keybinds.GetActiveCapture()

			if not(active and active.button==item.keyBtn) then
				item.keyBtn.Text=bindingToLabel(p.key)
				setWrappedButtonBg(item.keyBtn,THEME.BUTTON or THEME.BG)
				item.keyBtn.TextColor3=THEME.TEXT
			end

			item.xBox.Text=fmtNumber(p.size.X,2)
			item.yBox.Text=fmtNumber(p.size.Y,2)
			item.zBox.Text=fmtNumber(p.size.Z,2)
		end
	end

	api.Refresh()
	return api
end

return PresetEditor
