function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please seek guidance from the clerics within this temple.  I am but a Sentry of Passion and my duty is to protect this temple.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12128})) then
		e.self:Say("Ahhh!! That has given me back lost energy. Thank you. Please take this to the next sentry.");
		e.other:Faction(e.self,362,1); -- Faction: Priests of Marr
		e.other:Faction(e.self,330,-1); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,1); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,12129,100); -- Item: Part of Potion of Marr
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
