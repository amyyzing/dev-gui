local service={}

function service.new(environment)
	local api={}

	local function dataSave()
		return rawget(environment,"DataSaveAPI")
	end

	function api.Load()
		local current=dataSave()
		if current and type(current.Load)=="function" then return current.Load() end
		return false,"persistence unavailable"
	end

	function api.Schedule()
		local current=dataSave()
		if current and type(current.Schedule)=="function" then return current.Schedule() end
		return false,"persistence unavailable"
	end

	function api.SaveNow()
		local current=dataSave()
		if current and type(current.SaveNow)=="function" then return current.SaveNow() end
		return false,"persistence unavailable"
	end

	return api
end

return service
