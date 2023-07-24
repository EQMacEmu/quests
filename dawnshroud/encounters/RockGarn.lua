function RockGarnSpawn(e)
	eq.set_timer("SetGarn",5000);
end

function RockGarnTimer(e)
	if(e.timer == "SetGarn") then
		eq.stop_timer("SetGarn");
		eq.spawn_condition("dawnshroud",2,0);
		eq.spawn_condition("dawnshroud",2,1);
		eq.spawn_condition("dawnshroud",1,0);
	elseif(e.timer == "Sambata") then
		eq.stop_timer("Sambata");
		eq.spawn_condition("dawnshroud",1,1);
	elseif(e.timer == "Rock") then
		eq.stop_timer("Rock");
		eq.spawn_condition("dawnshroud",2,1);
	end
end

function RockGarnSignal(e)
	if(e.signal == 1) then
		eq.set_timer("Sambata",300000); -- 5 minutes to change cycle to Sambata
		eq.spawn_condition("dawnshroud",2,0);
	elseif(e.signal == 2) then
		eq.set_timer("Rock",300000); -- 5 minutes to change cycle to Rockhoppers
		eq.spawn_condition("dawnshroud",1,0);
	end
end

function RockDeath(e)
	eq.signal(174266,1);
end

function SambataDeath(e)
	eq.signal(174266,2);
end

function event_encounter_load(e)
	eq.register_npc_event("RockGarn", Event.spawn, 174266, RockGarnSpawn);
	eq.register_npc_event("RockGarn", Event.timer, 174266, RockGarnTimer);
	eq.register_npc_event("RockGarn", Event.signal, 174266, RockGarnSignal);
	eq.register_npc_event("RockGarn", Event.death, 174027, RockDeath);
	eq.register_npc_event("RockGarn", Event.death, 174032, SambataDeath);
end
