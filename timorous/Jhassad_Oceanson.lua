-- EPIC CLERIC (Timorous deep)
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28048, item2 = 28049, item3 = 28050})) then --Orb of Clear Water, Orb of Frozen Water, Orb of Vapor
		e.self:Emote("kneels in the sand and places the three orbs into a large abalone shell bowl. A blue glow surrounds his hands as he waves them over the orbs resting in the bowl. The orbs crack and fall apart, releasing their contents, then reform into a single glowing orb. Jhassad Oceanson gently removes the Orb of the Triumvirate and places it in your hands.");
		e.self:Say("The Avatar of Water approaches. You must hand him the Orb of the Triumvirate and it will be decided if it is your destiny to wield the Nem Ankh Sprinkler.");
		e.other:QuestReward(e.self,0,0,0,0,28023); -- Orb of the triumvirate
		eq.unique_spawn(96086,21,0,-1886,-11661,1,192); --Avatar of water
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
