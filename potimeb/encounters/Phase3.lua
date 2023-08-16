local BODY_TYPES = { 21, 1, 3, 3, 21, 1, 23, 1, 1, 21, 1, 3, 3, 3, 23, 23 };
local SHADOW_NAMES = {
	"Shadow_of_the_Ferocious_Warboar", "Shadow_of_Blackheart", "Shadow_of_Xeroan", "Shadow_of_Kraksmaal",
	"Shadow_of_the_Deadly_Warboar", "Shadow_of_Skullsmash", "Shadow_of_Herlsoakian", "Shadow_of_Sinrunal", 
	"Shadow_of_Rianit", "Shadow_of_a_Needletusk_Warboar", "Shadow_of_Xerskel", "Shadow_of_Dersool",
	"Shadow_of_the_Squad_Leader", "Shadow_of_the_Dark_Knight", "Shadow_of_the_Champion", "Shadow_of_Dreamwarp", 
	"Shadow_of_the_Avatar", "Shadow_of_the_Guardian",
};

local WAVES = {
	{ 223084, 223083,				  -- A_Ferocious_Warboar, Deathbringer_Blackheart
	  223079, 223081, 223082, 223080, -- a_deceiver_of_zek (69), A_Dark_Guardian_of_the_Warlord (69), A_Pig_of_War, Champion_of_War
	  223081, 223079, 223081, 223079, -- A_Dark_Guardian_of_the_Warlord (69), a_deceiver_of_zek (69), A_Dark_Guardian_of_the_Warlord (69), a_deceiver_of_zek (69)
	},
	{ 223090, 223091,				  -- Xeroan_Xi`Geruonask, Kraksmaal_Fir`Dethsalsin
	  223085, 223087, 223088, 223087, -- Revenant_of_the_Plaguebringer (68), Incantator_of_the_Plaguebringer, Footman_of_the_Plaguebringer, Incantator_of_the_Plaguebringer
	  223086, 223089, 223086, 223085, -- Archon_of_the_Plaguebringer, Revenant_of_the_Plaguebringer (70), Archon_of_the_Plaguebringer, Revenant_of_the_Plaguebringer (68)
	},
	{ 223096, 223097,				  -- A_Deadly_Warboar, Deathbringer_Skullsmash
	  223092, 223094, 223093, 223095, -- a_deceiver_of_zek (70), A_Dark_Guardian_of_the_Warlord (70), A_Zek_Bloodtusk, A_Warlord_of_Zek
	  223094, 223092, 223094, 223092, -- A_Dark_Guardian_of_the_Warlord (70), a_deceiver_of_zek (70), A_Dark_Guardian_of_the_Warlord (70), a_deceiver_of_zek (70)
	},
	{ 223101, 223105,				  -- Herlsoakian, Sinrunal_Gorgedreal
	  223099, 223103, 223135, 223102, -- A_Ferocious_Cube_Phantasmist (67), Vanquisher_of_the_Faceless (68), A_Ferocious_Cube_Formation, Battlemaster_of_the_Faceless
	  223104, 223098, 223103, 223100, -- Vanquisher_of_the_Faceless (70), An_Arcane_Cube_Formation, Vanquisher_of_the_Faceless (68), A_Ferocious_Cube_Phantasmist (69)
	},
	{ 223109, 223108,				  -- Deathbringer_Rianit, A_Needletusk_Warboar
	  223106, 223107, 223106, 223107, -- A_warboar_of_suffering, A_Minion_of_the_Warlord, A_warboar_of_suffering, A_Minion_of_the_Warlord
	  223094, 223092, 223107, 223106, -- A_Dark_Guardian_of_the_Warlord (70), a_deceiver_of_zek (70), A_Minion_of_the_Warlord, A_warboar_of_suffering
	},
	{ 223115, 223116,				  -- Xerskel_Gerodnsal, Dersool_Fal`Giersnaol
	  223111, 223114, 223111, 223110, -- Dark_Priest_of_Innoruuk (68), Nightwalker_of_Hate (female), Dark_Priest_of_Innoruuk (68), Assassin_of_Hate
	  223113, 223112, 223110, 223112, -- Nightwalker_of_Hate (male), Dark_Priest_of_Innoruuk (70), Assassin_of_Hate, Dark_Priest_of_Innoruuk (70)
	},
	{ 223124, 223123,				  -- Undead_Squad_Leader, Dark_Knight_of_Terris
	  223122, 223122, 223122, 223121, -- Knight_of_Nightmare (70), Knight_of_Nightmare (70), Knight_of_Nightmare (70), Knight_of_Nightmare (68), 
	  223120, 223117, 223119, 223118, -- A_Hobgoblin_Servant (rogue), Undead_Pawn_of_Terris (SK), A_Hobgoblin_Servant (war), Undead_Pawn_of_Terris (war)
	},
	{ 223132, 223131,				  -- Champion_of_Torment, Dreamwarp
	  223125, 223129, 223127, 223130, -- Templar_of_Saryrn, Cutthroat_of_Saryrn, Thaumathurgist_of_Saryrn, Warbeast_of_Saryrn
	  223128, 223126, 223128, 223125, -- Dark_Knight_of_Saryrn, Doombringer_of_Saryrn, Dark_Knight_of_Saryrn, Templar_of_Saryrn
	},
	{ 223134, 223133 }, -- Avatar_of_the_Elements, Supernatural_Guardian
};

local BOSS_LOCS = {
	1230, 910,
	1230, 890,
	1260, 970,
	1260, 950,
	1230, 1330,
	1230, 1310,
	1260, 1270,
	1260, 1250,
	1280, 1030,
	1280, 1010,
	1280, 1210,
	1280, 1190,
	1300, 1150,
	1300, 1130,
	1300, 1090,
	1300, 1070,
	1563, 1110,
	1492, 1110,
};

local SPAWN_LOCS = {
	1250, 1135, 1250, 1085,
	1200, 1185, 1200, 1135, 1200, 1085, 1200, 1035,
	1150, 1185, 1150, 1135, 1150, 1085, 1150, 1035,
};

local INSTANCE_CONTROLLER_TYPE = 223077; -- _
local EVENTS_CONTROLLER_TYPE = 223078; -- _

local shadows, kills, wave;
local mobsAggro = 0;
local waveIDs;

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

function Phase3Signal(e)

	if ( e.signal == 301 ) then
		shadows = Unpacket(e.data, true, true);
		kills = 0;
		wave = 0;
		SpawnPhase();
	end
end

function SpawnPhase()
	local x, y, bossNum;
	local z, h = 359.375, 192;
	
	for wave, waveTable in ipairs(WAVES) do
		if ( wave == 9 ) then
			break;
		end
		
		-- spawn untargetable bosses
		
		x = BOSS_LOCS[(wave-1)*4+1];
		y = BOSS_LOCS[(wave-1)*4+2];
		bossNum = (wave-1)*2+1;

		if ( shadows[bossNum] and shadows[bossNum] == 1 ) then
			eq.spawn2(waveTable[1], 0, 0, x, y, z, h, SHADOW_NAMES[bossNum]);
		else
			eq.spawn2(waveTable[1], 0, 0, x, y, z, h);
		end
		
		x = BOSS_LOCS[(wave-1)*4+3];
		y = BOSS_LOCS[(wave-1)*4+4];
		bossNum = bossNum + 1;
		
		if ( shadows[bossNum] and shadows[bossNum] == 1 ) then
			eq.spawn2(waveTable[2], 0, 0, x, y, z, h, SHADOW_NAMES[bossNum]);
		else
			eq.spawn2(waveTable[2], 0, 0, x, y, z, h);
		end
	end
	SpawnWave();
end

function SpawnWave()
	wave = wave + 1;
	kills = 0;
	mobsAggro = 0;
	waveIDs = {};

	if ( wave == 9 ) then
	
		-- spawn final two rock bosses
		
		local x = BOSS_LOCS[(wave-1)*4+1];
		local y = BOSS_LOCS[(wave-1)*4+2];
		local z = 386.75;
		local h = 192;
		local bossNum = (wave-1)*2+1;
		
		if ( shadows[bossNum] and shadows[bossNum] == 1 ) then
			eq.spawn2(WAVES[wave][1], 0, 0, x, y, z, h, SHADOW_NAMES[bossNum]);
		else
			eq.spawn2(WAVES[wave][1], 0, 0, x, y, z, h);
		end
		
		x = BOSS_LOCS[(wave-1)*4+3];
		y = BOSS_LOCS[(wave-1)*4+4];
		bossNum = bossNum + 1;
		
		if ( shadows[bossNum] and shadows[bossNum] == 1 ) then
			eq.spawn2(WAVES[wave][2], 0, 0, x, y, z, h, SHADOW_NAMES[bossNum]);
		else
			eq.spawn2(WAVES[wave][2], 0, 0, x, y, z, h);
		end
		
		return;
		
	elseif ( wave > 9 ) then
		return;
	end
	
	local elist = eq.get_entity_list();
	local boss1 = elist:GetNPCByNPCTypeID(WAVES[wave][1]);
	local boss2 = elist:GetNPCByNPCTypeID(WAVES[wave][2]);

	boss1:MoveTo(SPAWN_LOCS[1], SPAWN_LOCS[2], 359.375, 192, true);
	boss2:MoveTo(SPAWN_LOCS[3], SPAWN_LOCS[4], 359.375, 192, true);
	
	boss1:SetSpecialAbility(24, 0); -- Will Not Aggro off
	boss1:SetSpecialAbility(35, 0); -- No Harm from Players off
	boss1:SetBodyType(BODY_TYPES[(wave-1)*2+1], false);
	boss1:SetRunning(true);

	boss2:SetSpecialAbility(24, 0); -- Will Not Aggro off
	boss2:SetSpecialAbility(35, 0); -- No Harm from Players off
	boss2:SetBodyType(BODY_TYPES[(wave-1)*2+2], false);
	boss2:SetRunning(true);
	
	table.insert(waveIDs, boss1:GetID());
	table.insert(waveIDs, boss2:GetID());
	
	local mob;
	for i = 3, 10 do
		mob = eq.spawn2(WAVES[wave][i], 0, 0, SPAWN_LOCS[(i-1)*2+1], SPAWN_LOCS[(i-1)*2+2], 357, 192);
		table.insert(waveIDs, mob:GetID());
	end
end

function IsAllMobsAggro()
	local npc_list = eq.get_entity_list():GetNPCList();
	local typeid;
	local count = 0;
	for npc in npc_list.entries do
		typeid = npc:GetNPCTypeID();
		
		for _, wid in ipairs(WAVES[wave]) do
		
			if ( wid == typeid ) then
				if ( not npc:IsEngaged() ) then
					return false;
				else
					count = count + 1;
				end
			end
		end
	end
	if ( count > 0 ) then
		return true;
	else
		return false;
	end
end

function DeathComplete(e)
	kills = kills + 1;
	
	if ( kills == 10 ) then
		SpawnWave();
	end
end

function BossDeathComplete(e)
	local npcType = e.self:GetNPCTypeID();

	local bossID;
	if ( WAVES[wave][1] == npcType ) then
		bossID = (wave-1) * 2 + 1;
	elseif ( WAVES[wave][2] == npcType ) then
		bossID = (wave-1) * 2 + 2;
	else
		eq.debug("Error: Boss ID "..npcType.." not found in WAVES table");
		return;
	end
	
	eq.signal(INSTANCE_CONTROLLER_TYPE, 6, 0, "3;"..bossID);
	DeathComplete(e);
end

function MobCombat(e)
	if ( e.joined ) then
		eq.set_timer("hatelink", 2000);
		mobsAggro = mobsAggro + 1;
	else
		mobsAggro = mobsAggro - 1;
		eq.stop_timer("hatelink");
	end
end

function MobTimer(e)

	if ( e.timer == "hatelink" ) then
		-- this prevents kiting all the mobs around and peeling them off one at a time
	
		if ( mobsAggro > 4 and IsAllMobsAggro() and e.self:GetX() < 1400 ) then
		
			local elist = eq.get_entity_list();
			local topHater, mob;
			local topHate = 0;
			
			for i, id in ipairs(waveIDs) do
				mob = elist:GetMob(id);
				if ( mob.valid and mob:IsEngaged() and mob:GetX() < 1375 and not mob:CombatRange(mob:GetTarget()) and mob:GetHPRatio() > 95 ) then
					if ( mob:GetHateAmount(mob:GetHateTop(), false) > topHate ) then
						topHate = mob:GetHateAmount(mob:GetHateTop(), false);
						topHater = mob:GetHateTop();
						--eq.debug("top hater == "..topHater:GetName().." with "..topHate.." hate");
					end
				end
			end
			if ( topHate == 0 ) then
				return;
			end
			
			for i, id in ipairs(waveIDs) do
				mob = elist:GetMob(id);
				if ( mob.valid and mob:IsEngaged() and not mob:CombatRange(mob:GetTarget()) and mob:GetHPRatio() > 95 ) then
					if ( mob:GetHateAmount(mob:GetHateTop(), false) < topHate ) then
						mob:SetHate(topHater, topHate);
						eq.debug("anti kite: "..mob:GetName().."'s top hater is now "..topHater:GetName());
					end
				end
			end
		end
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Phase3", Event.signal, EVENTS_CONTROLLER_TYPE, Phase3Signal);

	for _, waveTable in ipairs(WAVES) do
		for i, typ in ipairs(waveTable) do
			if ( i > 2 ) then
				eq.register_npc_event("Phase3", Event.death_complete, typ, DeathComplete);
			else
				eq.register_npc_event("Phase3", Event.death_complete, typ, BossDeathComplete);
			end
			eq.register_npc_event("Phase3", Event.combat, typ, MobCombat);
			eq.register_npc_event("Phase3", Event.timer, typ, MobTimer);
		end
	end
end
