function event_waypoint_arrive(e)
	if(e.wp == 14) then
		eq.set_anim(75039,1);
	elseif(e.wp == 28) then
		e.self:DoAnim(36);
	elseif(e.wp == 52) then
		eq.set_anim(75039,1);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------