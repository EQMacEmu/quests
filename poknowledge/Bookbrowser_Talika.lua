function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Why hello there wanderer. This library here in New Tanaan is a wonderous sight is it not? There are all manner of books here to occupy the curious of heart. If you are seeking stories of the Halflings. like myself. I have found some books you may be interested in. You can borrow them if you like and the magic of the library will return them when you are finished with them.");
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
