local Logger = {}
Logger.__index = Logger

local LEVELS = {
	debug = 1,
	info = 2,
	warn = 3,
	error = 4,
	silent = 5,
}

local LEVEL_NAMES = {
	"debug",
	"info",
	"warn",
	"error",
}

local function normalizeLevel(level)
	if type(level) == "number" then
		return math.clamp(level, LEVELS.debug, LEVELS.silent)
	end

	return LEVELS[tostring(level or "info"):lower()] or LEVELS.info
end

local function pack(...)
	return table.pack(...)
end

local function emit(level, prefix, args)
	if level >= LEVELS.warn then
		warn(prefix, table.unpack(args, 1, args.n))
	else
		print(prefix, table.unpack(args, 1, args.n))
	end
end

function Logger.new(config)
	config = type(config) == "table" and config or {}

	return setmetatable({
		_name = tostring(config.name or "app"),
		_level = normalizeLevel(config.level),
		_history = {},
		_historyLimit = math.max(tonumber(config.historyLimit) or 100, 0),
		_parent = config.parent,
	}, Logger)
end

function Logger:scope(name)
	return Logger.new({
		name = self._name .. "." .. tostring(name or "scope"),
		level = self._level,
		historyLimit = self._historyLimit,
		parent = self,
	})
end

function Logger:setLevel(level)
	self._level = normalizeLevel(level)
end

function Logger:_record(level, args)
	local entry = {
		t = os.clock(),
		level = LEVEL_NAMES[level] or tostring(level),
		scope = self._name,
		args = args,
	}

	if self._historyLimit > 0 then
		self._history[#self._history + 1] = entry
		while #self._history > self._historyLimit do
			table.remove(self._history, 1)
		end
	end

	if self._parent and type(self._parent._record) == "function" then
		self._parent:_record(level, args)
	end
end

function Logger:log(level, ...)
	local numericLevel = normalizeLevel(level)
	if numericLevel < self._level or numericLevel >= LEVELS.silent then
		return
	end

	local args = pack(...)
	self:_record(numericLevel, args)
	emit(numericLevel, "[" .. self._name .. "/" .. (LEVEL_NAMES[numericLevel] or tostring(level)) .. "]", args)
end

function Logger:debug(...)
	self:log("debug", ...)
end

function Logger:info(...)
	self:log("info", ...)
end

function Logger:warn(...)
	self:log("warn", ...)
end

function Logger:error(...)
	self:log("error", ...)
end

function Logger:history()
	local copy = {}
	for index, entry in ipairs(self._history) do
		copy[index] = entry
	end
	return copy
end

function Logger:clear()
	table.clear(self._history)
end

return Logger
