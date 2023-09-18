function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The Ry`Gorr are filthy disgusting beasts and they are as ferocious as their stench is rancid.  It's a good thing we can smell them coming to avoid them.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end