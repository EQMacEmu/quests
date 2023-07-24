--Andara C'Luzz, Neriaka 41095
--Need Ending Statement
--Need Factions
--Status: Not Complete

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16166, item2 = 19582, item3 = 19583})) then
		e.self:Say("Here's your bow. Use it well, young rogue.");
		e.other:QuestReward(e.self,0,0,0,0,19611,150); -- Item: Ebon Short Bow
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
