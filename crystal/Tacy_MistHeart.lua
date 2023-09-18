function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks at you with teary eyes and says 'If only my love had not left with the others.  We could have had a good family here, I know it.  Please leave me be, his memory is almost too much for me to bear.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end