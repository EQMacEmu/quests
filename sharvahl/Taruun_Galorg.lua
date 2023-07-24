function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("A pleasure to meet you. You are entering Rebirth Square. It is here that the construction of Shar Vahl had begun after The Shifting. You can find Registrar Bindarah within the square.");
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
