local master = 0
local mastertimer = 0

function DoomSpawn(e)
	eq.set_timer("start",1000);
end

function DoomTimer(e)
	if(e.timer == "start") then
		master = 0;
		mastertimer = 0;
		eq.signal(176105, 1);
		eq.stop_timer("start");
	end
end

function MasterSignal(e)
	if(e.signal == 1) then
		eq.zone_emote(0,"an unearthly wail fills the air as the Dark Masters begin chanting for the coming of doom");
		eq.set_timer("hours",10800000);
		eq.set_timer("minutes",1800000);
	elseif(e.signal == 2) then
		eq.stop_timer("minutes");
	elseif(e.signal == 3) then
		eq.set_timer("minutes",1800000);
	elseif(e.signal == 4) then
		eq.set_timer("Timing",1200000);
		mastertimer = 1;
	elseif(e.signal == 5) then
		eq.set_timer("Doomshade",math.random(30000,300000));
		eq.stop_timer("Timing");
	end
end

function MasterTimer(e)
	if(e.timer == "hours") then
		eq.zone_emote(0,"an unearthly wail fills the air as the Dark Masters begin chanting for the coming of doom");
	elseif(e.timer == "minutes") then
		eq.signal(176042,1);
	elseif(e.timer == "Timing") then
		eq.stop_timer("Timing");
		mastertimer = 0;
		master = 0;
	elseif(e.timer == "Doomshade") then
		eq.stop_timer("Doomshade");
		eq.stop_timer("hours");
		eq.stop_timer("minutes");
		eq.zone_emote(0,"a tortured scream echoes throughout the plains as a tormented spirit is released upon the land");
		eq.depop_with_timer(176087);
		mastertimer = 0;
		master = 0;
		eq.unique_spawn(176017,0,0,120,-298,5,0);
	end
end

function DarkMasterSignal(e)
	if(e.signal == 1) then
		e.self:Emote("chants for the coming of doom");
	end
end

function DarkMasterCombat(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(176087)) then
		if(e.joined) then
			eq.signal(176105, 2);
		else
			eq.signal(176105, 3);
		end
	end
end

function DarkMasterDeath(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(176087)) then
		master = master + 1;
		eq.debug("Number of master count here is ".. master .." and mastertimer is ".. mastertimer .."",1);
		if(master == 1) then
			eq.signal(176105, 4);
		elseif(master == 4 and mastertimer == 1) then
			eq.signal(176105, 5);
		end
	end
end

function DoomShadeSpawn(e)
	eq.set_timer("depop",3600000);
end

function DoomShadeTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function DoomShadeCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("doomshade", Event.spawn, 176087, DoomSpawn);
	eq.register_npc_event("doomshade", Event.timer, 176087, DoomTimer);
	eq.register_npc_event("doomshade", Event.signal, 176105, MasterSignal);
	eq.register_npc_event("doomshade", Event.timer, 176105, MasterTimer);
	eq.register_npc_event("doomshade", Event.signal, 176042, DarkMasterSignal);
	eq.register_npc_event("doomshade", Event.combat, 176042, DarkMasterCombat);
	eq.register_npc_event("doomshade", Event.death, 176042, DarkMasterDeath);
	eq.register_npc_event("doomshade", Event.spawn, 176017, DoomShadeSpawn);
	eq.register_npc_event("doomshade", Event.timer, 176017, DoomShadeTimer);
	eq.register_npc_event("doomshade", Event.combat, 176017, DoomShadeCombat);
end
