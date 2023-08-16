local WARDER_TYPE = 218022;
local DEVOTEE_TYPE = 218366;
local TRIUMVIRATE_TYPE = 218367;
local TRIUMVIRATE2_TYPE = 218421;
local PERFECTED_TYPE = 218413;
local PROTECTOR_TYPE = 218414;
local FOLLOWER_TYPE = 218415;
local ELEMDESPAWN_TYPE = 218397;
local ELEMRESET_TYPE = 218411;
local STONE_GUY_TYPE = 218391;
local ARBITOR_GUY_TYPE = 218393;
local MUDDITE_GUY_TYPE = 218390;
local POEELEM3DAY_TYPE = 218412;
local VEGEROG_GUY_TYPE = 218392;
local THE_CREATURE_TYPE = 218059;

local WARDER_SPAWNID = 366233; -- dusty warder

local DEVOTEE_LOCS = {
	{ 22, -430, 33, 0 },
	{ -84, -660, 33, 0 },
	{ 89, -657, 33, 0 },
	{ 106, -651, 33, 192 },
	{ 106, -612, 33, 192 },
	{ 98, -461, 33, 128 },
	{ -44, -458, 33, 128 },
	{ -10, -430, 33, 0 },
	{ -123, -575, 33, 192 },
	{ -10, -689, 33, 128 },
	{ 170, -585, 15, 64 },
	{ 170, -534, 13, 64 },
	{ 31, -396, 13.75, 0 },
	{ -18, -396, 13.375, 0 },
	{ -157, -585, 16, 192 },
	{ -19, -724, 13.1, 128 },
	{ 31, -724, 13.8, 128 },
	{ -82, -458, 33, 128 },
	{ -94, -503, 33, 64 },
	{ -94, -610, 33, 64 },
	{ 53, -657, 33, 0 },
	{ 105, -515, 33, 192 },
	{ 105, -480, 33, 192 },
	{ 55, -461, 33, 128 },
	{ 136, -575, 33, 64 },
	{ 136, -544, 33, 64 },
	{ 22, -689, 33, 128 },
	{ -157, -535, 13, 192 },
	{ -123, -544, 33, 192 },
	{ -94, -467, 33, 64 },
	{ -94, -647, 33, 64 },
	{ -45, -660, 33, 0 },
};
local TRIUMVIRATE_LOCS = {
	{ -17, -535, 35.5, 94 },
	{ -17, -585, 35.5, 31 },
	{ 28, -560, 35.5, 189 },
};

local triKills, bossWave = 0, 0;
local bossTimer;

function WarderDeath(e)

	triKills = 0;
	
	local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	local xOffset = { 60, -60, 60, -60, -60 };
	local yOffset = { 60, 60, -60, -60, -50 };
	local moveX = { -251, -267, -261, -237, -232 };
	local moveY = { -1319, -1330, -1348, -1354, -1328 };
	
	for i = 1, 5 do
		eq.spawn2(DEVOTEE_TYPE, 0, 0, x + xOffset[i], y + yOffset[i], z+5, 0):CastToNPC():MoveTo(moveX[i], moveY[i], -33, 0, true);
	end
	
	for i, loc in ipairs(DEVOTEE_LOCS) do
		eq.spawn2(DEVOTEE_TYPE, 0, 0, loc[1], loc[2], loc[3], loc[4]);
	end
	
	local mob;
	for i, loc in ipairs(TRIUMVIRATE_LOCS) do
		mob = eq.spawn2(TRIUMVIRATE_TYPE, 0, 0, loc[1], loc[2], loc[3], loc[4]);
		mob:SetSpecialAbility(24, 1); -- Will Not Aggro
		mob:SetSpecialAbility(25, 1); -- Immune to Aggro
		mob:SetSpecialAbility(35, 1); -- No Harm from Players
		mob:SetBodyType(11, false);	-- NoTarget
	end
	
	eq.spawn2(ELEMDESPAWN_TYPE, 0, 0, 28, -560, 28.625, 0);
	eq.zone_emote(0, "The creature explodes into a maelstrom of dirt and dust.  Suddenly from the whirling cloud of dust three different streams of dirt come form heading to the elemental temple and then the remainder of the maelstrom bursts apart forming into numerous dust devotees.");
	eq.debug("Dust ring active");
end

function DevoteeDeath(e)
	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(DEVOTEE_TYPE) ) then

		local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ();		
		local npcList = eq.get_entity_list():GetNPCList();
		
		for npc in npcList.entries do
	
			if ( npc.valid and npc:GetNPCTypeID() == TRIUMVIRATE_TYPE ) then
				npc:SetSpecialAbility(24, 0); -- Will Not Aggro off
				npc:SetSpecialAbility(25, 0); -- Immune to Aggro off
				npc:SetSpecialAbility(35, 0); -- No Harm from Players off
				npc:SetBodyType(24, false);	-- Summoned
				
				npc:SetRunning(true);
				npc:MoveTo(x, y, z, -1, true);
			end
		end
		
		eq.get_entity_list():MessageClose(eq.get_entity_list():GetMobByNpcTypeID(THE_CREATURE_TYPE), true, 200, 0, "A deafening roar is heard coming from the Triumvirate of Soil.");
	end
end

function TriumvirateDeath(e)
	triKills = triKills + 1;
	
	if ( triKills == 3 ) then
		local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
		
		local t = PERFECTED_TYPE;
		
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(POEELEM3DAY_TYPE) ) then
			t = FOLLOWER_TYPE;
		end
		mob = eq.unique_spawn(t, 0, 0, 6, -560, 37.376, 128);
		mob:SetRunning(true);
		mob:CastToNPC():MoveTo(x, y, z, -1, true);
		
		eq.get_entity_list():MessageClose(eq.get_entity_list():GetMobByNpcTypeID(THE_CREATURE_TYPE), true, 200, 0, "Within the earthen temple a warder of earth forms, perfect in every way.");
	end
end

function TriumvirateSpawn(e)
	if ( triKills < 3 ) then	-- the ones that spawn from the Perfected Warder do not turn into tornados apparently
		eq.set_timer("invis", 60000);
		eq.pause_timer("invis");
	end
end

function TriumvirateCombat(e)
	if ( e.joined ) then
		eq.resume_timer("invis");
	else
		eq.pause_timer("invis");
		eq.stop_timer("drophate");
		if ( e.self:GetRace() == 233 ) then
			e.self:SetRace(209);
			e.self:ChangeSize(12);
		end
	end
end

function TriumvirateTimer(e)
	if ( e.timer == "drophate") then

		if ( math.random() < 0.1 ) then -- averages to once every 10 seconds
			local target = e.self:GetTarget();
			if ( target and target.valid ) then
				e.self:RemoveFromHateList(target);
			end
			eq.debug(e.self:GetName().." dropped target from hate list ("..target:GetName()..")", 2);
		end
		
	elseif ( e.timer == "invis" ) then
		if ( e.self:GetRace() == 209 ) then
			e.self:SetRace(233);		-- this turns them into hard-to-see dust tornados
			e.self:ChangeSize(12);
		else
			e.self:SetRace(209);
			e.self:ChangeSize(12);
		end
		eq.set_timer("drophate", 1000);
	end
end

function BossSpawn(e)
	if ( math.random(2) == 1 ) then
		bossTimer = "protectors";
	else
		bossTimer = "triumvirates";
	end

	eq.set_timer(bossTimer, 60000);
	eq.pause_timer(bossTimer);
	bossWave = 0;
end

function BossCombat(e)
	if ( e.joined ) then
		eq.resume_timer(bossTimer);
		eq.set_timer("drophate", 1000);
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(TRIUMVIRATE2_TYPE) ) then
			bossWave = 0;
		end
	else
		eq.pause_timer(bossTimer);
		eq.stop_timer("drophate");
		
		-- this is to mimic certain behavior Sony's servers had/has.  NPCs aggroed a long time sometimes warp home or
		-- some distance away in the direction of home and heal somewhat when they hate list wipe.  The exact logic to this
		-- behavior is unknown.  Bosses with the tank hate list drop mechanic need this in order to not trivialize the
		-- encounter using mem blur.  This is a crude solution that works well enough
		local ratio = e.self:GetHPRatio();
		if ( ratio < 50 or math.random(100) > ratio ) then
			e.self:GMMove(e.self:GetGuardPointX(), e.self:GetGuardPointY(), e.self:GetGuardPointZ(), e.self:GetSpawnPointH());
			e.self:SetHP(e.self:GetHP() + math.floor(e.self:GetMaxHP() * 0.3));
		end
	end
end

function BossTimer(e)

	if ( e.timer == "drophate") then

		if ( math.random() < 0.05 ) then -- averages to once every 20 seconds
			local target = e.self:GetTarget();
			if ( target and target.valid ) then
				e.self:RemoveFromHateList(target);
			end
			eq.debug(e.self:GetName().." dropped target from hate list ("..target:GetName()..")", 2);
		end
		
		-- force them to kill triumvirates before boss
		if ( e.self:GetHPRatio() < 49 and eq.get_entity_list():IsMobSpawnedByNpcTypeID(TRIUMVIRATE2_TYPE) ) then
			e.self:SetHP(e.self:GetMaxHP() / 2);
		end
		
	elseif ( e.timer == "protectors" ) then
	
		bossWave = bossWave + 1;
		
		local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
		local xOffset = { 60, -60, 60, -60 };
		local yOffset = { 60, 60, -60, -60 };
		local j = 1;
		
		for i = 1, (bossWave + 2) do
			eq.spawn2(PROTECTOR_TYPE, 0, 0, x + xOffset[j], y + yOffset[j], z+5, 0):CastToNPC():MoveTo(x, y, z, -1, true);
			j = j + 1;
			if ( j > 4 ) then
				j = 1;
			end
		end
		
	elseif ( e.timer == "triumvirates" ) then
	
		bossWave = bossWave + 1;
		local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
		
		if ( bossWave == 1 ) then
		
			for i, loc in ipairs(TRIUMVIRATE_LOCS) do
				eq.spawn2(TRIUMVIRATE2_TYPE, 0, 0, loc[1], loc[2], loc[3], loc[4]):CastToNPC():MoveTo(x, y, z, -1, true);
			end
		
		else
		
			local npcList = eq.get_entity_list():GetNPCList();			
			for npc in npcList.entries do
		
				if ( npc.valid and npc:GetNPCTypeID() == TRIUMVIRATE2_TYPE and not npc:IsEngaged() ) then
					npc:SetRunning(true);
					npc:MoveTo(x, y, z, -1, true);
				end
			end
		end
	end
end

function EventSuccess(e)
	eq.debug("Dust ring completed");

	eq.depop_all(ELEMDESPAWN_TYPE);
	eq.spawn2(ELEMRESET_TYPE, 0, 0, 28, -560, 28.627, 0);
	if ( e.self:GetNPCTypeID() == PROTECTOR_TYPE ) then
		eq.depop_with_timer(POEELEM3DAY_TYPE);
	end
	
	eq.signal(ARBITOR_GUY_TYPE, 4);
end

function DespawnSpawn(e)
	eq.set_timer("depop", 5880000);
end

function DespawnTimer(e)

	if ( e.timer == "depop" ) then
		-- ring timeout fail
		eq.depop_all(DEVOTEE_TYPE);
		eq.depop_all(TRIUMVIRATE_TYPE);
		eq.depop_all(TRIUMVIRATE2_TYPE);
		eq.depop_all(PERFECTED_TYPE);
		eq.depop_all(PROTECTOR_TYPE);
		eq.depop_all(FOLLOWER_TYPE);

		eq.spawn_from_spawn2(WARDER_SPAWNID);

		eq.debug("Dust Ring failed and reset");
		eq.depop();
	end
end

function ResetSpawn(e)
	eq.set_timer("depop", 18000000);
end

function ResetTimer(e)
	if ( e.timer == "depop" ) then

		eq.spawn_from_spawn2(WARDER_SPAWNID);
		
		eq.debug("Dust Ring now available");
		eq.depop();
	end
end


function event_encounter_load(e)

	eq.register_npc_event("DustRing", Event.death_complete, WARDER_TYPE, WarderDeath);

	eq.register_npc_event("DustRing", Event.death_complete, DEVOTEE_TYPE, DevoteeDeath);

	eq.register_npc_event("DustRing", Event.death_complete, TRIUMVIRATE_TYPE, TriumvirateDeath);
	eq.register_npc_event("DustRing", Event.spawn, TRIUMVIRATE_TYPE, TriumvirateSpawn);
	eq.register_npc_event("DustRing", Event.combat, TRIUMVIRATE_TYPE, TriumvirateCombat);
	eq.register_npc_event("DustRing", Event.timer, TRIUMVIRATE_TYPE, TriumvirateTimer);

	eq.register_npc_event("DustRing", Event.spawn, PERFECTED_TYPE, BossSpawn);
	eq.register_npc_event("DustRing", Event.combat, PERFECTED_TYPE, BossCombat);
	eq.register_npc_event("DustRing", Event.timer, PERFECTED_TYPE, BossTimer);
	eq.register_npc_event("DustRing", Event.death_complete, PERFECTED_TYPE, EventSuccess);
	eq.register_npc_event("DustRing", Event.spawn, FOLLOWER_TYPE, BossSpawn);
	eq.register_npc_event("DustRing", Event.combat, FOLLOWER_TYPE, BossCombat);
	eq.register_npc_event("DustRing", Event.timer, FOLLOWER_TYPE, BossTimer);
	eq.register_npc_event("DustRing", Event.death_complete, FOLLOWER_TYPE, EventSuccess);

	eq.register_npc_event("DustRing", Event.spawn, ELEMDESPAWN_TYPE, DespawnSpawn);
	eq.register_npc_event("DustRing", Event.timer, ELEMDESPAWN_TYPE, DespawnTimer);

	eq.register_npc_event("DustRing", Event.spawn, ELEMRESET_TYPE, ResetSpawn);
	eq.register_npc_event("DustRing", Event.timer, ELEMRESET_TYPE, ResetTimer);
end
