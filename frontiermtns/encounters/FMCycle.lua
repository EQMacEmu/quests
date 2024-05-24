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
end

function GiantSW(e)
	local giant;
	local location = math.random(6);
	if(math.random(100) > 45) then
		giant = 92055;
	else
		giant = eq.ChooseRandom(92030,92025,92028,92031);
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
		eq.spawn2(burynai,28,0,2430,1534,240);
	elseif(location == 4) then
		eq.spawn2(burynai,28,0,2770,2088,170,0);
	elseif(location == 3) then
		eq.spawn2(burynai,28,0,2172,2830,270,0);
	elseif(location == 2) then
		eq.spawn2(burynai,28,0,3333,2794,180,0);
	else
		eq.spawn2(burynai,28,0,3449,1924,170,0);
	end
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
		eq.spawn2(sarnak,28,0,2430,1534,240);
	elseif(location == 4) then
		eq.spawn2(sarnak,28,0,2770,2088,170,0);
	elseif(location == 3) then
		eq.spawn2(sarnak,28,0,2172,2830,270,0);
	elseif(location == 2) then
		eq.spawn2(sarnak,28,0,3333,2794,180,0);
	else
		eq.spawn2(sarnak,28,0,3449,1924,170,0);
	end
end

function Goblin1Death(e)
	GiantSW(e);
end

function Goblin2Death(e)
	GiantSW(e);
end

function Goblin3Death(e)
	GiantSW(e);
end

function Goblin4Death(e)
	GiantSW(e);
end

function Goblin5Death(e)
	GiantSW(e);
end

function Goblin6Death(e)
	GiantSW(e);
end

function Goblin7Death(e)
	GiantSW(e);
end

function Goblin8Death(e)
	GiantSW(e);
end

function Goblin9Death(e)
	GiantSW(e);
end

function Goblin10Death(e)
	GiantSW(e);
end

function Giant1Death(e)
	BurynaiNW(e);
end

function Giant2Death(e)
	BurynaiNW(e);
end

function Giant3Death(e)
	BurynaiNW(e);
end

function Giant4Death(e)
	BurynaiNW(e);
end

function Giant5Death(e)
	BurynaiNW(e);
end

function Burynai1Death(e)
	GoblinSE(e);
end

function Burynai2Death(e)
	GoblinSE(e);
end

function Burynai3Death(e)
	GoblinSE(e);
end

function Burynai4Death(e)
	GoblinSE(e);
end

function Burynai5Death(e)
	GoblinSE(e);
end

function Burynai6Death(e)
	GoblinSE(e);
end

function Burynai7Death(e)
	GoblinSE(e);
end

function Burynai8Death(e)
	GoblinSE(e);
end

function Brute1Death(e)
	MiscSW(e);
end

function Brute2Death(e)
	MiscSW(e);
end

function Brute3Death(e)
	MiscSW(e);
end

function Brute4Death(e)
	MiscSW(e);
end

function Brute5Death(e)
	MiscSW(e);
end

function Brute6Death(e)
	MiscSW(e);
end

function Misc1Death(e)
	SarnakNW(e);
end

function Misc2Death(e)
	SarnakNW(e);
end

function Misc3Death(e)
	SarnakNW(e);
end

function Misc4Death(e)
	SarnakNW(e);
end

function Misc5Death(e)
	SarnakNW(e);
end

function Misc6Death(e)
	SarnakNW(e);
end

function Misc7Death(e)
	SarnakNW(e);
end

function Sarnak1Death(e)
	BruteSE(e);
end

function Sarnak2Death(e)
	BruteSE(e);
end

function Sarnak3Death(e)
	BruteSE(e);
end

function Sarnak4Death(e)
	BruteSE(e);
end

function Sarnak5Death(e)
	BruteSE(e);
end

function Sarnak6Death(e)
	BruteSE(e);
end

function Sarnak7Death(e)
	BruteSE(e);
end

function Sarnak8Death(e)
	BruteSE(e);
end

function Sarnak9Death(e)
	BruteSE(e);
end

function Sarnak10Death(e)
	BruteSE(e);
end

function Sarnak11Death(e)
	BruteSE(e);
end

function event_encounter_load(e)
	eq.register_npc_event("FMCycle", Event.timer, 92042, CycleTimer);
	eq.register_npc_event("FMCycle", Event.spawn, 92042, CycleSpawn);
	eq.register_npc_event("FMCycle", Event.death_complete, 92011, Goblin1Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92004, Goblin2Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92009, Goblin3Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92012, Goblin4Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92020, Goblin5Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92021, Goblin6Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92022, Goblin7Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92023, Goblin8Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92024, Goblin9Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92197, Goblin10Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92055, Giant1Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92030, Giant2Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92025, Giant3Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92028, Giant4Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92031, Giant5Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92010, Burynai1Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92003, Burynai2Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92013, Burynai3Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92008, Burynai4Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92034, Burynai5Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92017, Burynai6Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92145, Burynai7Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92015, Burynai8Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92056, Brute1Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92176, Brute2Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92036, Brute3Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92037, Brute4Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92038, Brute5Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92039, Brute6Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92057, Misc1Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92029, Misc2Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92026, Misc3Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92044, Misc4Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92045, Misc5Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92046, Misc6Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92047, Misc7Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92048, Sarnak1Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92040, Sarnak2Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92007, Sarnak3Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92014, Sarnak4Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92033, Sarnak5Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92035, Sarnak6Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92041, Sarnak7Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92050, Sarnak8Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92053, Sarnak9Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92054, Sarnak10Death);
	eq.register_npc_event("FMCycle", Event.death_complete, 92059, Sarnak11Death);
end
