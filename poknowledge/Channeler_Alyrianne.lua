function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("May knowledge guide you. and may you step upon this path without judgment or bias. The citizens of New Tanaan have made this pledge to you. friend. and the scholars have vowed their existence to it. As wizards of the prime in our time there. the channelers have come together and composed the spells familiar to this class upon Norrath and though here they are no different. their presence and availability to you may prove a blessing and a convenience. Do not hesitate to search through our tomes and scrolls if you are in need of this knowledge as you progress in power.");
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
