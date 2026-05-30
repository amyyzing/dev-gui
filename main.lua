local HttpService=game:GetService("HttpService")

local function getApiKey()
	return table.concat({"the","key","to","heaven"})
end

local BOT_API={
	Url="https://lint-bot-production.up.railway.app",
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

local source,fetchErr=post("/module/get",{path="loader.lua"})
if not source then
	error("Loader fetch failed: "..tostring(fetchErr))
end

local chunk,compileErr=loadstring(source)
if not chunk then
	error("Loader compile failed: "..tostring(compileErr))
end

local ok,runErr=pcall(chunk)
if not ok then
	error("Loader run failed: "..tostring(runErr))
end
