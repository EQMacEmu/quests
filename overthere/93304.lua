function event_spawn(e)
	eq.signal(93087,1); -- General_V`Deers 
	eq.signal(93024,1); -- Dragoon_T`Vem 
	eq.signal(93084,1); -- Dragoon_T`Vex
	eq.signal(93125,1); -- Dragoon_V`Lask
	eq.signal(93086,1); -- Dragoon_V`Resh
	eq.signal(93124,1); -- Dragoon_Barber_W`Selo
	eq.signal(93186,1); -- #High_Priest_I`Xar
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
