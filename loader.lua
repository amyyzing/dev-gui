-- HB_LOADER_V3
-- loader.lua
-- kinda ugly on purpose. dont "clean" this too hard unless the loader breaks.

local HttpService = game:GetService( "HttpService" )

local BOT_URL = "https://lint-bot-production.up.railway.app"
local MODULE_GET="/module/get"
local API_KEY = "thekeytoheaven"
local MAX_SOURCE_SIZE=300000

local RUNTIME_PATHS = {
	"runtime/loader-part-1.lua",
	"runtime/loader-part-2.lua",
	"runtime/loader-part-3.lua",
	"runtime/loader-part-4.lua",
	"runtime/loader-part-5.lua" ,
}

local RUNTIME_MARKERS={
	[RUNTIME_PATHS[1]] = "HB_RUNTIME_PART_1",
	[RUNTIME_PATHS[2]]="HB_RUNTIME_PART_2",
	[RUNTIME_PATHS[3]] = "HB_RUNTIME_PART_3",
	[RUNTIME_PATHS[4]]="HB_RUNTIME_PART_4",
	[RUNTIME_PATHS[5]] = "HB_RUNTIME_PART_5",
}

local ALLOWED_PATHS={}
for _, path in ipairs(RUNTIME_PATHS) do
	ALLOWED_PATHS[path] = true
end

local function typeOf(value)
	if typeof then return typeof(value) end
	return type(value)
end

local function clientRequest()
	-- executor roulette. annoying, but it is what it is.
	if typeOf(syn)=="table" and type(syn.request) == "function" then
		return syn.request
	end

	if type(request)=="function" then return request end
	if type(http_request) == "function" then return http_request end

	if typeOf(http)=="table" and type(http.request)=="function" then
		return http.request
	end

	if typeOf(fluxus) == "table" and type(fluxus.request)=="function" then
		return fluxus.request
	end

	return nil
end

local function fetchModule(path)
	if not ALLOWED_PATHS[path] then
		return nil, "Runtime path blocked: " .. tostring(path)
	end

	local requestFn = clientRequest()
	if not requestFn then
		return nil,"no http request found"
	end

	local apiBody={
		path = path,
		apiKey=API_KEY,
	}

	local body = HttpService:JSONEncode(apiBody)

	local ok, response = pcall(function()
		return requestFn({
			Url = BOT_URL .. MODULE_GET,
			Method="POST",
			Headers={ ["Content-Type"] = "application/json" },
			Body = body,
		})
	end)

	if not ok then
		return nil, tostring(response)
	end

	local responseBody = response and (response.Body or response.body)
	if not responseBody then
		return nil,"api sent nothing"
	end

	local decodeOk,payload = pcall(function()
		return HttpService:JSONDecode(responseBody)
	end)

	if not decodeOk then
		return nil, "api decode failed: "..tostring(responseBody)
	end

	if not payload or payload.ok ~= true or type(payload.source) ~= "string" then
		return nil, (payload and payload.error) or "runtime missing"
	end

	return payload.source, nil
end

local function validateSource(path, source)
	if type(source) ~= "string" or source == "" then
		return false, "runtime missing"
	end

	if #source > MAX_SOURCE_SIZE then
		return false,"Runtime source too large."
	end

	local marker = RUNTIME_MARKERS[path]
	if marker and not source:find(marker, 1, true) then
		return false, "runtime marker failed"
	end

	return true,nil
end

local runtimeSources={}
local parentEnv = (getfenv and getfenv(0)) or _G
local debugEnv = parentEnv

if type(getgenv) == "function" then
	local ok,result=pcall(getgenv)
	if ok and type(result) == "table" then
		debugEnv = result
	end
end

local runtimeEnv = setmetatable({
	APP_RUNTIME_PATHS = RUNTIME_PATHS,
	APP_RUNTIME_SOURCES=runtimeSources,
	APP_RUNTIME_MARKERS = RUNTIME_MARKERS,
	BOOT_BOT_API={
		Url=BOT_URL,
		Key = API_KEY,
	},
}, { __index = parentEnv })

runtimeEnv._G = runtimeEnv

for _,path in ipairs(RUNTIME_PATHS) do
	local source, fetchError = fetchModule(path)
	if not source then
		error("loader fetch failed "..path..": "..tostring(fetchError))
	end

	local valid, validateError = validateSource(path, source)
	if not valid then
		error("loader blocked "..path..": "..tostring(validateError))
	end

	runtimeSources[path]=source

	local chunk,compileError = loadstring(source)
	if not chunk then
		error("loader compile failed "..path..": "..tostring(compileError))
	end

	if setfenv then setfenv(chunk, runtimeEnv) end

	local ran, runError = pcall(chunk)
	if not ran then
		error("loader run failed "..path..": "..tostring(runError))
	end
end

if debugEnv.HB_LOADER_DEBUG == true then
	warn("loader done: "..tostring(#RUNTIME_PATHS).." runtime chunks loaded.")
end
