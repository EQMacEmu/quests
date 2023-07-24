function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Ah. greetings to you. traveler. Much traffic has passed this quiet. peaceful city's ground in the recent past. It has been a very long time since last we have been graced with the pleasure of a bustling city atmosphere. though we hope that the general peace and courtesy to all beings remains intact. With this new excitement. many of the city's adepts have emerged in hopes to aid the new comers where and when we can. As a blacksmith and former shaman of my tribe. I have offered my knowledge in the ways of smithing to any. My inventory holds many components that smiths will need throughout their career and search for advancement and perfection. and all are for sale at a reasonable price.");
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
