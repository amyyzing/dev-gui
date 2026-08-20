-- DEV_GUI_CUSTOM_LOADER
-- Production uses one prebuilt bundle request. The modular path remains a dev fallback.
local HttpService=game:GetService("HttpService")
local UserInputService=game:GetService("UserInputService")

local API_URL="https://lint-bot-production.up.railway.app"
local MODULE_SOURCE="dev-gui"
local DEFAULT_API_KEY="dev-gui"
local BOOTSTRAP_PATH="dump/start.lua"
local MAX_BOOTSTRAP_BYTES=300000
local MAX_BUNDLE_BYTES=12000000

local started=os.clock()
local parentEnv=(getfenv and getfenv(0)) or _G
local sharedEnv=parentEnv
if type(getgenv)=="function" then
	local ok,result=pcall(getgenv)
	if ok and type(result)=="table" then sharedEnv=result end
end
local config=rawget(sharedEnv,"DEV_GUI_BOOT_CONFIG") or rawget(parentEnv,"DEV_GUI_BOOT_CONFIG")
if type(config)~="table" then config={} end
local apiKey=tostring(config.ApiKey or config.Key or DEFAULT_API_KEY)
if apiKey=="" then error("dev-gui loader requires an API key") end

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
if not requestFn then error("dev-gui loader requires an executor HTTP request function") end

local function traceback(err)
	if debug and type(debug.traceback)=="function" then return debug.traceback(tostring(err),2) end
	return tostring(err)
end

local function detectPlatform()
	local touch=UserInputService.TouchEnabled==true
	local keyboard=UserInputService.KeyboardEnabled==true
	local mouse=UserInputService.MouseEnabled==true
	return touch and not keyboard and not mouse and "mobile" or "pc"
end

local platform=detectPlatform()
local cacheFolder="dev-gui-cache"
local cacheSourcePath=cacheFolder.."/"..platform..".luau"
local cacheBuildPath=cacheFolder.."/"..platform..".version"

local function compileBundle(source,label)
	if type(source)~="string" or source=="" or #source>MAX_BUNDLE_BYTES then return nil,"bundle source is invalid" end
	if not source:find("DEV_GUI_BUNDLE",1,true) then return nil,"bundle marker is missing" end
	return loadstring(source,label)
end

local function readBundleCache()
	if type(isfile)~="function" or type(readfile)~="function" then return nil,nil,nil end
	local ok,source,buildId=pcall(function()
		if not isfile(cacheSourcePath) or not isfile(cacheBuildPath) then return nil,nil end
		return readfile(cacheSourcePath),readfile(cacheBuildPath)
	end)
	if not ok or type(source)~="string" or type(buildId)~="string" then return nil,nil,nil end
	buildId=buildId:match("^%s*([0-9a-fA-F]+)")
	if not buildId then return nil,nil,nil end
	local chunk=compileBundle(source,"@"..cacheSourcePath)
	if not chunk then return nil,nil,nil end
	return source,buildId,chunk
end

local function writeBundleCache(source,buildId)
	if type(writefile)~="function" then return end
	pcall(function()
		if type(isfolder)=="function" and type(makefolder)=="function" and not isfolder(cacheFolder) then makefolder(cacheFolder) end
		writefile(cacheSourcePath,source)
		writefile(cacheBuildPath,buildId)
	end)
end

local function responseHeader(response,name)
	local headers=response and(response.Headers or response.headers)
	if type(headers)~="table" then return nil end
	return headers[name] or headers[name:lower()] or headers[name:upper()]
end

local function runModularFallback(reason)
	if config.Debug==true then warn("dev-gui using modular fallback:",reason) end
	local body={apiKey=apiKey,source=MODULE_SOURCE,path=BOOTSTRAP_PATH}
	if config.Fresh==true then body.fresh=true end
	local ok,response=pcall(function()
		return requestFn({
			Url=API_URL.."/module/get",Method="POST",
			Headers={["Content-Type"]="application/json",["X-Dev-Gui-Client"]="loader-fallback"},
			Body=HttpService:JSONEncode(body),
		})
	end)
	if not ok then error("dev-gui bootstrap request failed: "..tostring(response)) end
	local raw=response and(response.Body or response.body)
	if type(raw)~="string" or raw=="" then error("dev-gui bootstrap API returned no body") end
	local decoded,payload=pcall(function() return HttpService:JSONDecode(raw) end)
	if not decoded then error("dev-gui bootstrap API returned invalid JSON") end
	local status=tonumber(response and(response.StatusCode or response.Status))
	if status and status>=400 then error("dev-gui bootstrap API failed: "..tostring(payload and payload.error or status)) end
	if not(payload and payload.ok==true and payload.moduleSource==MODULE_SOURCE and payload.path==BOOTSTRAP_PATH and type(payload.source)=="string") then
		error("dev-gui bootstrap response was not for the requested source")
	end
	local source=payload.source
	if source=="" or #source>MAX_BOOTSTRAP_BYTES or not source:find("DEV_GUI_RUNTIME_BOOTSTRAP",1,true) then
		error("dev-gui loader blocked invalid bootstrap source")
	end
	local chunk,compileError=loadstring(source,"@"..BOOTSTRAP_PATH)
	if not chunk then error("dev-gui bootstrap compile failed: "..tostring(compileError)) end
	local runtimeEnv=setmetatable({
		DEV_GUI_RUNTIME_CONFIG={
			ApiKey=apiKey,ApiUrl=API_URL,ModuleSource=MODULE_SOURCE,
			Fresh=config.Fresh==true,FetchTimeout=tonumber(config.FetchTimeout),MaxSourceBytes=tonumber(config.MaxSourceBytes),
		},
	},{__index=parentEnv})
	runtimeEnv._G=runtimeEnv
	if setfenv then setfenv(chunk,runtimeEnv) end
	local ran,runError=xpcall(chunk,traceback)
	if not ran then error("dev-gui fallback failed: "..tostring(runError)) end
end

if config.Development==true or config.UseModules==true then
	runModularFallback("development mode")
	return
end

local timings={Platform=platform}
local cachedSource,cachedBuild,cachedChunk=readBundleCache()
local requestBody={apiKey=apiKey,source=MODULE_SOURCE,platform=platform}
if cachedChunk and config.Fresh~=true then requestBody.buildId=cachedBuild end

local networkStarted=os.clock()
local requestOk,response=pcall(function()
	return requestFn({
		Url=API_URL.."/bundle/get",Method="POST",
		Headers={["Content-Type"]="application/json",["X-Dev-Gui-Client"]="bundle-loader"},
		Body=HttpService:JSONEncode(requestBody),
	})
end)
timings.Network=os.clock()-networkStarted

local chunk=nil
local bundleSource=nil
local buildId=nil
local status=requestOk and tonumber(response and(response.StatusCode or response.Status)) or nil
if requestOk and status==304 and cachedChunk then
	chunk=cachedChunk
	bundleSource=cachedSource
	buildId=cachedBuild
elseif requestOk and(not status or status<400) then
	bundleSource=response and(response.Body or response.body)
	local compileStarted=os.clock()
	local compileError
	chunk,compileError=compileBundle(bundleSource,"@dev-gui/"..platform..".bundle.luau")
	timings.Compile=os.clock()-compileStarted
	if not chunk and config.Debug==true then warn("dev-gui bundle compile failed:",compileError) end
	if chunk then
		buildId=tostring(responseHeader(response,"X-Dev-Gui-Build") or bundleSource:match('BuildId="([0-9a-fA-F]+)"') or "")
		if buildId~="" then writeBundleCache(bundleSource,buildId) end
	end
end

if not chunk and cachedChunk then
	chunk=cachedChunk
	bundleSource=cachedSource
	buildId=cachedBuild
end
if not chunk then
	runModularFallback(requestOk and("bundle unavailable (status "..tostring(status)..")") or tostring(response))
	return
end

if setfenv then setfenv(chunk,parentEnv) end
local executeStarted=os.clock()
local ran,runError=xpcall(chunk,traceback)
timings.Execute=os.clock()-executeStarted
timings.Total=os.clock()-started
timings.BuildId=buildId
timings.Runtime=sharedEnv.DEV_GUI_LAST_BOOT_TIMINGS
sharedEnv.DEV_GUI_LAST_BOOT_TIMINGS=timings
if config.Debug==true then
	print(string.format("dev-gui %s: network %.3fs, execute %.3fs, total %.3fs",platform,timings.Network or 0,timings.Execute or 0,timings.Total or 0))
end
if not ran then runModularFallback("bundle runtime failed: "..tostring(runError)) end
