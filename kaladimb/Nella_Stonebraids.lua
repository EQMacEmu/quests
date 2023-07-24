function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glances your direction, then returns to what she was doing.");
	elseif(e.message:findi("jark") or e.message:findi("dinner")) then
		e.self:Say("Ach! I forgot me husband's dinner. I'm so sorry. I was sendin' my wishes ta Brell for health and long life. I was just floatin' coins into the wishin' pool. Usually it's for children but things haven't been so good lately. Here, please take this to him and tell him where I was.");
		e.other:SummonCursorItem(29007); -- Item: cold plate of beef and bread
		eq.depop();
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
