function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Beware the Shak Dratha assassins. They lurk just beyond the sight of our guards. They may not be as strong as some of the rest of them, but they are deadly when they gang up on you. It is believed that they are soul hunters. Let us hope that we can remove them all from these thickets.");
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
