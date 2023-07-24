function event_waypoint_arrive(e)
	if(e.wp == 128) then
		e.self:SetRunning(true);
	elseif(e.wp == 160) then
		e.self:SetRunning(false);
	end
end