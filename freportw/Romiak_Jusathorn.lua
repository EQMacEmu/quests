function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18741})) then -- A tattered note
		e.self:Say("Greetings, I am Romiak Jusathorn, Master Enchanter of the Academy. Take this.. it's our guild robe; it will help protect you in this harsh environment. Now, let's get to work!");
		e.other:Faction(e.self,220,100,0); -- Arcane Scientists
		e.other:Faction(e.self,281,25,0); -- Knights of Truth
		e.other:Faction(e.self,296,-15,0); -- Opal Dark Briar
		e.other:Faction(e.self,330,-15,0); -- The Freeport Militia
		e.other:QuestReward(e.self,0,0,0,0,13560,20); -- Old Violet Robe
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Romiak_Jusathorn
