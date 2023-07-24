function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings friend. If you're in the business for some herbs or shamanistic supplies you've come to the right place. Please take a look around for yourself or if you're looking for something feel free to ask and we may have you need somewhere behind the counter.");
	end
	if(e.message:findi("sealed medicine")) then
		e.self:Say("I may have just the thing you are looking for. I recently purchased quite an old and interesting sealed medicine pouch of superb craftsmanship. I will part with it for one-thousand gold pieces.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 1000})) then
		e.self:Say("Here it is. I am sure you will be quite happy with your purchase, it is quite an interesting old bag it is.");
		e.other:QuestReward(e.self,0,0,0,0,10681); -- Old Sealed Medicine Pouch
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
