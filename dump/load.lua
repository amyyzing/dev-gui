local service={}

function service.new(environment,moduleSource)
	local api={}

	function api.Load(path)
		local loader=rawget(environment,"loadRemoteModule")
		if type(loader)~="function" then return nil,"module loader missing" end
		return loader(path)
	end

	function api.Source()
		return moduleSource
	end

	function api.IsLoaded(path)
		local cache=rawget(environment,"moduleCache")
		return type(cache)=="table" and cache[path]~=nil
	end

	return api
end

return service
