-- HB_LOADER_V2
local HttpService=game:GetService("HttpService")

local TRUSTED_API_URL="https://lint-bot-production.up.railway.app"
local MODULE_GET_PATH="/module/get"
local MAX_MODULE_BYTES=300000

local RUNTIME_PATHS={
	"runtime/loader-part-1.lua",
	"runtime/loader-part-2.lua",
	"runtime/loader-part-3.lua",
	"runtime/loader-part-4.lua",
	"runtime/loader-part-5.lua",
}

local RUNTIME_MARKERS={
	["runtime/loader-part-1.lua"]="HB_RUNTIME_PART_1",
	["runtime/loader-part-2.lua"]="HB_RUNTIME_PART_2",
	["runtime/loader-part-3.lua"]="HB_RUNTIME_PART_3",
	["runtime/loader-part-4.lua"]="HB_RUNTIME_PART_4",
	["runtime/loader-part-5.lua"]="HB_RUNTIME_PART_5",
}

local RUNTIME_PATH_SET={}
for _,path in ipairs(RUNTIME_PATHS) do
	RUNTIME_PATH_SET[path]=true
end

local function getApiKey()
	return table.concat({"the","key","to","heaven"})
end

local BOT_API={
	Url=TRUSTED_API_URL,
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
	if path~=MODULE_GET_PATH then
		return{ok=false,error="API path blocked: "..tostring(path)}
	end

	if BOT_API.Url~=TRUSTED_API_URL then
		return{ok=false,error="API URL verification failed."}
	end

	if not body or not RUNTIME_PATH_SET[body.path] then
		return{ok=false,error="Runtime path blocked: "..tostring(body and body.path)}
	end

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

local function verifyRuntimeSource(modulePath,source)
	if not RUNTIME_PATH_SET[modulePath] then
		return false,"Runtime path is not allowed."
	end

	if type(source)~="string" or source=="" then
		return false,"Runtime source missing."
	end

	if #source>MAX_MODULE_BYTES then
		return false,"Runtime source too large."
	end

	local marker=RUNTIME_MARKERS[modulePath]
	if marker and not source:find(marker,1,true) then
		return false,"Runtime marker verification failed."
	end

	return true,nil
end

local runtimeSources={}
local baseEnv=(getfenv and getfenv(0)) or _G
local runtimeEnv=setmetatable({
	APP_RUNTIME_PATHS=RUNTIME_PATHS,
	APP_RUNTIME_SOURCES=runtimeSources,
	APP_RUNTIME_MARKERS=RUNTIME_MARKERS,
	BOOT_BOT_API=BOT_API,
}, {
	__index=baseEnv,
})
runtimeEnv._G=runtimeEnv

for _,modulePath in ipairs(RUNTIME_PATHS) do
	local result=BOT_API.Post(MODULE_GET_PATH,{path=modulePath})
	if not result or not result.ok or type(result.source)~="string" then
		error("Loader failed to fetch "..modulePath..": "..tostring(result and result.error or "unknown"))
	end

	local verified,verifyErr=verifyRuntimeSource(modulePath,result.source)
	if not verified then
		error("Loader rejected "..modulePath..": "..tostring(verifyErr))
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
