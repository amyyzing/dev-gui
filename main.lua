-- DEV_GUI_COMPAT_ENTRY
-- Compatibility entry for callers that still execute main.lua directly.
local HttpService=game:GetService("HttpService")

local API_URL="https://lint-bot-production.up.railway.app"
local MODULE_SOURCE="dev-gui"
local LOADER_PATH="loader.lua"
local DEFAULT_API_KEY="dev-gui"
local MAX_LOADER_BYTES=200000

local parentEnv=(getfenv and getfenv(0)) or _G
local sharedEnv=parentEnv
if type(getgenv)=="function" then
	local ok,result=pcall(getgenv)
	if ok and type(result)=="table" then sharedEnv=result end
end

local config=rawget(sharedEnv,"DEV_GUI_BOOT_CONFIG") or rawget(parentEnv,"DEV_GUI_BOOT_CONFIG")
if type(config)~="table" then config={} end
local apiKey=tostring(config.ApiKey or config.Key or DEFAULT_API_KEY)

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
if not requestFn then error("dev-gui entry requires an executor HTTP request function") end

local ok,response=pcall(function()
	return requestFn({
		Url=API_URL.."/module/get",
		Method="POST",
		Headers={["Content-Type"]="application/json"},
		Body=HttpService:JSONEncode({
			apiKey=apiKey,
			source=MODULE_SOURCE,
			path=LOADER_PATH,
			fresh=config.Fresh==true or nil,
		}),
	})
end)
if not ok then error("dev-gui loader request failed: "..tostring(response)) end

local raw=response and(response.Body or response.body)
if type(raw)~="string" or raw=="" then error("dev-gui loader API returned no body") end
local decoded,payload=pcall(function() return HttpService:JSONDecode(raw) end)
if not decoded then error("dev-gui loader API returned invalid JSON") end
if not(payload and payload.ok==true and payload.moduleSource==MODULE_SOURCE and payload.path==LOADER_PATH and type(payload.source)=="string") then
	error("dev-gui loader API failed: "..tostring(payload and payload.error or "unexpected response"))
end
if payload.source=="" or #payload.source>MAX_LOADER_BYTES or not payload.source:find("DEV_GUI_CUSTOM_LOADER",1,true) then
	error("dev-gui entry blocked invalid loader source")
end

local chunk,compileError=loadstring(payload.source,"@"..LOADER_PATH)
if not chunk then error("dev-gui loader compile failed: "..tostring(compileError)) end
if setfenv then setfenv(chunk,parentEnv) end

local ran,runError=xpcall(chunk,function(err)
	if debug and type(debug.traceback)=="function" then return debug.traceback(tostring(err),2) end
	return tostring(err)
end)
if not ran then error("dev-gui loader failed: "..tostring(runError)) end
