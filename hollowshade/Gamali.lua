function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("Glances up at you for a moment and then grunts and turns back toward the water.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local bottles = 0
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16598,item2 = 16598,item3 = 16598,item4 = 16598}, 0)) then
		bottles = 4;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 16598,item2 = 16598,item3 = 16598}, 0)) then
		bottles = 3;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 16598,item2 = 16598}, 0)) then
		bottles = 2;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 16598}, 0)) then
		bottles = 1;
	end
	
	if(bottles > 0) then
		repeat
			e.self:Emote("leans over and fills the bottle with cool clear liquid. Gamali says, 'So Merchant Ahlam has you doing his errands now does he? Well, here's your water. I can assure you it's of good quality.' She turns away and begins staring out into the distance.");
			e.other:QuestReward(e.self,0,0,0,0,31761);
			bottles = bottles - 1;
		until bottles == 0
	end

	bottles = 0;
	item_lib.return_items(e.self, e.other, e.trade)
end
