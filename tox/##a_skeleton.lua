function event_spawn(e)
	eq.set_timer("rant",math.random(180000,450000));
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Can't you see we're busy here?!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13894})) then
		e.self:Say("Aye.. You cut out the middleman..  I shall reward you.. hmm..  I have not found anything. how about..  <CRACK!! SNAP!! RIPP!!>  How about something off meself?");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9304,12195,13073,13074),500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "rant") then
		e.self:Say("Yo ho. No sun!");
		eq.set_timer("rant",math.random(180000,450000));
	end
end
