function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("My father once dove to the depths of the lake.  He said there were many dangers. but reported seeing structures still standing and glints of treasure in the muck below.");
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
