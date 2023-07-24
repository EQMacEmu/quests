function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("smiles and taps her foot.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20534})) then
		e.self:Emote("hands you a small ring.");
		e.other:QuestReward(e.self,0,0,0,0,20379,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Zone:lakerathe  ID:51052 -- Misty Tekcihta
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
