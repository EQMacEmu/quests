function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! Keep an eye out for invaders. We may patrol the outpost, but every now and then a goblin or two manages to sneak in.");
		e.self:DoAnim(67);
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
