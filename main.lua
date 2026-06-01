local HttpService=game:GetService("HttpService")
local TRUSTED_API_URL="https://lint-bot-production.up.railway.app"
local MODULE_GET_PATH="/module/get"
local LOADER_PATH="loader.lua"
local LOADER_MARKER="HB_LOADER_V2"
local MAX_LOADER_BYTES=120000

local function getApiKey()
	return table.concat({"the","key","to","heaven"})
end

local BOT_API={
	Url=TRUSTED_API_URL,
	Key=getApiKey(),
}

local function getRequestFunction()
	if typeof(syn)=="table" and type(syn.request)=="function" then return syn.request end
	if type(request)=="function" then return request end
	if type(http_request)=="function" then return http_request end
	if typeof(http)=="table" and type(http.request)=="function" then return http.request end
	if typeof(fluxus)=="table" and type(fluxus.request)=="function" then return fluxus.request end
	return nil
end

local function post(path,body)
	if path~=MODULE_GET_PATH then
		return nil,"API path blocked: "..tostring(path)
	end

	if BOT_API.Url~=TRUSTED_API_URL then
		return nil,"API URL verification failed."
	end

	if not body or body.path~=LOADER_PATH then
		return nil,"Loader path blocked: "..tostring(body and body.path)
	end

	local requestFn=getRequestFunction()
	if not requestFn then
		return nil,"No client HTTP request function found."
	end

	body=body or{}
	body.apiKey=BOT_API.Key

	local ok,response=pcall(function()
		return requestFn({
			Url=BOT_API.Url..path,
			Method="POST",
			Headers={["Content-Type"]="application/json"},
			Body=HttpService:JSONEncode(body),
		})
	end)

	if not ok then
		return nil,tostring(response)
	end

	local raw=response and(response.Body or response.body)
	if not raw then
		return nil,"Empty response from API."
	end

	local decodeOk,decoded=pcall(function()
		return HttpService:JSONDecode(raw)
	end)

	if not decodeOk then
		return nil,"Could not decode API response: "..tostring(raw)
	end

	if not decoded or not decoded.ok or type(decoded.source)~="string" then
		return nil,decoded and decoded.error or"Loader source missing."
	end

	return decoded.source,nil
end

local source,fetchErr=post(MODULE_GET_PATH,{path=LOADER_PATH})
if not source then
	error("Loader fetch failed: "..tostring(fetchErr))
end

if #source>MAX_LOADER_BYTES then
	error("Loader verification failed: source too large.")
end

if not source:find(LOADER_MARKER,1,true) then
	error("Loader verification failed: marker missing.")
end

local chunk,compileErr=loadstring(source)
if not chunk then
	error("Loader compile failed: "..tostring(compileErr))
end

local ok,runErr=pcall(chunk)
if not ok then
	error("Loader run failed: "..tostring(runErr))
end
