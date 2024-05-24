function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("has a helm tied to his belt.  He is chewing something.  He spits some shells out and they land on your chest.  'Sorry about that.  Hehe.");
	elseif(e.message:findi("chew")) then
		e.self:Say("Can't you tell?!  It's on your chest.  Heh!  What a dim one!  They're flarefire seeds.  Only good thing about this land.  Trackers find 'em in the Field of Bone near some lizard city.");
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
