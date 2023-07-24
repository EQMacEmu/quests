function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30138}, 0)) then
		e.self:Say("I will report your selfless actions when I return to Thurgadin. Take this for your troubles, friend. I hope you find it useful. Fare thee well.");
		e.other:Faction(e.self,406,10); -- Coldain
		e.other:Faction(e.self,405,2); -- Dain Frostreaver IV
		e.other:Faction(e.self,448,-1); -- Kromzek
		e.other:Faction(e.self,419,-5); -- Kromrif
		e.other:QuestReward(e.self,0,0,0,0,30140,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
