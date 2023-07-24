function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Aaah. . . good day to you. my friend. and welcome! It has been a most exciting time these past few weeks with the influx of young and seasoned adventurers alike. It has been quite difficult to keep up on our stock. but do not be discouraged. for Tranus Ironstove's supplies are always well-kept! If you are in need of baking supplies. then search my wares and perhaps I might hold that which you seek.");
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
