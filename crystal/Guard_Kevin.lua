function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Another visitor graces our halls.  Either you must be very powerful or very stealthy to have made it past the Ry`Gorr.  I will be keeping an eye on you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end