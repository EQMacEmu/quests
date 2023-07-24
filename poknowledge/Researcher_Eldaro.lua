function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Salutations stranger. I wish to continue to my study of the multitude of tomes stored here in the Great Library of New Tanaan. If you are interested in tomes relative to the history of the Erudite people then I shall permit you to borrow these tomes I have located. The tomes will be returned when you are done with them by the magics of New Tanaan. If you are not interested in these tomes then I shall end our conversation now and return to my studies.");
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
