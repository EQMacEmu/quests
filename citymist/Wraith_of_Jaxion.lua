-- Test of Charm - enchanter epic - Enchanted Ruby
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10633})) then
		e.self:Say("Hisss...my spirit is forever trapped here. Leave before your fate is as mine.");
		e.other:QuestReward(e.self,0,0,0,0,10620);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
