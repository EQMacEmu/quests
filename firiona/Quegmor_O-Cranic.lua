function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings traveler! There are many strange beasts that inhabit these lands with behavioral patterns different than those of the antonican beasts I have trained with. I hope to one day have mastered these foreign beasts so that my wisdom and spirit may be expanded.");
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
