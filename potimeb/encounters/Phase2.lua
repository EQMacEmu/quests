local INSTANCE_CONTROLLER_TYPE = 223077; -- _
local EVENTS_CONTROLLER_TYPE = 223078; -- _
local WINDSHAPEN_TYPE = 223075; -- Windshapen_Warlord_of_Air
local OVERSEER_TYPE = 223072; -- Earthen_Overseer
local RALTHOS_TYPE = 223076; -- Ralthos_Enrok
local WAR_SHAPEN_TYPE = 223074; -- War_Shapen_Emissary
local GUTRIPPING_TYPE = 223073; -- Gutripping_War_Beast
local UNDEAD_WAVE1_TYPE = 223055; -- an_undead_guardian (lvl 64 100,000 hp)
local UNDEAD_WAVE2_TYPE = 223056; -- an_undead_guardian (lvl 64 110,000 hp)
local UNDEAD_WIZARD_TYPE = 223057; -- an_undead_guardian (lvl 65 wizard 120,000 hp)
local UNDEAD_WAVE3_TYPE = 223058; -- an_undead_guardian (lvl 66 skeleton 100,000 hp)
local UNDEAD_SUMMONED_TYPE = 223059; -- a_summoned_guardian

local MOBS = {
	TOP = {
		{ 223047, 253, 1459, 493, 144 }, -- An_Elemental_Stonefist (1056 unmez)
		{ 223048, 300, 1439, 493, 144 }, -- An_Elemental_Stonefist (870)
		{ 223049, 153, 1654, 493, 189, 157, 1601, 493, 186 }, -- An_Elemental_Stonefist (746)
		{ 223050, 151, 1684, 493, 189, 153, 1623, 493, 188 }, -- An_Elemental_Stonefist (932 unmez)
		{ 223045, 275, 1386, 493, 162, 233, 1433, 493, 162, 194, 1594, 493, 196, 199, 1672, 494, 200 }, -- An_Unholy_Rock_Fiend
		{ 223046, 251, 1413, 493, 162, 194, 1633, 494, 192 }, -- An_Unholy_Rock_Fiend (unmez)
		{ 223051, 190, 1329, 494, 192, 190, 1383, 494, 192 }, -- Champion_of_Korascian (832)
		{ 223052, 190, 1358, 494, 192, 190, 1400, 493, 192 }, -- Champion_of_Korascian (1041 unmez)
		{ 223053, 229, 1557, 493, 219 }, -- Champion_of_Korascian (1180 unmez)
		{ 223054, 269, 1626, 493, 219 }, -- Champion_of_Korascian (971)
		{ WINDSHAPEN_TYPE, 438, 1470, 499, 192 }, -- Windshapen_Warlord_of_Air
		{ OVERSEER_TYPE, 436, 1535, 499, 192 }, -- Earthen_Overseer
	},
	MID = {
		{ UNDEAD_WAVE1_TYPE, 242, 1118, 497, 192, 242, 1101, 497, 192 }, -- an_undead_guardian (lvl 64 100,000 hp)
		{ UNDEAD_WAVE2_TYPE, 114, 1140, 494, 128, 114, 1060, 494, 0 }, -- an_undead_guardian (lvl 64 110,000 hp)
		{ UNDEAD_WIZARD_TYPE, 106, 1108, 494, 64 }, -- an_undead_guardian (lvl 65 wizard 120,000 hp)
		{ UNDEAD_WAVE3_TYPE, 289, 1087, 494, 0, 317, 1087, 494, 0, 317, 1126, 494, 128, 289, 1126, 495, 128 }, -- an_undead_guardian (lvl 66 skeleton 100,000 hp)
		{ UNDEAD_SUMMONED_TYPE, 
			386, 1104, 496, 64,
			406, 1125, 496, 128,
			406, 1084, 496, 0,
			273, 1109, 496, 64,
			157, 1103, 496, 64,
			117, 1071, 496, 0,
			124, 1136, 496, 128,
		}, -- a_summoned_guardian
		{ RALTHOS_TYPE, 439, 1109, 500, 192 }, -- Ralthos_Enrok
	},
	BOT = {
		{ 223060, 130, 885, 496, 192, 126, 835, 496, 192 },	-- A_Crustacean_Champion (unmez)
		{ 223061, 131, 907, 496, 192, 130, 859, 496, 192 },	-- A_Crustacean_Champion
		{ 223062, 207, 816, 496, 192 }, -- A_Deepwater_Assassin
		{ 223063, 232, 875, 494, 192 }, -- A_Deepwater_Assassin (unmez)
		{ 223064, 212, 637, 496, 192 }, -- A_Ferocious_Warboar 
		{ 223065, 243, 586, 496, 192 }, -- A_Ferocious_Warboar (unmez)
		{ 223070, 132, 591, 496, 192, 126, 541, 496, 192 }, -- A_Fire_Etched_Doombringer (unmez)
		{ 223071, 141, 611, 496, 192, 131, 569, 496, 192 }, -- A_Fire_Etched_Doombringer
		{ 223066, 166, 613, 496, 192, 181, 540, 496, 192 }, -- A_Smoldering_Elemental
		{ 223067, 174, 579, 496, 192 }, -- A_Smoldering_Elemental (unmez)
		{ 223068, 173, 826, 496, 192, 181, 895, 496, 192 }, -- A_Watercrafted_Hunter
		{ 223069, 184, 860, 496, 192 }, -- A_Watercrafted_Hunter (unmez)
		{ WAR_SHAPEN_TYPE, 109, 865, 500, 192 }, -- War_Shapen_Emissary
		{ GUTRIPPING_TYPE, 105, 573, 500, 192 }, -- Gutripping_War_Beast
	},
};
local GRIDS = {
	[WINDSHAPEN_TYPE] = {	-- Windshapen_Warlord_of_Air
		260, 1586, 499, 55, 146,
		197, 1624, 499, 55, 146,
		115, 1645, 499, -1, 1,
		161, 1635, 499, 193, 9999
	},
	[OVERSEER_TYPE] = {	-- Earthen_Overseer
		287, 1453, 496, 64, 146,
		250, 1381, 496, 62, 146,
		123, 1356, 496, -1, 1,
		192, 1356, 496, 193, 9999
	},
	[WAR_SHAPEN_TYPE] = {	-- War_Shapen_Emissary
		139, 867, 499, 235, 146,
		193, 866, 499, 97, 146,
		255, 816, 499, 238, 1,
		194, 846, 499, 75, 9999
	},
	[GUTRIPPING_TYPE] = {	-- Gutripping_War_Beast
		140, 579, 499, 214, 146,
		169, 588, 499, 88, 146,
		236, 638, 499, 237, 1,
		166, 577, 499, 46, 9999
	},
	[UNDEAD_WAVE1_TYPE] = {	-- an_undead_guardian (lvl 64 100,000 hp)
		188, 1122, 497, 192, 20,
		242, 1118, 497, 192, 9999
	},
	[55] = {	-- 2nd an_undead_guardian (lvl 64 100,000 hp)
		188, 1088, 497, 192, 20,
		242, 1101, 497, 192, 9999
	},
	[UNDEAD_WAVE2_TYPE] = {	-- an_undead_guardian (lvl 64 110,000 hp)
		114, 1120, 497, -1, 0,
		205, 1120, 497, 192, 25,
		114, 1120, 497, -1, 0,
		114, 1140, 497, 128, 9999
	},
	[56] = {	-- 2nd an_undead_guardian (lvl 64 110,000 hp)
		114, 1088, 497, -1, 0,
		205, 1088, 497, 192, 25,
		114, 1088, 497, -1, 0,
		114, 1060, 497, 0, 9999
	},
	[UNDEAD_WIZARD_TYPE] = {	-- an_undead_guardian (lvl 65 wizard 120,000 hp)
		327, 1110, 498, 192, 25,
		106, 1108, 497, 64, 9999
	},
};
local BOSS_NUMS = {
	[WINDSHAPEN_TYPE] = 1,
	[OVERSEER_TYPE]   = 2,
	[RALTHOS_TYPE]    = 3,
	[WAR_SHAPEN_TYPE] = 4,
	[GUTRIPPING_TYPE] = 5,
};

local ACTIVATES = {
	[WINDSHAPEN_TYPE] = {
		{ 223053, 223054, 21 },	-- Champion_of_Korascian (1180 unmez), Champion_of_Korascian (971)
		{ 223045, 223046, 23 }, -- An_Unholy_Rock_Fiend, An_Unholy_Rock_Fiend (unmez)
		{ 223049, 223050, 27 }, -- An_Elemental_Stonefist (746), An_Elemental_Stonefist (932 unmez)
	},
	[OVERSEER_TYPE] = {
		{ 223047, 223048, 27 }, -- -- An_Elemental_Stonefist (1056 unmez), An_Elemental_Stonefist (870)
		{ 223045, 223046, 23 }, -- An_Unholy_Rock_Fiend, An_Unholy_Rock_Fiend (unmez)
		{ 223051, 223052, 21 }, -- Champion_of_Korascian (832), Champion_of_Korascian (1041 unmez)
	},
	[WAR_SHAPEN_TYPE] = {
		{ 223060, 223061, 23 }, -- A_Crustacean_Champion (unmez), A_Crustacean_Champion
		{ 223068, 223069, 27 }, -- A_Watercrafted_Hunter, A_Watercrafted_Hunter (unmez)
		{ 223062, 223063, 1 }, -- A_Deepwater_Assassin, A_Deepwater_Assassin (unmez)
	},
	[GUTRIPPING_TYPE] = {
		{ 223070, 223071, 23 }, -- A_Fire_Etched_Doombringer (unmez), A_Fire_Etched_Doombringer
		{ 223066, 223067, 27 }, -- A_Smoldering_Elemental, A_Smoldering_Elemental (unmez)
		{ 223064, 223065, 21 },	-- A_Ferocious_Warboar, A_Ferocious_Warboar (unmez)
	},
};
local BOSS_BODYTYPES = {
	[WINDSHAPEN_TYPE] = 27,
	[OVERSEER_TYPE]   = 23,
	[WAR_SHAPEN_TYPE] = 23,
	[GUTRIPPING_TYPE] = 23,
};
local SHADOW_NAMES = {
	[WINDSHAPEN_TYPE] = "Shadow_of_the_Warlord",
	[OVERSEER_TYPE]   = "Shadow_of_the_Overseer",
	[RALTHOS_TYPE]    = "Shadow_of_Ralthos",
	[WAR_SHAPEN_TYPE] = "Shadow_of_the_Emissary",
	[GUTRIPPING_TYPE] = "Shadow_of_the_War_Beast",
};

local kills, undead1, undead2, undead3, shadows, ralthosAdds;

function SpawnPhase()

	local typ, x, y, z, h, g, mob;
	
	for region, rt in pairs(MOBS) do
		for _, t in pairs(rt) do
		
			typ = t[1];
			
			if ( region ~= "MID" or typ == UNDEAD_WAVE1_TYPE ) then
				for i = 2, #t, 4 do
				
					x, y, z, h = t[i], t[i+1], t[i+2], t[i+3];
					g = GRIDS[typ];
					if ( typ == UNDEAD_WAVE1_TYPE and y < 1110 ) then
						g = GRIDS[55];
					end
					
					if ( BOSS_NUMS[typ] and shadows[BOSS_NUMS[typ]] and shadows[BOSS_NUMS[typ]] == 1 ) then
						mob = eq.spawn2(typ, 0, 0, x, y, z, h, SHADOW_NAMES[typ]);
						mob:CastToNPC():ClearItemList();
					else
						mob = eq.spawn2(typ, 0, 0, x, y, z, h);
					end
					if ( g ) then
						SetGrid(mob:CastToNPC(), g);
					end
				end
			end
		end	
	end
end

function SetGrid(npc, grid)
	local x, y, z, h, p;
	npc:SetWanderType(6);
	npc:SetPauseType(1);
	npc:AddWaypoint(npc:GetX(), npc:GetY(), npc:GetZ(), -1, 0, false);
	
	for i = 1, #grid, 5 do
		x, y, z, h, p = grid[i], grid[i+1], grid[i+2], grid[i+3], grid[i+4];
		npc:AddWaypoint(x, y, z, h, p, false);
	end
end

function ActivateMobs(typ, bodyType)
	local npcList = eq.get_entity_list():GetNPCList();
	for npc in npcList.entries do
	
		if ( npc.valid and npc:GetNPCTypeID() == typ ) then
			npc:SetSpecialAbility(24, 0); -- Will Not Aggro off
			npc:SetSpecialAbility(25, 0); -- Immune Aggro off
			npc:SetSpecialAbility(35, 0); -- No Harm from Players off
			npc:SetBodyType(bodyType, false);
		end
	end

end

function Unpacket(s, numberize, returnTable)
	local t = {};
	for w in s:gmatch("([^;]+)") do
		if ( numberize ) then
			w = tonumber(w);
		end
		table.insert(t, w);
	end
	if (returnTable) then
		return t;
	else
		return unpack(t);
	end
end

function Phase2Signal(e)

	if ( e.signal == 201 ) then
		shadows = Unpacket(e.data, true, true);
		SpawnPhase();
		kills, undead1, undead2, undead3, ralthosAdds = 0, 0, 0, 0, 0;
	end
end

function BossWaypointArrive(e)
	local typ = e.self:GetNPCTypeID();

	if ( e.wp == 4 ) then
		ActivateMobs(typ, BOSS_BODYTYPES[typ]);
		e.self:RemoveWaypoints();
		e.self:SaveGuardSpot();
		
	elseif ( ACTIVATES[typ] ) then
		ActivateMobs(ACTIVATES[typ][e.wp][1], ACTIVATES[typ][e.wp][3]);
		ActivateMobs(ACTIVATES[typ][e.wp][2], ACTIVATES[typ][e.wp][3]);
		if ( e.wp == 3 ) then
			e.self:SetWalkspeed(0.6);
		end
	end
end

function SpawnUndeadWave(typ)

	local m;
	for i, t in ipairs(MOBS.MID) do
		if ( t[1] == typ ) then
			m = t;
			break;
		end
	end
	
	local x, y, z, h, g, mob;
	local secondGrid = typ - 223000;
	secondGrid = GRIDS[secondGrid];

	for i = 2, #m, 4 do
		x, y, z, h = m[i], m[i+1], m[i+2], m[i+3];
		g = GRIDS[typ];
		if ( i == 6 and secondGrid ) then
			g = secondGrid;
		end

		if ( BOSS_NUMS[typ] and shadows[BOSS_NUMS[typ]] and shadows[BOSS_NUMS[typ]] == 1 ) then
			mob = eq.spawn2(typ, 0, 0, x, y, z, h, SHADOW_NAMES[typ]);
			mob:CastToNPC():ClearItemList();
		else
			mob = eq.spawn2(typ, 0, 0, x, y, z, h);
		end
		if ( g ) then
			SetGrid(mob:CastToNPC(), g);
		end
	end

end

function CheckEmote(typ)
	local tabl;
	for _, t in pairs(MOBS) do
		for _, t2 in pairs(t) do
			if ( t2[1] == typ ) then
				tabl = t;
				break;
			end
		end
		if ( tabl ) then
			break;
		end
	end
	
	local found = false;
	local elist = eq.get_entity_list();

	for i, v in pairs(tabl) do
		if ( elist:IsMobSpawnedByNpcTypeID(v[1]) ) then
			return;
		end
	end
	
	eq.zone_emote(0, "Ethereal mists gather at the far wall, causing it fade in and out of focus.");
end

function DeathComplete(e)
	kills = kills + 1;
	eq.debug("Phase 2 kills == "..kills, 3);
	
	local typ = e.self:GetNPCTypeID();
	if ( typ == UNDEAD_WAVE1_TYPE ) then
		undead1 = undead1 + 1;
		if ( undead1 == 2 ) then
			SpawnUndeadWave(UNDEAD_WAVE2_TYPE);
		end
	
	elseif ( typ == UNDEAD_WAVE2_TYPE ) then
		undead2 = undead2 + 1;
		if ( undead2 == 2 ) then
			SpawnUndeadWave(UNDEAD_WAVE3_TYPE);
			SpawnUndeadWave(UNDEAD_WIZARD_TYPE);
		end
	
	elseif ( typ == UNDEAD_WAVE3_TYPE or typ == UNDEAD_WIZARD_TYPE ) then
		undead3 = undead3 + 1;
		if ( undead3 == 5 ) then
			SpawnUndeadWave(RALTHOS_TYPE);
		end	
	end
	
	CheckEmote(typ);
	
	if ( kills >= 54 ) then
		local elist = eq.get_entity_list();
		
		for bossType in pairs(BOSS_NUMS) do
			if ( elist:IsMobSpawnedByNpcTypeID(bossType) ) then
				return;
			end
		end
		eq.signal(INSTANCE_CONTROLLER_TYPE, 7);		-- tell controller phase is complete
	end
end

function BossDeathComplete(e)
	-- in case GM kills it too fast
	if ( e.self:GetNPCTypeID() == RALTHOS_TYPE ) then
		if ( ralthosAdds == 0 ) then
			SpawnBossAdds(e.self);
			SpawnBossAdds(e.self);
		elseif ( ralthosAdds == 2 ) then
			SpawnBossAdds(e.self);
		end
	end
	eq.signal(INSTANCE_CONTROLLER_TYPE, 6, 0, "2;"..BOSS_NUMS[e.self:GetNPCTypeID()]);
	DeathComplete(e);
end

function RalthosSpawn(e)
	eq.set_next_hp_event(75);
end

function RalthosHP(e)
	if ( e.hp_event == 75 ) then
		eq.set_next_hp_event(25);
	end
	SpawnBossAdds(e.self);
end

function SpawnBossAdds(boss)

	local m;
	for i, t in ipairs(MOBS.MID) do
		if ( t[1] == UNDEAD_SUMMONED_TYPE ) then
			m = t;
			break;
		end
	end

	local spawn = math.random(1, 7);
	
	if ( boss:GetX() > 355 ) then
		spawn = math.random(1, 4);
	elseif ( boss:GetX() < 175 ) then
		spawn = math.random(4, 7);
	end
	
	local x = m[(spawn-1)*4+2] + math.random(-10, 10);
	local y = m[(spawn-1)*4+3] + math.random(-10, 10);
	local z = m[(spawn-1)*4+4];
	local h = m[(spawn-1)*4+4];
	
	local mob = eq.spawn2(UNDEAD_SUMMONED_TYPE, 0, 0, x, y, z, h);
	mob:CastToNPC():MoveTo(boss:GetX(), boss:GetY(), boss:GetZ(), -1, true);
	mob = eq.spawn2(UNDEAD_SUMMONED_TYPE, 0, 0, x, y, z, h);
	mob:CastToNPC():MoveTo(boss:GetX(), boss:GetY(), boss:GetZ(), -1, true);
	ralthosAdds = ralthosAdds + 2;
end

function event_encounter_load(e)
	eq.register_npc_event("Phase2", Event.signal, EVENTS_CONTROLLER_TYPE, Phase2Signal);
	eq.register_npc_event("Phase2", Event.waypoint_arrive, WINDSHAPEN_TYPE, BossWaypointArrive);
	eq.register_npc_event("Phase2", Event.waypoint_arrive, OVERSEER_TYPE, BossWaypointArrive);
	eq.register_npc_event("Phase2", Event.waypoint_arrive, GUTRIPPING_TYPE, BossWaypointArrive);
	eq.register_npc_event("Phase2", Event.waypoint_arrive, WAR_SHAPEN_TYPE, BossWaypointArrive);
	for _, t in pairs(MOBS) do
		for _, t2 in pairs(t) do
			eq.register_npc_event("Phase2", Event.death_complete, t2[1], DeathComplete);
		end
	end
	eq.register_npc_event("Phase2", Event.death_complete, WINDSHAPEN_TYPE, BossDeathComplete);
	eq.register_npc_event("Phase2", Event.death_complete, OVERSEER_TYPE, BossDeathComplete);
	eq.register_npc_event("Phase2", Event.death_complete, RALTHOS_TYPE, BossDeathComplete);
	eq.register_npc_event("Phase2", Event.death_complete, GUTRIPPING_TYPE, BossDeathComplete);
	eq.register_npc_event("Phase2", Event.death_complete, WAR_SHAPEN_TYPE, BossDeathComplete);
	
	eq.register_npc_event("Phase2", Event.hp, RALTHOS_TYPE, RalthosHP);
	eq.register_npc_event("Phase2", Event.spawn, RALTHOS_TYPE, RalthosSpawn);
end
