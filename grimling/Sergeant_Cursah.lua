function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, friend. May I be of assistance?");
	end
end

function event_trade(e)
	local item_lib = require("items");

	-- the quest text for this NPC seems lost to history
	
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 8473}, 0)) then -- Locked Satchel
		e.other:QuestReward(e.self, 0, 0, 0, 0, 8419); -- Cloak of the Jharin Hero
		
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 8476}, 0)) then -- Locked Satchel
		e.other:QuestReward(e.self, 0, 0, 0, 0, 8420); -- Cloak of the Khati Sha Hero
		
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 8477}, 0)) then -- Locked Satchel
		e.other:QuestReward(e.self, 0, 0, 0, 0, 8421); -- Cloak of the Khala Dun Hero
		
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 8478}, 0)) then -- Locked Satchel
		e.other:QuestReward(e.self, 0, 0, 0, 0, 8422); -- Cloak of the Dar Khura Hero
		
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 8479}, 0)) then -- Locked Satchel
		e.other:QuestReward(e.self, 0, 0, 0, 0, 8423); -- Cloak of the Taruun Hero		
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end
