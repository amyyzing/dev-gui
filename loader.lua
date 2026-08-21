-- User-facing entry point. The full bootstrap stays in main.lua so startup
-- behavior has one implementation while this file remains small and stable.
local HttpService=game:GetService("HttpService")

local sharedEnv=(type(getgenv)=="function" and getgenv()) or _G
local previousBootConfig=rawget(sharedEnv,"GUI_BOOT_CONFIG")
local config={}
if type(previousBootConfig)=="table" then
	for key,value in pairs(previousBootConfig) do
		config[key]=value
	end
end
local fresh=config.Fresh~=false
config.Fresh=fresh

local apiUrl="https://lint-bot-production.up.railway.app"
local apiKey="mydayohmy"
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
	fresh=fresh,
}

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

for _,cleanupName in ipairs({"GUI_RUNTIME_CLEANUP","DEV_GUI_RUNTIME_CLEANUP"}) do
	local cleanup=rawget(sharedEnv,cleanupName)
	sharedEnv[cleanupName]=nil
	if type(cleanup)=="function" then
		pcall(cleanup)
	end
end
sharedEnv.DEV_GUI_BOOT_CONFIG=nil
sharedEnv.DEV_GUI_BUNDLE_CACHE=nil
sharedEnv.DEV_GUI_LAST_BOOT_TIMINGS=nil
sharedEnv.DEV_GUI_RUNTIME_CONFIG=nil
sharedEnv.devGuiRefreshModules=nil

pcall(function()
	local contextActions=game:GetService("ContextActionService")
	for _,actionName in ipairs({
		"DevGui_MouseInputSink",
		"DevGui_QBAim_ControllerThrow",
		"DevGui_QBAim_ControllerToggle",
	}) do
		contextActions:UnbindAction(actionName)
	end
end)

pcall(function()
	local players=game:GetService("Players")
	local parents={game:GetService("CoreGui")}
	if players.LocalPlayer then
		parents[#parents+1]=players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	end
	for _,parent in ipairs(parents) do
		local oldGui=parent and parent:FindFirstChild("DevGuiUI")
		if oldGui then oldGui:Destroy() end
	end
end)

local parentEnv=(getfenv and getfenv(0)) or _G
if setfenv then
	setfenv(chunk,parentEnv)
end

sharedEnv.GUI_BOOT_CONFIG=config
local runOk,runError=xpcall(chunk,function(err)
	if debug and type(debug.traceback)=="function" then
		return debug.traceback(tostring(err),2)
	end
	return tostring(err)
end)
sharedEnv.GUI_BOOT_CONFIG=previousBootConfig
if not runOk then
	error("loader startup failed: "..tostring(runError))
end
