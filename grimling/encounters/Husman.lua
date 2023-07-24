local GOVERNOR_TYPE = 167608;		-- GovernorOne
local TOWN_CAT_TYPE = 167203;		-- Scout_Husman
local TOWN_CAT_SPAWNID = 334758;
local WALKING_CAT_TYPE = 167034;	-- #Scout_Husman
local ROOTED_CAT_TYPE = 167679;		-- ##Scout_Husman
local FLAG_ID = 68;

local OFFICER_TYPE = 167031;
local FIGHTR_TYPE = 167030;
local MANACRAFTER_TYPE = 167027;
local DEATHBRINGER_TYPE = 167029;	-- this is a warrior.  Sony design error?
local PRIEST_TYPE = 167678;
local CADAVERIST_TYPE = 167028;
local HERBALIST_TYPE = 167680;

local GRIMLING_TYPES = { OFFICER_TYPE, FIGHTR_TYPE, MANACRAFTER_TYPE, DEATHBRINGER_TYPE, PRIEST_TYPE, CADAVERIST_TYPE, HERBALIST_TYPE };

local CAMP_SPAWN_IDS = { 335018, 335019, 335020, 335021, 335022, 335023, 335024 };

local SPAWNS = {		-- these NPCs are level 23-27
	{
		x = -172, y = -1368, z = 29.8349,					-- 5:30
		types = { FIGHTR_TYPE, MANACRAFTER_TYPE },
		grid = 21		-- x:-122, y:-1287, z:26.8; x:-110, y:-1197, z:-6
	},
	{
		x = 97, y = -1379, z = 35,							-- 7:30
		types = { FIGHTR_TYPE, DEATHBRINGER_TYPE },
		grid = 20		-- x:-110, y:-1197, z:-6
	},
	{
		x = -132, y = -1362, z = 38.86533,					-- 6:00
		types = { PRIEST_TYPE },
		grid = 20		-- x:-110, y:-1197, z:-6
	},
	{
		x = -309, y = -1094, z = 22.42524,					-- 2:00
		types = { PRIEST_TYPE, CADAVERIST_TYPE, MANACRAFTER_TYPE },
		grid = 20		-- x:-110, y:-1197, z:-6
	},
	{
		x = -195, y = -1050, z = 23.59634,					-- 1:00
		types = { MANACRAFTER_TYPE, CADAVERIST_TYPE },
		grid = 20		-- x:-110, y:-1197, z:-6
	},
	{
		x = -82, y = -1035, z = -6.622699,					-- 11:00
		types = { MANACRAFTER_TYPE, DEATHBRINGER_TYPE },
		grid = 20		-- x:-110, y:-1197, z:-6
	},
	{
		x = 31, y = -1017, z = -11.44515,					-- 10:00
		types = { CADAVERIST_TYPE, DEATHBRINGER_TYPE, HERBALIST_TYPE },
		grid = 22		-- x:-86, y:-1148, z:14; x:-110, y:-1197, z:-6
	},
	{
		x = 101, y = -1156, z = 1.65121,					-- 9:30
		types = { FIGHTR_TYPE, HERBALIST_TYPE },
		grid = 23		-- x:49, y:-1098, z:22.2; x:-69, y:-1116, z:25.9; x:-110, y:-1197, z:-6
	},
	{
		x = 115, y = -1190, z = -0.05558467,				-- 9:00
		types = { MANACRAFTER_TYPE, DEATHBRINGER_TYPE, CADAVERIST_TYPE },
		grid = 24		-- x:37, y:-1265, z:24.6; x:-110, y:-1197, z:-6
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
		eq.spawn_condition("grimling", 1, 0);		-- disable camp respawns
		
	elseif ( e.signal == 2 ) then
		eq.stop_timer("wave");
		FlipFlags(false);
		eq.spawn_condition("grimling", 1, 1);		-- enable camp respawns
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(TOWN_CAT_TYPE) ) then
			if ( victory ) then
				eq.get_entity_list():GetSpawnByID(TOWN_CAT_SPAWNID):SetTimer(10000);	-- spawn cat in town in 10s
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

-- returns a table of a random number of integers from 1 to range with no duplicates
function GetRandoms(range, num)
	local t = {};
	local roll, found;
	repeat
		roll = math.random(1, range);
		found = false;
		for i = 1, #t do
			if ( t[i] == roll ) then
				found = true;
				break;
			end
		end
		if ( not found ) then
			table.insert(t, roll);
		end
	until #t == num;
	return t;
end

function SpawnWave()
	local spawn, spawnType, mob, officerSpawn;
	local t = GetRandoms(#SPAWNS, math.random(2, 5));
	
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

function HusmanDeath(e)
	e.self:Shout("My life is over, our mission has failed...");
	eq.signal(GOVERNOR_TYPE, 2);
end

function HusmanWaypointArrive(e)
	if ( e.wp == 4 ) then
		e.self:Say("The camp is just ahead. To be safe, stay behind me until I give the word. Be silent and stay low... and may the spirits bless our effort.");
	elseif ( e.wp == 5 ) then
		e.self:Say("Here we are friends, prepare yourselves. I remind you to keep me alive or the mission will be a failure. At the hearing of my next words, follow me over this hill and slay every last grimling.");
	elseif ( e.wp == 7 ) then
		e.self:Say("Stay close and keep me alive, the grimlings are sure to try and reclaim their camp at any moment... Be prepared for battle. When you have slain an officer, give me its head to end the raid successfully.");
		eq.signal(GOVERNOR_TYPE, 1);
	end
end

function HusmanWaypointDepart(e)
	if ( e.wp == 5 ) then
		e.self:Shout("For the king! We claim this land in defiance of the grimling menace! Death to you all!");
		e.self:SetRunning(true);
		eq.signal(GOVERNOR_TYPE, 3);
	end
end

function HusmanTimer(e)
	if ( e.timer == "depop" ) then
		eq.stop_timer("depop");
		eq.depop();
		
	elseif ( e.timer == "pause" ) then
		eq.stop_timer("pause");
		eq.set_timer("depop", 8000);
		e.self:SetRunning(true);
		e.self:MoveTo(-325, -1083, 21.2, 219, true);
	end
end

function HusmanTrade(e)
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, {item1 = 4327}, 0) ) then		-- Grimling Officer's Scalp
		e.self:Say("Well done " .. e.other:GetCleanName() .. "! Successful raids like this will bring you great glory among our people. Take this insignia as proof of your experience here in service of the king. Leave this place now, for it will be taken over by the enemy momentarily. Farewell!");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 4393, 5000); -- Copper Medal of War
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
	eq.register_npc_event("Husman", Event.timer, GOVERNOR_TYPE, TimerEvent);
	eq.register_npc_event("Husman", Event.signal, GOVERNOR_TYPE, SignalEvent);
	eq.register_npc_event("Husman", Event.waypoint_arrive, WALKING_CAT_TYPE, HusmanWaypointArrive);
	eq.register_npc_event("Husman", Event.waypoint_depart, WALKING_CAT_TYPE, HusmanWaypointDepart);
	eq.register_npc_event("Husman", Event.timer, WALKING_CAT_TYPE, HusmanTimer);
	eq.register_npc_event("Husman", Event.death, WALKING_CAT_TYPE, HusmanDeath);
	eq.register_npc_event("Husman", Event.death, ROOTED_CAT_TYPE, HusmanDeath);
	eq.register_npc_event("Husman", Event.trade, ROOTED_CAT_TYPE, HusmanTrade);

	for _, typeId in ipairs(GRIMLING_TYPES) do
		eq.register_npc_event("Husman", Event.spawn, typeId, GrimlingSpawn);
		eq.register_npc_event("Husman", Event.timer, typeId, GrimlingTimer);
		eq.register_npc_event("Husman", Event.combat, typeId, GrimlingCombat);
	end
	
	eq.spawn_condition("grimling", 1, 1);		-- enable camp respawns in case they are off due to zone crash or whatever
end
