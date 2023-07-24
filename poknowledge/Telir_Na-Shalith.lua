function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Whatever your affair or business is -- if it is not with the intent to purchase supplies to poison your blade -- I suggest that you move along for I have neither the time nor the care to hold meaningless dialogue with one who will not bear unto me a profit.");
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
