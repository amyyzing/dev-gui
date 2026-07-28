local scopeApi = {}
scopeApi.__index = scopeApi

local function runCleanup(task)
	local kind = typeof(task)

	if kind == "RBXScriptConnection" then
		if task.Connected then
			task:Disconnect()
		end
	elseif kind == "Instance" then
		task:Destroy()
	elseif type(task) == "function" then
		task()
	elseif type(task) == "table" then
		if type(task.destroy) == "function" then
			task:destroy()
		elseif type(task.Destroy) == "function" then
			task:Destroy()
		elseif type(task.disconnect) == "function" then
			task:disconnect()
		elseif type(task.Disconnect) == "function" then
			task:Disconnect()
		end
	end
end

function scopeApi.new(name, errorHandler)
	return setmetatable({
		_name = name or "scope",
		_destroyed = false,
		_tasks = {},
		_errorHandler = errorHandler,
	}, scopeApi)
end

function scopeApi:isDestroyed()
	return self._destroyed
end

function scopeApi:isAlive()
	return not self._destroyed
end

function scopeApi:setErrorHandler(errorHandler)
	self._errorHandler = errorHandler
	return self
end

function scopeApi:_cleanup(task, cleanup)
	local ok, err = pcall(cleanup or runCleanup, task)
	if not ok and self._errorHandler then
		pcall(self._errorHandler, err, self._name)
	end
end

function scopeApi:add(task, cleanup)
	if task == nil then
		return nil
	end

	if self._destroyed then
		self:_cleanup(task, cleanup)
		return task
	end

	self._tasks[#self._tasks + 1] = {
		task = task,
		cleanup = cleanup,
	}

	return task
end

function scopeApi:remove(task, cleanupTask)
	if task == nil then
		return false
	end

	for index = #self._tasks, 1, -1 do
		local entry = self._tasks[index]
		if entry.task == task then
			table.remove(self._tasks, index)
			if cleanupTask ~= false then
				self:_cleanup(entry.task, entry.cleanup)
			end
			return true
		end
	end

	return false
end

function scopeApi:task(cleanup)
	if type(cleanup) ~= "function" then
		return nil
	end

	return self:add(cleanup)
end

function scopeApi:connect(signal, callback)
	if not signal or type(signal.Connect) ~= "function" then
		return nil
	end

	return self:add(signal:Connect(callback))
end

function scopeApi:nest(name)
	local child = scopeApi.new(name, self._errorHandler)
	self:add(child)
	return child
end

function scopeApi:delay(seconds, callback)
	if type(callback) ~= "function" then
		return nil
	end

	if type(task) ~= "table" or type(task.delay) ~= "function" then
		return nil
	end

	local alive = true
	local thread = task.delay(math.max(tonumber(seconds) or 0, 0), function()
		if not alive or self._destroyed then
			return
		end

		alive = false
		callback()
	end)

	return self:add(thread, function()
		alive = false
		if type(task.cancel) == "function" then
			pcall(task.cancel, thread)
		end
	end)
end

function scopeApi:cleanup()
	if self._destroyed then
		return
	end

	for index = #self._tasks, 1, -1 do
		local entry = self._tasks[index]
		self:_cleanup(entry.task, entry.cleanup)
		self._tasks[index] = nil
	end
end

function scopeApi:cancelAll()
	self:cleanup()
end

function scopeApi:destroy()
	if self._destroyed then
		return
	end

	self:cleanup()
	self._destroyed = true
end

function scopeApi:Destroy()
	self:destroy()
end

return scopeApi
