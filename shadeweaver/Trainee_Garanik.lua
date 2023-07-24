function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Karim is right, we cannot let the Gor Taku fool us. The gor taku workers have been gathering a lot of stones lately. I'll wager they are crafting a large quantity of stone weapons to attack us with. I hear they even have a blacksmith making weapons for the Loda Kai.");
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
