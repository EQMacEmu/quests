function event_spawn(e)
	ran = math.random(75000);
	eq.set_timer("1",ran);
end
function event_timer(e)
	local rand = math.random(2);
	if(rand == 1) then
		e.self:Say("Wow...It looks like I pinned that one to the ground pretty good!");
	end
	if(rand == 2) then
		e.self:Say("Nice, another grimling kill for my daily report");
	end
	ran = math.random(75000);
	eq.set_timer("1",ran);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
