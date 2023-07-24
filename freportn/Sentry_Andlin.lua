function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! I would love to converse with you, but as you cansee, I am standing my watch.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12127})) then
		e.self:Say("My thanks to you. I feel much strength. You may take the bottle to the next sentry.");
		e.other:Faction(e.self,362,1); -- Faction: Priests of Marr
		e.other:Faction(e.self,330,-1); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,1); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,12128,100); -- Item: Part of Potion of Marr
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
