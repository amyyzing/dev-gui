local view={}

function view.new(app,page,controller)
	assert(app.UI,"gui UI syntax missing")
	assert(controller,"Discord controller missing")

	local UI=app.UI
	local handles={}
	local section=UI.createSection(page,{
		id="DiscordCommunity",
		title="Discord",
		description="Community invite",
		order=3,
	})
	handles[#handles+1]=section

	local linkButton=UI.createButton(section.instance,{
		id="DiscordInvite",
		label="loading invite...",
		order=1,
		textXAlignment=Enum.TextXAlignment.Left,
		textTruncate=Enum.TextTruncate.AtEnd,
		onClick=controller.Copy,
	})
	handles[#handles+1]=linkButton

	local status=UI.createStatus(section.instance,{
		id="DiscordInviteStatus",
		label="getting invite...",
		order=2,
	})
	handles[#handles+1]=status

	local unsubscribe=controller.Subscribe(function(state)
		linkButton.set(state.buttonLabel)
		status.set(state.status)
	end)

	local api={}
	function api.Destroy()
		if unsubscribe then
			unsubscribe()
			unsubscribe=nil
		end
		for index=#handles,1,-1 do
			local handle=handles[index]
			if handle and type(handle.destroy)=="function" then
				handle.destroy()
			end
			handles[index]=nil
		end
	end

	return api
end

return view
