function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18904})) then
		e.self:Say("'I have no words for the gratitude I feel. So many of our young ones have been captured by the filthy orcs. Please, take this for saving my sister.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(2012,2004,2006,2005,2011),500); -- Item(s): Leather Boots (2012), Leather Tunic (2004), Leather Cloak (2006), Leather Shoulderpads (2005), Leather Leggings (2011)
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
