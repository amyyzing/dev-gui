local adapter={}

local function decimalPlaces(step)
	local text=tostring(tonumber(step) or 1)
	local fraction=text:match("%.(%d+)")
	return fraction and math.min(#fraction,4) or 0
end

local function makeHandle(instance,container,destroyCallback)
	local handle={
		instance=instance,
		container=container or instance,
	}

	function handle.setVisible(value)
		local target=handle.container or handle.instance
		if target then target.Visible=value~=false end
	end

	function handle.setDisabled(value)
		local disabled=value==true
		local target=handle.instance
		if target then
			pcall(function() target.Active=not disabled end)
			pcall(function() target.Selectable=not disabled end)
			target:SetAttribute("UIDisabled",disabled)
		end
		handle.disabled=disabled
	end

	function handle.destroy()
		if destroyCallback then
			destroyCallback()
		elseif handle.container then
			handle.container:Destroy()
		elseif handle.instance then
			handle.instance:Destroy()
		end
		handle.instance=nil
		handle.container=nil
	end
	handle.Destroy=handle.destroy

	return handle
end

function adapter.new(environment)
	assert(type(environment)=="table","environment must be a table")
	local api={}

	local function make(class,properties,parent)
		local constructor=rawget(environment,"make")
		assert(type(constructor)=="function","UI constructor is not ready")
		return constructor(class,properties,parent)
	end

	local function palette()
		return rawget(environment,"colors") or{}
	end

	local function applyCommon(instance,options)
		if not instance then return end
		if options.id and options.id~="" then instance.Name=tostring(options.id) end
		if options.order~=nil then instance.LayoutOrder=tonumber(options.order) or 0 end
		if options.visible==false then instance.Visible=false end
	end

	local function connect(signal,callback,connections)
		if not(signal and type(callback)=="function") then return nil end
		local connection=signal:Connect(callback)
		connections[#connections+1]=connection
		return connection
	end

	local function destroyConnections(connections)
		for index=#connections,1,-1 do
			pcall(function() connections[index]:Disconnect() end)
			connections[index]=nil
		end
	end

	local function createContainer(parent,options,direction)
		local frame=make("Frame",{
			BackgroundTransparency=options.backgroundTransparency or 1,
			BackgroundColor3=options.backgroundColor or palette().card,
			BorderSizePixel=0,
			Size=options.size or UDim2.new(1,0,0,0),
			AutomaticSize=options.automaticSize==false and Enum.AutomaticSize.None or Enum.AutomaticSize.Y,
			ClipsDescendants=options.clipsDescendants==true,
			ZIndex=options.zIndex or 5,
		},parent)
		applyCommon(frame,options)
		make("UIListLayout",{
			FillDirection=direction or Enum.FillDirection.Vertical,
			Padding=UDim.new(0,tonumber(options.gap) or 6),
			SortOrder=Enum.SortOrder.LayoutOrder,
			VerticalAlignment=options.verticalAlignment or Enum.VerticalAlignment.Top,
			HorizontalAlignment=options.horizontalAlignment or Enum.HorizontalAlignment.Left,
		},frame)
		return makeHandle(frame)
	end

	function api.createPage(_,options)
		assert(options.parent,"createPage requires options.parent")
		return createContainer(options.parent,options,Enum.FillDirection.Vertical)
	end

	function api.createCategory(parent,options)
		return api.createSection(parent,options)
	end

	function api.createSection(parent,options)
		local makeSection=rawget(environment,"makeSection")
		assert(type(makeSection)=="function","section constructor is not ready")
		local body,controls=makeSection(
			parent,
			tonumber(options.order) or 0,
			tostring(options.title or options.label or "Section"),
			tostring(options.description or ""),
			options.sectionOptions or options
		)
		-- LayoutOrder is positional in the legacy library; correct it explicitly.
		if controls and controls.section then
			controls.section.LayoutOrder=tonumber(options.order) or 0
			applyCommon(controls.section,options)
		end
		local container=controls and controls.section or body
		return makeHandle(body,container,function()
			if controls and type(controls.Destroy)=="function" then controls.Destroy() end
			if container then container:Destroy() end
		end)
	end

	function api.createLabel(parent,options)
		local label=make("TextLabel",{
			BackgroundTransparency=1,
			Size=options.size or UDim2.new(1,0,0,tonumber(options.height) or 20),
			Text=tostring(options.label or options.value or ""),
			Font=options.font or Enum.Font.Gotham,
			TextSize=tonumber(options.textSize) or 12,
			TextColor3=options.textColor or palette().text,
			TextXAlignment=options.textXAlignment or Enum.TextXAlignment.Left,
			TextWrapped=options.textWrapped==true,
			ZIndex=options.zIndex or 6,
			SkipTextRole=options.textColor~=nil,
		},parent)
		applyCommon(label,options)
		local handle=makeHandle(label)
		function handle.set(value) label.Text=tostring(value or "") end
		function handle.get() return label.Text end
		return handle
	end

	function api.createButton(parent,options)
		local connections={}
		local background=options.backgroundColor or palette().button or palette().bg
		local button=make("TextButton",{
			BackgroundColor3=background,
			BorderSizePixel=0,
			Size=options.size or UDim2.new(1,0,0,tonumber(options.height) or 30),
			Text=tostring(options.label or options.value or "Button"),
			Font=options.font or Enum.Font.GothamMedium,
			TextSize=tonumber(options.textSize) or 12,
			TextColor3=options.textColor or palette().text,
			TextXAlignment=options.textXAlignment or Enum.TextXAlignment.Center,
			TextTruncate=options.textTruncate or Enum.TextTruncate.None,
			AutoButtonColor=false,
			Selectable=options.disabled~=true,
			ZIndex=options.zIndex or 6,
			SkipTextRole=options.textColor~=nil,
		},parent)
		applyCommon(button,options)

		local container=button
		local wrapTextButton=rawget(environment,"wrapTextButton")
		if type(wrapTextButton)=="function" and options.wrap~=false then
			container=wrapTextButton(button,background,tonumber(options.inset) or 2) or button
		end
		if container~=button then applyCommon(container,options) end

		local handle=makeHandle(button,container,function()
			destroyConnections(connections)
			if container then container:Destroy() end
		end)
		handle.disabled=options.disabled==true
		connect(button.Activated,function()
			if not handle.disabled and type(options.onClick)=="function" then options.onClick(handle) end
		end,connections)
		function handle.set(value) button.Text=tostring(value or "") end
		function handle.get() return button.Text end
		if options.disabled==true then handle.setDisabled(true) end
		return handle
	end

	function api.createToggle(parent,options)
		local build=rawget(environment,"buildToggleRow")
		assert(type(build)=="function","toggle constructor is not ready")
		local value=options.value==true
		local control=build(parent,tostring(options.label or ""),value,function(nextValue)
			value=nextValue==true
			if type(options.onChanged)=="function" then options.onChanged(value) end
		end)
		local container=control.wrap and control.wrap.Parent or control.wrap
		if container then applyCommon(container,options) end
		local handle=makeHandle(control.wrap,container,function()
			if type(control.Destroy)=="function" then control.Destroy() end
			if container then container:Destroy() end
		end)
		function handle.set(nextValue,notify)
			value=nextValue==true
			control.set(value)
			if notify==true and type(options.onChanged)=="function" then options.onChanged(value) end
		end
		function handle.get()
			if type(control.get)=="function" then value=control.get()==true end
			return value
		end
		return handle
	end

	function api.createSlider(parent,options)
		local build=rawget(environment,"buildSlider")
		assert(type(build)=="function","slider constructor is not ready")
		local value=tonumber(options.value) or tonumber(options.min) or 0
		local control=build(
			parent,
			tostring(options.label or ""),
			assert(tonumber(options.min),"slider min is required"),
			assert(tonumber(options.max),"slider max is required"),
			value,
			decimalPlaces(options.step),
			function(nextValue)
				value=nextValue
				if type(options.onChanged)=="function" then options.onChanged(nextValue) end
			end
		)
		local instance=control.track or control.box or parent
		local container=instance and instance.Parent or instance
		if container then applyCommon(container,options) end
		local handle=makeHandle(instance,container,function()
			if type(control.Destroy)=="function" then control.Destroy() end
			if container and container~=parent then container:Destroy() end
		end)
		function handle.set(nextValue,notify)
			value=tonumber(nextValue) or value
			control.set(value)
			if notify==true and type(options.onChanged)=="function" then options.onChanged(value) end
		end
		function handle.get()
			if type(control.get)=="function" then value=control.get() end
			return value
		end
		return handle
	end

	function api.createInput(parent,options)
		local makeBox=rawget(environment,"makeBox")
		assert(type(makeBox)=="function","input constructor is not ready")
		local box=makeBox(parent,tonumber(options.width) or 220,tostring(options.value or ""),tostring(options.placeholder or ""))
		local connections={}
		local container=box.Parent~=parent and box.Parent or box
		applyCommon(box,options)
		if container~=box then applyCommon(container,options) end
		connect(box.FocusLost,function(enterPressed)
			local value=box.Text
			if options.numeric==true then value=tonumber(value) end
			if type(options.onChanged)=="function" then options.onChanged(value,enterPressed) end
		end,connections)
		local handle=makeHandle(box,container,function()
			destroyConnections(connections)
			if container then container:Destroy() end
		end)
		function handle.set(value) box.Text=tostring(value or "") end
		function handle.get() return options.numeric==true and tonumber(box.Text) or box.Text end
		return handle
	end

	local function dropdownValue(item)
		if type(item)=="table" then
			return item.value~=nil and item.value or item.label
		end
		return item
	end

	local function dropdownLabel(item)
		if type(item)=="table" then return tostring(item.label or item.value or "") end
		return tostring(item or "")
	end

	function api.createDropdown(parent,options)
		local items=type(options.items)=="table" and options.items or{}
		local selected=options.selected~=nil and options.selected or options.value
		local index=1
		for itemIndex,item in ipairs(items) do
			if dropdownValue(item)==selected then index=itemIndex break end
		end
		local button
		button=api.createButton(parent,{
			id=options.id,
			order=options.order,
			visible=options.visible,
			disabled=options.disabled or #items==0,
			label=#items>0 and dropdownLabel(items[index]) or tostring(options.placeholder or "No options"),
			onClick=function()
			if #items==0 then return end
			index=(index%#items)+1
			selected=dropdownValue(items[index])
			button.instance.Text=dropdownLabel(items[index])
			if type(options.onChanged)=="function" then options.onChanged(selected,items[index]) end
			end,
		})
		function button.set(value,notify)
			selected=value
			for itemIndex,item in ipairs(items) do
				if dropdownValue(item)==selected then index=itemIndex break end
			end
			button.instance.Text=#items>0 and dropdownLabel(items[index]) or tostring(value or "")
			if notify==true and type(options.onChanged)=="function" then options.onChanged(selected,items[index]) end
		end
		function button.get() return selected end
		return button
	end

	function api.createKeybind(parent,options)
		local binding=options.binding or options.value or Enum.KeyCode.Unknown
		local captureConnection=nil
		local function label()
			local formatter=rawget(environment,"bindingToLabel")
			return tostring(options.label or "Keybind")..": "..(type(formatter)=="function" and formatter(binding) or tostring(binding))
		end
		local button
		button=api.createButton(parent,{
			id=options.id,
			order=options.order,
			visible=options.visible,
			disabled=options.disabled,
			label=label(),
			onClick=function()
				button.set("press a key...")
				if captureConnection then captureConnection:Disconnect() end
				local inputService=rawget(environment,"inputService")
				captureConnection=inputService.InputBegan:Connect(function(inputObject,processed)
					if processed then return end
					captureConnection:Disconnect()
					captureConnection=nil
					local converter=rawget(environment,"inputToBinding")
					binding=type(converter)=="function" and converter(inputObject) or inputObject.KeyCode
					button.instance.Text=label()
					if type(options.onChanged)=="function" then options.onChanged(binding) end
				end)
			end,
		})
		local originalDestroy=button.destroy
		function button.destroy()
			if captureConnection then captureConnection:Disconnect() captureConnection=nil end
			originalDestroy()
		end
		button.Destroy=button.destroy
		function button.set(value,notify)
			binding=value or Enum.KeyCode.Unknown
			button.instance.Text=label()
			if notify==true and type(options.onChanged)=="function" then options.onChanged(binding) end
		end
		function button.get() return binding end
		return button
	end

	function api.createRow(parent,options)
		return createContainer(parent,options,Enum.FillDirection.Horizontal)
	end

	function api.createColumn(parent,options)
		return createContainer(parent,options,Enum.FillDirection.Vertical)
	end

	function api.createSpacer(parent,options)
		local spacer=make("Frame",{
			BackgroundTransparency=1,
			BorderSizePixel=0,
			Size=options.size or UDim2.new(1,0,0,tonumber(options.height) or 8),
		},parent)
		applyCommon(spacer,options)
		return makeHandle(spacer)
	end

	function api.createDivider(parent,options)
		local divider=make("Frame",{
			BackgroundColor3=options.color or palette().stroke,
			BackgroundTransparency=options.transparency or 0.65,
			BorderSizePixel=0,
			Size=options.size or UDim2.new(1,0,0,1),
		},parent)
		applyCommon(divider,options)
		return makeHandle(divider)
	end

	function api.createDescription(parent,options)
		options.textColor=options.textColor or palette().muted
		options.textSize=options.textSize or 11
		options.textWrapped=options.textWrapped~=false
		return api.createLabel(parent,options)
	end

	function api.createStatus(parent,options)
		return api.createDescription(parent,options)
	end

	function api.createBadge(parent,options)
		options.textXAlignment=options.textXAlignment or Enum.TextXAlignment.Center
		options.height=options.height or 20
		return api.createLabel(parent,options)
	end

	return api
end

return adapter
