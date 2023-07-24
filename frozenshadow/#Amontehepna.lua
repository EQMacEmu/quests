function event_death_complete(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(111163) == false) then
		eq.unique_spawn(111163,0,0,199,987,187,128); -- NPC: #Cara_Omica
	end	
end