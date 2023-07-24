local WAVE_TIMER = 192000; -- oldEQ/AK timer was 3:12.  Live is 2:15

local CONTROLLER_TYPE = 201512; -- #Event_Lashing_Control
local TRIBUNAL_TYPE = 201508; -- The_Tribunal
local OGRE_TYPE = 201502; -- a_tormented_prisoner
local SPIRIT1_TYPE = 201503; -- a_flickering_spirit (level 15, 450 hp)
local SPIRIT2_TYPE = 201516; -- a_flickering_spirit (level 30, 7000 hp)

local LASHER_TYPE = 201466; -- a_savage_lasher
local LASHER_RARE_TYPE = 201462; -- #a_harrowing_lasher
local PUNISHER_TYPE = 201463; -- a_malevolent_punisher
local PUNISHER_RARE_TYPE = 201472; -- #a_stinging_nemesis
local SCOURGE_TYPE = 201467; -- a_scourge_of_honor
local BOSS_TYPE = 201479; -- #Lashman_Azakal
local MOBS = { LASHER_TYPE, LASHER_RARE_TYPE, PUNISHER_TYPE, PUNISHER_RARE_TYPE, SCOURGE_TYPE, BOSS_TYPE };

local WAVE_SPAWN_COORDS = {
	{ x = 1402, y = -1179, z = 3, moveX = 1402, moveY = -1129, moveZ = 3 },
	{ x = 1357, y = -1061, z = 3, moveX = 1357, moveY = -1111, moveZ = 3 },
	{ x = 1357, y = -1179, z = 3, moveX = 1357, moveY = -1129, moveZ = 3 },
	{ x = 1402, y = -1060, z = 3, moveX = 1402, moveY = -1111, moveZ = 3 }
};
local SPIRIT_COORDS = {
	{ x = 1298, y = -1169, z = -13.247 },
	{ x = 1296, y = -1071, z = -13.247 },
	{ x = 1155, y = -1119, z = 88.751 }
};
local OGRE_COORDS = {
	{ x = 1417, y = -1071, z = -3.5 },
	{ x = 1417, y = -1120, z = -3.5 },
	{ x = 1412, y = -1168, z = -3.5 },
};

local wave;
local killed;
local scourges;
local scourgeSpirit = {};		-- keep track of entity IDs for the scourges and 'fake' spirits to remove when real one is killed

function ControllerSpawn(e)
	eq.set_timer("wave", 26000);
	
	for i = 1, 3 do
		eq.spawn2(OGRE_TYPE, 0, 0, OGRE_COORDS[i].x, OGRE_COORDS[i].y, OGRE_COORDS[i].z, 192);
	end
	wave = 0;
	killed = 0;
	scourges = 0;
end

function ControllerTimer(e)

	if ( e.timer == "wave" ) then
		wave = wave + 1;
		
		if ( wave == 4 ) then
			eq.stop_timer("wave");
		else
			eq.set_timer("wave", WAVE_TIMER);
		end
		eq.set_timer("scourge", math.random(30, 60)*1000);
		SpawnWave();

	elseif (e.timer == "scourge") then
		eq.stop_timer("scourge");
		SpawnScourge();
	end
end

function SpawnWave()
	local t, roll, mob;
	
	for _, coords in ipairs(WAVE_SPAWN_COORDS) do
		roll = math.random(0, 99);
		if ( roll < 47 ) then
			t = LASHER_TYPE;
		elseif ( roll < 94 ) then
			t = PUNISHER_TYPE;
		elseif ( roll < 97 ) then
			t = LASHER_RARE_TYPE;
		else
			t = PUNISHER_RARE_TYPE;
		end
		mob = eq.spawn2(t, 0, 0, coords.x, coords.y, coords.z, 0);
		mob:CastToNPC():MoveTo(coords.moveX, coords.moveY, coords.moveZ, -1, true);
	end
end

function SpawnScourge()
	local spirit1, scourge, spirit2;
	local scourgeSpiritLoc = math.random(1, 3);
	local locs = { [1] = math.random(1,3) };
		
	locs[2] = locs[1];
	while (locs[2] == locs[1]) do
		locs[2] = math.random(1, 3);
	end
	
	locs[3] = locs[1];
	while (locs[3] == locs[1] or locs[3] == locs[2]) do
		locs[3] = math.random(1, 3);
	end		
	
	for i, loc in ipairs(locs) do
		
		if ( i == 1 ) then
			spirit2 = eq.spawn2(SPIRIT2_TYPE, 0, 0, SPIRIT_COORDS[loc].x, SPIRIT_COORDS[loc].y, SPIRIT_COORDS[loc].z, 0);
			scourge = eq.spawn2(SCOURGE_TYPE, 0, 0, 1334, -1119, 1.126, 64);
			scourgeSpirit[spirit2:GetID()] = { scourge:GetID() };
		else
			spirit1 = eq.spawn2(SPIRIT1_TYPE, 0, 0, SPIRIT_COORDS[loc].x, SPIRIT_COORDS[loc].y, SPIRIT_COORDS[loc].z, 0);
			table.insert(scourgeSpirit[spirit2:GetID()], spirit1:GetID());
		end
	end
end

function TrialFail()
	eq.signal(TRIBUNAL_TYPE, 1);
	
	eq.depop_all(CONTROLLER_TYPE);
	eq.depop_all(OGRE_TYPE);
	eq.depop_all(SPIRIT1_TYPE);
	eq.depop_all(SPIRIT2_TYPE);
	
	scourgeSpirit = {};
end

function Spirit2Death(e)
	local depopIds = scourgeSpirit[e.self:GetID()];
	local mob;
	if ( depopIds ) then
		for _, id in ipairs(depopIds) do
			mob = eq.get_entity_list():GetMob(id);
			if ( mob:GetNPCTypeID() == SCOURGE_TYPE or mob:GetNPCTypeID() == SPIRIT1_TYPE ) then
				mob:Depop();
			end
		end
		scourgeSpirit[e.self:GetID()] = nil;
	end
	eq.depop_all(SCOURGE_TYPE); -- killing a 7k hp spirit removes all scourges, but not all the extra spirits
	scourges = 0;
	
	if ( wave == 4 and scourges == 0 ) then
		eq.unique_spawn(BOSS_TYPE, 0, 0, 1334, -1119, 1.126, 64);
	end
end

function BossDeath(e)
	eq.signal(TRIBUNAL_TYPE, 7);

	eq.depop_all(CONTROLLER_TYPE);
	eq.depop_all(OGRE_TYPE);
	eq.depop_all(SPIRIT1_TYPE);
	eq.depop_all(SPIRIT2_TYPE);
	eq.depop_all(SCOURGE_TYPE);
	
	scourgeSpirit = {};
	wave = 0;
end

function OgreDeath(e)
	eq.get_entity_list():MessageClose(e.self, true, 200, 0, "The prisoner's screams cut off suddenly as he topples over, dead. You have failed.");
	TrialFail();
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
end

function event_encounter_load(e)
	eq.register_npc_event("LashingTrial", Event.spawn, CONTROLLER_TYPE, ControllerSpawn);
	eq.register_npc_event("LashingTrial", Event.timer, CONTROLLER_TYPE, ControllerTimer);
	
	eq.register_npc_event("LashingTrial", Event.death, OGRE_TYPE, OgreDeath);
	eq.register_npc_event("LashingTrial", Event.death, SPIRIT2_TYPE, Spirit2Death);
	eq.register_npc_event("LashingTrial", Event.death, BOSS_TYPE, BossDeath);

	for _, id in ipairs(MOBS) do
		eq.register_npc_event("LashingTrial", Event.spawn, id, MobSpawn);
		eq.register_npc_event("LashingTrial", Event.timer, id, MobTimer);
		eq.register_npc_event("LashingTrial", Event.combat, id, MobCombat);
		if ( id ~= SCOURGE_TYPE and id ~= BOSS_TYPE ) then
			eq.register_npc_event("LashingTrial", Event.death, id, MobDeath);
		end
	end
end
