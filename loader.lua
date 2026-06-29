local HttpService = game:GetService( "HttpService" )

local botUrl = "https://lint-bot-production.up.railway.app"
local moduleGetPath="/module/get"
local apiKey = "nydayohmy"
local maxSourceBytes=300000

local runtimeFiles = {
	"runtime/loader-part-1.lua",
	"runtime/loader-part-2.lua",
	"runtime/loader-part-3.lua",
	"runtime/loader-part-4.lua",
	"runtime/loader-part-5.lua" ,
}

local allowedRuntimeFiles={}
for _, path in ipairs(runtimeFiles) do
	allowedRuntimeFiles[path] = true
end

local function typeOf(value)
	if typeof then return typeof(value) end
	return type(value)
end

local function clientRequest()
	-- Request funcs
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
	if not allowedRuntimeFiles[path] then
		return nil, "runtime path blocked: " .. tostring(path)
	end

	local requestFn = clientRequest()
	if not requestFn then
		return nil,"no http request found"
	end

	local apiBody={
		path = path,
		apiKey=apiKey,
	}

	local body = HttpService:JSONEncode(apiBody)

	local ok, response = pcall(function()
		return requestFn({
			Url = botUrl .. moduleGetPath,
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

	if #source > maxSourceBytes then
		return false,"runtime too big"
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
	runtimeFilesFromLoader = runtimeFiles,
	runtimeSourcesFromLoader=runtimeSources,
	bootApi={
		Url=botUrl,
		Key = apiKey,
	},
}, { __index = parentEnv })

runtimeEnv._G = runtimeEnv

for _,path in ipairs(runtimeFiles) do
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

if debugEnv.loaderDebug == true then
	warn("loader done: "..tostring(#runtimeFiles).." chunks")
end
