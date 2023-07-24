local TRASH_TYPES = {
	154353, -- a_possessed_corpse (SK)
	154354, -- a_possessed_corpse (Wizard)
	154355, -- a_possessed_priest
};
local MINIBOSS_TYPES = {
	154356, -- A_Possessed_Battlelord
	154357, -- A_Possessed_Battlemaster
};
local BOSS_TYPES = {
	154358, -- A_Possessed_Warmonger
	154359, -- A_Possessed_Warlord
	154360, -- A_Possessed_Warmaster
	154361, -- A_Possessed_Underking
};
local TRIGGER_NPC_TYPE = 154091;  -- #As
local WARDER_TYPE = 154111;
local UNTARGETABLE_GRIMLING_TYPE = 154351;
local RING_CLIENT_CHECK_TIMER = 2000;

local ringActive = false;
local clientsInRing = 0;
local wave = 0;
local warder;
local chantingGrimlings = {};
local waveToggle = false;

function TriggerNPCSpawnEvent(event)
	eq.set_proximity(-126, -108, 74, 91, -40, 100);
	ringActive = false;
end

function TriggerNPCEnterEvent(e)

	if ( e.other:GetGM() ) then
		return
	end

	if ( not ringActive ) then
		
		ringActive = true;
		clientsInRing = 1;
		
		e.self:Emote("you step into the grimling's ring of fire, a hot breeze blows into the cavern and begins swirling about you. The grimling's constant chanting seems to grow louder...");
	
		warder = eq.spawn2(WARDER_TYPE, 0, 0, -98, -20, -25, 0); -- a_grimling_warder
		
		chantingGrimlings[1] = eq.spawn2(UNTARGETABLE_GRIMLING_TYPE, 0, 0, -78, 93, -26, 182);		-- confirmed
		chantingGrimlings[2] = eq.spawn2(UNTARGETABLE_GRIMLING_TYPE, 0, 0, -82, 56, -29, 210);		-- confirmed
		chantingGrimlings[3] = eq.spawn2(UNTARGETABLE_GRIMLING_TYPE, 0, 0, -124, 120, -29, 121);	-- guess
		chantingGrimlings[4] = eq.spawn2(UNTARGETABLE_GRIMLING_TYPE, 0, 0, -149, 80, -27, 61);		-- guess
		chantingGrimlings[5] = eq.spawn2(UNTARGETABLE_GRIMLING_TYPE, 0, 0, -133, 53, -29, 23);		-- confirmed
		
		eq.set_timer("wave", 70000 + math.random(10000));
		eq.set_timer("proximity", RING_CLIENT_CHECK_TIMER);
		eq.set_timer("spam", 1200000 + math.random(600000));
	end
end

function EndRingEvent()

	for _, id in ipairs(BOSS_TYPES) do
		eq.depop_all(id);
	end
	
	local spawn;
	
	for _, mob in ipairs(chantingGrimlings) do
		mob:Depop();
	end
	
	warder:Shout("Master! The sacred ring of fire has been cleansed of trespassers.");
	warder:Depop();
	
	wave = 0;
	ringActive = false;
end

function CountClientsInRing()
	local clientList = eq.get_entity_list():GetClientList();
	local clients = 0;

	if ( clientList ) then
		for client in clientList.entries do
		
			if ( not client:GetGM() and not client:GetFeigned()
				and client:GetY() > 74 and client:GetY() < 91
				and client:GetX() > -126 and client:GetX() < -108
				and client:GetZ() > -40	and client:GetZ() < 100
			) then
				
				clients = clients + 1;
			end
		end
	end

	return clients;
end

function TriggerNPCTimerEvent(e)

	if ( not ringActive ) then
		eq.stop_timer("wave");
		eq.stop_timer("spam");
		eq.stop_timer("proximity");
		return;
	end

	if ( e.timer == "wave" ) then
	
		wave = wave + 1;
		
		if ( waveToggle ) then
			waveToggle = false;
			eq.set_timer("wave", 90000 + math.random(10000));
		else
			waveToggle = true;
			eq.set_timer("wave", 70000 + math.random(10000));
		end

		SpawnWave();
		
	elseif ( e.timer == "proximity" ) then
		
		if ( CountClientsInRing() == 0 ) then
			EndRingEvent();			
		end
		
	elseif ( e.timer == "spam" and warder ) then
	
		warder:Say("Approach me tresspassers! By the power of the master, I will bathe you in the boiling rock!");
		eq.set_timer("spam", 1200000 + math.random(600000));
	end
end

function SpawnWave()

	local roll = math.random(100);
	
	-- big boss every 15 waves starting at wave 30
	if ( wave > 29 and wave % 15 == 0 ) then
	
		local boss = 1;	-- warmonger
		
		if ( roll <= 10 ) then
			boss = 4;	-- underking
		elseif ( roll <= 20 ) then
			boss = 3;	-- warmaster
		elseif ( roll <= 35 ) then
			boss = 2;	-- warlord
		end
		
		eq.spawn2(BOSS_TYPES[boss], 12, 0, -89, 5, -25, 250);
	else
		if ( roll <= 7 ) then
			-- battlemaster
			eq.spawn2(MINIBOSS_TYPES[2], 0, 0, -116, 81, -25, math.random(255));
		elseif ( roll <= 15 ) then
			-- battlelord
			eq.spawn2(MINIBOSS_TYPES[1], 0, 0, -116, 81, -25, math.random(255));
		else
			eq.spawn2(TRASH_TYPES[math.random(3)], 0, 0, math.random(-126, -108), math.random(74, 91), -25, math.random(255));
		end
		
		eq.spawn2(TRASH_TYPES[1], 0, 0, math.random(-126, -108), math.random(74, 91), -25, math.random(255));		-- SK possessed
		eq.spawn2(TRASH_TYPES[math.random(3)], 0, 0, math.random(-126, -108), math.random(74, 91), -25, math.random(255));
	end
end

function TrashEventSpawn(e)
	eq.set_timer("depop", 60000);
end

function TrashEventCombat(e)
	if ( e.joined ) then
		if ( not eq.is_paused_timer("depop") ) then
			eq.pause_timer("depop");
		end
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

	-- #As
	eq.register_npc_event("RingOfFire", Event.spawn, TRIGGER_NPC_TYPE, TriggerNPCSpawnEvent);
	eq.register_npc_event("RingOfFire", Event.enter, TRIGGER_NPC_TYPE, TriggerNPCEnterEvent);
	eq.register_npc_event("RingOfFire", Event.timer, TRIGGER_NPC_TYPE, TriggerNPCTimerEvent);

	-- depop timers
	for _, id in ipairs(TRASH_TYPES) do
		eq.register_npc_event("RingOfFire", Event.combat, id, TrashEventCombat);
		eq.register_npc_event("RingOfFire", Event.timer, id, TrashEventTimer);
		eq.register_npc_event("RingOfFire", Event.spawn, id, TrashEventSpawn);
	end
	for _, id in ipairs(MINIBOSS_TYPES) do
		eq.register_npc_event("RingOfFire", Event.combat, id, TrashEventCombat);
		eq.register_npc_event("RingOfFire", Event.timer, id, TrashEventTimer);
		eq.register_npc_event("RingOfFire", Event.spawn, id, TrashEventSpawn);
	end
	
	-- ensure TriggerNPCSpawnEvent() executes
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(TRIGGER_NPC_TYPE) ) then
		eq.depop_with_timer(TRIGGER_NPC_TYPE);
	end
end
