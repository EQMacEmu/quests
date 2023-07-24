function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome friend. are you looking for a new song? My colleagues and I have gathered many well-known melodies over the course of our journeys. I have a few of the popular tunes available for sale. Have a look. I am sure you will find many recognizable songs performed by musicians all across the lands.");
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
