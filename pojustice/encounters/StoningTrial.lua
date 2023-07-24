local WAVE_TIMER = 170000; -- oldEQ/AK timer was ~2:50-2:55.  Live is ~2:03

local CONTROLLER_TYPE = 201513; -- #Event_Stoning_Control
local TRIBUNAL_TYPE = 201508; -- The_Tribunal
local PITILESS_TYPE = 201475; -- a_pitiless_avenger
local ACCUSED_TYPE = 201504; -- an_accused_prisoner

local RELENTLESS_TYPE = 201464; -- a_relentless_punisher
local SHADOW_TYPE = 201469; -- a_shadow_grinder
local NEMESIS_TYPE = 201482; -- #nemesis_of_stone
local RUTHLESS_TYPE = 201465; -- #a_ruthless_grinder
local BOSS_TYPE = 201496; -- #Yurae_Zhaleem
local MOBS = { RELENTLESS_TYPE, SHADOW_TYPE, NEMESIS_TYPE, RUTHLESS_TYPE, BOSS_TYPE };

local ACCUSED_COORDS = {
	{ x = -89, y = -1044 },
	{ x = -130, y = -1045 },
	{ x = -171, y = -1044 },
};
local WAVE_SPAWN_COORDS = {
	{
		{ x = -17, y = -1098 },
		{ x = -18, y = -1136 },
	},
	{
		{ x = -109, y = -1233 },
		{ x = -148, y = -1230 },
	},
	{
		{ x = -242, y = -1135 },
		{ x = -242, y = -1104 },
	}
};

local wave, killed, spawned;
local accusedNpcs = {};

function ControllerSpawn(e)
	eq.set_timer("wave", 26000);
	wave = 0;
	killed = 0;
	spawned = 0;
	
	for i = 1, 3 do
		accusedNpcs[i] = eq.spawn2(ACCUSED_TYPE, 0, 0, ACCUSED_COORDS[i].x, ACCUSED_COORDS[i].y, 72.19, 128);
	end
end

function ControllerTimer(e)

	if ( e.timer == "wave" ) then
		wave = wave + 1;
		
		if ( wave == 4 ) then
			eq.stop_timer("wave");
		else
			eq.set_timer("wave", WAVE_TIMER);
		end
		SpawnWave();
		spawned = spawned + 4;
	end
end

function SpawnWave()
	local t, roll, room, lastRoom, mob, coords;
	
	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(PITILESS_TYPE) ) then
		mob = eq.spawn2(PITILESS_TYPE, 0, 0, -74, -1183, 73.31, 0);
		for i = 1, 3 do
			mob:AddToHateList(accusedNpcs[i], 20);
		end
		mob = eq.spawn2(PITILESS_TYPE, 0, 0, -184, -1183, 73.31, 0);
		for i = 3, 1, -1 do
			mob:AddToHateList(accusedNpcs[i], 20);
		end
	end
	
	for i = 1, 2 do
		room = math.random(1, 3);
		if ( i == 2 and room == lastRoom ) then
			room = lastRoom + 1;
			if ( room == 4 ) then
				room = 1;
			end
		end
		lastRoom = room;
		
		for j = 1, 2 do
			coords = WAVE_SPAWN_COORDS[room][j];
			
			roll = math.random(0, 99);
			if ( roll < 47 ) then
				t = RELENTLESS_TYPE;
			elseif ( roll < 94 ) then
				t = SHADOW_TYPE;
			elseif ( roll < 97 ) then
				t = NEMESIS_TYPE;
			else
				t = RUTHLESS_TYPE;
			end
			mob = eq.spawn2(t, 0, 0, coords.x, coords.y, 73.75, 0);
			mob:CastToNPC():MoveTo(-130, -1120, 73.75, -1, true);
		end
	end
end

function MobSpawn(e)
	eq.set_timer("depop", 60000);
end

function MobTimer(e)
	if ( wave > 0 ) then
		TrialFail();
	end
	wave = 0;
	eq.depop();
end

function MobCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function MobDeath(e)
	killed = killed + 1;
	if ( killed == spawned ) then
		eq.depop_all(PITILESS_TYPE);
		if ( wave == 4 ) then
			eq.unique_spawn(BOSS_TYPE, 0, 0, -130, -1120, 75, 128);
		end
	end
end

function BossDeath(e)
	eq.signal(TRIBUNAL_TYPE, 9);

	eq.depop_all(CONTROLLER_TYPE);
	eq.depop_all(PITILESS_TYPE);
	eq.depop_all(ACCUSED_TYPE);
	wave = 0;
end

function TrialFail()
	eq.signal(TRIBUNAL_TYPE, 3);
	
	eq.depop_all(CONTROLLER_TYPE);
	eq.depop_all(PITILESS_TYPE);
	eq.depop_all(ACCUSED_TYPE);
	wave = 0;
end

function AccusedDeath(e)
	eq.get_entity_list():MessageClose(e.self, true, 200, 0, "The prisoner collapses and lies still, no longer shielding herself from the stones.  You have failed.");
	TrialFail();
end

function event_encounter_load(e)
	eq.register_npc_event("StoningTrial", Event.spawn, CONTROLLER_TYPE, ControllerSpawn);
	eq.register_npc_event("StoningTrial", Event.timer, CONTROLLER_TYPE, ControllerTimer);
	
	eq.register_npc_event("StoningTrial", Event.death, ACCUSED_TYPE, AccusedDeath);
	eq.register_npc_event("StoningTrial", Event.death, BOSS_TYPE, BossDeath);

	for _, id in ipairs(MOBS) do
		eq.register_npc_event("StoningTrial", Event.spawn, id, MobSpawn);
		eq.register_npc_event("StoningTrial", Event.timer, id, MobTimer);
		eq.register_npc_event("StoningTrial", Event.combat, id, MobCombat);
		if ( id ~= BOSS_TYPE ) then
			eq.register_npc_event("StoningTrial", Event.death, id, MobDeath);
		end
	end
end
