function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("eye's you, obviously distrustful of your intrusion.  He soon loses interest in your and goes back to looking at the much more interesting crack patterns on the walls.");
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
