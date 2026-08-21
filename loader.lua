-- Legacy dev-gui entry point. Always hand off to the production GUI so old
-- loadstrings cannot keep using separate modules, credentials, or saved data.
local HttpService=game:GetService("HttpService")

local sharedEnv=(type(getgenv)=="function" and getgenv()) or _G
local parentEnv=(getfenv and getfenv(0)) or _G
local apiUrl="https://lint-bot-production.up.railway.app"
local apiKey="mydayohmy"
local moduleSource="gui"

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
if not requestFn then error("gui loader requires an executor HTTP request function") end

local body=HttpService:JSONEncode({
	apiKey=apiKey,
	source=moduleSource,
	path="loader.lua",
	fresh=true,
})
local requestOk,response=pcall(function()
	return requestFn({
		Url=apiUrl.."/module/get",
		Method="POST",
		Headers={["Content-Type"]="application/json"},
		Body=body,
	})
end)
if not requestOk then error("gui loader request failed: "..tostring(response)) end

local status=tonumber(response and(response.StatusCode or response.Status))
local raw=response and(response.Body or response.body)
if type(raw)~="string" or raw=="" then error("gui loader API returned no body") end

local decoded,payload=pcall(function()
	return HttpService:JSONDecode(raw)
end)
if not decoded then error("gui loader API returned invalid JSON") end
if status and status>=400 then error("gui loader API failed: "..tostring(payload and payload.error or status)) end
if not(payload and payload.ok==true and payload.moduleSource==moduleSource and type(payload.source)=="string") then
	error("gui loader API missing production loader")
end

local source=payload.source
if source=="" or #source>300000 then error("gui loader blocked invalid production source") end
if not source:find('moduleSource="gui"',1,true) or not source:find('path="main.lua"',1,true) then
	error("gui loader blocked unexpected production source")
end

local chunk,compileError=loadstring(source,"@gui/loader.lua")
if not chunk then error("gui loader compile failed: "..tostring(compileError)) end

local guiConfig=rawget(sharedEnv,"GUI_BOOT_CONFIG")
if type(guiConfig)~="table" then
	guiConfig={}
	sharedEnv.GUI_BOOT_CONFIG=guiConfig
end
local previousFresh=guiConfig.Fresh
guiConfig.Fresh=true

if setfenv then setfenv(chunk,parentEnv) end
local ran,runError=xpcall(chunk,function(err)
	if debug and type(debug.traceback)=="function" then
		return debug.traceback(tostring(err),2)
	end
	return tostring(err)
end)
guiConfig.Fresh=previousFresh
if not ran then error("gui loader startup failed: "..tostring(runError)) end
