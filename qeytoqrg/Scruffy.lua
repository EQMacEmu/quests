function event_spawn(e)
	e.self:SetRunning(true);
end

function event_waypoint_arrive(e)
	local zoneTime = eq.get_zone_time()["zone_hour"];
	if(e.self:GetGrid() == 13 and e.wp > 0 and e.wp < 3) then
		e.self:SetRunning(false);
	elseif(e.self:GetGrid() == 13 and e.wp == 3) then
		e.self:SetRunning(true);
		if(zoneTime > 18 or math.random(100) < 20) then
			eq.depop_with_timer();
		end
	end
end
