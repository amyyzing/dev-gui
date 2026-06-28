-- logic half for this feature. avoid starting loops unless the feature is enabled.

local MapEditor={}

function MapEditor.new(ctx,parent)
	return{
		Refresh=function() end,
		Destroy=function() end,
	}
end

return MapEditor