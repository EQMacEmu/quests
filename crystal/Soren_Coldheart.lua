function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("grumbles, 'I should've left with the others rather than stay imprisoned in these caves for the rest of my life!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end