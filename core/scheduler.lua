-- shared heartbeat and render-step scheduler.

local env = (getfenv and getfenv()) or _G
local Scope = rawget(env, "CoreScope") or rawget(env, "CoreScopeModule")

if not Scope and script and script.Parent then
	Scope = require(script.Parent.scope)
end

assert(Scope, "CoreScope must load before CoreScheduler")

local Scheduler = {}
Scheduler.__index = Scheduler

local EMPTY_STATS = {}

local function sortJobs(jobs)
	table.sort(jobs, function(a, b)
		if a.priority == b.priority then
			return a.name < b.name
		end

		return a.priority < b.priority
	end)
end

local function createHandle(job, cancel)
	local handle = {
		_cancelled = false,
		_job = job,
	}

	function handle:cancel()
		if self._cancelled then
			return
		end

		self._cancelled = true
		cancel()
	end

	function handle:setEnabled(enabled)
		if self._job then
			self._job.enabled = enabled ~= false
		end
	end

	function handle:pause()
		self:setEnabled(false)
	end

	function handle:resume()
		self:setEnabled(true)
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

local function updateStats(job, startedAt)
	local duration = os.clock() - startedAt
	job.lastDuration = duration
	job.totalDuration = (job.totalDuration or 0) + duration
	job.callCount = (job.callCount or 0) + 1

	if duration > (job.maxDuration or 0) then
		job.maxDuration = duration
	end
end

local function copyStats(job, kind)
	local calls = job.callCount or 0
	return {
		name = job.name,
		kind = kind,
		priority = job.priority or 0,
		interval = job.interval,
		enabled = job.enabled ~= false and not job.cancelled,
		calls = calls,
		last = job.lastDuration or 0,
		average = calls > 0 and ((job.totalDuration or 0) / calls) or 0,
		max = job.maxDuration or 0,
	}
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
		_delayId = 0,
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
		if not job.cancelled and job.enabled ~= false then
			if job.interval then
				job.elapsed = job.elapsed + dt
				if job.elapsed >= job.interval then
					local elapsed = job.elapsed
					job.elapsed = 0
					local startedAt = os.clock()
					job.callback(elapsed)
					updateStats(job, startedAt)
				end
			else
				local startedAt = os.clock()
				job.callback(dt)
				updateStats(job, startedAt)
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
		enabled = true,
		callCount = 0,
		totalDuration = 0,
		lastDuration = 0,
		maxDuration = 0,
	}

	jobs[#jobs + 1] = job
	sortJobs(jobs)
	ensure(self)

	local handle = createHandle(job, function()
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

function Scheduler:delay(nameOrSeconds, secondsOrCallback, callbackOrScope, maybeOwnerScope)
	local name = nil
	local seconds = nameOrSeconds
	local callback = secondsOrCallback
	local ownerScope = callbackOrScope

	if type(nameOrSeconds) == "string" then
		name = nameOrSeconds
		seconds = secondsOrCallback
		callback = callbackOrScope
		ownerScope = maybeOwnerScope
	end

	local handle
	local elapsed = 0
	self._delayId = self._delayId + 1
	local jobName = name or ("delay:" .. tostring(self._delayId))

	handle = self:onHeartbeat(jobName, 0, function(dt)
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

function Scheduler:stats()
	local result = {}

	for _, job in ipairs(self._renderJobs) do
		result[#result + 1] = copyStats(job, "RenderStepped")
	end

	for _, job in ipairs(self._heartbeatJobs) do
		result[#result + 1] = copyStats(job, "Heartbeat")
	end

	table.sort(result, function(a, b)
		if a.kind == b.kind then
			return a.name < b.name
		end

		return a.kind < b.kind
	end)

	return result
end

function Scheduler:jobStats(name)
	for _, job in ipairs(self._renderJobs) do
		if job.name == name then
			return copyStats(job, "RenderStepped")
		end
	end

	for _, job in ipairs(self._heartbeatJobs) do
		if job.name == name then
			return copyStats(job, "Heartbeat")
		end
	end

	return EMPTY_STATS
end

function Scheduler:resetStats()
	local function reset(jobs)
		for _, job in ipairs(jobs) do
			job.callCount = 0
			job.totalDuration = 0
			job.lastDuration = 0
			job.maxDuration = 0
		end
	end

	reset(self._renderJobs)
	reset(self._heartbeatJobs)
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
