local ExternalRenderer={}

local ICON_ID=4483362458

local LIB_NAMES={
	{Id="original",Name="Original"},
	{Id="visual",Name="Visual"},
	{Id="rayfield",Name="Rayfield"},
	{Id="windui",Name="WindUI"},
	{Id="linoria",Name="Linoria"},
	{Id="obsidian",Name="Obsidian"},
}

local OBSIDIAN_TAB_ICONS={
	["Main"]="user",
	["Map Editor"]="map",
	["Server"]="server",
	["GUI Customizer"]="palette",
	["Keybinds"]="keyboard",
	["UI Settings"]="settings",
	["Settings"]="settings",
}

local function callMethod(obj,method,...)
	if not obj then
		return nil
	end

	local fn=obj[method]
	if type(fn)~="function" then
		return nil
	end

	local ok,result=pcall(fn,obj,...)
	if ok then
		return result
	end

	warn("External UI method failed:",method,result)
	return nil
end

local function callAny(obj,methods,...)
	for _,method in ipairs(methods) do
		local result=callMethod(obj,method,...)
		if result~=nil then
			return result
		end
	end

	return nil
end

local function roundStep(decimals)
	local d=tonumber(decimals) or 0
	if d<=0 then
		return 1
	end

	return 1/(10^d)
end

local function asNumber(value,fallback,minVal,maxVal)
	local n=tonumber(value)
	if n==nil then
		n=fallback
	end

	n=tonumber(n) or 0
	if minVal~=nil and maxVal~=nil then
		n=math.clamp(n,minVal,maxVal)
	end

	return n
end

local function colorFromStyle(style,prefix,fallback)
	style=style or {}
	return Color3.fromRGB(
		math.clamp(math.floor((style[prefix.."R"] or fallback.R*255)+0.5),0,255),
		math.clamp(math.floor((style[prefix.."G"] or fallback.G*255)+0.5),0,255),
		math.clamp(math.floor((style[prefix.."B"] or fallback.B*255)+0.5),0,255)
	)
end

local function keyName(value,fallback)
	fallback=fallback or "Unknown"

	if type(typeof)=="function" then
		local ok,kind=pcall(typeof,value)
		if ok and kind=="EnumItem" and value.Name then
			return value.Name
		end
	end

	local text=tostring(value or fallback)
	local enumSuffix=text:match("Enum%.%w+%.(.+)$")
	if enumSuffix then
		return enumSuffix
	end

	if text=="" then
		return fallback
	end

	return text
end

function ExternalRenderer.new(ctx)
	ctx=ctx or {}

	local api={}
	local currentId="original"
	local currentLib=nil
	local currentWindow=nil
	local currentScreenGuis={}
	local active=false
	local visible=true

	local function collectScreenGuis()
		local result={}
		local containers={}

		local players=game:GetService("Players")
		if players and players.LocalPlayer then
			local playerGui=players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
			if playerGui then
				containers[#containers+1]=playerGui
			end
		end

		local okCore,coreGui=pcall(function()
			return game:GetService("CoreGui")
		end)
		if okCore and coreGui then
			containers[#containers+1]=coreGui
		end

		for _,container in ipairs(containers) do
			for _,child in ipairs(container:GetChildren()) do
				if child:IsA("ScreenGui") then
					result[child]=true
				end
			end
		end

		return result
	end

	local function diffScreenGuis(before)
		local after=collectScreenGuis()
		local result={}

		for gui in pairs(after) do
			if not before[gui] then
				result[#result+1]=gui
			end
		end

		return result
	end

	local function selectedId()
		return tostring((ctx.UI_STYLE and ctx.UI_STYLE.UILib) or "original"):lower()
	end

	local function setOriginalVisible(value)
		if ctx.MainFrame and ctx.MainFrame.root then
			ctx.MainFrame.root.Visible=value and visible
		end
	end

	local function safeDestroy()
		if currentWindow then
			callAny(currentWindow,{"Destroy","Unload","Close","DestroyUI"})
		end

		if currentLib then
			callAny(currentLib,{"DestroyUI","Unload","Destroy"})
		end

		for _,gui in ipairs(currentScreenGuis) do
			if gui and gui.Parent then
				pcall(function()
					gui:Destroy()
				end)
			end
		end

		currentWindow=nil
		currentLib=nil
		currentScreenGuis={}
		active=false
	end

	local renderer={}

	function renderer:createWindow(kind,library)
		if kind=="visual" then
			return callMethod(library,"CreateWindow","untitled gui","hello","Visual UI Library","rbxassetid://10618928818",false,"HitboxUI","Default")
		elseif kind=="rayfield" then
			return callMethod(library,"CreateWindow",{
				Name="untitled gui",
				LoadingTitle="untitled gui",
				LoadingSubtitle="hello",
				ConfigurationSaving={Enabled=false},
				Discord={Enabled=false},
				KeySystem=false,
			})
		elseif kind=="windui" then
			return callMethod(library,"CreateWindow",{
				Title="untitled gui",
				Author="hello",
				Folder="HitboxUI",
				Size=UDim2.fromOffset(760,540),
				HideSearchBar=true,
				OpenButton={Enabled=false},
				Topbar={Height=44,ButtonsType="Mac"},
			})
		elseif kind=="linoria" then
			return callMethod(library,"CreateWindow",{
				Title="untitled gui",
				Center=true,
				AutoShow=true,
				TabPadding=8,
				MenuFadeTime=0.2,
			})
		elseif kind=="obsidian" then
			library.ForceCheckbox=false
			return callMethod(library,"CreateWindow",{
				Title="untitled gui",
				Footer="hello",
				Center=true,
				AutoShow=true,
				Icon=95816097006870,
			})
		end

		return nil
	end

	function renderer:createPage(title,icon)
		icon=icon or ICON_ID

		if self.kind=="visual" then
			local tab=callMethod(self.window,"CreateTab",title,true,"rbxassetid://"..tostring(icon),Vector2.new(524,44),Vector2.new(36,36))
			return{root=tab,control=tab,left=0,right=0}
		elseif self.kind=="rayfield" then
			local tab=callMethod(self.window,"CreateTab",title,icon)
			return{root=tab,control=tab,left=0,right=0}
		elseif self.kind=="windui" then
			local tab=callMethod(self.window,"Tab",{Title=title,Icon="house"})
			if not tab then
				local section=callMethod(self.window,"Section",{Title="Pages"})
				tab=section and callMethod(section,"Tab",{Title=title,Icon="house"})
			end
			return{root=tab,control=tab,left=0,right=0}
		elseif self.kind=="obsidian" then
			local tab=callMethod(self.window,"AddTab",title,OBSIDIAN_TAB_ICONS[title] or "layout-list")
			return{root=tab,control=tab,left=0,right=0}
		elseif self.kind=="linoria" then
			local tab=callMethod(self.window,"AddTab",title)
			return{root=tab,control=tab,left=0,right=0}
		end

		return nil
	end

	function renderer:createSection(page,title,side)
		if not page then return nil end

		if self.kind=="visual" then
			return callMethod(page.root,"CreateSection",title) or page.control
		elseif self.kind=="rayfield" then
			callMethod(page.root,"CreateSection",title)
			return page.root
		elseif self.kind=="windui" then
			return callMethod(page.root,"Section",{Title=title}) or callMethod(page.root,"Group") or page.root
		elseif self.kind=="linoria" or self.kind=="obsidian" then
			local useRight=side=="right"
			if not side then
				useRight=page.left>page.right
			end

			if useRight then
				page.right=page.right+1
				return callAny(page.root,{"AddRightGroupbox","AddGroupbox"},title) or page.root
			end

			page.left=page.left+1
			return callAny(page.root,{"AddLeftGroupbox","AddGroupbox"},title) or page.root
		end

		return page.control
	end

	function renderer:addLabel(section,text)
		if not section then return end

		if self.kind=="visual" then
			callMethod(section,"CreateLabel",text)
		elseif self.kind=="rayfield" then
			callAny(section,{"CreateParagraph","CreateLabel"},{Title=text,Content=""})
		elseif self.kind=="windui" then
			callAny(section,{"Paragraph","Label"},{Title=text,Desc=""})
		else
			callAny(section,{"AddLabel","Label"},text)
		end
	end

	function renderer:addButton(section,title,callback)
		if not section then return nil end
		callback=callback or function() end

		if self.kind=="visual" then
			return callMethod(section,"CreateButton",title,callback)
		elseif self.kind=="rayfield" then
			return callMethod(section,"CreateButton",{Name=title,Callback=callback})
		elseif self.kind=="windui" then
			return callMethod(section,"Button",{Title=title,Justify="Center",Icon="",Callback=callback})
		else
			return callMethod(section,"AddButton",{Text=title,Func=callback})
		end
	end

	function renderer:addToggle(section,title,default,callback)
		if not section then return nil end
		default=default and true or false
		callback=callback or function() end

		if self.kind=="visual" then
			return callMethod(section,"CreateToggle",title,default,Color3.fromRGB(0,125,255),0.25,callback)
		elseif self.kind=="rayfield" then
			return callMethod(section,"CreateToggle",{Name=title,CurrentValue=default,Flag="hb_"..title:gsub("%W","_"),Callback=callback})
		elseif self.kind=="windui" then
			return callMethod(section,"Toggle",{Title=title,Value=default,Callback=callback})
		elseif self.kind=="linoria" or self.kind=="obsidian" then
			return callMethod(section,"AddToggle","hb_"..title:gsub("%W","_"),{Text=title,Default=default,Callback=callback})
		end

		return nil
	end

	function renderer:addTextbox(section,title,value,callback,numeric)
		if not section then return nil end
		value=tostring(value or "")
		callback=callback or function() end

		if self.kind=="visual" then
			return callMethod(section,"CreateTextbox",title,value,callback)
		elseif self.kind=="rayfield" then
			return callMethod(section,"CreateInput",{Name=title,PlaceholderText=value,RemoveTextAfterFocusLost=false,Callback=callback})
		elseif self.kind=="windui" then
			return callMethod(section,"Input",{Title=title,Value=value,Placeholder=value,Callback=callback})
		elseif self.kind=="linoria" or self.kind=="obsidian" then
			return callMethod(section,"AddInput","hb_"..title:gsub("%W","_"),{Text=title,Default=value,Numeric=numeric==true,Finished=true,Callback=callback})
		end

		return nil
	end

	function renderer:addSlider(section,title,minVal,maxVal,default,decimals,callback)
		if not section then return nil end
		default=asNumber(default,minVal,minVal,maxVal)
		callback=callback or function() end
		local step=roundStep(decimals)
		local slider=nil

		if self.kind=="visual" then
			slider=callMethod(section,"CreateSlider",title,minVal,maxVal,default,Color3.fromRGB(0,125,255),callback)
		elseif self.kind=="rayfield" then
			slider=callMethod(section,"CreateSlider",{Name=title,Range={minVal,maxVal},Increment=step,CurrentValue=default,Flag="hb_"..title:gsub("%W","_"),Callback=callback})
		elseif self.kind=="windui" then
			slider=callMethod(section,"Slider",{Title=title,Step=step,IsTextbox=true,Value={Min=minVal,Max=maxVal,Default=default},Callback=callback})
		elseif self.kind=="linoria" or self.kind=="obsidian" then
			slider=callMethod(section,"AddSlider","hb_"..title:gsub("%W","_"),{Text=title,Default=default,Min=minVal,Max=maxVal,Rounding=decimals or 0,Callback=callback})
		end

		if self.kind~="windui" then
			self:addTextbox(section,title.." value",default,function(text)
				local value=asNumber(text,default,minVal,maxVal)
				callback(value)
				callAny(slider,{"Set","SetValue","Update","UpdateSlider"},value)
			end,true)
		end

		return slider
	end

	function renderer:addColorPicker(section,title,color,callback)
		if not section then return nil end
		color=color or Color3.fromRGB(255,255,255)
		callback=callback or function() end

		if self.kind=="visual" then
			return callMethod(section,"CreateColorpicker",title,color,0.25,callback)
		elseif self.kind=="rayfield" then
			return callMethod(section,"CreateColorPicker",{Name=title,Color=color,Flag="hb_"..title:gsub("%W","_"),Callback=callback})
		elseif self.kind=="windui" then
			return callMethod(section,"Colorpicker",{Title=title,Default=color,Callback=callback})
		elseif self.kind=="linoria" or self.kind=="obsidian" then
			local label=callMethod(section,"AddLabel",title)
			if label then
				return callMethod(label,"AddColorPicker","hb_"..title:gsub("%W","_"),{Default=color,Title=title,Callback=callback})
			end
		end

		return nil
	end

	function renderer:addDropdown(section,title,values,default,callback)
		values=values or {}
		callback=callback or function() end

		if self.kind=="visual" then
			return callMethod(section,"CreateDropdown",title,values,default,0.25,callback)
		elseif self.kind=="rayfield" then
			return callMethod(section,"CreateDropdown",{Name=title,Options=values,CurrentOption=default,Flag="hb_"..title:gsub("%W","_"),Callback=callback})
		elseif self.kind=="windui" then
			return callMethod(section,"Dropdown",{Title=title,Values=values,Value=default,Callback=callback})
		elseif self.kind=="linoria" or self.kind=="obsidian" then
			return callMethod(section,"AddDropdown","hb_"..title:gsub("%W","_"),{Text=title,Values=values,Default=default,Callback=callback})
		end

		return nil
	end

	function renderer:addKeybind(section,title,current,callback)
		callback=callback or function() end
		local key=keyName(current,"Unknown")

		if self.kind=="visual" then
			return callMethod(section,"CreateKeybind",title,key,callback)
		elseif self.kind=="rayfield" then
			return callMethod(section,"CreateKeybind",{Name=title,CurrentKeybind=key,Flag="hb_"..title:gsub("%W","_"),Callback=callback})
		elseif self.kind=="windui" then
			return callMethod(section,"Keybind",{Title=title,Value=keyName(current,"G"),Callback=callback})
		elseif self.kind=="linoria" or self.kind=="obsidian" then
			local label=callMethod(section,"AddLabel",title)
			if label then
				return callMethod(label,"AddKeyPicker","hb_"..title:gsub("%W","_"),{Default=key,NoUI=false,Text=title,Callback=function() end,ChangedCallback=callback})
			end
		end

		return self:addTextbox(section,title,key,callback,false)
	end

	local function buildMain(self)
		local state=ctx.PAGE1_STATE or {}
		local apis=ctx.PAGE1_APIS or {}
		local page=self:createPage("Main",ICON_ID)
		if not page then return end

		local hitbox=self:createSection(page,"Hitbox","left")
		self:addToggle(hitbox,"Enabled",state.hitboxOn,function(value)
			if apis.Hitbox and apis.Hitbox.SetHitboxLock then apis.Hitbox.SetHitboxLock(value,true) end
		end)
		self:addLabel(hitbox,string.format("Size  X: %.2f    Y: %.2f    Z: %.2f",state.sizeX or 2.52,state.sizeY or 5.4,state.sizeZ or 1.41))
		self:addSlider(hitbox,"X",0.2,50,state.sizeX or 2.52,2,function(v)
			state.sizeX=v
			if apis.Hitbox and apis.Hitbox.SetHitboxSize then apis.Hitbox.SetHitboxSize(state.sizeX,state.sizeY,state.sizeZ,true) end
		end)
		self:addSlider(hitbox,"Y",0.2,50,state.sizeY or 5.4,2,function(v)
			state.sizeY=v
			if apis.Hitbox and apis.Hitbox.SetHitboxSize then apis.Hitbox.SetHitboxSize(state.sizeX,state.sizeY,state.sizeZ,true) end
		end)
		self:addSlider(hitbox,"Z",0.2,50,state.sizeZ or 1.41,2,function(v)
			state.sizeZ=v
			if apis.Hitbox and apis.Hitbox.SetHitboxSize then apis.Hitbox.SetHitboxSize(state.sizeX,state.sizeY,state.sizeZ,true) end
		end)
		self:addSlider(hitbox,"Alpha",0,1,state.targetTransparency or 0.7,2,function(v)
			if apis.Hitbox and apis.Hitbox.SetTransparency then apis.Hitbox.SetTransparency(v,true) end
		end)

		local gravity=self:createSection(page,"Gravity","left")
		self:addToggle(gravity,"Enabled",state.gravityEnabled,function(value)
			if apis.Gravity and apis.Gravity.SetGravityState then apis.Gravity.SetGravityState(value,true) end
		end)
		self:addSlider(gravity,"Gravity",0,1000,state.gravityValue or 196.2,1,function(v)
			if apis.Gravity and apis.Gravity.SetGravityValue then apis.Gravity.SetGravityValue(v,true) end
		end)

		local speed=self:createSection(page,"Speed","left")
		self:addToggle(speed,"Enabled",state.speedEnabled,function(value)
			if apis.Speed and apis.Speed.SetSpeedState then apis.Speed.SetSpeedState(value,true,true) end
		end)
		self:addSlider(speed,"Speed",0,100,state.speedValue or 18,0,function(v)
			if apis.Speed and apis.Speed.SetSpeedValue then apis.Speed.SetSpeedValue(v,true) end
		end)

		local params=self:createSection(page,"Game Params","left")
		self:addToggle(params,"Enabled",state.gameParamsEnabled,function(value)
			if apis.GameParams and apis.GameParams.SetGameParamsState then apis.GameParams.SetGameParamsState(value,true) end
		end)
		self:addSlider(params,"Stamina Regeneration",0,50,state.staminaRegenValue or 10,1,function(v)
			if apis.GameParams and apis.GameParams.SetStaminaRegenValue then apis.GameParams.SetStaminaRegenValue(v,true) end
		end)
		self:addSlider(params,"Stamina Depletion",0,50,state.staminaDepleteValue or 10,0,function(v)
			if apis.GameParams and apis.GameParams.SetStaminaDepleteValue then apis.GameParams.SetStaminaDepleteValue(v,true) end
		end)
		self:addSlider(params,"Jump",0,300,state.jumpPowerValue or 53.5,1,function(v)
			if apis.GameParams and apis.GameParams.SetJumpPowerValue then apis.GameParams.SetJumpPowerValue(v,true) end
		end)
		self:addSlider(params,"Dive",0,15,state.divePowerValue or 1.9,2,function(v)
			if apis.GameParams and apis.GameParams.SetDivePowerValue then apis.GameParams.SetDivePowerValue(v,true) end
		end)

		local boost=self:createSection(page,"Boost","right")
		self:addToggle(boost,"Jump Boost",state.jumpBoostOn,function(value)
			if apis.Boost and apis.Boost.SetJumpBoostState then apis.Boost.SetJumpBoostState(value,true) end
		end)
		self:addToggle(boost,"Always Boost",state.jumpBoostTradeMode,function(value)
			if apis.Boost and apis.Boost.SetAlwaysBoostState then apis.Boost.SetAlwaysBoostState(value,true) end
		end)
		self:addSlider(boost,"Force",10,100,state.boostForceY or 32,1,function(v)
			if apis.Boost and apis.Boost.SetBoostForceY then apis.Boost.SetBoostForceY(v,true) end
		end)
		self:addSlider(boost,"Chance",0,100,state.boostChance or 100,0,function(v)
			if apis.Boost and apis.Boost.SetBoostChance then apis.Boost.SetBoostChance(v,true) end
		end)
		self:addSlider(boost,"Radius",1,50,state.ballDetectionRadius or 10,1,function(v)
			if apis.Boost and apis.Boost.SetBallDetectionRadius then apis.Boost.SetBallDetectionRadius(v,true) end
		end)

		local esp=self:createSection(page,"ESP","right")
		self:addToggle(esp,"Enabled",state.actionStatusOn,function(value)
			if apis.ESP and apis.ESP.SetESPState then apis.ESP.SetESPState(value,true) end
		end)

		local qb=self:createSection(page,"QB Aim","right")
		self:addToggle(qb,"Enabled",state.qbAimEnabled or false,function(value)
			if apis.QBAim and apis.QBAim.SetQBAimState then apis.QBAim.SetQBAimState(value) end
		end)
		self:addToggle(qb,"Team Filter",state.qbAimTeamFilter~=false,function(value)
			if apis.QBAim and apis.QBAim.SetTeamFilterState then apis.QBAim.SetTeamFilterState(value,true) end
		end)
		self:addToggle(qb,"Show Arc",state.qbAimShowArc~=false,function(value)
			if apis.QBAim and apis.QBAim.SetShowArcState then apis.QBAim.SetShowArcState(value,true) end
		end)
		self:addSlider(qb,"Lead Adjust",0,1.5,state.qbAimLeadDelay or 0.75,2,function(v)
			if apis.QBAim and apis.QBAim.SetLeadDelay then apis.QBAim.SetLeadDelay(v,true) end
		end)
	end

	local function buildMap(self)
		local page=self:createPage("Map Editor",ICON_ID)
		if not page then return end
		local section=self:createSection(page,"Workspace","left")
		local world=ctx.WORLD_SETTINGS or {}

		self:addToggle(section,"Anti Material",world.SmoothPlastic,function(value)
			if ctx.AntiMaterialAPI and ctx.AntiMaterialAPI.SetEnabled then ctx.AntiMaterialAPI.SetEnabled(value,true) end
		end)
		self:addToggle(section,"Map Cleaner",world.MapCleaner,function(value)
			if ctx.MapCleanerAPI and ctx.MapCleanerAPI.SetEnabled then ctx.MapCleanerAPI.SetEnabled(value,true) end
		end)
		self:addToggle(section,"Remove Ads",world.RemoveAds,function(value)
			if ctx.RemoveAdsAPI and ctx.RemoveAdsAPI.SetEnabled then ctx.RemoveAdsAPI.SetEnabled(value,true) end
		end)
	end

	local function buildCustomize(self)
		local page=self:createPage("GUI Customizer",ICON_ID)
		if not page then return end
		local libs=self:createSection(page,"Libs","left")

		for _,lib in ipairs(LIB_NAMES) do
			self:addButton(libs,lib.Name,function()
				if ctx.StrokeColourAPI and ctx.StrokeColourAPI.ApplyUILib then
					ctx.StrokeColourAPI.ApplyUILib(lib.Id)
				else
					ctx.UI_STYLE.UILib=lib.Id
					if ctx.onUILibChanged then ctx.onUILibChanged() end
				end
			end)
		end

		local colors=self:createSection(page,"Colours","right")
		local style=ctx.UI_STYLE or {}
		local primary=colorFromStyle(style,"Primary",Color3.fromRGB(28,28,28))
		local stroke=colorFromStyle(style,"Stroke",Color3.fromRGB(76,76,76))
		local gradient=colorFromStyle(style,"Gradient",Color3.fromRGB(45,45,45))

		self:addColorPicker(colors,"Primary",primary,function(color)
			if ctx.StrokeColourAPI and ctx.StrokeColourAPI.ApplyPrimaryColour then ctx.StrokeColourAPI.ApplyPrimaryColour(color) end
		end)
		self:addColorPicker(colors,"Stroke",stroke,function(color)
			if ctx.StrokeColourAPI and ctx.StrokeColourAPI.ApplyMainColour then ctx.StrokeColourAPI.ApplyMainColour(color) end
		end)
		self:addColorPicker(colors,"Gradient",gradient,function(color)
			if ctx.StrokeColourAPI and ctx.StrokeColourAPI.ApplyGradient then ctx.StrokeColourAPI.ApplyGradient(stroke,color) end
		end)
		self:addToggle(colors,"Stroke Gradient",style.StrokeGradient,function(value)
			style.StrokeGradient=value and true or false
			if ctx.applyUIStrokeTheme then ctx.applyUIStrokeTheme() end
			if ctx.requestPlayerAutosave then ctx.requestPlayerAutosave() end
		end)
		self:addSlider(colors,"Stroke Thickness",0,8,style.StrokeThickness or 1,1,function(v)
			style.StrokeThickness=v
			if ctx.applyUIStrokeTheme then ctx.applyUIStrokeTheme() end
			if ctx.requestPlayerAutosave then ctx.requestPlayerAutosave() end
		end)
		self:addSlider(colors,"Stroke Transparency",0,1,style.StrokeTransparency or 0.72,2,function(v)
			style.StrokeTransparency=v
			if ctx.applyUIStrokeTheme then ctx.applyUIStrokeTheme() end
			if ctx.requestPlayerAutosave then ctx.requestPlayerAutosave() end
		end)
	end

	local function buildKeybinds(self)
		local page=self:createPage("Keybinds",ICON_ID)
		if not page then return end
		local section=self:createSection(page,"Keybinds","left")
		local bindings=ctx.GetBindings and ctx.GetBindings() or {}

		for _,binding in ipairs(bindings) do
			self:addKeybind(section,binding.label,binding.get and binding.get() or nil,function(value)
				local parsed=value
				if type(typeof)=="function" and typeof(value)=="EnumItem" then
					parsed=value
				elseif ctx.parseKeyCodeInput then
					parsed=ctx.parseKeyCodeInput(value)
				end
				if binding.set then
					binding.set(parsed)
				end
			end)
		end
	end

	local function buildSettings(self)
		local isExampleMenu=self.kind=="linoria" or self.kind=="obsidian"
		local page=self:createPage(isExampleMenu and "UI Settings" or "Settings",ICON_ID)
		if not page then return end
		local section=self:createSection(page,isExampleMenu and "Menu" or "Player Data","left")

		if isExampleMenu then
			if self.library and self.library.KeybindFrame then
				self:addToggle(section,"Open Keybind Menu",self.library.KeybindFrame.Visible,function(value)
					self.library.KeybindFrame.Visible=value and true or false
				end)
			end

			local menuKeybind=self:addKeybind(section,"Menu bind","RightShift",function() end)
			if self.library and menuKeybind then
				self.library.ToggleKeybind=menuKeybind
			end
		end

		self:addButton(section,"Wipe Data",function()
			if ctx.PlayerDataAPI and ctx.PlayerDataAPI.ShowConfirm then ctx.PlayerDataAPI.ShowConfirm() end
		end)
		self:addButton(section,"Refresh Discord",function()
			if ctx.DiscordAPI and ctx.DiscordAPI.Refresh then ctx.DiscordAPI.Refresh() end
		end)
	end

	local function buildServer(self)
		local page=self:createPage("Server",ICON_ID)
		if not page then return end
		local section=self:createSection(page,"Server","left")
		self:addLabel(section,"No server controls are available.")
	end

	local function buildNative(id,library)
		renderer.kind=id
		renderer.library=library
		renderer.window=renderer:createWindow(id,library)
		if not renderer.window then
			error("external window could not be created")
		end

		currentWindow=renderer.window
		currentLib=library
		buildMain(renderer)
		buildMap(renderer)
		buildServer(renderer)
		buildCustomize(renderer)
		buildKeybinds(renderer)
		buildSettings(renderer)

		callAny(library,{"LoadConfiguration"})
		active=true
	end

	function api.Refresh()
		local id=selectedId()

		if id=="original" then
			safeDestroy()
			currentId="original"
			setOriginalVisible(true)
			return false
		end

		if active and currentId==id then
			setOriginalVisible(false)
			return true
		end

		safeDestroy()

		local library,err=nil,nil
		if ctx.loadExternalUILibrary then
			library,err=ctx.loadExternalUILibrary(id)
		end

		if not library then
			warn("External UI library failed; falling back to Original:",id,err or "unknown")
			if ctx.UI_STYLE then
				ctx.UI_STYLE.UILib="original"
			end
			currentId="original"
			setOriginalVisible(true)
			if ctx.requestPlayerAutosave then ctx.requestPlayerAutosave() end
			return false
		end

		local before=collectScreenGuis()
		local ok,buildErr=pcall(function()
			buildNative(id,library)
		end)

		if not ok then
			warn("External UI renderer failed; falling back to Original:",id,buildErr)
			safeDestroy()
			if ctx.UI_STYLE then
				ctx.UI_STYLE.UILib="original"
			end
			currentId="original"
			setOriginalVisible(true)
			if ctx.requestPlayerAutosave then ctx.requestPlayerAutosave() end
			return false
		end

		currentId=id
		currentScreenGuis=diffScreenGuis(before)
		setOriginalVisible(false)
		api.SetVisible(visible)
		return true
	end

	function api.SetVisible(value)
		visible=value and true or false
		if selectedId()=="original" then
			setOriginalVisible(true)
			return
		end

		setOriginalVisible(false)
		for _,gui in ipairs(currentScreenGuis) do
			if gui and gui.Parent then
				gui.Enabled=visible
			end
		end
		if currentWindow then
			if currentWindow.SetVisible then
				callMethod(currentWindow,"SetVisible",visible)
			elseif currentWindow.Toggle then
				-- Leave library-managed toggle state alone when no explicit setter exists.
			end
		end
	end

	function api.Destroy()
		safeDestroy()
		setOriginalVisible(true)
	end

	return api
end

return ExternalRenderer
