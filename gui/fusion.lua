-- small reactive gui layer used by the panel.

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
		local listeners={}
		for listener in pairs(self._listeners) do
			table.insert(listeners,listener)
		end

		for _,listener in ipairs(listeners) do
			local ok,err=pcall(listener,nextValue,oldValue)
			if not ok then
				warn("fusion listener failed:",err)
			end
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
			warn("fusion computed failed:",result)
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

local function applyProps(scope,instance,properties)
	properties=properties or {}
	local parent=properties.Parent
	local children=nil

	for key,value in pairs(properties) do
		if key==Fusion.Children then
			children=value
		elseif key=="Parent" then
			parent=value
		elseif type(key)=="table" and key.__fusion_key then
			if key.kind=="OnEvent" then
				local signal=instance[key.name]
				if signal and type(value)=="function" then
					local connection=signal:Connect(value)
					if scope then
						scope:addCleanup(connection)
					end
				end
			elseif key.kind=="OnChange" and type(value)=="function" then
				local connection=instance:GetPropertyChangedSignal(key.name):Connect(function()
					value(instance[key.name])
				end)
				if scope then
					scope:addCleanup(connection)
				end
			end
		else
			local current=peek(value)
			if current~=nil then
				instance[key]=current
			end

			if isState(value) then
				local connection=value:onChange(function(nextValue)
					if instance and instance.Parent and nextValue~=nil then
						instance[key]=nextValue
					end
				end)
				if scope then
					scope:addCleanup(connection)
				end
			end
		end
	end

	if children~=nil then
		applyChild(instance,children)
	end

	if parent~=nil then
		instance.Parent=peek(parent)
	end

	return instance
end

local function newWithScope(scope,className)
	return function(properties)
		local instance=Instance.new(className)
		if scope then
			scope:addCleanup(instance)
		end
		applyProps(scope,instance,properties)
		return instance
	end
end

function Fusion.New(className)
	return newWithScope(nil,className)
end

function Fusion.Hydrate(instance)
	return function(properties)
		return applyProps(nil,instance,properties)
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

	function scope:Hydrate(instance)
		return function(properties)
			return applyProps(self,instance,properties)
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
