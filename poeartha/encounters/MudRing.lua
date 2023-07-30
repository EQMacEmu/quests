-- note: when testing this script, using #kill on undamaged NPCs could break the event or crash the zone; #damage them instead or cast Destroy

local BLUE_MUDWALKER_TYPE = 218317;
local RED_MUDWALKER_TYPE = 218418;
local RUNNER_TYPE = 218419; -- '_'; the little untargetable golems that run to the temple after red mudwalkers die
local SLUDGE_LURKER_TYPE = 218357;
local MUCK_MUDLET_TYPE = 218358;
local MUDDITE_MUDLING_TYPE = 218361;
local FILTH_GORGER_TYPE = 218359;
local MONSTEROUS_MUDWALKER_TYPE = 218360;
local MERCILESS_MUDSLINGER_TYPE = 218365;
local MUDESPAWN_TYPE = 218394;
local MUDRESET_TYPE = 218387;
local THE_LAST_TYPE = 218085;
local ARBITOR_GUY_TYPE = 218393;
local STONE_GUY_TYPE = 218391;
local MUDDITE_GUY_TYPE = 218390;
local POEELEM3DAY_TYPE = 218412;
local VEGEROG_GUY_TYPE = 218392;

local BLUE_SPAWNIDS = { 365291, 365399, 365409, 365587, 365808, 366045, 366470, 366646, 
						366691,	366737, 366743, 366840, 366891, 366929, 367013, 367097 };

local RED_LOCS = {
	{ 400, 126, 71, 192 },
	{ 304, 30, 71, 0 },
	{ 280, 126, 71, 64 },
	{ 376, 30, 71, 0 },
	{ 400, 102, 71, 192 },
	{ 352, 150, 71, 128 },
	{ 280, 102, 71, 64 },
	{ 352, 30, 71, 0 },
	{ 400, 78, 71,  192 },
	{ 328, 150, 71, 128 },
	{ 280, 78, 71, 64 },
	{ 328, 30, 71, 0 },
	{ 400, 54, 71,  192 },
	{ 304, 150, 71, 128 },
	{ 280, 54, 71, 64 },
	{ 376, 150, 71, 128 },
};
local GORGER_LOCS = {
	{ 397, 149, 71 },
	{ 283, 149, 71 },
	{ 397, 34, 71 },
	{ 283, 34, 71 },
};

local blueKills, runners, lurkerState = 0, 0, 0;
local runX, runY, runZ;
local reds = {};

function BlueDeath(e)
	blueKills = blueKills + 1;
	
	local elist = eq.get_entity_list();
	local loc, mob;
	
	for i = 1, 16 do
		if ( not reds[i] ) then
			loc = RED_LOCS[i];
			reds[i] = eq.spawn2(RED_MUDWALKER_TYPE, 0, 0, loc[1], loc[2], loc[3], loc[4]):GetID();
			break;
		end
	end
	
	if ( blueKills >= 16 and not elist:IsMobSpawnedByNpcTypeID(BLUE_MUDWALKER_TYPE) 
		and not elist:IsMobSpawnedByNpcTypeID(MUDRESET_TYPE)
	) then
	
		-- start event
		blueKills, runners, lurkerState = 0, 0, 0;
		eq.spawn2(MUDESPAWN_TYPE, 0, 0, 338, 88, 68.625, 0);
		
		mob = eq.spawn2(SLUDGE_LURKER_TYPE, 0, 0, 339, 92, 81.751, 0);
		mob:SetSpecialAbility(24, 1); -- Will Not Aggro
		mob:SetSpecialAbility(25, 1); -- Immune to Aggro
		mob:SetSpecialAbility(35, 1); -- No Harm from Players
		mob:SetBodyType(11, false);	-- NoTarget
		
		for _, id in ipairs(BLUE_SPAWNIDS) do
			elist:GetSpawnByID(id):Disable();
			elist:GetSpawnByID(id):SetTimer(7200000);
		end
		
		for i, id in ipairs(reds) do
			mob = elist:GetMob(id);
			eq.stop_timer("depop", mob);
			mob:SetSpecialAbility(24, 0); -- Will Not Aggro off
			mob:SetSpecialAbility(25, 0); -- Immune to Aggro off
			mob:SetSpecialAbility(35, 0); -- No Harm from Players off
			mob:SetBodyType(24, false);	-- Summoned
		end
		
		eq.zone_emote(0, "The last of the mud walkers has been slain. A loud roar is heard from the center of the muddite temple as the Sludge Lurker comes into being.");
		eq.debug("Mud Ring started");
	end
end

function RemoveFromReds(id)
	for i = 1, 16 do
		if ( reds[i] and reds[i] == id ) then
			reds[i] = nil;
		end
	end
end

function RedSpawn(e)
	eq.set_timer("depop", 7200000);
end

function RedTimer(e)
	if ( e.timer == "depop" ) then
		RemoveFromReds(e.self:GetID());
		eq.depop();
	end
end

function RedDeath(e)
	runX, runY, runZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	
	for i = 1, 4 do
		eq.spawn2(RUNNER_TYPE, 0, 0, runX + math.random(-10, 10), runY + math.random(-10, 10), runZ, 0);
	end
	RemoveFromReds(e.self:GetID());
end

function RunnerSpawn(e)
	e.self:SetRunning(true);
	e.self:MoveTo(339, 92, 81.751, -1, true);
end

function RunnerWaypointArrive(e)
	runners = runners + 1;
	
	if ( runners == 64 ) then
		eq.signal(SLUDGE_LURKER_TYPE, 1);
	end
	eq.depop();
end

function LurkerSpawn(e)
	if ( lurkerState == 0 ) then
		eq.set_next_hp_event(80);
		
	elseif ( lurkerState == 1 ) then
		e.self:SetHP(math.floor(e.self:GetMaxHP() * 0.80));
		eq.set_next_hp_event(60);
	
	elseif ( lurkerState == 2 ) then
		e.self:SetHP(math.floor(e.self:GetMaxHP() * 0.60));
		eq.set_next_hp_event(40);
	
	elseif ( lurkerState == 3 ) then
		e.self:SetHP(math.floor(e.self:GetMaxHP() * 0.40));
		eq.set_next_hp_event(20);
		
	elseif ( lurkerState == 4 ) then
		e.self:SetHP(math.floor(e.self:GetMaxHP() * 0.20));
	end
end

function LurkerSignal(e)
	if ( e.signal == 1 ) then
		e.self:SetSpecialAbility(24, 0); -- Will Not Aggro off
		e.self:SetSpecialAbility(25, 0); -- Immune to Aggro off
		e.self:SetSpecialAbility(35, 0); -- No Harm from Players off
		e.self:SetBodyType(24, false);	-- Summoned
		
		e.self:SetRunning(true);
		e.self:MoveTo(runX, runY, runZ, -1, true);
	end
end

function LurkerHpEvent(e)
	local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	local xt = { 25, 25, 25, 0, 0, 0, 0, -25, -25, -25 };
	local yt = { 25, 0, -25, 25, 10, -10, -25, 25, 0, -25 };
	
	for i = 1, 10 do
		eq.spawn2(MUCK_MUDLET_TYPE, 0, 0, x + xt[i], y + yt[i], z, 0);
	end

	eq.get_entity_list():MessageClose(e.self, true, 200, 0, "Massive gobs of mud fly everywhere as the huge creature of mud explodes. The gobs of mud coalesce into smaller mud creatures.");
	eq.depop();
end

function MudletSpawn(e)
	eq.set_timer("depop", 300000);
end

function MudletCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function MudletTimer(e)
	if ( e.timer == "depop" ) then
		eq.depop_all(MUCK_MUDLET_TYPE);
	end
end

function MudletDeath(e)
	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(MUCK_MUDLET_TYPE) ) then
		lurkerState = lurkerState + 1;
		eq.spawn2(SLUDGE_LURKER_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ() + 10, 0);
	end
end

function LurkerDeath(e)
	runX, runY, runZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	local mob;

	eq.get_entity_list():MessageClose(e.self, true, 200, 0, "More mud flies everywhere, coalescing into mud creatures gorged with filth.");

	for i, loc in ipairs(GORGER_LOCS) do
		mob = eq.spawn2(FILTH_GORGER_TYPE, 0, 0, loc[1], loc[2], loc[3], 0);
		mob:SetRunning(true);
		mob:CastToNPC():MoveTo(runX, runY, runZ, -1, true);
	end
end

function GorgerDeath(e)
	runX, runY, runZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	local elist = eq.get_entity_list();

	if ( not elist:IsMobSpawnedByNpcTypeID(FILTH_GORGER_TYPE) ) then
	
		local mob;
		local t = MONSTEROUS_MUDWALKER_TYPE;
		
		if ( not elist:IsMobSpawnedByNpcTypeID(MUDDITE_GUY_TYPE) ) then
			t = MERCILESS_MUDSLINGER_TYPE;
		end
		mob = eq.spawn2(t, 0, 0, 339, 92, 77, 0);
		mob:SetRunning(true);
		mob:CastToNPC():MoveTo(runX, runY, runZ, -1, true);
		
		elist:MessageClose(elist:GetMobByNpcTypeID(THE_LAST_TYPE), true, 400, 0, "The last of the filthy mud men fall to the ground motionless.  Suddenly a monstrous creature of mud forms from the remains of all the other mud men!");
	end
end

function MonsterousSpawn(e)
	eq.set_timer("adds", 60000);
	eq.pause_timer("adds");
end

function MonsterousCombat(e)
	if ( e.joined ) then
		eq.resume_timer("adds");
		eq.set_timer("drophate", 1000);
	else
		eq.pause_timer("adds");
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

function MonsterousTimer(e)
	if ( e.timer == "drophate") then
	
		if ( math.random() < 0.03333 ) then -- averages to once per 30 seconds
			local target = e.self:GetTarget();
			if ( target and target.valid ) then
				e.self:RemoveFromHateList(target);
			end
			eq.debug(e.self:GetName().." dropped target from hate list ("..target:GetName()..")", 2);
		end
		
	elseif ( e.timer == "adds" ) then
		local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
		
		for i = 1, 10 do
			eq.spawn2(MUDDITE_MUDLING_TYPE, 0, 0, x + math.random(-50, 50), y + math.random(-50, 50), z, 0);
		end
	end
end

function EventSuccess(e)
	eq.debug("Mud Ring completed");
	
	eq.depop_all(MUDESPAWN_TYPE);
	eq.spawn2(MUDRESET_TYPE, 0, 0, 0, 0, 6, 0);
	if ( e.self:GetNPCTypeID() == MONSTEROUS_MUDWALKER_TYPE ) then
		eq.depop_with_timer(MUDDITE_GUY_TYPE);
	end
	
	local elist = eq.get_entity_list();
	for _, id in ipairs(BLUE_SPAWNIDS) do
		elist:GetSpawnByID(id):Enable();
	end
	
	for i = 1, 16 do
		reds[i] = nil;
	end
	
	eq.signal(ARBITOR_GUY_TYPE, 2);
end

function DespawnSpawn(e)
	eq.set_timer("depop", 5880000);
end

function DespawnTimer(e)

	if ( e.timer == "depop" ) then
		-- ring timeout fail
		eq.depop_all(RED_MUDWALKER_TYPE);
		eq.depop_all(RUNNER_TYPE);
		eq.depop_all(SLUDGE_LURKER_TYPE);
		eq.depop_all(MUCK_MUDLET_TYPE);
		eq.depop_all(MUDDITE_MUDLING_TYPE);
		eq.depop_all(FILTH_GORGER_TYPE);
		eq.depop_all(MONSTEROUS_MUDWALKER_TYPE);
		eq.depop_all(MERCILESS_MUDSLINGER_TYPE);
		
		--eq.spawn2(MUDRESET_TYPE, 0, 0, 0, 0, 6, 0);

		local elist = eq.get_entity_list();
		for _, id in ipairs(BLUE_SPAWNIDS) do
			elist:GetSpawnByID(id):Enable();
		end

		for i = 1, 16 do
			reds[i] = nil;
		end
		
		eq.debug("Mud Ring failed and reset");
		eq.depop();
	end
end

function ResetSpawn(e)
	eq.set_timer("depop", 18000000);
end

function ResetTimer(e)
	if ( e.timer == "depop" ) then
		
		eq.debug("Mud Ring now available");
		eq.depop();
	end
end

function event_encounter_load(e)

	eq.register_npc_event("MudRing", Event.death_complete, BLUE_MUDWALKER_TYPE, BlueDeath);
	
	eq.register_npc_event("MudRing", Event.spawn, RED_MUDWALKER_TYPE, RedSpawn);
	eq.register_npc_event("MudRing", Event.timer, RED_MUDWALKER_TYPE, RedTimer);
	eq.register_npc_event("MudRing", Event.death_complete, RED_MUDWALKER_TYPE, RedDeath);

	eq.register_npc_event("MudRing", Event.spawn, RUNNER_TYPE, RunnerSpawn);
	eq.register_npc_event("MudRing", Event.waypoint_arrive, RUNNER_TYPE, RunnerWaypointArrive);
	
	eq.register_npc_event("MudRing", Event.spawn, SLUDGE_LURKER_TYPE, LurkerSpawn);
	eq.register_npc_event("MudRing", Event.signal, SLUDGE_LURKER_TYPE, LurkerSignal);
	eq.register_npc_event("MudRing", Event.hp, SLUDGE_LURKER_TYPE, LurkerHpEvent);
	eq.register_npc_event("MudRing", Event.death_complete, SLUDGE_LURKER_TYPE, LurkerDeath);
	
	eq.register_npc_event("MudRing", Event.spawn, MUCK_MUDLET_TYPE, MudletSpawn);
	eq.register_npc_event("MudRing", Event.timer, MUCK_MUDLET_TYPE, MudletTimer);
	eq.register_npc_event("MudRing", Event.death_complete, MUCK_MUDLET_TYPE, MudletDeath);
	
	eq.register_npc_event("MudRing", Event.death_complete, FILTH_GORGER_TYPE, GorgerDeath);
	
	eq.register_npc_event("MudRing", Event.spawn, MONSTEROUS_MUDWALKER_TYPE, MonsterousSpawn);
	eq.register_npc_event("MudRing", Event.combat, MONSTEROUS_MUDWALKER_TYPE, MonsterousCombat);
	eq.register_npc_event("MudRing", Event.timer, MONSTEROUS_MUDWALKER_TYPE, MonsterousTimer);
	eq.register_npc_event("MudRing", Event.death_complete, MONSTEROUS_MUDWALKER_TYPE, EventSuccess);
	eq.register_npc_event("MudRing", Event.spawn, MERCILESS_MUDSLINGER_TYPE, MonsterousSpawn);
	eq.register_npc_event("MudRing", Event.combat, MERCILESS_MUDSLINGER_TYPE, MonsterousCombat);
	eq.register_npc_event("MudRing", Event.timer, MERCILESS_MUDSLINGER_TYPE, MonsterousTimer);
	eq.register_npc_event("MudRing", Event.death_complete, MERCILESS_MUDSLINGER_TYPE, EventSuccess);
	
	eq.register_npc_event("StoneRing", Event.spawn, MUDESPAWN_TYPE, DespawnSpawn);
	eq.register_npc_event("StoneRing", Event.timer, MUDESPAWN_TYPE, DespawnTimer);

	eq.register_npc_event("StoneRing", Event.spawn, MUDRESET_TYPE, ResetSpawn);
	eq.register_npc_event("StoneRing", Event.timer, MUDRESET_TYPE, ResetTimer);
end
