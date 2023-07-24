function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail and well met. friend. and welcome to New Tanaan. If your stay with us is brief and you seek only supplies. then know only security for this city holds an endless bounty of that which you seek. Within my particular shop. you will find materials used for fletching. If that which I carry is what you are in search of. then please. search and purchase at your leisure.");
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
