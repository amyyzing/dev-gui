local ESPOffense={}

function ESPOffense.new()
	local api={}

	function api.Start() end
	function api.Stop() end
	function api.Refresh() end
	function api.Destroy() end

	return api
end

return ESPOffense
