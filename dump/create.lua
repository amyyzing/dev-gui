local create={}

local METHODS={
	Page="createPage",
	Category="createCategory",
	Section="createSection",
	Label="createLabel",
	Button="createButton",
	Toggle="createToggle",
	Slider="createSlider",
	Input="createInput",
	Dropdown="createDropdown",
	Keybind="createKeybind",
	Row="createRow",
	Column="createColumn",
	Spacer="createSpacer",
	Divider="createDivider",
	Description="createDescription",
	Status="createStatus",
	Badge="createBadge",
}

local function normalized(options)
	assert(type(options)=="table","UI options must be a table")
	local result=table.clone(options)
	if result.visible==nil then
		result.visible=true
	end
	if result.disabled==nil then
		result.disabled=false
	end
	result.order=tonumber(result.order) or 0
	return result
end

function create.new(adapter)
	assert(type(adapter)=="table","UI adapter is missing")
	local api={}

	function api.Build(kind,parent,options)
		local methodName=METHODS[kind]
		assert(methodName,"unknown UI element: "..tostring(kind))
		local method=adapter[methodName]
		assert(type(method)=="function","UI adapter does not implement "..methodName)
		return method(parent,normalized(options))
	end

	return api
end

return create
