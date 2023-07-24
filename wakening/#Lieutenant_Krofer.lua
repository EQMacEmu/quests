function event_spawn(e)
	eq.set_timer("depop",1200000);
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1708}, 0)) then -- Mission Report
		e.self:Say("Failure! Incompetence! The whole squad anihilated! I knew this would happen if left in the hands of a worthless mercenary! Well, you can take this report back to Drioc then. Now get out of my sight, mercenary.");
		e.other:QuestReward(e.self,0,0,0,0,1709,1000); -- Report of Failure
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.depop();
end
