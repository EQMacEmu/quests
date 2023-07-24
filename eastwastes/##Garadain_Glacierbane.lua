function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1092}, 0)) then
		e.self:Say("Good work friend! The Dain will hear of this right away. We couldn't have defeated the Ry'gorr  without your help. Take this ring as proof that you have served the Coldain well. You may wish to show it to the Seneschal should you ever stop in our fine city. Farewell, " .. e.other:GetCleanName() .. ", it has been my pleasure knowing you.");
		-- Faction confirmed live
		e.other:Faction(e.self,406,35); -- Coldain
		e.other:Faction(e.self,405,8); -- Dain Frostreaver IV
		e.other:Faction(e.self,448,-3); -- Kromzek
		e.other:Faction(e.self,419,-17); -- Kromrif
		e.other:QuestReward(e.self,0,0,0,0,30164,8000);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
