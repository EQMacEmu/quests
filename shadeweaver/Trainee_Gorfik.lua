function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("The shak dratha invaders have taken large sections of the gor taku caves already. It is only a matter of time before they try to take Shar Vahl. Come join us in our fight.");
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
