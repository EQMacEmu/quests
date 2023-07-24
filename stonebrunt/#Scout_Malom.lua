function event_spawn(e)
	eq.set_timer("depop",3600000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9040}, 0)) then
		e.self:Say("Great work, friend. Take this totem and place it in the case that you were given in Shar Vahl. Do not unwrap the totem and be quick in your pursuit of the others. Once you have all of the totems, please seal the case and return it to Shar Vahl. I can only hope that you will get to all of the spirits in time. Take care, friend.");
		e.other:QuestReward(e.self,{items = {9031,9041},exp = 5000}); -- Item: Official Seal of the Khati Sha
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
