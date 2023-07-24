function event_death_complete(e)
	eq.signal(71014, 1); -- a_spiroc_walker
	eq.signal(71007, 1); -- a_spiroc_banisher
	eq.signal(71010, 1); -- a_spiroc_revolter
end

function event_spawn(e)
	eq.set_timer("lord", 1000);
end

function event_signal(e)
	if ( e.signal == 1 ) then
		eq.set_timer("lord", 1000);
	end
end

function event_timer(e)
	if ( e.self:IsEngaged() or e.self:Charmed() or e.self:GetX() ~= e.self:GetSpawnPointX() or e.self:GetY() ~= e.self:GetSpawnPointY() ) then
		return;
	end
	
	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(71012) ) then -- The_Spiroc_Lord
		eq.update_spawn_timer(364318, 1000);
	end
	eq.stop_timer(e.timer);
end
