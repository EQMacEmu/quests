function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Get your wretched hide away from me! Who knows what vile stench you have been rolling around in?! Do not speak with me unless you have some glimmer of intelligence!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18842})) then -- Sealed Letter (Letter To Krynn)
		e.self:Say("Another young warrior. I pray you shall not meet the fate of the last twelve. Here then. Take this report to Mistress Seloxia at once. And stay clear of the Froglok lair called Gukk.");
		e.other:QuestReward(e.self,0,0,0,0,18843,250); -- Sealed Letter (Letter To Seloxia)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:oggok  ID:49092 -- Ambassador_K`Ryn
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
