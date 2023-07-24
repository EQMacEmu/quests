function event_waypoint_arrive(e)
	if(e.wp == 4) then
		e.self:SetRunning(false);
	elseif(e.wp == 9) then
		eq.stop();
	end
end
