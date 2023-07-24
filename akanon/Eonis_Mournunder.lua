function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18771})) then -- Stained Letter
		e.self:Say("Hmmm... As you wish, we will train you in our dark ways. But know this: our art carries a high price, and there is no turning back for you now.");
		e.other:Faction(e.self,238,100,0); 	-- Dark reflection
		e.other:Faction(e.self,245,-10,0); 	-- eldritch collective
		e.other:Faction(e.self,255,-10,0); -- gem choppers
		e.other:Faction(e.self,240,-10,0); 	-- Deepmuses
		e.other:QuestReward(e.self,0,0,0,0,13524,20); -- Dark Gold Felt Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
