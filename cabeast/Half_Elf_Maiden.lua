function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want? You do not look like the type of person the Baron usually sends to me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1096})) then 	--Klok's Seal
		e.self:Say("Oh! thank you! I did not expect to hear of my family ever again. This seal should grant me protection out of the city if I am careful. Please take this note to my father and let him know I am safe!");
		e.other:QuestReward(e.self,0,0,0,0,18863,2000); --Sealed Letter
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
