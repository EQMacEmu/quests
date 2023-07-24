--This is just some flavor text for the failed crypt raider, who holds one of the scrolls for the seventh Greenmist quest.
function event_death_complete(e)
	e.self:Say("Never.. to feel the mist.. again..");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
