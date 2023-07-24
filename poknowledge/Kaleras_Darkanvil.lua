function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day t'ye. traveler. If ye be in need of smithin' supplies. then ye've certainly come t'the right place. friend! The Darkanvils have many supplies needed for crafting some of the finest weapons and armor the universe has ever seen. and they are offered t'ye. . . At a fair price. a'course.");
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
