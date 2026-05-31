local HttpService=game:GetService("HttpService")

local RUNTIME_PATHS={
	"runtime/loader-part-1.lua",
	"runtime/loader-part-2.lua",
	"runtime/loader-part-3.lua",
	"runtime/loader-part-4.lua",
	"runtime/loader-part-5.lua",
}

local function getApiKey()
	return table.concat({"the","key","to","heaven"})
end

local BOT_API={
	Url="https://lint-bot-production.up.railway.app",
	Key=getApiKey(),
}

function BOT_API.GetRequestFunction()
	if typeof(syn)=="table" and type(syn.request)=="function" then return syn.request end
	if type(request)=="function" then return request end
	if type(http_request)=="function" then return http_request end
	if typeof(http)=="table" and type(http.request)=="function" then return http.request end
	if typeof(fluxus)=="table" and type(fluxus.request)=="function" then return fluxus.request end
	return nil
end

function BOT_API.Post(path,body)
	local requestFn=BOT_API.GetRequestFunction()
	if not requestFn then
		return{ok=false,error="No client HTTP request function found."}
	end

	body=body or{}
	body.apiKey=BOT_API.Key

	local ok,response=pcall(function()
		return requestFn({
			Url=BOT_API.Url..path,
			Method="POST",
			Headers={
				["Content-Type"]="application/json",
			},
			Body=HttpService:JSONEncode(body),
		})
	end)

	if not ok then
		return{ok=false,error=tostring(response)}
	end

	local raw=response and(response.Body or response.body)
	if not raw then
		return{ok=false,error="Empty response from API."}
	end

	local decodeOk,decoded=pcall(function()
		return HttpService:JSONDecode(raw)
	end)

	if not decodeOk then
		return{ok=false,error="Could not decode API response: "..tostring(raw)}
	end

	return decoded
end

local runtimeSources={}
local baseEnv=(getfenv and getfenv(0)) or _G
local runtimeEnv=setmetatable({
	APP_RUNTIME_PATHS=RUNTIME_PATHS,
	APP_RUNTIME_SOURCES=runtimeSources,
	BOOT_BOT_API=BOT_API,
}, {
	__index=baseEnv,
})
runtimeEnv._G=runtimeEnv

for _,modulePath in ipairs(RUNTIME_PATHS) do
	local result=BOT_API.Post("/module/get",{path=modulePath})
	if not result or not result.ok or type(result.source)~="string" then
		error("Loader failed to fetch "..modulePath..": "..tostring(result and result.error or "unknown"))
	end
	runtimeSources[modulePath]=result.source

	local chunk,compileError=loadstring(result.source)
	if not chunk then
		error("Loader failed to compile "..modulePath..": "..tostring(compileError))
	end

	if setfenv then
		setfenv(chunk,runtimeEnv)
	end

	local ok,runError=pcall(chunk)
	if not ok then
		error("Loader failed while running "..modulePath..": "..tostring(runError))
	end
end
