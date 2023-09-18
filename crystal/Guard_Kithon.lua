function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("All clear! Oh! Sorry. Been working too hard lately. These tunnels are starting to get to me. If you plan on goin past the broken bridge, bring an extra light source.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end