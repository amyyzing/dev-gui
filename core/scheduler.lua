local Scope = require(script.Parent.scope)

local Scheduler = {}
Scheduler.__index = Scheduler

local function sortJobs(jobs)
	table.sort(jobs, function(a, b)
		if a.priority == b.priority then
			return a.name < b.name
		end

		return a.priority < b.priority
	end)
end

local function createHandle(cancel)
	local handle = {
		_cancelled = false,
	}

	function handle:cancel()
		if self._cancelled then
			return
		end

		self._cancelled = true
		cancel()
	end

	function handle:Cancel()
		self:cancel()
	end

	function handle:destroy()
		self:cancel()
	end

	function handle:Destroy()
		self:cancel()
	end

	return handle
end

function Scheduler.new(runService, scope)
	local self = setmetatable({
		_runService = runService or game:GetService("RunService"),
		_scope = Scope.new("scheduler"),
		_paused = false,
		_renderJobs = {},
		_heartbeatJobs = {},
		_renderConnection = nil,
		_heartbeatConnection = nil,
	}, Scheduler)

	if scope then
		scope:add(self)
	end

	return self
end

function Scheduler:setPaused(paused)
	self._paused = paused == true
end

function Scheduler:_removeJob(jobs, name)
	for index = #jobs, 1, -1 do
		if jobs[index].name == name then
			table.remove(jobs, index)
			return
		end
	end
end

function Scheduler:_runJobs(jobs, dt)
	if self._paused then
		return
	end

	for _, job in ipairs(jobs) do
		if not job.cancelled then
			if job.interval then
				job.elapsed = job.elapsed + dt
				if job.elapsed >= job.interval then
					local elapsed = job.elapsed
					job.elapsed = 0
					job.callback(elapsed)
				end
			else
				job.callback(dt)
			end
		end
	end
end

function Scheduler:_ensureRender()
	if self._renderConnection then
		return
	end

	self._renderConnection = self._scope:add(self._runService.RenderStepped:Connect(function(dt)
		self:_runJobs(self._renderJobs, dt)
	end))
end

function Scheduler:_ensureHeartbeat()
	if self._heartbeatConnection then
		return
	end

	self._heartbeatConnection = self._scope:add(self._runService.Heartbeat:Connect(function(dt)
		self:_runJobs(self._heartbeatJobs, dt)
	end))
end

function Scheduler:_addJob(jobs, ensure, name, priority, callback, ownerScope, interval)
	assert(type(name) == "string" and name ~= "", "Scheduler job needs a name")
	assert(type(callback) == "function", "Scheduler job needs a callback")

	self:_removeJob(jobs, name)

	local job = {
		name = name,
		priority = priority or 0,
		callback = callback,
		interval = interval,
		elapsed = 0,
		cancelled = false,
	}

	jobs[#jobs + 1] = job
	sortJobs(jobs)
	ensure(self)

	local handle = createHandle(function()
		job.cancelled = true
		self:_removeJob(jobs, name)
	end)

	if ownerScope then
		ownerScope:add(handle)
	end

	return handle
end

function Scheduler:onRender(name, priority, callback, ownerScope)
	return self:_addJob(self._renderJobs, self._ensureRender, name, priority, callback, ownerScope)
end

function Scheduler:onHeartbeat(name, priority, callback, ownerScope)
	return self:_addJob(self._heartbeatJobs, self._ensureHeartbeat, name, priority, callback, ownerScope)
end

function Scheduler:every(name, interval, callback, ownerScope)
	return self:_addJob(self._heartbeatJobs, self._ensureHeartbeat, name, 0, callback, ownerScope, interval)
end

function Scheduler:delay(seconds, callback, ownerScope)
	local handle
	local elapsed = 0

	handle = self:onHeartbeat("delay:" .. tostring(callback), 0, function(dt)
		elapsed = elapsed + dt
		if elapsed >= seconds then
			handle:cancel()
			callback()
		end
	end, ownerScope)

	return handle
end

function Scheduler:jobCount()
	return #self._renderJobs + #self._heartbeatJobs
end

function Scheduler:destroy()
	self._scope:destroy()
	table.clear(self._renderJobs)
	table.clear(self._heartbeatJobs)
	self._renderConnection = nil
	self._heartbeatConnection = nil
end

function Scheduler:Destroy()
	self:destroy()
end

return Scheduler
