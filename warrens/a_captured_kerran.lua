function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("My spirrrit witherrrrs herrre in this dank, stinking, flea infested hole! I must be set frrree frrrom these shackles!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6923})) then
		e.self:Say("I thank you for freeing me from my dog faced captors.");
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:warrens  ID:101085 -- a_captured_kerran