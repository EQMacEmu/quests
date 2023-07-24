function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Through this very hallway lies the city of Shadowhaven. On your way there, you will notice a small room that contains a miniature version of the spires. If you have no means of personal transportation back to Norrath, these teleports will take you there. Be sure to speak to the attendant at the teleport for more information.");
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
