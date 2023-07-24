function event_waypoint_arrive(e)
	if(e.wp == 6) then
		e.self:Say("Greetings honorable Sadhi. I ask for spiritual guidance to serve our king.");
	end
	if(e.wp == 17) then
		e.self:Say("reporting for duty m'lord. I will defend Shar Vahl with your blessing.");
		e.self:SetAppearance(4);
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
