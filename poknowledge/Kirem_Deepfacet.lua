function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day. traveler. I am Kirem Deepfacet and as a merchant of precious metals and stones. I serve this city. which has been most gracious in providing a home away from the turmoil of Norrath. If you seek supplies to craft jewelry of all sorts. then do not hesitate to search my inventory.");
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
