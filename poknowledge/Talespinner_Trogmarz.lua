function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Har! Yooz wan be smart like Trogmarz. den yooz read books like Trogmarz! Meez gotz sum books bout ancient trolls yooz can borrow if yooz wantz. Da mojo of da library will bring zem back when yooz are done wit dem.");
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
