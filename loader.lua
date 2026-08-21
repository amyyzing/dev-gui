-- DEV_GUI_CUSTOM_LOADER
-- Dev uses its own Railway source and credentials while sharing the GUI code contract.
local HttpService=game:GetService("HttpService")
local UserInputService=game:GetService("UserInputService")

local API_URL="https://dev-gui-api-production.up.railway.app"
local MODULE_SOURCE="dev-gui"
local DEFAULT_API_KEY="dev-gui-4145ccb4cdf3a8cca616d7109c9a0fbe16e91c56f629e371de52b9fe7c2c49c6"
local MAX_BUNDLE_BYTES=12000000

local started=os.clock()
local parentEnv=(getfenv and getfenv(0)) or _G
local sharedEnv=(type(getgenv)=="function" and getgenv()) or parentEnv
local config=rawget(sharedEnv,"DEV_GUI_BOOT_CONFIG")
if type(config)~="table" then config={} end
local apiKey=tostring(config.ApiKey or config.Key or DEFAULT_API_KEY)

local function valueType(value)
	if type(typeof)=="function" then return typeof(value) end
	return type(value)
end

local function requestFunction()
	if valueType(syn)=="table" and type(syn.request)=="function" then return syn.request end
	if type(request)=="function" then return request end
	if type(http_request)=="function" then return http_request end
	if valueType(http)=="table" and type(http.request)=="function" then return http.request end
	if valueType(fluxus)=="table" and type(fluxus.request)=="function" then return fluxus.request end
	return nil
end

local requestFn=requestFunction()
if not requestFn then error("dev-gui loader requires an executor HTTP request function") end

local function traceback(err)
	if debug and type(debug.traceback)=="function" then return debug.traceback(tostring(err),2) end
	return tostring(err)
end

local function stopPreviousDevRuntime()
	local cleanup=rawget(sharedEnv,"DEV_GUI_RUNTIME_CLEANUP")
	sharedEnv.DEV_GUI_RUNTIME_CLEANUP=nil
	if type(cleanup)=="function" then pcall(cleanup) end
end

local function detectPlatform()
	local touch=UserInputService.TouchEnabled==true
	local keyboard=UserInputService.KeyboardEnabled==true
	local mouse=UserInputService.MouseEnabled==true
	return touch and not keyboard and not mouse and "mobile" or "pc"
end

local platform=detectPlatform()
local memoryCache=rawget(sharedEnv,"DEV_GUI_BUNDLE_CACHE")
if type(memoryCache)~="table"
	or memoryCache.Platform~=platform
	or type(memoryCache.BuildId)~="string"
	or type(memoryCache.Chunk)~="function" then
	memoryCache=nil
end

local requestBody={apiKey=apiKey,source=MODULE_SOURCE,platform=platform}
if memoryCache and config.Fresh~=true then
	requestBody.buildId=memoryCache.BuildId
end

local networkStarted=os.clock()
local requestOk,response=pcall(function()
	return requestFn({
		Url=API_URL.."/bundle/get",
		Method="POST",
		Headers={
			["Content-Type"]="application/json",
			["X-Dev-Gui-Client"]="bundle-loader",
		},
		Body=HttpService:JSONEncode(requestBody),
	})
end)
local networkTime=os.clock()-networkStarted
local status=requestOk and tonumber(response and(response.StatusCode or response.Status)) or nil
local chunk=nil
local buildId=nil

if requestOk and status==304 and memoryCache then
	chunk=memoryCache.Chunk
	buildId=memoryCache.BuildId
elseif requestOk and (not status or status<400) then
	local source=response and(response.Body or response.body)
	if type(source)=="string" and source~="" and #source<=MAX_BUNDLE_BYTES and source:find("DEV_GUI_BUNDLE",1,true) then
		local compileError
		chunk,compileError=loadstring(source,"@dev-gui/"..platform..".bundle.luau")
		if not chunk then error("dev-gui bundle compile failed: "..tostring(compileError)) end
		local headers=response and(response.Headers or response.headers) or{}
		buildId=tostring(headers["X-Dev-Gui-Build"] or headers["x-dev-gui-build"] or source:match('BuildId="([0-9a-fA-F]+)"') or "")
	end
end

if not chunk then
	error("dev-gui bundle unavailable: "..tostring(requestOk and status or response))
end

if setfenv then setfenv(chunk,parentEnv) end
stopPreviousDevRuntime()
local executeStarted=os.clock()
local ran,result=xpcall(chunk,traceback)
local executeTime=os.clock()-executeStarted
if not ran then
	sharedEnv.DEV_GUI_BUNDLE_CACHE=nil
	error("dev-gui startup failed: "..tostring(result))
end

if buildId~="" then
	sharedEnv.DEV_GUI_BUNDLE_CACHE={Platform=platform,BuildId=buildId,Chunk=chunk}
end
sharedEnv.DEV_GUI_LAST_BOOT_TIMINGS={
	BuildId=buildId,
	Platform=platform,
	Network=networkTime,
	Execute=executeTime,
	Total=os.clock()-started,
}

if config.Debug==true then
	print(string.format("dev-gui %s loaded in %.3fs",platform,os.clock()-started))
end
