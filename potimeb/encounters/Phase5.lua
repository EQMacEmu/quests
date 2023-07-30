local INSTANCE_CONTROLLER_TYPE = 223077; -- _
local EVENTS_CONTROLLER_TYPE = 223078; -- _
local CAZIC_TYPE = 223004;
local BERTOX_TYPE = 223005;
local RZ_TYPE = 223006;
local INNO_TYPE = 223007;

local CRYPT_TYPE = 223147; -- Guardian_of_the_Crypt
local PRESTILENCE_TYPE = 223145; -- Guardian_Knight_of_Pestilence
local CASTER_TYPE = 223146; -- A_Firebone_Caster
local AMYGDALAN_TYPE = 223149; -- Amygdalan_knight
local PHOBO_TYPE = 223148; -- phoboplasm
local ABHORRENT_TYPE = 223153; -- an_abhorrent
local CLERIC_TYPE = 223152; -- Cleric_of_Innoruuk
local BRAWLER_TYPE = 223151; -- Decorin_Brawler
local FIERCE_TYPE = 223150; -- A_Fierce_War_Boar

local BOAR_TYPE = 223155; -- a_summoned_boar
local MINION_TYPE = 223154; -- a_summoned_minion

local GUARDIAN_TYPE = 223156; -- guardian_of_the_dark_prince
local HATEBRINGER_TYPE = 223157; -- a_hatebringer_of_Innoruuk

local BOSS_NUMS = {	CAZIC_TYPE, BERTOX_TYPE, RZ_TYPE, INNO_TYPE };	-- table index is the number

local BOSS_LOCS = {
	[CAZIC_TYPE] =  { x = -255, y = 248,  z = 27.501, h = 93 },
	[BERTOX_TYPE] = { x = -303, y = -301, z = 35.626, h = 17 },
	[RZ_TYPE] =     { x = 274,  y = -279, z = 18.751, h = 217 },
	[INNO_TYPE] =   { x = 302, y = 309, z = 25, h = 158 },
};
local BOSS_BOX = { [CAZIC_TYPE] = 120, [BERTOX_TYPE] = 120, [RZ_TYPE] = 100, [INNO_TYPE] = 130 };

local BERTOX_STATE = {
	{ mr = 450, fr = 375, cr = 375, pr = 360, dr = 360, accuracy = -50, ac = 200, min_hit = 935,  max_hit = 1600 },
	{ mr = 350, fr = 300, cr = 300, pr = 275, dr = 275, accuracy = 50,  ac = 300, min_hit = 1040, max_hit = 1800 },
	{ mr = 250, fr = 200, cr = 200, pr = 180, dr = 180, accuracy = 170, ac = 500, min_hit = 1145, max_hit = 2000 },
	{ mr = 150, fr = 150, cr = 150, pr = 130, dr = 130, accuracy = 320, ac = 600, min_hit = 1250, max_hit = 2200 },
	{ mr = 200, fr = 175, cr = 175, pr = 160, dr = 160, accuracy = 275, ac = 650, min_hit = 1145, max_hit = 2000 },
	{ mr = 250, fr = 200, cr = 200, pr = 180, dr = 180, accuracy = 200, ac = 600, min_hit = 1040, max_hit = 1800 },
	{ mr = 300, fr = 250, cr = 250, pr = 230, dr = 230, accuracy = 65,  ac = 500, min_hit = 940,  max_hit = 1700 },
};

local INNO_ADD_LOCS = {
	{ x = 211, y = 303 },	-- guardian
	{ x = 207, y = 232 },	-- guardian
	{ x = 324, y = 210 },	-- harbinger
	{ x = 325, y = 268 },	-- harbinger
};

local TRASH_LOCS = {
	[PHOBO_TYPE] = {
		-139, 207, 5.625,
	    -122, 207, 5.625,
	    -139, 194, 5.625,
	    -122, 194, 5.625,
	    -139, 179, 5.625,
	    -122, 179, 5.625,	
	},
	[AMYGDALAN_TYPE] = {
		-122, 166, 8.75,
		-139, 166, 8.75,
		-122, 152, 8.75,
		-139, 152, 8.75,
		-157, 194, 8.75,
		-157, 166, 8.75,	
	},
	[CRYPT_TYPE] = {
		-103, -133,	9.375,
		-132, -151,	9.375,
	},
	[PRESTILENCE_TYPE] = {
		-103, -151, 10,
	    -120, -115, 10,
	    -118, -133, 10,
	    -116, -151, 10,
	    -132, -133, 10,	
	},
	[CASTER_TYPE] = {
		-146, -115, 10,
	    -146, -133, 10,
	    -146, -151, 10,
	    -161, -133, 10,
	    -161, -151, 10,
	},
	[FIERCE_TYPE] = {
		 80, -135, 6.25,
	    100, -135, 6.25,
	     80, -150, 6.25,
	    100, -150, 6.25,
	    120, -150, 6.25,
	     80, -163, 6.25,
	},
	[BRAWLER_TYPE] = {
		100, -163, 7.5,
	     80, -175, 7.5,
	    100, -175, 7.5,
	    120, -175, 7.5,
	     80, -186, 7.5,
	    100, -186, 7.5,
	},
	[CLERIC_TYPE] = {
		120,  83, 4.375,
		120, 103, 4.375,
		139,  83, 4.375,
		139, 103, 4.375,
		139, 121, 4.375,
		158,  83, 4.375,		
	},
	[ABHORRENT_TYPE] = {
		158, 103, 4.375,
	    177,  83, 4.375,
	    177, 103, 4.375,
	    177, 121, 4.375,
	    195,  83, 4.375,
	    195, 103, 4.375,
	},
};

local TRASH_MASTERS = {
	[PHOBO_TYPE] = 1,
	[AMYGDALAN_TYPE] = 1,
	[CRYPT_TYPE] = 2,
	[PRESTILENCE_TYPE] = 2,
	[CASTER_TYPE] = 2,
	[FIERCE_TYPE] = 3,
	[BRAWLER_TYPE] = 3,
	[CLERIC_TYPE] = 4,
	[ABHORRENT_TYPE] = 4,
};
local ADD_MASTERS = {
	[BOAR_TYPE] = 3,
	[MINION_TYPE] = 3,
	[GUARDIAN_TYPE] = 4,
	[HATEBRINGER_TYPE] = 4,
};

local RZ_ADDS_LOC = { x = 262, y = -272, z = 6.25 };

local rzState, bertoxState = 1, 1;
local bossState = {};

function Unpacket(s, numberize, returnTable)
	local t = {};
	for w in s:gmatch("([^;]+)") do
		if ( numberize ) then
			w = tonumber(w);
		end
		table.insert(t, w);
	end
	if ( returnTable ) then
		return t;
	else
		return unpack(t);
	end
end

function SpawnPhase()
	local loc, mob;

	rzState, bertoxState = 1, 1;
	for i = 1, 4 do
		if ( bosses[i] == 0 ) then
			loc = BOSS_LOCS[BOSS_NUMS[i]];
			mob = eq.spawn2(BOSS_NUMS[i], 0, 0, loc.x, loc.y, loc.z, loc.h);
			bossState[i] = 1;

			for typ, num in pairs(TRASH_MASTERS) do
				if ( num == i ) then
				
					for j = 1, #TRASH_LOCS[typ], 3 do
						eq.spawn2(typ, 0, 0, TRASH_LOCS[typ][j], TRASH_LOCS[typ][j+1], TRASH_LOCS[typ][j+2], 0);
					end
				end
			end
		else
			bossState[i] = 0;
		end
	end
end

function Phase5Signal(e)

	if ( e.signal == 501 ) then
		bosses = Unpacket(e.data, true, true);
		SpawnPhase();		
	end
end

function BossTimer(e)
	if ( e.timer == "leash" ) then
		local typ = e.self:GetNPCTypeID();
		if ( typ == CAZIC_TYPE or typ == BERTOX_TYPE ) then
			return;
		end
		local box = BOSS_BOX[typ];
		local sx, sy, sz, sh = e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH();
		local xDiff, yDiff = (e.self:GetX() - sx), (e.self:GetY() - sy);

		if ( xDiff > box or xDiff < -box or yDiff > box or yDiff < -box ) then
			e.self:GMMove(sx, sy, sz, sh);
			e.self:WipeHateList();
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
		
	elseif ( e.timer == "check_hp" ) then
	
		if ( e.self:GetHPRatio() > 98 ) then
		
			local typ = e.self:GetNPCTypeID();
			if ( typ == BERTOX_TYPE ) then
				bertoxState = 1;
				SetBertoxStats(e.self);
				
			elseif ( typ == RZ_TYPE ) then
				eq.depop_all(BOAR_TYPE);
				eq.depop_all(MINION_TYPE);
				rzState = 1;
				SetRallosStats(e.self);
			
			elseif ( typ == INNO_TYPE ) then
				eq.depop_all(GUARDIAN_TYPE);
				eq.depop_all(HATEBRINGER_TYPE);
			end
			eq.stop_timer(e.timer);
		end
	end
end

function BossCombat(e)
	if ( e.joined ) then
		eq.set_timer("leash", 3000);
		eq.stop_timer("check_hp");
		
		if ( e.self:GetHPRatio() > 92 ) then
			eq.set_next_hp_event(91);
		end
	else
		eq.stop_timer("leash");
		eq.set_timer("check_hp", 3000);
	end
end


function BertoxHP(e)
	if ( e.hp_event == 91 ) then
		eq.set_next_hp_event(71);
		bertoxState = 2;
		
	elseif ( e.hp_event == 71 ) then
		eq.set_next_hp_event(56);
		bertoxState = 3;		
		
	elseif ( e.hp_event == 56 ) then
		eq.set_next_hp_event(46);
		bertoxState = 4;
		
	elseif ( e.hp_event == 46 ) then
		eq.set_next_hp_event(31);
		bertoxState = 5;
		
	elseif ( e.hp_event == 31 ) then
		eq.set_next_hp_event(11);
		bertoxState = 6;
		
	elseif ( e.hp_event == 11 ) then		
		bertoxState = 7;
	end
	
	if ( bertoxState < 5 ) then
		eq.get_entity_list():MessageClose(e.self, true, 200, 0, "Blisters and festering sores covering Bertoxxulous's hide burst.  A noxious ooze bleeds down his scarred flesh, strengthening his physical body.");
	else
		e.self:Emote("falters, nearly imperceptibly.");
	end
	SetBertoxStats(e.self);
end

function SetBertoxStats(npc)
	for stat, value in pairs(BERTOX_STATE[bertoxState]) do
		npc:ModifyNPCStat(stat, tostring(value));
	end
end

function SpawnRallosAdd(boss, typ)
	local x, y, z = RZ_ADDS_LOC.x,  RZ_ADDS_LOC.y, RZ_ADDS_LOC.z;
	local mob = eq.spawn2(typ, 0, 0, x, y, z, 0);
	eq.set_timer("leash", 3000, mob);
	--mob:CastToNPC():MoveTo(boss:GetX(), boss:GetY(), boss:GetZ(), -1, true);
end

function RallosHP(e)
	if ( e.hp_event == 91 ) then
		eq.set_next_hp_event(76);
		rzState = 2;
		for i = 1, 4 do
			SpawnRallosAdd(e.self, eq.ChooseRandom(BOAR_TYPE, MINION_TYPE));
		end
		
	elseif ( e.hp_event == 76 ) then
		eq.set_next_hp_event(51);
		rzState = 3;		
		for i = 1, 4 do
			SpawnRallosAdd(e.self, eq.ChooseRandom(BOAR_TYPE, MINION_TYPE));
		end
		
	elseif ( e.hp_event == 51 ) then
		eq.set_next_hp_event(26);
		rzState = 4;
		for i = 1, 4 do
			SpawnRallosAdd(e.self, eq.ChooseRandom(BOAR_TYPE, MINION_TYPE));
		end
		
	elseif ( e.hp_event == 26 ) then
		rzState = 5;
		for i = 1, 6 do
			SpawnRallosAdd(e.self, eq.ChooseRandom(BOAR_TYPE, MINION_TYPE));
		end
	end	
	
	eq.get_entity_list():MessageClose(e.self, true, 200, 0, "Rallos Zek roars a mighty war cry and swings his axe with a vengeance.");
	SetRallosStats(e.self);
end

function SetRallosStats(npc)
	if ( rzState == 1 ) then
		npc:ModifyNPCStat("special_abilities", "5,0,0"); -- disable flurry
		npc:ModifyNPCStat("special_abilities", "4,0,0"); -- disable wild rampage
		npc:ModifyNPCStat("special_abilities", "3,1,5,200"); -- rampage 5%
		npc:ModifyNPCStat("mr", "250");
		npc:ModifyNPCStat("fr", "170");
		npc:ModifyNPCStat("cr", "170");
		npc:ModifyNPCStat("pr", "155");
		npc:ModifyNPCStat("dr", "155");
		npc:ModifyNPCStat("atk", "-100");
		npc:ModifyNPCStat("ac", "350");
	
	elseif ( rzState == 2 ) then
		npc:ModifyNPCStat("special_abilities", "5,0,0"); -- disable flurry
		npc:ModifyNPCStat("special_abilities", "4,0,0"); -- disable wild rampage
		npc:ModifyNPCStat("special_abilities", "3,1,5,200"); -- rampage 5%
		npc:ModifyNPCStat("mr", "250");
		npc:ModifyNPCStat("fr", "190");
		npc:ModifyNPCStat("cr", "190");
		npc:ModifyNPCStat("pr", "180");
		npc:ModifyNPCStat("dr", "180");
		npc:ModifyNPCStat("atk", "200");
		npc:ModifyNPCStat("ac", "450");
	
	elseif ( rzState == 3 ) then
		npc:ModifyNPCStat("special_abilities", "5,0,0"); -- disable flurry
		npc:ModifyNPCStat("special_abilities", "4,1,1"); -- wild rampage 1%
		npc:ModifyNPCStat("special_abilities", "3,1,5,200"); -- rampage 5%
		npc:ModifyNPCStat("mr", "300");
		npc:ModifyNPCStat("fr", "225");
		npc:ModifyNPCStat("cr", "225");
		npc:ModifyNPCStat("pr", "200");
		npc:ModifyNPCStat("dr", "200");
		npc:ModifyNPCStat("atk", "400");
		npc:ModifyNPCStat("ac", "550");
	
	elseif ( rzState == 4 ) then
		npc:ModifyNPCStat("special_abilities", "5,1,5"); -- flurry 5%
		npc:ModifyNPCStat("special_abilities", "4,1,1"); -- wild rampage 1%
		npc:ModifyNPCStat("special_abilities", "3,0,0"); -- disable rampage
		npc:ModifyNPCStat("mr", "350");
		npc:ModifyNPCStat("fr", "250");
		npc:ModifyNPCStat("cr", "250");
		npc:ModifyNPCStat("pr", "230");
		npc:ModifyNPCStat("dr", "230");
		npc:ModifyNPCStat("atk", "600");
		npc:ModifyNPCStat("ac", "650");
	
	elseif ( rzState == 5 ) then
		npc:ModifyNPCStat("special_abilities", "5,1,5"); -- flurry 5%
		npc:ModifyNPCStat("special_abilities", "4,1,1"); -- wild rampage 1%
		npc:ModifyNPCStat("special_abilities", "3,0,0"); -- disable rampage
		npc:ModifyNPCStat("mr", "550");
		npc:ModifyNPCStat("fr", "275");
		npc:ModifyNPCStat("cr", "275");
		npc:ModifyNPCStat("pr", "250");
		npc:ModifyNPCStat("dr", "250");
		npc:ModifyNPCStat("atk", "800");
		npc:ModifyNPCStat("ac", "750");
	end
end

function InnoHP(e)
	if ( e.hp_event == 91 ) then
		eq.set_next_hp_event(81);
		
	elseif ( e.hp_event == 81 ) then
		eq.set_next_hp_event(21);
		SpawnInnoAdd(1, GUARDIAN_TYPE);
		SpawnInnoAdd(2, GUARDIAN_TYPE);
		SpawnInnoAdd(3, HATEBRINGER_TYPE);
		
	elseif ( e.hp_event == 21 ) then
		SpawnInnoAdd(1, GUARDIAN_TYPE);
		SpawnInnoAdd(2, GUARDIAN_TYPE);
		SpawnInnoAdd(3, HATEBRINGER_TYPE);
		SpawnInnoAdd(4, HATEBRINGER_TYPE);		
	end
end

function SpawnInnoAdd(locNum, typ)
	local mob = eq.spawn2(typ, 0, 0, INNO_ADD_LOCS[locNum].x, INNO_ADD_LOCS[locNum].y, 7.5, 128);
	eq.set_timer("leash", 6000, mob);
	local boss = eq.get_entity_list():GetMobByNpcTypeID(INNO_TYPE);
	mob:CastToNPC():MoveTo(boss:GetX(), boss:GetY(), boss:GetZ(), 0, true);
end

function AddTimer(e)
	if ( e.timer == "leash" ) then
		local masterType = BOSS_NUMS[ADD_MASTERS[e.self:GetNPCTypeID()]];
		local x, y, z, h = BOSS_LOCS[masterType].x, BOSS_LOCS[masterType].y, BOSS_LOCS[masterType].z, BOSS_LOCS[masterType].h;
		local xDiff, yDiff = (e.self:GetX() - x), (e.self:GetY() - y);

		if ( xDiff > 200 or xDiff < -200 or yDiff > 200 or yDiff < -200 ) then
			e.self:GMMove(x, y, z-10, h);
			e.self:WipeHateList();
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
			local boss = eq.get_entity_list():GetMobByNpcTypeID(masterType);
			e.self:MoveTo(boss:GetX(), boss:GetY(), boss:GetZ(), 0, true);
		end
	end
end

function TrashDeathComplete(e)
	local killType = e.self:GetNPCTypeID();
	local master = TRASH_MASTERS[killType];
	
	if ( bossState[master] == 1 ) then
		local elist = eq.get_entity_list();
		
		for typ, mast in pairs(TRASH_MASTERS) do
			if ( mast == master ) then
				if ( elist:IsMobSpawnedByNpcTypeID(typ) ) then
					return;
				end
			end
		end
		
		bossState[master] = 2;
		boss = elist:GetNPCByNPCTypeID(BOSS_NUMS[master]);
		boss:SetSpecialAbility(24, 0); -- Will Not Aggro off
		boss:SetSpecialAbility(35, 0); -- No Harm from Players off
		if ( BOSS_NUMS[master] == RZ_TYPE ) then
			boss:SetBodyType(19, false); -- Zek
		else
			boss:SetBodyType(1, false); -- humanoid
		end
		eq.debug(boss:GetCleanName().." now active");
	end
end

function BossDeath(e)
	local corpseType = e.self:GetNPCTypeID();
	
	for i, typ in ipairs(BOSS_NUMS) do
		if ( typ == corpseType ) then

			if ( corpseType == RZ_TYPE and (rzState ~= 5 or e.self:GetAC() ~= 750) ) then
				eq.debug("Error: Rallos Zek did not power up correctly.  Depoping corpse.");
				e.self:ClearItemList();
				e.self:Depop();
				eq.depop_all(corpseType);
				return;
			end
			
			if ( corpseType == BERTOX_TYPE and (bertoxState ~= 7 or e.self:GetAC() ~= 500) ) then
				eq.debug("Error: Bertoxxulous did not power up correctly.  Depoping corpse.");
				e.self:ClearItemList();
				e.self:Depop();
				eq.depop_all(corpseType);
				return;
			end
			
			eq.signal(INSTANCE_CONTROLLER_TYPE, 6, 0, "5;"..i);
			return;
		end
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Phase5", Event.signal, EVENTS_CONTROLLER_TYPE, Phase5Signal);

	for _, typ in pairs(BOSS_NUMS) do
		eq.register_npc_event("Phase5", Event.death, typ, BossDeath);
		eq.register_npc_event("Phase5", Event.combat, typ, BossCombat);
		eq.register_npc_event("Phase5", Event.timer, typ, BossTimer);
	end
	
	for typ in pairs(TRASH_LOCS) do
		eq.register_npc_event("Phase5", Event.death_complete, typ, TrashDeathComplete);
	end
	
	eq.register_npc_event("Phase5", Event.hp, BERTOX_TYPE, BertoxHP);
	eq.register_npc_event("Phase5", Event.hp, RZ_TYPE, RallosHP);
	eq.register_npc_event("Phase5", Event.hp, INNO_TYPE, InnoHP);
	
	eq.register_npc_event("Phase5", Event.timer, BOAR_TYPE, AddTimer);
	eq.register_npc_event("Phase5", Event.timer, MINION_TYPE, AddTimer);
	eq.register_npc_event("Phase5", Event.timer, GUARDIAN_TYPE, AddTimer);
	eq.register_npc_event("Phase5", Event.timer, HATEBRINGER_TYPE, AddTimer);
end
