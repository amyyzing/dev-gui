local MapEditor={}

function MapEditor.new(ctx,parent)
	return{
		Refresh=function() end,
		Destroy=function() end,
	}
end

return MapEditor