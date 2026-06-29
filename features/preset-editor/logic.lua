local presetEditor={}

function presetEditor.new(app,editorSection,keybinds,hitboxPresets)
	local make=app.New
	local colors=app.colors
	local hitboxPresets=app.hitboxPresets
	local defaultHitboxPresets=app.defaultHitboxPresets
	local fmtNumber=app.fmtNumber
	local bindingToLabel=app.bindingToLabel
	local wrapTextBox=app.wrapTextBox
	local placeWrappedBox=app.placeWrappedBox
	local placeWrappedButton=app.placeWrappedButton
	local setWrappedButtonBg=app.setWrappedButtonBg

	local api={}
	local presetRows={}
	local refreshAll=nil
	local suppressKeyButtonClickUntil=0
	local connections={}
	local function connect(signal,fn)
		local connection=signal:Connect(fn)
		table.insert(connections,connection)
		return connection
	end

	function api.SetRefreshAll(fn)
		refreshAll=fn
	end

	local function requestRefresh()
		api.Refresh()
		if refreshAll then refreshAll() end
	end

	local function setPresetSize(index,x,y,z)
		if app.setPresetSize then
			local ok,success,err=pcall(app.setPresetSize,index,x,y,z)
			if ok and success~=false then
				return
			end

			if not ok then
				warn("preset size failed:",success)
			elseif err then
				warn("preset size failed:",err)
			end
		end

		local p=hitboxPresets[index]
		if not p then return end

		p.size=Vector3.new(
			math.clamp(tonumber(x) or p.size.X,0.1,50),
			math.clamp(tonumber(y) or p.size.Y,0.1,50),
			math.clamp(tonumber(z) or p.size.Z,0.1,50)
		)

		if app.requestPlayerAutosave then
			app.requestPlayerAutosave()
		end
	end

	local function setPresetKey(index,binding)
		if app.setPresetKey then
			local ok,success,err=pcall(app.setPresetKey,index,binding)
			if ok and success~=false then
				return
			end

			if not ok then
				warn("preset key failed:",success)
			elseif err then
				warn("preset key failed:",err)
			end
		end

		if hitboxPresets[index] then
			hitboxPresets[index].key=binding or Enum.KeyCode.Unknown
		end

		if app.requestPlayerAutosave then
			app.requestPlayerAutosave()
		end
	end

	local function resetPreset(index)
		if app.resetPreset then
			local ok,success,err=pcall(app.resetPreset,index)
			if ok and success~=false then
				return
			end

			if not ok then
				warn("preset reset failed:",success)
			elseif err then
				warn("preset reset failed:",err)
			end
		end

		if hitboxPresets[index] and defaultHitboxPresets[index] then
			hitboxPresets[index].key=defaultHitboxPresets[index].key
			hitboxPresets[index].size=defaultHitboxPresets[index].size
		end

		if app.requestPlayerAutosave then
			app.requestPlayerAutosave()
		end
	end

	local function makeBox(parent,w,textValue,placeholder)
		if app.makeBox then
			return app.makeBox(parent,w,textValue,placeholder)
		end

		local normalBg=colors.input or colors.panel
		local b=make("TextBox",{Size=UDim2.fromOffset(w,28),BackgroundColor3=normalBg,BorderSizePixel=0,ClearTextOnFocus=false,Text=textValue or"",PlaceholderText=placeholder or"",Font=Enum.Font.Gotham,TextSize=13,TextColor3=colors.text,PlaceholderColor3=colors.muted,ZIndex=6,ThemeRole="INPUT"},parent)
		local wrap,stroke=wrapTextBox(b,normalBg,2)
		wrap:SetAttribute("ThemeRole","INPUT")

		connect(b.Focused,function()
			wrap.BackgroundColor3=colors.input or colors.panel
			stroke.Thickness=2
		end)

		connect(b.FocusLost,function()
			wrap.BackgroundColor3=colors.input or colors.panel
			stroke.Thickness=2
		end)

		return b
	end

	function api.Collect()
		local savedPresets={}

		for i=1,4 do
			local p=hitboxPresets[i]
			table.insert(savedPresets,{
				x=p.size.X,
				y=p.size.Y,
				z=p.size.Z,
				key=p.key,
			})
		end

		return savedPresets
	end

	local saveRow=make("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,30),ZIndex=5},editorSection)
	local saveBtn=keybinds.MakeBindButton(saveRow,0,0,150)
	placeWrappedButton(saveBtn,UDim2.new(1,-150,0,0))
	saveBtn.Text="save"

	connect(saveBtn.Activated,function()
		if hitboxPresets and hitboxPresets.ShowSaveConfirm then
			hitboxPresets.ShowSaveConfirm(api.Collect)
		elseif hitboxPresets and hitboxPresets.AddPreset then
			hitboxPresets.AddPreset("custom",api.Collect)
		else
			warn("preset editor missing save helper")
		end
	end)

	local function buildPresetRow(i)
		local row=make("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,62),ZIndex=5},editorSection)

		make("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,14),Text="preset "..i,Font=Enum.Font.Gotham,TextSize=12,TextColor3=colors.text,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6},row)

		local keyBtn=keybinds.MakeBindButton(row,0,18,78)

		local xBox=makeBox(row,78,"","X")
		placeWrappedBox(xBox,UDim2.fromOffset(84,18))

		local yBox=makeBox(row,78,"","Y")
		placeWrappedBox(yBox,UDim2.fromOffset(168,18))

		local zBox=makeBox(row,78,"","Z")
		placeWrappedBox(zBox,UDim2.fromOffset(252,18))

		local resetBtn=keybinds.MakeBindButton(row,0,18,70)
		placeWrappedButton(resetBtn,UDim2.new(1,-70,0,18))
		resetBtn.Text="reset"

		local function applyPresetSize()
			local p=hitboxPresets[i]
			if not p then return end

			setPresetSize(i,xBox.Text,yBox.Text,zBox.Text)
			p=hitboxPresets[i]

			xBox.Text=fmtNumber(p.size.X,2)
			yBox.Text=fmtNumber(p.size.Y,2)
			zBox.Text=fmtNumber(p.size.Z,2)
		end

		connect(xBox.FocusLost,applyPresetSize)
		connect(yBox.FocusLost,applyPresetSize)
		connect(zBox.FocusLost,applyPresetSize)

		connect(keyBtn.Activated,function()
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
				return hitboxPresets[i].key
			end,function(v)
				setPresetKey(i,v)
			end)
		end)

		connect(keyBtn.InputBegan,function(input)
			local active=keybinds.GetActiveCapture and keybinds.GetActiveCapture()
			if not(active and active.button==keyBtn) then return end

			if input.UserInputType==Enum.UserInputType.MouseButton1 then
				suppressKeyButtonClickUntil=os.clock()+0.25
			end

			if keybinds.CaptureInput and keybinds.CaptureInput(input) then
				requestRefresh()
			end
		end)

		connect(resetBtn.Activated,function()
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
			local p=hitboxPresets[i]
			local active=keybinds.GetActiveCapture and keybinds.GetActiveCapture()

			if not(active and active.button==item.keyBtn) then
				item.keyBtn.Text=bindingToLabel(p.key)
				setWrappedButtonBg(item.keyBtn,colors.button or colors.bg)
				item.keyBtn.TextColor3=colors.text
			end

			item.xBox.Text=fmtNumber(p.size.X,2)
			item.yBox.Text=fmtNumber(p.size.Y,2)
			item.zBox.Text=fmtNumber(p.size.Z,2)
		end
	end

	function api.Destroy()
		for _,connection in ipairs(connections) do
			pcall(function()
				connection:Disconnect()
			end)
		end
		table.clear(connections)
		refreshAll=nil
	end

	api.Refresh()
	return api
end

return presetEditor
