function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings traveler. If you have come to New Tanaan seeking knowledge then perhaps these books I have uncovered in great library will interest you. You may borrow them and the magic of New Tanaan will return them to their place in the library when you are through.");
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
