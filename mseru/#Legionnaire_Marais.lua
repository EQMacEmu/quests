function event_spawn(e)
	eq.set_timer("depop",600000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop_with_timer();
	elseif(e.timer == "die") then
		eq.depop_with_timer();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks up at you wearily, 'Corporal Donfeld?'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18332}, 0)) then -- 18332
		e.self:Emote("shows relief in his eyes, 'I knew someone would come if I... just held out... long enough... Take these... be careful... ' And with that, Marais allows himself to finally die.");
		e.other:QuestReward(e.self,{items = {18334,18333}}); -- Marais' Notes
		eq.set_timer("die",10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
