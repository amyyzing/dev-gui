local input={}

function input.new(inputService,bindingToLabel,inputToBinding)
	local api={}

	function api.ToBinding(inputObject)
		if type(inputToBinding)=="function" then
			return inputToBinding(inputObject)
		end
		return inputObject and inputObject.KeyCode or nil
	end

	function api.ToLabel(binding)
		if type(bindingToLabel)=="function" then
			return bindingToLabel(binding)
		end
		return tostring(binding or "NIL")
	end

	function api.CaptureNext(callback)
		assert(inputService and inputService.InputBegan,"input service missing")
		assert(type(callback)=="function","callback must be a function")
		local connection
		connection=inputService.InputBegan:Connect(function(inputObject,processed)
			if processed then return end
			if connection then
				connection:Disconnect()
			end
			callback(api.ToBinding(inputObject))
		end)
		return connection
	end

	return api
end

return input
