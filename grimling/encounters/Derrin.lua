local GOVERNOR_TYPE = 167587;		-- GovernorThree
local TOWN_CAT_TYPE = 167201;		-- Scout_Derrin
local TOWN_CAT_SPAWNID = 334760;
local WALKING_CAT_TYPE = 167036;	-- #Scout_Derrin
local ROOTED_CAT_TYPE = 167682;		-- ##Scout_Derrin
local FLAG_ID = 70;

local OFFICER_TYPE = 167033;
local MANACRAFTER_TYPE = 167683;
local DEATHBRINGER_TYPE = 167684;	-- this is a warrior.  Sony design error?
local PRIEST_TYPE = 167685;
local CADAVERIST_TYPE = 167686;
local HERBALIST_TYPE = 167687;
local SKULLCRACKER_TYPE = 167688;

local GRIMLING_TYPES = { OFFICER_TYPE, MANACRAFTER_TYPE, DEATHBRINGER_TYPE, PRIEST_TYPE, CADAVERIST_TYPE, HERBALIST_TYPE, SKULLCRACKER_TYPE };

local CAMP_SPAWN_IDS = { 334995, 334996, 334997, 334998, 334999, 335000, 335001, 335002, 335003, 335004, 335005, 335006 };

local SPAWNS = {		-- these NPCs are level 26-30
	{
		x = 1229, y = -1160, z = 63,				-- 8:00
		types = { PRIEST_TYPE, HERBALIST_TYPE },
		grid = 28	-- x:1072, y:-1077, 12.7; x:1064, y:-1052, z:15
	},
	{
		x = 1270, y = -981, z = 26.6,				-- 10:00
		types = { PRIEST_TYPE, DEATHBRINGER_TYPE, CADAVERIST_TYPE },
		grid = 29	-- x:1076, y:-1034, z:12.3; x:1064, y:-1052, z:15
	},
	{
		x = 1090, y = -904, z = 16,					-- 11:30
		types = { HERBALIST_TYPE, MANACRAFTER_TYPE },
		grid = 26	-- x:1064, y:-1052, z:15
	},
	{
		x = 1028, y = -833, z = 15,					-- north triple 1
		types = { CADAVERIST_TYPE, DEATHBRINGER_TYPE },
		grid = 26	-- x:1064, y:-1052, z:15
	},
	{
		x = 986, y = -844, z = 21,					-- north triple 2
		types = { CADAVERIST_TYPE, DEATHBRINGER_TYPE },
		grid = 27	-- x:1000, y:-915, z:20.9; x:1064, y:-1052, z:15
	},
	{
		x = 948, y = -860, z = 24,					-- north triple 3
		types = { DEATHBRINGER_TYPE },
		grid = 27	-- x:1000, y:-915, z:20.9; x:1064, y:-1052, z:15
	},
	{
		x = 895, y = -1045, z = 62.27,				-- east triple 1
		types = { MANACRAFTER_TYPE, HERBALIST_TYPE, SKULLCRACKER_TYPE },
		grid = 30	-- x:1000, y:-1100, 34.8; x:1064, y:-1052, z:15
	},
	{
		x = 899, y = -1080, z = 63.76,				-- east triple 2
		types = { MANACRAFTER_TYPE, SKULLCRACKER_TYPE },
		grid = 30	-- x:1000, y:-1100, 34.8; x:1064, y:-1052, z:15
	},
	{
		x = 905, y = -1121, z = 66.1,				-- east triple 3
		types = { MANACRAFTER_TYPE, SKULLCRACKER_TYPE },
		grid = 30	-- x:1000, y:-1100, 34.8; x:1064, y:-1052, z:15
	},
};

local victory = false;
local cycle = 1;

function SignalEvent(e)

	if ( e.signal == 1 ) then
	
		local cat = eq.get_entity_list():GetNPCByNPCTypeID(WALKING_CAT_TYPE);
		eq.spawn2(ROOTED_CAT_TYPE, 0, 0, cat:GetX(), cat:GetY(), cat:GetZ(), cat:GetHeading());
		eq.depop_all(WALKING_CAT_TYPE);
		eq.set_timer("start", 30000);
		FlipFlags(true);
		eq.spawn_condition("grimling", 3, 0);		-- disable camp respawns
		
	elseif ( e.signal == 2 ) then
		eq.stop_timer("wave");
		FlipFlags(false);
		eq.spawn_condition("grimling", 3, 1);		-- enable camp respawns
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(TOWN_CAT_TYPE) ) then
			if ( victory ) then
				eq.get_entity_list():GetSpawnByID(TOWN_CAT_SPAWNID):SetTimer(1);
				victory = false;
				cycle = 1;
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
		
			if ( cycle == 3 ) then
				eq.set_timer("wave", 60000 + math.random(1, 10) * 1000);
			elseif ( cycle == 4 ) then
				eq.set_timer("wave", 35000 + math.random(1, 10) * 1000);
			elseif ( cycle == 5 ) then
				eq.set_timer("wave", 100000 + math.random(1, 10) * 1000);
			end				
			SpawnWave();
			
			cycle = cycle + 1;
			if ( cycle > 5 ) then
				 cycle = 1;
			end
		else
			eq.stop_timer("wave");
		end
	elseif ( e.timer == "start" ) then
		eq.stop_timer("start");
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(ROOTED_CAT_TYPE) ) then
			SpawnWave();
			cycle = cycle + 1;
			eq.set_timer("wave", 78000);
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
	local spawn, spawnType, mob, officerSpawn, t;
	local extras = math.random(0, 2);
	if ( extras > 0 ) then
		t = GetRandoms(3, extras);
	else
		t = {};
	end
	
	if ( cycle == 2 or cycle == 5 ) then
		-- north triple
		if ( extras > 0 ) then		-- if wave spawns alone, only spawns 2, weirdly
			table.insert(t, 4);
		end
		table.insert(t, 5);
		table.insert(t, 6);
	else
		-- east triple
		table.insert(t, 7);
		table.insert(t, 8);
		table.insert(t, 9);
	end
	
	if ( math.random(100) <= 5 ) then
		officerSpawn = true;
	end
	
	for idx, spawnPoint in ipairs(t) do
		if ( spawnPoint > 0 ) then
			spawn = SPAWNS[spawnPoint];
			
			if ( officerSpawn and (spawnPoint == 5 or spawnPoint == 8) ) then
				spawnType = OFFICER_TYPE;
			else
				spawnType = spawn.types[math.random(1, #spawn.types)];
			end
			
			mob = eq.spawn2(spawnType, spawn.grid, 0, spawn.x, spawn.y, spawn.z, 0);
			mob:SetRunning(true);
		end
	end
	
	-- keep town cat timer at 30 minutes so it doesn't respawn mid-event
	eq.get_entity_list():GetSpawnByID(TOWN_CAT_SPAWNID):SetTimer(1800000);
end

function DerrinDeath(e)
	e.self:Shout("We are overcome! May the spirits accept my efforts and find me worthy!");
	eq.signal(GOVERNOR_TYPE, 2);
end

function DerrinWaypointArrive(e)
	if ( e.wp == 4 ) then
		e.self:Say("Follow me closely, we cannot afford for anyone to get lost.");
	elseif ( e.wp == 6 ) then
		e.self:Say("I must survive this invasion in order for it to be successful. Stay alert and make certain that I do not perish! When you are ready to bring our invasion to a close hand me the eye of an officer.");
	elseif ( e.wp == 7 ) then
		e.self:Say("The target camp is just over this ridge to the west. Half of you stay here and make your last minute preparations. Listen, and when you hear my command, charge the camp. The other half of you follow me now.");
	elseif ( e.wp == 8 ) then
		e.self:Say("Ready yourselves for battle friends. When I shout the order, attack the camp and cut down every last grimling. May the spirits be with us!");
	elseif ( e.wp == 11 ) then
		e.self:Say("I remind you, keep me alive to retain possession of the camp. When you want the assault to end, pluck the eye from a grimling officer and give it to me.");
		eq.signal(GOVERNOR_TYPE, 1);
	end
end

function DerrinWaypointDepart(e)
	if ( e.wp == 8 ) then
		e.self:Shout("In the name of King Raja, we cleanse this land of the grimling scourge! Attack!");
		e.self:SetRunning(true);
		eq.signal(GOVERNOR_TYPE, 3);
	end
end

function DerrinTimer(e)
	if ( e.timer == "depop" ) then
		eq.stop_timer("depop");
		eq.depop();
		
	elseif ( e.timer == "pause" ) then
		eq.stop_timer("pause");
		eq.set_timer("depop", 8000);
		e.self:SetRunning(true);
		e.self:MoveTo(865, -1152, 36, 174, true);
	end
end

function DerrinTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4377}, 0)) then -- Grimling Officer's Eye
		e.self:Say("Excellent! Completing a raid upon this encampment is a feat to be proud of. May this medal dispell all doubt that you have indeed accomplished this feat. I advise you to leave now, as this area will surely be taken over by the enemy at any moment.");
		e.other:QuestReward(e.self,0,0,0,0,4378,5000); -- Gold Lined Copper Medal of War
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
	eq.register_npc_event("Derrin", Event.timer, GOVERNOR_TYPE, TimerEvent);
	eq.register_npc_event("Derrin", Event.signal, GOVERNOR_TYPE, SignalEvent);
	eq.register_npc_event("Derrin", Event.waypoint_arrive, WALKING_CAT_TYPE, DerrinWaypointArrive);
	eq.register_npc_event("Derrin", Event.waypoint_depart, WALKING_CAT_TYPE, DerrinWaypointDepart);
	eq.register_npc_event("Derrin", Event.timer, WALKING_CAT_TYPE, DerrinTimer);
	eq.register_npc_event("Derrin", Event.death, WALKING_CAT_TYPE, DerrinDeath);
	eq.register_npc_event("Derrin", Event.death, ROOTED_CAT_TYPE, DerrinDeath);
	eq.register_npc_event("Derrin", Event.trade, ROOTED_CAT_TYPE, DerrinTrade);

	for _, typeId in ipairs(GRIMLING_TYPES) do
		eq.register_npc_event("Derrin", Event.spawn, typeId, GrimlingSpawn);
		eq.register_npc_event("Derrin", Event.timer, typeId, GrimlingTimer);
		eq.register_npc_event("Derrin", Event.combat, typeId, GrimlingCombat);
	end
	
	eq.spawn_condition("grimling", 3, 1);		-- enable camp respawns in case they are off due to zone crash or whatever
end
