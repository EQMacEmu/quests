local despawntime;

function event_spawn(e)
	if(e.self:GetSpawnPointID() == 365105 or e.self:GetSpawnPointID() == 365106) then
		despawntime = 0;
		eq.set_timer("depop",8640000);  -- set to despawn in 2 hours and 24 minutes if not killed.
	end
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.stop_timer("depop");
		despawntime = 1;
	end
end

function event_waypoint_arrive(e)
	local ZoneTime = eq.get_zone_time()["zone_hour"];
	if(e.self:GetGrid() == 26 and despawntime == 1) then
		if(e.wp == 0 and ZoneTime > 18 and ZoneTime < 3) then
			despawntime = 0;
			eq.depop_with_timer();
		end
	end
end
