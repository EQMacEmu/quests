local GOVERNOR_TYPE = 167622;		-- GovernorFive
local TOWN_CAT_TYPE = 167194;		-- Veteran_Vadrel
local TOWN_CAT_SPAWNID = 334769;
local VADREL_WALKING_CAT_TYPE = 167701;	-- #Veteran_Vadrel
local VADREL_ROOTED_CAT_TYPE = 167702;	-- ##Veteran_Vadrel
local GERGIL_WALKING_CAT_TYPE = 167703;	-- #Scout_Gergil
local GERGIL_ROOTED_CAT_TYPE = 167704;	-- ##Scout_Gergil
local FLAG1_ID = 74;
local FLAG2_ID = 75;

local COMMANDER_TYPE = 167700;
local BATTLELORD_TYPE = 167711;
local SKULLCRACKER_TYPE = 167709;		-- unconfirmed if these are even in the event
local MANACRAFTER_TYPE = 167710;		-- unconfirmed if these are even in the event
local DEATHBRINGER_TYPE = 167705;		-- this is a SK
local PRIEST_TYPE = 167706;
local CADAVERIST_TYPE = 167707;
local DREAMSPINNER_TYPE = 167708;		-- this is a wizard.  Sony design error?

local GRIMLING_TYPES = { COMMANDER_TYPE, MANACRAFTER_TYPE, DEATHBRINGER_TYPE, PRIEST_TYPE, CADAVERIST_TYPE, DREAMSPINNER_TYPE, SKULLCRACKER_TYPE };

local CAMP_SPAWN_IDS = { 334957, 334958, 334959, 334960, 334961, 334962, 334963, 334964, 334965, 334966, 334967, 334968, 334969, 
	334946, 334947, 334948, 334949, 334950, 334951, 334952, 334953, 334954, 334955, 334956 };

local SPAWNS = {		-- these NPCs are level 35-39
	{ -- 1
		x = 24, y = 1051, z = 8.4,						-- Vadrel 2:00
		grid = 39		-- x:130, y:985, z:-8.8
	},
	{ -- 2
		x = -46, y = 1012, z = 7.8,						-- Vadrel 2:30
		grid = 39		-- x:130, y:985, z:-8.8
	},
	{ -- 3
		x = -52, y = 951, z = -1,						-- Vadrel 3:30
		grid = 39		-- x:130, y:985, z:-8.8
	},
	{ -- 4
		x = 1, y = 825, z = 4.9,						-- Vadrel 4:30
		grid = 39		-- x:130, y:985, z:-8.8
	},
	{ -- 5
		x = 43, y = 806, z = 5,							-- Vadrel 5:00
		grid = 39		-- x:130, y:985, z:-8.8
	},
	{ -- 6
		x = 111, y = 780, z = 7.5,						-- Vadrel 6:00
		grid = 39		-- x:130, y:985, z:-8.8
	},
	{ -- 7; spawns 1-6 are accurate, but this one is made up because we only did 3 waves so we're probably missing one
		x = 267, y = 826, z = 38.1,						-- Vadrel 7:00
		grid = 39		-- x:130, y:985, z:-8.8
	},
	{ -- 8
		x = -10, y = 510, z = -5.7,						-- Gergil 12:30
		grid = 40		-- x:61, y:333, z:-5
	},
	{ -- 9
		x = -47, y = 489, z = -8.6,						-- Gergil 1:00
		grid = 40		-- x:61, y:333, z:-5
	},
	{ -- 10
		x = -5, y = 161, z = 4,							-- Gergil 5:30
		grid = 40		-- x:61, y:333, z:-5
	},
	{ -- 11
		x = 73, y = 175, z = 2.9,						-- Gergil 6:30
		grid = 40		-- x:61, y:333, z:-5
	},
	{ -- 12
		x = 243, y = 400, z = 48.6,						-- Gergil 9:30
		grid = 40		-- x:61, y:333, z:-5
	},
	{ -- 13
		x = 198, y = 430, z = 38.2,						-- Gergil 10:00
		grid = 40		-- x:61, y:333, z:-5
	},
	{ -- 14; spawns 8-13 are accurate, but this one is made up because we only did 3 waves so we're probably missing one
		x = 221, y = 218, z = 2,						-- Gergil 7:30
		grid = 41		-- x:104, y:353, z:-6.2; x:61, y:333, z:-5
	},
};

-- note: wave 1 is precise; waves 2-3 are close (should have the same mobs, spawns may be off); waves 7-10 are completely made up
local WAVES = {
	{
		PRIEST_TYPE, 1, -- Vadrel 2:00
		DEATHBRINGER_TYPE, 2, -- Vadrel 2:30
		DEATHBRINGER_TYPE, 3, -- Vadrel 3:30
		COMMANDER_TYPE, 4, -- Vadrel 4:30
		DEATHBRINGER_TYPE, 5, -- Vadrel 5:00
		PRIEST_TYPE, 6, -- Vadrel 6:00
		DEATHBRINGER_TYPE, 8, -- Gergil 12:30
		DREAMSPINNER_TYPE, 9, -- Gergil 1:00
		DEATHBRINGER_TYPE, 10, -- Gergil 5:30
		CADAVERIST_TYPE, 11, -- Gergil 6:30
		PRIEST_TYPE, 12, -- Gergil 9:30
		DEATHBRINGER_TYPE, 13, -- Gergil 10:00
	},
	{
		DEATHBRINGER_TYPE, 2, -- Vadrel 2:30
		CADAVERIST_TYPE, 3, -- Vadrel 3:30
		DEATHBRINGER_TYPE, 4, -- Vadrel 4:30
		PRIEST_TYPE, 5, -- Vadrel 5:00
		DEATHBRINGER_TYPE, 8, -- Gergil 12:30
		PRIEST_TYPE, 9, -- Gergil 1:00
		DEATHBRINGER_TYPE, 10, -- Gergil 5:30
		CADAVERIST_TYPE, 13, -- Gergil 10:00
	},
	{
		DREAMSPINNER_TYPE, 1, -- Vadrel 2:00
		DEATHBRINGER_TYPE, 2, -- Vadrel 2:30
		DEATHBRINGER_TYPE, 3, -- Vadrel 3:30
		PRIEST_TYPE, 4, -- Vadrel 4:30
		DREAMSPINNER_TYPE, 5, -- Vadrel 5:00
		CADAVERIST_TYPE, 6, -- Vadrel 6:00
		CADAVERIST_TYPE, 8, -- Gergil 12:30
		PRIEST_TYPE, 9, -- Gergil 1:00
		DEATHBRINGER_TYPE, 10, -- Gergil 5:30
		CADAVERIST_TYPE, 12, -- Gergil 9:30
		DEATHBRINGER_TYPE, 13, -- Gergil 10:00
	},
	{
		CADAVERIST_TYPE, 1, -- Vadrel 2:00
		DEATHBRINGER_TYPE, 3, -- Vadrel 3:30
		MANACRAFTER_TYPE, 4, -- Vadrel 4:30
		PRIEST_TYPE, 5, -- Vadrel 5:00
		SKULLCRACKER_TYPE, 7, -- Vadrel 7:00
		CADAVERIST_TYPE, 9, -- Gergil 1:00
		SKULLCRACKER_TYPE, 11, -- Gergil 6:30
		MANACRAFTER_TYPE, 12, -- Gergil 9:30
		DEATHBRINGER_TYPE, 13, -- Gergil 10:00
		PRIEST_TYPE, 14, -- Gergil 7:30
	},
	{
		DEATHBRINGER_TYPE, 1, -- Vadrel 2:00
		SKULLCRACKER_TYPE, 3, -- Vadrel 3:30
		DREAMSPINNER_TYPE, 4, -- Vadrel 4:30
		MANACRAFTER_TYPE, 5, -- Vadrel 5:00
		PRIEST_TYPE, 6, -- Vadrel 6:00
		MANACRAFTER_TYPE, 9, -- Gergil 1:00
		CADAVERIST_TYPE, 10, -- Gergil 5:30
		DEATHBRINGER_TYPE, 12, -- Gergil 9:30
		DREAMSPINNER_TYPE, 13, -- Gergil 10:00
		SKULLCRACKER_TYPE, 14, -- Gergil 7:30
	},
	{
		DREAMSPINNER_TYPE, 1, -- Vadrel 2:00
		DEATHBRINGER_TYPE, 2, -- Vadrel 2:30
		PRIEST_TYPE, 4, -- Vadrel 4:30
		SKULLCRACKER_TYPE, 5, -- Vadrel 5:00
		CADAVERIST_TYPE, 7, -- Vadrel 7:00
		MANACRAFTER_TYPE, 11, -- Gergil 6:30
		DREAMSPINNER_TYPE, 12, -- Gergil 9:30
		DEATHBRINGER_TYPE, 13, -- Gergil 10:00
		PRIEST_TYPE, 14, -- Gergil 7:30
	},
	{
		CADAVERIST_TYPE, 1, -- Vadrel 2:00
		DEATHBRINGER_TYPE, 3, -- Vadrel 3:30
		MANACRAFTER_TYPE, 4, -- Vadrel 4:30
		DEATHBRINGER_TYPE, 5, -- Vadrel 5:00
		PRIEST_TYPE, 7, -- Vadrel 7:00
		DREAMSPINNER_TYPE, 8, -- Gergil 12:30
		SKULLCRACKER_TYPE, 11, -- Gergil 6:30
		DEATHBRINGER_TYPE, 12, -- Gergil 9:30
		CADAVERIST_TYPE, 14, -- Gergil 7:30
	},
	{
		CADAVERIST_TYPE, 1, -- Vadrel 2:00
		PRIEST_TYPE, 3, -- Vadrel 3:30
		CADAVERIST_TYPE, 4, -- Vadrel 4:30
		SKULLCRACKER_TYPE, 5, -- Vadrel 5:00
		DEATHBRINGER_TYPE, 7, -- Vadrel 7:00
		DREAMSPINNER_TYPE, 9, -- Gergil 1:00
		DEATHBRINGER_TYPE, 11, -- Gergil 6:30
		DEATHBRINGER_TYPE, 12, -- Gergil 9:30
		MANACRAFTER_TYPE, 13, -- Gergil 10:00
	},
	{
		CADAVERIST_TYPE, 1, -- Vadrel 2:00
		DREAMSPINNER_TYPE, 3, -- Vadrel 3:30
		MANACRAFTER_TYPE, 4, -- Vadrel 4:30
		DEATHBRINGER_TYPE, 6, -- Vadrel 6:00
		PRIEST_TYPE, 9, -- Gergil 1:00
		SKULLCRACKER_TYPE, 11, -- Gergil 6:30
		DREAMSPINNER_TYPE, 12, -- Gergil 9:30
		DEATHBRINGER_TYPE, 13, -- Gergil 10:00
	},
	{
		MANACRAFTER_TYPE, 1, -- Vadrel 2:00
		DREAMSPINNER_TYPE, 2, -- Vadrel 2:30
		DEATHBRINGER_TYPE, 3, -- Vadrel 3:30
		SKULLCRACKER_TYPE, 4, -- Vadrel 4:30
		PRIEST_TYPE, 6, -- Vadrel 6:00
		SKULLCRACKER_TYPE, 8, -- Gergil 12:30
		DREAMSPINNER_TYPE, 9, -- Gergil 1:00
		DEATHBRINGER_TYPE, 10, -- Gergil 5:30
		MANACRAFTER_TYPE, 11, -- Gergil 6:30
		CADAVERIST_TYPE, 12, -- Gergil 9:30
		PRIEST_TYPE, 14, -- Gergil 7:30
	},
};

local victory = false;
local quickWave = false;

function GovernorSignalEvent(e)

	if ( e.signal == 1 ) then
	
		local cat = eq.get_entity_list():GetNPCByNPCTypeID(VADREL_WALKING_CAT_TYPE);
		eq.spawn2(VADREL_ROOTED_CAT_TYPE, 0, 0, cat:GetX(), cat:GetY(), cat:GetZ(), cat:GetHeading());
		eq.depop_all(VADREL_WALKING_CAT_TYPE);
		eq.set_timer("start", 65000);
		FlipFlags(true);
		eq.spawn_condition("grimling", 5, 0);		-- disable camp respawns
		
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
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(VADREL_ROOTED_CAT_TYPE)
			and eq.get_entity_list():IsMobSpawnedByNpcTypeID(GERGIL_ROOTED_CAT_TYPE)
		) then
			SpawnWave();
			local t = 100000;
			
			-- this is not precise.  didn't do the event long enough to determine the exact spawn timer pattern
			-- copying raid 4's pattern, which is also not precise
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
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(VADREL_ROOTED_CAT_TYPE)
			and eq.get_entity_list():IsMobSpawnedByNpcTypeID(GERGIL_ROOTED_CAT_TYPE)
		) then
			SpawnWave(true);
		end		
	elseif ( e.timer == "repop" ) then
		eq.stop_timer("repop");
		RepopCamps();
		
	elseif ( e.timer == "reset" ) then
		eq.stop_timer("reset");
		
		FlipFlags(false);
		eq.spawn_condition("grimling", 5, 1);		-- enable camp respawns
		eq.depop_all(VADREL_ROOTED_CAT_TYPE);
		eq.depop_all(GERGIL_ROOTED_CAT_TYPE);
		eq.depop_all(VADREL_WALKING_CAT_TYPE);
		eq.depop_all(GERGIL_WALKING_CAT_TYPE);
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

function VadrelDeath(e)
	e.self:Shout("The invasion has failed. I go now to the realm of our fathers' spirits, may they find my efforts worthy...");
	eq.signal(GOVERNOR_TYPE, 3);
	eq.signal(GERGIL_ROOTED_CAT_TYPE, 3);
end

function VadrelWaypointArrive(e)
	if ( e.wp == 5 ) then
		e.self:Say("Stay alert! The forest has been especially dangerous lately.");
	elseif ( e.wp == 6 ) then
		e.self:Emote("stops and sniffs at the air, 'Something's not right here. Scout ahead and look for anything unusual. I sense an ambush...");
		eq.set_timer("ambush", 13000);
	elseif ( e.wp == 8 ) then
		eq.signal(GERGIL_WALKING_CAT_TYPE, 1);
		eq.set_timer("gergil", 20000);
	elseif ( e.wp == 11 ) then
		e.self:Say("We must stay and fight at least long enough to kill a grimling commander. When you give me his head I will call off the attack. May the spirits guide your blades.");
	elseif ( e.wp == 13 ) then
		e.self:Say("Gather round me friends! Make ready for glorious battle!");
		eq.signal(GOVERNOR_TYPE, 1);
	end
end

function VadrelWaypointDepart(e)
	if ( e.wp == 6 ) then
		eq.unique_spawn(GERGIL_WALKING_CAT_TYPE, 0, 0, 248, 402, 51.3, 176);
	elseif ( e.wp == 11 ) then
		e.self:Shout("For the love of the king! Attack!");
		e.self:SetRunning(true);
		eq.signal(GOVERNOR_TYPE, 2);
		eq.signal(GERGIL_WALKING_CAT_TYPE, 2);
	end
end

function VadrelTimer(e)
	if ( e.timer == "depop" ) then
		eq.stop_timer("depop");
		eq.depop();
		
	elseif ( e.timer == "ambush" ) then
		eq.stop_timer("ambush");
		e.self:Say("Guard me! The invasion will fail if I am slain!");
		
		local mob;
		mob = eq.spawn2(MANACRAFTER_TYPE, 38, 0, -79, -245, -15.3, 0);
		mob:SetRunning(true);
		mob = eq.spawn2(BATTLELORD_TYPE, 38, 0, 28, -62, 1.8, 0);
		mob:SetRunning(true);
		mob = eq.spawn2(PRIEST_TYPE, 38, 0, -144, -156, 10.7, 0);
		mob:SetRunning(true);
		mob = eq.spawn2(SKULLCRACKER_TYPE, 38, 0, -89, -90, 16.4, 0);
		mob:SetRunning(true);
		mob = eq.spawn2(PRIEST_TYPE, 38, 0, 111, -155, 23.3, 0);
		mob:SetRunning(true);
		
	elseif ( e.timer == "wounded" ) then
		if ( not e.self:IsEngaged() ) then
			eq.stop_timer("wounded");
			e.self:Say("Quickly now, tend to any wounded, we march on in a few moments.");
			eq.set_timer("continue", 45000);
		end
		
	elseif ( e.timer == "continue" ) then
		eq.stop_timer("continue");		
		e.self:Say("It's obvious our invasion isn't going to surprise the grunts. We'll have to earn success through sheer courage and determination.");
		e.self:ResumeWandering();
		
	elseif ( e.timer == "gergil" ) then
		eq.stop_timer("gergil");
		e.self:Say("Half of you stay with Gergil here and keep him alive at all costs. The rest follow me, I'll order the attack shortly.");
	end
end

function VadrelTrade(e)
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, {item1 = 5988}, 0) ) then -- Grimling Commander's Head
		e.self:Say("You have done well "..e.other:GetCleanName()..".  You will need continued success to overcome the master of the enemy, whoever that may be.  Speak to the general, tell him the invasion was successful.  He will guide your efforts further.  Now gather your forces and leave this place.  The enemy will overrun it soon.  Farewell!");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 5989, 5000); -- Golden Medal of the Shar Vahl
		
		DisableCat(e.self);		
		victory = true;
		eq.signal(GOVERNOR_TYPE, 3);
		eq.signal(GERGIL_ROOTED_CAT_TYPE, 4);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function VadrelSignalEvent(e)
	if ( e.signal == 1 ) then
		-- this is made-up text; didn't capture this
		e.self:Say("The invasion has failed.  Grab your fallen and run, may you live to fight another day!");
		eq.set_timer("depop", 5000);
	end
end

function VadrelHail(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Pay attention, "..e.other:GetCleanName().."!  This is war!");
	end
end

function GergilSignalEvent(e)

	if ( e.signal == 1 ) then
		e.self:DoAnim(67);	-- salute
		e.self:Say("Good to see you sir! I am ready to lead a dozen soldiers against this encampment at your word.");
	elseif ( e.signal == 2 ) then
		-- not sure if he says nothing here, or I didn't capture it
		e.self:AssignWaypoints(37);
		e.self:SetRunning(true);
	elseif ( e.signal == 3 ) then
		-- quest bugged out and he gave the victory line when we lost it.  using Necin's line
		e.self:Say("It is over, friends. Grab your fallen and run, may you live to fight another day!");
		DisableCat(e.self);
	elseif ( e.signal == 4 ) then
		e.self:Say("The invasion was a success! Gather your forces and leave before the enemy reclaims this land. Farewell, and thank you for your protection!");
		DisableCat(e.self);
	end
end

function GergilWaypointArrive(e)
	if ( e.wp == 2 ) then
		e.self:Say("Keep me alive, the grunts will be coming for me!");
		eq.spawn2(GERGIL_ROOTED_CAT_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		eq.depop_all(GERGIL_WALKING_CAT_TYPE);
	end
end

function GergilDeath(e)
	eq.signal(GOVERNOR_TYPE, 3);
	
	-- unknown what Gergil says when dying.  Made something up here
	e.self:Shout("I have fallen, our mission has failed. Curses upon the grimling horde!");
	eq.signal(VADREL_ROOTED_CAT_TYPE, 1);
	eq.signal(VADREL_WALKING_CAT_TYPE, 1);
end

function BattlelordDeath(e)
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(VADREL_WALKING_CAT_TYPE) ) then
		eq.set_timer("wounded", 10000, eq.get_entity_list():GetMobByNpcTypeID(VADREL_WALKING_CAT_TYPE));
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
	eq.register_npc_event("Vadrel", Event.timer, GOVERNOR_TYPE, GovernorTimerEvent);
	eq.register_npc_event("Vadrel", Event.signal, GOVERNOR_TYPE, GovernorSignalEvent);
	
	eq.register_npc_event("Vadrel", Event.say, VADREL_ROOTED_CAT_TYPE, VadrelHail);
	eq.register_npc_event("Vadrel", Event.waypoint_arrive, VADREL_WALKING_CAT_TYPE, VadrelWaypointArrive);
	eq.register_npc_event("Vadrel", Event.waypoint_depart, VADREL_WALKING_CAT_TYPE, VadrelWaypointDepart);
	eq.register_npc_event("Vadrel", Event.timer, VADREL_WALKING_CAT_TYPE, VadrelTimer);
	eq.register_npc_event("Vadrel", Event.timer, VADREL_ROOTED_CAT_TYPE, VadrelTimer);
	eq.register_npc_event("Vadrel", Event.death, VADREL_WALKING_CAT_TYPE, VadrelDeath);
	eq.register_npc_event("Vadrel", Event.death, VADREL_ROOTED_CAT_TYPE, VadrelDeath);
	eq.register_npc_event("Vadrel", Event.trade, VADREL_ROOTED_CAT_TYPE, VadrelTrade);
	eq.register_npc_event("Vadrel", Event.signal, VADREL_WALKING_CAT_TYPE, VadrelSignalEvent);
	eq.register_npc_event("Vadrel", Event.signal, VADREL_ROOTED_CAT_TYPE, VadrelSignalEvent);

	eq.register_npc_event("Vadrel", Event.signal, GERGIL_WALKING_CAT_TYPE, GergilSignalEvent);
	eq.register_npc_event("Vadrel", Event.signal, GERGIL_ROOTED_CAT_TYPE, GergilSignalEvent);
	eq.register_npc_event("Vadrel", Event.waypoint_arrive, GERGIL_WALKING_CAT_TYPE, GergilWaypointArrive);
	eq.register_npc_event("Vadrel", Event.death, GERGIL_WALKING_CAT_TYPE, GergilDeath);
	eq.register_npc_event("Vadrel", Event.death, GERGIL_ROOTED_CAT_TYPE, GergilDeath);

	eq.register_npc_event("Vadrel", Event.death, BATTLELORD_TYPE, BattlelordDeath);

	for _, typeId in ipairs(GRIMLING_TYPES) do
		eq.register_npc_event("Vadrel", Event.spawn, typeId, GrimlingSpawn);
		eq.register_npc_event("Vadrel", Event.timer, typeId, GrimlingTimer);
		eq.register_npc_event("Vadrel", Event.combat, typeId, GrimlingCombat);
	end
	
	eq.spawn_condition("grimling", 5, 1);		-- enable camp respawns in case they are off due to zone crash or whatever
end
