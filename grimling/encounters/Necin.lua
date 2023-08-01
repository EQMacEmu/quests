local GOVERNOR_TYPE = 167561;		-- GovernorFour
local TOWN_CAT_TYPE = 167200;		-- Captain_Necin
local TOWN_CAT_SPAWNID = 334761;
local NECIN_WALKING_CAT_TYPE = 167689;	-- #Captain_Necin
local NECIN_ROOTED_CAT_TYPE = 167690;	-- ##Captain_Necin
local JHERUM_WALKING_CAT_TYPE = 167691;	-- #Sergeant_Jherum
local JHERUM_ROOTED_CAT_TYPE = 167692;	-- ##Sergeant_Jherum
local FLAG1_ID = 72;
local FLAG2_ID = 73;

local OFFICER_TYPE = 167699;
local SKULLCRACKER_TYPE = 167698;
local MANACRAFTER_TYPE = 167696;
local DEATHBRINGER_TYPE = 167694;	-- this is a warrior.  Sony design error?
local PRIEST_TYPE = 167697;
local CADAVERIST_TYPE = 167693;
local DREAMSPINNER_TYPE = 167695;	-- this is a wizard.  Sony design error?

local GRIMLING_TYPES = { OFFICER_TYPE, MANACRAFTER_TYPE, DEATHBRINGER_TYPE, PRIEST_TYPE, CADAVERIST_TYPE, DREAMSPINNER_TYPE, SKULLCRACKER_TYPE };

local CAMP_SPAWN_IDS = { 334986, 334987, 334988, 334989, 334990, 334991, 334992, 334993, 334994, 
334970, 334971, 334972, 334973, 334974, 334975, 334976, 334977, 334978, 334979, 334980, 334981, 334982, 334983, 334984, 334985 };

local SPAWNS = {		-- these NPCs are level 30-34
	{ -- 1
		x = 1142, y = 42, z = 80.9,						-- Necin 12:00
		grid = 33		-- x:1147, y:-93, z:13
	},
	{ -- 2
		x = 1048, y = 31, z = 100.5,					-- Necin 1:00
		grid = 33		-- x:1147, y:-93, z:13
	},
	{ -- 3
		x = 1004, y = -2, z = 91.5,						-- Necin 1:30
		grid = 33		-- x:1147, y:-93, z:13
	},
	{ -- 4
		x = 1015, y = -198, z = 6.8,					-- Necin 4:00
		grid = 33		-- x:1147, y:-93, z:13
	},
	{ -- 5
		x = 1003, y = -242, z = 11.8,					-- Necin 4:30
		grid = 33		-- x:1147, y:-93, z:13
	},
	{ -- 6
		x = 1037, y = -264, z = 39.2,					-- Necin 5:00
		grid = 33		-- x:1147, y:-93, z:13
	},
	{ -- 7
		x = 1174, y = -227, z = 46.1,					-- Necin 6:30
		grid = 33		-- x:1147, y:-93, z:13
	},
	{ -- 8
		x = 402, y = -534, z = 21.1,					-- Jherum 1:30
		grid = 35		-- x:514, y: -672, z:-23.5; x:556, y:-684, z:-30.5
	},
	{ -- 9
		x = 380, y = -687, z = -1.6,					-- Jherum 3:00
		grid = 34		-- x:556, y:-684, z:-30.5
	},
	{ -- 10
		x = 402, y = -755, z = -2.7,					-- Jherum 4:00
		grid = 34		-- x:556, y:-684, z:-30.5
	},
	{ -- 11
		x = 425, y = -789, z = 6,						-- Jherum 4:30
		grid = 34		-- x:556, y:-684, z:-30.5
	},
	{ -- 12
		x = 461, y = -820, z = 26,						-- Jherum 5:00
		grid = 34		-- x:556, y:-684, z:-30.5
	},
	{ -- 13
		x = 682, y = -679, z = -10,						-- Jherum 9:00
		grid = 34		-- x:556, y:-684, z:-30.5
	},
	{ -- 14
		x = 577, y = -522, z = -3,						-- Jherum 11:30
		grid = 34		-- x:556, y:-684, z:-30.5
	},
	{ -- 15
		x = 682, y = -679, z = -10,						-- Jherum 9:00 to Necin; seems to be a Sony design error
		grid = 33		-- x:1147, y:-93, z:13
	},
};
local WAVES = {
	{
		CADAVERIST_TYPE, 2, -- Necin 1:00
		OFFICER_TYPE, 3, -- Necin 1:30
		SKULLCRACKER_TYPE, 4, -- Necin 4:00
		DREAMSPINNER_TYPE, 5, -- Necin 4:30
		DREAMSPINNER_TYPE, 6, -- Necin 5:00
		PRIEST_TYPE, 7, -- Necin 6:30
		MANACRAFTER_TYPE, 9, -- Jherum 3:00
		PRIEST_TYPE, 10, -- Jherum 4:00
		MANACRAFTER_TYPE, 11, -- Jherum 4:30
		DREAMSPINNER_TYPE, 12, -- Jherum 5:00
		DEATHBRINGER_TYPE, 13, -- Jherum 9:00
		DEATHBRINGER_TYPE, 14, -- Jherum 11:30
	},
	{
		MANACRAFTER_TYPE, 1, -- Necin 12:00
		MANACRAFTER_TYPE, 2, -- Necin 1:00
		MANACRAFTER_TYPE, 3, -- Necin 1:30
		MANACRAFTER_TYPE, 8, -- Jherum 1:30
		MANACRAFTER_TYPE, 9, -- Jherum 3:00
		PRIEST_TYPE, 13, -- Jherum 9:00
		MANACRAFTER_TYPE, 14, -- Jherum 11:30
		DREAMSPINNER_TYPE, 15, -- Jherum 9:00 to Necin
		DREAMSPINNER_TYPE, 15, -- Jherum 9:00 to Necin
	},
	{
		CADAVERIST_TYPE, 4, -- Necin 4:00
		CADAVERIST_TYPE, 5, -- Necin 4:30
		DEATHBRINGER_TYPE, 6, -- Necin 5:00
		DEATHBRINGER_TYPE, 10, -- Jherum 4:00
		DEATHBRINGER_TYPE, 13, -- Jherum 9:00
		DEATHBRINGER_TYPE, 14, -- Jherum 11:30
		DREAMSPINNER_TYPE, 15, -- Jherum 9:00 to Necin
	},
	{
		MANACRAFTER_TYPE, 1, -- Necin 12:00
		SKULLCRACKER_TYPE, 2, -- Necin 1:00
		CADAVERIST_TYPE, 4, -- Necin 4:00
		CADAVERIST_TYPE, 5, -- Necin 4:30
		DEATHBRINGER_TYPE, 6, -- Necin 5:00
		PRIEST_TYPE, 7, -- Necin 6:30
		DREAMSPINNER_TYPE, 8, -- Jherum 1:30
		DEATHBRINGER_TYPE, 9, -- Jherum 3:00
		CADAVERIST_TYPE, 10, -- Jherum 4:00
		MANACRAFTER_TYPE, 11, -- Jherum 4:30
		SKULLCRACKER_TYPE, 12, -- Jherum 5:00
		SKULLCRACKER_TYPE, 15, -- Jherum 9:00 to Necin
	},
	{
		DEATHBRINGER_TYPE, 1, -- Necin 12:00
		CADAVERIST_TYPE, 2, -- Necin 1:00
		DEATHBRINGER_TYPE, 3, -- Necin 1:30
		DREAMSPINNER_TYPE, 8, -- Jherum 1:30
		DEATHBRINGER_TYPE, 9, -- Jherum 3:00
	},
	{
		SKULLCRACKER_TYPE, 1, -- Necin 12:00
		SKULLCRACKER_TYPE, 2, -- Necin 1:00
		SKULLCRACKER_TYPE, 5, -- Necin 4:30
		SKULLCRACKER_TYPE, 6, -- Necin 5:00
		PRIEST_TYPE, 10, -- Jherum 4:00
		MANACRAFTER_TYPE, 11, -- Jherum 4:30
		SKULLCRACKER_TYPE, 12, -- Jherum 5:00
	},
	{
		DEATHBRINGER_TYPE, 1, -- Necin 12:00
		CADAVERIST_TYPE, 2, -- Necin 1:00
		DEATHBRINGER_TYPE, 3, -- Necin 1:30
		DREAMSPINNER_TYPE, 8, -- Jherum 1:30
		DEATHBRINGER_TYPE, 9, -- Jherum 3:00
	},
	{
		DEATHBRINGER_TYPE, 1, -- Necin 12:00
		PRIEST_TYPE, 2, -- Necin 1:00
		PRIEST_TYPE, 3, -- Necin 1:30
		CADAVERIST_TYPE, 4, -- Necin 4:00
		CADAVERIST_TYPE, 5, -- Necin 4:30
		DREAMSPINNER_TYPE, 6, -- Necin 5:00
		DEATHBRINGER_TYPE, 7, -- Necin 6:30
		PRIEST_TYPE, 10, -- Jherum 4:00
		SKULLCRACKER_TYPE, 11, -- Jherum 4:30
		DREAMSPINNER_TYPE, 12, -- Jherum 5:00
		DEATHBRINGER_TYPE, 13, -- Jherum 9:00
		MANACRAFTER_TYPE, 14, -- Jherum 11:30
	},
	{
		MANACRAFTER_TYPE, 4, -- Necin 4:00
		PRIEST_TYPE, 5, -- Necin 4:30
		SKULLCRACKER_TYPE, 6, -- Necin 5:00
		PRIEST_TYPE, 13, -- Jherum 9:00
		SKULLCRACKER_TYPE, 14, -- Jherum 11:30
	},
	{
		MANACRAFTER_TYPE, 2, -- Necin 1:00
		SKULLCRACKER_TYPE, 4, -- Necin 4:00
		DREAMSPINNER_TYPE, 5, -- Necin 4:30
		DREAMSPINNER_TYPE, 6, -- Necin 5:00
		SKULLCRACKER_TYPE, 10, -- Jherum 4:00
		SKULLCRACKER_TYPE, 11, -- Jherum 4:30
		DREAMSPINNER_TYPE, 12, -- Jherum 5:00
		DREAMSPINNER_TYPE, 13, -- Jherum 9:00
		SKULLCRACKER_TYPE, 15, -- Jherum 9:00 to Necin
	},
};

local victory = false;
local quickWave = false;

function GovernorSignalEvent(e)

	if ( e.signal == 1 ) then
	
		local cat = eq.get_entity_list():GetNPCByNPCTypeID(NECIN_WALKING_CAT_TYPE);
		eq.spawn2(NECIN_ROOTED_CAT_TYPE, 0, 0, cat:GetX(), cat:GetY(), cat:GetZ(), cat:GetHeading());
		eq.depop_all(NECIN_WALKING_CAT_TYPE);
		eq.set_timer("start", 65000);
		FlipFlags(true);
		eq.spawn_condition("grimling", 4, 0);		-- disable camp respawns
		
	elseif ( e.signal == 2 ) then
		DepopCamps();
		eq.set_timer("repop", 1000);
		
	elseif ( e.signal == 3 ) then
		eq.stop_timer("wave");
		eq.set_timer("reset", 90000);
		
	end
end

function GovernorTimerEvent(e)
	if ( e.timer == "wave" ) then
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(NECIN_ROOTED_CAT_TYPE)
			and eq.get_entity_list():IsMobSpawnedByNpcTypeID(JHERUM_ROOTED_CAT_TYPE)
		) then
			SpawnWave();
			local t = 100000;
			
			-- this is not precise.  didn't do the event long enough to determine the exact spawn timer pattern
			if ( quickWave ) then
				t = 40000;
				quickWave = false;
			else
				local roll = math.random(100);
				if ( roll <= 5 ) then
					t = t * 2;	-- skip a wave
				elseif ( roll <= 15 ) then
					t = 60000;
					quickWave = true;
				end
			end
			
			t = t + math.random(1, 10) * 1000;
			eq.set_timer("wave", t);
		end
	elseif ( e.timer == "start" ) then
		eq.stop_timer("start");
		eq.set_timer("wave", 40000);
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(NECIN_ROOTED_CAT_TYPE)
			and eq.get_entity_list():IsMobSpawnedByNpcTypeID(JHERUM_ROOTED_CAT_TYPE)
		) then
			SpawnWave(true);
		end		
	elseif ( e.timer == "repop" ) then
		eq.stop_timer("repop");
		RepopCamps();
		
	elseif ( e.timer == "reset" ) then
		eq.stop_timer("reset");
		
		FlipFlags(false);
		eq.spawn_condition("grimling", 4, 1);		-- enable camp respawns
		eq.depop_all(NECIN_ROOTED_CAT_TYPE);
		eq.depop_all(JHERUM_ROOTED_CAT_TYPE);
		eq.depop_all(NECIN_WALKING_CAT_TYPE);
		eq.depop_all(JHERUM_WALKING_CAT_TYPE);
		RepopCamps();
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(TOWN_CAT_TYPE) ) then
			if ( victory ) then
				eq.get_entity_list():GetSpawnByID(TOWN_CAT_SPAWNID):SetTimer(1);
				victory = false;
			end
		end
	end
end

function SpawnWave(noOfficer)
	local spawn, spawnType, mob;
	
	if ( not noOfficer and math.random(100) <= 4 ) then
		wave = 1;	-- officer wave
	else
		wave = math.random(2, #WAVES);
	end
	
	local i = 1, npc, spawn;
	
	while i < #WAVES[wave] do
	
		npc = WAVES[wave][i];
		spawn = WAVES[wave][i+1];
		
		mob = eq.spawn2(npc, SPAWNS[spawn].grid, 0, SPAWNS[spawn].x, SPAWNS[spawn].y, SPAWNS[spawn].z, 0);
		mob:SetRunning(true);
		
		i = i + 2;
	end
	
	-- keep town cat timer at 30 minutes so it doesn't respawn mid-event
	eq.get_entity_list():GetSpawnByID(TOWN_CAT_SPAWNID):SetTimer(1800000);
end

function NecinDeath(e)
	e.self:Shout("Our mission has failed. Curses upon the grimling horde!");
	eq.signal(GOVERNOR_TYPE, 3);
	eq.signal(JHERUM_ROOTED_CAT_TYPE, 5);
end

function NecinWaypointArrive(e)
	if ( e.wp == 6 ) then
		eq.signal(JHERUM_WALKING_CAT_TYPE, 1);
		eq.set_timer("talk1", 30000);
	elseif ( e.wp == 7 ) then
		e.self:Say("There is no shame in dying for a worthy cause, friends. Remember this, never in history has freedom come without bloodshed. Fight well, and if it is our destiny, we shall prevail.");
	elseif ( e.wp == 8 ) then
		e.self:Say("If we succeed in overtaking their camp, keep watch for a grimling officer. When you are ready to end the mission, hand his toes to me.");
	elseif ( e.wp == 9 ) then
		e.self:Say("Some of you sneak around to the platform on the ledge to my left and when you hear my command, clear it of enemies. The rest of you make any last second preparations.");
	elseif ( e.wp == 10 ) then
		e.self:Say("It is time, ready yourselves for a ferocious battle!");
		eq.signal(JHERUM_WALKING_CAT_TYPE, 3);
	elseif ( e.wp == 14 ) then
		e.self:Say("They are certain to launch a deadly counterattack at any moment, make ready!");
		eq.signal(GOVERNOR_TYPE, 1);
	end
end

function NecinWaypointDepart(e)
	if ( e.wp == 6 ) then
		eq.signal(JHERUM_WALKING_CAT_TYPE, 2);
		e.self:Say("Make your peace with the spirits, soldiers. Some of us probably won't be returning. Whatever happens, make certain Jherum and I survive to occupy the camps. Move out!");
	elseif ( e.wp == 10 ) then
		e.self:Shout("May the forest river run red with the blood of grimlings! Attack!");
		e.self:SetRunning(true);
		eq.signal(GOVERNOR_TYPE, 2);
		eq.signal(JHERUM_WALKING_CAT_TYPE, 4);
	end
end

function NecinTimer(e)
	if ( e.timer == "depop" ) then
		eq.stop_timer("depop");
		eq.depop();
		
	elseif ( e.timer == "talk1" ) then
		eq.stop_timer("talk1");
		e.self:Say("It's too late to turn back, there's only one thing to do. Half of you go with Jherum, the stronger half follow me. We'll have to attack both camps simultaneously. I'll call the attack, so listen for my battlecry. Decide who will follow who, we depart in one minute.");
	end
end

function NecinTrade(e)
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, {item1 = 4399}, 0) ) then		-- Grimling Officer Toes
		e.self:Say(e.other:GetCleanName().."! Against extraordinary odds you have completed a vital mission in the war against the Vah Shir! This medal is all I can offer you, but our people owe you much more. Hurry and leave this place, it will not be safe here for long. Farewell!");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 4396, 5000); -- Silver Medal of War
		
		DisableCat(e.self);		
		victory = true;
		eq.signal(GOVERNOR_TYPE, 3);
		eq.signal(JHERUM_ROOTED_CAT_TYPE, 6);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function NecinSignalEvent(e)
	if ( e.signal == 1 ) then
		e.self:Say("Something has happened to Jherum, we have no chance of success. The mission has failed.");
	elseif ( e.signal == 2 ) then
		e.self:Say("It is over, friends. Grab your fallen and run, may you live to fight another day!");
	end
	eq.set_timer("depop", 5000);
end

function NecinHail(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Pay attention, "..e.other:GetCleanName().."!  This is war!");
	end
end

function JherumSignalEvent(e)

	if ( e.signal == 1 ) then
		e.self:DoAnim(67);	-- salute
		e.self:Say("I've just returned from the camp and I have some alarming news. They've built another camp just southeast of the target. If we continue with the mission and attack the target, the little grunts at the new camp will surely conduct a sneak attack.");
	elseif ( e.signal == 2 ) then
		eq.set_timer("moveout", 12000);
	elseif ( e.signal == 3 ) then
		e.self:Say("Fight bravely men, the eyes of the spirit world are upon us! The captain will give the call at any moment, be ready!");
	elseif ( e.signal == 4 ) then
		e.self:SetRunning(true);
		e.self:ResumeWandering();
	elseif ( e.signal == 5 ) then
		-- unknown what Jherum says here.  using Necin's line
		e.self:Say("It is over, friends. Grab your fallen and run, may you live to fight another day!");
		DisableCat(e.self);
	elseif ( e.signal == 6 ) then
		-- Jherum seems to say nothing on a victory?
		DisableCat(e.self);
	end
end

function JherumDeath(e)
	eq.signal(GOVERNOR_TYPE, 3);
	
	if ( e.self:GetNPCTypeID() == JHERUM_WALKING_CAT_TYPE ) then
		eq.signal(NECIN_ROOTED_CAT_TYPE, 1);
		eq.signal(NECIN_WALKING_CAT_TYPE, 1);
	else
		e.self:Shout("Captain, I have fallen, our mission has failed. Curses upon the grimling horde!");
		eq.signal(NECIN_ROOTED_CAT_TYPE, 2);
		eq.signal(NECIN_WALKING_CAT_TYPE, 2);
	end
end

function JherumWaypointArrive(e)
	if ( e.wp == 2 ) then
		e.self:Say("Stay close now, if you get lost you'll be labelled a deserter. There is no greater dishonor than that.");
	elseif ( e.wp == 3 ) then
		e.self:Say("Make your final preparations here. The attack will begin shortly.");
	elseif ( e.wp == 5 ) then
		e.self:Say("Stay near and keep me breathing. If I fall the mission fails! Now replenish yourselves and set up lookouts.");
		eq.spawn2(JHERUM_ROOTED_CAT_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		eq.depop_all(JHERUM_WALKING_CAT_TYPE);
	end
end

function JherumTimer(e)
	if ( e.timer == "moveout" ) then
		eq.stop_timer("moveout");
		e.self:AssignWaypoints(32);
	end
end

function DisableCat(cat)
	if ( not cat or not cat.valid or cat:GetHP() < 1 ) then	-- SetBodyType() crashes the zone if mob is dead
		return;
	end
	cat:Heal();
	cat:SetSpecialAbility(24, 1); -- Will Not Aggro
	cat:SetSpecialAbility(25, 1); -- Immune to Aggro
	cat:SetSpecialAbility(35, 1); -- No Harm from Players
	cat:SetBodyType(11, false);	-- NoTarget
	cat:WipeHateList();
end

-- true == cat, false == grimling
function FlipFlags(state)
	
	local door;

	door = eq.get_entity_list():GetDoorsByDoorID(FLAG1_ID);
	if ( door ) then
		if ( state ) then
			door:ForceOpen(eq.get_entity_list():GetMobByNpcTypeID(GOVERNOR_TYPE));
		else
			door:ForceClose(eq.get_entity_list():GetMobByNpcTypeID(GOVERNOR_TYPE));
		end
	end
	
	door = eq.get_entity_list():GetDoorsByDoorID(FLAG2_ID);
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
	eq.register_npc_event("Necin", Event.timer, GOVERNOR_TYPE, GovernorTimerEvent);
	eq.register_npc_event("Necin", Event.signal, GOVERNOR_TYPE, GovernorSignalEvent);
	
	eq.register_npc_event("Necin", Event.say, NECIN_ROOTED_CAT_TYPE, NecinHail);
	eq.register_npc_event("Necin", Event.waypoint_arrive, NECIN_WALKING_CAT_TYPE, NecinWaypointArrive);
	eq.register_npc_event("Necin", Event.waypoint_depart, NECIN_WALKING_CAT_TYPE, NecinWaypointDepart);
	eq.register_npc_event("Necin", Event.timer, NECIN_WALKING_CAT_TYPE, NecinTimer);
	eq.register_npc_event("Necin", Event.timer, NECIN_ROOTED_CAT_TYPE, NecinTimer);
	eq.register_npc_event("Necin", Event.death, NECIN_WALKING_CAT_TYPE, NecinDeath);
	eq.register_npc_event("Necin", Event.death, NECIN_ROOTED_CAT_TYPE, NecinDeath);
	eq.register_npc_event("Necin", Event.trade, NECIN_ROOTED_CAT_TYPE, NecinTrade);
	eq.register_npc_event("Necin", Event.signal, NECIN_WALKING_CAT_TYPE, NecinSignalEvent);
	eq.register_npc_event("Necin", Event.signal, NECIN_ROOTED_CAT_TYPE, NecinSignalEvent);

	eq.register_npc_event("Necin", Event.signal, JHERUM_WALKING_CAT_TYPE, JherumSignalEvent);
	eq.register_npc_event("Necin", Event.signal, JHERUM_ROOTED_CAT_TYPE, JherumSignalEvent);
	eq.register_npc_event("Necin", Event.waypoint_arrive, JHERUM_WALKING_CAT_TYPE, JherumWaypointArrive);
	eq.register_npc_event("Necin", Event.timer, JHERUM_WALKING_CAT_TYPE, JherumTimer);
	eq.register_npc_event("Necin", Event.death, JHERUM_WALKING_CAT_TYPE, JherumDeath);
	eq.register_npc_event("Necin", Event.death, JHERUM_ROOTED_CAT_TYPE, JherumDeath);

	for _, typeId in ipairs(GRIMLING_TYPES) do
		eq.register_npc_event("Necin", Event.spawn, typeId, GrimlingSpawn);
		eq.register_npc_event("Necin", Event.timer, typeId, GrimlingTimer);
		eq.register_npc_event("Necin", Event.combat, typeId, GrimlingCombat);
	end
	
	eq.spawn_condition("grimling", 4, 1);		-- enable camp respawns in case they are off due to zone crash or whatever
end
