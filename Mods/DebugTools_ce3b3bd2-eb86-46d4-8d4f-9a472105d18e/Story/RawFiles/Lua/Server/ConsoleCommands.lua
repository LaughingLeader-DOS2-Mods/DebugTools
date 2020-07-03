Ext.RegisterConsoleCommand("help", function(radius)
	print("==========================")
	print("===Debug Tools Commands===")
	print("==========================")
	print("")
	print("!printid")
	print("Prints the GUIDSTRING of the current character you control. This can be used in other commands.")
	print("")
	print("!listcharacter | radius:float")
	print("Lists character GUIDSTRING, name, position, rotation, and character stats in a radius, or the whole level if no radius is specified.")
	print("Example: !listcharacter 8.0")
	print("")
	print("!listtags | target:GUIDSTRING (optional, defaults to your controlled character)")
	print("Lists of all an object's tags in the console window.")
	print("Examples:")
	print("!listtags")
	print("!listtags S_Player_RedPrince_a26a1efb-cdc8-4cf3-a7b2-b2f9544add6f")
	print("")
	print("!settag | tag:String (the tag to set) target:GUIDSTRING (optional, defaults to your controlled character)")
	print("Sets a tag on an object")
	print("Examples:")
	print("!settag AVATAR")
	print("!settag AVATAR S_Player_RedPrince_a26a1efb-cdc8-4cf3-a7b2-b2f9544add6f")
	print("")
	print("==========================")
end)

Ext.RegisterConsoleCommand("printid", function()
	local target = CharacterGetHostCharacter()
	print("[DebugTools] Host GUID is", target)
end)

Ext.RegisterConsoleCommand("listcharacter", function(radius)
	if radius == nil then
		print("====================")
		print("===Character List===")
		print("====================")
		CharacterLaunchOsirisOnlyIterator("Iterator_LLDT_PrintCharacterInfo")
	else
		local host = CharacterGetHostCharacter()
		CharacterLaunchIteratorAroundObject(host, radius, "Iterator_LLDT_PrintCharacterInfo")
	end
	print("====================")
end)

function PrintCharacterInfo(character)
	---@type EsvCharacter
	local characterObj = Ext.GetCharacter(character)
	print("------")
	print(character)
	print("------")
	print("Name:", CharacterGetDisplayName(character))
	print("Position:", GetPosition(character))
	print("Rotation:", GetRotation(character))
	print("Stats:", characterObj.Stats.Name)
	print("Tags:")
	for i,tag in ipairs(characterObj:GetTags()) do
		print(" "..tag)
	end
	print("------")
end

Ext.RegisterConsoleCommand("listtags", function(target)
	if target == nil then
		target = CharacterGetHostCharacter()
	end
	local obj = nil
	if ObjectIsCharacter(target) == 1 then
		---@type EsvCharacter
		obj = Ext.GetCharacter(target)
	elseif ObjectIsCharacter(target) == 1 then
		---@type EsvItem
		obj = Ext.GetItem(target)
	end
	if obj ~= nil then
		print(target)
		print("[DebugTools] Tags:")
		print("------")
		for i,tag in ipairs(obj:GetTags()) do
			print(" "..tag)
		end
		print("------")
	end
end)

Ext.RegisterConsoleCommand("settag", function(tag,target)
	if tag ~= nil then
		if target == nil then
			target = CharacterGetHostCharacter()
		end
		if IsTagged(target, tag) == 0 then
			SetTag(target, tag)
			print("[DebugTools] Set tag", tag, "on",target)
			if ObjectIsCharacter(target) == 1 then 
				CharacterStatusText(target, string.format("Added Tag %s", tag))
			else
				DisplayText(target, string.format("Added %s", tag))
			end
		else
			print(target, "already has tag", tag)
		end
	else
		print("[DebugTools] settag: Please specify a tag.")
	end
end)

Ext.RegisterConsoleCommand("cleartag", function(tag,target)
	if tag ~= nil then
		if target == nil then
			target = CharacterGetHostCharacter()
		end
		if IsTagged(target, tag) == 1 then
			ClearTag(target, tag)
			print("[DebugTools] Cleared tag", tag, "on",target)
			if ObjectIsCharacter(target) == 1 then 
				CharacterStatusText(target, string.format("Removed Tag %s", tag))
			else
				DisplayText(target, string.format("Removed Tag %s", tag))
			end
		else
			print(target, "already has tag", tag)
		end
	else
		print("[DebugTools] cleartag: Please specify a tag.")
	end
end)