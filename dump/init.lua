-- The sole public boundary for GUI implementation details.
local environment=(getfenv and getfenv()) or _G

local required={
	Connections=assert(DumpConnectionsModule,"dump connections missing"),
	Lifecycle=assert(DumpLifecycleModule,"dump lifecycle missing"),
	Input=assert(DumpInputModule,"dump input missing"),
	Syntax=assert(DumpSyntaxModule,"dump syntax missing"),
	Create=assert(DumpUICreateModule,"dump UI creator missing"),
	Adapter=assert(DumpUIAdapterModule,"dump UI adapter missing"),
	Api=assert(DumpApiServiceModule,"dump API service missing"),
	Modules=assert(DumpModuleLoaderServiceModule,"dump module service missing"),
	Persistence=assert(DumpPersistenceServiceModule,"dump persistence service missing"),
}
local appSource=type(appModuleSource)=="table" and appModuleSource.id or "gui"
local uiAdapter=required.Adapter.new(environment)
local uiCreator=required.Create.new(uiAdapter)

return{
	AppId="gui",
	UI=required.Syntax.new(uiCreator),
	Runtime={
		Connections=required.Connections,
		Lifecycle=required.Lifecycle,
		Input=required.Input.new(inputService,bindingToLabel,inputToBinding),
	},
	Services={
		Api=required.Api.new(botApi,appSource),
		Modules=required.Modules.new(environment,appSource),
		Persistence=required.Persistence.new(environment),
	},
}
