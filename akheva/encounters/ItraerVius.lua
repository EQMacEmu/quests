function ItraerViusSpawn(e)
	eq.spawn_condition("akheva",1,1);
end

function ItraerViusDeath(e)
	eq.spawn_condition("akheva",1,0);
end

function event_encounter_load(e)
	eq.register_npc_event("ItraerVius", Event.spawn, 179037, ItraerViusSpawn);
	eq.register_npc_event("ItraerVius", Event.death, 179037, ItraerViusDeath);
end
