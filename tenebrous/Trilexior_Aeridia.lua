function event_death_complete(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(172013) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172014) == false) then
		if(math.random(100) < 5) then
			eq.unique_spawn(172013,0,0,-1391,632,317,128); -- spawn Heratius Grolden
		end
	end
end
