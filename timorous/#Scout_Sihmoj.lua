function event_spawn(e)
	eq.set_timer("depop",5400000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9047})) then
		e.self:Say("I knew that this creature had power, but how do you explain this? That fight was well beyond my comprehension. I'm not sure what to do other than have you return the bag to Elder Dumul. I'm sure that he will know what to do next. Take care and be swift.");
		e.other:QuestReward(e.self,0,0,0,0,9048);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
