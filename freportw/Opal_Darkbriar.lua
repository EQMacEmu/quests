function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18739})) then -- A tattered not
		e.self:Say("Welcome to the Academy of Arcane Sciences. Here's one of our guild robes for you to wear. Now, let's get to work.");
		e.other:Faction(e.self,220,100,0); -- Arcane Scientists
		e.other:Faction(e.self,281,25,0); -- Knights of Truth
		e.other:Faction(e.self,296,-15,0); -- Opal Dark Briar
		e.other:Faction(e.self,330,-15,0); -- The Freeport Militia
		e.other:QuestReward(e.self,0,0,0,0,13558,20); -- Patched Violet Robe
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Opal_Darkbriar
