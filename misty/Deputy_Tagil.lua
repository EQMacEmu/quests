function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18013})) then
		e.self:Say("What's this?  Oh dear. I am very sorry. Please take this to Uner with my apologies.");
		e.other:QuestReward(e.self,0,0,0,0,13240,100); -- Item: Deputy Tagils Payment
	end
end
