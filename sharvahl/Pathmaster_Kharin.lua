function event_signal(e)
	e.self:Say("Gentlemen, not to interject... I understand your frustration. We have been at this for all of our lives. Why are we suddenly expected to over take an enemy that has existed as long as we can remember? Do you have new information about the nature of those caverns? Did you learn something from the spirits?");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
