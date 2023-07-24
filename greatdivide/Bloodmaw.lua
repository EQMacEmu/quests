function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30264,item2 = 30264,item3 = 30264,item4 = 30264}, 0)) then
		eq.depop_with_timer(118026); -- despawn bloody gnome captive.
		eq.spawn2(118017,0,0,3172,-5930,-107,82); -- spawn gnomish captive
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
