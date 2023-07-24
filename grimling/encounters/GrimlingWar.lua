DEBUG_MODE = false;
ONE_THOUSAND = 1000;
if ( DEBUG_MODE ) then
	ONE_THOUSAND = 100;
end
local WAR_SPAWN_TYPES = { 167666, 167663, 167667, 167664, 167668, 167665 };

local GRIMLING_SPAWNS = {
	{	-- Main Camp;  grid end loc: -1109, 1076, 3
		{ x = -1082, y = 1211, z = 23.9, h = 202, g = 17 },
		{ x = -1203, y = 1074, z = 19.96, h = 202, g = 17 },
		{ x = -941, y = 1192, z = 37.5, h = 202, g = 17 },
		{ x = -946, y = 1078, z = 58, h = 202, g = 17 },
		{ x = -910, y = 1101, z = 59, h = 202, g = 17, hc = true },
		{ x = -1163, y = 1192, z = 30.46, h = 202, g = 17 },
		{ x = -1095, y = 942, z = 55.5, h = 202, g = 17 },
		{ x = -1034, y = 933, z = 37.3, h = 202, g = 17 },
	},
	{	-- Fhelik camp; grid loc: -731, 385, -15
		{ x = -844, y = 206, z = 30, h = 247, g = 18 },
		{ x = -796, y = 187, z = 36, h = 247, g = 18 },
		{ x = -632, y = 361, z = 29, h = 247, g = 18 },
		{ x = -760, y = 176, z = 45, h = 247, g = 18 },
		{ x = -649, y = 394, z = 28, h = 247, g = 18 },
		{ x = -628, y = 338, z = 25, h = 247, g = 18 },
	},
	{	-- Kufur camp; grid loc: -1244, 509, 41
		{ x = -1074, y = 447, z = 19, h = 2, g = 19 },
		{ x = -1318, y = 466, z = 45, h = 2, g = 19 },
		{ x = -1295, y = 407, z = 44, h = 2, g = 19 },
		{ x = -1079, y = 420, z = 15, h = 2, g = 19 },
		{ x = -1132, y = 369, z = 11, h = 2, g = 19 },
		{ x = -1091, y = 393, z = 14, h = 2, g = 19 },
	}
};
local HIGH_COMMANDER_TYPE = 167669;
local CULLIN0_TYPE = 167196;
local CULLIN1_TYPE = 167670;
local CULLIN2_TYPE = 167671;
local FHELIK1_TYPE = 167673;
local FHELIK2_TYPE = 167676;
local KUFUR1_TYPE = 167674;
local KUFUR2_TYPE = 167677;
local SHIKTAN1_TYPE = 167672;
local SHIKTAN2_TYPE = 167675;
local CULLIN_SPAWNID = 334767;
local EVENT_GOVERNOR_TYPE = 167621;	-- always-up invisible man NPC that keeps track of event timers; using 'GovernorTen' but can be easily changed

local ROOTED_SPAWNS = {
	[CULLIN2_TYPE] = { x = -1100, y = 1099, z = 1, h = 51 },
	[FHELIK2_TYPE] = { x = -731, y = 385, z = -15, h = 115 },
	[KUFUR2_TYPE] = { x = -1244, y = 509, z = 41, h = 101 },
	[SHIKTAN2_TYPE] = { x = -1094, y = 1040, z = 8, h = 42 },
};

function CheckAllArrived()
	if ( DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: Cat Arrived ") end

	if ( cullinArrived and shiktanArrived and fhelikArrived and kufurArrived and phase == 1 ) then
		if ( DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: --- All Arrived --- ") end
		
		if ( not cullin:IsEngaged() and not shiktan:IsEngaged() and not fhelik:IsEngaged() and not kufur:IsEngaged() ) then
			eq.signal(EVENT_GOVERNOR_TYPE, 1);
		end
	end
end

local MOVES = {
	[CULLIN1_TYPE] = {
		{ x = -1051, y = -946, z = 27, h = 113, stop = true, arriveFunc = function(e)
			e.self:Say("Men, here is the army that General Staginar has appointed to attempt this invasion. They have demonstrated enough competence for him to trust them with our lives.");
			eq.set_timer("talk1", 45 * ONE_THOUSAND, shiktan);
		end },
		{ x = -888, y = -1011, z = 2.2, h = 15 },
		{ x = -762, y = -680, z = 63.6, h = 4 },
		{ x = -732, y = -375, z = -5.5, h = 6 },
		{ x = -724, y = -326, z = 11.9, h = 24 },
		{ x = -348, y = 169, z = 23.7, h = 2, arriveFunc = function(e)
			e.self:Say("This is the most difficult mission in the forest, the grimlings will fight intensely to regain it. I remind you, I must survive for this mission to be a success. If I or any of my troops die we will have failed to meet the objective. Give me the high commander's arm to bring the invasion to a close.");
		end },
		{ x = -349, y = 519, z = 37.6, h = 2 },
		{ x = -326, y = 781, z = -1.4, h = 18 },
		{ x = -295, y = 871, z = 24.8, h = 232 },
		{ x = -439, y = 1108, z = 27.7, h = 208 },
		{ x = -791, y = 1246, z = 43, h = 187, stop = true, arriveFunc = function(e)
			eq.set_timer("talk7", 10 * ONE_THOUSAND);
		end },
		{ x = -924, y = 1218, z = 34.9, h = 158 },
		{ x = -954, y = 1185, z = 36.2, h = 173 },
		{ x = -1066, y = 1129, z = 7.1, h = 195 },
		{ x = -1163, y = 1127, z = 12.2, h = 131 },
		{ x = -1166, y = 1076, z = 6.1, h = 63 },
		{ x = -1112, y = 1077, z = 0.7, h = 23 },
		{ x = -1100, y = 1099, z = 1, h = 51, arriveFunc = function(e)
			cullinArrived = true;
			CheckAllArrived();
		end },
	},
	[FHELIK1_TYPE] = {
		{ x = -888, y = -1011, z = 2.2, h = 15 },
		{ x = -762, y = -680, z = 63.6, h = 4 },
		{ x = -874, y = -278, z = -28.7, h = 225, arriveFunc = function(e)
			e.self:Say("Cullin is a revered leader, a true hero of our people. If anyone can bring us victory it is he.");
		end },
		{ x = -874, y = 55, z = 8.7, h = 6 },
		{ x = -838, y = 246, z = 31, h = 32, stop = true },
		{ x = -731, y = 385, z = -15, h = 115, arriveFunc = function(e)
			fhelikArrived = true;
			CheckAllArrived();
		end },
	},

	[KUFUR1_TYPE] = {
		{ x = -888, y = -1011, z = 2.2, h = 15 },
		{ x = -762, y = -680, z = 63.6, h = 4 },
		{ x = -853, y = -338, z = -23.4, h = 230, arriveFunc = function(e)
			e.self:Say("Cullin is a revered leader, a true hero of our people. If anyone can bring us victory it is he.");
		end },
		{ x = -1265, y = 248, z = 57, h = 257, stop = true },
		{ x = -1264, y = 535, z = 39.8, h = 249 },
		{ x = -1183, y = 482, z = 39, h = 15 },
		{ x = -1244, y = 509, z = 41, h = 101, arriveFunc = function(e)
			kufurArrived = true;
			CheckAllArrived();
		end },
	},

	[SHIKTAN1_TYPE] = {
		{ x = -888, y = -1011, z = 2.2, h = 15 },
		{ x = -762, y = -680, z = 63.6, h = 4 },
		{ x = -732, y = -375, z = -5.5, h = 6 },
		{ x = -724, y = -326, z = 11.9, h = 24 },
		{ x = -348, y = 169, z = 23.7, h = 2, arriveFunc = function(e)
			e.self:Say("Cullin is a revered leader, a true hero of our people. If anyone can bring us victory it is he.");
		end },
		{ x = -363, y = 519, z = 35.8, h = 2 },
		{ x = -527, y = 773, z = 23.9, h = 206 },
		{ x = -750, y = 868, z = 3, h = 213, stop = true },
		{ x = -1082, y = 1073, z = 7.3, h = 196 },
		{ x = -1169, y = 1074, z = 7.1, h = 4 },
		{ x = -1161, y = 1130, z = 12.7, h = 50 },
		{ x = -1074, y = 1127, z = 3.3, h = 135 },
		{ x = -1094, y = 1040, z = 8, h = 42, arriveFunc = function(e)
			shiktanArrived = true;
			CheckAllArrived();
		end },
	},
}

local CAMP_SPAWNIDS = {
	334892, 334893, 334894, 334895, 334896, 334897, 334898, 334899, 334900, 334901, 334902, 334903, 334904, 334905, 334906, 334907,
	334908, 334909, 334910, 334911, 334912, 334913, 334914, 334915, 334916, 334917, 334918, 334919, 334920, 334921, 334922, 334923,
	334924, 334925, 334926, 334927, 334928, 334929, 334930, 334931, 334932, 334933, 334934, 334935, 334936, 334937, 334938, 334939,
	334940, 334941, 334942, 334943, 334944, 334945
};

local currentMove = {
	[CULLIN1_TYPE] = 0,
	[FHELIK1_TYPE] = 0,
	[KUFUR1_TYPE] = 0,
	[SHIKTAN1_TYPE] = 0
};
local lastStop = {
	[CULLIN1_TYPE] = 0,
	[FHELIK1_TYPE] = 0,
	[KUFUR1_TYPE] = 0,
	[SHIKTAN1_TYPE] = 0
};
phase = 0;
cullin, fhelik, kufur, shiktan = 0, 0, 0, 0;
local victory = false;
cullinArrived = false;
shiktanArrived = false;
fhelikArrived = false;
kufurArrived = false;

function Move(mob, moveN)

	local typeID = mob:GetNPCTypeID();
	
	if ( not moveN ) then
		moveN = currentMove[typeID];		-- move back to previous stopped waypoint or the WP we were going to
	elseif ( moveN == "next" ) then
		moveN = currentMove[typeID] + 1;	-- move to next WP
	end

	currentMove[typeID] = moveN;
	
	if ( MOVES[typeID][moveN] ) then
		local coords = MOVES[typeID][moveN];
		mob:CastToNPC():MoveTo(coords.x, coords.y, coords.z, coords.h, true);
	end
end

function DepopCamps()
	
	if ( DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: Depoping Camps ") end
	
	local npcList = eq.get_entity_list():GetNPCList();
	
	if ( npcList ) then
	
		local campHashMap = {};
		for _, id in ipairs(CAMP_SPAWNIDS) do
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

	if ( DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: Repoping Camps ") end
	
	local elist = eq.get_entity_list();
	
	for _, id in ipairs(CAMP_SPAWNIDS) do
		--eq.spawn_from_spawn2(id);
		elist:GetSpawnByID(id):SetTimer(1);
	end
end

-- true == cat, false == grimling
function FlipFlags(state)
	
	local door;

	for i = 76, 78 do
		door = eq.get_entity_list():GetDoorsByDoorID(i);
		if ( door ) then
			if ( state ) then
				door:ForceOpen(eq.get_entity_list():GetMobByNpcTypeID(EVENT_GOVERNOR_TYPE));
			else
				door:ForceClose(eq.get_entity_list():GetMobByNpcTypeID(EVENT_GOVERNOR_TYPE));
			end
		end
	end
	
end

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

	if ( DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: Wave Spawn ") end

	local mob, typeID, t, coords;
	local waveSize = math.random(3, 5);
	
	for campIdx, camp in ipairs(GRIMLING_SPAWNS) do	
		
		if ( campIdx == 1 ) then
			t = GetRandoms(#camp, waveSize + 1);
		else
			t = GetRandoms(#camp, waveSize);
		end
		
		for _, coordIdx in ipairs(t) do
		
			coords = camp[coordIdx];
			typeID = WAR_SPAWN_TYPES[math.random(1, #WAR_SPAWN_TYPES)];
			
			if ( coords.hc and math.random(100) <= 3 ) then		-- ~41.7 minutes avg; 3% wave, ~75s between waves avg
				typeID = HIGH_COMMANDER_TYPE;
				if ( DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: --- High Commander Spawn --- ") end
			end
			
			mob = eq.spawn2(typeID, coords.g, 0, coords.x, coords.y, coords.z, coords.h);
			mob:SetRunning(true);
			
			-- TAKP's mob 'search for players to kill' timer is short, which trivializes this event if you sit on spawn points
			-- so this is here to make mobs sometimes run past players who sit in the run paths
			if ( not coords.hc ) then
				if ( math.random(100) <= 15 ) then
					mob:SetAggroRange(1);
				elseif ( math.random(100) <= 15 ) then
					mob:SetAssistRange(5);
				end
			end
		end
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

function WarSignalEvent(e)

	if ( e.signal == 1 ) then
		if ( DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: --- Phase 2 Start --- ") end
		phase = 2;
		
		-- poof moving cats, spawn perma rooted versions
		local loc = ROOTED_SPAWNS[CULLIN2_TYPE];
		cullin = eq.spawn2(CULLIN2_TYPE, 0, 0, loc.x, loc.y, loc.z, loc.h);
		loc = ROOTED_SPAWNS[FHELIK2_TYPE];
		fhelik = eq.spawn2(FHELIK2_TYPE, 0, 0, loc.x, loc.y, loc.z, loc.h);
		loc = ROOTED_SPAWNS[KUFUR2_TYPE];
		kufur = eq.spawn2(KUFUR2_TYPE, 0, 0, loc.x, loc.y, loc.z, loc.h);
		loc = ROOTED_SPAWNS[SHIKTAN2_TYPE];
		shiktan = eq.spawn2(SHIKTAN2_TYPE, 0, 0, loc.x, loc.y, loc.z, loc.h);
		
		eq.depop_all(CULLIN1_TYPE);
		eq.depop_all(FHELIK1_TYPE);
		eq.depop_all(KUFUR1_TYPE);
		eq.depop_all(SHIKTAN1_TYPE);
		if ( DEBUG_MODE ) then
			cullin:CastToNPC():AddItem(2661, 1, true);	-- no rent uber swords
			shiktan:CastToNPC():AddItem(2661, 1, true);
			fhelik:CastToNPC():AddItem(2661, 1, true);
			kufur:CastToNPC():AddItem(2661, 1, true);
		end		

		FlipFlags(true);

		eq.set_timer("spawn", 60000);
		eq.spawn_condition("grimling", 6, 0);		-- disable camp respawns
		
	elseif ( e.signal == 2 ) then
		if ( DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: --- Phase 3 Start --- ") end
		eq.stop_timer("spawn");
		
		if ( victory ) then
			eq.set_timer("cleanup", 300000);
			DisableCat(cullin);
			DisableCat(shiktan);
			DisableCat(kufur);
			DisableCat(fhelik);
		else
			eq.set_timer("cleanup", 10000);
		end
		if ( phase == 2 ) then
			eq.set_timer("repop", 305000);
		end
		phase = 3;
	end
end

function WarTimerEvent(e)
	if ( e.timer == "spawn" ) then
		SpawnWave();
		local t = (eq.ChooseRandom(40, 65, 105) + math.random(1, 10)) * 1000;
		eq.set_timer("spawn", t);
		
	elseif ( e.timer == "cleanup" ) then
		eq.stop_timer("cleanup");
		eq.stop_timer("spawn");
		phase = 0;
		cullinArrived = false;
		shiktanArrived = false;
		fhelikArrived = false;
		kufurArrived = false;
		if ( victory ) then
			FlipFlags(false);
		end
		victory = false;
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(CULLIN0_TYPE) ) then
			eq.spawn_from_spawn2(CULLIN_SPAWNID);
		end
		eq.spawn_condition("grimling", 6, 1);		-- enable camp respawns	
		eq.depop(CULLIN1_TYPE);
		eq.depop(CULLIN2_TYPE);
		eq.depop(FHELIK1_TYPE);
		eq.depop(FHELIK2_TYPE);
		eq.depop(KUFUR1_TYPE);
		eq.depop(KUFUR2_TYPE);
		eq.depop(SHIKTAN1_TYPE);
		eq.depop(SHIKTAN2_TYPE);
		currentMove = {
			[CULLIN1_TYPE] = 0,
			[FHELIK1_TYPE] = 0,
			[KUFUR1_TYPE] = 0,
			[SHIKTAN1_TYPE] = 0
		};
		lastStop = {
			[CULLIN1_TYPE] = 0,
			[FHELIK1_TYPE] = 0,
			[KUFUR1_TYPE] = 0,
			[SHIKTAN1_TYPE] = 0
		};
		
		if ( DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: --- Grimling War Reset --- ") end
		
	elseif ( e.timer == "repop" ) then
		eq.stop_timer("repop");
		RepopCamps();
	end
end

function WarFailed(e)
	if ( DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: War Failure"); end

	if ( phase == 2 ) then
		e.self:Shout("Nooo! Our hopes are lost! The grunts have survived the invasion...");
		
		if ( fhelik.valid and fhelik:GetHP() > 0 ) then
			fhelik:Say("One of my comrades has perished! The invasion has failed. Leave this place at once, the grimlings will overrun the camp at any moment!");
		end
		if ( kufur.valid and kufur:GetHP() > 0 ) then
			kufur:Say("One of my comrades has perished! The invasion has failed. Leave this place at once, the grimlings will overrun the camp at any moment!");
		end
		if ( shiktan.valid and shiktan:GetHP() > 0 ) then
			shiktan:Say("One of my comrades has perished! The invasion has failed. Leave this place at once, the grimlings will overrun the camp at any moment!");
		end
		if ( cullin.valid and cullin:GetHP() > 0 ) then
			cullin:Say("One of my comrades has perished! The invasion has failed. Leave this place at once, the grimlings will overrun the camp at any moment!");
		end
	elseif ( phase == 1 ) then
		-- some of these may be wrong
		if ( cullin.valid and cullin:GetHP() > 0 ) then
			cullin:Say("At least one of my troops have perished. We have failed!");
		end
		if ( fhelik.valid and fhelik:GetHP() > 0 ) then
			fhelik:Say("At least one of my comrades have fallen to the enemy. We have failed!");
		end
		if ( kufur.valid and kufur:GetHP() > 0 ) then
			kufur:Say("At least one of my comrades have fallen to the enemy. We have failed!");
		end
		if ( shiktan.valid and shiktan:GetHP() > 0 ) then
			shiktan:Say("At least one of my comrades have fallen to the enemy. We have failed!");
		end
	end
	
	FlipFlags(false);
	eq.signal(EVENT_GOVERNOR_TYPE, 2);
	
	if ( DEBUG_MODE ) then
		eq.depop();		-- make sure no-rent swords poof in case debug mode gets pushed to live on accident
	end
end

function WarSuccess()
	if ( DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: War Victory") end

	-- unknown if they all say this or just Shiktan
	if ( fhelik.valid ) then
		fhelik:Say("Hoorah!! We've done it! The grimling high commander has been vanquished! Leave this place now, friends. The grimlings will be returning soon to exact their revenge...");
	end
	if ( kufur.valid ) then
		kufur:Say("Hoorah!! We've done it! The grimling high commander has been vanquished! Leave this place now, friends. The grimlings will be returning soon to exact their revenge...");
	end
	if ( shiktan.valid ) then
		shiktan:Say("Hoorah!! We've done it! The grimling high commander has been vanquished! Leave this place now, friends. The grimlings will be returning soon to exact their revenge...");
	end
	victory = true;
	eq.signal(EVENT_GOVERNOR_TYPE, 2);
end

function Cullin0Hail(e)
	if ( e.message:findi("hail") ) then
		e.self:Emote("Veteran Cullin nods at you in acknowledgement, '"..e.other:GetCleanName()..", you're welcome to enjoy the sanctuary we have established here, but the safety we provide comes at a price. You must take up arms and join in the war against the grimlings. Take what you need and rest up, then get out there and make a dent in the numbers of their horde!");
	end
end

function Cullin1Hail(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Pay attention, "..e.other:GetCleanName()..". Your complete focus must be on my orders.");
	end
end

function Cullin0Trade(e)
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, { item1 = 6191 }, 0) ) then -- Staginar's Battle Orders
		e.self:Say("Finally! An army with the courage to bring these scum to their knees! I pray that you have the numbers and the prowess to match your heart or we'll be fed to the grunts for dinner tonight. The general instructed me to ready my troops when he gave you his orders, follow me and I'll brief you all together.");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 25 * ONE_THOUSAND);
		
		eq.set_timer("beginwar", 20 * ONE_THOUSAND);
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end

function Cullin2Trade(e)
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, { item1 = 6270 }, 0) ) then -- Arm of the Grimling High Commander
		e.self:Say(e.other:GetCleanName().."! you've surpassed my most optimistic hopes and conquered the grimling stronghold. Please accept this medallion as a token of the gratitude of all Vah Shir. The Jharin will tell tales of your victory as long as our people exist. Your name shall be held in reverence from this day forward. Take the piece of the acrylia obelisk back to the general and he will isntuct you further. It has been an honor serving with you, farewell!");
		
		e.other:QuestReward(e.self, 0, 0, 0, 0, 6271); -- Medallion of the Hero of Shar Vahl
		e.other:QuestReward(e.self, 0, 0, 0, 0, 6192); -- Acrylia Obelisk Half
		
		WarSuccess();
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end

function ReturnItemsTrade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end

function Cullin0Timer(e)
	if ( e.timer == "beginwar" ) then
		eq.stop_timer("beginwar");
		phase = 1;
		if ( DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: --- Phase 1 Start --- ") end
		victory = false;
		
		cullin  = eq.spawn2(CULLIN1_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		fhelik  = eq.spawn2(FHELIK1_TYPE, 0, 0, -1033, -959, 24, 192);
		kufur   = eq.spawn2(KUFUR1_TYPE, 0, 0, -1044, -974, 28, 242);
		shiktan = eq.spawn2(SHIKTAN1_TYPE, 0, 0, -1060, -968, 31, 38);

		if ( DEBUG_MODE ) then
			cullin:SetRunning(true);
			shiktan:SetRunning(true);
			fhelik:SetRunning(true);
			kufur:SetRunning(true);
			cullin:CastToNPC():AddItem(2661, 1, true);	-- no rent uber swords
			shiktan:CastToNPC():AddItem(2661, 1, true);
			fhelik:CastToNPC():AddItem(2661, 1, true);
			kufur:CastToNPC():AddItem(2661, 1, true);
		end		

		Move(cullin, 1);
		
		eq.set_timer("endevent", 10800000, cullin);	-- 3 hours to finish phase 1 or event resets; in case event bugs out
		eq.depop();
	end
end

function Cullin1Timer(e)
		
	if ( e.timer == "movenext" ) then
		eq.stop_timer("movenext");
		Move(e.self, "next");
		
	elseif ( e.timer == "talk2" ) then
		eq.stop_timer("talk2");
		e.self:Say("Orders are orders Shiktan, now let's get to work. Kufur, what are your findings?");
		eq.set_timer("talk1", 47 * ONE_THOUSAND, kufur);
		
	elseif ( e.timer == "talk3" ) then
		eq.stop_timer("talk3");
		e.self:Say("It is about as I expected. Fhelik, you'll lead the raid upon the smaller camp south of the stronghold. Kufur, you will assault the larger camp. Shiktan and I will lead the invasion into the stronghold itself. Fhelik, take who you need and make your way to the attack position.");
		eq.set_timer("talk1", 47 * ONE_THOUSAND, fhelik);
		
	elseif ( e.timer == "talk4" ) then
		eq.stop_timer("talk4");
		e.self:Say("Kufur, take some soldiers and depart to your attack position. Take only the troops you need, we'll be hard pressed to take the stronghold with the rest..");
		eq.set_timer("talk2", 47 * ONE_THOUSAND, kufur);
		
	elseif ( e.timer == "talk5" ) then
		eq.stop_timer("talk5");
		e.self:Say("Half of you that remain follow Shiktan and the rest protect me. Be well Shik, and no matter what the outcome I'll look forward to seeing you when it's over.");
		eq.set_timer("talk2", 47 * ONE_THOUSAND, shiktan);

	elseif ( e.timer == "talk6" ) then
		eq.stop_timer("talk6");
		e.self:Say("Follow me closely, friends, and pray for success, for courage alone will not bring us the victory we so desperately seek.");
		eq.set_timer("move2", 10 * ONE_THOUSAND);
		
	elseif ( e.timer == "talk7" ) then
		eq.stop_timer("talk7");
		e.self:Say("All should be in position now. Make your final preparations, this will be a bloody battle indeed!");
		shiktan:Say("The attack will commence soon, make ready!");
		fhelik:Say("The attack will commence soon, make ready!");
		kufur:Say("The attack will commence soon, make ready!");
		eq.set_timer("talk8", 47 * ONE_THOUSAND);
		
	elseif ( e.timer == "talk8" ) then
		eq.stop_timer("talk8");
		e.self:Emote("raises his sword above his head and shouts, 'In honor of all who have fallen to the grimling scourge, I claim this land in the name of the king!'");
		eq.set_timer("talk9", 140 * ONE_THOUSAND);
		eq.set_timer("campdepop", 139 * ONE_THOUSAND);

	elseif ( e.timer == "campdepop" ) then
		eq.stop_timer("campdepop");
		eq.set_timer("camprepop", 1000);
		DepopCamps();
		
	elseif ( e.timer == "camprepop" ) then
		eq.stop_timer("camprepop");
		RepopCamps();
		
	elseif ( e.timer == "talk9" ) then
		eq.stop_timer("talk9");
		e.self:Shout("Let the cleansing begin!");
		fhelik:Say("You heard him! Cut them down!");
		kufur:Say("Cleave them!");
		shiktan:Emote("growls a fierce battlecry and dashes into the deadly grimling stronghold.");
		cullin:SetRunning(true);
		shiktan:SetRunning(true);
		fhelik:SetRunning(true);
		kufur:SetRunning(true);
		Move(cullin, "next");
		Move(shiktan, "next");
		Move(fhelik, "next");
		Move(kufur, "next");
		
	elseif ( e.timer == "move2" ) then
		eq.stop_timer("move2");
		Move(cullin, "next");
		
	elseif ( e.timer == "endevent" ) then
		eq.signal(EVENT_GOVERNOR_TYPE, 2);
	end

end

function Fhelik1Timer(e)
	if ( e.timer == "movenext" ) then
		eq.stop_timer("movenext");
		Move(e.self, "next");
		
	elseif ( e.timer == "talk1" ) then
		eq.stop_timer("talk1");
		e.self:Say("Well, there are eight of 'em there now and no telling how many they'll send to reclaim the camp once we've cleared it. Give me a handful of men and I'll fight 'til there's no breath left in me.");
		eq.set_timer("talk4", 47 * ONE_THOUSAND, cullin);
		eq.set_timer("move1", 10 * ONE_THOUSAND);
		
	elseif ( e.timer == "move1" ) then
		eq.stop_timer("move1");
		Move(e.self, 1);
	end
end

function Kufur1Timer(e)
	if ( e.timer == "movenext" ) then
		eq.stop_timer("movenext");
		Move(e.self, "next");

	elseif ( e.timer == "talk1" ) then
		eq.stop_timer("talk1");
		e.self:Say("I've scouted the area and they're dug in pretty well. There are two camps just to the south of the stronghold, one with eight grunts and one with nearly twenty. I couldn't get too close to the stronghold itself, but I'd guess there are at least two dozen there.");
		eq.set_timer("talk3", 47 * ONE_THOUSAND, cullin);
		
	elseif ( e.timer == "talk2" ) then
		eq.stop_timer("talk2");
		e.self:Say("At least fifteen of you follow me! There's glory to be had!");
		eq.set_timer("talk5", 47 * ONE_THOUSAND, cullin);
		eq.set_timer("move1", 10 * ONE_THOUSAND);
		
	elseif ( e.timer == "move1" ) then
		eq.stop_timer("move1");
		Move(e.self, 1);
	end
end

function Shiktan1Timer(e)
	if ( e.timer == "movenext" ) then
		eq.stop_timer("movenext");
		Move(e.self, "next");
	
	elseif ( e.timer == "talk1" ) then
		eq.stop_timer("talk1");
		e.self:Say("They don't look like much Cullin, but any excuse to get out there and stick a few grunts is fine with me.");
		eq.set_timer("talk2", 47 * ONE_THOUSAND, cullin);
		
	elseif ( e.timer == "talk2" ) then
		eq.stop_timer("talk2");
		e.self:Say("Look sharp and keep up! There are grimlings just waiting to taste steel. It would be rude to keep them waiting!");
		eq.set_timer("talk6", 47 * ONE_THOUSAND, cullin);
		eq.set_timer("move1", 10 * ONE_THOUSAND);

	elseif ( e.timer == "move1" ) then
		eq.stop_timer("move1");
		Move(e.self, 1);
	end
end

function WaypointArrived(e)

	local t = e.self:GetNPCTypeID();
	if ( MOVES[t] and currentMove[t] and MOVES[t][currentMove[t]] and currentMove[t] > 0 ) then
	
		if ( MOVES[t][currentMove[t]].arriveFunc and lastStop[t] ~= currentMove[t] ) then
			MOVES[t][currentMove[t]].arriveFunc(e);
		end
		
		if ( MOVES[t][currentMove[t]].stop ) then
			lastStop[t] = currentMove[t];		-- prevent arriveFunc from executing again if NPC aggros and resets		
		else
			if ( MOVES[t][currentMove[t] + 1] ) then
				eq.set_timer("movenext", 50);	-- immediately moving to next point bugs it out; have to put a short timer here
			end
		end
	end
end

function CombatEvent(e)
	if ( not e.joined ) then
		Move(e.self);
	end
end

function event_encounter_load(e)
	
	eq.register_npc_event("GrimlingWar", Event.timer, EVENT_GOVERNOR_TYPE, WarTimerEvent);
	eq.register_npc_event("GrimlingWar", Event.signal, EVENT_GOVERNOR_TYPE, WarSignalEvent);

	eq.register_npc_event("GrimlingWar", Event.say, CULLIN0_TYPE, Cullin0Hail);
	eq.register_npc_event("GrimlingWar", Event.trade, CULLIN0_TYPE, Cullin0Trade);
	eq.register_npc_event("GrimlingWar", Event.timer, CULLIN0_TYPE, Cullin0Timer);
	
	eq.register_npc_event("GrimlingWar", Event.timer, CULLIN1_TYPE, Cullin1Timer);
	eq.register_npc_event("GrimlingWar", Event.timer, FHELIK1_TYPE, Fhelik1Timer);
	eq.register_npc_event("GrimlingWar", Event.timer, KUFUR1_TYPE, Kufur1Timer);
	eq.register_npc_event("GrimlingWar", Event.timer, SHIKTAN1_TYPE, Shiktan1Timer);

	eq.register_npc_event("GrimlingWar", Event.say, CULLIN1_TYPE, Cullin1Hail);
	eq.register_npc_event("GrimlingWar", Event.trade, CULLIN2_TYPE, Cullin2Trade);

	eq.register_npc_event("GrimlingWar", Event.combat, CULLIN1_TYPE, CombatEvent);
	eq.register_npc_event("GrimlingWar", Event.combat, SHIKTAN1_TYPE, CombatEvent);
	eq.register_npc_event("GrimlingWar", Event.combat, FHELIK1_TYPE, CombatEvent);
	eq.register_npc_event("GrimlingWar", Event.combat, KUFUR1_TYPE, CombatEvent);

	eq.register_npc_event("GrimlingWar", Event.trade, CULLIN1_TYPE, ReturnItemsTrade);
	eq.register_npc_event("GrimlingWar", Event.trade, FHELIK1_TYPE, ReturnItemsTrade);
	eq.register_npc_event("GrimlingWar", Event.trade, KUFUR1_TYPE, ReturnItemsTrade);
	eq.register_npc_event("GrimlingWar", Event.trade, SHIKTAN1_TYPE, ReturnItemsTrade);
	eq.register_npc_event("GrimlingWar", Event.trade, FHELIK2_TYPE, ReturnItemsTrade);
	eq.register_npc_event("GrimlingWar", Event.trade, KUFUR2_TYPE, ReturnItemsTrade);
	eq.register_npc_event("GrimlingWar", Event.trade, SHIKTAN2_TYPE, ReturnItemsTrade);

	eq.register_npc_event("GrimlingWar", Event.waypoint_arrive, CULLIN1_TYPE, WaypointArrived);
	eq.register_npc_event("GrimlingWar", Event.waypoint_arrive, FHELIK1_TYPE, WaypointArrived);
	eq.register_npc_event("GrimlingWar", Event.waypoint_arrive, KUFUR1_TYPE, WaypointArrived);
	eq.register_npc_event("GrimlingWar", Event.waypoint_arrive, SHIKTAN1_TYPE, WaypointArrived);
	
	eq.register_npc_event("GrimlingWar", Event.death, CULLIN1_TYPE, WarFailed);
	eq.register_npc_event("GrimlingWar", Event.death, FHELIK1_TYPE, WarFailed);
	eq.register_npc_event("GrimlingWar", Event.death, KUFUR1_TYPE, WarFailed);
	eq.register_npc_event("GrimlingWar", Event.death, SHIKTAN1_TYPE, WarFailed);
	eq.register_npc_event("GrimlingWar", Event.death, CULLIN2_TYPE, WarFailed);
	eq.register_npc_event("GrimlingWar", Event.death, FHELIK2_TYPE, WarFailed);
	eq.register_npc_event("GrimlingWar", Event.death, KUFUR2_TYPE, WarFailed);
	eq.register_npc_event("GrimlingWar", Event.death, SHIKTAN2_TYPE, WarFailed);

	eq.spawn_condition("grimling", 6, 1);		-- enable camp respawns in case they are off due to zone crash or whatever
end
