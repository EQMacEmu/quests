function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Oh. hello there. " .. e.other:GetCleanName() .. "! If you are searching for pottery materials. well then my friend. you have certainly come to the right place. Come and search my wares. if you wish it. I guarantee that my prices are most fair.'");
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
