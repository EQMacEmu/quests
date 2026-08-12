function event_death_complete(e)
	if( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(71111) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(71031)) then
		eq.unique_spawn(71059,0,0,-386,-236,-317,201.5); -- NPC: Protector_of_Sky
	end
end
