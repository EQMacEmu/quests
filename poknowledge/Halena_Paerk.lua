function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings to you. traveler. The recent past has brought quite a bit of excitement that New Tanaan is not quite accustomed to -- though it is welcome nonetheless. Many residents of the city are former adventurers like yourself. Others were great adepts and craftsmen. Being a former tradeswoman and adventurer. I have come to New Tanaan in hopes of bettering my own knowledge in the ways of my trade. However. in recent light of your presence. many of us have chosen to aid you where we can. If you are a blacksmith. or aspire to be. then I may have some supplies worthy of your talent.");
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
