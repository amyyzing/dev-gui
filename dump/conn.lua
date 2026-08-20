local connections={}

local function disconnect(item)
	if item==nil then return end
	if type(item)=="function" then
		pcall(item)
		return
	end
	if type(item.Disconnect)=="function" then
		pcall(function() item:Disconnect() end)
	elseif type(item.Destroy)=="function" then
		pcall(function() item:Destroy() end)
	end
end

function connections.new()
	local items={}
	local alive=true
	local api={}

	function api.Add(item)
		if item==nil then return nil end
		if not alive then
			disconnect(item)
			return item
		end
		items[#items+1]=item
		return item
	end

	function api.Connect(signal,callback)
		if not alive then return nil end
		return api.Add(signal:Connect(callback))
	end

	function api.Remove(item,shouldDisconnect)
		for index=#items,1,-1 do
			if items[index]==item then
				table.remove(items,index)
				if shouldDisconnect~=false then disconnect(item) end
				return true
			end
		end
		return false
	end

	function api.Cleanup()
		for index=#items,1,-1 do
			disconnect(items[index])
			items[index]=nil
		end
	end

	function api.Destroy()
		if not alive then return end
		alive=false
		api.Cleanup()
	end

	function api.IsAlive()
		return alive
	end

	return api
end

return connections
