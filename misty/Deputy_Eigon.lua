function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() ..". Excuse me. I must get back to my patrol.");
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16165})) then -- can turned in even at dubious
		e.self:Say("Daleen sent you? She is so sweet. If she wasn't married.. ehem.. Thanks.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,263, 5); -- Faction: Guardians of the Vale
		e.other:Faction(e.self,286, 1); -- Faction: Mayor Gubbin
		e.other:Faction(e.self,355, 1); -- Faction: Storm Reapers
		e.other:Faction(e.self,292, 1); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,334, -1); -- Faction: Dreadguard Outer
		e.other:QuestReward(e.self,math.random(20),0,0,0,0,500);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
