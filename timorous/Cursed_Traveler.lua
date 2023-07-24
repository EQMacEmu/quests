-- warning dialogue not to bind near the firepot room in timorous deep
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks at you with eyes that are bleak and dreary as though the essence which keeps it standing is not really there; a surreal look into the future for those who make their stay in the immediate room around you. The ominous figure does not make any sound but nods in your direction as if to tell you that he died here long ago by resting by the nearby fire for too long. In your mind you hear the eerie thoughts of this undead figure, alluding to the fact that it is unwise for you to remain here for too long, lest the mighty water dragon overtake you, as it overtook him.");
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
