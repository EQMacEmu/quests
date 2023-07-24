-- Part of SK Epic 1.0
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14377})) then
		eq.spawn2(39165, 0, 0, 464.4, 819, -678, 125); -- NPC: Mummy_of_Glohnor
		e.other:Faction(e.self,404, 7); -- Faction: True Spirit
		eq.depop_with_timer();
	end
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
