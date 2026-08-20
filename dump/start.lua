-- GUI_RUNTIME_BOOTSTRAP
-- The loader hands off here; application/runtime chunks stay out of loader.lua.
local HttpService=game:GetService("HttpService")
local UserInputService=game:GetService("UserInputService")

local TRUSTED_API_URL="https://lint-bot-production.up.railway.app"
local TRUSTED_MODULE_SOURCE="gui"
local runtimeFiles={
	"runtime/loader-part-1.lua",
	"runtime/loader-part-2.lua",
	"runtime/loader-part-3.lua",
	"runtime/loader-part-4.lua",
	"runtime/loader-part-5.lua",
}

local parentEnv=(getfenv and getfenv()) or _G
local config=rawget(parentEnv,"GUI_RUNTIME_CONFIG")
if type(config)~="table" then
	error("gui runtime config is missing")
end
local apiUrl=tostring(config.ApiUrl or "")
local moduleSource=tostring(config.ModuleSource or "")
local apiKey=tostring(config.ApiKey or "")
if apiUrl~=TRUSTED_API_URL or moduleSource~=TRUSTED_MODULE_SOURCE or apiKey=="" then
	error("gui runtime config failed trust checks")
end

local maxSourceBytes=math.max(1000,tonumber(config.MaxSourceBytes) or 300000)
local fetchTimeout=math.max(5,tonumber(config.FetchTimeout) or 30)
local fresh=config.Fresh==true

local allowedRuntimeFiles={}
for _,path in ipairs(runtimeFiles) do
	allowedRuntimeFiles[path]=true
end

local function valueType(value)
	if type(typeof)=="function" then return typeof(value) end
	return type(value)
end

local function getRequestFunction()
	if valueType(syn)=="table" and type(syn.request)=="function" then return syn.request end
	if type(request)=="function" then return request end
	if type(http_request)=="function" then return http_request end
	if valueType(http)=="table" and type(http.request)=="function" then return http.request end
	if valueType(fluxus)=="table" and type(fluxus.request)=="function" then return fluxus.request end
	return nil
end

local requestFn=getRequestFunction()
if not requestFn then
	error("gui runtime requires an executor HTTP request function")
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
			Headers={
				["Content-Type"]="application/json",
				["X-Gui-Client"]="runtime",
			},
			Body=HttpService:JSONEncode(body),
		})
	end)
	if not ok then return nil,tostring(response) end

	local raw=response and(response.Body or response.body)
	if type(raw)~="string" or raw=="" then return nil,"api returned no body" end

	local decoded,payload=pcall(function()
		return HttpService:JSONDecode(raw)
	end)
	if not decoded then return nil,"api returned invalid JSON" end

	local statusCode=tonumber(response and(response.StatusCode or response.Status))
	if statusCode and statusCode>=400 then
		return nil,tostring(payload and payload.error or statusCode)
	end
	if not(payload and payload.ok==true and payload.moduleSource==moduleSource) then
		return nil,tostring(payload and payload.error or "wrong module source")
	end

	return payload,nil
end

local function validateSource(path,source)
	if not allowedRuntimeFiles[path] then return false,"runtime path blocked" end
	if type(source)~="string" or source=="" then return false,"runtime source missing" end
	if #source>maxSourceBytes then return false,"runtime source too large" end
	if path=="runtime/loader-part-1.lua" and not source:find("trustedApiUrl",1,true) then
		return false,"unexpected runtime part 1"
	end
	if path=="runtime/loader-part-2.lua" and not source:find('type(DataSaveAPI.DeleteOwnedPreset)=="function"',1,true) then
		return false,"unexpected runtime part 2"
	end
	return true,nil
end

local function fetchOne(path)
	local payload,apiError=postModuleApi("/module/get",{path=path})
	if not payload then return nil,apiError end
	if payload.path~=path or type(payload.source)~="string" then
		return nil,"runtime response path mismatch"
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

local function fetchRuntimeSources()
	local sources={}
	local missing={}
	local payload=postModuleApi("/module/batch",{paths=runtimeFiles})

	if payload and type(payload.modules)=="table" then
		for _,path in ipairs(runtimeFiles) do
			local item=payload.modules[path]
			if item and type(item.source)=="string" then
				sources[path]=item.source
			else
				missing[#missing+1]=path
			end
		end
	else
		for _,path in ipairs(runtimeFiles) do missing[#missing+1]=path end
	end

	local fallbackSources,fallbackErrors=fetchFallbackConcurrently(missing)
	for path,source in pairs(fallbackSources) do sources[path]=source end
	return sources,fallbackErrors
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

local runtimeSources,fetchErrors=fetchRuntimeSources()
local chunks={}
for _,path in ipairs(runtimeFiles) do
	local source=runtimeSources[path]
	if not source then
		error("gui runtime fetch failed "..path..": "..tostring(fetchErrors[path]))
	end

	local valid,validationError=validateSource(path,source)
	if not valid then
		error("gui runtime blocked "..path..": "..tostring(validationError))
	end

	local chunk,compileError=loadstring(source,"@"..path)
	if not chunk then
		error("gui runtime compile failed "..path..": "..tostring(compileError))
	end
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
	bootModuleSource={
		Id=moduleSource,
	},
	bootApi={
		Url=apiUrl,
		Key=apiKey,
		Source=moduleSource,
	},
	bootConfig={
		AppId="gui",
		ScreenGuiName="HitboxUI",
		RefreshGlobalName="refreshModules",
	},
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
	if not ran then
		error("gui runtime failed "..path..": "..tostring(runError))
	end
end
