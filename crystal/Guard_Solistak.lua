function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Halt! Halt! If you be thinking about going past this here post, you had best be mindful of the horrors roaming these passageways!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end