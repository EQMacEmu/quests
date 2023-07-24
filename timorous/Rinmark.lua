--Rinmark is spawned from an iksar master in this zone and is part of the Test of Patience. Please see the iksar master's quest file for details.
function event_spawn(e)
	eq.set_timer("Depop3",90000);
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Good, your sense of timing is correct. Now begin! Show me that your training has not been wasted.");
	end
end

function event_timer(e)
	if(e.timer == "Depop3") then
		eq.stop_timer("Depop3");
		eq.depop();
	end
end

function event_death_complete(e)
	eq.stop_timer("Depop3");
	e.self:Say("Your ability is strong, may you serve Cazic Thule with all your might.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
