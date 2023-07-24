function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail and well met. " .. e.other:GetCleanName() .. ". If you have come seeking the ways of the blacksmith. then you have certainly come to one of many places that can accommodate you. However. New Tanaan is unique from the cities of the prime in that in no other common ground of trade will you find such a diversity and acceptance of culture. Well then. if you are indeed a blacksmith and are seeking materials. please feel free to peruse my inventory at your leisure. I'm sure that I can provide something of use to you. and if not. my brethren will likely carry that which you seek.'");
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
