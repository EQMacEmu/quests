function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The life of a miner can be tedious but we will persevere.  It's what the Dain would have wanted.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end