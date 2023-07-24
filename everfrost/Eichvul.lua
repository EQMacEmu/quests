function event_combat(e)
	if(e.joined) then
		eq.unique_spawn(30004,0,0,-6302,2842,-53,92);
	end
end

function event_trade(e)
	local item_lib = require("items");

	item_lib.return_items(e.self, e.other, e.trade);
end
