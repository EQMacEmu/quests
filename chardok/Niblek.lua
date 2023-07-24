-- Part of quest for Veeshan's Peak key
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I Niblek. You want something from Niblek?  Niblek find treasures in walls. Niblek like to trade treasures.");
	elseif(e.message:findi("treasure")) then
		e.self:Say("Niblek find piece of old jewelry! It very old, probably has much power!");
	elseif(e.message:findi("jewelry")) then
		e.self:Say("Niblek likes shiny tings very much! You bring Niblek two shiny tings! Niblek has seen black sapphire and ruby! Niblek likes them very much!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10036, item2 = 10035})) then
		e.self:Say("I much happy now!! I want shiny tings for long time! I give you ugly broken necklace now!");
		e.other:QuestReward(e.self,0,0,0,0,19964,1000);
	end
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
