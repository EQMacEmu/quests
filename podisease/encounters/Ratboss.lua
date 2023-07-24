local RATBOSS_TYPE = 205134; -- #Rallius_Rattican
--local CONTROLLER_TYPE = 205152; -- #Ratboss_Trig
local CRONIE_TYPE = 205160; -- a_bubonian_cronie
local SPIDER_TYPE = 205159; -- A_gargantuan_arachnae
local YOUTH_TYPE = 205161; -- A_bubonian_youth

local eventActive = false;

function RatbossCombatEvent(e)
	if ( e.joined ) then
	
		if ( not eventActive ) then
			eq.spawn2(SPIDER_TYPE, 0, 0, 96, -3384, -214.25, 174);
			eq.spawn2(SPIDER_TYPE, 0, 0, -539, -3482, -257, 80);
			eq.set_timer("cronies", 1000);
			eq.set_timer("youth", 150000);
			eq.set_timer("reset", 1200000);			
			eventActive = true;
			eq.debug("Rallius event started", 1);
		end
		eq.pause_timer("reset");
	else
		eq.resume_timer("reset");
	end
end

function RatbossDeathEvent(e)
	ResetEvent();
	eq.debug("Rallius event ended; boss killed", 1);
end

function RatbossTimerEvent(e)

	if ( e.timer == "reset" ) then
		ResetEvent();
		eq.debug("Rallius event reset", 1);
	
	elseif ( e.timer == "cronies" ) then
	
		eq.set_timer("cronies", 290000);
		eq.spawn2(CRONIE_TYPE, 22, 0, 96, -3384, -214.119, 0);
		eq.spawn2(CRONIE_TYPE, 22, 0, 113, -3377, -217.625, 0);
	
	elseif ( e.timer == "youth" ) then

		eq.set_timer("youth", 360000);
		
		local r = math.random(3, 6);
		
		local mob;
		for i = 1, r do
			mob = eq.spawn2(YOUTH_TYPE, 22, 0, e.self:GetX() + math.random(-5, 5), e.self:GetY() + math.random(-5, 5), e.self:GetZ(), 0);
			mob:CastToNPC():UpdateWaypoint(7);
		end
	end
end

function ResetEvent()
	eq.stop_timer("cronies");
	eq.stop_timer("youth");
	eq.stop_timer("reset");
	eq.depop_all(SPIDER_TYPE);
	eventActive = false;
end

function TrashEventSpawn(e)
	eq.set_timer("depop", 300000);
end

function TrashEventCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function TrashEventTimer(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function event_encounter_load(e)

	eq.register_npc_event("Ratboss", Event.combat, RATBOSS_TYPE, RatbossCombatEvent);
	eq.register_npc_event("Ratboss", Event.death, RATBOSS_TYPE, RatbossDeathEvent);
	eq.register_npc_event("Ratboss", Event.timer, RATBOSS_TYPE, RatbossTimerEvent);

	local types = { CRONIE_TYPE, YOUTH_TYPE };
	for _, t in ipairs(types) do
		eq.register_npc_event("Ratboss", Event.combat, t, TrashEventCombat);
		eq.register_npc_event("Ratboss", Event.timer, t, TrashEventTimer);
		eq.register_npc_event("Ratboss", Event.spawn, t, TrashEventSpawn);
	end
end
