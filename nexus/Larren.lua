function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Oh, welcome, " .. e.other:GetCleanName() .. "!  Beyond me is perhaps the best place in all of Lu... well, Norrath now too.  You really need to check it out for yourself. It is the perfect place for a trader like yourself to find the best deal on any item around!");
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
