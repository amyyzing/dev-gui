local Fusion={}

local function makeKey(kind,name)
	return{
		__fusion_key=true,
		kind=kind,
		name=name,
	}
end

Fusion.Children=makeKey("Children","Children")

local eventKeys={}
local changeKeys={}

function Fusion.OnEvent(name)
	name=tostring(name)
	local key=eventKeys[name]
	if not key then
		key=makeKey("OnEvent",name)
		eventKeys[name]=key
	end
	return key
end

function Fusion.OnChange(name)
	name=tostring(name)
	local key=changeKeys[name]
	if not key then
		key=makeKey("OnChange",name)
		changeKeys[name]=key
	end
	return key
end

local function isState(value)
	return type(value)=="table" and value.__fusion_state==true
end

local function peek(value)
	if isState(value) then
		return value:get()
	end
	return value
end

Fusion.peek=peek

local function cleanupOne(item)
	if item==nil then
		return
	end

	if typeof(item)=="RBXScriptConnection" then
		pcall(function()
			item:Disconnect()
		end)
	elseif typeof(item)=="Instance" then
		pcall(function()
			item:Destroy()
		end)
	elseif type(item)=="function" then
		pcall(item)
	elseif type(item)=="table" then
		if type(item.doCleanup)=="function" then
			pcall(function()
				item:doCleanup()
			end)
		elseif type(item.Destroy)=="function" then
			pcall(function()
				item:Destroy()
			end)
		elseif type(item.destroy)=="function" then
			pcall(function()
				item:destroy()
			end)
		end
	end
end

function Fusion.cleanup(items)
	if type(items)~="table" then
		cleanupOne(items)
		return
	end

	for index=#items,1,-1 do
		cleanupOne(items[index])
		items[index]=nil
	end
end

function Fusion.Value(initial)
	local state={
		__fusion_state=true,
		__fusion_kind="Value",
		_value=initial,
		_listeners={},
	}

	function state:get()
		return self._value
	end

	function state:set(nextValue)
		local oldValue=self._value
		if oldValue==nextValue then
			return
		end

		self._value=nextValue
		for listener in pairs(self._listeners) do
			task.spawn(listener,nextValue,oldValue)
		end
	end

	function state:onChange(listener)
		self._listeners[listener]=true
		return function()
			self._listeners[listener]=nil
		end
	end

	function state:destroy()
		table.clear(self._listeners)
	end

	state.Destroy=state.destroy
	return state
end

function Fusion.Computed(fn)
	local computed=Fusion.Value(nil)
	computed.__fusion_kind="Computed"
	local cleanups={}
	local running=false

	local function recompute()
		if running then
			return
		end
		running=true
		Fusion.cleanup(cleanups)

		local used={}
		local function use(state)
			if isState(state) then
				used[state]=true
				return state:get()
			end
			return state
		end

		local ok,result=pcall(fn,use)
		if ok then
			computed:set(result)
		else
			warn("Fusion computed failed:",result)
		end

		for state in pairs(used) do
			table.insert(cleanups,state:onChange(recompute))
		end

		running=false
	end

	function computed:destroy()
		Fusion.cleanup(cleanups)
		table.clear(self._listeners)
	end

	computed.Destroy=computed.destroy
	recompute()
	return computed
end

function Fusion.Observer(state)
	local observer={}

	function observer:onChange(listener)
		if isState(state) then
			return state:onChange(listener)
		end

		return function() end
	end

	return observer
end

local function applyChild(parent,child)
	child=peek(child)
	if child==nil then
		return nil
	end

	if typeof(child)=="Instance" then
		child.Parent=parent
		return child
	end

	if type(child)=="table" then
		for _,nested in pairs(child) do
			applyChild(parent,nested)
		end
	end

	return nil
end

local function applyProps(scope,obj,props)
	props=props or {}
	local parent=props.Parent
	local children=nil

	for key,value in pairs(props) do
		if key==Fusion.Children then
			children=value
		elseif key=="Parent" then
			parent=value
		elseif type(key)=="table" and key.__fusion_key then
			if key.kind=="OnEvent" then
				local signal=obj[key.name]
				if signal and type(value)=="function" then
					local conn=signal:Connect(value)
					if scope then
						scope:addCleanup(conn)
					end
				end
			elseif key.kind=="OnChange" and type(value)=="function" then
				local conn=obj:GetPropertyChangedSignal(key.name):Connect(function()
					value(obj[key.name])
				end)
				if scope then
					scope:addCleanup(conn)
				end
			end
		else
			local current=peek(value)
			if current~=nil then
				obj[key]=current
			end

			if isState(value) then
				local conn=value:onChange(function(nextValue)
					if obj and obj.Parent and nextValue~=nil then
						obj[key]=nextValue
					end
				end)
				if scope then
					scope:addCleanup(conn)
				end
			end
		end
	end

	if children~=nil then
		applyChild(obj,children)
	end

	if parent~=nil then
		obj.Parent=peek(parent)
	end

	return obj
end

local function newWithScope(scope,className)
	return function(props)
		local obj=Instance.new(className)
		if scope then
			scope:addCleanup(obj)
		end
		applyProps(scope,obj,props)
		return obj
	end
end

function Fusion.New(className)
	return newWithScope(nil,className)
end

function Fusion.Hydrate(obj)
	return function(props)
		return applyProps(nil,obj,props)
	end
end

function Fusion.scoped(base)
	base=base or Fusion
	local scope={
		_cleanups={},
	}

	function scope:addCleanup(item)
		if item~=nil then
			table.insert(self._cleanups,item)
		end
		return item
	end

	function scope:New(className)
		return newWithScope(self,className)
	end

	function scope:Hydrate(obj)
		return function(props)
			return applyProps(self,obj,props)
		end
	end

	function scope:Value(initial)
		return self:addCleanup(base.Value(initial))
	end

	function scope:Computed(fn)
		return self:addCleanup(base.Computed(fn))
	end

	function scope:Observer(state)
		return base.Observer(state)
	end

	function scope:doCleanup()
		Fusion.cleanup(self._cleanups)
	end

	scope.OnEvent=base.OnEvent
	scope.OnChange=base.OnChange
	scope.Children=base.Children
	scope.peek=base.peek

	return scope
end

return Fusion
