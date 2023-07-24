local WAVE_TIMER = 130000; -- oldEQ/AK timer was ~130 seconds.  Live is ~98 seconds

local CONTROLLER_TYPE = 201510; -- #Event_Burning_Control
local TRIBUNAL_TYPE = 201508; -- The_Tribunal
local THE_FLAME_TYPE = 201509; -- The_flame

local FIEND_TYPE = 201476; -- fiend_of_flame
local SPIRIT_TYPE = 201488; -- spirit_of_flame
local NEMESIS_TYPE = 201450; -- #a_burning_nemesis
local AGGRESSOR_TYPE = 201459; -- #a_fiery_aggressor
local BOSS_TYPE = 201486; -- #Punisher_of_Flame
local MOBS = { FIEND_TYPE, SPIRIT_TYPE, NEMESIS_TYPE, AGGRESSOR_TYPE, BOSS_TYPE };

local WAVE_SPAWN_COORDS = {
	{ x = 879, y = -661 },
	{ x = 833, y = -683 },
	{ x = 811, y = -730 },
	{ x = 834, y = -775 },
	{ x = 881, y = -798 },
	{ x = 925, y = -773 },
	{ x = 949, y = -728 },
	{ x = 926, y = -681 }
};

local flame, spell;

function ControllerSpawn(e)
	eq.set_timer("wave", 26000);
	eq.set_timer("flame", 28000);
	flame = eq.spawn2(THE_FLAME_TYPE, 0, 0, 880, -727, 55.753, 0);
	wave = 0;
	killed = 0;
	spell = 1;
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
		
	elseif ( e.timer == "flame" ) then
		if ( spell == 1 ) then
			flame:CastSpell(1281, e.self:GetID()); -- Searing Heat
			spell = 2;
		else
			flame:CastSpell(1131, e.self:GetID()); -- Wave of Heat
			spell = 1;
		end
	end
end

function SpawnWave()
	local typeRoll, spawnRoll, mob;
	local count = 1;
	local spawns = {};
	
	while ( count < 5 ) do
	
		spawnRoll = math.random(1, 8);
		
		if ( not spawns[spawnRoll] ) then
		
			typeRoll = math.random(0, 99);
			if ( typeRoll < 47 ) then
				spawns[spawnRoll] = FIEND_TYPE;
			elseif ( typeRoll < 94 ) then
				spawns[spawnRoll] = SPIRIT_TYPE;
			elseif ( typeRoll < 97 ) then
				spawns[spawnRoll] = NEMESIS_TYPE;
			else
				spawns[spawnRoll] = AGGRESSOR_TYPE;
			end
			count = count + 1;
		end
	end
	
	for i = 1, 8 do
		if ( spawns[i] ) then
			mob = eq.spawn2(spawns[i], 0, 0, WAVE_SPAWN_COORDS[i].x, WAVE_SPAWN_COORDS[i].y, 56, 0);
			mob:CastToNPC():MoveTo(880, -730, 56.37, -1, true);
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
	if ( wave == 4 and killed >= 16 ) then
		eq.unique_spawn(BOSS_TYPE, 0, 0, 885, -725, 58.251, 0);
	end
end

function WaypointArrive(e)
	e.self:CastSpell(3610, e.self:GetID()); -- Unfold Fletching Kit; Live does this; I assume this is just for the animation/effect? or Sony dev used wrong spell id
	eq.get_entity_list():MessageClose(e.self, true, 200, 0, "Flames burst forth from the stake!");
end

function BossDeath(e)
	eq.signal(TRIBUNAL_TYPE, 12);

	eq.depop_all(CONTROLLER_TYPE);
	eq.depop_all(THE_FLAME_TYPE);
	wave = 0;
end

function TrialFail()
	eq.signal(TRIBUNAL_TYPE, 6);
	
	eq.depop_all(CONTROLLER_TYPE);
	eq.depop_all(THE_FLAME_TYPE);
	wave = 0;
end

function event_encounter_load(e)
	eq.register_npc_event("BurningTrial", Event.spawn, CONTROLLER_TYPE, ControllerSpawn);
	eq.register_npc_event("BurningTrial", Event.timer, CONTROLLER_TYPE, ControllerTimer);
	
	eq.register_npc_event("BurningTrial", Event.death, BOSS_TYPE, BossDeath);

	for _, id in ipairs(MOBS) do
		eq.register_npc_event("BurningTrial", Event.spawn, id, MobSpawn);
		eq.register_npc_event("BurningTrial", Event.timer, id, MobTimer);
		eq.register_npc_event("BurningTrial", Event.combat, id, MobCombat);
		if ( id ~= BOSS_TYPE ) then
			eq.register_npc_event("BurningTrial", Event.death, id, MobDeath);
			eq.register_npc_event("BurningTrial", Event.waypoint_arrive, id, WaypointArrive);
		end
	end
end
