function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14799})) then
		e.self:Emote("takes the vial, hands shaking as he looks upon you fearfully. It then gulps down what it assumes to be a beverage. After a moment, it clutches at its throat and tries to scream, only able to muster a weak gurgle as its flesh is reduced to liquid. In seconds all that is left is a puddle of greenish goo which you quickly collect.");
		e.other:QuestReward(e.self,0,0,0,0,14805);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end