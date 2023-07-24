function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Another traveler has come to our lands, Rinkes. I wish you the best of luck wherever your travels may take you, " .. e.other:GetCleanName() .. ".");
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
