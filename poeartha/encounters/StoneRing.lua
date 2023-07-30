local ROCK_CREATION_TYPE = 218032;
local CRUMBLING_STONE_MASS_TYPE = 218031;
local PILE_OF_BOULDERS_TYPE = 218030;
local BOULDER_THROWER_TYPE = 218033;
local FORTIFICATION_TYPE = 218369;
local MOUND_OF_RUBBLE_TYPE = 218370;
local FAKE_MONSTROSITY_TYPE = 218029;
local ROCK_MONSTROSITY_TYPE = 218371;
local STONE_HEAP_TYPE = 218372;
local ENCRUSTED_DIRT_CLOUD_TYPE = 218373;
local PEREGRIN_ROCKSKULL_TYPE = 218374;
local STONETXT_TYPE = 218036; -- invis man where emotes are centered from
local STONEDESPAWN_TYPE = 218395; -- invis man that spawns when the event begins and depops in 98 minutes which will fail the event
local STONERESET_TYPE = 218388; -- invis man that spawns when the event ends (win or lose) and prevents the trigger mobs from spawning until depop. (6 hours)
local STONE_GUY_TYPE = 218391;	-- note: Live servers will not spawn the loot version of the boss if this is spawned.  I'm doing the opposite so zone crashes/reboots won't allow the rings to be redone
local ARBITOR_GUY_TYPE = 218393;
local MUDDITE_GUY_TYPE = 218390;
local POEELEM3DAY_TYPE = 218412;
local VEGEROG_GUY_TYPE = 218392;

local TRIGGER_TYPES = { [CRUMBLING_STONE_MASS_TYPE] = 1, [PILE_OF_BOULDERS_TYPE] = 2, [ROCK_CREATION_TYPE] = 3, [BOULDER_THROWER_TYPE] = 4 };
local TRIGGER_SPAWNIDS = { 365379, 365553, 365938, 367419, 366541, 366866, 366694, 367274 };
local FAKE_MONSTROSITY_SPAWNID = 366842;

local FORT_LOCS = {
	{ 
		{ -649, -262, 87, 192 }, 
		{ -649, -274, 87, 192 }, 
		{ -640, -279, 87, 192 }, 
		{ -640, -268, 87, 192 }, 
		{ -640, -256, 87, 192 }, 
		{ -657, -268, 87, 192 }, 
		{ -657, -279, 87, 192 }, 
		{ -657, -257, 87, 192 }, 
		{ -657, -246, 87, 192 }, 
		{ -649, -251, 87, 192 }, 
		{ -640, -245, 87, 192 }, 
	},
	{
		{ -616, -299, 87, 128 }, 
		{ -599, -306, 87, 128 }, 
		{ -628, -306, 87, 128 }, 
		{ -622, -306, 87, 128 }, 
		{ -616, -306, 87, 128 }, 
		{ -611, -306, 87, 128 }, 
		{ -605, -306, 87, 128 }, 
		{ -616, -292, 87, 128 }, 
		{ -616, -286, 87, 128 }, 
		{ -634, -306, 87, 128 }, 
	},
	{
		{ -616, -214, 87, 0 },
		{ -621, -222, 87, 0 },
		{ -610, -222, 87, 0 },
		{ -604, -231, 87, 0 },
		{ -616, -231, 87, 0 },
		{ -627, -231, 87, 0 },
		{ -632, -239, 87, 0 },
		{ -622, -239, 87, 0 },
		{ -610, -239, 87, 0 },
		{ -599, -239, 87, 0 },
	},
	{
		{ -591, -245, 87, 64 }, 
		{ -584, -245, 87, 64 }, 
		{ -591, -257, 87, 64 }, 
		{ -584, -268, 87, 64 }, 
		{ -575, -279, 87, 64 }, 
		{ -591, -280, 87, 64 }, 
		{ -575, -245, 87, 64 }, 
		{ -584, -257, 87, 64 }, 
		{ -575, -257, 87, 64 }, 
		{ -591, -268, 87, 64 }, 
		{ -575, -268, 87, 64 }, 
		{ -584, -279, 87, 64 }, 
	},
};

local RUBBLE_LOCS = {
	{ -598, -279, 95.37598, 224 },
	{ -631, -279, 95.37598, 30 },
	{ -631, -245, 95.37598, 96 },
	{ -598, -245, 95.37598, 160 },
};

local HEAP_LOCS = {
	{ -555, -323, 87 },
	{ -676, -323, 87 },
	{ -676, -203, 87 },
	{ -555, -203, 87 },
};


local fortKills, heapKills = 0, 0;
local runX, runY, runZ;
local rubbleIds;

function TriggerDeath(e)
	local myType = e.self:GetNPCTypeID();
	local elist = eq.get_entity_list();

	if ( not elist:IsMobSpawnedByNpcTypeID(myType) ) then	-- note: this will fail if you #kill the NPCs; use #damage instead to test

		if ( not elist:IsMobSpawnedByNpcTypeID(STONEDESPAWN_TYPE) ) then

			-- start event
			fortKills, heapKills = 0, 0;
			rubbleIds = {};
			eq.spawn2(STONEDESPAWN_TYPE, 0, 0, -587, -206, 82.627, 0);
			for _, id in ipairs(TRIGGER_SPAWNIDS) do
				elist:GetSpawnByID(id):Disable(false);
			end
			
			eq.debug("Stone Ring started");
		end
		
		local locs = FORT_LOCS[TRIGGER_TYPES[myType]];
		
		eq.get_entity_list():MessageClose(eq.get_entity_list():GetMobByNpcTypeID(STONETXT_TYPE), true, 200, 0, "The ground shudders as stone fortifications are summoned forth.");
		for _, loc in ipairs(locs) do
			eq.spawn2(FORTIFICATION_TYPE, 0, 0, loc[1], loc[2], loc[3], loc[4]);
		end
	end
end

function FortDeath(e)
	fortKills = fortKills + 1;

	if ( fortKills == 43 ) then
	
		eq.get_entity_list():MessageClose(eq.get_entity_list():GetMobByNpcTypeID(STONETXT_TYPE), true, 200, 0, "The Rock Monstrosity crumbles into mounds of rubble.");
		
		for i, loc in ipairs(RUBBLE_LOCS) do
			rubbleIds[eq.spawn2(MOUND_OF_RUBBLE_TYPE, 0, 0, loc[1], loc[2], loc[3], loc[4]):GetID()] = i;
		end
		eq.get_entity_list():GetSpawnByID(FAKE_MONSTROSITY_SPAWNID):Disable();
	end
end

function RubbleSpawnEvent(e)
	eq.set_next_hp_event(20);
end

function RubbleHpEvent(e)
	if ( e.hp_event == 20 ) then
		e.self:Heal();
		e.self:SetSpecialAbility(24, 1); -- Will Not Aggro
		e.self:SetSpecialAbility(25, 1); -- Immune to Aggro
		e.self:SetSpecialAbility(35, 1); -- No Harm from Players
		e.self:SetBodyType(11, false);	-- NoTarget
		e.self:BuffFadeAll();
		e.self:WipeHateList();
		eq.set_timer("wipe", 5000);

		runX, runY, runZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();

		local loc = RUBBLE_LOCS[rubbleIds[e.self:GetID()]];
		e.self:MoveTo(loc[1], loc[2], loc[3], loc[4], true);
	end
end

function RubbleTimerEvent(e)
	if ( e.timer == "wipe" ) then
		if ( e.self:IsEngaged() ) then
			e.self:WipeHateList();		-- sometimes they end up still aggro for whatever reason
		end
	end
end

function RubbleWaypointArrive(e)
	local mob;
	local n = 0;
	
	for id, i in pairs(rubbleIds) do
	
		mob = eq.get_entity_list():GetMob(id);
		if ( mob and mob.valid ) then
			if ( mob:GetX() == RUBBLE_LOCS[i][1] and mob:GetY() == RUBBLE_LOCS[i][2] and mob:GetSpecialAbility(35) == 1 ) then
				n = n + 1;
			end
		else
			eq.debug("Stone Ring critical error: invalid A_Mound_of_Rubble entity ID. (NPC may have been killed, which should not happen in normal gameplay)");
		end
	end
	
	if ( n == 4 ) then
		-- all 4 rubbles are untargetable and back at spawn points
		eq.get_entity_list():MessageClose(eq.get_entity_list():GetMobByNpcTypeID(STONETXT_TYPE), true, 200, 0, "The mounds of rubble reform back into the Rock Monstrosity.");

		mob = eq.spawn2(ROCK_MONSTROSITY_TYPE, 0, 0, -614, -261, 95.375, 64);
		mob:SetRunning(true);
		if ( runX and runY and runZ ) then
			mob:CastToNPC():MoveTo(runX, runY, runZ, -1, false);
		end
		eq.depop_all(MOUND_OF_RUBBLE_TYPE);
	end
end

function MonstrosityDeath(e)
	runX, runY, runZ = e.self:GetX(), e.self:GetY(), e.self:GetZ() - 4.38;
	SpawnHeaps(e);
end

function SpawnHeaps(e)
	local mob;
	
	for i, loc in ipairs(HEAP_LOCS) do
	
		mob = eq.spawn2(STONE_HEAP_TYPE, 0, 0, loc[1], loc[2], loc[3], 0);
		mob:SetRunning(true);
		if ( runX and runY and runZ ) then
			mob:CastToNPC():MoveTo(runX, runY, runZ, -1, true);
		end
	end
	
	if ( heapKills == 0 ) then
		mob = eq.spawn2(PEREGRIN_ROCKSKULL_TYPE, 0, 0, -616, -261, 95.375, 64);
		local npc = mob:CastToNPC();
		npc:SetSpecialAbility(24, 1); -- Will Not Aggro
		npc:SetSpecialAbility(25, 1); -- Immune to Aggro
		npc:SetSpecialAbility(35, 1); -- No Harm from Players
		npc:SetBodyType(11, false);	-- NoTarget
		eq.set_timer("lie", 1000, mob);
		
		eq.get_entity_list():MessageClose(eq.get_entity_list():GetMobByNpcTypeID(STONETXT_TYPE), true, 200, 0, "A gigantic formation of rocks appears, glowing with barely contained fury. It collapses to the ground in a pile of rubble, as heaps of misshapen stone rise from the corners of the temple and close in to attack!");
	else
		-- note: if you #kill these without damaging them first it will crash the zone
		eq.get_entity_list():MessageClose(eq.get_entity_list():GetMobByNpcTypeID(STONETXT_TYPE), true, 200, 0, "Heaps of misshapen rise from the corners of the temple and close in to attack!");
	end
end

function HeapDeath(e)
	heapKills = heapKills + 1;
	runX, runY, runZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	
	if ( heapKills == 4 or heapKills == 8 or heapKills == 12 or heapKills == 16 or heapKills == 20 ) then
		SpawnHeaps();
	
	elseif ( heapKills == 24 ) then
	
		eq.get_entity_list():MessageClose(eq.get_entity_list():GetMobByNpcTypeID(STONETXT_TYPE), true, 200, 0, "As the last of the stone heaps collapses, the gigantic formation of rocks slowly rises to its feet. A gravelly voice echoes in your mind, 'Fools! Invaders! It's been ages since this plane was fouled with the stench of your kind. Prepare to meet your end.' The large rock man then readies itself for attack.");
		
		eq.depop_all(PEREGRIN_ROCKSKULL_TYPE);
		
		local t = PEREGRIN_ROCKSKULL_TYPE;
	
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(STONE_GUY_TYPE) ) then
			t = ENCRUSTED_DIRT_CLOUD_TYPE;
		end
		
		local mob = eq.spawn2(t, 0, 0, -614, -261, 95.375, 64);
		mob:SetRunning(true);
		mob:CastToNPC():MoveTo(runX, runY, runZ, -1, false);
	end
end

function BossCombat(e)
	if ( e.joined ) then
		eq.set_timer("drophate", 1000);
	else
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
	
		if ( math.random() < 0.01666 ) then -- averages to once per minute
			local target = e.self:GetTarget();
			if ( target and target.valid ) then
				e.self:RemoveFromHateList(target);
			end
			eq.debug(e.self:GetName().." dropped target from hate list ("..target:GetName()..")", 2);
		end
		
	elseif ( e.timer == "lie" ) then
		e.self:SetAppearance(3); -- lying
		eq.stop_timer(e.timer);
	end
end

function EventSuccess(e)
	eq.debug("Stone Ring completed");
	
	eq.depop_all(STONEDESPAWN_TYPE);
	eq.spawn2(STONERESET_TYPE, 0, 0, -587, -206, 85.75, 0);
	if ( e.self:GetNPCTypeID() == PEREGRIN_ROCKSKULL_TYPE ) then
		eq.depop_with_timer(STONE_GUY_TYPE);
	end
	
	eq.signal(ARBITOR_GUY_TYPE, 1);
end

function DespawnSpawn(e)
	eq.set_timer("depop", 5880000);
end

function DespawnTimer(e)

	if ( e.timer == "depop" ) then
		-- ring timeout fail
		eq.depop_all(FORTIFICATION_TYPE);
		eq.depop_all(MOUND_OF_RUBBLE_TYPE);
		eq.depop_all(ROCK_MONSTROSITY_TYPE);
		eq.depop_all(STONE_HEAP_TYPE);
		eq.depop_all(ENCRUSTED_DIRT_CLOUD_TYPE);
		eq.depop_all(PEREGRIN_ROCKSKULL_TYPE);
		
		--eq.spawn2(STONERESET_TYPE, 0, 0, -587, -206, 85.75, 0);
		local elist = eq.get_entity_list();
		for _, id in ipairs(TRIGGER_SPAWNIDS) do
			elist:GetSpawnByID(id):Enable();
		end
		elist:GetSpawnByID(FAKE_MONSTROSITY_SPAWNID):Enable();
		
		eq.debug("Stone Ring failed and reset");
		eq.depop();
	end
end

function ResetSpawn(e)
	eq.set_timer("depop", 18000000);
end

function ResetTimer(e)
	if ( e.timer == "depop" ) then
		
		local elist = eq.get_entity_list();
		for _, id in ipairs(TRIGGER_SPAWNIDS) do
			elist:GetSpawnByID(id):Enable();
		end
		elist:GetSpawnByID(FAKE_MONSTROSITY_SPAWNID):Enable();
		
		eq.debug("Stone Ring now available");
		eq.depop();
	end
end

function event_encounter_load(e)

	for id in pairs(TRIGGER_TYPES) do
		eq.register_npc_event("StoneRing", Event.death_complete, id, TriggerDeath);
	end
	
	eq.register_npc_event("StoneRing", Event.death_complete, FORTIFICATION_TYPE, FortDeath);
	
	eq.register_npc_event("StoneRing", Event.spawn, MOUND_OF_RUBBLE_TYPE, RubbleSpawnEvent);
	eq.register_npc_event("StoneRing", Event.hp, MOUND_OF_RUBBLE_TYPE, RubbleHpEvent);
	eq.register_npc_event("StoneRing", Event.timer, MOUND_OF_RUBBLE_TYPE, RubbleTimerEvent);
	eq.register_npc_event("StoneRing", Event.waypoint_arrive, MOUND_OF_RUBBLE_TYPE, RubbleWaypointArrive);
	
	eq.register_npc_event("StoneRing", Event.spawn, STONEDESPAWN_TYPE, DespawnSpawn);
	eq.register_npc_event("StoneRing", Event.timer, STONEDESPAWN_TYPE, DespawnTimer);
	
	eq.register_npc_event("StoneRing", Event.death_complete, ROCK_MONSTROSITY_TYPE, MonstrosityDeath);
	
	eq.register_npc_event("StoneRing", Event.death_complete, STONE_HEAP_TYPE, HeapDeath);
	
	eq.register_npc_event("StoneRing", Event.death_complete, ENCRUSTED_DIRT_CLOUD_TYPE, EventSuccess);
	eq.register_npc_event("StoneRing", Event.death_complete, PEREGRIN_ROCKSKULL_TYPE, EventSuccess);
	eq.register_npc_event("StoneRing", Event.combat, ENCRUSTED_DIRT_CLOUD_TYPE, BossCombat);
	eq.register_npc_event("StoneRing", Event.combat, PEREGRIN_ROCKSKULL_TYPE, BossCombat);
	eq.register_npc_event("StoneRing", Event.timer, ENCRUSTED_DIRT_CLOUD_TYPE, BossTimer);
	eq.register_npc_event("StoneRing", Event.timer, PEREGRIN_ROCKSKULL_TYPE, BossTimer);
	
	eq.register_npc_event("StoneRing", Event.spawn, STONERESET_TYPE, ResetSpawn);
	eq.register_npc_event("StoneRing", Event.timer, STONERESET_TYPE, ResetTimer);
end
