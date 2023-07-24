function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail visitor of New Tanaan! If you are an aspiring brewer then perhaps you may be interested in the supplies I have for sale. I assure you my wares are of the highest quality.");
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
