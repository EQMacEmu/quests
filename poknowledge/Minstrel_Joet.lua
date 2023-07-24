function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. good traveler! Here. in the aptly named Plane of Knowledge. you will find a seemingly endless library of history. lore. and arcane and spiritual knowledge.  In the recent times with the unexpected. though welcome arrival of other Norrathian travelers. the citizens of New Tanaan have come together in hopes of sharing our experiences in the mind to aid all that are willing. In a former life. I was a traveling minstrel in the court of the Combine Empire and what experience I gained from that life. I am willing to share with others like myself. If you are interested in song. then perhaps you would find my inventory of interest. Search as you will. my friend. and know that all prices are for the betterment of the city as a whole and not for personal gain.");
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
