local CONTROLLER_TYPE = 214104; -- General_Invisible_Man
local UNTARGETABLE_TYPE = 214052; -- #Rallos_Zek_
local RALLOS_ZEK_TYPE = 214311; -- Rallos_Zek
local WARLORD_TYPE = 214312; -- Rallos_Zek_the_Warlord
local TALLON_TYPE = 214313; -- Tallon_Zek
local VALLON_TYPE = 214320; -- Vallon_Zek (level 73)
local VALLON_SPAWN_TYPE = 214319; -- Vallon_Zek (level 64, no slow mitigation version)
local BOAR_TYPE = 214287; -- A_Chaos_Boar
local WRAITH_TYPE = 214288; -- A_Chaos_Wraith
local BERIK_TYPE = 214056; -- Decorin_Berik
local GRUNHORK_TYPE = 214057; -- Decorin_Grunhork
local FLAYER_TYPE = 214084; -- Gindan_Flayer
local SHADOW_TYPE = 214086; -- Hendin_Shadow_Master
local ELITE_TYPE = 214289; -- A_Decorin_Elite
local PLANAR_PROJECTION_TYPE = 214322; -- A_Planar_Projection 
local CORPSE_TYPES = { 214007, 214008, 214009, 214010, 214011 };

local UNTARGETABLE_SPAWNID = 361379;
local BERIK_SPAWNID = 361190;
local GRUNHORK_SPAWNID = 361200;
local ARENA_SPAWNIDS = { 
	361141, 361347,		-- two arena corpses; this will make the remaining five spawn wraiths
	361191, 361192, 361195, 361198, 361199, 361203, 361219,		-- initiates
	361197, 361205, 361211,		-- wraiths
	361166, 361167, 361202, 361209, 361212,		-- boars
	361176, 361196,		-- war crows
	361208,	361170, 361173	-- kobolds
};
local FLOOR_SPAWNS = {
	361366, 361369, 361371, 361372, 361375, 361378, 361382, 361383, 361386, 361388, 361389, 361392, 361394, 361396, 361398, 361187, 361367, 
	361368, 361370, 361373, 361374, 361376, 361377, 361380, 361381, 361384, 361385, 361387, 361390, 361391, 361393, 361395, 361397, 361399
};

local phase = 0;
local arenaEmpty = false;
local raidID = 0;
local roomSpawns = {};
local killerName, killerGName = "", "";

function CheckFloorSpawns()

	local npc;
	for _, id in ipairs(FLOOR_SPAWNS) do

		npc = eq.get_entity_list():GetSpawnByID(id):GetNPC();
		if ( npc and npc.valid and npc:GetZ() < 118 ) then
			npc:BuffFadeAll();
			if ( npc:IsEngaged() ) then
				npc:WipeHateList();
			end
			npc:GMMove(npc:GetSpawnPointX(), npc:GetSpawnPointY(), npc:GetSpawnPointZ(), npc:GetSpawnPointH());
		end
	end
end

function ControllerTimerEvent(e)

	if ( e.timer == "wraiths" ) then
		SpawnPitWave();
		
	elseif ( e.timer == "respawn" ) then
		RespawnArena();
		
	elseif ( e.timer == "poofadds" ) then

		if ( phase ~= 0 ) then
			return;
		end
		
		-- doing it this way to avoid making copies of these types	
		local mob;
		local elist = eq.get_entity_list();
		local i = #roomSpawns;
		while (i > 0) do
			if (roomSpawns[i]) then
				mob = elist:GetMobID(roomSpawns[i]);
				
				if ( not mob or not mob.valid or mob:IsCorpse() ) then
					table.remove(roomSpawns, i);
				elseif ( not mob:IsEngaged() ) then
					--eq.debug("RZ script "..mob:GetName().." depop", 3);
					mob:Depop();
					table.remove(roomSpawns, i);
				end
			end
			i = i - 1;
		end
		if ( #roomSpawns == 0 ) then
			eq.stop_timer(e.timer);
			--eq.debug("RZ script adds table cleared", 3);
		else
			return;
		end
		
	elseif ( e.timer == "doors" ) then
	
		if ( phase == 0 and eq.get_entity_list():IsMobSpawnedByNpcTypeID(UNTARGETABLE_TYPE) ) then

			if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(BERIK_TYPE)
				and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(GRUNHORK_TYPE)
			) then

				phase = 1;
				eq.zone_emote(7, "The air of Drunder grows strangely cold as a rumble shakes through the fortress' walls.  The Warlord stirs.")
				eq.unique_spawn(TALLON_TYPE, 31, 0, 621, -560, 158, 192):SetRunning(true);
				eq.unique_spawn(VALLON_TYPE, 30, 0, 594, 581, 158, 192):SetRunning(true);
				
				eq.get_entity_list():GetSpawnByID(GRUNHORK_SPAWNID):Disable();
				eq.get_entity_list():GetSpawnByID(BERIK_SPAWNID):Disable();
				CheckFloorSpawns(); -- anti-cheat
				eq.debug(string.format("PoTactics Rallos Zek Event Phase 1 Started by %s's raid <%s>", killerName, killerGName));
			end
		end
		
	elseif ( e.timer == "brothers_killed" ) then
	
		if ( phase == 1 and eq.get_entity_list():IsMobSpawnedByNpcTypeID(UNTARGETABLE_TYPE) ) then
			if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(VALLON_TYPE)
				and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(TALLON_TYPE)
			) then
				phase = 2;
				eq.zone_emote(7, "A tremor rumbles through the halls of Drunder.  Terror wells up inside you as you struggle to keep your footing.");
				
				local mob = eq.get_entity_list():GetMobByNpcTypeID(UNTARGETABLE_TYPE);
				eq.unique_spawn(RALLOS_ZEK_TYPE, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading());
				eq.depop_with_timer(UNTARGETABLE_TYPE);
				eq.debug(string.format("PoTactics Rallos Zek Event Phase 2 Started by %s's raid <%s>", killerName, killerGName));
			end
		end
		CheckFloorSpawns(); -- anti-cheat

	elseif ( e.timer == "brothers_depop" ) then
	
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(TALLON_TYPE)
			and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(VALLON_TYPE)
		) then
			eq.signal(CONTROLLER_TYPE, 4);
			RespawnDoorGuards();
		end
	end
	
	eq.stop_timer(e.timer);
end

function ControllerSignalEvent(e)
	
	if ( e.signal == 1 ) then		-- spawn elites in phase 2
		eq.spawn2(ELITE_TYPE, 0, 0, 1060, 581, 124, 192);
		eq.spawn2(ELITE_TYPE, 0, 0, 1060, -560, 124, 192);
		
	elseif ( e.signal == 2 ) then	-- spawn wraiths in phase 3
		eq.set_timer("wraiths", 10000);
		
	elseif ( e.signal == 3 ) then	-- RZTW killed
		eq.set_timer("respawn", 1800000);
		
	elseif ( e.signal == 4 ) then	-- poof room adds that spawn when the zek brothers reach end waypoints
		eq.set_timer("poofadds", 60000);
		
	elseif ( e.signal == 5 ) then	-- 'unlock' doors and spawn zek brothers
		eq.set_timer("doors", 3000);
		
	elseif ( e.signal == 6 ) then	-- when zek brother dies; check if both are dead and advance phase
		eq.set_timer("brothers_killed", 3000);
		
	elseif ( e.signal == 7 ) then	-- when zek brother poofs.  has to be done with timer because if they poof at same time, it fails when checked on depop
		eq.set_timer("brothers_depop", 3000);
	end
end

function UntargetableSpawnEvent(e)
	phase = 0;
end

function DoorGuardDeathEvent(e)
	eq.signal(CONTROLLER_TYPE, 5);
	killerName, killerGName = e.killer:GetName() or "", e.killer:CastToClient():GetGuildName() or "";
end

function BrotherDeathEvent(e)
	eq.signal(CONTROLLER_TYPE, 6);
	killerName, killerGName = e.killer:GetName() or "", e.killer:CastToClient():GetGuildName() or "";
end

function SpawnRoomAdd(t, x, y, h)
	local mob = eq.spawn2(t, 0, 0, x, y, 178, h);
	table.insert(roomSpawns, mob:GetID());
	mob:SetSpecialAbility(49, 1);	-- corpse camp
	return mob;
end

function VallonWaypointArrive(e)
	if ( e.wp == 3 ) then
		local mob;
		local t = FLAYER_TYPE;
		local y = 108;
		local h = 128;
		local x = { 384, 355, 277, 246 };
		for i = 1, 4 do
			mob = SpawnRoomAdd(t, x[i], y, h);
			eq.signal(214084, mob:GetID()); -- signal flayers so they'll split and not depop
		end
	end
end

function TallonWaypointArrive(e)
	if ( e.wp == 3 ) then
		local t = SHADOW_TYPE;
		local y = -91;
		local h = 0;
		local x = { 381, 350, 281, 246 };
		for i = 1, 4 do
			SpawnRoomAdd(t, x[i], y, h);
		end
	end
end

function BrotherSpawnEvent(e)
	eq.set_timer("depop", 1200000);
	eq.set_timer("bounds", 5000);
	eq.set_next_hp_event(50); -- for Vallon
	e.self:CastToNPC():SetCastRateDetrimental(75); -- for Tallon
end

function BrotherTimerEvent(e)

	if ( e.timer == "bounds" and e.self:GetX() > 820 ) then
		e.self:WipeHateList();
		
		-- UpdateWaypoint() is not working after they reach their final waypoint, so just doing this
		if ( #roomSpawns > 0 ) then
			if ( e.self:GetNPCTypeID() == TALLON_TYPE ) then
				e.self:GMMove(319, -85, 181.6, 128, true, true);
				
			else
				e.self:GMMove(319, 110, 181.6, 0, true, true);
			end
		else
			e.self:GMMove(380, 6, 190, 192, true, true);
			e.self:UpdateWaypoint(3);
		end
	
	elseif ( e.timer == "depop" ) then
		eq.signal(CONTROLLER_TYPE, 7);
		eq.depop();
	end
end

function VallonHPEvent(e)
	if ( e.hp_event == 50 ) then
		-- vallon adds are similar to the other vallon's, so reusing the type
		local mob = eq.spawn2(VALLON_SPAWN_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		mob:CastToNPC():SetBaseHP(55000);
		mob:Heal();
		mob:SetSpecialAbility(16, 1); -- unsnarable
		mob:SetSpecialAbility(12, 1); -- unslowable
		mob:SetSpecialAbility(13, 0); -- make mezable
		
		mob = eq.spawn2(VALLON_SPAWN_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		mob:CastToNPC():SetBaseHP(55000);
		mob:Heal();
		mob:SetSpecialAbility(16, 1); -- unsnarable
		CheckFloorSpawns(); -- anti-cheat
	end
end

function RespawnDoorGuards()
	phase = 0;
	raidID = 0;
	killerName, killerGName = "", "";
	eq.get_entity_list():GetSpawnByID(GRUNHORK_SPAWNID):Enable();
	eq.get_entity_list():GetSpawnByID(BERIK_SPAWNID):Enable();	
	eq.debug("Rallos Zek event reset");
end

function RallosSpawnEvent(e)
	eq.set_timer("depop", 1170000);
	eq.set_timer("bounds", 6000);
	eq.set_next_hp_event(98);
end

function RallosCombatEvent(e)
	if ( e.joined ) then
		eq.set_timer("elites", 20000);
		if ( e.self:GetHPRatio() > 98 ) then
			eq.set_next_hp_event(98);
		end
	else
		eq.stop_timer("elites");
		eq.resume_timer("depop");
	end
end

function RallosTimerEvent(e)

	if ( e.timer == "bounds" ) then
		if ( e.self:GetZ() < 115 ) then
		
			if ( e.self:IsEngaged() ) then
				local target = e.self:GetTarget();
				if ( target and target.valid ) then
					eq.zone_emote(7, "Rallos begins to laugh, causing the earth to rumble around you. 'Enough of this foolishness!  The warlord has better things to do then chase petty mortals all day!'");
					e.self:CastSpell(982, target:GetID());
				end
			end

			e.self:GMMove(500, 20, 194.125, 64, true, true);
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
			e.self:WipeHateList();
		end
		
	elseif ( e.timer == "elites" ) then
		eq.set_timer(e.timer, 50000);
		eq.signal(CONTROLLER_TYPE, 1);
		
	elseif ( e.timer == "depop" ) then
		eq.signal(CONTROLLER_TYPE, 4);
		eq.spawn_from_spawn2(UNTARGETABLE_SPAWNID);
		RespawnDoorGuards();
		RespawnArena();
		eq.depop();
	end
end

function RallosHPEvent(e)
	if ( e.hp_event == 98 ) then
		eq.pause_timer("depop");
		eq.set_next_hp_event(75);
		CheckFloorSpawns(); -- anti-cheat

	elseif ( e.hp_event == 75 ) then
		eq.set_next_hp_event(50);		
		DespawnArena();
		CheckFloorSpawns(); -- anti-cheat
		
	elseif ( e.hp_event == 50 ) then
		eq.get_entity_list():MessageClose(e.self, true, 200, 0, "Rallos Zek growls, sending shivers up your spine.  He lets out a great warcry sending you flying back against the stone walls.  He turns and runs out across the platform and jumps into the arena.");
		eq.unique_spawn(WARLORD_TYPE, 0, 0, 705, 0, -290, 0);
		eq.signal(CONTROLLER_TYPE, 4);
		phase = 3;
		killerName, killerGName = e.self:GetTarget():GetName() or "", e.self:GetTarget():CastToClient():GetGuildName() or "";
		eq.debug(string.format("PoTactics Rallos Zek Event Phase 3 Started by %s's raid <%s>", killerName, killerGName));
		eq.depop();
	end
end

function DespawnArena()
	if ( arenaEmpty ) then
		return;
	end
	eq.zone_emote(7, "A great cry echoes across the field of blood and through the halls of Drunder.  The creatures in the arena flee to avoid the impending doom.");
	
	local elist = eq.get_entity_list();
	for _, id in ipairs(ARENA_SPAWNIDS) do
		elist:GetSpawnByID(id):Disable();
	end

	arenaEmpty = true;
end

function RespawnArena()
	local elist = eq.get_entity_list();
	for _, id in ipairs(ARENA_SPAWNIDS) do
		elist:GetSpawnByID(id):Enable();
	end
	eq.debug("Arena spawns enabled");
	arenaEmpty = false;
end

function WarlordSpawnEvent(e)
	eq.set_timer("depop", 1200000);
	eq.set_timer("bounds", 6000);
	raidID = 0;
end

function WarlordCombatEvent(e)
	if ( e.joined ) then
		eq.set_timer("twitch", 55000);
		eq.pause_timer("depop");
		eq.stop_timer("checkhp");
	else
		raidID = 0;
		eq.stop_timer("twitch");
		eq.resume_timer("depop");
		if ( e.self:GetHPRatio() < 99 ) then
			eq.set_timer("checkhp", 3000);
		end
	end
end

function WarlordTimerEvent(e)

	if ( e.timer == "bounds" ) then
		if ( e.self:GetX() > 940 or e.self:GetX() < 439 or e.self:GetY() < -400 or e.self:GetY() > 410 or e.self:GetZ() > -250 ) then
		
			if ( e.self:IsEngaged() ) then
				local target = e.self:GetTarget();
				if ( target and target.valid ) then
					eq.zone_emote(7, "Rallos begins to laugh, causing the earth to rumble around you. 'Enough of this foolishness!  The warlord has better things to do then chase petty mortals all day!'");
					e.self:CastSpell(982, target:GetID());
				end
			end

			e.self:GMMove(705, 0, -290, 0, true, true);
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
			e.self:WipeHateList();	
		end
	
	elseif ( e.timer == "checkhp" ) then
		if ( e.self:GetHP() == e.self:GetMaxHP() ) then
			eq.stop_timer(e.timer);
			eq.depop_all(BOAR_TYPE);
			eq.depop_all(WRAITH_TYPE);
		end
	
	elseif ( e.timer == "twitch" ) then
		eq.zone_emote(7, "The corpses across the grounds of the arena begin to twitch and spasm as the will of the Warlord brings them to life.");
		eq.signal(CONTROLLER_TYPE, 2);
		
	elseif ( e.timer == "depop" ) then
		eq.spawn_from_spawn2(UNTARGETABLE_SPAWNID);
		RespawnArena();
		RespawnDoorGuards();
		eq.depop();
	end
end

function WarlordDeathEvent(e)
	eq.spawn2(PLANAR_PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PLANAR_PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
	RespawnDoorGuards();
	eq.signal(CONTROLLER_TYPE, 3);
	eq.debug(string.format("PoTactics Rallos Zek the Warlord slain by %s's raid <%s>", e.killer:GetName(), e.killer:CastToClient():GetGuildName()));
end

function WarlordHateListEvent(e)

	if ( e.joined and e.other:IsClient() ) then
	
		local client = e.other:CastToClient();
		if ( client:GetGM() ) then
			return;
		end
		
		local raid = client:GetRaid();
		local id = raid:GetID();
		
		-- banish players who are either not in a raid of 20 or more, or not in the raid that pulled RZ
		if ( not raid.valid or raid:RaidCount() < 20 ) then
			eq.debug("Rallos Zek the Warlord is banishing player "..e.other:GetName().." for not being in a raid of 20 or more");
			client:MovePC(202, 1008, -44, 390, 0);	-- PoK Library
			
		elseif ( raidID ~= 0 and raidID ~= id ) then
			eq.debug("Rallos Zek the Warlord is banishing player "..e.other:GetName().." for not being in the raid that pulled him");
			client:MovePC(202, 1008, -44, 390, 0);	-- PoK Library
			
		elseif ( id ~= 0 and raidID == 0 ) then
			raidID = id;
			eq.debug("Rallos Zek pulled by raid ID "..id);
		end		
	end
end

function EliteSpawnEvent(e)
	eq.set_timer("depop", 1200000);
	eq.set_timer("aggro", 10000);
	eq.set_timer("check", 10000);
end

function EliteTimerEvent(e)
	if ( e.timer == "aggro" ) then
		eq.stop_timer(e.timer);
		
		local rz = eq.get_entity_list():GetMobByNpcTypeID(RALLOS_ZEK_TYPE);
		local t;
		if ( not rz or not rz.valid ) then
			rz = eq.get_entity_list():GetMobByNpcTypeID(WARLORD_TYPE);	-- RZTW sometimes gets elites running to him.  happens on Live and AK
		end
		if ( rz and rz.valid ) then
			if ( rz:IsEngaged() ) then
				t = rz:GetHateRandomClient(400);		-- add random hater from RZ's list to elite's list
			end
			e.self:SetRunning(true);
			e.self:MoveTo(rz:GetX(), rz:GetY(), rz:GetZ(), -1, true);
			if ( t and t.valid ) then
				e.self:AddToHateList(t, 20);
			end
		end
	
	elseif ( e.timer == "check" and phase == 2 ) then
		-- if elite pulled downstairs
		if ( e.self:GetZ() < 118 ) then
			local rz = eq.get_entity_list():GetMobByNpcTypeID(RALLOS_ZEK_TYPE);
			if ( rz and rz.valid ) then
				e.self:GMMove(rz:GetX(), rz:GetY(), rz:GetZ(), 0);
				e.self:WipeHateList();
			end
		end
	
	elseif ( e.timer == "depop" ) then
		eq.depop();
	end
end

function SpawnPitWave()

	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(WARLORD_TYPE) ) then
		return;
	end
	
	local npcList = eq.get_entity_list():GetNPCList();
	local mob, rng;
	local typesMap = {};
	
	for _, t in ipairs(CORPSE_TYPES) do
		typesMap[t] = 1;
	end

	for i = 1, 2 do
		mob = eq.spawn2(BOAR_TYPE, 0, 0, 705, 0, -290, 0);
		rng = math.random(5, 11);
		mob:SetWalkspeed(rng / 10.0);
		mob:SetRunspeed(rng / 10.0 * 2.5);
	end
	
	for npc in npcList.entries do
	
		if ( npc.valid ) then
		
			if ( typesMap[npc:GetNPCTypeID()] ) then
				mob = eq.spawn2(WRAITH_TYPE, 0, 0, npc:GetX(), npc:GetY(), npc:GetZ()+5, math.random(1, 255));
				rng = math.random(5, 11);
				mob:SetWalkspeed(rng / 10.0);
				mob:SetRunspeed(rng / 10.0 * 2.5);
				npc:Depop(true);
			end
		end			
	end
end

function PitAddSpawnEvent(e)
	eq.set_timer("depop", 600000);
	eq.set_timer("move", 10);
	eq.set_timer("bounds", 6000);
end

function PitAddTimerEvent(e)

	if ( e.timer == "move" and not e.self:IsEngaged() ) then
		eq.set_timer(e.timer, 6000);
		
		local rz = eq.get_entity_list():GetMobByNpcTypeID(WARLORD_TYPE);
		if ( rz and rz.valid ) then
			e.self:MoveTo(rz:GetX(), rz:GetY(), rz:GetZ(), -1, true);
		end
		
	elseif ( e.timer == "bounds" ) then

		if ( e.self:GetX() > 940 or e.self:GetX() < 439 or e.self:GetY() < -400 or e.self:GetY() > 410 or e.self:GetZ() > -250 ) then
		
			e.self:GMMove(705, 0, -290, 0);
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
			e.self:WipeHateList();
			eq.set_timer("move", 10);
		end
	
	elseif ( e.timer == "depop" ) then
		eq.depop();
	end
end

function DepopCombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)

	eq.register_npc_event("Rallos", Event.timer, CONTROLLER_TYPE, ControllerTimerEvent);
	eq.register_npc_event("Rallos", Event.signal, CONTROLLER_TYPE, ControllerSignalEvent);

	eq.register_npc_event("Rallos", Event.spawn, UNTARGETABLE_TYPE, UntargetableSpawnEvent);
	
	eq.register_npc_event("Rallos", Event.death_complete, BERIK_TYPE, DoorGuardDeathEvent);
	eq.register_npc_event("Rallos", Event.death_complete, GRUNHORK_TYPE, DoorGuardDeathEvent);

	eq.register_npc_event("Rallos", Event.death_complete, TALLON_TYPE, BrotherDeathEvent);
	eq.register_npc_event("Rallos", Event.death_complete, VALLON_TYPE, BrotherDeathEvent);
	eq.register_npc_event("Rallos", Event.spawn, TALLON_TYPE, BrotherSpawnEvent);
	eq.register_npc_event("Rallos", Event.timer, TALLON_TYPE, BrotherTimerEvent);
	eq.register_npc_event("Rallos", Event.combat, TALLON_TYPE, DepopCombatEvent);
	eq.register_npc_event("Rallos", Event.spawn, VALLON_TYPE, BrotherSpawnEvent);
	eq.register_npc_event("Rallos", Event.timer, VALLON_TYPE, BrotherTimerEvent);
	eq.register_npc_event("Rallos", Event.combat, VALLON_TYPE, DepopCombatEvent);
	eq.register_npc_event("Rallos", Event.hp, VALLON_TYPE, VallonHPEvent);
	
	eq.register_npc_event("Rallos", Event.waypoint_arrive, TALLON_TYPE, TallonWaypointArrive);
	eq.register_npc_event("Rallos", Event.waypoint_arrive, VALLON_TYPE, VallonWaypointArrive);
	
	eq.register_npc_event("Rallos", Event.spawn, RALLOS_ZEK_TYPE, RallosSpawnEvent);
	eq.register_npc_event("Rallos", Event.timer, RALLOS_ZEK_TYPE, RallosTimerEvent);
	eq.register_npc_event("Rallos", Event.combat, RALLOS_ZEK_TYPE, RallosCombatEvent);
	eq.register_npc_event("Rallos", Event.hp, RALLOS_ZEK_TYPE, RallosHPEvent);
	
	eq.register_npc_event("Rallos", Event.spawn, ELITE_TYPE, EliteSpawnEvent);
	eq.register_npc_event("Rallos", Event.timer, ELITE_TYPE, EliteTimerEvent);
	eq.register_npc_event("Rallos", Event.combat, ELITE_TYPE, DepopCombatEvent);

	eq.register_npc_event("Rallos", Event.spawn, WARLORD_TYPE, WarlordSpawnEvent);
	eq.register_npc_event("Rallos", Event.timer, WARLORD_TYPE, WarlordTimerEvent);
	eq.register_npc_event("Rallos", Event.combat, WARLORD_TYPE, WarlordCombatEvent);
	eq.register_npc_event("Rallos", Event.hate_list, WARLORD_TYPE, WarlordHateListEvent);
	eq.register_npc_event("Rallos", Event.death_complete, WARLORD_TYPE, WarlordDeathEvent);

	eq.register_npc_event("Rallos", Event.spawn, WRAITH_TYPE, PitAddSpawnEvent);
	eq.register_npc_event("Rallos", Event.timer, WRAITH_TYPE, PitAddTimerEvent);
	eq.register_npc_event("Rallos", Event.combat, WRAITH_TYPE, DepopCombatEvent);
	eq.register_npc_event("Rallos", Event.spawn, BOAR_TYPE, PitAddSpawnEvent);
	eq.register_npc_event("Rallos", Event.timer, BOAR_TYPE, PitAddTimerEvent);
	eq.register_npc_event("Rallos", Event.combat, BOAR_TYPE, DepopCombatEvent);
end
