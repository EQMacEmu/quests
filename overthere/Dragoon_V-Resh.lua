function event_signal(e)
	if(e.signal==1) then
		eq.stop();
		e.self:MoveTo(2063,2798,-49,132,true);
	elseif(e.signal==2) then
		e.self:MoveTo(2734,2464,-49,195,true);
	elseif(e.signal==3) then
		e.self:SetRunning(true);
		eq.start(12);
	end
end

function event_waypoint_arrive(e)
	if(e.wp==28) then
		e.self:SetRunning(false);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
