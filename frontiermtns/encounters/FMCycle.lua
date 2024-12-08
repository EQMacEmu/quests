local GOBLINS  = {92011,92004,92009,92012,92020,92021,92022,92023,92024,92197};
local GIANTS   = {92055,92030,92025,92028,92031, 92018};
local BURYNAIS = {92010,92003,92013,92008,92034,92017,92145,92015};
local BRUTES   = {92056,92176,92036,92037,92038,92039};
local MISCS    = {92057,92029,92026,92044,92045,92046,92047};
local SARNAKS  = {92048,92040,92007,92014,92033,92035,92041,92050,92053,92054,92059};

function CycleSpawn(e)
	eq.set_timer("FMSpawn",5000);
end

function CycleTimer(e)
	eq.stop_timer("FMSpawn");
	local Cycle1 = math.random(3);
	local Cycle2 = math.random(3);
	if(Cycle1 == 3) then
		GoblinSE(e);
	elseif(Cycle1 == 2) then
		GiantSW(e);
	else
		BurynaiNW(e);
	end
	if(Cycle2 == 3) then
		BruteSE(e);
	elseif(Cycle2 == 2) then
		MiscSW(e);
	else
		SarnakNW(e);
	end
end

function GoblinSE(e)
	local goblin;
	local location = math.random(6);
	if(math.random(100) > 45) then
		goblin = 92011;
	else
		goblin = eq.ChooseRandom(92004,92009,92012,92020,92021,92022,92023,92024,92197);
	end
	if(location == 6) then
		eq.spawn2(goblin,28,0,-3247,-2839,-376,0);
	elseif(location == 5) then
		eq.spawn2(goblin,28,0,-1417,-3093,-435,0);
	elseif(location == 4) then
		eq.spawn2(goblin,28,0,-1682,-2082,-370,0);
	elseif(location == 3) then
		eq.spawn2(goblin,28,0,-2320,-2071,55,0);
	elseif(location == 2) then
		eq.spawn2(goblin,28,0,-2255,-2642,-425,0);
	else
		eq.spawn2(goblin,28,0,-2812,-2431,-420,0);
	end
	eq.debug("GoblinSE",1)
	CheckNPCSpawn(goblin);
end

function GiantSW(e)
	local giant;
	local location = math.random(6);
	if(math.random(100) > 45) then
		giant = 92055;
	else
		giant = eq.ChooseRandom(92030,92025,92028,92031,92018);
	end
	if(location == 6) then
		eq.spawn2(giant,28,0,504,-3191,-499,0);
	elseif(location == 5) then
		eq.spawn2(giant,28,0,3088,-549,-70,0);
	elseif(location == 4) then
		eq.spawn2(giant,28,0,3043,48,-35,0);
	elseif(location == 3) then
		eq.spawn2(giant,28,0,2297,-288,-70,0);
	elseif(location == 2) then
		eq.spawn2(giant,28,0,1483,226,-45,0);
	else
		eq.spawn2(giant,28,0,1083,-604,-165,0);
	end
	eq.debug("GiantSW",1)
	CheckNPCSpawn(giant);
end

function BurynaiNW(e)
	local burynai;
	local location = math.random(6);
	if(math.random(100) > 45) then
		burynai = 92010;
	else
		burynai = eq.ChooseRandom(92003,92013,92008,92034,92017,92145,92015);
	end
	if(location == 6) then
		eq.spawn2(burynai,28,0,3006,1960,233,0);
	elseif(location == 5) then
		eq.spawn2(burynai,28,0,2430,1534,240,0);
	elseif(location == 4) then
		eq.spawn2(burynai,28,0,2770,2088,170,0);
	elseif(location == 3) then
		eq.spawn2(burynai,28,0,2172,2830,270,0);
	elseif(location == 2) then
		eq.spawn2(burynai,28,0,3333,2794,180,0);
	else
		eq.spawn2(burynai,28,0,3449,1924,170,0);
	end
	eq.debug("BurynaiNW",1)
	CheckNPCSpawn(burynai);
end

function BruteSE(e)
	local brute;
	local location = math.random(6);
	if(math.random(100) > 45) then
		brute = 92056;
	else
		brute = eq.ChooseRandom(92176,92036,92037,92038,92039);
	end
	if(location == 6) then
		eq.spawn2(brute,28,0,-3247,-2839,-376,0);
	elseif(location == 5) then
		eq.spawn2(brute,28,0,-1417,-3093,-435,0);
	elseif(location == 4) then
		eq.spawn2(brute,28,0,-1682,-2082,-370,0);
	elseif(location == 3) then
		eq.spawn2(brute,28,0,-2320,-2071,55,0);
	elseif(location == 2) then
		eq.spawn2(brute,28,0,-2255,-2642,-425,0);
	else
		eq.spawn2(brute,28,0,-2812,-2431,-420,0);
	end
	eq.debug("BruteSE",1)
	CheckNPCSpawn(brute);
end

function MiscSW(e)
	local misc;
	local location = math.random(6);
	if(math.random(100) > 45) then
		misc = 92057;
	else
		misc = eq.ChooseRandom(92029,92026,92044,92045,92046,92047);
	end
	if(location == 6) then
		eq.spawn2(misc,28,0,504,-3191,-499,0);
	elseif(location == 5) then
		eq.spawn2(misc,28,0,3088,-549,-70,0);
	elseif(location == 4) then
		eq.spawn2(misc,28,0,3043,48,-35,0);
	elseif(location == 3) then
		eq.spawn2(misc,28,0,2297,-288,-70,0);
	elseif(location == 2) then
		eq.spawn2(misc,28,0,1483,226,-45,0);
	else
		eq.spawn2(misc,28,0,1083,-604,-165,0);
	end
	eq.debug("MiscSW",1)
	CheckNPCSpawn(misc);
end

function SarnakNW(e)
	local sarnak;
	local location = math.random(6);
	if(math.random(100) > 45) then
		sarnak = 92048;
	else
		sarnak = eq.ChooseRandom(92040,92007,92014,92033,92035,92041,92050,92053,92054,92059);
	end
	if(location == 6) then
		eq.spawn2(sarnak,28,0,3006,1960,233,0);
	elseif(location == 5) then
		eq.spawn2(sarnak,28,0,2430,1534,240,0);
	elseif(location == 4) then
		eq.spawn2(sarnak,28,0,2770,2088,170,0);
	elseif(location == 3) then
		eq.spawn2(sarnak,28,0,2172,2830,270,0);
	elseif(location == 2) then
		eq.spawn2(sarnak,28,0,3333,2794,180,0);
	else
		eq.spawn2(sarnak,28,0,3449,1924,170,0);
	end
	eq.debug("SarnakNW",1)
	CheckNPCSpawn(sarnak);
end

function GoblinDeath(e)
	GiantSW(e);
end

function GiantDeath(e)
	BurynaiNW(e);
end

function BurynaiDeath(e)
	GoblinSE(e);
end

function BruteDeath(e)
	MiscSW(e);
end

function MiscDeath(e)
	SarnakNW(e);
end

function SarnakDeath(e)
	BruteSE(e);
end

function CheckNPCSpawn(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(e)) then
		eq.debug("" .. eq.get_npc_name_by_id(e) .." is spawned", 1);
	else
		eq.debug("there's an error with " .. eq.get_npc_name_by_id(e) .." not spawning", 1);
	end
end

function event_encounter_load(e)
	eq.register_npc_event("FMCycle", Event.timer, 92042, CycleTimer);
	eq.register_npc_event("FMCycle", Event.spawn, 92042, CycleSpawn);
	for _, GoblinCycle in ipairs(GOBLINS) do
		eq.register_npc_event("FMCycle", Event.death_complete, GoblinCycle, GoblinDeath);
	end
	for _, GiantCycle in ipairs(GIANTS) do
		eq.register_npc_event("FMCycle", Event.death_complete, GiantCycle, GiantDeath);
	end
	for _, BurynaiCycle in ipairs(BURYNAIS) do
		eq.register_npc_event("FMCycle", Event.death_complete, BurynaiCycle, BurynaiDeath);
	end
	for _, BruteCycle in ipairs(BRUTES) do
		eq.register_npc_event("FMCycle", Event.death_complete, BruteCycle, BruteDeath);
	end
	for _, MiscCycle in ipairs(MISCS) do
		eq.register_npc_event("FMCycle", Event.death_complete, MiscCycle, MiscDeath);
	end
	for _, SarnakCycle in ipairs(SARNAKS) do
		eq.register_npc_event("FMCycle", Event.death_complete, SarnakCycle, SarnakDeath);
	end
end
