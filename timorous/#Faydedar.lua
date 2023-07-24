function event_spawn(e)
	eq.depop(96089);
	e.self:MoveTo(-1855,-11821,-0.13,-1,true);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
