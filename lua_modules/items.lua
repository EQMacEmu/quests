local items = {}

function items.check_turn_in(npc, trade, trade_check, keepitems, text, emote)
	keepitems = keepitems or 1;	
	
	local required_items = 0;
	if(text ~= nil or emote ~= nil) then
		for i = 1, 4 do
			local key = "item" .. i;
			if(trade_check[key] ~= nil and trade_check[key] ~= 0) then
				if(keepitems == 0 or (keepitems == 1 and not npc:GetQuestLoot(trade_check[key]))) then
					required_items = required_items + 1;
				end
			end
		end

		eq.debug("".. npc:GetCleanName() .. " requires " .. required_items .. " more items for this handin.", 2);
	end

	local trade_return = {};
	for key, value in pairs(trade) do
		trade_return[key] = value;
	end
	
    local accepted = false;
	if(keepitems == 1) then
		-- Add all the items handed to us that the NPC needs to its loottable
		local founditem = false;
		for a = 1, 4 do
			local add = trade_return["item" .. a];
			local itemid = 0;
			for b = 1, 4 do
				local curkey = "item" .. b;
				if(add ~= nil and add.valid and trade_check[curkey] ~= nil and trade_check[curkey] ~= 0) then
					if(trade_check[curkey] == add:GetID()) then
						eq.debug("Item " .. add:GetID() .. " added to QUEST loot.", 2);
						npc:AddQuestLoot(add:GetID());
						trade_return["item" .. a] = nil;
						founditem = true;
                        accepted = true;
						itemid = 0;

						if(text ~= nil or emote ~= nil) then
							required_items = required_items - 1;
							if(required_items ~= 0) then
								if(text ~= nil) then
									npc:Say("" .. text .. "");
								elseif(emote ~= nil) then
									npc:Emote("" .. emote .. "");
								end
							end
						end

						break;
					else
						itemid = add:GetID();
					end
				end
			end
			if(npc:Charmed() and itemid > 1000 and not npc:GetPetLoot(itemid) and not npc:GetQuestLoot(itemid)) then
				eq.debug("Item " .. itemid .. " added to PET loot.", 2);
				npc:AddPetLoot(itemid);
			end
		end
		-- The npc was handed an item it doesn't need.
		if(not founditem and trade_check["copper"] == nil and trade_check["silver"] == nil and trade_check["gold"] == nil and trade_check["platinum"] == nil) then
            if(accepted) then
                eq.debug("NPC was handed an item it doesn't need, but also received valid items.", 2);
            end
			return false;
		end
	end
	
	--Main loops. First loop iterates though the quest items (item1, item2, etc.) The second loop iterates
	--through the items handed to the NPC, comapring them to the item in the first loop.
	for i = 1, 4 do
		local key = "item" .. i;		
		if(trade_check[key] ~= nil and trade_check[key] ~= 0) then
			local found = false;
			for j = 1, 4 do
				-- This compares the items handed to the NPC with what is specified in the quest.
				local inst = trade_return["item" .. j];
				if(inst ~= nil and inst.valid) then
					local itemid = inst:GetID();
					
					if(trade_check[key] == itemid) then
						if(keepitems == 0) then
							trade_return["item" .. j] = ItemInst();
						end
						found = true;
						
						if(keepitems == 0 and text ~= nil) then
							required_items = required_items - 1;
							if(required_items ~= 0) then
								npc:Say("" .. text .. "");
							end
						end

						break;
					end
				end
			end

			if(not found) then
				if(keepitems == 1) then 
					-- This compares the items in the NPC's loottable with what is specified in the quest.
					local hasitem = npc:GetQuestLoot(trade_check[key]);
					if(hasitem) then
						found = true;											
					else
						eq.debug("An item the NPC requires (" .. trade_check[key] .. ") was not handed to them and is not in their loot.", 2);
						return false;
					end
				else
					eq.debug("(Non-MQ) An item the NPC requires (" .. trade_check[key] .. ") was not handed to them.", 2);
					return false;
				end
			end
		end
	end
	
	-- Setup clean variables for count check and delete.
	local item1 = trade_check["item1"];
	local item2 = trade_check["item2"];
	local item3 = trade_check["item3"];
	local item4 = trade_check["item4"];
	if(trade_check["item1"] == nil) then
		item1 = 0;
	end
	if(trade_check["item2"] == nil) then
		item2 = 0;
	end
	if(trade_check["item3"] == nil) then
		item3 = 0;
	end
	if(trade_check["item4"] == nil) then
		item4 = 0;
	end
		
	if(keepitems == 1) then
		-- If the quest requires multiple of the same item, this counts up the NPC's loottable items for us.
		local count = npc:HasRequiredQuestLoot(item1, item2, item3, item4);
		if(not count) then
			eq.debug("The NPC does not have the required number of items it needs.", 2);
			return false;
		end
	end
	
	--convert our money into copper then check that we have enough then convert change back
	local trade_check_money = 0;
	local return_money = 0;

	if(trade_check["platinum"] ~= nil and trade_check["platinum"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["platinum"] * 1000);
	end

	if(trade_check["gold"] ~= nil and trade_check["gold"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["gold"] * 100);
	end

	if(trade_check["silver"] ~= nil and trade_check["silver"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["silver"] * 10);
	end

	if(trade_check["copper"] ~= nil and trade_check["copper"] ~= 0) then
		trade_check_money = trade_check_money + trade_check["copper"];
	end

	return_money = return_money + trade_return["platinum"] * 1000 + trade_return["gold"] * 100;
	return_money = return_money + trade_return["silver"] * 10 + trade_return["copper"];

	if(return_money < trade_check_money) then
		return false;
	else
		return_money = return_money - trade_check_money;
	end

	--replace trade with trade_return
	trade.item1 = trade_return.item1;
	trade.item2 = trade_return.item2;
	trade.item3 = trade_return.item3;
	trade.item4 = trade_return.item4;

	if(keepitems == 1) then
		npc:DeleteQuestLoot(item1, item2, item3, item4);
	end

	trade.platinum = math.floor(return_money / 1000);
	return_money = return_money - (trade.platinum * 1000);

	trade.gold = math.floor(return_money / 100);
	return_money = return_money - (trade.gold * 100);

	trade.silver = math.floor(return_money / 10);
	return_money = return_money - (trade.silver * 10);

	trade.copper = return_money;
	eq.debug("The quest completed successfully.",2);
	return true;
end

function items.return_items(npc, client, trade, text)
	if ( type(text) == "boolean" and text == false ) then
		text = "";
	end
	local returned = false;

	for i = 1, 4 do
		local inst = trade["item" .. i];
		if(inst ~= nil and inst.valid) then
			-- If the npc does not have this item in their quest loot, then it needs to be returned.
			
			local itemid = inst:GetID();
			if(not npc:GetQuestLoot(itemid)) then
			
				if (npc:Charmed()) then
					if (itemid > 1000 and not npc:GetPetLoot(itemid)) then
						eq.debug("Item " .. itemid .. " added to PET loot.", 2);
						npc:AddPetLoot(itemid);
					end
				else		
			
					local charges = inst:GetCharges();
					client:SummonItem(itemid, charges, 9999, true);
					if (npc:CanTalk()) then
						if (not text) then
							npc:Say("I have no need for this item " .. client:GetCleanName() .. ", you can have it back.");
						elseif (text ~= "") then
							npc:Say(text);
						end
					end
					eq.debug("Handing back an item it doesn't need (" .. itemid .. ").", 2);
					returned = true;
				end
			end
		end
	end

	if(npc:Charmed()) then
		eq.debug("NPC is a charmed pet, it does not return items.", 2);
		return returned;
	end

	local money = false;
	if(trade.platinum ~= 0) then
		returned = true;
		money = true;
	end

	if(trade.gold ~= 0) then
		returned = true;
		money = true;
	end

	if(trade.silver ~= 0) then
		returned = true;
		money = true;
	end

	if(trade.copper ~= 0) then
		returned = true;
		money = true;
	end

	if(money == true) then
		client:AddMoneyToPP(trade.copper, trade.silver, trade.gold, trade.platinum, true);
	end

	return returned;
end

function items.count_handed_item(npc, trade, items, min_count, text, emote)

	local itemid1 = items[1] or 0;
	local itemid2 = items[2] or 0;
	local itemid3 = items[3] or 0;
	local itemid4 = items[4] or 0;
	local itemid5 = items[5] or 0;
	local itemid6 = items[6] or 0;
	local itemid7 = items[7] or 0;
	local itemid8 = items[8] or 0;
	min_count = min_count or 1;

	local mq_loot = {};

	local count = npc:QuestLootCount(itemid1) + npc:QuestLootCount(itemid2) + npc:QuestLootCount(itemid3) + npc:QuestLootCount(itemid4) + 
	npc:QuestLootCount(itemid5) + npc:QuestLootCount(itemid6) + npc:QuestLootCount(itemid7) + npc:QuestLootCount(itemid8);
	local handed_count = 0;
	for j = 1, 4 do
		local inst = trade["item" .. j];
		if(inst ~= nil and inst.valid) then
			if(inst:GetID() > 0 and (itemid1 == inst:GetID() or itemid2 == inst:GetID() or itemid3 == inst:GetID() or itemid4 == inst:GetID() or 
			itemid5 == inst:GetID() or itemid6 == inst:GetID() or itemid7 == inst:GetID() or itemid8 == inst:GetID())) then
				count = count + 1;
				handed_count = handed_count + 1;
				if(min_count > 1) then
					-- This item may be added to quest loot, add to mq array for further processing below.							
					mq_loot["item" .. j] = trade["item" .. j];
					if(count < min_count and (text ~= nil or emote ~= nil)) then
						if(text ~= nil) then
							npc:Say("" .. text .. "");
						elseif(emote ~= nil) then
							npc:Emote("" .. emote .. "");
						end
					end
				end
				trade["item" .. j] = nil;
				eq.debug("Found item in slot (" .. j .. ") count is now " .. count .. "", 2);
			end
		end
	end

	if(handed_count == 0) then
		eq.debug("Quest will not complete.",2);
		return 0;
	end

	local clear_loot = true;
	if(min_count > 1) then
		-- Figure out if we need to add items to quest loot.
		local remainder = count - min_count;
		if(remainder <= 1 and remainder ~= 0) then
			for i = 4, 1, -1 do
				if(mq_loot["item" .. i] ~= nil) then
					local mqitem = mq_loot["item" .. i];
					if(mqitem ~= nil and mqitem.valid) then
						npc:AddQuestLoot(mqitem:GetID());
						clear_loot = false;
						if(remainder == 1) then
							break;
						end
					end
				end
			end
		end

		-- Figure out how many times the quest should complete if it isn't a 1:1 hand-in.
		local count_float = count / min_count;
		if(count_float%1==0) then
			count = count_float;
		else
			if(count_float < 1) then
				count = 0;
			else
				count = math.floor(count_float-0.5);
			end
		end
	end

	if(clear_loot) then
		-- Clear out any quest items that got saved from a previous hand-in.
		eq.debug("Clearing quest loot", 2);
		npc:DeleteQuestLoot(itemid1,itemid2,itemid3,itemid4);
		if(itemid5 > 0) then
			npc:DeleteQuestLoot(itemid5,itemid6,itemid7,itemid8);
		end

	end

	eq.debug("Quest will complete " .. count .. " times.", 2);
	return count;

end

return items;
