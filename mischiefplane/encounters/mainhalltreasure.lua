function TreasureCombat(e)
	if(e.joined) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126268)) then
			eq.get_entity_list():GetMobByNpcTypeID(126268):Say("Oh my! You've done gone made them angry. I'm outta here.");
			eq.depop_with_timer(126268);
		end
		spawnhaflings(e);
	end
end

function spawnhaflings(e)
	eq.unique_spawn(126007,0,0,-301,152,118,194); -- NPC: #Dupple
	eq.unique_spawn(126012,0,0,-441,186,118,128); -- NPC: #Snitch
	eq.unique_spawn(126006,0,0,-480,147,118,62); -- NPC: #Blich
	eq.unique_spawn(126013,0,0,-479,44,118,62); -- NPC: #Stitch
	eq.unique_spawn(126008,0,0,-437,9,118,0); -- NPC: #Kitch
	eq.unique_spawn(126011,0,0,-340,6,118,0); -- NPC: #Plupple
	eq.unique_spawn(126009,0,0,-300,48,118,194); -- NPC: #Krupple
	eq.unique_spawn(126010,0,0,-341,186,118,128); -- NPC: #Nupple
end

function Half1Spawn(e)
	eq.set_timer("depop",300000);
end

function Half2Spawn(e)
	eq.set_timer("depop",300000);
end

function Half3Spawn(e)
	eq.set_timer("depop",300000);
end

function Half4Spawn(e)
	eq.set_timer("depop",300000);
end

function Half5Spawn(e)
	eq.set_timer("depop",300000);
end

function Half6Spawn(e)
	eq.set_timer("depop",300000);
end

function Half7Spawn(e)
	eq.set_timer("depop",300000);
end

function Half8Spawn(e)
	eq.set_timer("depop",300000);
end

function Half1Timer(e)
	eq.depop();
end

function Half2Timer(e)
	eq.depop();
end

function Half3Timer(e)
	eq.depop();
end

function Half4Timer(e)
	eq.depop();
end

function Half5Timer(e)
	eq.depop();
end

function Half6Timer(e)
	eq.depop();
end

function Half7Timer(e)
	eq.depop();
end

function Half8Timer(e)
	eq.depop();
end

function Half1Combat(e)
	combat(e);
end

function Half2Combat(e)
	combat(e);
end

function Half3Combat(e)
	combat(e);
end

function Half4Combat(e)
	combat(e);
end

function Half5Combat(e)
	combat(e);
end

function Half6Combat(e)
	combat(e);
end

function Half7Combat(e)
	combat(e);
end

function Half8Combat(e)
	combat(e);
end

function combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("mainhalltreasure", Event.combat, 126004, TreasureCombat);
	eq.register_npc_event("mainhalltreasure", Event.spawn, 126006, Half1Spawn);
	eq.register_npc_event("mainhalltreasure", Event.spawn, 126007, Half2Spawn);
	eq.register_npc_event("mainhalltreasure", Event.spawn, 126008, Half3Spawn);
	eq.register_npc_event("mainhalltreasure", Event.spawn, 126009, Half4Spawn);
	eq.register_npc_event("mainhalltreasure", Event.spawn, 126010, Half5Spawn);
	eq.register_npc_event("mainhalltreasure", Event.spawn, 126011, Half6Spawn);
	eq.register_npc_event("mainhalltreasure", Event.spawn, 126012, Half7Spawn);
	eq.register_npc_event("mainhalltreasure", Event.spawn, 126013, Half8Spawn);
	eq.register_npc_event("mainhalltreasure", Event.timer, 126006, Half1Timer);
	eq.register_npc_event("mainhalltreasure", Event.timer, 126007, Half2Timer);
	eq.register_npc_event("mainhalltreasure", Event.timer, 126008, Half3Timer);
	eq.register_npc_event("mainhalltreasure", Event.timer, 126009, Half4Timer);
	eq.register_npc_event("mainhalltreasure", Event.timer, 126010, Half5Timer);
	eq.register_npc_event("mainhalltreasure", Event.timer, 126011, Half6Timer);
	eq.register_npc_event("mainhalltreasure", Event.timer, 126012, Half7Timer);
	eq.register_npc_event("mainhalltreasure", Event.timer, 126013, Half8Timer);
	eq.register_npc_event("mainhalltreasure", Event.combat, 126006, Half1Combat);
	eq.register_npc_event("mainhalltreasure", Event.combat, 126007, Half2Combat);
	eq.register_npc_event("mainhalltreasure", Event.combat, 126008, Half3Combat);
	eq.register_npc_event("mainhalltreasure", Event.combat, 126009, Half4Combat);
	eq.register_npc_event("mainhalltreasure", Event.combat, 126010, Half5Combat);
	eq.register_npc_event("mainhalltreasure", Event.combat, 126011, Half6Combat);
	eq.register_npc_event("mainhalltreasure", Event.combat, 126012, Half7Combat);
	eq.register_npc_event("mainhalltreasure", Event.combat, 126013, Half8Combat);
end
