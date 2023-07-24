function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Why. hello there. " .. e.other:GetCleanName() .. ". and welcome to New Tanaan. In the past. we were rarely graced with the visits of Norrath's brave adventurers. but now it seems that your presence is delivered in a most gracious and unpredicted volume. Oh but I do not complain. my friend! I am merely excited and bound in wonder at the true. underlying tale of it all -- why. something most extraordinary must be on the heels of history's most recent climax for such interest to be garnered by Norrath's worldly scholars and travelers. We of New Tanaan understand these things most well. indeed. and our guidance is extended to all should they need it. I personally am one whose affinity is that of enchantments. and any who share my niche are more than welcome to browse what spells I carry and purchase them at their will and desire.");
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
