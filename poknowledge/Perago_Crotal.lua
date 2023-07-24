function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well. greetings to you good traveler! Perago Crotal is at your service and I guarantee that if its fresh vegetables that you're searching for. you shan't find a rival to my products. Aaah. but I speak too much -- come and see for yourself. my friend.");
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
