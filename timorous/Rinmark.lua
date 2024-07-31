--Rinmark is spawned from an iksar master in this zone and is part of the Test of Patience. Please see the iksar master's quest file for details.
function event_spawn(e)
	eq.set_timer("Depop3",90000);
end

function event_combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("Depop3")) then
			eq.pause_timer("Depop3");
		end
	else
		eq.resume_timer("Depop3");
	end
end

function event_timer(e)
	eq.depop();
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
