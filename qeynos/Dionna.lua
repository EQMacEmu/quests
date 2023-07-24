function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13708})) then -- Note From Fabian
		e.self:Say("Ah, well, Fabian said to give you this. It really is a good piece. Good luck!");
		e.other:Faction(e.self,284, 1,0); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281, 1,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,262, 1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304, -1,0); -- Faction: Ring of Scale
		e.other:Faction(e.self,285, -1,0); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,0,0,11010,5000); -- Placeholder Scroll, real reward Cloak of Hazy Memories was added after 2012
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
