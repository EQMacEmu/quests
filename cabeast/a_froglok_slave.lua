function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14799})) then
		e.other:QuestReward(e.self,0,0,0,0,14805);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end