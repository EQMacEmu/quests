function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31475}, 0)) then
		e.other:QuestReward(e.self,0,0,0,0,29900);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
