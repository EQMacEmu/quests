local FAKE_JEPLAK_TYPE = 210403; -- Jeplak,_Lord_of_Srerendi
local REAL_JEPLAK_TYPE = 210472; -- Jeplak,_Lord_of_Srerendi
local ADDS_TYPES = {
	210478, -- a_mangled_traveler
	210477, -- a_lost_soul
};
local CASTAWAY_TYPE = 210461; -- a_confused_castaway
local TRASH_GIANT_TYPES = {
	210099, -- a_hleyta_menn (rogue)
	210419, -- a_hleyta_menn (wizard) note: bridge ones have a different type
	210056, -- a_hleytis_maor	
};

local FAKE_SPAWN_ID = 346711;
local SPAWNPOINT_IDS1 = { -- spawns that must die for fake Jeplak to become active
	346713, 346719, 346722, 346725, 346728, 346729, 346731, 346732,	346733,	346734,
	346737, 346712, 346715, 346716, 346717, 346718, 346720, 346721, 346723, 346726,
	346727, 346736, 346751
};
local SPAWNPOINT_IDS2 = { -- spawns that must die for real Jeplak to become active
	346377, 346379, 346380, 346382, 346383, 346384, 346376, 346378, 346381,	346385,
	346730
};

local killed = 0;
local fakeActive = false;
local realActive = false;

function CountDead(spawns)
	local n = 0;
	local allDead = true;
	local elist = eq.get_entity_list();
	
	for _, id in ipairs(spawns) do
		if ( elist:GetSpawnByID(id):GetNPC().valid ) then
			allDead = false;
		else
			n = n + 1;
		end
	end
	
	return n, allDead;
end

function IsCompoundNPC(id)
	local elist = eq.get_entity_list();
	
	for _, i in ipairs(SPAWNPOINT_IDS1) do
		if ( id == i ) then
			return 1;
		end
	end
	for _, i in ipairs(SPAWNPOINT_IDS2) do
		if ( id == i ) then
			return 2;
		end
	end
	return false;
end

function ActivateJeplak(typeId)
	local jeplak = eq.get_entity_list():GetNPCByNPCTypeID(typeId);

	if ( jeplak and jeplak.valid ) then
		jeplak:SetBodyType(1, false);   -- make targetable
		jeplak:SetSpecialAbility(24, 0); -- Will Not Aggro off
		jeplak:SetSpecialAbility(35, 0); -- No Harm from Players off
		eq.set_timer("untarget", 3600000, jeplak);
		
		if ( typeId == FAKE_JEPLAK_TYPE ) then
			fakeActive = true;
			eq.debug("Fake Jeplak active");
		elseif ( typeId == REAL_JEPLAK_TYPE ) then
			realActive = true;
			eq.debug("Real Jeplak active");
		end
	end
end

function TrashDeathCompleteEvent(e)

	if ( IsCompoundNPC(e.self:GetSpawnPointID()) ) then
		killed = killed + 1;
		--eq.debug("jeplak guards killed == "..killed, 3);
	end
	
	local elist = eq.get_entity_list();
	local isFakeUp = elist:IsMobSpawnedByNpcTypeID(FAKE_JEPLAK_TYPE);
	local isRealUp = elist:IsMobSpawnedByNpcTypeID(REAL_JEPLAK_TYPE);

	if ( not isFakeUp and not isRealUp ) then
		return;
	end
	
	if ( isFakeUp and not fakeActive and killed >= 23 ) then
		local n, allDead = CountDead(SPAWNPOINT_IDS1);
		
		if ( allDead ) then
		
			local spawned = 0;
			local spawns = {};
			local mob, x, y, range;
			while (spawned < 8) do
				x = math.random(248, 442);
				y = math.random(-2412, -2364);
				range = true;
				
				for _, m in ipairs(spawns) do
					if ( m:CalculateDistance(x, y, m:GetZ()) < 10 ) then
						range = false;
						break;
					end
				end
				if ( range ) then
					mob = eq.spawn2(eq.ChooseRandom(TRASH_GIANT_TYPES[1], TRASH_GIANT_TYPES[2], TRASH_GIANT_TYPES[3]), 0, 0, x, y, -450, 0);
					table.insert(spawns, mob);
					spawned = spawned + 1;
				end
			end
			
			ActivateJeplak(FAKE_JEPLAK_TYPE);
		end
		
	elseif ( isRealUp and not realActive and killed >= 34 ) then
	
		local n, allDead = CountDead(SPAWNPOINT_IDS2);
		if ( allDead ) then		
			ActivateJeplak(REAL_JEPLAK_TYPE);
		end	
	end
end

-- this is actually how Sony does it; just depops them instantly if they spawn
function TrashSpawnEvent(e)

	if ( realActive ) then
		eq.depop_with_timer();
		return;		
		
	elseif ( fakeActive ) then
	
		local mySpawnID = e.self:GetSpawnPointID();
		local elist = eq.get_entity_list();	
		
		for _, id in ipairs(SPAWNPOINT_IDS1) do
			if ( id == mySpawnID ) then
				eq.depop_with_timer();
				return;
			end
		end
	end
end

function FakeDeathEvent(e)
	eq.unique_spawn(REAL_JEPLAK_TYPE, 0, 0, 348, -3159, -440.5, 0);
	eq.debug("Real Jeplak spawn");
	eq.unique_spawn(CASTAWAY_TYPE, 0, 0, 346, -2513, -455.56, 0);
	fakeActive = false;
	
	if ( killed >= 34 ) then
		local n, allDead = CountDead(SPAWNPOINT_IDS2);
		if ( allDead ) then
			ActivateJeplak(REAL_JEPLAK_TYPE);
		end
	end
end
function RealDeathEvent(e)
	realActive = false;
end

function FakeSpawnEvent(e)
	killed = 0;
	fakeActive = false;
	eq.depop_all(CASTAWAY_TYPE);
end

function FakeTimerEvent(e)
	if ( e.timer == "untarget" ) then
		eq.stop_timer(e.timer);
		e.self:SetBodyType(11, false);   -- make untargetable
		e.self:SetSpecialAbility(24, 1); -- Will Not Aggro on
		e.self:SetSpecialAbility(35, 1); -- No Harm from Players on
		killed = 0;
		fakeActive = false;
		eq.debug("Fake Jeplak inactive");
	end
end
function RealTimerEvent(e)
	if ( e.timer == "adds" ) then
		local x = e.self:GetX();
		local y = e.self:GetY();
		local z = e.self:GetZ() + 5;
		for i = 2, 8 do
			-- he seems to always spawn mobs to the north of him
			eq.spawn2(eq.ChooseRandom(ADDS_TYPES[1], ADDS_TYPES[2]), 0, 0, x + math.random(-100, 100), y + math.random(100, 200), z, 128);
		end
	
	elseif ( e.timer == "untarget" ) then
		eq.stop_timer(e.timer);
		eq.spawn_from_spawn2(FAKE_SPAWN_ID);
		killed = 0;
		realActive = false;
		eq.debug("Real Jeplak despawn");
		eq.depop();
	end
end

function FakeCombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("untarget");
	else
		eq.resume_timer("untarget");
	end
end
function RealCombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("untarget");
		eq.set_timer("adds", 60000);
	else
		eq.resume_timer("untarget");
		eq.stop_timer("adds");
	end
end

function AddsSpawnEvent(e)
	eq.set_timer("depop", 57000);
end
function AddsTimerEvent(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end
function AddsCombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)

	for _, id in ipairs(TRASH_GIANT_TYPES) do
		eq.register_npc_event("Jeplak", Event.death_complete, id, TrashDeathCompleteEvent);
		eq.register_npc_event("Jeplak", Event.spawn, id, TrashSpawnEvent);
	end

	eq.register_npc_event("Jeplak", Event.death, FAKE_JEPLAK_TYPE, FakeDeathEvent);
	eq.register_npc_event("Jeplak", Event.spawn, FAKE_JEPLAK_TYPE, FakeSpawnEvent);
	eq.register_npc_event("Jeplak", Event.timer, FAKE_JEPLAK_TYPE, FakeTimerEvent);
	eq.register_npc_event("Jeplak", Event.combat, FAKE_JEPLAK_TYPE, FakeCombatEvent);

	eq.register_npc_event("Jeplak", Event.death, REAL_JEPLAK_TYPE, RealDeathEvent);
	eq.register_npc_event("Jeplak", Event.timer, REAL_JEPLAK_TYPE, RealTimerEvent);
	eq.register_npc_event("Jeplak", Event.combat, REAL_JEPLAK_TYPE, RealCombatEvent);
	
	for _, id in ipairs(ADDS_TYPES) do
		eq.register_npc_event("Jeplak", Event.spawn, id, AddsSpawnEvent);
		eq.register_npc_event("Jeplak", Event.timer, id, AddsTimerEvent);
		eq.register_npc_event("Jeplak", Event.combat, id, AddsCombatEvent);
	end
end
