function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 13844})) then
		e.self:Say("Tick.. Pop.. Access granted.");
		-- verified live faction
		e.other:Faction(e.self,333,1,0); -- Faction: King Ak'Anon
		e.other:Faction(e.self,245,1,0); -- Faction: Eldritch Collective
		e.other:Faction(e.self,255,1,0); -- Faction: Gem Choppers
		e.other:Faction(e.self,238,-1,0); -- Faction: Dark Reflection
		e.other:Faction(e.self,287,-1,0); -- Faction: Meldrath
		e.other:QuestReward(e.self,0,0,0,0,13214,10);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
