local discord={}

function discord.new(app,page)
	assert(app.DiscordControllerModule,"Discord controller module missing")
	assert(app.DiscordViewModule,"Discord view module missing")
	assert(app.UI,"dev-gui UI syntax missing")

	local controller=app.DiscordControllerModule.new({botApi=app.botApi})
	local view=app.DiscordViewModule.new({UI=app.UI},page,controller)
	local api={}

	api.Refresh=controller.Refresh

	function api.Destroy()
		if view then
			view.Destroy()
			view=nil
		end
		if controller then
			controller.Destroy()
			controller=nil
		end
	end

	return api
end

return discord
