function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9968})) then
		e.self:Say("Ahhhhhhhh! I can't believe that you ---- ahhhhhhhh! Die you, you, you evil evil heretic!");
		eq.attack(e.other:GetName());
		e.other:QuestReward(e.self,{itemid = 9967}); --Karran's Head
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
