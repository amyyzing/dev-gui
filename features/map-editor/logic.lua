-- applies map editor settings after the map is ready.

local mapEditor={}

function mapEditor.new(app,parent)
	return{
		Refresh=function() end,
		Destroy=function() end,
	}
end

return mapEditor