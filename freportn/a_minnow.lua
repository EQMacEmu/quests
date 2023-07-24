function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13861})) then
		e.self:Emote("darts into the jar, or just darted past it!! The Knights of Truth do not tolerate people attempting to catch these fish!!");
		e.other:Faction(e.self,281,-2,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,271,1,0); -- Faction: Dismal Rage
		e.other:Faction(e.self,330,1,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,362,-2,0); -- Faction: Priests of Marr
		e.other:Faction(e.self,311,-2,0); -- Faction: Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(13861,13862)); -- Item(s): A Jar of Liquid (13861), Fish in a Jar (13862)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
