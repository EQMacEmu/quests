local INSTANCE_CONTROLLER_TYPE = 223077;	-- _
local EVENTS_CONTROLLER = 223078; 			-- _
local RUBBLE_TYPE = 223030;     			-- a_pile_of_living_rubble
local ASSASSIN_TYPE = 223031;   			-- a_rock_shaped_assassin
local BOSS_TYPE = 223032;					-- Terlok_of_Earth
local MOBS = { RUBBLE_TYPE, ASSASSIN_TYPE, BOSS_TYPE };
local SHADOW_NAME = "Shadow_of_Terlok";

local spawns, kills, assKills, bossStatus;

function EarthSignal(e)
	if ( e.signal == 111 ) then		-- start trial
		spawns = 3;
		kills = 0;
		assKills = 0;
		bossStatus = tonumber(e.data);
		eq.spawn2(RUBBLE_TYPE, 0, 0, 40, 1642, 495.308, 192);
		eq.spawn2(RUBBLE_TYPE, 0, 0, 65, 1608, 496, 192);
		eq.spawn2(RUBBLE_TYPE, 0, 0, 65, 1677, 496, 192);
		
	elseif ( e.signal == 100 ) then		-- depopulate zone
		eq.depop_all(RUBBLE_TYPE);
		eq.depop_all(ASSASSIN_TYPE);
		eq.depop_all(BOSS_TYPE);
	end
end

function CheckVictory()
	if ( kills == spawns ) then
		local elist = eq.get_entity_list();
		
		if ( not elist:IsMobSpawnedByNpcTypeID(BOSS_TYPE) and not elist:IsMobSpawnedByNpcTypeID(RUBBLE_TYPE) ) then
			eq.signal(INSTANCE_CONTROLLER_TYPE, 5, 0, "1");	-- trial success
		end
	end
end

function RubbleDeathComplete(e)
	kills = kills + 1;
	local rng = math.random(2, 4);
	for i = 1, rng do
		eq.spawn2(ASSASSIN_TYPE, 0, 0, math.random(-40, 65), math.random(1600, 1680), 496, 0);
	end
	spawns = spawns + rng;
	CheckVictory();
end

function AssassinDeathComplete(e)
	kills = kills + 1;
	assKills = assKills + 1;
	if ( assKills == 6 ) then
		if ( bossStatus == 1 ) then
			eq.spawn2(BOSS_TYPE, 0, 0, 71, 1646, 500, 192, SHADOW_NAME);
		else
			eq.spawn2(BOSS_TYPE, 0, 0, 71, 1646, 500, 192);
		end
		spawns = spawns + 1;
	end
	CheckVictory();
end

function BossSpawn(e)
	if ( bossStatus == 1 ) then
		e.self:ClearItemList();
	end
end

function BossDeathComplete(e)
	eq.signal(INSTANCE_CONTROLLER_TYPE, 6, 0, "1;1");
	
	kills = kills + 1;
	CheckVictory();
end

function TargetChange(e)
	-- if mob aggros on somebody outside the trial, reset
	if ( e.other and e.other.valid and (e.other:GetY() < 1500 or e.other:GetX() > 100) ) then
		eq.debug(e.self:GetName().." is aggro on player outside of trial ("..e.other:GetName()..")");
		e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		e.self:WipeHateList();
		e.self:Heal();
		e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Phase1Earth", Event.signal, EVENTS_CONTROLLER, EarthSignal);
	eq.register_npc_event("Phase1Earth", Event.death_complete, RUBBLE_TYPE, RubbleDeathComplete);
	eq.register_npc_event("Phase1Earth", Event.death_complete, ASSASSIN_TYPE, AssassinDeathComplete);
	eq.register_npc_event("Phase1Earth", Event.spawn, BOSS_TYPE, BossSpawn);
	eq.register_npc_event("Phase1Earth", Event.death_complete, BOSS_TYPE, BossDeathComplete);
	for _, id in ipairs(MOBS) do
		eq.register_npc_event("Phase1Earth", Event.target_change, id, TargetChange);
	end
end
