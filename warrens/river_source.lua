function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1799})) then -- Harbinger of Bertoxxulous
		e.other:QuestReward(e.self,0,0,0,0,1892,1000); -- Empty Jar
	end
	item_lib.return_items(e.self, e.other, e.trade)
end