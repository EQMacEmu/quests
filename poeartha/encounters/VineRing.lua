local TAINTED_TYPE = 218019;
local BLOODTHIRSTY_TYPE = 218362;
local BOSS_TYPE = 218363; -- Derugoak_Bloodwalker
local FAKE_BOSS_TYPE = 218364; -- A_Bloodsoaked_Vegerog
local MANGLED_TYPE = 218420;
local VEGDESPAWN_TYPE = 218396;
local VEGRESET_TYPE = 218389;
local STONE_GUY_TYPE = 218391;
local ARBITOR_GUY_TYPE = 218393;
local MUDDITE_GUY_TYPE = 218390;
local POEELEM3DAY_TYPE = 218412;
local VEGEROG_GUY_TYPE = 218392;
local VEGTXT_TYPE = 218343;

local TAINTED_SPAWNIDS = {  365330, 365348, 365381, 365393, 365464, 365575, 365709, 365739, 365784, 365799, 
							365947, 366070, 366188, 366501, 366590, 366736, 366776, 366796, 366875, 366923, 
							366944, 367019, 367085, 367105, 367145, 367184, 367271, 367395, 367449, 367465 };

local BLOODTHIRSTY_LOCS = {
	{ 431, -780, 43.37599, 95 },
	{ 481, -780, 43.37599, 128 },
	{ 537, -780, 43.37599, 160 },
	{ 537, -832, 43.37599, 192 },
	{ 537, -885, 43.37599, 223 },
	{ 481, -885, 43.37599, 0 },
	{ 428, -885, 43.37599, 32 },
	{ 428, -834, 43.37599, 64 },
	{ 462, -853, 39.37599, 32 },
	{ 505, -810, 41.00102, 158 },
};


local taintedKills = 0;
local addWave = 0;

function TaintedDeath(e)

	taintedKills = taintedKills + 1;
	local elist = eq.get_entity_list();
	
	if ( taintedKills == 3 ) then
		addWave = 0;
		eq.spawn2(VEGDESPAWN_TYPE, 0, 0, 485, -835, 33.752, 0);

		for _, id in ipairs(TAINTED_SPAWNIDS) do
			elist:GetSpawnByID(id):Disable(false);
		end
	end
	
	if ( taintedKills >= 3 and taintedKills <= 30 and taintedKills % 3 == 0 ) then
		local loc = BLOODTHIRSTY_LOCS[taintedKills / 3];
		eq.spawn2(BLOODTHIRSTY_TYPE, 0, 0, loc[1], loc[2], loc[3], loc[4]);
		if ( taintedKills < 30 ) then
			elist:MessageClose(elist:GetMobByNpcTypeID(VEGTXT_TYPE), true, 300, 0, "A creature rises from the dead bodies of three tainted rock beasts.");
		end
	end
	
	if ( taintedKills >= 30 and not elist:IsMobSpawnedByNpcTypeID(TAINTED_TYPE) ) then
	
		-- start phase 2
		local npcList = elist:GetNPCList();
		
		for npc in npcList.entries do
	
			if ( npc.valid and npc:GetNPCTypeID() == BLOODTHIRSTY_TYPE ) then
				npc:SetSpecialAbility(24, 0); -- Will Not Aggro off
				npc:SetSpecialAbility(25, 0); -- Immune to Aggro off
				npc:SetSpecialAbility(35, 0); -- No Harm from Players off
				npc:SetBodyType(25, false);	-- Plant
			end
		end
		
		elist:MessageClose(elist:GetMobByNpcTypeID(VEGTXT_TYPE), true, 300, 0, "The last of the tainted rock beasts crashes to the ground and yet another creature rises at the top of the temple.");
		eq.debug("Vine ring phase 2");
	end
end

function BloodthirstyDeath(e)

	local elist = eq.get_entity_list();
	
	if ( not elist:IsMobSpawnedByNpcTypeID(BLOODTHIRSTY_TYPE) ) then
	
		local runX, runY, runZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();
		local t = BOSS_TYPE;
		
		if ( not elist:IsMobSpawnedByNpcTypeID(VEGEROG_GUY_TYPE) ) then
			t = FAKE_BOSS_TYPE;
		end
		mob = eq.spawn2(t, 0, 0, 483, -832, 39.376, 128);
		mob:SetRunning(true);
		mob:CastToNPC():MoveTo(runX, runY, runZ, -1, true);
		
		elist:MessageClose(elist:GetMobByNpcTypeID(VEGTXT_TYPE), true, 300, 0, "The ground shakes and trembles as Derugoak Bloodwalker rises to defend his temple.");
		eq.debug("Vine ring boss spawned");
	end
end

function BossSpawn(e)
	eq.set_timer("adds", 60000);
	eq.pause_timer("adds");
end

function BossCombat(e)
	if ( e.joined ) then
		eq.resume_timer("adds");
		eq.set_timer("drophate", 1000);
		eq.stop_timer("depop_adds");
		addWave = 0;
	else
		eq.pause_timer("adds");
		eq.stop_timer("drophate");
		eq.set_timer("depop_adds", 600000);
		
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
		
	elseif ( e.timer == "adds" ) then
		local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
		local xOffset, yOffset = 0, 0;
		addWave = addWave + 1;
		
		for i = 1, (addWave * 2) do
			while (xOffset > -30 and xOffset < 30) do
				xOffset = math.random(-40, 40);
			end
			while (yOffset > -30 and yOffset < 30) do
				yOffset = math.random(-40, 40);
			end
			eq.spawn2(MANGLED_TYPE, 0, 0, x + xOffset, y + yOffset, z+5, 0);
			xOffset = 0;
			yOffset = 0;
		end
		eq.get_entity_list():MessageClose(e.self, true, 200, 0, "Derugoak summons minions to his side.");
		
	elseif ( e.timer == "depop_adds" ) then
		eq.stop_timer(e.timer);
		eq.depop_all(MANGLED_TYPE);
	end
end

function EventSuccess(e)
	eq.debug("Vine ring completed");

	eq.depop_all(MANGLED_TYPE);
	eq.depop_all(VEGDESPAWN_TYPE);
	eq.spawn2(VEGRESET_TYPE, 0, 0, 485, -835, 33.752, 0);
	if ( e.self:GetNPCTypeID() == BOSS_TYPE ) then
		eq.depop_with_timer(VEGEROG_GUY_TYPE);
	end
	
	eq.signal(ARBITOR_GUY_TYPE, 3);
end

function MangledSpawn(e)
	eq.set_timer("depop", 600000);
end

function MangledCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function MangledTimer(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function DespawnSpawn(e)
	eq.set_timer("depop", 5880000);
end

function DespawnTimer(e)

	if ( e.timer == "depop" ) then
		-- ring timeout fail
		eq.depop_all(BLOODTHIRSTY_TYPE);
		eq.depop_all(BOSS_TYPE);
		eq.depop_all(FAKE_BOSS_TYPE);
		eq.depop_all(MANGLED_TYPE);

		taintedKills = 0;
		
		local elist = eq.get_entity_list();
		for _, id in ipairs(TAINTED_SPAWNIDS) do
			elist:GetSpawnByID(id):Enable();
		end

		eq.debug("Vine Ring failed and reset");
		eq.depop();
	end
end

function ResetSpawn(e)
	eq.set_timer("depop", 18000000);
end

function ResetTimer(e)
	if ( e.timer == "depop" ) then

		taintedKills = 0;
		
		local elist = eq.get_entity_list();
		for _, id in ipairs(TAINTED_SPAWNIDS) do
			elist:GetSpawnByID(id):Enable();
		end
		
		eq.debug("Vine Ring now available");
		eq.depop();
	end
end

function event_encounter_load(e)

	eq.register_npc_event("VineRing", Event.death_complete, TAINTED_TYPE, TaintedDeath);
	
	eq.register_npc_event("VineRing", Event.death_complete, BLOODTHIRSTY_TYPE, BloodthirstyDeath);
	
	eq.register_npc_event("VineRing", Event.spawn, BOSS_TYPE, BossSpawn);
	eq.register_npc_event("VineRing", Event.combat, BOSS_TYPE, BossCombat);
	eq.register_npc_event("VineRing", Event.timer, BOSS_TYPE, BossTimer);
	eq.register_npc_event("VineRing", Event.death_complete, BOSS_TYPE, EventSuccess);
	eq.register_npc_event("VineRing", Event.spawn, FAKE_BOSS_TYPE, BossSpawn);
	eq.register_npc_event("VineRing", Event.combat, FAKE_BOSS_TYPE, BossCombat);
	eq.register_npc_event("VineRing", Event.timer, FAKE_BOSS_TYPE, BossTimer);
	eq.register_npc_event("VineRing", Event.death_complete, FAKE_BOSS_TYPE, EventSuccess);
	
	eq.register_npc_event("VineRing", Event.spawn, MANGLED_TYPE, MangledSpawn);
	eq.register_npc_event("VineRing", Event.combat, MANGLED_TYPE, MangledCombat);
	eq.register_npc_event("VineRing", Event.timer, MANGLED_TYPE, MangledTimer);

	eq.register_npc_event("VineRing", Event.spawn, VEGDESPAWN_TYPE, DespawnSpawn);
	eq.register_npc_event("VineRing", Event.timer, VEGDESPAWN_TYPE, DespawnTimer);

	eq.register_npc_event("VineRing", Event.spawn, VEGRESET_TYPE, ResetSpawn);
	eq.register_npc_event("VineRing", Event.timer, VEGRESET_TYPE, ResetTimer);

end
