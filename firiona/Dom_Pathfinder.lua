function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Whoa!!  Hold up there. adventurer!  Gaze upon the fine packs and containers I have available.  Such fine items could only be crafted by a Fier'Dal tailor.  And lucky you!!  You made it here just as I lowered my prices.  How can you resist these bargains?  I am taking a loss here!!  Last day!!  Buy now!!");
		e.self:DoAnim(49);
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
