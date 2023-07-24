function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Down this passage you will find the entrance to the Bazaar, a great place to find that trinket you have been looking for. Don't forget to head to Shadowhaven after you stop here.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
