local WAVE_TIMER = 172000; -- oldEQ/AK timer was ~172 seconds.  Live is ~123 seconds

local CONTROLLER_TYPE = 201514; -- #Event_Torture_Control
local TRIBUNAL_TYPE = 201508; -- The_Tribunal
local PRISONER_TYPE = 201505; -- a_tortured_prisoner
local PAIN_AND_SUFFERING_TYPE = 201506; -- Pain_and_Suffering
local RELIEF_TYPE = 201507; -- Relief

local WRAITH_TYPE = 201495; -- wraith_of_agony
local NEMESIS_TYPE = 201481; -- nemesis_of_pain
local TWISTED_TYPE = 201473; -- a_twisted_tormentor
local NEMESIS_NAMED_TYPE = 201480; -- #nemesis_of_despair
local ACCURSED_TYPE = 201474; -- #an_accursed_tormentor
local BOSS_TYPE = 201487; -- #Punisher_Veshtaq
local MOBS = { WRAITH_TYPE, TWISTED_TYPE, NEMESIS_TYPE, NEMESIS_NAMED_TYPE, ACCURSED_TYPE, BOSS_TYPE };

local PRISONER_SPAWN_COORDS = {
	{ x = 905, y = -1157, h = 223 },
	{ x = 832, y = -1158, h = 32 },
	{ x = 833, y = -1085, h = 95 },
	{ x = 906, y = -1084, h = 159 }
};
local PAIN_SPAWN_COORDS = {
	{ x = 913, y = -1164 },
	{ x = 826, y = -1163 },
	{ x = 826, y = -1078 },
	{ x = 911, y = -1079 }
};
local WAVE_SPAWN_COORDS = {
	{
		{ x = 883, y = -1012, h = 128 },
		{ x = 854, y = -1013, h = 128 },
	},
	{
		{ x = 881, y = -1228, h = 0 },
		{ x = 856, y = -1224, h = 0 },
	},
};

local wave, killed;
local waveSpawnIds = { [1] = {}, [2] = {}, [3] = {}, [4] = {} };
local prisonerTable = { [1] = {}, [2] = {}, [3] = {}, [4] = {} };

function ControllerSpawn(e)
	eq.set_timer("wave", 26000);
	wave = 0;
	killed = 0;
	for i = 1, 4 do
		for j = 1, 4 do
			waveSpawnIds[i][j] = nil;
		end
	end
end

function ControllerTimer(e)

	if ( e.timer == "wave" ) then
		wave = wave + 1;
		local prisoner, pain;

		if ( wave == 4 ) then
			eq.stop_timer("wave");			
		else
			eq.set_timer("wave", WAVE_TIMER);
			
			if ( wave == 1 ) then
			
				eq.spawn2(RELIEF_TYPE, 0, 0, 871, -1123, 58.751, 0);
				
				for i = 1, 4 do
					prisoner = eq.spawn2(PRISONER_TYPE, 0, 0, PRISONER_SPAWN_COORDS[i].x, PRISONER_SPAWN_COORDS[i].y, 58.126, PRISONER_SPAWN_COORDS[i].h);
					pain = eq.spawn2(PAIN_AND_SUFFERING_TYPE, 0, 0, PAIN_SPAWN_COORDS[i].x, PAIN_SPAWN_COORDS[i].y, 58.751, 0);
					pain:SetSkill(10, 10); -- bash; logs showed they used these
					pain:SetSkill(30, 10); -- kick
					--pain:AddToHateList(prisoner);
					prisonerTable[i][1] = prisoner;
					prisonerTable[i][2] = pain;
				end
			end
		end
		
		for i = 1, 4 do
			prisoner, pain = prisonerTable[i][1], prisonerTable[i][2];
			if ( prisoner and prisoner.valid ) then
				pain:AddToHateList(prisoner); -- doing this every wave because of the 10 minute timer
			end
		end
		SpawnWave();
	end
end

function SpawnWave()
	local t, roll, mob, coords;
	local count = 1;
	
	for i = 1, 2 do
		for j = 1, 2 do
			coords = WAVE_SPAWN_COORDS[i][j];
			
			roll = math.random(0, 99);
			if ( roll < 47 ) then
				t = TWISTED_TYPE;
			elseif ( roll < 94 ) then
				t = NEMESIS_TYPE;
			elseif ( roll < 97 ) then
				t = NEMESIS_NAMED_TYPE;
			else
				t = ACCURSED_TYPE;
			end
			mob = eq.spawn2(t, 0, 0, coords.x, coords.y, 73.75, coords.h);
			mob:CastToNPC():MoveTo(875, -1120, 60, -1, true);
			waveSpawnIds[wave][count] = mob:GetID();
			count = count + 1;
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
	local isWraith;
	killed = killed + 1;

	if ( e.self:GetNPCTypeID() == WRAITH_TYPE ) then
		isWraith = true;
		local relief = eq.get_entity_list():GetMobByNpcTypeID(RELIEF_TYPE);
		if ( relief.valid ) then
			relief:CastSpell(1130, relief:GetID());
		end
	end
	
	if ( wave == 4 and killed >= 19 ) then
		eq.depop_all(RELIEF_TYPE);
		eq.depop_all(PRISONER_TYPE);
		eq.depop_all(PAIN_AND_SUFFERING_TYPE);
		prisonerTable[1] = {}; prisonerTable[2] = {}; prisonerTable[3] = {}; prisonerTable[4] = {};
		eq.unique_spawn(BOSS_TYPE, 0, 0, 887, -1121, 60, 64);
		
	elseif ( not isWraith and wave < 4 and wave > 0 ) then
		local inWave;
		local myId = e.self:GetID();
		
		for i = 1, 4 do
			for j = 1, 4 do
			
				if ( waveSpawnIds[i][j] and waveSpawnIds[i][j] == myId ) then
					inWave = true;
					waveSpawnIds[i][j] = nil;
				end
			end
			if ( inWave ) then
				inWave = false;
				if ( not waveSpawnIds[i][1] and not waveSpawnIds[i][2] and not waveSpawnIds[i][3] and not waveSpawnIds[i][4] ) then
					if ( math.random(0, 99) < 50 ) then
						eq.spawn2(WRAITH_TYPE, 0, 0, 887, -1121, 58, 64);
					else
						eq.spawn2(WRAITH_TYPE, 0, 0, 723, -1119, 88, 64);
					end
				end
			end
		end
	end
end

function BossDeath(e)
	eq.signal(TRIBUNAL_TYPE, 10);

	eq.depop_all(CONTROLLER_TYPE);
	wave = 0;
end

function TrialFail()
	eq.signal(TRIBUNAL_TYPE, 4);
	
	eq.depop_all(CONTROLLER_TYPE);
	eq.depop_all(RELIEF_TYPE);
	eq.depop_all(PRISONER_TYPE);
	eq.depop_all(PAIN_AND_SUFFERING_TYPE);
	prisonerTable[1] = {}; prisonerTable[2] = {}; prisonerTable[3] = {}; prisonerTable[4] = {};
	wave = 0;
end

function event_encounter_load(e)
	eq.register_npc_event("TortureTrial", Event.spawn, CONTROLLER_TYPE, ControllerSpawn);
	eq.register_npc_event("TortureTrial", Event.timer, CONTROLLER_TYPE, ControllerTimer);
	
	eq.register_npc_event("TortureTrial", Event.death, PRISONER_TYPE, TrialFail);
	eq.register_npc_event("TortureTrial", Event.death, BOSS_TYPE, BossDeath);
	eq.register_npc_event("TortureTrial", Event.death, WRAITH_TYPE, WraithDeath);

	for _, id in ipairs(MOBS) do
		eq.register_npc_event("TortureTrial", Event.spawn, id, MobSpawn);
		eq.register_npc_event("TortureTrial", Event.timer, id, MobTimer);
		eq.register_npc_event("TortureTrial", Event.combat, id, MobCombat);
		if ( id ~= BOSS_TYPE ) then
			eq.register_npc_event("TortureTrial", Event.death, id, MobDeath);
		end
	end
end
