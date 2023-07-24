function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Beware of the sea wall at night.  We are quite undermanned and cannot patrol every place at once.  Oftentimes, a few pirates or goblins manage to scale the wall and attempt to lessen our might.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end