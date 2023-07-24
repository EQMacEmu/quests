function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Gimme duffynitey rocks! Me grindem GUUD!!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10073})) then --Dufrenite
		e.self:Say("GRIND! GRIND! GRIND!");
		e.other:QuestReward(e.self,0,0,0,0,19051); --Ground Dufrenite
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
