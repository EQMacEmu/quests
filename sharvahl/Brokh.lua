function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hey there. If you need any ammo. just dig through my bags and see if there is anything there to suit your needs. My prices are fair and the quality is good.");
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
