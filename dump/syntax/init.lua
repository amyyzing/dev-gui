local syntax={}

local function group(handles)
	local api={handles=handles}

	function api.setVisible(value)
		for _,handle in ipairs(handles) do
			if handle and type(handle.setVisible)=="function" then handle.setVisible(value) end
		end
	end

	function api.destroy()
		for index=#handles,1,-1 do
			local handle=handles[index]
			if handle and type(handle.destroy)=="function" then handle.destroy() end
			handles[index]=nil
		end
	end
	api.Destroy=api.destroy

	return api
end

function syntax.new(creator)
	assert(type(creator)=="table" and type(creator.Build)=="function","UI creator is missing")
	local UI={Special={}}

	function UI.createPage(options)
		return creator.Build("Page",nil,options)
	end

	local function bindConstructor(name)
		UI["create"..name]=function(parent,options)
			assert(parent,"UI parent is required for "..name)
			return creator.Build(name,parent,options)
		end
	end

	for _,name in ipairs({
		"Category","Section","Label","Button","Toggle","Slider","Input","Dropdown","Keybind",
		"Row","Column","Spacer","Divider","Description","Status","Badge",
	}) do
		bindConstructor(name)
	end

	function UI.Special.ColorEditor(parent,options)
		options=options or{}
		local color=options.color or Color3.fromRGB(255,255,255)
		local transparency=tonumber(options.transparency) or 0
		local current={
			r=math.floor(color.R*255+0.5),
			g=math.floor(color.G*255+0.5),
			b=math.floor(color.B*255+0.5),
		}
		local handles={}
		local section=UI.createSection(parent,{
			id=options.id,
			title=options.title or options.label or "Color",
			description=options.description or "",
			order=options.order,
		})
		handles[#handles+1]=section

		local function emitColor()
			if type(options.onColorChanged)=="function" then
				options.onColorChanged(Color3.fromRGB(current.r,current.g,current.b))
			end
		end

		for _,channel in ipairs({{"r","Red"},{"g","Green"},{"b","Blue"}}) do
			handles[#handles+1]=UI.createSlider(section.instance,{
				label=channel[2],min=0,max=255,step=1,value=current[channel[1]],
				onChanged=function(value)
					current[channel[1]]=math.floor(value+0.5)
					emitColor()
				end,
			})
		end

		handles[#handles+1]=UI.createSlider(section.instance,{
			label="Transparency",min=0,max=1,step=0.01,value=transparency,
			onChanged=function(value)
				transparency=value
				if type(options.onTransparencyChanged)=="function" then options.onTransparencyChanged(value) end
			end,
		})

		return group(handles)
	end

	function UI.Special.Vector3Editor(parent,options)
		options=options or{}
		local value=options.value or Vector3.new(0,0,0)
		local current={x=value.X,y=value.Y,z=value.Z}
		local handles={}
		local section=UI.createSection(parent,{
			id=options.id,
			title=options.title or options.label or "Vector3",
			description=options.description or "",
			order=options.order,
		})
		handles[#handles+1]=section

		local function emit()
			if type(options.onChanged)=="function" then
				options.onChanged(Vector3.new(current.x,current.y,current.z))
			end
		end

		for _,axis in ipairs({{"x","X"},{"y","Y"},{"z","Z"}}) do
			handles[#handles+1]=UI.createSlider(section.instance,{
				label=axis[2],
				min=tonumber(options.min) or 0,
				max=tonumber(options.max) or 100,
				step=tonumber(options.step) or 0.1,
				value=current[axis[1]],
				onChanged=function(nextValue)
					current[axis[1]]=nextValue
					emit()
				end,
			})
		end

		return group(handles)
	end

	return UI
end

return syntax
