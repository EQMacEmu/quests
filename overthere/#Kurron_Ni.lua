-- Part of SK Epic 1.0
function event_spawn(e)
	eq.set_timer("depop", 3600000);
end

function event_timer(e)
	eq.depop();
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
