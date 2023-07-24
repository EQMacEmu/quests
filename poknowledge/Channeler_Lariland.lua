function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings to you. traveler. The channelers or New Tanaan are eager to have your kind among us. for it has been far too long since we have been graced with the opportunity to guide. All scholars of New Tanaan have offered up their wisdom of their individual past experiences as a mortal profession upon the prime in order to aid you in the most effective manner for your current position within the universe. As all channelers here were wizards in our prime upon the material world. we have combined our tomes and memories into tangible form so that the wizards of the prime may make use of them once again.");
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
