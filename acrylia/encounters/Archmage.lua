local TRASH_TYPES = {
	154047, -- a_grimling_skullsplinterer
	154044, -- a_grimling_cleanser
	154046, -- a_grimling_deathdealer
	154042, -- a_grimling_alchemist
	154043, -- a_grimling_battlepriest
	154045, -- a_grimling_corpsemaster
	154362, -- a_grimling_possessor
};
local TRASH_COORDS = {
	{ y = 3, x = 232, z = -7, h = 0 },
	{ y = 3, x = 238, z = -7, h = 0 },
	{ y = 3, x = 244, z = -7, h = 0 },
	{ y = -16, x = 238, z = -7, h = 128 },
	{ y = -16, x = 244, z = -7, h = 128 },
	{ y = -16, x = 232, z = -7, h = 128 },
	{ y = -6, x = 228, z = -7, h = 192 },
};

local TRIGGER_NPC_TYPE = 154349;  -- AMTrigger (invis man on platform)
local ELITE_GUARD_TYPE = 154099; -- a_grimling_elite_guard
local WARDER_TYPE = 154111; -- a_grimling_warder
local ARCHMAGE_TYPE = 154103; -- #the_grimling_archmage
local ARCHMAGE_SPAWN_ID = 324843;
local GORRAFERG_TYPE = 154040; -- Archmage_Gorraferg
local PROXIMITY_TIMER = 2000;
local ARCHMAGE_TEXT = {
	'Master! The intruders have interrupted my sacred work! I beg, send minions to my aid!',
	'By the power of the master, I summon forth the his minions to cleanse the realm of intruders...',
	'You tresspassers are still here? You will not interrupt my work! I will summon a legion of our kind if needed!',
	'Master! More of our people are needed to cleanse the sacred palace. I beg, make the intruders pay with their lives!',
	'You fools! You do not understand! Your efforts here are fruitless. You will die and your remains will live again to serve us!',
	'Master! The intruders persist! I beg, teach them humility through defeat!',
	'Your petty resistance will only make it worse for you in the end. Leave, or die!!',
	'Master, they are weakening! I beg, finish them!',
	'Master, the intruders persist! I beg, give me the power to overcome them. May their flesh burn on your sacred altar!'
};
local ARCHMAGE_TEXT_TIMES = {
	[1] = 47000,
	[2] = 160000,
	[3] = 47000,
	[4] = 114000,
	[5] = 47000,
	[6] = 113000,
	[7] = 48000,
	[8] = 594000,
	[9] = 999000,
};
local WAVE_TIMES = {
	[1] = 161000,
	[2] = 160000,
	[3] = 158000,
	[4] = 112000,
	[5] = 107000,
	[6] = 112000,
	[7] = 107000,
	[8] = 111000,
	[9] = 46000,
	[10] = 720000,		-- Gnostica said Archmage poofs in 10 to 15 minutes, so this is probably wrong, but within the range
};

local eventActive = false;
local scriptFailCooldown = false;
local clientsInProximity = 0;
local wave = 0;
local text = 0;
local warder;
local proxTimer;

function TriggerNPCSpawnEvent(event)
	eq.set_proximity(216, 264, -30, 16, -10, 50);
	eventActive = false;
end

function TriggerNPCEnterEvent(e)

	if ( e.other:GetGM() ) then
		return
	end

	TryStartEvent();
end

function TryStartEvent()
	if ( not eventActive and not scriptFailCooldown and eq.get_entity_list():IsMobSpawnedByNpcTypeID(ARCHMAGE_TYPE) ) then

		eventActive = true;
		proxTimer = false;
		wave = 0;
		text = 0;
		clientsInProximity = 1;
		
		eq.set_timer("wave", 100000);
		eq.set_timer("text", 3000);
		eq.set_timer("proximity", PROXIMITY_TIMER);		
	end
end

function EndEvent(victory)
	if ( not victory ) then
		eq.depop_all(GORRAFERG_TYPE);
		eq.debug("Archmage event ended. (failure)");
	else
		eq.debug("Archmage event ended. (victory)");
	end
	warder:Depop();
	wave = 0;
	text = 0;
	proxTimer = false;
	eventActive = false;
	
	if ( scriptFailCooldown ) then
		eq.signal(TRIGGER_NPC_TYPE, 2);
		
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(ARCHMAGE_TYPE) ) then
			eq.spawn_from_spawn2(ARCHMAGE_SPAWN_ID);
		end
	end
end

function CountClientsInRing()
	local clientList = eq.get_entity_list():GetClientList();
	local clients = 0;

	if ( clientList ) then
		for client in clientList.entries do
		
			if ( not client:GetGM() and not client:GetFeigned()
				and client:GetY() > -31 and client:GetY() < 17
				and client:GetX() > 215 and client:GetX() < 265
				and client:GetZ() > -11	and client:GetZ() < 51
			) then
				
				clients = clients + 1;
			end
		end
	end

	return clients;
end

function TriggerNPCTimerEvent(e)

	if ( e.timer == "fail" ) then
		scriptFailCooldown = false;
		eq.stop_timer("fail");
		return;
	end
	
	if ( not eventActive ) then
		eq.stop_timer("wave");
		eq.stop_timer("text");
		eq.stop_timer("proximity");
		eq.stop_timer("end");
		eq.stop_timer("pit");
		return;
	end

	if ( e.timer == "wave" ) then
		
		wave = wave + 1;

		if ( WAVE_TIMES[wave] ) then
			eq.set_timer("wave", WAVE_TIMES[wave]);
		end

		SpawnWave();
		
	elseif ( e.timer == "text" ) then

		if ( text == 0 ) then
			warder = eq.spawn2(WARDER_TYPE, 0, 0, 207, -69, -5, 0); -- a_grimling_warder
		end

		text = text + 1;
		
		if ( ARCHMAGE_TEXT[text] ) then
		
			eq.set_timer("text", ARCHMAGE_TEXT_TIMES[text]);
			
			if ( text == 1 or text == #ARCHMAGE_TEXT ) then
				eq.get_entity_list():GetNPCByNPCTypeID(ARCHMAGE_TYPE):Shout(ARCHMAGE_TEXT[text]);
			else
				eq.get_entity_list():GetNPCByNPCTypeID(ARCHMAGE_TYPE):Say(ARCHMAGE_TEXT[text]);
			end
		end	
	
	elseif ( e.timer == "proximity" ) then
		
		if ( CountClientsInRing() == 0 ) then
		
			if ( proxTimer == false ) then
				eq.set_timer("end", 180000);
				proxTimer = true;
			end
		else
			eq.stop_timer("end");
			proxTimer = false;
		end
		
	elseif ( e.timer == "pit" ) then
	
		local gorraferg = eq.get_entity_list():GetNPCByNPCTypeID(GORRAFERG_TYPE);
		
		if ( gorraferg and gorraferg:GetX() > 345 ) then
			scriptFailCooldown = true;
			EndEvent(); -- gorraferg in pit
		end
		
	elseif ( e.timer == "end" ) then
	
		if ( wave < #WAVE_TIMES ) then
			if ( CountClientsInRing() == 0 ) then
				scriptFailCooldown = true;
				EndEvent(); -- no clients near middle of room for 3 mins
			end
		end
	end
end

function SpawnWave()

	local roll, mobType;
	
	if ( wave < #WAVE_TIMES ) then
		for spawn = 1, 7 do
			roll = math.random(100);
			
			if ( roll < 21 ) then
				mobType = TRASH_TYPES[1];
			elseif ( roll < 41 ) then
				mobType = TRASH_TYPES[2];
			elseif ( roll < 61 ) then
				mobType = TRASH_TYPES[3];
			elseif ( roll < 78 ) then
				mobType = TRASH_TYPES[4];
			elseif ( roll < 87 ) then
				mobType = TRASH_TYPES[5];
			elseif ( roll < 96 ) then
				mobType = TRASH_TYPES[6];
			else
				mobType = TRASH_TYPES[7];
			end
			
			eq.spawn2(mobType, 0, 0, TRASH_COORDS[spawn].x, TRASH_COORDS[spawn].y, TRASH_COORDS[spawn].z, TRASH_COORDS[spawn].h);
		end
	elseif ( wave == #WAVE_TIMES ) then
		eq.spawn2(GORRAFERG_TYPE, 0, 0, 239, -7, 0, 192);
		eq.depop_with_timer(ARCHMAGE_TYPE);
		eq.set_timer("pit", 5000);
	else
		scriptFailCooldown = true;
		EndEvent();		-- took too long to kill boss
	end
end

function TrashEventSpawn(e)
	eq.set_timer("depop", 600000);
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

function TriggerNPCSignalEvent(e)
	if ( e.signal == 1 ) then
		TryStartEvent();
	elseif ( e.signal == 2 ) then	
		eq.set_timer("fail", 2700000);
	end
end

function EliteGuardCombatEvent(e)
	if ( e.joined ) then
		eq.signal(TRIGGER_NPC_TYPE, 1);
	end
end

function event_encounter_load(e)

	-- AMTrigger
	eq.register_npc_event("Archmage", Event.spawn, TRIGGER_NPC_TYPE, TriggerNPCSpawnEvent);
	eq.register_npc_event("Archmage", Event.enter, TRIGGER_NPC_TYPE, TriggerNPCEnterEvent);
	eq.register_npc_event("Archmage", Event.timer, TRIGGER_NPC_TYPE, TriggerNPCTimerEvent);
	eq.register_npc_event("Archmage", Event.signal, TRIGGER_NPC_TYPE, TriggerNPCSignalEvent);

	-- depop timers
	for _, id in ipairs(TRASH_TYPES) do
		eq.register_npc_event("Archmage", Event.combat, id, TrashEventCombat);
		eq.register_npc_event("Archmage", Event.timer, id, TrashEventTimer);
		eq.register_npc_event("Archmage", Event.spawn, id, TrashEventSpawn);
	end
	
	-- ensure TriggerNPCSpawnEvent() executes
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(TRIGGER_NPC_TYPE) ) then
		eq.depop_with_timer(TRIGGER_NPC_TYPE);
	end
	
	eq.register_npc_event("Archmage", Event.combat, ELITE_GUARD_TYPE, EliteGuardCombatEvent);
	
	eq.register_npc_event("Archmage", Event.death_complete, GORRAFERG_TYPE, function() EndEvent(true); end);
end
