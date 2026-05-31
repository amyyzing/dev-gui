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
			return reloadFromSource(path,source,changedPath,changedSource)
		end

		if reloading then return end

		local chunk,err=loadstring(source)
		if not chunk then
			warn("Auto-refresh found bad source:",path,err)
			sourceCache[path]=source
			if changedPath and changedPath~=path and changedSource then
				sourceCache[changedPath]=changedSource
			end
			return
		end

		reloading=true
		if ctx.setToolAlive then
			ctx.setToolAlive(false)
		end

		task.defer(function()
			local ok,reloadErr=pcall(chunk)
			if not ok then
				warn("Auto-refresh reload failed:",reloadErr)
			end
		end)
	end

	local function requestRefresh(changedPath,changedSource)
		if changedPath==reloadPath then
			warn("Auto-refreshing script after remote change:",changedPath)
			runReload(changedPath,changedSource,changedPath,changedSource)
			return
		end

		if shouldReloadMain(changedPath,nil) then
			local source,sourceErr=fetchSource(reloadPath)
			if not source then
				warn("Auto-refresh detected a reload-required chunk change in "..changedPath..", but "..reloadPath.." could not be fetched:",sourceErr)
				return
			end

			warn("Auto-refreshing script after runtime change:",changedPath)
			runReload(reloadPath,source,changedPath,changedSource)
			return
		end

		local module=nil
		if loadModuleFromSource then
			local err=nil
			module,err=loadModuleFromSource(changedPath,changedSource)
			if not module then
				warn("Auto-refresh found bad module source:",changedPath,err)
				return
			end
		end

		if shouldReloadMain(changedPath,module) then
			local source,sourceErr=fetchSource(reloadPath)
			if not source then
				warn("Auto-refresh detected a reload-required module change in "..changedPath..", but "..reloadPath.." could not be fetched:",sourceErr)
				return
			end

			warn("Auto-refreshing script after module change:",changedPath)
			runReload(reloadPath,source,changedPath,changedSource)
			return
		end

		if applyModuleChange(changedPath,module) then
			return
		end

		warn("Auto-refresh cached module after remote change:",changedPath)
	end

	function api.Start()
		if not enabled then return end

		task.spawn(function()
			task.wait(interval)

			while alive() do
				for _,path in ipairs(watchPaths) do
					if not alive() then
						return
					end

					local source=fetchSource(path)
					if source then
						local previous=sourceCache[path]
						if previous~=nil and previous~=source then
							requestRefresh(path,source)
							return
						end

						if previous==nil then
							sourceCache[path]=source
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
