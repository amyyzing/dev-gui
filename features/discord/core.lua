local controller={}

local function clipboardSetter()
	if type(setclipboard)=="function" then return setclipboard end
	if type(toclipboard)=="function" then return toclipboard end
	if typeof(Clipboard)=="table" and type(Clipboard.set)=="function" then return Clipboard.set end
	return nil
end

function controller.new(app)
	local api={}
	local alive=true
	local listeners={}
	local snapshot={
		inviteLink=nil,
		buttonLabel="loading invite...",
		status="getting invite...",
		tone="muted",
	}

	local function publish(changes)
		for key,value in pairs(changes or{}) do snapshot[key]=value end
		for _,listener in pairs(listeners) do
			pcall(listener,snapshot)
		end
	end

	function api.Subscribe(listener)
		assert(type(listener)=="function","listener must be a function")
		local token={}
		listeners[token]=listener
		listener(snapshot)
		return function() listeners[token]=nil end
	end

	function api.Refresh()
		if not alive then return false end
		if not(app.botApi and type(app.botApi.Post)=="function") then
			snapshot.inviteLink=nil
			publish({buttonLabel="no invite link set",status="invite unavailable",tone="red"})
			return false
		end

		local ok,result=pcall(function()
			return app.botApi.Post("/invite-link/get",{})
		end)
		if not(ok and result and result.ok) then
			snapshot.inviteLink=nil
			publish({buttonLabel="no invite link set",status="invite failed",tone="red"})
			return false
		end

		local inviteLink=type(result.inviteLink)=="string" and result.inviteLink or nil
		snapshot.inviteLink=inviteLink
		publish({
			buttonLabel=inviteLink or "no invite link set",
			status=inviteLink and "click to copy" or "no invite yet",
			tone="muted",
		})
		return true
	end

	function api.Copy()
		if not snapshot.inviteLink then
			publish({status="no invite yet",tone="red"})
			return false
		end
		local setter=clipboardSetter()
		if not setter then
			publish({status="clipboard not here",tone="red"})
			return false
		end
		local ok=pcall(setter,snapshot.inviteLink)
		publish({status=ok and "copied" or "copy failed",tone=ok and "green" or "red"})
		return ok
	end

	function api.Destroy()
		if not alive then return end
		alive=false
		for token in pairs(listeners) do listeners[token]=nil end
	end

	task.spawn(function()
		api.Refresh()
		while alive do
			task.wait(20)
			if alive then api.Refresh() end
		end
	end)

	return api
end

return controller
