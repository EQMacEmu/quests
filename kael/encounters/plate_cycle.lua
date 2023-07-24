function DoldigunWaypoint(e)
	if(e.wp == 7) then
		eq.depop_with_timer(113486); -- depop sunuva (plate trigger)
	end
end

function Doldigun2Spawn(e)
	e.self:SetRunning(true);
end

function DoldigunSpawn(e)
	eq.set_timer("depop",300000);
end

function GrondonSpawn(e)
	eq.set_timer("depop",300000);
end

function KromzogSpawn(e)
	eq.set_timer("depop",300000);
end

function DoldigunCombat(e)
	if(e.joined) then
		eq.stop_timer("depop");
		eq.unique_spawn(113261,0,0,1170,-825,-116,177); -- NPC: Grondon_Zekkin
		eq.unique_spawn(113262,0,0,1175,-856,-116,204); -- NPC: Kromzog_Zekkin
		eq.depop();
	end
end

function DoldigunTimer(e)
	if(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function GrondonTimer(e)
	if(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function GrondonCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function KromzogTimer(e)
	if(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function KromzogCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function GrondonDeath(e)
	eq.unique_spawn(113263,28,0,1133,-911,-116,0); -- NPC: Vinric_Thunderclap
end

function KromzogDeath(e)
	eq.unique_spawn(113264,29,0,1125,-768,-116,0); -- NPC: Zlirron_Windchill
end

function ZlirronDeath(e)
	eq.unique_spawn(113265,28,0,1133,-911,-116,0); -- NPC: Khalerogg_Dorfenbane
end

function KhaleroggDeath(e)
	eq.unique_spawn(113266,29,0,1125,-768,-116,0); -- NPC: Valorankt_Zekkin
end

function ValoranktDeath(e)
	eq.unique_spawn(113260,30,0,1143,-840,-126,0); -- NPC: #Doldigun_Steinwielder
end

function event_encounter_load(e)
	eq.register_npc_event("plate_cycle", Event.waypoint_arrive, 113260, DoldigunWaypoint);
	eq.register_npc_event("plate_cycle", Event.spawn, 113260, Doldigun2Spawn);
	eq.register_npc_event("plate_cycle", Event.spawn, 113249, DoldigunSpawn);
	eq.register_npc_event("plate_cycle", Event.timer, 113249, DoldigunTimer);
	eq.register_npc_event("plate_cycle", Event.combat, 113249, DoldigunCombat);
	eq.register_npc_event("plate_cycle", Event.spawn, 113261, GrondonSpawn);
	eq.register_npc_event("plate_cycle", Event.timer, 113261, GrondonTimer);
	eq.register_npc_event("plate_cycle", Event.combat, 113261, GrondonCombat);
	eq.register_npc_event("plate_cycle", Event.spawn, 113262, KromzogSpawn);
	eq.register_npc_event("plate_cycle", Event.timer, 113262, KromzogTimer);
	eq.register_npc_event("plate_cycle", Event.combat, 113262, KromzogCombat);
	eq.register_npc_event("plate_cycle", Event.death_complete, 113261, GrondonDeath);
	eq.register_npc_event("plate_cycle", Event.death_complete, 113262, KromzogDeath);
	eq.register_npc_event("plate_cycle", Event.death_complete, 113264, ZlirronDeath);
	eq.register_npc_event("plate_cycle", Event.death_complete, 113265, KhaleroggDeath);
	eq.register_npc_event("plate_cycle", Event.death_complete, 113266, ValoranktDeath);
end
