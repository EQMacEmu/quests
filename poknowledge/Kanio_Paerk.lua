function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well met. my friend. I am Kanio Paerk. a former warrior and tradesmen of the people of Kelethin. I and my lovely wife. Halena. have come to New Tanaan in hopes of furthering our knowledge. However. we have found the recent influx of Norrathian travelers to be quite intriguing and we wish to offer our aid where we can. As a blacksmith. I have been able to forge many components that will aid other adepts as myself in their own further quest for knowledge. Search my inventory. if you wish. and I will be more than pleased to accommodate you where I can.");
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
