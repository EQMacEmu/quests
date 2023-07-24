function event_spawn(e)
	eq.set_timer("depop",600000);
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14815})) then
		e.self:Say("I believe Streaven and his buddy Frode is waiting on the bridge,  Please get his head and return to Grik and 3 rubies for your reference.");
		eq.unique_spawn(84026,26,0,2945,-3812,-49,0); -- NPC: Commander_Streaven
		eq.unique_spawn(84029,0,0,2140,-2589,-78,108); -- NPC: Frode
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end


function event_timer(e)
	eq.depop();
end