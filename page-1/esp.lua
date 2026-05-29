local ESP={}

local UIS=game:GetService("UserInputService")

local function safeDisconnect(conn)
	if conn and typeof(conn)=="RBXScriptConnection" then
		pcall(function()
			conn:Disconnect()
		end)
	end
end

function ESP.new(ctx,parent)
	local makeSection=ctx.makeSection
	local buildToggleRow=ctx.buildToggleRow
	local inputToBinding=ctx.inputToBinding
	local state=ctx.State
	local api={}
	local sectionBody=nil
	local sectionFrame=nil
	local toggle=nil
	local keybindConn=nil

	local function isGameplay()
		if ctx.getCurrentModeKey then
			return ctx.getCurrentModeKey()=="mode1"
		end

		return true
	end

	local function refreshFooter()
		if ctx.refreshESPStatus then
			pcall(ctx.refreshESPStatus,state.actionStatusOn,isGameplay())
		end
	end

	local function changed()
		if ctx.onChanged then
			pcall(ctx.onChanged,state)
		end

		refreshFooter()
	end

	local function syncControls()
		local available=isGameplay()

		if not available and state.actionStatusOn then
			state.actionStatusOn=false
		end

		if sectionFrame then
			sectionFrame.Visible=available
		elseif sectionBody then
			sectionBody.Visible=available
		end

		if toggle then
			toggle.set(available and state.actionStatusOn)
		end

		refreshFooter()
	end

	function api.SetESPState(value,fire)
		state.actionStatusOn=(value and isGameplay()) and true or false
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.Refresh()
		syncControls()
	end

	function api.Reset()
		api.SetESPState(false,true)
	end

	function api.Destroy()
		safeDisconnect(keybindConn)
		keybindConn=nil

		if sectionFrame and sectionFrame.Parent then
			sectionFrame:Destroy()
		elseif sectionBody and sectionBody.Parent then
			sectionBody:Destroy()
		end

		if ctx.refreshESPStatus then
			pcall(ctx.refreshESPStatus,false,false)
		end
	end

	sectionBody=makeSection(parent,3,"ESP","Gameplay only")
	sectionFrame=sectionBody and sectionBody.Parent or nil

	toggle=buildToggleRow(sectionBody,"ESP",state.actionStatusOn,function(v)
		api.SetESPState(v,true)
	end)

	keybindConn=UIS.InputBegan:Connect(function(input,processed)
		if processed or not isGameplay() then return end

		local getKey=ctx.getESPToggleKey or ctx.getActionToggleKey
		local key=getKey and getKey() or Enum.KeyCode.Unknown
		if not key or key==Enum.KeyCode.Unknown then return end

		local binding=inputToBinding and inputToBinding(input) or nil
		if binding~=nil and binding==key then
			api.SetESPState(not state.actionStatusOn,true)
		end
	end)

	syncControls()
	return api
end

return ESP
