function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("H...el...p me...");
	end
end	

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18804})) then
		e.self:Say("kill me... kill...me")
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end