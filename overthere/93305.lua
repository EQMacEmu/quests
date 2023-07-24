function event_spawn(e)
	eq.signal(93087,2); -- NPC: General_V`Deers
	eq.signal(93186,2);
	eq.signal(93124,2); -- NPC: Dragoon_Barber_W`Selo
	eq.signal(93024,2); -- NPC: Dragoon_TVem
	eq.signal(93084,2); -- NPC: Dragoon_T`Vex
	eq.signal(93125,2); -- NPC: Dragoon_V`Lask
	eq.signal(93086,2); -- NPC: Dragoon_V`Resh
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
