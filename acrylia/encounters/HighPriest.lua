local client_target = 0;
local client_number = 0;
local wave = 0;

function ShackleSpawn(e)
	client_number = 0;
	eq.set_proximity(e.self:GetX()-5,e.self:GetX()+5,e.self:GetY()-5,e.self:GetY()+5,e.self:GetZ()-5,e.self:GetZ()+10);
end

function ShackleEnter(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(154107) and client_number < 1) then
		client_number = client_number + 1;
		client_target = e.other:GetID();
		eq.debug("Number of client here is ".. client_number .."",1);
		e.self:CastSpell(2860, e.self:GetID()); -- cast shackles
		eq.set_timer("root",12000);
		eq.set_timer("waves",45000);
	end
end

function ShackleTimer(e)
	if(client_number > 0) then
		if(e.timer == "root") then
			e.self:CastSpell(2860, e.self:GetID());
		elseif(e.timer == "waves") then
			wave = wave + 1;
			if(wave < 16) then
				if(wave == 1) then
					eq.get_entity_list():GetMobByNpcTypeID(154107):Shout("Master, intruders have wandered into our sacred altar! I beg, grant me power to make them a worthy sacrifice!");
				end
				rand = math.random(1,2);
				if(rand == 2) then
					eq.spawn2(154019,9,0,150,-690,2,0);
					eq.spawn2(154019,9,0,153,-695,2,0);
				else
					eq.spawn2(154019,9,0,150,-690,2,0);
				end
			elseif(wave < 31) then
				if(wave == 16) then
					eq.get_entity_list():GetMobByNpcTypeID(154107):Shout("Master, the intruders are powerful. I beg, send stronger minions!");
				end
				rand = math.random(1,2);
				if(rand == 2) then
					eq.spawn2(154020,9,0,150,-690,2,0);
					eq.spawn2(154020,9,0,153,-695,2,0);
				else
					eq.spawn2(154020,9,0,150,-690,2,0);
				end
			elseif(wave < 46) then
				if(wave == 31) then
					eq.get_entity_list():GetMobByNpcTypeID(154107):Shout("Master, the tresspassers persist. I beg, make them pay for their foolishness!");
				end				
				if(rand == 2) then
					eq.spawn2(154021,9,0,150,-690,2,0);
					eq.spawn2(154021,9,0,153,-695,2,0);
				else
					eq.spawn2(154021,9,0,150,-690,2,0);
				end
			elseif(wave == 46) then
				eq.get_entity_list():GetMobByNpcTypeID(154107):Shout("Master! The minions have failed. I beg, empower me to rid the realm of the vile unbelievers!");
				eq.get_entity_list():GetClientByID(client_target):MovePC(154,142,-690,3,0);
				eq.depop_with_timer(154107);
				if(math.random(100) > 20) then
					eq.unique_spawn(154022,0,0,142,-690,3,66); -- a_grimling_high_priest (targetable)
				else
					eq.unique_spawn(154023,0,0,142,-690,3,66); -- High_Priest_Gakkernog
				end
			end
		end
	end
end

function ShackleExit(e)
	client_number = client_number - 1;
	eq.debug("Number of client here is ".. client_number .."",1);
	if(client_number < 1) then
		client_number = 0;
		client_target = 0;
		wave = 0;
		eq.stop_timer("root");
		eq.stop_timer("waves");
	end
end

function Possess1waypoint(e)
	if(e.wp == 3 and client_target > 0) then
		e.self:CastSpell(2858, client_target); -- cast acryliaKB
	elseif(e.wp == 5) then
		client_number = client_number - 1;
		if(client_number < 1) then
			client_number = 0;
			client_target = 0;
			wave = 0;
			eq.stop_timer("root");
			eq.stop_timer("waves");
		end
	end
end

function Possess2waypoint(e)
	if(e.wp == 3 and client_target > 0) then
		e.self:CastSpell(2858, client_target); -- cast acryliaKB
	elseif(e.wp == 5) then
		client_number = client_number - 1;
		if(client_number < 1) then
			client_number = 0;
			client_target = 0;
			wave = 0;
			eq.stop_timer("root");
			eq.stop_timer("waves");
		end
	end
end

function Possess3waypoint(e)
	if(e.wp == 3 and client_target > 0) then
		e.self:CastSpell(2858, client_target); -- cast acryliaKB
	elseif(e.wp == 5) then
		client_number = client_number - 1;
		if(client_number < 1) then
			client_number = 0;
			client_target = 0;
			wave = 0;
			eq.stop_timer("root");
			eq.stop_timer("waves");
		end
	end
end

function HighPriestSpawn(e)
	eq.set_timer("depop",1200000);
end

function HighPriestTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function GakkernogSpawn(e)
	eq.set_timer("depop",1200000);
end

function GakkernogTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function event_encounter_load(e)
	eq.register_npc_event("HighPriest", Event.spawn, 154108, ShackleSpawn);
	eq.register_npc_event("HighPriest", Event.enter, 154108, ShackleEnter);
	eq.register_npc_event("HighPriest", Event.exit, 154108, ShackleExit);
	eq.register_npc_event("HighPriest", Event.timer, 154108, ShackleTimer);
	eq.register_npc_event("HighPriest", Event.waypoint_arrive, 154019, Possess1waypoint);
	eq.register_npc_event("HighPriest", Event.waypoint_arrive, 154020, Possess2waypoint);
	eq.register_npc_event("HighPriest", Event.waypoint_arrive, 154021, Possess3waypoint);
	eq.register_npc_event("HighPriest", Event.spawn, 154022, HighPriestSpawn);
	eq.register_npc_event("HighPriest", Event.timer, 154022, HighPriestTimer);
	eq.register_npc_event("HighPriest", Event.spawn, 154023, GakkernogSpawn);
	eq.register_npc_event("HighPriest", Event.timer, 154023, GakkernogTimer);
end
