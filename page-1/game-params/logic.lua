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
local DIAL_W=42
local DIAL_H=42
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
	left=[[89504e470d0a1a0a0000000d494844520000002a0000002a0806000000c5c3c95b000000cd4944415478daedd8c10dc2300c05d0ec9205324d17e8025980053a4ec6e9022c90fb07a458200e50a8e5faabfe52aed55312b98e1380c4b05240031ad0800634a0aea1f9be3a0374c1336ea1b29bef71079df1396ea00ddfe302dab13d87410bfe8b3974c2be98412bf6c7047a815e68a0f07ef426d089055a58a0bf16fc43a18d053ab340b3e2f19b36ceaea15abb6af2b8ab2c508d0a60067d5c8195012a7fab2b0354b02b0354ae416380be5683ce0095dd5d3680dd0cc9f2e80d9ad57445eb436534df753c6bce3b76bc01a374254a1d2852fe0000000049454e44ae426082]],
	center=[[89504e470d0a1a0a0000000d494844520000002a0000002a0806000000c5c3c95b000000d74944415478daedd7cd0d83300c0560766101a6e9022ce005ba00e3649c2cc002dcdd54caa92a8903760ce83de95d103f9f80403230f370876a9d684a7da552ea3b97f2b6c9133aa6cea92175e37ab6bcef9c8f35877e2fb2087125f4d20a6e41d249e03f306942c7fcd8ac12247757324822db27d6065d0db972bfac256ce97147ee9fb8f71aec4103fb2548a1c4fe21e91df54ed360ba0c52fa1d75051ef933b9008ffeeb5d9067664fdd805af35173a0f6c4d90ca80d1d2c91dad05ff025d74cb759dc010a28a080020a28a080020a28a0803e11fa01e4772699b8e9bf4f0000000049454e44ae426082]],
	right=[[89504e470d0a1a0a0000000d494844520000002a0000002a0806000000c5c3c95b000000c84944415478daedd8cb0d84300c04d0f49206a8260dd0401aa001ca493934b00de46e380409102c6871cc78f148be3fc5727e8e889c86720635a8410d6a50831af442e5a93c3a744e8f0add66b5aa88c0655a14e859d2d3d0abc94f417f492309bd932005bd9b581bca95ae2694de088d5aa0410bb4d100adbee173256981b61aa022d73c8e885c9c595713191aa51e772c938e0c1db62d47847ee65308193a7c43a240d351bb51a0796fba91a0b96ce69e00fe9ef670a99cdd9e803ec9bad2d67036247ff7ed3802e3c4254a2c40e5b50000000049454e44ae426082]],
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
			width=54,
			height=42,
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
