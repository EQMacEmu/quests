function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. traveler. and well met. I am Minstrel Gwiar. and it is a pleasure to make the acquaintence of a fellow Norrathian whose career is in its prime. For many years I have been a resident of New Tanaan. taking awe in this place of unhindered wisdom and knowledge without the turmoil and unncessary. petty bias of the material worlds. Aaah. but I get ahead of myself -- please. forgive me. As a citizen of New Tanaan. I have pledged my knowledge to all visitors of our humble plane. Should you hold an interest in the bardic ways. then my inventory might hold some interest to you.");
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
