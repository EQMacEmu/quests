--[[
blood death					emp spawn
[Sat Apr 28 21:00:42 2012][Sat Apr 28 21:04:38 2012] 3:56
[Sat Sep  1 19:43:51 2012][Sat Sep  1 19:47:47 2012] 3:56
[Fri Apr  5 22:22:19 2013][Fri Apr  5 22:26:15 2013] 3:56
[Sun May 26 13:27:57 2013][Sun May 26 13:31:53 2013] 3:54
[Mon Jun 24 21:44:41 2013][Mon Jun 24 21:50:00 2013] 5:19
[Tue Jul  9 22:14:09 2013][Tue Jul  9 22:19:29 2013] 5:20
[Sat Aug 10 22:11:45 2013][Sat Aug 10 22:17:04 2013] 5:19
[Thu Sep 26 13:36:34 2013][Thu Sep 26 13:41:53 2013] 5:19
[Sun Sep 29 10:19:40 2013][Sun Sep 29 10:23:36 2013] 3:56
[Fri Dec 21 22:28:05 2012][Fri Dec 21 22:33:25 2012] 5:20
[Fri Aug  2 23:29:35 2013][Fri Aug  2 23:34:55 2013] 5:20

]]

local GOVERNOR_TYPE = 162054;	-- EmpInitSpawn
local FAKE_EMP_TYPE = 162065;	-- untargetable emp
local FAKE_EMP_SPAWNPOINT = 352885;
local REAL_EMP_TYPE = 162491;
local GOLEM_TYPE = 162493;		-- #Ssraeshzian_Blood_Golem
local BLOOD_TYPE = 162189;		-- #Blood_of_Ssraeshza
local BLOOD_SPAWNPOINT = 352792;
local GOLEM_SPAWNPOINT = 369150;
local TRAP_TYPE = 162492;		-- 4 corner traps that cast Avatar Power
local WRAITH_TYPE = 162494;
local CURSE_TRAP_TYPE = 162478;	-- center room invis man that casts Curse of Ssraeshza after some time
local ROOM_GUARDS = { [162128] = 1, [162123] = 1, [162130] = 1, [162126] = 1, [162127] = 1, [162129] = 1, [162124] = 1, [162125] = 1 }

local cursed = false;
local empDepopped = false;

function GovernorTimer(e)

	if ( e.timer == "despawntraps" ) then
		eq.stop_timer("traps");
		eq.depop_all(TRAP_TYPE);
		cursed = false;
	
	elseif ( e.timer == "twitchesemote" ) then
		eq.stop_timer("twitchesemote");
		eq.set_timer("spawnemp", 120000);
		eq.zone_emote(7, "  The Emperor twitches.  He appears to have been weakened by the destruction of the golem.");
		
	elseif ( e.timer == "spawnemp" ) then
		eq.stop_timer("spawnemp");
		
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(FAKE_EMP_TYPE) ) then
			local fake = eq.get_entity_list():GetMobByNpcTypeID(FAKE_EMP_TYPE);
		
			if ( fake and fake.valid ) then
				eq.spawn2(REAL_EMP_TYPE, 0, 0, fake:GetX(), fake:GetY(), fake:GetZ(), fake:GetHeading());
			end
			
			fake:Depop(true);
			eq.update_spawn_timer(FAKE_EMP_SPAWNPOINT, 10800000); -- in case zone crashes or sleeps; timer will reset to full on emp death
		end
	--[[
	elseif ( e.timer == "trapscast" ) then
	
		local npcList = eq.get_entity_list():GetNPCList();
		
		if ( npcList ) then
		
			for npc in npcList.entries do

				if ( npc.valid and npc:GetNPCTypeID() == TRAP_TYPE ) then
					npc:CastSpell(808, e.self:GetID(), 0, 1);
				end
			end
		end
	]]
	
	end
end

function ActivateTraps()

	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(TRAP_TYPE) ) then

		for i = 1, 11 do
			eq.spawn2(TRAP_TYPE, 0, 0, 691, -287, 402, 0);
			eq.spawn2(TRAP_TYPE, 0, 0, 690, -354, 402, 0);
			eq.spawn2(TRAP_TYPE, 0, 0, 626, -355, 402, 0);
			eq.spawn2(TRAP_TYPE, 0, 0, 629, -292, 402, 0);
		end
		
		--eq.set_timer("trapscast", 10000, eq.get_entity_list():GetMobByNpcTypeID(GOVERNOR_TYPE));
	end
end

function BloodAggro(e)

	if ( e.joined ) then
		ActivateTraps();
	else
		eq.set_timer("despawntraps", 2880000, eq.get_entity_list():GetMobByNpcTypeID(GOVERNOR_TYPE));
	end
end

function BloodDeath(e)
	local t = 115;
	if ( math.random(100) > 50 ) then
		t = 200;
	end
	eq.set_timer("twitchesemote", t * 1000, eq.get_entity_list():GetMobByNpcTypeID(GOVERNOR_TYPE));
	eq.set_timer("despawntraps", 2880000, eq.get_entity_list():GetMobByNpcTypeID(GOVERNOR_TYPE));

	eq.spawn_condition("ssratemple", 1, 0);		-- disable blood respawn
	eq.spawn_condition("ssratemple", 2, 1);		-- enable lootless golem spawn

	eq.get_entity_list():GetSpawnByID(GOLEM_SPAWNPOINT):Reset();
	eq.get_entity_list():GetSpawnByID(BLOOD_SPAWNPOINT):Reset();
end

function FakeEmpSpawn(e)

	if ( empDepopped ) then		-- only execute this function if this is a respawn from a kill
		empDepopped = false;
		return;
	end
	eq.spawn_condition("ssratemple", 1, 1);		-- enable blood respawn
	eq.spawn_condition("ssratemple", 2, 0);		-- disable lootless golem spawn

	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(GOLEM_TYPE) ) then

		eq.get_entity_list():GetMobByNpcTypeID(GOLEM_TYPE):Depop(true);
		eq.spawn_from_spawn2(BLOOD_SPAWNPOINT);
	end	
end

function EmpDeath(e)
	eq.spawn2(WRAITH_TYPE, 0, 0, 877, -326, 408, 192);
	eq.spawn2(WRAITH_TYPE, 0, 0, 953, -293, 404, 176);
	eq.spawn2(WRAITH_TYPE, 0, 0, 953, -356, 404, 203);
	eq.spawn2(WRAITH_TYPE, 0, 0, 773, -360, 403, 52);
	eq.spawn2(WRAITH_TYPE, 0, 0, 770, -289, 403, 72);

	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(FAKE_EMP_TYPE) ) then
		-- possible if emp fight is super long
		eq.get_entity_list():GetMobByNpcTypeID(FAKE_EMP_TYPE):Depop(true);
	else
		eq.get_entity_list():GetSpawnByID(FAKE_EMP_SPAWNPOINT):Reset();
	end
end

function DepopCombat(e)
	if ( e.joined ) then
		if ( not eq.is_paused_timer("depop") ) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function EmpTimer(e)

	if ( e.timer == "sploitcheck" ) then

		if ( e.self:GetZ() < 400 or e.self:GetY() > -180 or e.self:GetY() < -468 ) then
			empDepopped = true;
			eq.spawn_from_spawn2(FAKE_EMP_SPAWNPOINT);
			eq.depop();		-- depop Emp if somebody pulls him outside of room somehow
		end
		
		-- make room adds aggro in case they avoid it somehow
		local npcList = eq.get_entity_list():GetNPCList();
		local emp = eq.get_entity_list():GetMobByNpcTypeID(REAL_EMP_TYPE);
		
		if ( emp and emp.valid and emp:IsEngaged() and npcList ) then
		
			for npc in npcList.entries do

				if ( npc.valid and ROOM_GUARDS[npc:GetNPCTypeID()] ) then

					if ( not npc:IsEngaged() ) then
						npc:AddToHateList(emp:GetHateTop());
					end
				end
			end
		end
		
	elseif ( e.timer == "depop" ) then
		empDepopped = true;
		eq.spawn_from_spawn2(FAKE_EMP_SPAWNPOINT);
		eq.depop();
	end
end

function TrapCombat(e)

	if ( e.joined and not cursed ) then
		eq.set_timer("blood", 240000);
		eq.set_timer("curse", 1113000);
		cursed = true;
	end
end

function TrapTimer(e)

	if ( e.timer == "curse" ) then
		eq.stop_timer("curse");
		
		if ( e.self:IsEngaged() ) then
			e.self:Emote("Something tells you that this room isn't safe anymore...");
			eq.set_timer("curse2", 312000);
		end
		
	elseif ( e.timer == "curse2" ) then
		eq.stop_timer("curse2");
	
		if ( e.self:IsEngaged() ) then
			e.self:Emote("A hissing echos in your ears...");
			e.self:CastSpell(2069, e.self:GetID(), 0, 1);
		end
		eq.depop_with_timer();
	
	elseif ( e.timer == "blood" ) then
		eq.stop_timer("blood");
		e.self:Emote("You notice a splatter of oddly colored blood on the floor");
	end
end

function event_encounter_load(e)

	eq.register_npc_event("Emperor", Event.timer, GOVERNOR_TYPE, GovernorTimer);

	eq.register_npc_event("Emperor", Event.combat, GOLEM_TYPE, BloodAggro);
	eq.register_npc_event("Emperor", Event.death, GOLEM_TYPE, BloodDeath);
	eq.register_npc_event("Emperor", Event.combat, BLOOD_TYPE, BloodAggro);
	eq.register_npc_event("Emperor", Event.death, BLOOD_TYPE, BloodDeath);

	eq.register_npc_event("Emperor", Event.spawn, FAKE_EMP_TYPE, FakeEmpSpawn);

	eq.register_npc_event("Emperor", Event.death, REAL_EMP_TYPE, EmpDeath);
	eq.register_npc_event("Emperor", Event.spawn, REAL_EMP_TYPE, function()
		eq.set_timer("sploitcheck", 5000);
		eq.set_timer("depop", 2700000);
	end);
	eq.register_npc_event("Emperor", Event.timer, REAL_EMP_TYPE, EmpTimer);
	eq.register_npc_event("Emperor", Event.combat, REAL_EMP_TYPE, DepopCombat);

	eq.register_npc_event("Emperor", Event.combat, WRAITH_TYPE, DepopCombat);
	eq.register_npc_event("Emperor", Event.spawn, WRAITH_TYPE, function()
		eq.set_timer("depop", 2700000);
	end);
	eq.register_npc_event("Emperor", Event.timer, WRAITH_TYPE, function()
		eq.depop();
	end);
	
	eq.register_npc_event("Emperor", Event.combat, CURSE_TRAP_TYPE, TrapCombat);
	eq.register_npc_event("Emperor", Event.timer, CURSE_TRAP_TYPE, TrapTimer);
	eq.register_npc_event("Emperor", Event.spawn, CURSE_TRAP_TYPE, function()
		cursed = false;
	end);
end
