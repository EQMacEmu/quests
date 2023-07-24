local StartEvent = 0;

function SsrakezhSpawn(e)
	eq.set_timer("SpawnSsrakezh",1000);
end

function SsrakezhTimer(e)
	if(e.timer == "SpawnSsrakezh") then
		eq.stop_timer("SpawnSsrakezh");
		eq.unique_spawn(162258,0,0,-211,131,-183,134);
	end
end

function KavamezhDeath(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162210)) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,1);
		elseif(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,2);
		end
	end
end

function KeuzozhDeath(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162210)) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,1);
		elseif(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,2);
		end
	end
end

function MikazhaDeath(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162210)) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,1);
		elseif(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,2);
		end
	end
end

function RevanDeath(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162210)) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,1);
		elseif(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,2);
		end
	end
end

function VezhkahDeath(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162210)) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,1);
		elseif(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,2);
		end
	end
end

function ZerumazDeath(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162210)) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,1);
		elseif(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,2);
		end
	end
end

function ZheDeath(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162210)) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,1);
		elseif(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,2);
		end
	end
end

function WardenDeath(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162210)) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,1);
		elseif(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,2);
		end
	end
end

function SsrakezhDeath(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162210)) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,1);
		elseif(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162089)
			) then
			eq.signal(162266,2);
		end
		eq.signal(162266,3);
	end
end

function SsravizhDeath(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162210)) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258)
			) then
			eq.signal(162266,1);
		elseif(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162012) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162021) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162013) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162060) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162024) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162011) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162059) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162023) and
			not eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258)
			) then
			eq.signal(162266,2);
		end
	end
end

function EventSignal(e)
	if(e.signal == 1) then
		eq.set_timer("eventstart",3600000);
		StartEvent = 1;
	elseif(e.signal == 2) then
		if(StartEvent == 1) then
			eq.set_timer("spawnGlyph",46000);
		end
	elseif(e.signal == 3) then
		eq.set_timer("SpawnSsrakezh",7200000);
	elseif(e.signal == 4) then
		eq.stop_timer("SpawnSsrakezh");
	end
end

function EventTimer(e)
	if(e.timer == "eventstart") then
		eq.stop_timer("eventstart");
		StartEvent = 0;
	elseif(e.timer == "spawnGlyph") then
		eq.stop_timer("spawnGlyph");
		eq.zone_emote(0,"A roar fills the lower temple halls!  The smell of burning ozone and decay fills the air!");
		if(eq.get_qglobals().glyphed_dead ~= nil) then
			eq.unique_spawn(162038,0,0,-51,-9,-218,63);
		else
			eq.unique_spawn(162037,0,0,-51,-9,-218,63);
		end
	elseif(e.timer == "SpawnSsrakezh") then
		eq.stop_timer("SpawnSsrakezh");
		eq.unique_spawn(162258,0,0,-211,131,-183,134);
	end
end

function GlyphSpawn(e)
	eq.set_timer("depop",1800000);
end

function GlyphTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function GlyphCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function GlyphDeath(e)
	eq.set_global("glyphed_dead","1",3,"D5");
	if(eq.get_qglobals().exiled_dead ~= nil) then
		eq.unique_spawn(162040,0,0,-51,-9,-218,63); -- spawn banished
	else
		eq.unique_spawn(162039,0,0,-51,-9,-218,63); -- spawn exiled
	end	
end

function RuneSpawn(e)
	eq.set_timer("depop",1800000);
end

function RuneTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function RuneCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function RuneDeath(e)
	if(eq.get_qglobals().exiled_dead ~= nil) then
		eq.unique_spawn(162040,0,0,-51,-9,-218,63); -- spawn banished
	else
		eq.unique_spawn(162039,0,0,-51,-9,-218,63); -- spawn exiled
	end	
end

function ExileSpawn(e)
	eq.set_timer("depop",1500000);
end

function ExileTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function ExileCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function ExileDeath(e)
	eq.set_global("exiled_dead","1",3,"D5");
	eq.unique_spawn(162042,0,0,-51,-9,-218,63);
end

function BanishSpawn(e)
	eq.set_timer("depop",1500000);
end

function BanishTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function BanishCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function BanishDeath(e)
	eq.unique_spawn(162042,0,0,-51,-9,-218,63);
end

function CurseSpawn(e)
	eq.set_timer("depop",1200000);
end

function CurseTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function CurseCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function CurseDeath(e)
	eq.delete_global("glyphed_dead");
	eq.delete_global("exiled_dead");
	eq.signal(162266,4);
	eq.depop_with_timer(162210);
end

function event_encounter_load(e)
	eq.register_npc_event("CurseCycle", Event.spawn, 162210, SsrakezhSpawn);
	eq.register_npc_event("CurseCycle", Event.timer, 162210, SsrakezhTimer);
	eq.register_npc_event("CurseCycle", Event.death, 162012, KavamezhDeath);
	eq.register_npc_event("CurseCycle", Event.death, 162021, KeuzozhDeath);
	eq.register_npc_event("CurseCycle", Event.death, 162013, MikazhaDeath);
	eq.register_npc_event("CurseCycle", Event.death, 162060, RevanDeath);
	eq.register_npc_event("CurseCycle", Event.death, 162024, VezhkahDeath);
	eq.register_npc_event("CurseCycle", Event.death, 162011, ZerumazDeath);
	eq.register_npc_event("CurseCycle", Event.death, 162059, ZheDeath);
	eq.register_npc_event("CurseCycle", Event.death, 162023, WardenDeath);
	eq.register_npc_event("CurseCycle", Event.death, 162258, SsrakezhDeath);
	eq.register_npc_event("CurseCycle", Event.death, 162089, SsravizhDeath);
	eq.register_npc_event("CurseCycle", Event.signal, 162266, EventSignal);
	eq.register_npc_event("CurseCycle", Event.timer, 162266, EventTimer);
	eq.register_npc_event("CurseCycle", Event.spawn, 162037, GlyphSpawn);
	eq.register_npc_event("CurseCycle", Event.timer, 162037, GlyphTimer);
	eq.register_npc_event("CurseCycle", Event.combat, 162037, GlyphCombat);
	eq.register_npc_event("CurseCycle", Event.death, 162037, GlyphDeath);
	eq.register_npc_event("CurseCycle", Event.spawn, 162038, RuneSpawn);
	eq.register_npc_event("CurseCycle", Event.timer, 162038, RuneTimer);
	eq.register_npc_event("CurseCycle", Event.combat, 162038, RuneCombat);
	eq.register_npc_event("CurseCycle", Event.death, 162038, RuneDeath);
	eq.register_npc_event("CurseCycle", Event.spawn, 162039, ExileSpawn);
	eq.register_npc_event("CurseCycle", Event.timer, 162039, ExileTimer);
	eq.register_npc_event("CurseCycle", Event.combat, 162039, ExileCombat);
	eq.register_npc_event("CurseCycle", Event.death, 162039, ExileDeath);
	eq.register_npc_event("CurseCycle", Event.spawn, 162040, BanishSpawn);
	eq.register_npc_event("CurseCycle", Event.timer, 162040, BanishTimer);
	eq.register_npc_event("CurseCycle", Event.combat, 162040, BanishCombat);
	eq.register_npc_event("CurseCycle", Event.death, 162040, BanishDeath);
	eq.register_npc_event("CurseCycle", Event.spawn, 162042, CurseSpawn);
	eq.register_npc_event("CurseCycle", Event.timer, 162042, CurseTimer);
	eq.register_npc_event("CurseCycle", Event.combat, 162042, CurseCombat);
	eq.register_npc_event("CurseCycle", Event.death, 162042, CurseDeath);
end
