local CONTROLLER_TYPE = 200218; -- PusEventStarter
local OVERLORD_TYPE = 200252; -- #Overlord_Banord_Paffa
local BANORD_TYPE = 200020; -- #Banord_Paffa
local FOUL_TYPE = 200242; -- Foul_Pusling (max hit 471)
local CORRUPTED_TYPE = 200233; -- Corrupted_Pusling (max hit 471)

local SPAWNIDS = { 360613, 360628, 360629, 360630, 360631 };
local BANORD_SPAWNID = 360632;

local SPAWN_LOCS = {
	{ 128, -413, -59, 105 },
	{ 116, -431, -58.125, 68 },
	{ 134, -450, -58.125, 7 },
	{ 156, -441, -57.875, 220 },
	{ 154, -418, -59.5, 158 },
};

local wave = 0;
local active = false;

function GetBossMob()
	local mob = eq.get_entity_list():GetMobByNpcTypeID(BANORD_TYPE);
	if ( not mob or not mob.valid ) then
		mob = eq.get_entity_list():GetMobByNpcTypeID(OVERLORD_TYPE);
	end
	if ( mob and mob.valid ) then
		return mob;
	end
	return nil;
end

function ControllerTimer(e)
	
	if ( e.timer == "wave" ) then
	
		wave = wave + 1;
		eq.debug("Paffa event wave "..wave);
		
		local mob = GetBossMob();
		if ( not mob ) then
			eq.stop_timer(e.timer);
			eq.debug("Error: Paffa NPC not found");
			active = false;
			return;
		end

		if ( wave == 3 ) then
			eq.set_timer("depop", 2400000);
			eq.get_entity_list():MessageClose(mob, true, 125, 0, "A loud and maddened scream of rage is heard as Banord prepares to attack.");
			
			eq.unique_spawn(OVERLORD_TYPE, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading());
			eq.depop_with_timer(BANORD_TYPE);
		else
			eq.get_entity_list():MessageClose(mob, true, 125, 0, "A crazed chant echoes through the room as Banord calls for more minions to attack.");
		end
		SpawnWave();
		
	elseif ( e.timer == "depop" ) then
		eq.stop_timer(e.timer);
		
		local mob = GetBossMob();
		if ( not mob ) then
			return;
		end
		eq.get_entity_list():MessageClose(mob, true, 125, 0, "A mocking laugh begins as Banord settles back sated in his lust for power and strength.");
		eq.depop_all(OVERLORD_TYPE);
		eq.debug("Paffa event fail");
		eq.update_spawn_timer(BANORD_SPAWNID, 600000);
		StopEvent();
	end
end

function ControllerSignal(e)
	local mob = GetBossMob();
	if ( not mob ) then
		return;
	end
	eq.debug("Paffa event start");
	active = true;
	eq.set_timer("wave", 234000);
	eq.get_entity_list():MessageClose(mob, true, 125, 0, "A deep voice bellows from just ahead saying, 'Come fools see if you can match the power of Banord and his puslings.  Puslings come your master has need of you!' Wretched howls of the twisted puslings begin to echo throughout the room.");
	local elist = eq.get_entity_list();
	for _, id in ipairs(SPAWNIDS) do
		elist:GetSpawnByID(id):Disable(false);
	end
end

function BanordSpawn(e)
	eq.set_proximity(75, 180, -475, -390, -100, 0);
	wave = 0;
	active = false;
end

function BanordEnter(e)
	if ( active or e.other:GetGM() ) then
		return
	end
	eq.signal(CONTROLLER_TYPE, 1);
end

function SpawnWave()
	local t;
	for _, l in ipairs(SPAWN_LOCS) do
		if ( math.random() < 0.25 ) then
			t = CORRUPTED_TYPE;
		else
			t = FOUL_TYPE;
		end
		eq.spawn2(t, 0, 0, l[1], l[2], l[3], l[4]);
	end
end

function StopEvent(e)
	if ( e ) then
		eq.debug("Paffa event success");
	end
	eq.depop_all(CORRUPTED_TYPE);
	eq.depop_all(FOUL_TYPE);
	eq.stop_timer("wave", eq.get_entity_list():GetMobByNpcTypeID(CONTROLLER_TYPE));
	active = false;
	local elist = eq.get_entity_list();
	for _, id in ipairs(SPAWNIDS) do
		eq.update_spawn_timer(id, math.random(60, 200)*1000);
		elist:GetSpawnByID(id):Enable();
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Paffa", Event.timer, CONTROLLER_TYPE, ControllerTimer);
	eq.register_npc_event("Paffa", Event.signal, CONTROLLER_TYPE, ControllerSignal);
	eq.register_npc_event("Paffa", Event.spawn, BANORD_TYPE, BanordSpawn);
	eq.register_npc_event("Paffa", Event.enter, BANORD_TYPE, BanordEnter);
	eq.register_npc_event("Paffa", Event.death_complete, OVERLORD_TYPE, StopEvent);
end
