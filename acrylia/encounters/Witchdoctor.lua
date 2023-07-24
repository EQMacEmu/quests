local TRIGGER_NPC_TYPE = 154130;  -- WDTrpMn
local WARDER_TYPE = 154111; -- a_grimling_warder
local SUMMONED_GRIMLINGS = { 154363, 154364, 154365 }; -- a_summoned_grimling (neuter, female, male)
local WITCHDOCTOR_TYPE = 154041; -- #Witchdoctor_Gnorgtarg

local eventActive = false;
local scriptRestartCooldown = false;
local cooldownTime = 16800000;
local clientsInProximity = 0;
local warder;
local proxTimer;

function TriggerNPCSpawnEvent(event)
	eq.set_proximity(383, 460, -378, -205, 30, 60);
	eventActive = false;
end

function TriggerNPCEnterEvent(e)

	if ( e.other:GetGM() ) then
		return
	end

	TryStartEvent();
end

function TryStartEvent()
	if ( not eventActive and not scriptRestartCooldown ) then

		eventActive = true;
		proxTimer = false;
		clientsInProximity = 1;
		
		eq.set_timer("warder", 15000);
		eq.set_timer("proximity", 2000);
		
		SummonedGrimlingDeathEvent();
	end
end

function EndEvent()

	warder:Depop();

	for _, id in ipairs(SUMMONED_GRIMLINGS) do
		eq.depop_all(id);
	end
	
	proxTimer = false;
	eventActive = false;
	
	eq.signal(TRIGGER_NPC_TYPE, 1);
end

function CountClientsInRing()
	local clientList = eq.get_entity_list():GetClientList();
	local clients = 0;

	if ( clientList ) then
		for client in clientList.entries do

			if ( not client:GetGM() and not client:GetFeigned()
				and client:GetY() > -379 and client:GetY() < -204
				and client:GetX() > 382 and client:GetX() < 461
				and client:GetZ() > 29	and client:GetZ() < 61
			) then
				
				clients = clients + 1;
			end
		end
	end

	return clients;
end

function TriggerNPCTimerEvent(e)

	if ( e.timer == "restart" ) then
		scriptRestartCooldown = false;
		eq.stop_timer("restart");
		return;
	end
	
	if ( not eventActive ) then
		eq.stop_timer("proximity");
		eq.stop_timer("end");
		eq.depop_all(WITCHDOCTOR_TYPE);
		return;
	end
	
	if ( e.timer == "proximity" ) then
		
		if ( CountClientsInRing() == 0 ) then
		
			if ( proxTimer == false ) then
				eq.set_timer("end", 180000);
				proxTimer = true;
			end
		else
			eq.stop_timer("end");
			proxTimer = false;
		end
		
	elseif ( e.timer == "end" ) then
	
		if ( CountClientsInRing() == 0 ) then
			scriptRestartCooldown = true;
			cooldownTime = 2700000;	
			EndEvent(); -- no clients near middle of room for 3 mins
		end
		
	elseif ( e.timer == "warder" ) then	
		warder = eq.spawn2(WARDER_TYPE, 0, 0, 441, -401, 28, 192); -- a_grimling_warder
		eq.stop_timer("warder");
	end
end

function WitchdoctorDeathEvent(e)
	scriptRestartCooldown = true;
	cooldownTime = 16800000;	
	EndEvent();
end

function TriggerNPCSignalEvent(e)
	if ( e.signal == 1 ) then
		eq.set_timer("restart", cooldownTime);
	end
end

function SummonedGrimlingDeathEvent(e)

	local roll = math.random(100);
	local x, y, z, h = 433, -297, 42, 64;
	
	if ( roll <= 25 ) then
		eq.spawn2(WITCHDOCTOR_TYPE, 0, 0, x, y, z, h);
	elseif ( roll <= 50 ) then
		eq.spawn2(SUMMONED_GRIMLINGS[1], 0, 0, x, y, z, h);
	elseif ( roll <= 75 ) then
		eq.spawn2(SUMMONED_GRIMLINGS[2], 0, 0, x, y, z, h);
	else
		eq.spawn2(SUMMONED_GRIMLINGS[3], 0, 0, x, y, z, h);
	end
end

function event_encounter_load(e)

	-- WDTrpMn
	eq.register_npc_event("Witchdoctor", Event.spawn, TRIGGER_NPC_TYPE, TriggerNPCSpawnEvent);
	eq.register_npc_event("Witchdoctor", Event.enter, TRIGGER_NPC_TYPE, TriggerNPCEnterEvent);
	eq.register_npc_event("Witchdoctor", Event.timer, TRIGGER_NPC_TYPE, TriggerNPCTimerEvent);
	eq.register_npc_event("Witchdoctor", Event.signal, TRIGGER_NPC_TYPE, TriggerNPCSignalEvent);
	
	-- ensure TriggerNPCSpawnEvent() executes
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(TRIGGER_NPC_TYPE) ) then
		eq.depop_with_timer(TRIGGER_NPC_TYPE);
	end
	
	eq.register_npc_event("Witchdoctor", Event.death, WITCHDOCTOR_TYPE, WitchdoctorDeathEvent);
	
	for _, id in ipairs(SUMMONED_GRIMLINGS) do
		eq.register_npc_event("Witchdoctor", Event.death, id, SummonedGrimlingDeathEvent);
	end
end
