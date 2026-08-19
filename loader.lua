-- DEV_GUI_CUSTOM_LOADER
-- Stable, user-facing entry point for the isolated dev-gui runtime.
local HttpService=game:GetService("HttpService")

local API_URL="https://lint-bot-production.up.railway.app"
local MODULE_SOURCE="dev-gui"
local BOOTSTRAP_PATH="dump/start.lua"
local DEFAULT_API_KEY="dev-gui"
local MAX_BOOTSTRAP_BYTES=300000

local parentEnv=(getfenv and getfenv(0)) or _G
local sharedEnv=parentEnv
if type(getgenv)=="function" then
	local ok,result=pcall(getgenv)
	if ok and type(result)=="table" then
		sharedEnv=result
	end
end

local config=rawget(sharedEnv,"DEV_GUI_BOOT_CONFIG") or rawget(parentEnv,"DEV_GUI_BOOT_CONFIG")
if type(config)~="table" then
	config={}
end

local apiKey=tostring(config.ApiKey or config.Key or DEFAULT_API_KEY)
if apiKey=="" then
	error("dev-gui loader requires an API key")
end

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
	error("dev-gui loader requires an executor HTTP request function")
end

local requestBody={
	apiKey=apiKey,
	source=MODULE_SOURCE,
	path=BOOTSTRAP_PATH,
}
if config.Fresh==true then
	requestBody.fresh=true
end

local requestOk,response=pcall(function()
	return requestFn({
		Url=API_URL.."/module/get",
		Method="POST",
		Headers={
			["Content-Type"]="application/json",
			["X-Dev-Gui-Client"]="loader",
		},
		Body=HttpService:JSONEncode(requestBody),
	})
end)
if not requestOk then
	error("dev-gui bootstrap request failed: "..tostring(response))
end

local raw=response and(response.Body or response.body)
if type(raw)~="string" or raw=="" then
	error("dev-gui bootstrap API returned no body")
end

local decodeOk,payload=pcall(function()
	return HttpService:JSONDecode(raw)
end)
if not decodeOk then
	error("dev-gui bootstrap API returned invalid JSON")
end

local statusCode=tonumber(response and(response.StatusCode or response.Status))
if statusCode and statusCode>=400 then
	error("dev-gui bootstrap API failed: "..tostring(payload and payload.error or statusCode))
end
if not(payload and payload.ok==true and payload.moduleSource==MODULE_SOURCE and payload.path==BOOTSTRAP_PATH and type(payload.source)=="string") then
	error("dev-gui bootstrap response was not for the requested source")
end

local source=payload.source
if source=="" or #source>MAX_BOOTSTRAP_BYTES then
	error("dev-gui loader blocked invalid bootstrap source")
end
if not source:find("DEV_GUI_RUNTIME_BOOTSTRAP",1,true) then
	error("dev-gui loader blocked unexpected bootstrap source")
end

local chunk,compileError=loadstring(source,"@"..BOOTSTRAP_PATH)
if not chunk then
	error("dev-gui bootstrap compile failed: "..tostring(compileError))
end

local runtimeEnv=setmetatable({
	DEV_GUI_RUNTIME_CONFIG={
		ApiKey=apiKey,
		ApiUrl=API_URL,
		ModuleSource=MODULE_SOURCE,
		Fresh=config.Fresh==true,
		FetchTimeout=tonumber(config.FetchTimeout),
		MaxSourceBytes=tonumber(config.MaxSourceBytes),
	},
},{__index=parentEnv})
runtimeEnv._G=runtimeEnv

if setfenv then
	setfenv(chunk,runtimeEnv)
end

local runOk,runError=xpcall(chunk,function(err)
	if debug and type(debug.traceback)=="function" then
		return debug.traceback(tostring(err),2)
	end
	return tostring(err)
end)
if not runOk then
	error("dev-gui startup failed: "..tostring(runError))
end
