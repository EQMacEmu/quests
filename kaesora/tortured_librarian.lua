function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Bring to me that which was taken.")
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "All must be returned!";		
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18069, item2 = 18068},1,text1)) then
		e.self:Emote("fades out of existence. The air smells of death. Something has appeared in your hand.");
		eq.depop_with_timer();
		e.other:QuestReward(e.self,0,0,0,0,12889);
	end
	item_lib.return_items(e.self, e.other, e.trade) -- return unused items
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
