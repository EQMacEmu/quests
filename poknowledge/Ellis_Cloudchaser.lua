function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well. good day to you my friend. and welcome! We of New Tanaan are quite excited with the recent influx of foreigners into our fair hamlet in the cosmos -- but I ramble without speech of business. If you are a fletcher in trade. then you have certainly come to the right place. for you will not find prices more fair or supplies more generous in any region upon Norrath as you will here. in New Tanaan.");
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
