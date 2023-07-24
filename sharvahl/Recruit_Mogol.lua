function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Aye. Sir!");
		e.self:DoAnim(48); --nod
		eq.signal(155126,1,15); -- NPC: Instructor_Anom
	end
	if(e.signal == 2) then
		e.self:DoAnim(7); --bash
		eq.signal(155126,2,15); -- NPC: Instructor_Anom
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
