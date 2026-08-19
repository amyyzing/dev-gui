local lifecycle={}

function lifecycle.new(connectionsModule,name)
	assert(type(connectionsModule)=="table" and type(connectionsModule.new)=="function","connections module missing")
	local cleanup=connectionsModule.new()
	local alive=true
	local api={Name=tostring(name or "scope")}

	function api.Add(item)
		return cleanup.Add(item)
	end

	function api.Connect(signal,callback)
		return cleanup.Connect(signal,callback)
	end

	function api.Spawn(callback)
		assert(type(callback)=="function","callback must be a function")
		task.spawn(function()
			if alive then
				callback(api)
			end
		end)
	end

	function api.IsAlive()
		return alive
	end

	function api.Destroy()
		if not alive then return end
		alive=false
		cleanup.Destroy()
	end

	return api
end

return lifecycle
