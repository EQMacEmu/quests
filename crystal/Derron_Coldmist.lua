function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there.  I have always wondered, whatever became of the Dain's group that left here so long ago?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end