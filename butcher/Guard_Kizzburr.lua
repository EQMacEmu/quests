function event_waypoint_arrive(e)
	if (e.wp == 2) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(68011) == false) then
			e.self:Say("WARNING TO ALL TRAVELERS! Bandits have been sighted on the road ahead. Beware!");
			eq.unique_spawn(68011,13,0,-510,1094,8,0);
		end
		eq.set_timer("warning", 36000);
	end
end

function event_waypoint_depart(e)
	if (e.wp == 2) then
		eq.stop_timer("warning");
	end
end

function event_timer(e)
	if(e.timer == "warning") then
		e.self:Say("WARNING TO ALL TRAVELERS! Bandits have been sighted on the road ahead. Beware!");
	end
end
