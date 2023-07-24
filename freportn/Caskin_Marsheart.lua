function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18747})) then
		e.self:Say("Welcome to the guild. here's your guild tunic. Now. let's get to work.");
		e.other:Faction(e.self,284,100,0); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281,15,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,262,15,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304,-5,0); -- Faction: Ring of Scale
		e.other:Faction(e.self,285,-5,0); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,0,0,13571,20); -- Item: Colorfully Patched Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportn  -- Caskin_Marsheart
