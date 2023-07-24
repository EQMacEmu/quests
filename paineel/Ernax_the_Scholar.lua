function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. Please leave me be. I am studying several interesting essays on mana storage devices.");
	elseif(e.message:findi("matter of.* soul")) then
		e.self:Say("Hmmm. That's a phrase I have not heard for some time, and one I thought I would not hear again, any time soon. So another fool seeks Azrax's legacy, eh? Well, so be it. Take this and follow its instructions. When you are finished reading and scribing, give it back to me.");
		e.other:SummonCursorItem(18956); --Tattered Book
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18956})) then --Tattered Book
		e.self:Say("For your sake, I wish you a quick and painless death. For mine, I wish you a slow and painful one, as a warning to any fool who wishes to follow in your path.");
		e.other:QuestReward(e.self,0,0,0,0,17803); --Soul Trap
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:paineel  ID:75029 -- Ernax_the_Scholar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------