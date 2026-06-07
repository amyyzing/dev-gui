# Football object discovery

The script does not rely on one single object path. It searches the character and nearby descendants for a football part.

## Search order

1. `Workspace[LP.Name]` or `LP.Character`.
2. Direct child named `Football` under the character.
3. Descendants of `Football` if that direct child is a `Model`, `Folder`, or `Tool`.
4. Any descendant whose ancestry contains the text `football`.
5. `character.GAMEOBJECTS` as a secondary container.
6. If `LP.Character` differs from `Workspace[LP.Name]`, search `LP.Character` too.
7. In squads mode, fallback to `Workspace.MiniGames` or `ReplicatedStorage.MiniGames` descendants named `Football`.

## Distance gate

A discovered football part must be within `35` studs of the character root for held-ball detection.

## Inferred source

```lua
local function getHeldBall()
	local character=Workspace:FindFirstChild(LP.Name) or LP.Character
	local characterRoot=root(character)
	if not(character and characterRoot) then return nil end

	local function findBallPart(container,maxDistance)
		if not container then return nil end

		local function looksLikeFootball(inst)
			while inst and inst~=container do
				if tostring(inst.Name):lower():find("football",1,true) then
					return true
				end
				inst=inst.Parent
			end

			return false
		end

		local direct=container:FindFirstChild("Football")
		if direct then
			if direct:IsA("BasePart") and (direct.Position-characterRoot.Position).Magnitude<=maxDistance then
				return direct
			end

			if direct:IsA("Model") or direct:IsA("Folder") or direct:IsA("Tool") then
				for _,descendant in ipairs(direct:GetDescendants()) do
					if descendant:IsA("BasePart") and (descendant.Position-characterRoot.Position).Magnitude<=maxDistance then
						return descendant
					end
				end
			end
		end

		for _,descendant in ipairs(container:GetDescendants()) do
			if descendant:IsA("BasePart") and looksLikeFootball(descendant) and (descendant.Position-characterRoot.Position).Magnitude<=maxDistance then
				return descendant
			end
		end

		return nil
	end

	local ball=findBallPart(character,35)
	if ball then return ball end

	ball=findBallPart(character:FindFirstChild("GAMEOBJECTS"),35)
	if ball then return ball end

	if LP.Character and LP.Character~=character then
		local lpRoot=root(LP.Character)
		if lpRoot then
			characterRoot=lpRoot
			ball=findBallPart(LP.Character,35)
		end
	end

	if ball then return ball end

	return nil
end
```

## Minigame football fallback

```lua
local function getFootballFromFolder(folder)
    if not folder then return nil end
    for _,descendant in ipairs(folder:GetDescendants()) do
        if descendant:IsA("BasePart") and descendant.Name=="Football" then
            return descendant
        end
    end
    return nil
end
```
