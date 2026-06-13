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
local DIAL_W=56
local DIAL_H=56
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
local DIAL_SLICE_HEX={
	left=[[89504e470d0a1a0a0000000d4948445200000080000000800806000000c33e61cb000002a74944415478daeddd8d6d9c40100650174223570885d0088550c83542211345ba531c27b6ec13cbee306fa4af01f66981fd7d8b8837a91b0f01000f0100014000100004000140001000040001400010000400014000100004000140001000040001400010000400014000100004000140001000040001407203581ef1d00a0298e24fed20d403b0c4bf054221007b7c5e205c1cc01cdf2b102e0a608b9f1508170230c5ebf5843079c879012c714cad20e404708f630b8464005a15080900ccd1be401818c016e715080302d8e3fc026120003deb77ef73d338fd00cc3146dd41e8036089b10a8493016c3166817012807b8c5d20340690a540280e008406006e91b34c411f04604e0a40631606b069c8da0074ffc501cc1ab236007f00070258c207a01e400f00806f0000fc0500601c00001f82e602bc06cc06a69811d4a08501e8050aad088a2f36a45a567ee13581df45a0612fb62ad86f61d17d015e074577061d89c08761a2bd812d7f1141187877f0d9df07cbe335e715d1f97c00b388454f0801a0e8194100143d252cac24aa774e6086f217d0e0a450008a9e150c40d1d3c201287a5fc01546070178e1c6902b8d0802f0833b8356006a039800706ddc0a406d0093616017472e00b8397407a036801b00ee0e5e017079f46e18b836801b00ae8f5f01a80d20eb9a018d7f208029d9f780fd830703c886c03070030099560f01d008401604003404900101008d018c8ec046d113008c8cc030f049009e087600ea0218f117118093013c116c00d40530d2dc8183213a0278ce22f67c2568f8ce007af7061a7e1000bd7a030d3f10801eab8d35fc80009e7f0aab61e0ba00ce8000400200ef212c077f23009008c0c721e50d80ba003ef60aaf1e61b76af4dc003eeb1976c3c03501fc0fc4f2407107a01e80af069c1c105d18800020000800f2777e01cfd216e07e76c6090000000049454e44ae426082]],
	center=[[89504e470d0a1a0a0000000d4948445200000080000000800806000000c33e61cb0000027e4944415478daedddd16de3300c80e10ea245328806f12219c48378110da2b6408216c51dae9738b6287e02fe973ed481f98b49649279ebbdbf212f6e0201dc0402cccfe583fa0796bffcfd428098dc83ba7eb0f57dd676fb7f7759083058c03f83d3fab1abddae5b09702ce5b613b73ed6da6eafab10e0b53b3dc20a951922ecf6d663ae16212b8c1af86b9f6b5d471541e0938b30ca0b597aaeb510e0eb80a6f59cab8d70e074e6c5afddbabf2da41220f3ae1f2e1bd8f5c9b3c1919ff057f1fdf5415299498022e53ff496506610a00afe5312d4c8025431dc65d58802087e1009043fb904829f5c02c14f2e81af7ac9bf220a7e7209f610c009df792786a70be06cbfc77e76f0ec533debfc75394b00effbe37c1e384580c5bdefe1cbcbf6f806b089413fab19a58c720e201b042d2addfbb9bf6c1060d7bffa61906c10a8945ce167f2825145a0c98b449581272f1357129ebc345c5348f2e6106d61c9dbc33486266f101da145f96ad79b0f90291b0cd1163eea8898d9ab8bd66e444cca76b243dabc669a12365337f1a1ddbeb3cd09acc1c7c4557302c7ca06df67fe5e7e0c925e76be4e3128728c6cb03df028f5d171b42ddafce088b382d7ff9cd4f96c6d439b6dd7cf302dfc5fd960cff6a9f28b6b55d3c2c7c906eb8167142177fd6c3f18f13d1bb4175fabcdb0eb67fcc59072d06e2c33ec7a3f1a050280002000dc0402b8090400014000100004000140001000040001400010000400014000100004000140001000040001400010000400014000100004000140001000040001400010000400014000100004000140001000040001400010000400014000100004000140003c20c03be4f316408bc8f0910000000049454e44ae426082]],
	right=[[89504e470d0a1a0a0000000d4948445200000080000000800806000000c33e61cb000002b14944415478daedddd18da3301405d029844652880ba1110aa1101a7121de1fa21d692532c31ab0fd8ea55b80730f091862be4a295f12373e04007c0800080002800020000800028000200008000280002000080002800020000800028000200008000280002000080002800020000800028000200008000280dc93790f00018bcfe5ef98008859fc7bcc00c42cfe3d3200318bff3e1200318b7f8f1580be339d2cbefcf464d087dc6ef14ba93366006216ff1e1b00318bff3e00085afcc7ab01258c5dfcc7ab01658c5dfcc74521a5dc93d77e143e390078a8f8adb4311200318b3f5c0f50d6f8c51f9e082a6dfce20f178494377ef18727824a8c513c0017dc9aed71bc00a8971e4702a05e5600fc0c00103809005702003811ec6acc00f80600c0390000ae0200b00e0080954000dc0b50e6996c9d02703730f0d10f40a9f35877eeb47c4f045548eef8e8f74c60c0cb3e4f0507ffdaf7bf800776e5e8e6041080e3e2b732cef0dfc00f5ff1692f7d2d630eff0e1eecae9efd0100b0430800f6080afb648f5dc22a67e4619fc0c000ec141a1c80bd820303b05b7819ff018fd3277f008c75a7efd7277f008c0d6029de19141ac004405c004bf1dab8d0cbc113007101ccc58b23c302c8c59b43430378011017c052bc3b38ec72702e5e1e1d1ac00b80b80096e2f5f16101ac35e6adf83efff7977fbbe003c038cbc1d5ca07a04f00a9e6bc15df1780547bde8aef0740ba62de8aef63eb9774d5bc15dffe7270ba72de8a6f1740beba7c00da0550f5520f80be00ac77950fc0bf1b4574bfb60f409ff703f2ffded503a05f00cb937356fa73001e3bea01781ec0dcca9c957eef72f072e7193e00ed0068ae7800ae0790f7affaa9e5392bbd3e80f58e255c00aec952ce6fc5d6fcd10e40bde5e0dcdb910ec07900db5ef63c42e100fc6ce3e85794392b3d787c0800f8100090b000fe00d39e16e0e60425f80000000049454e44ae426082]],
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
		local path="params_circledial_"..key..".png"
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
	local state=ctx.State
	local api={}
	local gravitySlider=nil
	local speedSlider=nil
	local staminaRegenSlider=nil
	local staminaDepleteSlider=nil
	local jumpSlider=nil
	local diveSlider=nil
	local dialWrap=nil
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
		return not pageKey or isPageEnabled(pageKey)
	end

	local function isSpeedActive()
		return isPageEnabled("speed")
	end

	local function isGravityActive()
		return isPageEnabled("gravity")
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
		state.gameParamsEnabled=true
		state.paramsSelectedPage=normalizePageKey(state.paramsSelectedPage)
		state.speedParamsEnabled=boolDefault(state.speedParamsEnabled,false)
		state.gravityJumpParamsEnabled=boolDefault(state.gravityJumpParamsEnabled,false)
		state.staminaParamsEnabled=boolDefault(state.staminaParamsEnabled,false)
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

	local function syncControls()
		if gravitySlider then gravitySlider.set(state.gravityValue) end
		if speedSlider then speedSlider.set(state.speedValue) end
		if staminaRegenSlider then staminaRegenSlider.set(state.staminaRegenValue) end
		if staminaDepleteSlider then staminaDepleteSlider.set(state.staminaDepleteValue) end
		if jumpSlider then jumpSlider.set(state.jumpPowerValue) end
		if diveSlider then diveSlider.set(state.divePowerValue) end
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
		if folderConns[gameParams] then
			return
		end

		folderConns[gameParams]={}

		table.insert(folderConns[gameParams],gameParams.ChildAdded:Connect(function(child)
			if not isAlive() then return end

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
		if not isAlive() then return end

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
			task.defer(applyGameParams)
		end))

		table.insert(rootConns,root.DescendantAdded:Connect(function(descendant)
			local stateKey=PARAMS[descendant.Name]
			if descendant.Name=="GameParams" or (stateKey and isStateKeyActive(stateKey)) then
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
		if paintDial then paintDial(true) end

		if fire~=false then
			changed()
		end
	end

	function api.ActivateParamsPage(pageKey,fire)
		pageKey=normalizePageKey(pageKey)

		if normalizePageKey(state.paramsSelectedPage)==pageKey then
			api.SetParamsPageEnabled(pageKey,not isPageEnabled(pageKey),fire)
		else
			api.SetParamsSelectedPage(pageKey,fire)
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

		if paintDial then paintDial(true) end

		if fire~=false then
			changed()
		end
	end

	function api.SetGameParamsState(_value,fire)
		state.gameParamsEnabled=true
		startWatching()
		applyGameParams()
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

	paintDial=function(animate)
		local selected=normalizePageKey(state.paramsSelectedPage)
		local active=accentColor()
		local muted=mutedColor()

		for _,pageKey in ipairs(PAGE_ORDER) do
			local enabled=isPageEnabled(pageKey)
			local isSelected=pageKey==selected
			local targetColor=enabled and active or muted
			local targetTransparency=isSelected and (enabled and 0.02 or 0.18) or (enabled and 0.48 or 0.68)
			local textTarget=(enabled or isSelected) and textColor() or muted

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
			Size=UDim2.fromScale(1,1),
			ZIndex=6,
			ClipsDescendants=false,
		},parentFrame)

		local canvas=New("Frame",{
			AnchorPoint=Vector2.new(0.5,0.5),
			Position=UDim2.fromScale(0.5,0.5),
			Size=UDim2.fromOffset(DIAL_W,DIAL_H),
			BackgroundTransparency=1,
			ClipsDescendants=false,
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
					Position=UDim2.new((index-1)/3,1,0,1),
					Size=UDim2.new(1/3,-2,1,-2),
					BackgroundColor3=inputColor(),
					BackgroundTransparency=0.34,
					BorderSizePixel=0,
					Text="",
					AutoButtonColor=false,
					Selectable=false,
					ZIndex=6,
					ThemeRole="INPUT",
				},canvas)
				New("UICorner",{CornerRadius=UDim.new(0,10)},fallback)
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
				Text="",
				Font=Enum.Font.GothamBold,
				TextSize=11,
				TextColor3=textColor(),
				AutoButtonColor=false,
				Selectable=true,
				ZIndex=9,
			},canvas)
			dialButtons[pageKey]=button
			button.Activated:Connect(function()
				api.ActivateParamsPage(pageKey,true)
			end)
		end
	end

	local function createPageEditor(parentFrame)
		pageClip=New("Frame",{
			BackgroundTransparency=1,
			Size=UDim2.new(1,0,0,112),
			LayoutOrder=1,
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
		headerCustom={
			width=70,
			height=56,
			build=function(holder)
				createDial(holder)
			end,
		},
	})

	createPageEditor(section)

	function api.Refresh()
		normalizeState()
		startWatching()
		applyGameParams()
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
		state.gameParamsEnabled=true
		state.paramsSelectedPage=DEFAULT_SELECTED_PAGE
		state.speedParamsEnabled=false
		state.gravityJumpParamsEnabled=false
		state.staminaParamsEnabled=false
		state.gravityEnabled=false
		state.gravityValue=DEFAULT_GRAVITY
		state.speedEnabled=false
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
