-- HB_MAIN_V3
-- starts the panel loader.

local HttpService=game:GetService("HttpService")

local BOT_URL="https://lint-bot-production.up.railway.app"
local MODULE_GET="/module/get"
local LOADER_PATH="loader.lua"
local LOADER_MARKER="HB_LOADER_V3"
local API_KEY="thekeytoheaven"
local MAX_LOADER_SIZE=160000

local function typeOf(value)
	if typeof then
		return typeof(value)
	end

	return type(value)
end

local function clientRequest()
	if typeOf(syn)=="table" and type(syn.request)=="function" then
		return syn.request
	end

	if type(request)=="function" then
		return request
	end

	if type(http_request)=="function" then
		return http_request
	end

	if typeOf(http)=="table" and type(http.request)=="function" then
		return http.request
	end

	if typeOf(fluxus)=="table" and type(fluxus.request)=="function" then
		return fluxus.request
	end

	return nil
end

local function fetchLoader()
	local requestFn=clientRequest()
	if not requestFn then
		return nil,"no http request found"
	end

	local body=HttpService:JSONEncode({
		path=LOADER_PATH,
		apiKey=API_KEY
	})

	local ok,response=pcall(function()
		return requestFn({
			Url=BOT_URL..MODULE_GET,
			Method="POST",
			Headers={
				["Content-Type"]="application/json"
			},
			Body=body
		})
	end)

	if not ok then
		return nil,tostring(response)
	end

	local raw=response and (response.Body or response.body)
	if not raw then
		return nil,"api sent nothing"
	end

	local decodeOk,payload=pcall(function()
		return HttpService:JSONDecode(raw)
	end)

	if not decodeOk then
		return nil,"api decode failed: "..tostring(raw)
	end

	if not payload or payload.ok~=true or type(payload.source)~="string" then
		return nil,(payload and payload.error) or "loader missing"
	end

	return payload.source,nil
end

local source,fetchError=fetchLoader()
if not source then
	error("loader fetch failed: "..tostring(fetchError))
end

if #source>MAX_LOADER_SIZE then
	error("loader too big")
end

if not source:find(LOADER_MARKER,1,true) then
	error("loader marker missing")
end

local chunk,compileError=loadstring(source)
if not chunk then
	error("loader compile failed: "..tostring(compileError))
end

local ok,runError=pcall(chunk)
if not ok then
	error("loader run failed: "..tostring(runError))
end
