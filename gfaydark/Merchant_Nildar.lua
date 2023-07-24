function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18903})) then
		e.self:Say("My brother still lives? Thank you for this news. Please, take this with my deepest thanks.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(2007,2004,2006,2010,2011),30000); -- Item(s): Leather Belt (2007), Leather Tunic (2004), Leather Cloak (2006), Leather Gloves (2010), Leather Leggings (2011)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
