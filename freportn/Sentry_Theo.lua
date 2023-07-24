function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please speak with the masters. I am on watch and have no time to converse.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12132})) then
		e.self:Say("That gives me new life. Take it to the next sentry.");
		e.other:Faction(e.self,362,1); -- Faction: Priests of Marr
		e.other:Faction(e.self,330,-1); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,1); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,12133,100); -- Item: Part of Potion of Marr
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
