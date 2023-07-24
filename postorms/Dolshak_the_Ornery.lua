function event_spawn(e)
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(210251) ) then -- Neffiken,_Lord_of_Kelek`Vor
 		eq.depop_with_timer();
	end	
end

function event_spawn(e)
	eq.set_timer("depop1", 900000);
	eq.set_timer("depop2", 4200000);
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop1");
	else
		eq.resume_timer("depop1");
	end
end

function event_timer(e)
	eq.depop_with_timer();
end
