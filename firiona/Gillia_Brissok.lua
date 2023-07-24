function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings friend, it is good to be freed from the clutches of those evil creatures. Tell me are you willing to help me bring some [justice] to them?");
	elseif(e.message:findi("justice")) then
		e.self:Say("For justice to be brought to them you will need to strike at some of the most powerful goblins found there. Seek out the goblin cave lords deep within the Temple of Droga and bring me back three Sashes of the Cave Lords. Also I will need the Earring of King Dronan. Do this and you will be well rewarded.");
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 62093, item2 = 62092, item3 = 62092, item4 = 62092})) then
		e.other:QuestReward(e.self,0,0,0,0,62202);
	end
	item_lib.return_items(e.self, e.other, e.trade) -- return unused items
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
