function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail and well met. my friend! If you have come searching for supplies needed to fish out of the fair waters of Norrath. than you have come to the right place. Please. search my inventory as you wish -- I'm certain that what you seek is right here. If for some reason I do not carry the rare item you desire at this moment. then seek out Ramos Jerwan. for he likely shall.");
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
