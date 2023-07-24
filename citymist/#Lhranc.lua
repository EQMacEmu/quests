-- Part of SK Epic 1.0
function event_spawn(e)
	eq.set_timer("Depop", 7200000);
end

function event_death_complete(e)
	eq.spawn2(90016,0,0,28.1,1.4,7,192.5); ----Marl Kastane
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end


function event_timer(e)
	eq.depop();
end
-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
