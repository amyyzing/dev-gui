-- applies map editor settings after the map is ready.

local MapEditor={}

function MapEditor.new(app,parent)
	return{
		Refresh=function() end,
		Destroy=function() end,
	}
end

return MapEditor