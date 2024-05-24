function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("has a massive scar on his face.  'Hail, and welcome to the outpost of Firiona Vie!  If you plan on exploring, I suggest you get well equipped.  There are no cities beyond here.  I would also suggest joining the next group heading out on an expedition.  This is no place to travel alone.");
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
