function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the center of Luclin, " .. e.other:GetCleanName() .. ". This is a very magical place. The magic that emanates from here can be felt even on the surface. Don't forget to speak to as many of us as you can before you venture far.");
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
