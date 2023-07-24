local GROO_TOWN = 157006;			-- #Caller_Groo
local GROO_GRID = 157010;			-- Caller_Groo
local GROO_CAVE = 157011;			-- #Caller_Groo_
local MURKIN_TOWN = 157004;			-- #Caller_Murkin
local MURKIN_GRID = 157012;			-- Caller_Murkin
local MURKIN_CAVE = 157023;			-- #Caller_Murkin_
local TORGAL_TOWN = 157003;			-- #Caller_Torgal
local TORGAL_GRID = 157037;			-- Caller_Torgal
local TORGAL_CAVE = 157070;			-- #Caller_Torgal_
local CALLER_GOVERNOR = 157099;		-- FGUshouter; respawns town callers when needed
local CALLER_INFO = {
	[GROO_TOWN] = {
		loc = { x = -463, y = 509, z = -258, h = 128 };			-- town spawn coods
		gridNpc = GROO_GRID,									-- spawn this NPC when blargrot handed in
		contract = 28704,
	},
	[GROO_GRID] = {
		grid = 9,												-- grid from town to cave
		endWaypoint = 5,										-- the last waypoint id for the grid
		caveNpc = GROO_CAVE,									-- spawn this NPC when reached cave
	},
	[GROO_CAVE] = {
		locs = {
			{ x = -1175, y = 214, z = -380, h = 0, grid = 12 },
			{ x = -1155, y = 164, z = -380, h = 0, grid = 12 },
			{ x = -1158, y = 263, z = -380, h = 0, grid = 12 },
			{ x = -1132, y = 539, z = -335, h = 0, grid = 15 },
			{ x = -1192, y = 544, z = -336, h = 0, grid = 15 },
			{ x = -1198, y = 527, z = -332, h = 0, grid = 15 },
		},
		contract = 28704,
	},
	
	[MURKIN_TOWN] = {
		loc = { x = -481, y = 501, z = -260, h = 136 };			-- town spawn coods
		gridNpc = MURKIN_GRID,									-- spawn this NPC when blargrot handed in
		contract = 28703,
	},
	[MURKIN_GRID] = {
		grid = 10,												-- grid from town to cave
		endWaypoint = 7,										-- the last waypoint id for the grid
		caveNpc = MURKIN_CAVE,									-- spawn this NPC when reached cave
	},
	[MURKIN_CAVE] = {
		locs = {
			{ x = -1098, y = 1077, z = -380, h = 0, grid = 13 },
			{ x = -1079, y = 1030, z = -380, h = 0, grid = 13 },
			{ x = -1098, y = 1000, z = -380, h = 0, grid = 13 },
			{ x = -1077, y = 705, z = -336, h = 0, grid = 16 },
			{ x = -1060, y = 736, z = -332, h = 0, grid = 16 },
			{ x = -1149, y = 728, z = -333, h = 0, grid = 16 },
		},
		contract = 28703,
	},
	
	[TORGAL_TOWN] = {
		loc = { x = -450, y = 496, z = -260, h = 139 };			-- town spawn coods
		gridNpc = TORGAL_GRID,									-- spawn this NPC when blargrot handed in
		contract = 28705,
	},
	[TORGAL_GRID] = {
		grid = 11,												-- grid from town to cave
		endWaypoint = 6,										-- the last waypoint id for the grid
		caveNpc = TORGAL_CAVE,									-- spawn this NPC when reached cave
	},
	[TORGAL_CAVE] = {
		locs = {
			{ x = -1477, y = 598, z = -378, h = 0, grid = 14 },
			{ x = -1542, y = 613, z = -380, h = 0, grid = 14 },
			{ x = -1583, y = 592, z = -380, h = 0, grid = 14 },
			{ x = -1227, y = 663, z = -330, h = 0, grid = 17 },
			{ x = -1219, y = 638, z = -332, h = 0, grid = 17 },
			{ x = -1211, y = 569, z = -333, h = 0, grid = 17 },
		},
		contract = 28705,
	},
};

local COMMON_BEASTS = {
	157072, -- a_Chakta_Fungusbeast (level 51)
	157077, -- a_Chakta_Fungusfiend (level 45)
	157078, -- a_Chakta_Fungus_Healer (level 50 cleric)
	157079, -- a_Chakta_Fungus_Priest (level 51 shaman)
};
local NAMED_BEASTS = {
	157081,		-- #Chakiza
	157082,		-- #Chakno
	157083,		-- #Katcha
	157084,		-- #Takacha
	157086,		-- #Tiako
	157088,		-- #Tuchako
};

local BOTTLE_TIMER = 180000;
local JUG_TIMER = 150000;
local KEG_TIMER = 118000;		-- AK keg timer is 1:58; confirmed from logs
local waves = {};
local timers = {};

function GovernorSpawn(e)
	eq.set_timer("SpawnCallers", 60000);
end

function GovernorTimer(e)

	if ( e.timer == "SpawnCallers" ) then
	
		local elist = eq.get_entity_list();
		local loc;

		if ( not elist:IsMobSpawnedByNpcTypeID(GROO_TOWN)
			and not elist:IsMobSpawnedByNpcTypeID(GROO_GRID)
			and not elist:IsMobSpawnedByNpcTypeID(GROO_CAVE)
		) then
			loc = CALLER_INFO[GROO_TOWN].loc;
			eq.unique_spawn(GROO_TOWN, 0, 0, loc.x, loc.y, loc.z, loc.h);
		end
		
		if ( not elist:IsMobSpawnedByNpcTypeID(MURKIN_TOWN)
			and not elist:IsMobSpawnedByNpcTypeID(MURKIN_GRID)
			and not elist:IsMobSpawnedByNpcTypeID(MURKIN_CAVE)
		) then
			loc = CALLER_INFO[MURKIN_TOWN].loc;
			eq.unique_spawn(MURKIN_TOWN, 0, 0, loc.x, loc.y, loc.z, loc.h);
		end
		
		if ( not elist:IsMobSpawnedByNpcTypeID(TORGAL_TOWN)
			and not elist:IsMobSpawnedByNpcTypeID(TORGAL_GRID)
			and not elist:IsMobSpawnedByNpcTypeID(TORGAL_CAVE)
		) then
			loc = CALLER_INFO[TORGAL_TOWN].loc;
			eq.unique_spawn(TORGAL_TOWN, 0, 0, loc.x, loc.y, loc.z, loc.h);
		end
	end
end

function TownCallerSayEvent(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ho ho! You come to hunt beasties? I bet so, many o' you kinda people come to hunt beasties.  I call beasties fer ya, yub yub.  Werk hard, work cheap too yub.  You wanna hunt beasties, you bring blargrot here yub! More blargrot, me work harder yub.");
	elseif(e.message:findi("blargrot")) then
		e.self:Emote("grins and rubs his belly, 'Blargrot! Loves it, yub! You bring blargrot and me call beasties outta tha cave for ya, yub. Bring me a lil' jug, I call a few beasties. Bring a big ol' hruge jug, me call more beasties than ya ever see, yub!'");
	end
end

function TownCallerTradeEvent(e)

	local item_lib = require("items");
	local timer, item, npc, depop;
	local myType = e.self:GetNPCTypeID();
	local gridType = CALLER_INFO[myType].gridNpc;
	local grid = CALLER_INFO[gridType].grid;

	for i = 1, 4 do
		
		item = e.trade["item"..i];
		timer = 0;
		
		if ( item ~= nil and item.valid ) then
		
			if ( item:GetID() == 28700 ) then				-- bottle
				timer = BOTTLE_TIMER;
				e.trade["item"..i] = nil;
			elseif ( item:GetID() == 28701 ) then			-- jug
				timer = JUG_TIMER;
				e.trade["item"..i] = nil;
			elseif ( item:GetID() == 28702 ) then			-- keg
				timer = KEG_TIMER;
				e.trade["item"..i] = nil;			
			end
		end
		
		if ( timer > 0 ) then
		
			e.self:Say("Aieee! Beastie huntin' fer us! Le's go!  You give me back da contrac when you had nuff beasties, yub.  Me quit then, an' call no more beasties. I wait a minute so you make ready.  Then ya follow me, and I take ya to da cave where we find beasties...");
			e.other:QuestReward(e.self, 0, 0, 0, 0, CALLER_INFO[myType].contract, 1000);

			if ( not depop ) then	-- unlike AK; prevents more than one caller
				npc = eq.spawn2(gridType, grid, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
				timers[npc:GetID()] = timer;
			end
			
			depop = true;
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
	
	if ( depop ) then
		eq.depop();
	end
end

function WaypointEvent(e)
	local myNpcType = e.self:GetNPCTypeID();
	local endPoint;
	if ( CALLER_INFO[myNpcType] ) then
		endPoint = CALLER_INFO[myNpcType].endWaypoint;
	end	
	if ( endPoint and e.wp == endPoint
		and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(CALLER_INFO[myNpcType].caveNpc)	-- unlike AK; prevents more than one caller
	) then
		-- spawn perma rooted cave NPC
		local npc = eq.spawn2(CALLER_INFO[myNpcType].caveNpc,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		
		-- keep track of spawn timers determined from blargrot turn-in
		-- using entity ID to keep track of waves and timers since there are up to 4 clones each of the callers
		timers[npc:GetID()] = timers[e.self:GetID()];
		timers[e.self:GetID()] = nil;
		
		waves[npc:GetID()] = 0;
		eq.depop();
	end
end

function CaveCallerSpawnEvent(e)
	eq.set_timer("startwave", 60000);
end

function SpawnWave(callerType)

	local roll, spawn1, spawn2, spawn3, mobType1, mobType2, mobType3;
	
	repeat
		roll = math.random(1, #CALLER_INFO[callerType].locs);
		
		if ( not spawn1 ) then
			spawn1 = roll;
		elseif ( not spawn2 ) then
			if ( spawn1 ~= roll ) then
				spawn2 = roll;
			end
		elseif ( not spawn3 ) then
			if ( spawn1 ~= roll and spawn2 ~= roll ) then
				spawn3 = roll;
			end
		end
	until (spawn3)
	
	roll = math.random(1, 100);
	if ( roll < 6 ) then		-- 5%
		mobType1 = NAMED_BEASTS[math.random(1, #NAMED_BEASTS)];
	elseif ( roll < 39 ) then
		mobType1 = COMMON_BEASTS[2];		-- small ones
	else
		mobType1 = COMMON_BEASTS[1];
	end

	roll = math.random(1, 100);
	if ( roll < 33 ) then
		mobType2 = COMMON_BEASTS[2];
	else
		mobType2 = COMMON_BEASTS[1];
	end

	roll = math.random(1, 100);
	if ( roll < 16 ) then
		mobType3 = COMMON_BEASTS[3];		-- clerics
	elseif ( roll < 46 ) then
		mobType3 = COMMON_BEASTS[4];		-- shaman
	elseif ( roll < 64 ) then
		mobType3 = COMMON_BEASTS[2];
	else
		mobType3 = COMMON_BEASTS[1];
	end
	
	local loc = CALLER_INFO[callerType].locs[spawn1];
	eq.spawn2(mobType1, loc.grid, 0, loc.x, loc.y, loc.z, loc.h);
	loc = CALLER_INFO[callerType].locs[spawn2];
	eq.spawn2(mobType2, loc.grid, 0, loc.x, loc.y, loc.z, loc.h);
	loc = CALLER_INFO[callerType].locs[spawn3];
	eq.spawn2(mobType3, loc.grid, 0, loc.x, loc.y, loc.z, loc.h);
end

function CaveCallerTimer(e)
	if ( e.timer == "startwave" ) then

		local wave = waves[e.self:GetID()] + 1;
		
		if ( wave < 5 ) then
			e.self:Emote("moans and waves his arms, then shouts 'Graka! Mootogo Ta Naga!'");
			e.self:DoAnim(42);
			eq.set_timer("startwave", timers[e.self:GetID()] or BOTTLE_TIMER);		-- timers[e.self:GetID()] should never be nil, but just in case
			SpawnWave(e.self:GetNPCTypeID());
		elseif ( wave == 5 ) then
			e.self:Emote("moans and waves his arms, then shouts 'Graka! Mootogo Ta Naga!'");
			e.self:DoAnim(42);
			eq.set_timer("startwave", 47000);
			SpawnWave(e.self:GetNPCTypeID());
		elseif ( wave == 6 ) then
			e.self:Emote("wipes the sweat from his brow, 'aaaagh, tired tired. Hard werk.  Take da sit uh huh.  Me call more soon as me rest up.'");
			eq.set_timer("startwave", 235000);
		elseif ( wave == 7 ) then
			e.self:Emote("shakes and stretches himself.  'Up, up now.  Calling more beasts, you hunt, get up'");
			e.self:DoAnim(42);
			eq.set_timer("startwave", 93000);
			wave = 0;
		end
		waves[e.self:GetID()] = wave;
	end
end

function CaveCallerTrade(e)
	local item_lib = require("items");
	local contract = CALLER_INFO[e.self:GetNPCTypeID()].contract;
	
	if ( item_lib.check_turn_in(e.self, e.trade, {item1 = contract}, 0) ) then
		e.self:Emote("grunts and says, ''Oook! Tanks fer da werk, I see ya later!'' before vanishing into the tunnel");
		
		local reward = 16976;		-- Crystalized Sulfur
		if ( math.random(1, 100) > 75 ) then
			-- more rewards are likely possible, but reward is usually sulfur
			reward = eq.ChooseRandom(10002, 10003, 10044);		-- Pearl Earring, Pearl Ring, Golden Pendant
		end
		
		e.other:QuestReward(e.self, 0, 0, 0, 0, reward, 10000);
		waves[e.self:GetID()] = nil;
		eq.stop_timer("startwave");
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function CaveCallerDeath(e)
	waves[e.self:GetID()] = nil;
end

function BeastEventSpawn(e)
	local t = 600000;
	if ( e.self:GetHP() > 15000 ) then		-- quick and dirty way to tell if this is a named
		t = t + 60000;
	end
	eq.set_timer("depop", t);
end

function BeastEventCombat(e)
	if ( e.joined ) then
		if ( not eq.is_paused_timer("depop") ) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function BeastEventTimer(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Callers", Event.spawn, CALLER_GOVERNOR, GovernorSpawn);
	eq.register_npc_event("Callers", Event.timer, CALLER_GOVERNOR, GovernorTimer);
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(CALLER_GOVERNOR) ) then
		eq.set_timer("SpawnCallers", 60000, eq.get_entity_list():GetMobByNpcTypeID(CALLER_GOVERNOR));	-- in case script loads after spawns
	end
	
	eq.register_npc_event("Callers", Event.say, GROO_TOWN, TownCallerSayEvent);
	eq.register_npc_event("Callers", Event.trade, GROO_TOWN, TownCallerTradeEvent);
	eq.register_npc_event("Callers", Event.waypoint_arrive, GROO_GRID, WaypointEvent);
	eq.register_npc_event("Callers", Event.spawn, GROO_CAVE, CaveCallerSpawnEvent);
	eq.register_npc_event("Callers", Event.timer, GROO_CAVE, CaveCallerTimer);
	eq.register_npc_event("Callers", Event.trade, GROO_CAVE, CaveCallerTrade);
	eq.register_npc_event("Callers", Event.death, GROO_CAVE, CaveCallerDeath);
	
	eq.register_npc_event("Callers", Event.say, MURKIN_TOWN, TownCallerSayEvent);
	eq.register_npc_event("Callers", Event.trade, MURKIN_TOWN, TownCallerTradeEvent);
	eq.register_npc_event("Callers", Event.waypoint_arrive, MURKIN_GRID, WaypointEvent);
	eq.register_npc_event("Callers", Event.spawn, MURKIN_CAVE, CaveCallerSpawnEvent);
	eq.register_npc_event("Callers", Event.timer, MURKIN_CAVE, CaveCallerTimer);
	eq.register_npc_event("Callers", Event.trade, MURKIN_CAVE, CaveCallerTrade);
	eq.register_npc_event("Callers", Event.death, MURKIN_CAVE, CaveCallerDeath);
	
	eq.register_npc_event("Callers", Event.say, TORGAL_TOWN, TownCallerSayEvent);
	eq.register_npc_event("Callers", Event.trade, TORGAL_TOWN, TownCallerTradeEvent);
	eq.register_npc_event("Callers", Event.waypoint_arrive, TORGAL_GRID, WaypointEvent);
	eq.register_npc_event("Callers", Event.spawn, TORGAL_CAVE, CaveCallerSpawnEvent);
	eq.register_npc_event("Callers", Event.timer, TORGAL_CAVE, CaveCallerTimer);
	eq.register_npc_event("Callers", Event.trade, TORGAL_CAVE, CaveCallerTrade);
	eq.register_npc_event("Callers", Event.death, TORGAL_CAVE, CaveCallerDeath);
	
	for _, id in ipairs(COMMON_BEASTS) do
		eq.register_npc_event("Callers", Event.spawn, id, BeastEventSpawn);
		eq.register_npc_event("Callers", Event.timer, id, BeastEventTimer);
		eq.register_npc_event("Callers", Event.combat, id, BeastEventCombat);
	end
	for _, id in ipairs(NAMED_BEASTS) do
		eq.register_npc_event("Callers", Event.spawn, id, BeastEventSpawn);
		eq.register_npc_event("Callers", Event.timer, id, BeastEventTimer);
		eq.register_npc_event("Callers", Event.combat, id, BeastEventCombat);
	end
end
