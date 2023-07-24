local count = 0;

function CallerDeath(e)
	eq.signal(176009,1);
end

function CallerSignal(e)
	if(e.signal == 1) then
		eq.set_timer("counting",90000);
	end
end

function CallerTimer(e)
	eq.set_timer("counting",300000);
	count = count + 1;
	if(count == 1) then
		eq.spawn2(176001,0,0,487,2281,302,135);
		eq.spawn2(176001,0,0,455,2253,305,64);
		eq.spawn2(176001,0,0,475,2229,305,14);
		eq.spawn2(176001,0,0,504,2258,304,184);	
	elseif(count == 2) then
		eq.spawn2(176001,0,0,487,2281,302,135);
		eq.spawn2(176001,0,0,455,2253,305,64);
		eq.spawn2(176001,0,0,475,2229,305,14);
		eq.spawn2(176001,0,0,504,2258,304,184);	
	elseif(count == 3) then
		eq.spawn2(eq.ChooseRandom(176001,176008,176004),0,0,487,2281,302,135);
		eq.spawn2(176001,0,0,455,2253,305,64);
		eq.spawn2(eq.ChooseRandom(176001,176008,176004),0,0,475,2229,305,14);
		eq.spawn2(176001,0,0,504,2258,304,184);	
	elseif(count == 4) then
		eq.spawn2(eq.ChooseRandom(176001,176008,176004),0,0,487,2281,302,135);
		eq.spawn2(176001,0,0,455,2253,305,64);
		eq.spawn2(eq.ChooseRandom(176001,176008,176004),0,0,475,2229,305,14);
		eq.spawn2(176001,0,0,504,2258,304,184);	
	elseif(count == 5) then
		eq.spawn2(eq.ChooseRandom(176001,176008,176004),0,0,487,2281,302,135);
		eq.spawn2(176001,0,0,455,2253,305,64);
		eq.spawn2(eq.ChooseRandom(176001,176008,176004),0,0,475,2229,305,14);
		eq.spawn2(176001,0,0,504,2258,304,184);	
	elseif(count == 6) then
		eq.spawn2(176000,0,0,482,2254,306,128);
		eq.spawn2(176001,0,0,455,2253,305,64);
		eq.spawn2(176001,0,0,475,2229,305,14);
		eq.spawn2(eq.ChooseRandom(176001,176008,176004),0,0,504,2258,304,184);
		count = 0;
		eq.stop_timer("counting");
	end
end

function LordSpawn(e)
	eq.set_timer("depop",1800000);
end

function LordTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function LordCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function RavagerSpawn(e)
	eq.set_timer("depop",1800000);
end

function RavagerTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function RavagerCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function FleshSpawn(e)
	eq.set_timer("depop",1800000);
end

function FleshTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function FleshCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function HiveSpawn(e)
	eq.set_timer("depop",1800000);
end

function HiveTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function HiveCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("swarmcaller", Event.death_complete, 176007, CallerDeath);
	eq.register_npc_event("swarmcaller", Event.signal, 176009, CallerSignal);
	eq.register_npc_event("swarmcaller", Event.timer, 176009, CallerTimer);
	eq.register_npc_event("swarmcaller", Event.spawn, 176000, LordSpawn);
	eq.register_npc_event("swarmcaller", Event.timer, 176000, LordTimer);
	eq.register_npc_event("swarmcaller", Event.combat, 176000, LordCombat);
	eq.register_npc_event("swarmcaller", Event.spawn, 176001, RavagerSpawn);
	eq.register_npc_event("swarmcaller", Event.timer, 176001, RavagerTimer);
	eq.register_npc_event("swarmcaller", Event.combat, 176001, RavagerCombat);
	eq.register_npc_event("swarmcaller", Event.spawn, 176008, FleshSpawn);
	eq.register_npc_event("swarmcaller", Event.timer, 176008, FleshTimer);
	eq.register_npc_event("swarmcaller", Event.combat, 176008, FleshCombat);
	eq.register_npc_event("swarmcaller", Event.spawn, 176004, HiveSpawn);
	eq.register_npc_event("swarmcaller", Event.timer, 176004, HiveTimer);
	eq.register_npc_event("swarmcaller", Event.combat, 176004, HiveCombat);
end
