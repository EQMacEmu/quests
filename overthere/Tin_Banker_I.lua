-- A Metal Key for Necro Skull Cap 5
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Insert Metal Key *whirrrr*.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12849})) then
		e.self:Say("*Whirrrr*");
		e.other:QuestReward(e.self,0,0,0,0,18065);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
