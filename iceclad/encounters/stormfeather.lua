function StormfeatherSpawn(e)
	eq.set_timer("chance",1000);
end

function Stormfeathertimer(e)
	if(e.timer == "chance") then
		eq.stop_timer("chance");
		if(math.random(100) < 50) then
			eq.unique_spawn(110005,48,0,850,6042,194,193); -- NPC: Stormfeather
		else
			eq.depop_with_timer();
		end
	end
end

function StormfeatherDeath(e)
	eq.depop_with_timer(110214);
end

function event_encounter_load(e)
	eq.register_npc_event("stormfeather", Event.spawn, 110214, StormfeatherSpawn);
	eq.register_npc_event("stormfeather", Event.timer, 110214, Stormfeathertimer);
	eq.register_npc_event("stormfeather", Event.death_complete, 110005, StormfeatherDeath);
end
