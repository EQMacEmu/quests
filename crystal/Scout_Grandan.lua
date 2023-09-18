function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, adventurer.  Congratulations on finding Froststone, last keep of the Coldain.  It must have been a hard fight down those tunnels, eh?  There are monsters crawling everywhere!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end