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
local runtimeEvents={}
local baseEnv=(getfenv and getfenv(0)) or _G

local function getSharedEnv()
	if type(getgenv)=="function" then
		local ok,env=pcall(getgenv)
		if ok and type(env)=="table" then
			return env
		end
	end

	return baseEnv
end

local sharedEnv=getSharedEnv()
local runtimeEnv

-- Optional console inspector. Set getgenv().HB_LOADER_DEBUG=true before loading to print events.
local function safeType(value)
	if type(typeof)=="function" then
		local ok,result=pcall(typeof,value)
		if ok then
			return result
		end
	end

	return type(value)
end

local function summarizeValue(value)
	local valueType=safeType(value)

	if valueType=="Instance" then
		local ok,name,className=pcall(function()
			return value.Name,value.ClassName
		end)
		if ok then
			return className..":"..name
		end
	end

	if type(value)=="table" then
		local count=0
		for _ in pairs(value) do
			count=count+1
		end

		return "table("..count..")"
	end

	return valueType.."("..tostring(value)..")"
end

local function sortedRuntimeKeys(limit)
	local keys={}
	local env=runtimeEnv or{}

	for key in pairs(env) do
		keys[#keys+1]=tostring(key)
	end

	table.sort(keys)

	if limit and #keys>limit then
		local trimmed={}
		for i=1,limit do
			trimmed[i]=keys[i]
		end
		trimmed[#trimmed+1]="... +"..tostring(#keys-limit).." more"
		return trimmed
	end

	return keys
end

local function recordRuntimeEvent(kind,path,status,message)
	local event={
		time=(type(os)=="table" and type(os.clock)=="function") and os.clock() or 0,
		kind=kind,
		path=path,
		status=status,
		message=message,
	}

	runtimeEvents[#runtimeEvents+1]=event

	if sharedEnv.HB_LOADER_DEBUG==true then
		warn("[HB loader]",kind,path or"",status or"",message or"")
	end

	return event
end

local inspector={}
inspector.Version="1"
inspector.Events=runtimeEvents
inspector.Sources=runtimeSources

function inspector.paths()
	local paths={}
	for i,path in ipairs(RUNTIME_PATHS) do
		paths[i]=path
	end
	return paths
end

function inspector.events(limit)
	limit=tonumber(limit) or #runtimeEvents
	local start=math.max(1,#runtimeEvents-limit+1)
	local lines={}

	for i=start,#runtimeEvents do
		local event=runtimeEvents[i]
		lines[#lines+1]=table.concat({
			tostring(i),
			tostring(event.kind or""),
			tostring(event.path or""),
			tostring(event.status or""),
			tostring(event.message or""),
		}," | ")
	end

	return table.concat(lines,"\n")
end

function inspector.keys(limit)
	return table.concat(sortedRuntimeKeys(tonumber(limit)),"\n")
end

function inspector.get(name)
	if not runtimeEnv then
		return nil
	end

	return rawget(runtimeEnv,tostring(name))
end

function inspector.describe(name)
	return summarizeValue(inspector.get(name))
end

function inspector.source(path,maxChars)
	local source=runtimeSources[tostring(path)]
	if type(source)~="string" then
		return nil
	end

	maxChars=tonumber(maxChars)
	if maxChars and maxChars>0 and #source>maxChars then
		return source:sub(1,maxChars).."\n-- truncated "..tostring(#source-maxChars).." chars"
	end

	return source
end

function inspector.modules()
	local rows={}

	for key,value in pairs(runtimeEnv or{}) do
		if type(key)=="string" and key:match("Module$") then
			rows[#rows+1]=key.." = "..summarizeValue(value)
		end
	end

	table.sort(rows)
	return table.concat(rows,"\n")
end

function inspector.guiTree(maxDepth)
	local root=runtimeEnv and rawget(runtimeEnv,"SG")
	if not root then
		return "SG is not available yet."
	end

	maxDepth=tonumber(maxDepth) or 4
	local lines={}

	local function instanceProp(obj,prop)
		local ok,value=pcall(function()
			return obj[prop]
		end)

		if ok then
			return value
		end

		return nil
	end

	local function walk(obj,depth)
		if depth>maxDepth then
			return
		end

		local name=instanceProp(obj,"Name") or tostring(obj)
		local className=instanceProp(obj,"ClassName") or safeType(obj)
		local visible=instanceProp(obj,"Visible")
		local enabled=instanceProp(obj,"Enabled")
		local size=instanceProp(obj,"Size")
		local position=instanceProp(obj,"Position")
		local suffix=""

		if visible~=nil then
			suffix=suffix.." visible="..tostring(visible)
		end
		if enabled~=nil then
			suffix=suffix.." enabled="..tostring(enabled)
		end
		if size~=nil then
			suffix=suffix.." size="..tostring(size)
		end
		if position~=nil then
			suffix=suffix.." pos="..tostring(position)
		end

		lines[#lines+1]=string.rep("  ",depth)..className.." "..name..suffix

		local childOk,children=pcall(function()
			return obj:GetChildren()
		end)
		if not childOk or type(children)~="table" then
			return
		end

		table.sort(children,function(a,b)
			return tostring(a.Name)<tostring(b.Name)
		end)

		for _,child in ipairs(children) do
			walk(child,depth+1)
		end
	end

	walk(root,0)
	return table.concat(lines,"\n")
end

function inspector.snapshot(maxDepth)
	return table.concat({
		"HB_INSPECTOR_BEGIN",
		inspector.report(),
		"runtime modules:",
		inspector.modules(),
		"gui tree:",
		inspector.guiTree(maxDepth or 5),
		"HB_INSPECTOR_END",
	},"\n")
end

function inspector.dumpToOutput(maxDepth)
	local text=inspector.snapshot(maxDepth)
	local chunkSize=3200
	local index=1
	local total=math.max(1,math.ceil(#text/chunkSize))

	for offset=1,#text,chunkSize do
		warn("[HB inspector dump "..tostring(index).."/"..tostring(total).."]\n"..text:sub(offset,offset+chunkSize-1))
		index=index+1
	end

	return text
end

function inspector.dumpToFile(path,maxDepth)
	if type(writefile)~="function" then
		return false,"writefile is not available."
	end

	path=tostring(path or "hb_loader_inspector.txt")
	local text=inspector.snapshot(maxDepth)
	local ok,err=pcall(function()
		writefile(path,text)
	end)

	if not ok then
		return false,tostring(err)
	end

	return true,path
end

function inspector.report()
	local loaded=0
	for _,path in ipairs(RUNTIME_PATHS) do
		if runtimeSources[path] then
			loaded=loaded+1
		end
	end

	return table.concat({
		"HB_LOADER_INSPECTOR",
		"runtime chunks: "..tostring(loaded).."/"..tostring(#RUNTIME_PATHS),
		"runtime keys: "..tostring(#sortedRuntimeKeys()),
		"recent events:",
		inspector.events(8),
	},"\n")
end

sharedEnv.HB_LOADER_INSPECTOR=inspector
baseEnv.HB_LOADER_INSPECTOR=inspector

runtimeEnv=setmetatable({
	APP_RUNTIME_PATHS=RUNTIME_PATHS,
	APP_RUNTIME_SOURCES=runtimeSources,
	APP_RUNTIME_MARKERS=RUNTIME_MARKERS,
	APP_LOADER_INSPECTOR=inspector,
	BOOT_BOT_API=BOT_API,
}, {
	__index=baseEnv,
})
runtimeEnv._G=runtimeEnv

for _,modulePath in ipairs(RUNTIME_PATHS) do
	recordRuntimeEvent("fetch",modulePath,"start")
	local result=BOT_API.Post(MODULE_GET_PATH,{path=modulePath})
	if not result or not result.ok or type(result.source)~="string" then
		recordRuntimeEvent("fetch",modulePath,"failed",tostring(result and result.error or "unknown"))
		error("Loader failed to fetch "..modulePath..": "..tostring(result and result.error or "unknown"))
	end

	local verified,verifyErr=verifyRuntimeSource(modulePath,result.source)
	if not verified then
		recordRuntimeEvent("verify",modulePath,"failed",tostring(verifyErr))
		error("Loader rejected "..modulePath..": "..tostring(verifyErr))
	end

	runtimeSources[modulePath]=result.source
	recordRuntimeEvent("fetch",modulePath,"ok",tostring(#result.source).." bytes")

	local chunk,compileError=loadstring(result.source)
	if not chunk then
		recordRuntimeEvent("compile",modulePath,"failed",tostring(compileError))
		error("Loader failed to compile "..modulePath..": "..tostring(compileError))
	end

	if setfenv then
		setfenv(chunk,runtimeEnv)
	end

	recordRuntimeEvent("run",modulePath,"start")
	local ok,runError=pcall(chunk)
	if not ok then
		recordRuntimeEvent("run",modulePath,"failed",tostring(runError))
		error("Loader failed while running "..modulePath..": "..tostring(runError))
	end
	recordRuntimeEvent("run",modulePath,"ok")
end

recordRuntimeEvent("loader","runtime","complete")

if sharedEnv.HB_LOADER_DEBUG==true then
	warn(inspector.report())
end

if sharedEnv.HB_LOADER_DEBUG_DUMP==true then
	inspector.dumpToOutput(sharedEnv.HB_LOADER_DEBUG_TREE_DEPTH or 5)
end

if sharedEnv.HB_LOADER_DEBUG_WRITEFILE==true then
	local ok,result=inspector.dumpToFile(sharedEnv.HB_LOADER_DEBUG_FILE or "hb_loader_inspector.txt",sharedEnv.HB_LOADER_DEBUG_TREE_DEPTH or 5)
	if sharedEnv.HB_LOADER_DEBUG==true then
		warn("[HB loader] writefile dump",ok and "ok" or "failed",result or "")
	end
end
