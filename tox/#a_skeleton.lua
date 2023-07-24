function event_spawn(e)
	eq.set_timer("rant",math.random(180000,450000));
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Grab a pick. Give us a hand!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13894})) then
		e.self:Say("Good work, you should be running this operation instead of that Talrigar fellow. Have a small reward. A little bit of the gems I found while tunneling through this rock.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10015,10016,10017,10018),500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "rant") then
		e.self:Say("A skeleton's day is never done.");
		eq.set_timer("rant",math.random(180000,450000));
	end
end
