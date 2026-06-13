local GameParams={}

local Players=game:GetService("Players")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local UIS=game:GetService("UserInputService")
local RunService=game:GetService("RunService")
local TweenService=game:GetService("TweenService")

local me=Players.LocalPlayer
local DEFAULT_GRAVITY=196.2
local DEFAULT_SPEED=18
local SPEED_FORCE_INTERVAL=0.05
local DEFAULT_SELECTED_PAGE="speed"
local DIAL_W=252
local DIAL_H=54
local PAGE_TWEEN=TweenInfo.new(0.22,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
local PAINT_TWEEN=TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

local PARAMS={
	JumpPower="jumpPowerValue",
	DivePower="divePowerValue",
	SprintStaminaRegenRate="staminaRegenValue",
	SprintStaminaDepleteRate="staminaDepleteValue",
}

local PARAM_STATE_PAGE={
	jumpPowerValue="gravity",
	divePowerValue="speed",
	staminaRegenValue="stamina",
	staminaDepleteValue="stamina",
}

local PAGE_ORDER={"speed","gravity","stamina"}
local PAGE_INDEX={speed=1,gravity=2,stamina=3}
local PAGE_ENABLED_KEY={
	speed="speedParamsEnabled",
	gravity="gravityJumpParamsEnabled",
	stamina="staminaParamsEnabled",
}
local PAGE_TITLE={
	speed="Speed",
	gravity="Gravity / Jump",
	stamina="Stamina",
}
local PAGE_SLICE_LABEL={
	speed="1",
	gravity="2",
	stamina="3",
}

local DIAL_SLICE_HEX={
	left=[[89504e470d0a1a0a0000000d49484452000000fc000000360806000000e3d8f4b5000001cf4944415478daedddb14a1c411cc7711f2ca01184c8a550d0c2e06be401d4c252411b0b1b2bb1b149932204d3580822762258e4054c482a9bf53f78c571588982bbbfcfc0e7058efdceeddcedcecc745d370364f02180e001c103bd0ffec314e3e5c34545efbee10dc1237843f008de103c82173cf423f81bdd0a9eacbfe50cc1237843f00c31f879ed0a9eac27ed0cc11314bca7ee044fd8b3f4471a163c592fcf3ce858f064bd2d67089ea0e0ade7054fd8fbf0233d0b9eac0d3096352d78b276bc59d0b5e0c9dae2ca9a5ef084ed69d7a2bfd2b8e0c9dac4725fe782276bd7da25ad0b9eac6daadb2dfea9e0216b5ffad5f25ff0907510c58ee021ebe499769bff4df09075d4d45c39173c649d2df7b95c081eb20e93fc54ce040f59a7c7b635fe89e021ebb8e816fe76f92b78c83a1ffe4bf92978c8087ef25b7fabfc163c0c3ff849b3e5a007b7fc2e2a04ffca16cb61b9173c0c3ff8491fcb6eb9133c0c3ff8e935ffd7f243f030fce0a7e31f8d5fe0b9163c0c3bf8e7268095b2d7bdedb65c2e2a04ff4e2780f678ef46f95efe081ec1e74d02ebe31f017f957f8247f07993405b0a6c764fdb77dd0a1ec1e74d02cdda7849705c2ec777043e1f040f081e103c207840f080e001c14376f08f82748fa6104125940000000049454e44ae426082]],
	center=[[89504e470d0a1a0a0000000d49484452000000fc000000360806000000e3d8f4b5000001964944415478daedd53b6a020114865117669315082e21a5a51b3060ef062c52da27b558066c6c6dc42e8d55402130e8e40f5cbb90264d74ce85af101f33739933f6dab6ed49ea469620012f097849c0ebc7ccdfc77d043cf0c00b78e08117f0c0032fe081071e78010f3cf0021e78e0053cf0c00b78e08107de000f3cf00678e08137c0030f3cf0021e78e0053cf0c00b78e081075ec0030fbc80071e78010f3cf0021e78e08137c0030fbc011e78e00df0c0030fbc80071e78010f3cf0021e78e081b704e081075ec0030fbc80071e78010f3cf0c01be08107de000f3cf00678e081075ec0030fbc80071e78010f3cf0021e78e08117f0c0032fe081075ec0030fbc0cf0c077a8497a4eabb44b0dbfbf4e537b5ad5de26ee21e06fbd7e3548a3344df3f49ad6699f8e7706f958d7b5aeeb9cd7758f6a0fd79db83f80effc83e1bb87344c8f699c9ed2ace02cd24b5aa6b7b449db02f69e0ee9239dd267fd8b9ed3a5305eea7553ef9feaf387fafebe7e6f53bfbface32deaf8b33a9f719ddfb0ceb70f32f0fa7f0f157b005e12f0928097743be0bf00e9711f123d16c0690000000049454e44ae426082]],
	right=[[89504e470d0a1a0a0000000d49484452000000fc000000360806000000e3d8f4b5000001da4944415478daedddb14a1c511480e17d304123088a2914b4507c0d1fc0a44819411b0b1b2bb1b1b1b110d1c6421049170229f20251b4b2391e712dd204595d77f6dcefc0f70297f999b9cbec9d5e44f480365804103c207840f0f001cce033f1c28584e0eb8f3b3c82173c085ef02078c183e0bb3f3f058fe01bbcbb0b1ec10b1e045f64a6058fe01bbdbb0b1ec147e9b7eb048fe01b98bdf02e3d826f621ec29f67107cbbfb76c123f886f6ed8247f0f5663efc1f1ec137318be1000c04dfc4cc84136f10bc3dbbe0117c8db91e2476c123f8f19bed708825826f6216c2a9b508befc1c0efa082f78043f3e739f96c3b9f408befc7c0f1fa240f0e5e7e8bd1edf058fe0bb3b17692a7c6a0a4a077f993e876fcb41e9e0cfd26cf89824940efe60987b74c123f8d1cf6dfa36cad0058fe0873fa769357c1f1eca06ff277dedc2dd5cf0087e788fec3b69b2ebebe84242f083cddfb49be6c6691d5d4808fef5f33b6da64fe3ba8e2e2404ffff3949eb5ddd930b1ec1bf6d7ec4f31f57e6ab442e78041fff1c17b595962a062e785a0efe261da78dfe6bad13adada30b89aac1dfa5f3fe8f6c6b2dc62d78aa06ff2b9e8f81fad2caa3b9e0a9eee98e7d95f6fb8fe42bfdb0c52d7840f020788b008207040f081e103cd0a5e01f0124bc8f6a6cfc761d0000000049454e44ae426082]],
}

local function clampStaminaDeplete(value)
	local n=tonumber(value)
	if not n then return 10 end
	return math.clamp(math.floor(math.abs(n)+0.5),0,50)
end

local function destroyControl(control)
	if control and type(control.destroy)=="function" then
		pcall(control.destroy)
	elseif control and type(control.Destroy)=="function" then
		pcall(control.Destroy)
	end
end

local function getMyHumanoid()
	local character=workspace:FindFirstChild(me.Name) or me.Character

	if character then
		return character:FindFirstChildOfClass("Humanoid")
	end

	return nil
end

local function clampSpeed(value)
	return math.clamp(tonumber(value) or DEFAULT_SPEED,0,100)
end

local function boolDefault(value,default)
	if value==nil then
		return default and true or false
	end

	return value and true or false
end

local function normalizePageKey(value)
	local raw=tostring(value or DEFAULT_SELECTED_PAGE):lower():gsub("%s+","")

	if raw=="speed" or raw=="1" then
		return"speed"
	elseif raw=="gravity" or raw=="jump" or raw=="gravityjump" or raw=="gravity/jump" or raw=="2" then
		return"gravity"
	elseif raw=="stamina" or raw=="3" then
		return"stamina"
	end

	return DEFAULT_SELECTED_PAGE
end

local function themeColor(theme,key,fallback)
	return (theme and theme[key]) or fallback
end

local function decodeHex(hex)
	hex=tostring(hex or ""):gsub("%s+","")
	local bytes=table.create(math.floor(#hex/2))

	for index=1,#hex,2 do
		bytes[#bytes+1]=string.char(tonumber(hex:sub(index,index+1),16) or 0)
	end

	return table.concat(bytes)
end

local sliceAssetCache=nil
local sliceAssetResolved=false

local function getDialSliceAssets()
	if sliceAssetResolved then
		return sliceAssetCache
	end

	sliceAssetResolved=true

	if type(writefile)~="function" or type(getcustomasset)~="function" then
		return nil
	end

	local assets={}

	for key,hex in pairs(DIAL_SLICE_HEX) do
		local path="params_halfdial_"..key..".png"
		local writeOk=pcall(writefile,path,decodeHex(hex))
		if not writeOk then
			return nil
		end

		local assetOk,asset=pcall(getcustomasset,path)
		if not assetOk or type(asset)~="string" then
			return nil
		end

		assets[key]=asset
	end

	sliceAssetCache=assets
	return assets
end

function GameParams.new(ctx,parent)
	local New=ctx.New
	local THEME=ctx.THEME or {}
	local safeDisconnect=ctx.safeDisconnect
	local inputToBinding=ctx.inputToBinding
	local makeSection=ctx.makeSection
	local buildSlider=ctx.buildSlider
	local buildToggleRow=ctx.buildToggleRow
	local state=ctx.State
	local api={}
	local toggle=nil
	local gravitySlider=nil
	local speedSlider=nil
	local staminaRegenSlider=nil
	local staminaDepleteSlider=nil
	local jumpSlider=nil
	local diveSlider=nil
	local dialWrap=nil
	local pageHeader=nil
	local pageTitle=nil
	local pageToggle=nil
	local pageToggleHolder=nil
	local pageClip=nil
	local pageFrames={}
	local dialImages={}
	local dialButtons={}
	local fallbackSlices={}
	local currentPage=nil
	local pageTweens={}
	local section=nil
	local sectionControls=nil
	local speedConn=nil
	local speedElapsed=0
	local inputConn=nil
	local destroyConn=nil
	local rootConns={}
	local folderConns=setmetatable({}, {__mode="k"})
	local valueConns=setmetatable({}, {__mode="k"})
	local applying=false
	local destroyed=false

	local function safeDisconnectAll(t)
		if not t then return end

		for _,conn in ipairs(t) do
			safeDisconnect(conn)
		end

		table.clear(t)
	end

	local function changed()
		if ctx.onChanged then pcall(ctx.onChanged,state) end
	end

	local function clampNumber(value,min,max,fallback)
		local n=tonumber(value)
		if not n then return fallback end
		return math.clamp(n,min,max)
	end

	local function isPageEnabled(pageKey)
		pageKey=normalizePageKey(pageKey)
		return state[PAGE_ENABLED_KEY[pageKey]]~=false
	end

	local function isStateKeyActive(stateKey)
		local pageKey=PARAM_STATE_PAGE[stateKey]
		return state.gameParamsEnabled and (not pageKey or isPageEnabled(pageKey))
	end

	local function isSpeedActive()
		return state.gameParamsEnabled and isPageEnabled("speed")
	end

	local function isGravityActive()
		return state.gameParamsEnabled and isPageEnabled("gravity")
	end

	local function accentColor()
		return themeColor(THEME,"SLIDER_FILL",themeColor(THEME,"ACC",themeColor(THEME,"GREEN",Color3.fromRGB(32,202,106))))
	end

	local function inputColor()
		return themeColor(THEME,"INPUT",themeColor(THEME,"PANEL",Color3.fromRGB(33,33,33)))
	end

	local function mutedColor()
		return themeColor(THEME,"MUTED",Color3.fromRGB(168,168,168))
	end

	local function textColor()
		return themeColor(THEME,"TEXT",Color3.fromRGB(225,225,225))
	end

	local function normalizeState()
		state.gameParamsEnabled=state.gameParamsEnabled and true or false
		state.paramsSelectedPage=normalizePageKey(state.paramsSelectedPage)
		state.speedParamsEnabled=boolDefault(state.speedParamsEnabled,true)
		state.gravityJumpParamsEnabled=boolDefault(state.gravityJumpParamsEnabled,true)
		state.staminaParamsEnabled=boolDefault(state.staminaParamsEnabled,true)
		state.speedEnabled=state.speedParamsEnabled
		state.gravityEnabled=state.gravityJumpParamsEnabled
		state.gravityValue=clampNumber(state.gravityValue,0,1000,DEFAULT_GRAVITY)
		state.speedValue=clampSpeed(state.speedValue)
		state.staminaRegenValue=clampNumber(state.staminaRegenValue,0,50,10)
		state.staminaDepleteValue=clampStaminaDeplete(state.staminaDepleteValue)
		state.jumpPowerValue=clampNumber(state.jumpPowerValue,0,300,53.5)
		state.divePowerValue=clampNumber(state.divePowerValue,0,15,1.9)
	end

	local paintDial=nil
	local showPage=nil
	local syncPageHeader=nil

	local function syncControls()
		if toggle then toggle.set(state.gameParamsEnabled) end
		if gravitySlider then gravitySlider.set(state.gravityValue) end
		if speedSlider then speedSlider.set(state.speedValue) end
		if staminaRegenSlider then staminaRegenSlider.set(state.staminaRegenValue) end
		if staminaDepleteSlider then staminaDepleteSlider.set(state.staminaDepleteValue) end
		if jumpSlider then jumpSlider.set(state.jumpPowerValue) end
		if diveSlider then diveSlider.set(state.divePowerValue) end
		if pageToggle then pageToggle.set(isPageEnabled(state.paramsSelectedPage)) end
		if syncPageHeader then syncPageHeader(false) end
		if paintDial then paintDial(false) end
		if showPage then showPage(state.paramsSelectedPage,false) end
	end

	local function isAlive()
		return not destroyed and (section==nil or section.Parent~=nil)
	end

	local function applyGravity(value)
		local gravity=clampNumber(value,0,1000,DEFAULT_GRAVITY)
		state.gravityValue=gravity
		if isGravityActive() then
			workspace.Gravity=gravity
		end
		return gravity
	end

	local function applySpeedValue()
		local hum=getMyHumanoid()

		if hum then
			hum.WalkSpeed=state.speedValue
		end
	end

	local function stopSpeedForcing(resetValue)
		safeDisconnect(speedConn)
		speedConn=nil
		speedElapsed=0

		if resetValue then
			state.speedValue=DEFAULT_SPEED
		end

		local hum=getMyHumanoid()
		if hum then
			hum.WalkSpeed=DEFAULT_SPEED
		end
	end

	local function ensureSpeedForcing()
		if not isSpeedActive() then
			stopSpeedForcing(false)
			return
		end

		state.speedValue=clampSpeed(state.speedValue)
		applySpeedValue()

		if speedConn then
			return
		end

		speedConn=RunService.Heartbeat:Connect(function(dt)
			if not isSpeedActive() or not isAlive() then
				safeDisconnect(speedConn)
				speedConn=nil
				return
			end

			speedElapsed+=(dt or 0)
			if speedElapsed<SPEED_FORCE_INTERVAL then
				return
			end
			speedElapsed=0

			state.speedValue=clampSpeed(state.speedValue)
			local hum=getMyHumanoid()

			if hum and hum.WalkSpeed~=state.speedValue then
				hum.WalkSpeed=state.speedValue
			end
		end)
	end

	local function getCurrentModeKey()
		local miniGames=ReplicatedStorage:FindFirstChild("MiniGames")
		local miniCount=miniGames and #miniGames:GetChildren() or 0

		if miniCount>1 then
			return"mode2"
		elseif miniCount==1 then
			return"mode3"
		end

		local games=ReplicatedStorage:FindFirstChild("Games")
		if games and #games:GetChildren()>0 then
			return"mode1"
		end

		if ctx.getCurrentModeKey then
			local ok,modeKey=pcall(ctx.getCurrentModeKey)
			if ok and modeKey then
				return tostring(modeKey)
			end
		end

		return"mode1"
	end

	local function getTargetGameFolders()
		local modeKey=getCurrentModeKey()
		local folders={}

		if modeKey=="mode1" then
			local games=ReplicatedStorage:FindFirstChild("Games")
			local firstGame=games and games:GetChildren()[1]

			if firstGame then
				table.insert(folders,firstGame)
			end
		else
			local miniGames=ReplicatedStorage:FindFirstChild("MiniGames")
			if not miniGames then
				return folders
			end

			local children=miniGames:GetChildren()

			if modeKey=="mode2" then
				for _,miniGame in ipairs(children) do
					table.insert(folders,miniGame)
				end
			else
				local firstMiniGame=children[1]
				if firstMiniGame then
					table.insert(folders,firstMiniGame)
				end
			end
		end

		return folders
	end

	local function trackNumberValue(valueObject,stateKey)
		if valueConns[valueObject] then
			return
		end

		valueConns[valueObject]={}

		table.insert(valueConns[valueObject],valueObject:GetPropertyChangedSignal("Value"):Connect(function()
			if applying or not isAlive() or not isStateKeyActive(stateKey) or not valueObject.Parent then
				return
			end

			local target=state[stateKey]
			if tonumber(valueObject.Value)~=tonumber(target) then
				applying=true
				valueObject.Value=target
				applying=false
			end
		end))

		table.insert(valueConns[valueObject],valueObject.AncestryChanged:Connect(function(_,parent)
			if parent==nil then
				safeDisconnectAll(valueConns[valueObject])
				valueConns[valueObject]=nil
			end
		end))
	end

	local function applyNumberValue(gameParams,paramName,stateKey)
		if not isStateKeyActive(stateKey) then
			return
		end

		local valueObject=gameParams:FindFirstChild(paramName)

		if not(valueObject and valueObject:IsA("NumberValue")) then
			return
		end

		trackNumberValue(valueObject,stateKey)

		local target=state[stateKey]
		if tonumber(valueObject.Value)~=tonumber(target) then
			applying=true
			valueObject.Value=target
			applying=false
		end
	end

	local function watchGameParamsFolder(gameParams)
		if not state.gameParamsEnabled then
			return
		end

		if folderConns[gameParams] then
			return
		end

		folderConns[gameParams]={}

		table.insert(folderConns[gameParams],gameParams.ChildAdded:Connect(function(child)
			if not isAlive() or not state.gameParamsEnabled then return end

			local stateKey=PARAMS[child.Name]
			if stateKey and child:IsA("NumberValue") and isStateKeyActive(stateKey) then
				task.defer(function()
					if isAlive() and isStateKeyActive(stateKey) and child.Parent then
						applyNumberValue(gameParams,child.Name,stateKey)
					end
				end)
			end
		end))

		table.insert(folderConns[gameParams],gameParams.AncestryChanged:Connect(function(_,parent)
			if parent==nil then
				safeDisconnectAll(folderConns[gameParams])
				folderConns[gameParams]=nil
			end
		end))
	end

	local function applyGameParams()
		if not isAlive() or not state.gameParamsEnabled then return end

		for _,gameFolder in ipairs(getTargetGameFolders()) do
			local gameParams=gameFolder:FindFirstChild("GameParams")

			if gameParams then
				watchGameParamsFolder(gameParams)

				for paramName,stateKey in pairs(PARAMS) do
					applyNumberValue(gameParams,paramName,stateKey)
				end
			end
		end
	end

	local function watchRootFolder(root)
		if not root then return end

		table.insert(rootConns,root.ChildAdded:Connect(function()
			if state.gameParamsEnabled then
				task.defer(applyGameParams)
			end
		end))

		table.insert(rootConns,root.DescendantAdded:Connect(function(descendant)
			local stateKey=PARAMS[descendant.Name]
			if state.gameParamsEnabled and (descendant.Name=="GameParams" or (stateKey and isStateKeyActive(stateKey))) then
				task.defer(applyGameParams)
			end
		end))
	end

	local function disconnectWatchers()
		safeDisconnectAll(rootConns)

		for folder,conns in pairs(folderConns) do
			safeDisconnectAll(conns)
			folderConns[folder]=nil
		end

		for valueObject,conns in pairs(valueConns) do
			safeDisconnectAll(conns)
			valueConns[valueObject]=nil
		end
	end

	local function startWatching()
		if #rootConns>0 then
			return
		end

		table.insert(rootConns,ReplicatedStorage.ChildAdded:Connect(function(child)
			if not state.gameParamsEnabled then return end

			if child.Name=="Games" or child.Name=="MiniGames" then
				watchRootFolder(child)
				task.defer(applyGameParams)
			end
		end))

		watchRootFolder(ReplicatedStorage:FindFirstChild("Games"))
		watchRootFolder(ReplicatedStorage:FindFirstChild("MiniGames"))
	end

	function api.SetGravityState(value,fire)
		state.gravityJumpParamsEnabled=value and true or false
		state.gravityEnabled=state.gravityJumpParamsEnabled
		if isGravityActive() then
			applyGravity(state.gravityValue)
		end
		applyGameParams()
		if not isGravityActive() then
			workspace.Gravity=DEFAULT_GRAVITY
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetGravityValue(value,fire)
		state.gravityValue=clampNumber(value,0,1000,DEFAULT_GRAVITY)
		applyGravity(state.gravityValue)
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetSpeedState(value,fire,resetValue)
		state.speedParamsEnabled=value and true or false
		state.speedEnabled=state.speedParamsEnabled
		state.speedValue=clampSpeed(state.speedValue)

		if isSpeedActive() then
			ensureSpeedForcing()
		end
		applyGameParams()
		if not isSpeedActive() then
			stopSpeedForcing(resetValue==true)
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetSpeedValue(value,fire)
		state.speedValue=clampSpeed(value)
		if isSpeedActive() then
			ensureSpeedForcing()
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetParamsSelectedPage(pageKey,fire)
		state.paramsSelectedPage=normalizePageKey(pageKey)
		if showPage then showPage(state.paramsSelectedPage,true) end
		if syncPageHeader then syncPageHeader(true) end
		if paintDial then paintDial(true) end
		if pageToggle then pageToggle.set(isPageEnabled(state.paramsSelectedPage)) end

		if fire~=false then
			changed()
		end
	end

	function api.SetParamsPageEnabled(pageKey,value,fire)
		pageKey=normalizePageKey(pageKey)
		state[PAGE_ENABLED_KEY[pageKey]]=value and true or false

		if pageKey=="speed" then
			state.speedEnabled=state.speedParamsEnabled
			if isSpeedActive() then
				ensureSpeedForcing()
			end
			applyGameParams()
			if not isSpeedActive() then
				stopSpeedForcing(false)
			end
		elseif pageKey=="gravity" then
			state.gravityEnabled=state.gravityJumpParamsEnabled
			if isGravityActive() then
				applyGravity(state.gravityValue)
				applyGameParams()
			else
				workspace.Gravity=DEFAULT_GRAVITY
			end
		elseif pageKey=="stamina" then
			applyGameParams()
		end

		if pageToggle and (not pageToggle.get or pageToggle.get()~=isPageEnabled(state.paramsSelectedPage)) then
			pageToggle.set(isPageEnabled(state.paramsSelectedPage))
		end
		if syncPageHeader then syncPageHeader(true) end
		if paintDial then paintDial(true) end

		if fire~=false then
			changed()
		end
	end

	function api.SetGameParamsState(value,fire)
		state.gameParamsEnabled=value and true or false

		if state.gameParamsEnabled then
			startWatching()
			applyGameParams()
		else
			disconnectWatchers()
		end
		if isGravityActive() then
			applyGravity(state.gravityValue)
		else
			workspace.Gravity=DEFAULT_GRAVITY
		end
		if isSpeedActive() then
			ensureSpeedForcing()
		else
			stopSpeedForcing(false)
		end

		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetStaminaRegenValue(value,fire)
		state.staminaRegenValue=clampNumber(value,0,50,10)
		applyGameParams()
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetStaminaDepleteValue(value,fire)
		state.staminaDepleteValue=clampStaminaDeplete(value)
		applyGameParams()
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetJumpPowerValue(value,fire)
		state.jumpPowerValue=clampNumber(value,0,300,53.5)
		applyGameParams()
		syncControls()

		if fire~=false then
			changed()
		end
	end

	function api.SetDivePowerValue(value,fire)
		state.divePowerValue=clampNumber(value,0,15,1.9)
		applyGameParams()
		syncControls()

		if fire~=false then
			changed()
		end
	end

	local function cancelPageTweens()
		for _,tween in ipairs(pageTweens) do
			pcall(function()
				tween:Cancel()
			end)
		end

		table.clear(pageTweens)
	end

	local function tweenObject(object,goal)
		if not object then return nil end
		local tween=TweenService:Create(object,PAINT_TWEEN,goal)
		table.insert(pageTweens,tween)
		tween:Play()
		return tween
	end

	syncPageHeader=function(animate)
		if not pageTitle then return end

		local pageKey=normalizePageKey(state.paramsSelectedPage)
		local enabled=isPageEnabled(pageKey)
		pageTitle.Text=PAGE_TITLE[pageKey] or PAGE_TITLE.speed
		pageTitle.TextColor3=enabled and textColor() or mutedColor()

		if pageHeader then
			local target=enabled and themeColor(THEME,"SECTION",themeColor(THEME,"CARD",Color3.fromRGB(38,38,38))) or inputColor()
			if animate then
				tweenObject(pageHeader,{BackgroundColor3=target})
			else
				pageHeader.BackgroundColor3=target
			end
		end
	end

	paintDial=function(animate)
		local selected=normalizePageKey(state.paramsSelectedPage)
		local active=accentColor()
		local base=inputColor()
		local muted=mutedColor()

		for _,pageKey in ipairs(PAGE_ORDER) do
			local enabled=isPageEnabled(pageKey)
			local isSelected=pageKey==selected
			local targetColor=isSelected and (enabled and active or muted) or (enabled and base or muted)
			local targetTransparency=isSelected and (enabled and 0.02 or 0.22) or (enabled and 0.34 or 0.68)
			local textTarget=enabled and textColor() or muted

			if dialImages[pageKey] then
				if animate then
					tweenObject(dialImages[pageKey],{ImageColor3=targetColor,ImageTransparency=targetTransparency})
				else
					dialImages[pageKey].ImageColor3=targetColor
					dialImages[pageKey].ImageTransparency=targetTransparency
				end
			end

			if fallbackSlices[pageKey] then
				if animate then
					tweenObject(fallbackSlices[pageKey],{BackgroundColor3=targetColor,BackgroundTransparency=targetTransparency})
				else
					fallbackSlices[pageKey].BackgroundColor3=targetColor
					fallbackSlices[pageKey].BackgroundTransparency=targetTransparency
				end
			end

			if dialButtons[pageKey] then
				dialButtons[pageKey].TextColor3=textTarget
			end
		end
	end

	showPage=function(pageKey,animate)
		pageKey=normalizePageKey(pageKey)

		if currentPage==pageKey and pageFrames[pageKey] then
			for key,frame in pairs(pageFrames) do
				frame.Visible=key==pageKey
				frame.Position=UDim2.fromScale(key==pageKey and 0 or 1,0)
			end
			return
		end

		local oldPage=currentPage
		local oldFrame=oldPage and pageFrames[oldPage] or nil
		local newFrame=pageFrames[pageKey]
		if not newFrame then return end

		cancelPageTweens()

		local dir=1
		if oldPage and PAGE_INDEX[pageKey] and PAGE_INDEX[oldPage] and PAGE_INDEX[pageKey]<PAGE_INDEX[oldPage] then
			dir=-1
		end

		currentPage=pageKey
		newFrame.Visible=true

		if not animate or not oldFrame then
			for key,frame in pairs(pageFrames) do
				frame.Visible=key==pageKey
				frame.Position=UDim2.fromScale(key==pageKey and 0 or 1,0)
			end
			return
		end

		oldFrame.Visible=true
		oldFrame.Position=UDim2.fromScale(0,0)
		newFrame.Position=UDim2.fromScale(dir,0)

		local oldTween=TweenService:Create(oldFrame,PAGE_TWEEN,{Position=UDim2.fromScale(-dir,0)})
		local newTween=TweenService:Create(newFrame,PAGE_TWEEN,{Position=UDim2.fromScale(0,0)})
		table.insert(pageTweens,oldTween)
		table.insert(pageTweens,newTween)
		oldTween:Play()
		newTween:Play()
		oldTween.Completed:Connect(function()
			if oldFrame and oldFrame.Parent and currentPage==pageKey then
				oldFrame.Visible=false
			end
		end)
	end

	local function createDial(parentFrame)
		dialWrap=New("Frame",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,0,DIAL_H+2),
			LayoutOrder=1,
			ZIndex=6,
			ClipsDescendants=false,
		},parentFrame)

		local canvas=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0),
			Position=UDim2.new(0.5,0,0,0),
			Size=UDim2.fromOffset(DIAL_W,DIAL_H),
			BackgroundTransparency=1,
			ClipsDescendants=true,
			ZIndex=6,
		},dialWrap)

		local assets=getDialSliceAssets()
		local imageKeys={speed="left",gravity="center",stamina="right"}

		for _,pageKey in ipairs(PAGE_ORDER) do
			if assets and assets[imageKeys[pageKey]] then
				dialImages[pageKey]=New("ImageLabel",{
					BackgroundTransparency=1,
					Size=UDim2.fromScale(1,1),
					Image=assets[imageKeys[pageKey]],
					ImageColor3=inputColor(),
					ImageTransparency=0.34,
					ScaleType=Enum.ScaleType.Stretch,
					ZIndex=6,
				},canvas)
			else
				local index=PAGE_INDEX[pageKey]
				local fallback=New("TextButton",{
					Position=UDim2.new((index-1)/3,2,0,4),
					Size=UDim2.new(1/3,-4,1,-10),
					BackgroundColor3=inputColor(),
					BackgroundTransparency=0.34,
					BorderSizePixel=0,
					Text="",
					AutoButtonColor=false,
					Selectable=false,
					ZIndex=6,
					ThemeRole="INPUT",
				},canvas)
				New("UICorner",{CornerRadius=UDim.new(0,index==2 and 2 or 18)},fallback)
				fallbackSlices[pageKey]=fallback
			end
		end

		for _,pageKey in ipairs(PAGE_ORDER) do
			local index=PAGE_INDEX[pageKey]
			local button=New("TextButton",{
				Position=UDim2.new((index-1)/3,0,0,0),
				Size=UDim2.new(1/3,0,1,0),
				BackgroundTransparency=1,
				BorderSizePixel=0,
				Text=PAGE_SLICE_LABEL[pageKey],
				Font=Enum.Font.GothamBold,
				TextSize=17,
				TextColor3=textColor(),
				AutoButtonColor=false,
				Selectable=true,
				ZIndex=9,
			},canvas)
			dialButtons[pageKey]=button
			button.Activated:Connect(function()
				api.SetParamsSelectedPage(pageKey,true)
			end)
		end
	end

	local function createPageEditor(parentFrame)
		pageHeader=New("Frame",{
			BackgroundColor3=themeColor(THEME,"SECTION",themeColor(THEME,"CARD",Color3.fromRGB(38,38,38))),
			BackgroundTransparency=0.22,
			BorderSizePixel=0,
			Size=UDim2.new(1,0,0,30),
			LayoutOrder=2,
			ZIndex=6,
			ThemeRole="SECTION",
			CornerRole="Control",
		},parentFrame)
		New("UICorner",{CornerRadius=UDim.new(0,0)},pageHeader)

		pageTitle=New("TextLabel",{
			BackgroundTransparency=1,
			Position=UDim2.fromOffset(10,0),
			Size=UDim2.new(1,-88,1,0),
			Text=PAGE_TITLE.speed,
			Font=Enum.Font.GothamBold,
			TextSize=12,
			TextColor3=textColor(),
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=7,
		},pageHeader)

		pageToggleHolder=New("Frame",{
			AnchorPoint=Vector2.new(1,0.5),
			Position=UDim2.new(1,-8,0.5,0),
			Size=UDim2.fromOffset(70,24),
			BackgroundTransparency=1,
			ZIndex=7,
		},pageHeader)

		pageToggle=buildToggleRow(pageToggleHolder,"",isPageEnabled(state.paramsSelectedPage),function(value)
			api.SetParamsPageEnabled(state.paramsSelectedPage,value,true)
		end)

		pageClip=New("Frame",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,0,112),
			LayoutOrder=3,
			ClipsDescendants=true,
			ZIndex=6,
		},parentFrame)

		for _,pageKey in ipairs(PAGE_ORDER) do
			local page=New("Frame",{
				BackgroundTransparency=1,
				Position=UDim2.fromScale(1,0),
				Size=UDim2.fromScale(1,1),
				Visible=false,
				ZIndex=6,
			},pageClip)
			New("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},page)
			pageFrames[pageKey]=page
		end

		speedSlider=buildSlider(pageFrames.speed,"Speed",0,100,state.speedValue,0,function(v)
			api.SetSpeedValue(v,true)
		end)

		diveSlider=buildSlider(pageFrames.speed,"Dive",0,15,state.divePowerValue,2,function(v)
			api.SetDivePowerValue(v,true)
		end)

		gravitySlider=buildSlider(pageFrames.gravity,"Gravity",0,1000,state.gravityValue,1,function(v)
			api.SetGravityValue(v,true)
		end)

		jumpSlider=buildSlider(pageFrames.gravity,"Jump Power",0,300,state.jumpPowerValue,1,function(v)
			api.SetJumpPowerValue(v,true)
		end)

		staminaDepleteSlider=buildSlider(pageFrames.stamina,"Stamina Depletion",0,50,state.staminaDepleteValue,0,function(v)
			api.SetStaminaDepleteValue(v,true)
		end)

		staminaRegenSlider=buildSlider(pageFrames.stamina,"Stamina Regeneration",0,50,state.staminaRegenValue,1,function(v)
			api.SetStaminaRegenValue(v,true)
		end)
	end

	normalizeState()
	section,sectionControls=makeSection(parent,2,"Game Params","",{
		headerToggle={
			startState=state.gameParamsEnabled,
			onChange=function(value)
				api.SetGameParamsState(value,true)
			end,
		},
	})

	toggle=sectionControls and sectionControls.toggle
	if not toggle and buildToggleRow then
		toggle=buildToggleRow(section,"Game Params",state.gameParamsEnabled,function(value)
			api.SetGameParamsState(value,true)
		end)
	end

	createDial(section)
	createPageEditor(section)

	function api.Refresh()
		normalizeState()
		if state.gameParamsEnabled then
			startWatching()
			applyGameParams()
		else
			disconnectWatchers()
		end
		if isGravityActive() then
			applyGravity(state.gravityValue)
		else
			workspace.Gravity=DEFAULT_GRAVITY
		end
		if isSpeedActive() then
			ensureSpeedForcing()
		else
			stopSpeedForcing(false)
		end
		syncControls()
	end

	function api.Reset()
		state.gameParamsEnabled=false
		state.paramsSelectedPage=DEFAULT_SELECTED_PAGE
		state.speedParamsEnabled=true
		state.gravityJumpParamsEnabled=true
		state.staminaParamsEnabled=true
		state.gravityEnabled=true
		state.gravityValue=DEFAULT_GRAVITY
		state.speedEnabled=true
		state.speedValue=DEFAULT_SPEED
		state.staminaRegenValue=10
		state.staminaDepleteValue=10
		state.jumpPowerValue=53.5
		state.divePowerValue=1.9
		api.Refresh()
		changed()
	end

	function api.Destroy()
		if destroyed then return end
		destroyed=true
		disconnectWatchers()
		safeDisconnect(inputConn)
		inputConn=nil
		safeDisconnect(destroyConn)
		destroyConn=nil
		destroyControl(toggle)
		destroyControl(pageToggle)
		destroyControl(gravitySlider)
		destroyControl(speedSlider)
		destroyControl(staminaRegenSlider)
		destroyControl(staminaDepleteSlider)
		destroyControl(jumpSlider)
		destroyControl(diveSlider)
		cancelPageTweens()
		stopSpeedForcing(false)
	end

	local function handleSpeedInput(input)
		local speedKey=ctx.getSpeedToggleKey and ctx.getSpeedToggleKey() or Enum.KeyCode.Unknown
		if speedKey==nil or speedKey==Enum.KeyCode.Unknown then return false end

		local binding=inputToBinding and inputToBinding(input) or nil
		if binding==speedKey then
			api.SetParamsPageEnabled("speed",not state.speedParamsEnabled,true)
			return true
		end

		return false
	end

	inputConn=UIS.InputBegan:Connect(function(input,processed)
		if processed then return end
		handleSpeedInput(input)
	end)

	destroyConn=section.AncestryChanged:Connect(function()
		if not isAlive() then
			api.Destroy()
		end
	end)

	api.Refresh()

	return api
end

return GameParams
