function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31781}, 0)) then
		e.self:Say("There's been four wolves that have been ravaging the forest. We need them killed. When you are done bring me back their pelts. I know one to be bloodthristy, while the other is enraged. The other two I haven't even seen. But I can hear 'em.");
		eq.unique_spawn(174034,0,0,1097,1598,93,0):AddToHateList(e.other,1);
		eq.unique_spawn(174035,0,0,1287,1531,93,0):AddToHateList(e.other,1);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31783,item2 = 31784,item3 = 31785,item4 = 31786}, 0)) then
		e.self:Say("I'm still in shock. I can't believe those pesky wolves are finally gone. Bring this note to Wils, he should have something for you.");
		e.other:QuestReward(e.self,0,0,0,0,31782,5000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
