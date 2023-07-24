function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings visitor! I am a maker and seller of fine ceramics and pottery supplies here in the wondrous city of New Tanaan. If you are practicing the art of pottery then perhaps I can interest you in some of my high quality supplies.");
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
