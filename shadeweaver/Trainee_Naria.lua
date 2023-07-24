function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Have you noticed the vicious Saurek [Shredders] out in the thicket? I wouldn't want to hunt one of those nasty things.");
	elseif(e.message:findi("shredder")) then
		e.self:Say("The shredder has been known tear young hunters apart in mere seconds. I would stay far away from those things if I were you. Tarief has offered a reward for any that bring him four of their scales, but I just don't think it would be worth facing such a beast in battle. The meat from the smaller ones are just as good to eat if you want my opinion.");
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
