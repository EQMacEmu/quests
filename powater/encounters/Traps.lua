local TYPES = { 216255, 216252, 216250, 216249, 216264, 216254, 216253, 216251 };

function MobSpawn(e)
	eq.set_timer("depop", 1200000);
end

function MobCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function MobTimer(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function event_encounter_load(e)
	for _, id in pairs(TYPES) do
		eq.register_npc_event("Traps", Event.spawn, id, MobSpawn);
		eq.register_npc_event("Traps", Event.combat, id, MobCombat);
		eq.register_npc_event("Traps", Event.timer, id, MobTimer);
	end
end
