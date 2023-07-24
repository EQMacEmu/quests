function event_waypoint_arrive(e)
	if((e.wp > 15 and e.wp < 34) or (e.wp > 50 and e.wp < 70)) then
		e.self:SetRunning(true);
	else
		e.self:SetRunning(false);
	end
end
