-- Coldain Ring: Quest 5

function ScarbrowSpawn(e)
	e.self:SetRunning(true);
	eq.set_timer("gogo",1000);
end

function oracleSpawn(e)
	e.self:SetRunning(true);
	eq.set_timer("gogo",20000);
end

function invaderSpawn(e)
	e.self:SetRunning(true);
	eq.set_timer("gogo",15000);
end

function ScarbrowTimer(e)
	if(e.timer == "gogo") then
		eq.move_to(-350,-2653,174,0,true);
		eq.stop_timer("gogo");
	end
	if(e.timer == "depop") then
		eq.depop();
		eq.stop_timer("depop");
	end
end

function oracleTimer(e)
	if(e.timer == "gogo") then
		eq.ChooseRandom(eq.move_to(-346,-2630,172,0,true),eq.move_to(-409,-2670,179,0,true));
		eq.stop_timer("gogo");
	end
	if(e.timer == "depop") then
		eq.depop();
	end
end

function invaderTimer(e)
	if(e.timer == "gogo") then
		eq.ChooseRandom(eq.move_to(-391,-2623,176,0,true),eq.move_to(-374,-2664,176,0,true),eq.move_to(-407,-2647,178,0,true));
		eq.stop_timer("gogo");
	end
	if(e.timer == "depop") then
		eq.depop();
		eq.stop_timer("depop");
	end
end

function ScarbrowCombat(e)
	if(e.joined) then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop",5000);
	end
end

function oracleCombat(e)
	if(e.joined) then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop",20000);
	end
end

function invaderCombat(e)
	if(e.joined) then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop",20000);
	end
end

function event_encounter_load(e)
	eq.register_npc_event("ringfive", Event.spawn, 116020, ScarbrowSpawn);
	eq.register_npc_event("ringfive", Event.spawn, 116021, oracleSpawn);
	eq.register_npc_event("ringfive", Event.spawn, 116022, invaderSpawn);
	eq.register_npc_event("ringfive", Event.timer, 116020, ScarbrowTimer);
	eq.register_npc_event("ringfive", Event.timer, 116021, oracleTimer);
	eq.register_npc_event("ringfive", Event.timer, 116022, invaderTimer);
	eq.register_npc_event("ringfive", Event.combat, 116020, ScarbrowCombat);
	eq.register_npc_event("ringfive", Event.combat, 116021, oracleCombat);
	eq.register_npc_event("ringfive", Event.combat, 116022, invaderCombat);
end