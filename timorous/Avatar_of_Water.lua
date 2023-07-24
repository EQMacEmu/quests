-- EPIC CLERIC (Timorous deep)
function event_spawn(e)
	eq.set_timer("depop", 3600000);
end

function event_trade(e)
	local item_lib = require("items");
		
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28023})) then --Orb of the triumvirate
		e.self:Emote("takes the orb from you. The avatar has determined that you are worthy!");
		e.other:QuestReward(e.self,0,0,0,0,5532,200000); -- Water Sprinkler of Nem Ankh
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade) -- return unused items
end

function event_timer(e)
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
