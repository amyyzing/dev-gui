local Scope = {}
Scope.__index = Scope

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

function Scope.new(name)
	return setmetatable({
		_name = name or "scope",
		_destroyed = false,
		_tasks = {},
	}, Scope)
end

function Scope:isDestroyed()
	return self._destroyed
end

function Scope:add(task, cleanup)
	if task == nil then
		return nil
	end

	if self._destroyed then
		pcall(cleanup or runCleanup, task)
		return task
	end

	self._tasks[#self._tasks + 1] = {
		task = task,
		cleanup = cleanup,
	}

	return task
end

function Scope:connect(signal, callback)
	if not signal or type(signal.Connect) ~= "function" then
		return nil
	end

	return self:add(signal:Connect(callback))
end

function Scope:nest(name)
	local child = Scope.new(name)
	self:add(child)
	return child
end

function Scope:cleanup()
	if self._destroyed then
		return
	end

	for index = #self._tasks, 1, -1 do
		local entry = self._tasks[index]
		local cleanup = entry.cleanup or runCleanup
		pcall(cleanup, entry.task)
		self._tasks[index] = nil
	end
end

function Scope:destroy()
	if self._destroyed then
		return
	end

	self:cleanup()
	self._destroyed = true
end

function Scope:Destroy()
	self:destroy()
end

return Scope
