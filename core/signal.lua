-- small core helper. these modules are deliberately plain so features can share them.

local Signal = {}
Signal.__index = Signal

function Signal.new()
	return setmetatable({
		_destroyed = false,
		_connections = {},
	}, Signal)
end

function Signal:Connect(callback)
	assert(type(callback) == "function", "Signal callback must be a function")

	local connection = {
		Connected = true,
		_owner = self,
	}

	function connection:Disconnect()
		if not self.Connected then
			return
		end

		self.Connected = false
		self._owner._connections[self] = nil
	end

	if self._destroyed then
		connection.Connected = false
		return connection
	end

	self._connections[connection] = callback
	return connection
end

function Signal:Once(callback)
	local connection
	connection = self:Connect(function(...)
		connection:Disconnect()
		callback(...)
	end)

	return connection
end

function Signal:Fire(...)
	if self._destroyed then
		return
	end

	local calls = {}
	for connection, callback in pairs(self._connections) do
		if connection.Connected then
			calls[#calls + 1] = callback
		end
	end

	for _, callback in ipairs(calls) do
		callback(...)
	end
end

function Signal:Destroy()
	if self._destroyed then
		return
	end

	self._destroyed = true
	for connection in pairs(self._connections) do
		connection.Connected = false
		connection._owner = nil
		self._connections[connection] = nil
	end
end

return Signal
