function event_say(e)--need correct text for all parts
	if(e.message:findi("hail")) then
		e.self:Say("I do not have time to talk to you, I am looking for something that I [lost]");
	elseif(e.message:findi("lost")) then
		e.self:Say("Yes, lost.  I am missing my robes if you could bring them to me I would reward you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1360})) then
		e.self:Say("You found it, I am so pleased! Here is your reward");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8960, 8961),5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
