function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:Race() .. ".  Beware the horrors that lurk within these caves!  They are quite deadly!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end