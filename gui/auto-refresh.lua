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
	local getRemoteManifest=ctx.getRemoteManifest
	local getRemoteSource=ctx.getRemoteSource
	local reloadFromSource=ctx.reloadFromSource
	local optionalPaths=ctx.optionalPaths or {}
	local reloading=false
	local failed=false
	local manifestFailed=false
	local buildId=nil
	local pathVersions={}
	local fetchFailures={}
	local optionalMissing={}

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

	local function manifestValue(manifest,key)
		return manifest and (manifest[key] or manifest[string.lower(key)] or manifest[string.upper(key)])
	end

	local function getManifestBuildId(manifest)
		local value=manifestValue(manifest,"buildId") or manifestValue(manifest,"version") or manifestValue(manifest,"revision")
		return value~=nil and tostring(value) or nil
	end

	local function getManifestChangedPaths(manifest,nextBuildId)
		local changed=manifestValue(manifest,"changedPaths") or manifestValue(manifest,"pathsChanged")
		if type(changed)=="table" and #changed>0 then
			return changed
		end

		if buildId~=nil and nextBuildId~=nil and nextBuildId~=buildId then
			return watchPaths
		end

		local versions=manifestValue(manifest,"versions") or manifestValue(manifest,"pathVersions")
		if type(versions)=="table" then
			local paths={}
			for _,path in ipairs(watchPaths) do
				local version=versions[path]
				if version~=nil and pathVersions[path]~=nil and tostring(version)~=pathVersions[path] then
					table.insert(paths,path)
				end
			end
			return paths
		end

		return{}
	end

	local function rememberManifest(manifest,nextBuildId)
		buildId=nextBuildId or buildId

		local versions=manifestValue(manifest,"versions") or manifestValue(manifest,"pathVersions")
		if type(versions)=="table" then
			for path,version in pairs(versions) do
				pathVersions[path]=tostring(version)
			end
		end
	end

	local function getManifestSource(manifest,path)
		local sources=manifestValue(manifest,"sources") or manifestValue(manifest,"modules")
		if type(sources)~="table" then
			return nil
		end

		local entry=sources[path]
		if type(entry)=="string" then
			return entry
		elseif type(entry)=="table" and type(entry.source)=="string" then
			return entry.source
		end

		return nil
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

	local function checkPathForSourceChange(path)
		local source,sourceErr=fetchSource(path)
		if source then
			fetchFailures[path]=0
			optionalMissing[path]=nil
			local previous=sourceCache[path]
			if previous~=nil and previous~=source then
				if requestRefresh(path,source) then
					return true
				end
				sourceCache[path]=source
			end

			if previous==nil then
				sourceCache[path]=source
			end
		else
			if optionalPaths[path] then
				fetchFailures[path]=0
				if not optionalMissing[path] then
					optionalMissing[path]=true
					warn("Auto-refresh skipping unavailable optional module:",path,sourceErr or "remote source fetch failed")
				end
			else
				fetchFailures[path]=(fetchFailures[path] or 0)+1
				if fetchFailures[path]>=3 then
					return fail("Closing... encountered error",path,sourceErr or "remote source fetch failed")
				end
			end
		end

		return false
	end

	local function legacySourcePoll()
		for _,path in ipairs(watchPaths) do
			if not alive() then
				return true
			end

			if checkPathForSourceChange(path) then
				return true
			end

			task.wait(0.005)
		end

		return false
	end

	local function manifestPoll()
		if not getRemoteManifest or manifestFailed then
			return legacySourcePoll()
		end

		local manifest,manifestErr=getRemoteManifest(buildId,pathVersions)
		if not manifest then
			manifestFailed=true
			warn("Auto-refresh manifest unavailable; falling back to source polling:",manifestErr or "unknown")
			return legacySourcePoll()
		end

		local nextBuildId=getManifestBuildId(manifest)
		local firstManifest=buildId==nil
		local changedPaths=firstManifest and {} or getManifestChangedPaths(manifest,nextBuildId)
		rememberManifest(manifest,nextBuildId)

		for _,path in ipairs(changedPaths) do
			if not alive() then
				return true
			end

			local source=getManifestSource(manifest,path)
			if not source then
				local sourceErr=nil
				source,sourceErr=fetchSource(path)
				if not source then
					if optionalPaths[path] then
						warn("Auto-refresh skipping unavailable optional module:",path,sourceErr or "remote source fetch failed")
					else
						return fail("Closing... encountered error",path,sourceErr or "remote source fetch failed")
					end
				end
			end

			if source then
				local previous=sourceCache[path]
				if previous~=source then
					if previous~=nil and requestRefresh(path,source) then
						return true
					end
					sourceCache[path]=source
				end
			end

			task.wait(0.005)
		end

		return false
	end

	function api.Start()
		if not enabled then return end

		task.spawn(function()
			task.wait(interval)

			while alive() and not failed do
				if manifestPoll() then
					return
				end

				task.wait(interval)
			end
		end)
	end

	return api
end

return AutoRefresh
