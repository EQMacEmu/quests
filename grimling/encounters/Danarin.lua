local GOVERNOR_TYPE = 167604;		-- GovernorTwo
local TOWN_CAT_TYPE = 167202;		-- Scout_Danarin
local TOWN_CAT_SPAWNID = 334759;
local WALKING_CAT_TYPE = 167035;	-- #Scout_Danarin 
local ROOTED_CAT_TYPE = 167681;		-- ##Scout_Danarin 
local FLAG_ID = 69;

local OFFICER_TYPE = 167032;
local FIGHTR_TYPE = 167030;
local MANACRAFTER_TYPE = 167027;
local DEATHBRINGER_TYPE = 167029;	-- this is a warrior.  Sony design error?
local PRIEST_TYPE = 167678;
local CADAVERIST_TYPE = 167028;
local HERBALIST_TYPE = 167680;

local GRIMLING_TYPES = { OFFICER_TYPE, FIGHTR_TYPE, MANACRAFTER_TYPE, DEATHBRINGER_TYPE, PRIEST_TYPE, CADAVERIST_TYPE, HERBALIST_TYPE };

local CAMP_SPAWN_IDS = { 335007, 335008, 335009, 335010, 335011, 335012, 335013, 335014, 335015, 335016 };

local SPAWNS = {		-- these NPCs are level 23-27
	{
		x = 360, y = -1042, z = 11,					-- 1:00
		types = { FIGHTR_TYPE, MANACRAFTER_TYPE, DEATHBRINGER_TYPE, PRIEST_TYPE },
		grid = 25		-- x:455, y:-1215, z:10
	},
	{
		x = 319, y = -1365, z = 45,					-- 4:30
		types = { FIGHTR_TYPE, MANACRAFTER_TYPE, DEATHBRINGER_TYPE },
		grid = 25		-- x:455, y:-1215, z:10
	},
	{
		x = 593, y = -1315, z = 34,					-- 7:30
		types = { FIGHTR_TYPE, MANACRAFTER_TYPE, DEATHBRINGER_TYPE, PRIEST_TYPE, CADAVERIST_TYPE, HERBALIST_TYPE },
		grid = 25		-- x:455, y:-1215, z:10
	},
	{
		x = 549, y = -1101, z = 8,					-- 10:30
		types = { FIGHTR_TYPE, MANACRAFTER_TYPE, DEATHBRINGER_TYPE, PRIEST_TYPE, CADAVERIST_TYPE },
		grid = 25		-- x:455, y:-1215, z:10
	},
};

local victory = false;

function SignalEvent(e)

	if ( e.signal == 1 ) then
	
		local cat = eq.get_entity_list():GetNPCByNPCTypeID(WALKING_CAT_TYPE);
		eq.spawn2(ROOTED_CAT_TYPE, 0, 0, cat:GetX(), cat:GetY(), cat:GetZ(), cat:GetHeading());
		eq.depop_all(WALKING_CAT_TYPE);
		eq.set_timer("start", 30000);
		FlipFlags(true);
		eq.spawn_condition("grimling", 2, 0);		-- disable camp respawns
		
	elseif ( e.signal == 2 ) then
		eq.stop_timer("wave");
		FlipFlags(false);
		eq.spawn_condition("grimling", 2, 1);		-- enable camp respawns
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(TOWN_CAT_TYPE) ) then
			if ( victory ) then
				eq.get_entity_list():GetSpawnByID(TOWN_CAT_SPAWNID):SetTimer(1);
				victory = false;
			end
		end
		
	elseif ( e.signal == 3 ) then
		DepopCamps();
		eq.set_timer("repop", 1000);
	end
end

function TimerEvent(e)
	if ( e.timer == "wave" ) then
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(ROOTED_CAT_TYPE) ) then
			SpawnWave();
		else
			eq.stop_timer("wave");
		end
	elseif ( e.timer == "start" ) then
		eq.stop_timer("start");
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(ROOTED_CAT_TYPE) ) then
			SpawnWave();
			eq.set_timer("wave", 100000 + math.random(1, 10) * 1000);
		end		
	elseif ( e.timer == "repop" ) then
		eq.stop_timer("repop");
		RepopCamps();
	end
end

-- returns a table of a random number of integers from 1 to range with no more than 2 of the same number
function GetRandomsMaxTwo(range, num)
	local t = {};
	local roll, found;
	repeat
		roll = math.random(1, range);
		found = 0;
		for i = 1, #t do
			if ( t[i] == roll ) then
				found = found + 1;
			end
		end
		if ( found < 2 ) then
			table.insert(t, roll);
		end
	until #t == num;
	return t;
end

function SpawnWave()
	local spawn, spawnType, mob, officerSpawn;
	local t = GetRandomsMaxTwo(#SPAWNS, math.random(2, 5));
	
	if ( math.random(100) <= 5 ) then
		officerSpawn = math.random(1, #t);
	end
	
	for idx, spawnPoint in ipairs(t) do
		spawn = SPAWNS[spawnPoint];
		
		if ( officerSpawn == idx ) then
			spawnType = OFFICER_TYPE;
		else
			spawnType = spawn.types[math.random(1, #spawn.types)];
		end
		
		mob = eq.spawn2(spawnType, spawn.grid, 0, spawn.x, spawn.y, spawn.z, 0);
		mob:SetRunning(true);
	end
	
	-- keep town cat timer at 30 minutes so it doesn't respawn mid-event
	eq.get_entity_list():GetSpawnByID(TOWN_CAT_SPAWNID):SetTimer(1800000);
end

function DanarinDeath(e)
	e.self:Shout("The evil ones have overcome us! I journey now to the spirit realm of our ancestors.");
	eq.signal(GOVERNOR_TYPE, 2);
end

function DanarinWaypointArrive(e)
	if ( e.wp == 3 ) then
		e.self:Say("As we approach the camp it's important that we remain silent. I'm sure you're aware of the advantages we gain with the element of surprise.");
	elseif ( e.wp == 6 ) then
		e.self:Say("Here we are, now half of you stay here with me and the other half quietly swing around to the ledge south of the camp. Make your final preparations and wait for my command. It is vitally important that I stay alive, the camp will fall to the grimlings if I am slain. Fight well friends.");
	elseif ( e.wp == 9 ) then
		eq.signal(GOVERNOR_TYPE, 1);
	end
end

function DanarinWaypointDepart(e)
	if ( e.wp == 6 ) then
		e.self:Shout("For the honor of the Vah Shir, Attack!");
		e.self:SetRunning(true);
		eq.signal(GOVERNOR_TYPE, 3);
	end
end

function DanarinTimer(e)
	if ( e.timer == "depop" ) then
		eq.stop_timer("depop");
		eq.depop();
		
	elseif ( e.timer == "pause" ) then
		eq.stop_timer("pause");
		eq.set_timer("depop", 8000);
		e.self:SetRunning(true);
		e.self:MoveTo(261, -985, 7.2, 227, true);
	end
end

function DanarinTrade(e)
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, {item1 = 4374}, 0) ) then -- Grimling Officer's Tooth
		e.self:Say("Congratulations "..e.other:GetCleanName()..", this medal signifies that you have successfully completed a raid on this encampment. Continue conducting missions like this and we're certain to prevail over the enemy. Leave now, as this place will fall again into the hands of the enemy. May the spirits grant you good fortune!");		
		e.other:QuestReward(e.self,0,0,0,0,4375,5000); -- Silver Lined Copper Medal of War
		
		victory = true;
		eq.signal(GOVERNOR_TYPE, 2);
		
		-- spawn a non-rooted cat that runs away
		local mob = eq.spawn2(WALKING_CAT_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
		mob:SetSpecialAbility(24, 1);
		mob:SetSpecialAbility(25, 1);
		mob:SetSpecialAbility(35, 1);
		mob:SetBodyType(11, false);
		eq.set_timer("pause", 3000, mob);
		
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- true == cat, false == grimling
function FlipFlags(state)
	
	local door;

	door = eq.get_entity_list():GetDoorsByDoorID(FLAG_ID);
	if ( door ) then
		if ( state ) then
			door:ForceOpen(eq.get_entity_list():GetMobByNpcTypeID(GOVERNOR_TYPE));
		else
			door:ForceClose(eq.get_entity_list():GetMobByNpcTypeID(GOVERNOR_TYPE));
		end
	end
end

function DepopCamps()
	
	local npcList = eq.get_entity_list():GetNPCList();
	
	if ( npcList ) then
	
		local campHashMap = {};
		for _, id in ipairs(CAMP_SPAWN_IDS) do
			campHashMap[id] = true;
		end
	
		for npc in npcList.entries do

			if ( npc.valid and campHashMap[npc:GetSpawnPointID()] ) then
				npc:Depop(true);	-- depop with timer
			end
		end
	end
end

function RepopCamps()

	local elist = eq.get_entity_list();
	
	for _, id in ipairs(CAMP_SPAWN_IDS) do
		--eq.spawn_from_spawn2(id);
		elist:GetSpawnByID(id):SetTimer(1);
	end
end

function GrimlingSpawn(e)
	eq.set_timer("depop", 600000);
end

function GrimlingTimer(e)
	eq.depop();
end

function GrimlingCombat(e)
	if ( e.joined ) then
		if ( not eq.is_paused_timer("depop") ) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Danarin", Event.timer, GOVERNOR_TYPE, TimerEvent);
	eq.register_npc_event("Danarin", Event.signal, GOVERNOR_TYPE, SignalEvent);
	eq.register_npc_event("Danarin", Event.waypoint_arrive, WALKING_CAT_TYPE, DanarinWaypointArrive);
	eq.register_npc_event("Danarin", Event.waypoint_depart, WALKING_CAT_TYPE, DanarinWaypointDepart);
	eq.register_npc_event("Danarin", Event.timer, WALKING_CAT_TYPE, DanarinTimer);
	eq.register_npc_event("Danarin", Event.death, WALKING_CAT_TYPE, DanarinDeath);
	eq.register_npc_event("Danarin", Event.death, ROOTED_CAT_TYPE, DanarinDeath);
	eq.register_npc_event("Danarin", Event.trade, ROOTED_CAT_TYPE, DanarinTrade);

	for _, typeId in ipairs(GRIMLING_TYPES) do
		eq.register_npc_event("Danarin", Event.spawn, typeId, GrimlingSpawn);
		eq.register_npc_event("Danarin", Event.timer, typeId, GrimlingTimer);
		eq.register_npc_event("Danarin", Event.combat, typeId, GrimlingCombat);
	end
	
	eq.spawn_condition("grimling", 2, 1);		-- enable camp respawns in case they are off due to zone crash or whatever
end
