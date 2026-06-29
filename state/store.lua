-- State

local env = (getfenv and getfenv()) or _G
local signalApi = rawget(env, "CoreSignal") or rawget(env, "CoreSignalModule")

if not signalApi and script and script.Parent and script.Parent.Parent then
	signalApi = require(script.Parent.Parent.core.signal)
end

assert(signalApi, "CoreSignal must load before StateStore")

local storeApi = {}
storeApi.__index = storeApi

local function shallowCopy(source)
	local result = {}

	if source then
		for key, value in pairs(source) do
			result[key] = value
		end
	end

	return result
end

local function valuesEqual(a, b)
	if a == b then
		return true
	end

	if type(a) ~= "table" or type(b) ~= "table" then
		return false
	end

	for key, value in pairs(a) do
		if b[key] ~= value then
			return false
		end
	end

	for key in pairs(b) do
		if a[key] == nil then
			return false
		end
	end

	return true
end

function storeApi.new()
	return setmetatable({
		_slices = {},
	}, storeApi)
end

function storeApi:createSlice(config)
	assert(type(config) == "table", "Slice config must be a table")
	assert(type(config.name) == "string" and config.name ~= "", "Slice needs a name")

	local slice = {
		name = config.name,
		version = config.version or 1,
		_state = shallowCopy(config.initialState),
		_changed = signalApi.new(),
		_actions = {},
	}

	local reducers = config.reducers or {}

	function slice:get()
		return self._state
	end

	function slice:snapshot()
		return shallowCopy(self._state)
	end

	function slice:replace(nextState)
		self._state = shallowCopy(nextState)
		self._changed:Fire(self._state)
	end

	function slice:patch(partial)
		local changed = false

		for key, value in pairs(partial) do
			if self._state[key] ~= value then
				self._state[key] = value
				changed = true
			end
		end

		if changed then
			self._changed:Fire(self._state)
		end
	end

	function slice:changed(callback)
		return self._changed:Connect(callback)
	end

	function slice:select(selector, callback)
		local last = selector(self._state)

		return self._changed:Connect(function(nextState)
			local nextValue = selector(nextState)
			if not valuesEqual(last, nextValue) then
				last = nextValue
				callback(nextValue)
			end
		end)
	end

	for name, reducer in pairs(reducers) do
		assert(type(reducer) == "function", "Reducer must be a function")

		slice._actions[name] = function(_, ...)
			local before = slice:snapshot()
			reducer(slice._state, ...)

			if not valuesEqual(before, slice._state) then
				slice._changed:Fire(slice._state)
			end
		end
	end

	slice.actions = slice._actions
	self._slices[config.name] = slice

	return slice
end

function storeApi:getSlice(name)
	return self._slices[name]
end

function storeApi:snapshot()
	local result = {}

	for name, slice in pairs(self._slices) do
		result[name] = {
			version = slice.version,
			state = slice:snapshot(),
		}
	end

	return result
end

return storeApi
