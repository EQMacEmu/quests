function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18772})) then -- Registration Letter
		e.self:Say("Welcome to Library Mechanimagica. I am Master Magician Wuggan Azusphere. and I will help to teach you the ways of summoning. Here is our guild tunic, make us proud.");
		e.other:Faction(e.self,245,100,0); 	-- eldritch collective
		e.other:Faction(e.self,238,-15,0); 	-- Dark reflection
		e.other:Faction(e.self,239,-5,0);	-- the dead
		e.other:Faction(e.self,255,15,0); 	-- gem choppers
		e.other:Faction(e.self,333,15,0); 	-- king ak'anon
		e.other:QuestReward(e.self,0,0,0,0,13521,20);	-- Dusty Gold Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
