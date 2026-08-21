local HttpService=game:GetService("HttpService")
local UserInputService=game:GetService("UserInputService")

local runtimeFiles={
	"runtime/loader-part-1.lua",
	"runtime/loader-part-2.lua",
	"runtime/loader-part-3.lua",
	"runtime/loader-part-4.lua",
	"runtime/loader-part-5.lua",
}

local parentEnv=(getfenv and getfenv(0)) or _G
local sharedEnv=parentEnv
if type(getgenv)=="function" then
	local ok,result=pcall(getgenv)
	if ok and type(result)=="table" then
		sharedEnv=result
	end
end

local config=rawget(sharedEnv,"GUI_BOOT_CONFIG") or rawget(parentEnv,"GUI_BOOT_CONFIG")
if type(config)~="table" then
	config={}
end

local apiUrl="https://lint-bot-production.up.railway.app"
local apiKey="mydayohmy"
local moduleSource="gui"

local moduleGetPath="/module/get"
local moduleBatchPath="/module/batch"
local maxSourceBytes=math.max(1000,tonumber(config.MaxSourceBytes) or 300000)
local fetchTimeout=math.max(5,tonumber(config.FetchTimeout) or 30)
local fresh=config.Fresh==true

local allowedRuntimeFiles={}
for _,path in ipairs(runtimeFiles) do
	allowedRuntimeFiles[path]=true
end

local function typeOf(value)
	if typeof then return typeof(value) end
	return type(value)
end

local function detectClientPlatform()
	local touch=false
	local keyboard=false
	local mouse=false
	pcall(function()
		touch=UserInputService.TouchEnabled==true
		keyboard=UserInputService.KeyboardEnabled==true
		mouse=UserInputService.MouseEnabled==true
	end)
	return touch and not keyboard and not mouse and "mobile" or "pc"
end

local function clientRequest()
	if typeOf(syn)=="table" and type(syn.request)=="function" then return syn.request end
	if type(request)=="function" then return request end
	if type(http_request)=="function" then return http_request end
	if typeOf(http)=="table" and type(http.request)=="function" then return http.request end
	if typeOf(fluxus)=="table" and type(fluxus.request)=="function" then return fluxus.request end
	return nil
end

local requestFn=clientRequest()
if not requestFn then
	error("no http request found")
end

local function postModuleApi(endpoint,body)
	body=body or{}
	body.apiKey=apiKey
	body.source=moduleSource
	if fresh then body.fresh=true end

	local ok,response=pcall(function()
		return requestFn({
			Url=apiUrl..endpoint,
			Method="POST",
			Headers={["Content-Type"]="application/json"},
			Body=HttpService:JSONEncode(body),
		})
	end)
	if not ok then return nil,tostring(response) end

	local raw=response and(response.Body or response.body)
	if not raw then return nil,"api sent nothing" end
	local decoded,payload=pcall(function()
		return HttpService:JSONDecode(raw)
	end)
	if not decoded then return nil,"api decode failed: "..tostring(raw) end
	return payload,nil
end

local function validateSource(path,source)
	if not allowedRuntimeFiles[path] then return false,"runtime path blocked" end
	if type(source)~="string" or source=="" then return false,"runtime missing" end
	if #source>maxSourceBytes then return false,"runtime too big" end
	if path=="runtime/loader-part-2.lua" and not source:find('type%(DataSaveAPI%.DeleteOwnedPreset%)=="function"') then
		return false,"stale runtime part 2"
	end
	return true,nil
end

local function fetchOne(path)
	local payload,apiError=postModuleApi(moduleGetPath,{path=path})
	if not payload then return nil,apiError end
	if payload.ok~=true or type(payload.source)~="string" then
		return nil,payload.error or "runtime missing"
	end
	return payload.source,nil
end

local function fetchFallbackConcurrently(paths)
	local sources={}
	local errors={}
	local remaining=#paths
	if remaining==0 then return sources,errors end

	for _,path in ipairs(paths) do
		task.spawn(function()
			local ok,source,fetchError=pcall(fetchOne,path)
			if ok and source then
				sources[path]=source
			else
				errors[path]=ok and fetchError or tostring(source)
			end
			remaining-=1
		end)
	end

	local deadline=os.clock()+fetchTimeout
	while remaining>0 and os.clock()<deadline do
		task.wait()
	end
	if remaining>0 then
		for _,path in ipairs(paths) do
			if not sources[path] and not errors[path] then errors[path]="request timed out" end
		end
	end
	return sources,errors
end

local function fetchMissingSources(paths)
	local sources={}
	local missing={}
	local payload,batchError=postModuleApi(moduleBatchPath,{paths=paths})
	if payload and type(payload.modules)=="table" then
		for _,path in ipairs(paths) do
			local item=payload.modules[path]
			if item and type(item.source)=="string" then
				sources[path]=item.source
			else
				missing[#missing+1]=path
			end
		end
	else
		for _,path in ipairs(paths) do missing[#missing+1]=path end
		if sharedEnv.loaderDebug==true then warn("runtime batch failed, using concurrent fallback:",batchError) end
	end

	local fallbackSources,fallbackErrors=fetchFallbackConcurrently(missing)
	for path,source in pairs(fallbackSources) do sources[path]=source end
	return sources,fallbackErrors
end

local runtimeSources={}
local sources,errors=fetchMissingSources(runtimeFiles)
for _,path in ipairs(runtimeFiles) do
	local source=sources[path]
	if not source then error("bootstrap fetch failed "..path..": "..tostring(errors[path])) end
	local valid,validationError=validateSource(path,source)
	if not valid then error("bootstrap blocked "..path..": "..tostring(validationError)) end
	runtimeSources[path]=source
end

local chunks={}
for _,path in ipairs(runtimeFiles) do
	local source=runtimeSources[path]
	local valid,validationError=validateSource(path,source)
	if not valid then error("bootstrap blocked "..path..": "..tostring(validationError)) end
	local chunk,compileError=loadstring(source,"@"..path)
	if not chunk then error("bootstrap compile failed "..path..": "..tostring(compileError)) end
	chunks[path]=chunk
end

local runtimeEnv=setmetatable({
	runtimeFilesFromLoader=runtimeFiles,
	runtimeSourcesFromLoader=runtimeSources,
	bootPlatform=detectClientPlatform(),
	bootUiLibrary={
		Owner="amyyzing",
		Repo="495-ui-library",
		Branch="main",
	},
	bootApi={Url=apiUrl,Key=apiKey,Source=moduleSource},
	bootConfig={Fresh=fresh},
},{__index=parentEnv})
runtimeEnv._G=runtimeEnv

for _,path in ipairs(runtimeFiles) do
	local chunk=chunks[path]
	if setfenv then setfenv(chunk,runtimeEnv) end
	runtimeEnv.bootingFile=path
	local ran,runError=xpcall(chunk,function(err)
		if debug and type(debug.traceback)=="function" then
			return debug.traceback(tostring(err),2)
		end
		return tostring(err)
	end)
	if not ran then error("bootstrap run failed "..path..": "..tostring(runError)) end
end

if sharedEnv.loaderDebug==true then
	warn("bootstrap done: "..tostring(#runtimeFiles).." chunks")
end
