local arrive = false;

function event_death_complete(e)
	eq.signal(71022, 1); -- a_spiroc_vanquisher
end

function event_spawn(e)
	eq.set_timer("banisher", 1000);
	arrive = true;
end

function event_signal(e)
	if ( e.signal == 1 ) then
		eq.set_timer("banisher", 1000);
	end
end

function event_timer(e)
	if ( not arrive or e.self:IsEngaged() or e.self:Charmed() ) then
		return;
	end
	
	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(71007) ) then -- a_spiroc_banisher
		eq.update_spawn_timer(364314, 1000);
	end
	eq.stop_timer(e.timer);
end

function event_combat(e)
	if ( e.joined ) then
		arrive = false;
	end
end

function event_waypoint_arrive(e)
	arrive = true;
end
