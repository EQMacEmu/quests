function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings!  Are you a mercenary?  If so, I urge you to go and speak with one of the officers of this outpost.  We can always use help in suppressing the goblins and clearing out a killing zone.");
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
