function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well met " .. e.other:GetCleanName() .. ". Pay close attention to Captain Tarief's words of advice. It takes a skillful hunter to kill a Saurek [Darkclaw]. His advice could mean the difference between life and death.");
	elseif(e.message:findi("darkclaw")) then
		e.self:Say("The darkclaws are nasty beasts. Their claws are much thicker than the smaller saureks. Tarief has offered a reward to any that return with four of their scales to him. Don't get any ideas now. That reward is mine. I assure you.");
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
