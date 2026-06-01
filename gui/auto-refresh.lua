local AutoRefresh={}

function AutoRefresh.new(ctx)
	local api={}
	local alive=ctx.alive or function() return true end
	local enabled=ctx.enabled~=false
	local interval=ctx.interval or 2.5
	local reloadPath=ctx.reloadPath or "main.lua"
	local watchPaths=ctx.watchPaths or {}
	local sourceCache=ctx.sources or {}
	local loadModuleFromSource=ctx.loadModuleFromSource
	local shouldReloadMain=ctx.shouldReloadMain or function() return false end
	local applyModuleChange=ctx.applyModuleChange or function() return false end
	local getRemoteSource=ctx.getRemoteSource
	local reloadFromSource=ctx.reloadFromSource
	local reloading=false
	local failed=false
	local fetchFailures={}

	local function fail(message,path,detail)
		if failed then
			return true
		end

		failed=true
		enabled=false

		local full=tostring(message or "Closing... encountered error")
		if path then
			full=full.." ("..tostring(path)..")"
		end
		if detail then
			full=full..": "..tostring(detail)
		end

		warn(full)

		if ctx.onError then
			pcall(ctx.onError,full,path,detail)
		end

		return true
	end

	local function fetchSource(path)
		if getRemoteSource then
			return getRemoteSource(path)
		end

		local result=ctx.BOT_API.Post("/module/get",{path=path})
		if not result or not result.ok or type(result.source)~="string" then
			return nil,result and result.error or "unknown"
		end

		return result.source,nil
	end

	local function runReload(path,source,changedPath,changedSource)
		if reloadFromSource then
			local ok,result=pcall(reloadFromSource,path,source,changedPath,changedSource)
			if not ok then
				return fail("Closing... encountered error",path,result)
			end

			return result~=false
		end

		if reloading then return true end

		local chunk,err=loadstring(source)
		if not chunk then
			sourceCache[path]=source
			if changedPath and changedPath~=path and changedSource then
				sourceCache[changedPath]=changedSource
			end
			return fail("Closing... encountered error",path,err)
		end

		reloading=true
		if ctx.setToolAlive then
			ctx.setToolAlive(false)
		end

		task.defer(function()
			local ok,reloadErr=pcall(chunk)
			if not ok then
				fail("Closing... encountered error",path,reloadErr)
			end
		end)

		return true
	end

	local function requestRefresh(changedPath,changedSource)
		if changedPath==reloadPath then
			warn("Auto-refreshing script after remote change:",changedPath)
			return runReload(changedPath,changedSource,changedPath,changedSource)
		end

		if shouldReloadMain(changedPath,nil) then
			local source,sourceErr=fetchSource(reloadPath)
			if not source then
				return fail("Closing... encountered error",reloadPath,sourceErr)
			end

			warn("Auto-refreshing script after runtime change:",changedPath)
			return runReload(reloadPath,source,changedPath,changedSource)
		end

		local module=nil
		if loadModuleFromSource then
			local err=nil
			module,err=loadModuleFromSource(changedPath,changedSource)
			if not module then
				return fail("Closing... encountered error",changedPath,err)
			end
		end

		if shouldReloadMain(changedPath,module) then
			local source,sourceErr=fetchSource(reloadPath)
			if not source then
				return fail("Closing... encountered error",reloadPath,sourceErr)
			end

			warn("Auto-refreshing script after module change:",changedPath)
			return runReload(reloadPath,source,changedPath,changedSource)
		end

		local ok,applied=pcall(applyModuleChange,changedPath,module)
		if not ok then
			return fail("Closing... encountered error",changedPath,applied)
		end

		if applied then
			return false
		end

		warn("Auto-refresh cached module after remote change:",changedPath)
		return false
	end

	function api.Start()
		if not enabled then return end

		task.spawn(function()
			task.wait(interval)

			while alive() and not failed do
				for _,path in ipairs(watchPaths) do
					if not alive() then
						return
					end

					local source,sourceErr=fetchSource(path)
					if source then
						fetchFailures[path]=0
						local previous=sourceCache[path]
						if previous~=nil and previous~=source then
							if requestRefresh(path,source) then
								return
							end
						end

						if previous==nil then
							sourceCache[path]=source
						end
					else
						fetchFailures[path]=(fetchFailures[path] or 0)+1
						if fetchFailures[path]>=3 then
							fail("Closing... encountered error",path,sourceErr or "remote source fetch failed")
							return
						end
					end

					task.wait(0.025)
				end

				task.wait(interval)
			end
		end)
	end

	return api
end

return AutoRefresh
