-- Rogue Epic NPC -- --Brigadier_G'tav
function event_say(e)
	e.self:Emote("ignores you.");
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28057})) then
		e.self:Say("The General will take care of you!");
		e.other:QuestReward(e.self,0,0,0,0,0,500);
		eq.unique_spawn(20205,0,0,2297,827,275,128); -- NPC: General_V`ghera
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE  Quest by: Solid11  Zone:kithicor  ID:20061 -- --General_G'tav
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
