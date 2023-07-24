function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("brandishes his fist at you.  'You'll get this if you even think of attempting to use our forge!!  Find your own!  Go off looking in the dungeons of Kunark.  Maybe you will even find a magical forge.  Bah!!  You adventurers think you can have free run of everything!'");
		e.self:DoAnim(30);
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
