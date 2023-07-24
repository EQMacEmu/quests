-- Orc hand-in NPC for Final Task Rogue

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19930})) then
		e.self:Say("Arg");
		e.other:QuestReward(e.self,0,0,0,0,19918); -- Item: Rough Blue Gem
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
