# `Mechanics` module / object

The client script looks for a `Mechanics` table/object with at least one of these functions:

```lua
PlayAnimation
UnequipFootball
```

## Lookup order

1. `getgenv().Mechanics`
2. `getgenv().Variables.Mechanics`
3. `_G.Mechanics`
4. `_G.Variables.Mechanics`
5. `LP.PlayerScripts.ClientMain.Utilities.Variables`, after `require`, then `variables.Mechanics`

## Source resolver

```lua
local function getGlobalMechanics()
	local function valid(mechanics)
		return mechanics and (type(mechanics.PlayAnimation)=="function" or type(mechanics.UnequipFootball)=="function")
	end

	if valid(cachedMechanics) then
		return cachedMechanics
	end

	local globals=(typeof(getgenv)=="function" and getgenv()) or _G or {}
	if type(globals)=="table" then
		local mechanics=rawget(globals,"Mechanics")
		if valid(mechanics) then
			cachedMechanics=mechanics
			return mechanics
		end

		local variables=rawget(globals,"Variables")
		if type(variables)=="table" and valid(variables.Mechanics) then
			cachedMechanics=variables.Mechanics
			return variables.Mechanics
		end
	end

	local playerScripts=LP:FindFirstChild("PlayerScripts")
	local clientMain=playerScripts and playerScripts:FindFirstChild("ClientMain")
	local utilities=clientMain and clientMain:FindFirstChild("Utilities")
	local variablesModule=utilities and utilities:FindFirstChild("Variables")
	if variablesModule then
		local ok,variables=pcall(require,variablesModule)
		if ok and type(variables)=="table" and valid(variables.Mechanics) then
			cachedMechanics=variables.Mechanics
			return variables.Mechanics
		end
	end

	return nil
end
```

## Use sites

### Throw animation

If `Mechanics.PlayAnimation` exists, QBAim calls:

```lua
mechanics:PlayAnimation("UF_QuarterbackThrow", 1.35)
```

### Unequip after gameplay throw

After a gameplay `ThrowBall` remote, QBAim tries:

```lua
mechanics:UnequipFootball()
```

That unequip call is not used in the squads remote branch.
