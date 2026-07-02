-- Small bootstrapper only:
-- fetch the runtime chunks, tell them which platform we are on, and hand over
-- the shared UI library repo coordinates. App/layout code stays out of here.
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local botUrl = "https://lint-bot-production.up.railway.app"
local moduleGetPath = "/module/get"
local moduleBatchPath = "/module/batch"
local apiKey = "mydayohmy"
local maxSourceBytes = 300000

local runtimeFiles = {
	"runtime/loader-part-1.lua",
	"runtime/loader-part-2.lua",
	"runtime/loader-part-3.lua",
	"runtime/loader-part-4.lua",
	"runtime/loader-part-5.lua",
}

local function detectClientPlatform()
	local touch=false
	local keyboard=false
	local mouse=false

	pcall(function()
		touch=UserInputService.TouchEnabled==true
		keyboard=UserInputService.KeyboardEnabled==true
		mouse=UserInputService.MouseEnabled==true
	end)

	if touch and not keyboard and not mouse then
		return "mobile"
	end

	return "pc"
end

local allowedRuntimeFiles={}
for _, path in ipairs(runtimeFiles) do
	allowedRuntimeFiles[path] = true
end

local function typeOf(value)
	if typeof then return typeof(value) end
	return type(value)
end

local function clientRequest()
	-- Executors expose HTTP through different globals. Keep this list boring and
	-- explicit so the runtime does not need executor-specific branches.
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

local function postModuleApi(path,apiBody)
	local requestFn = clientRequest()
	if not requestFn then
		return nil, "no http request found"
	end

	apiBody=apiBody or {}
	apiBody.apiKey=apiBody.apiKey or apiKey

	local body = HttpService:JSONEncode(apiBody)

	local ok, response = pcall(function()
		return requestFn({
			Url = botUrl .. path,
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

	return payload,nil
end

local function fetchModule(path)
	if not allowedRuntimeFiles[path] then
		return nil, "runtime path blocked: " .. tostring(path)
	end

	local payload,apiError=postModuleApi(moduleGetPath,{
		path=path,
	})

	if not payload then
		return nil,apiError
	end

	if not payload or payload.ok ~= true or type(payload.source) ~= "string" then
		return nil, (payload and payload.error) or "runtime missing"
	end

	return payload.source, nil
end

local function fetchRuntimeBatch()
	local payload,apiError=postModuleApi(moduleBatchPath,{
		paths=runtimeFiles,
	})

	if not payload then
		return nil,apiError
	end

	if payload.ok~=true or type(payload.modules)~="table" then
		return nil,(payload and payload.error) or "runtime batch missing"
	end

	local sources={}
	for _,path in ipairs(runtimeFiles) do
		local item=payload.modules[path]
		if not item or type(item.source)~="string" then
			local errors=type(payload.errors)=="table" and payload.errors or {}
			return nil,errors[path] or ("runtime batch missing "..tostring(path))
		end

		sources[path]=item.source
	end

	return sources,nil
end

local function validateSource(path, source)
	if type(source) ~= "string" or source == "" then
		return false, "runtime missing"
	end

	if #source > maxSourceBytes then
		return false,"runtime too big"
	end

	if path=="runtime/loader-part-2.lua" and not source:find('type%(DataSaveAPI%.DeleteOwnedPreset%)=="function"') then
		return false,"old boot 2"
	end

	return true,nil
end

local function sourceLine(source,lineNumber)
	local current=1
	for line in string.gmatch(source.."\n","([^\n]*)\n") do
		if current==lineNumber then
			if #line>120 then
				return string.sub(line,1,120)
			end
			return line
		end
		current=current+1
	end
	return ""
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
	bootPlatform=detectClientPlatform(),
	bootUiLibrary={
		Owner="amyyzing",
		Repo="495-ui-library",
		Branch="main",
	},
	bootApi={
		Url=botUrl,
		Key = apiKey,
	},
}, { __index = parentEnv })

runtimeEnv._G = runtimeEnv

local batchedRuntimeSources,batchError=fetchRuntimeBatch()
if not batchedRuntimeSources and debugEnv.loaderDebug == true then
	warn("runtime batch failed, falling back:",batchError)
end

for _,path in ipairs(runtimeFiles) do
	local source=batchedRuntimeSources and batchedRuntimeSources[path]
	local fetchError=nil
	if not source then
		source, fetchError = fetchModule(path)
	end

	if not source then
		error("loader fetch failed "..path..": "..tostring(fetchError))
	end

	local valid, validateError = validateSource(path, source)
	if not valid then
		error("loader blocked "..path..": "..tostring(validateError))
	end

	runtimeSources[path]=source

	local chunk,compileError = loadstring(source,"@"..path)
	if not chunk then
		error("loader compile failed "..path..": "..tostring(compileError))
	end

	if setfenv then setfenv(chunk, runtimeEnv) end

	runtimeEnv.bootingFile=path
	local ran, runError = xpcall(chunk,function(err)
		if debug and type(debug.traceback)=="function" then
			return debug.traceback(tostring(err),2)
		end

		return tostring(err)
	end)
	if not ran then
		error("loader run failed "..path.." line281=["..sourceLine(source,281).."]: "..tostring(runError))
	end
end

if debugEnv.loaderDebug == true then
	warn("loader done: "..tostring(#runtimeFiles).." chunks")
end
