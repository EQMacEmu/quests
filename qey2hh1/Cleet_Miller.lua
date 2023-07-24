function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:SetRunning(false);
	elseif(e.wp == 6) then
		e.self:Emote("gathers up a bale of straw");
		eq.create_ground_object(13990,-4632,-3583,23,0,600000);
		e.self:SetRunning(true);
	end
end
		