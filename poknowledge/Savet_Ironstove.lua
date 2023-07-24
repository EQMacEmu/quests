function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. " .. e.other:GetCleanName() .. ". and welcome to New Tanaan. This city holds a great variety of supplies for all tradesmen -- you shall not find such a welcoming host of merchants gathered in one city upon Norrath. I guarantee! Come. if you be a baker. and search my inventory. Perhaps you shall find something of interest or necessity to your search.");
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
