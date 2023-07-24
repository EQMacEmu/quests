function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("If you find yourself deep in the swamp and starving. try foraging.  I am sure you'll find something to eat.  If not. there are always froglok tongues.");
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
