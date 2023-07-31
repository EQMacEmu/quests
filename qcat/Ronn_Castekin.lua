function event_waypoint_arrive(e)
	if((e.wp > 19 and e.wp < 40) or (e.wp > 100 and e.wp < 120)) then
		e.self:SetRunning(true);
	else
		e.self:SetRunning(false);
	end
end
