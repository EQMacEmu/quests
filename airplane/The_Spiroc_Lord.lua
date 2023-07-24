function event_death_complete(e)
	local qglobals = eq.get_qglobals();
	
	if(qglobals["sirran"] ~= "5" and (eq.get_entity_list():IsMobSpawnedByNpcTypeID(71009) == false or eq.get_entity_list():IsMobSpawnedByNpcTypeID(71020) == false or eq.get_entity_list():IsMobSpawnedByNpcTypeID(71022) == false)) then
		eq.set_global("sirran","5",3,"M20");
		eq.spawn2(71058,0,0,955,-570,466,195); -- NPC: Sirran_the_Lunatic
	end
	
	eq.signal(71013, 1); -- The_Spiroc_Guardian
end
