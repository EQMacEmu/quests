function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 5}, 0)) then
		e.self:Say("Thank ye for yer Patronage. Enjoy yer mug and be sure ta visit us often.");
		e.other:QuestReward(e.self,0,0,0,0,30145); -- The Icy Mug Souvenir Stein
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
