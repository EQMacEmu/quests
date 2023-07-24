function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("begins to stroke the nearby brew barrel.  'What will it be?   Me and Old Gertie here make the finest brew this side of the Timorous Deep.  Afraid I am the only one who is allowed to touch her - she's very special to me.  If you want to brew yourself, you can start looking for that [jungle city].'");
		e.self:DoAnim(59);
	elseif(e.message:findi("jungle city")) then
		e.self:Say("I've heard adventurers talk of a city deep in the jungles. They say the dead walk its streets. Many have claimed to discover great treasures there as well as to lose many friends. I also heard it may have a working brew barrel.");
		e.self:DoAnim(48);
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
