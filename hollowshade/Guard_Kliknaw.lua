function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6220}, 0)) then
		e.self:Emote("yells, 'Head count! Head count time!' A moment later he says, 'I'm pretty sure that they're all here. Just take this back and act like your didn't just see that.' He winks and hands you the report.");
		e.other:Faction(e.self,1513,1);
		e.other:QuestReward(e.self,0,0,0,0,6221,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
