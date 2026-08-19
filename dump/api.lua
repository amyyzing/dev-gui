local service={}

function service.new(botApi,moduleSource)
	local api={}

	function api.Post(path,body)
		if not(botApi and type(botApi.Post)=="function") then
			return{ok=false,error="bot api missing"}
		end
		local payload=table.clone(type(body)=="table" and body or{})
		if path=="/module/get" or path=="/module/batch" or path=="/module/manifest" then
			payload.source=payload.source or moduleSource
		end
		return botApi.Post(path,payload)
	end

	return api
end

return service
