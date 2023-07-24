function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("grins a wide toothy smile and says. 'You may want to watch yourself. unless you are looking to enter a painful situation.  The portals in this district will lead someone of your race to a city of the wrong alignment.  If you use the portals and end up in the wrong place. you'll be crushed for certain.'");
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
