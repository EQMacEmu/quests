function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Blast!!  Hundreds of goblins to slay and [great treasure] to be had and I am stuck at my post!");
	elseif(e.message:findi("great treasure?")) then
		e.self:Say("A fellow paladin who was a member of an expedition into the jungles of Kunark returned with a jade green broadsword.  He said he came across it while they were fighting their way out of some ancient city filled with golems.  They lost many strong troops on that expedition.");
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
