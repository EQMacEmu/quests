local INSTANCE_CONTROLLER_TYPE = 223077; -- _
local EVENTS_CONTROLLER_TYPE = 223078; -- _
local SARYRN_TYPE = 223003;
local TERRIS_TYPE = 223002;
local TALLON_TYPE = 223001;
local VALLON_TYPE = 223000;

local PHANTASM_TYPE = 223140; -- A_Phantasm_of_Terris
local NIGHTMARE_TYPE = 223143; -- A_Nightmare_Knight_of_Terris
local GUARDIAN_TYPE = 223141; -- A_Summoned_Guardian_of_Terris
local KNIGHT_TYPE = 223142; -- A_Summoned_Knight_of_Terris
local INSANITY_TYPE = 223136; -- A_Mouth_of_Insanity
local DEMENTIA_TYPE = 223137; -- A_Mouth_of_Dementia
local TORMENTOR_TYPE = 223139; -- A_Tormentor
local TWISTED_TYPE = 223138; -- A_Twisted_Tormentor
local FAKE_VALLON_TYPE = 223144;

local BOSS_NUMS = {	SARYRN_TYPE, TERRIS_TYPE, TALLON_TYPE, VALLON_TYPE };	-- table index is the number

local BOSS_LOCS = {
	[SARYRN_TYPE] = { x = -320, y = -316, z = 363.75, h = 30 },
	[TERRIS_TYPE] = { x = -310, y = 307, z = 380.25, h = 96 },
	[TALLON_TYPE] = { x = 405, y = -84, z = 370.625, h = 192 },
	[VALLON_TYPE] = { x = 405, y = 75, z = 370.625, h = 192 },
};
local SARYRN_ADD_LOCS = {
	{ x = -349, y = -230, z = 354.375, h = 64 },
	{ x = -219, y = -348, z = 354.375, h = 0 },
	{ x = -325, y = -273, z = 357, h = 32 },
	{ x = -275, y = -330, z = 357, h = 32 },
};
local TERRIS_ADD_LOCS = {
	{ x = -245, y = 358, z = 353 },
	{ x = -359, y = 209, z = 353 },
	{ x = -205, y = 271, z = 352 },
	{ x = -277, y = 208, z = 352 },
};

local bosses;

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

function SpawnPhase()
	local loc;
	
	for i = 1, 4 do
		if ( bosses[i] == 0 ) then
			loc = BOSS_LOCS[BOSS_NUMS[i]];
			eq.spawn2(BOSS_NUMS[i], 0, 0, loc.x, loc.y, loc.z, loc.h);
		end
	end	
end

function Phase4Signal(e)

	if ( e.signal == 401 ) then
		bosses = Unpacket(e.data, true, true);
		SpawnPhase();		
	end
end

function SaryrnCombat(e)
	if ( e.joined ) then
		eq.set_timer("leash", 3000);
		eq.stop_timer("check_hp");
		
		if ( e.self:GetHPRatio() > 96 ) then
			eq.set_next_hp_event(95);
		end
	else
		eq.stop_timer("leash");
		eq.set_timer("check_hp", 3000);
	end
end

function SaryrnHP(e)
	if ( e.hp_event == 95 ) then
		eq.set_next_hp_event(50);
		
		SpawnSaryrnAdd(1, INSANITY_TYPE);
		SpawnSaryrnAdd(1, INSANITY_TYPE);
		SpawnSaryrnAdd(2, DEMENTIA_TYPE);
		SpawnSaryrnAdd(2, DEMENTIA_TYPE);
		
	elseif ( e.hp_event == 50 ) then
		eq.set_next_hp_event(10);
		
		SpawnSaryrnAdd(1, TORMENTOR_TYPE);
		SpawnSaryrnAdd(1, TORMENTOR_TYPE);
		SpawnSaryrnAdd(2, TWISTED_TYPE);
		SpawnSaryrnAdd(2, TWISTED_TYPE);
		
	elseif ( e.hp_event == 10 ) then
	
		SpawnSaryrnAdd(1, INSANITY_TYPE);
		SpawnSaryrnAdd(2, DEMENTIA_TYPE);
		SpawnSaryrnAdd(3, TORMENTOR_TYPE);
		SpawnSaryrnAdd(4, TWISTED_TYPE);
	end	
end

function SaryrnTimer(e)
	if ( e.timer == "leash" ) then
		local sx, sy, sz, sh = e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH();

		if ( (e.self:GetX() - sx) > 140 or (e.self:GetY() - sy) > 140 ) then
			e.self:GMMove(sx, sy, sz, sh);
			e.self:WipeHateList();
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
		
	elseif ( e.timer == "check_hp" ) then
	
		if ( e.self:GetHPRatio() > 98 ) then
			eq.depop_all(INSANITY_TYPE);
			eq.depop_all(DEMENTIA_TYPE);
			eq.depop_all(TORMENTOR_TYPE);
			eq.depop_all(TWISTED_TYPE);
			
			eq.stop_timer(e.timer);
		end
	end
end

function SpawnSaryrnAdd(loc, typ)
	local l = SARYRN_ADD_LOCS[loc];	
	local mob = eq.spawn2(typ, 0, 0, l.x, l.y, l.z, l.h);
	eq.set_timer("leash", 6000, mob);
	MoveToBoss(mob:CastToNPC(), SARYRN_TYPE);
end

function MoveToBoss(npc, bossType)
	local boss = eq.get_entity_list():GetMobByNpcTypeID(bossType);
	if ( boss and boss.valid ) then
		npc:MoveTo(boss:GetX(), boss:GetY(), boss:GetZ(), -1, true);
	else
		if ( bossType == TERRIS_TYPE ) then
			npc:MoveTo(-205, 200, 350, -1, true);
		elseif ( bossType == SARYRN_TYPE ) then
			npc:MoveTo(-216, -213, 350, -1, true);
		end
	end
end

function SaryrnAddTimer(e)
	if ( e.timer == "leash" ) then
		local x, y, z, h = BOSS_LOCS[SARYRN_TYPE].x, BOSS_LOCS[SARYRN_TYPE].y, BOSS_LOCS[SARYRN_TYPE].z, BOSS_LOCS[SARYRN_TYPE].h;

		if ( (e.self:GetX() - x) > 200 or (e.self:GetY() - y) > 200 ) then
			e.self:GMMove(x, y, z, h);
			e.self:WipeHateList();
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
			MoveToBoss(e.self, SARYRN_TYPE);
		end
	end
end

function TerrisCombat(e)
	if ( e.joined ) then
		eq.set_timer("leash", 3000);
		eq.stop_timer("check_hp");
		
		if ( e.self:GetHPRatio() > 91 ) then
			eq.set_next_hp_event(90);
		end
	else
		eq.stop_timer("leash");
		eq.set_timer("check_hp", 3000);
	end
end

function TerrisHP(e)
	if ( e.hp_event == 90 ) then
		eq.set_next_hp_event(50);
		
		SpawnTerrisAdd(1, GUARDIAN_TYPE);
		SpawnTerrisAdd(1, GUARDIAN_TYPE);
		SpawnTerrisAdd(2, PHANTASM_TYPE);
		SpawnTerrisAdd(2, PHANTASM_TYPE);
		
	elseif ( e.hp_event == 50 ) then
		eq.set_next_hp_event(10);
		
		SpawnTerrisAdd(1, KNIGHT_TYPE);
		SpawnTerrisAdd(1, KNIGHT_TYPE);
		SpawnTerrisAdd(2, NIGHTMARE_TYPE);
		SpawnTerrisAdd(2, NIGHTMARE_TYPE);
		
	elseif ( e.hp_event == 10 ) then	
		SpawnTerrisAdd(1, GUARDIAN_TYPE);
		SpawnTerrisAdd(2, PHANTASM_TYPE);
		SpawnTerrisAdd(3, KNIGHT_TYPE);
		SpawnTerrisAdd(4, NIGHTMARE_TYPE);
	end	
end

function TerrisTimer(e)
	if ( e.timer == "leash" ) then
		local sx, sy, sz, sh = e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH();

		if ( (e.self:GetX() - sx) > 130 or (sy - e.self:GetY()) > 130 ) then
			e.self:GMMove(sx, sy, sz, sh);
			e.self:WipeHateList();
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
		
	elseif ( e.timer == "check_hp" ) then
	
		if ( e.self:GetHPRatio() > 98 ) then
			eq.depop_all(GUARDIAN_TYPE);
			eq.depop_all(PHANTASM_TYPE);
			eq.depop_all(KNIGHT_TYPE);
			eq.depop_all(NIGHTMARE_TYPE);
			
			eq.stop_timer(e.timer);
		end
	end
end

function SpawnTerrisAdd(loc, typ)
	local l = TERRIS_ADD_LOCS[loc];	
	local mob = eq.spawn2(typ, 0, 0, l.x, l.y, l.z, 128);
	eq.set_timer("leash", 6000, mob);
	MoveToBoss(mob:CastToNPC(), TERRIS_TYPE);
end

function TerrisAddTimer(e)
	if ( e.timer == "leash" ) then
		local x, y, z, h = BOSS_LOCS[TERRIS_TYPE].x, BOSS_LOCS[TERRIS_TYPE].y, BOSS_LOCS[TERRIS_TYPE].z, BOSS_LOCS[TERRIS_TYPE].h;

		if ( (e.self:GetX() - x) > 200 or (e.self:GetY() - y) > 200 ) then
			e.self:GMMove(x, y, z, h);
			e.self:WipeHateList();
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
			MoveToBoss(e.self, TERRIS_TYPE);
		end
	end
end

function TallonSpawn(e)
	e.self:CastToNPC():SetCastRateDetrimental(75);	-- note: Tallon Zek's cast rate should average about 3.5 seconds between each barb
end

function TallonCombat(e)
	if ( e.joined ) then
		eq.set_timer("leash", 6000);
	else
		eq.stop_timer("leash");
	end
end

function BrotherTimer(e)
	if ( e.timer == "leash" ) then
		if ( e.self:GetX() < 250 ) then
			local typ = VALLON_TYPE;
			if ( e.self:GetNPCTypeID() == TALLON_TYPE ) then
				typ = TALLON_TYPE;
			end
			local x, y, z, h = BOSS_LOCS[typ].x, BOSS_LOCS[typ].y, BOSS_LOCS[typ].z, BOSS_LOCS[typ].h;
			
			e.self:GMMove(x, y, z, h);
			e.self:WipeHateList();
			if ( e.self:GetNPCTypeID() ~= FAKE_VALLON_TYPE ) then
				e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
			end
		end
		
	elseif ( e.timer == "check_hp" ) then
	
		if ( e.self:GetHPRatio() > 98 ) then
			eq.depop_all(FAKE_VALLON_TYPE);
			eq.stop_timer(e.timer);
		end	
	end
end

function VallonCombat(e)
	if ( e.joined ) then
		eq.set_timer("leash", 6000);
		eq.stop_timer("check_hp");
		
		if ( e.self:GetHPRatio() > 90 ) then
			eq.set_next_hp_event(50);
		end
	else
		eq.stop_timer("leash");
		eq.set_timer("check_hp", 3000);
	end
end

function VallonHP(e)
	local x, y = math.random(287, 375), math.random(-182, 175);
	
	local mob = eq.spawn2(FAKE_VALLON_TYPE, 0, 0, x, y+20, 365, 0);
	eq.set_timer("leash", 6000, mob);
	mob:CastToNPC():SetRunning(true);
	MoveToBoss(mob:CastToNPC(), VALLON_TYPE);
	
	mob = eq.spawn2(FAKE_VALLON_TYPE, 0, 0, x, y, 365, 0);
	eq.set_timer("leash", 6000, mob);
	mob:CastToNPC():SetRunning(true);
	MoveToBoss(mob:CastToNPC(), VALLON_TYPE);
end

function BossDeathComplete(e)
	for i, v in ipairs(BOSS_NUMS) do
		if ( v == e.self:GetNPCTypeID() ) then
			eq.signal(INSTANCE_CONTROLLER_TYPE, 6, 0, "4;"..i);
			break;
		end
	end
	eq.debug("PoTime "..e.self:GetCleanName().." slain by "..e.killer:GetName().."'s raid");
end


function event_encounter_load(e)
	eq.register_npc_event("Phase4", Event.signal, EVENTS_CONTROLLER_TYPE, Phase4Signal);

	eq.register_npc_event("Phase4", Event.combat, SARYRN_TYPE, SaryrnCombat);
	eq.register_npc_event("Phase4", Event.hp, SARYRN_TYPE, SaryrnHP);
	eq.register_npc_event("Phase4", Event.timer, SARYRN_TYPE, SaryrnTimer);
	
	eq.register_npc_event("Phase4", Event.combat, TERRIS_TYPE, TerrisCombat);
	eq.register_npc_event("Phase4", Event.hp, TERRIS_TYPE, TerrisHP);
	eq.register_npc_event("Phase4", Event.timer, TERRIS_TYPE, TerrisTimer);
	
	eq.register_npc_event("Phase4", Event.timer, GUARDIAN_TYPE, TerrisAddTimer);
	eq.register_npc_event("Phase4", Event.timer, PHANTASM_TYPE, TerrisAddTimer);
	eq.register_npc_event("Phase4", Event.timer, KNIGHT_TYPE, TerrisAddTimer);
	eq.register_npc_event("Phase4", Event.timer, NIGHTMARE_TYPE, TerrisAddTimer);
	eq.register_npc_event("Phase4", Event.timer, INSANITY_TYPE, SaryrnAddTimer);
	eq.register_npc_event("Phase4", Event.timer, DEMENTIA_TYPE, SaryrnAddTimer);
	eq.register_npc_event("Phase4", Event.timer, TORMENTOR_TYPE, SaryrnAddTimer);
	eq.register_npc_event("Phase4", Event.timer, TWISTED_TYPE, SaryrnAddTimer);
	
	eq.register_npc_event("Phase4", Event.spawn, TALLON_TYPE, TallonSpawn);
	eq.register_npc_event("Phase4", Event.timer, TALLON_TYPE, BrotherTimer);
	eq.register_npc_event("Phase4", Event.combat, TALLON_TYPE, TallonCombat);
	eq.register_npc_event("Phase4", Event.timer, VALLON_TYPE, BrotherTimer);
	eq.register_npc_event("Phase4", Event.timer, FAKE_VALLON_TYPE, BrotherTimer);
	eq.register_npc_event("Phase4", Event.combat, VALLON_TYPE, VallonCombat);
	eq.register_npc_event("Phase4", Event.hp, VALLON_TYPE, VallonHP);
	
	eq.register_npc_event("Phase4", Event.death_complete, SARYRN_TYPE, BossDeathComplete);
	eq.register_npc_event("Phase4", Event.death_complete, TERRIS_TYPE, BossDeathComplete);
	eq.register_npc_event("Phase4", Event.death_complete, TALLON_TYPE, BossDeathComplete);
	eq.register_npc_event("Phase4", Event.death_complete, VALLON_TYPE, BossDeathComplete);
end
