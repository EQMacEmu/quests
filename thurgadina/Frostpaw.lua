function event_spawn(e)
	eq.set_timer("follow", 150000);
end

function event_timer(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(115101)) then
		eq.follow(eq.get_entity_list():GetMobByNpcTypeID(115101):GetID());
	end
end
