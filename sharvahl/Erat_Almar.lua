function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Eh, what do you mean by peculiar?");
	end
	if(e.signal == 2) then
		e.self:Say("Whoa! What did you do?");
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
