function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail!!  This is the tunnel to the borderland. We prefer that only the soldiers use it but, if you must, do so at your own risk.'");
		e.self:DoAnim(67);
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
