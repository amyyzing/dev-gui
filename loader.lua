-- User-facing entry point. The full bootstrap stays in main.lua so startup
-- behavior has one implementation while this file remains small and stable.
local HttpService=game:GetService("HttpService")

local sharedEnv=(type(getgenv)=="function" and getgenv()) or _G
local config=rawget(sharedEnv,"GUI_BOOT_CONFIG")
if type(config)~="table" then
	config={}
end

local apiUrl=tostring(config.ApiUrl or config.Url or "https://lint-bot-production.up.railway.app")
local apiKey=tostring(config.ApiKey or config.Key or "mydayohmy")
local moduleSource="gui"
local maxSourceBytes=math.max(1000,tonumber(config.MaxSourceBytes) or 300000)

local function valueType(value)
	if type(typeof)=="function" then
		return typeof(value)
	end
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
	error("loader requires an executor HTTP request function")
end

local requestBody={
	apiKey=apiKey,
	source=moduleSource,
	path="main.lua",
}
if config.Fresh==true then
	requestBody.fresh=true
end

local requestOk,response=pcall(function()
	return requestFn({
		Url=apiUrl.."/module/get",
		Method="POST",
		Headers={["Content-Type"]="application/json"},
		Body=HttpService:JSONEncode(requestBody),
	})
end)
if not requestOk then
	error("loader request failed: "..tostring(response))
end

local statusCode=tonumber(response and(response.StatusCode or response.Status))
local responseBody=response and(response.Body or response.body)
if not responseBody then
	error("loader API returned no body")
end

local decodeOk,payload=pcall(function()
	return HttpService:JSONDecode(responseBody)
end)
if not decodeOk then
	error("loader API returned invalid JSON")
end

if statusCode and statusCode>=400 then
	error("loader API failed: "..tostring(payload and payload.error or statusCode))
end
if not(payload and payload.ok==true and payload.moduleSource==moduleSource and type(payload.source)=="string") then
	error("loader API missing main.lua: "..tostring(payload and payload.error or "unknown"))
end

local source=payload.source
if source=="" or #source>maxSourceBytes then
	error("loader blocked invalid main.lua source")
end
if not source:find("GUI_BOOT_CONFIG",1,true) or not source:find("runtimeFiles",1,true) then
	error("loader blocked unexpected main.lua source")
end

local chunk,compileError=loadstring(source,"@main.lua")
if not chunk then
	error("loader compile failed: "..tostring(compileError))
end

local cleanup=rawget(sharedEnv,"GUI_RUNTIME_CLEANUP")
sharedEnv.GUI_RUNTIME_CLEANUP=nil
if type(cleanup)=="function" then
	pcall(cleanup)
end

local parentEnv=(getfenv and getfenv(0)) or _G
if setfenv then
	setfenv(chunk,parentEnv)
end

local runOk,runError=xpcall(chunk,function(err)
	if debug and type(debug.traceback)=="function" then
		return debug.traceback(tostring(err),2)
	end
	return tostring(err)
end)
if not runOk then
	error("loader startup failed: "..tostring(runError))
end
