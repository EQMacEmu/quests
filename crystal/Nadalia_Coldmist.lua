function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Froststone.  We are the last remaining Coldain on this continent.  If you wish to stay, be mindful of the crystal widows.  You won't see them until it's too late.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end