local DRORNOK_TYPE = 210469; -- Drornok_Tok_Vo`Lok
local CAVE_TYPES = {
	210040, -- a_typhoon_amphan
	210047, -- a_tempest_toad
	210046, -- a_hurricane_loktole
	210084, -- a_vacillating_loktole
};
local ADD_TYPES = {
	210476, -- a_hurricane_loktole
	210473, -- a_tempest_toad
	210474, -- a_typhoon_amphan
	210475, -- a_vacillating_loktole
};
local SPAWNPOINT_IDS = {
	346427, 346434, 346440, 346445,
	346428, 346429, 346430, 346431, 346432, 346433, 346435, 346436, 346437, 346438, 346439, 346441, 346442, 346443, 346444, 346446, 346447, 346448,
	346449, 346450, 346451, 346452, 346453, 346454, 346455, 346456, 346457, 346458
};
local DRORNOK_ADDS = {
	{ -324, -208, -398.2648 },
	{ 80, -424, -401.9691 },
	{ 28, 78, -397.0002 },
	{ -23, 83, -391.5327 },
	{ -269, -7, -396.1164 },
	{ -309, -285, -390.9721 },
	{ -2, -462, -389.0407 },
	{ 152, -376, -390.1432 },
	{ -210, 50, -389.4285 },
	{ -220, -398, -393.2427 },
	{ -153, -461, -379.8 },
	{ 232, -255, -389.2242 },
	{ 180, -54, -394.2787 },
	{ 79, 42, -392.4409 },
	{ -312, -83, -400.3886 },
	{ 221, -130, -403.1064 },
	{ 117, 10, -395.7058 },
	{ -150, 83, -400.3603 },
	{ 214, -309, -403.1923 },
	{ 232, -198, -398.561 },
};

local killed = 0;

function DeathEvent(e)
	
	local mySpawnID = e.self:GetSpawnPointID();
	for _, id in ipairs(SPAWNPOINT_IDS) do
		if ( id == mySpawnID ) then
			killed = killed + 1; -- only count non-script spawns
			break;
		end
	end

	local elist = eq.get_entity_list();
	local mob;
	for i, t in ipairs(CAVE_TYPES) do
		mob = elist:GetNPCByNPCTypeID(t);
		if ( mob.valid and mob:GetID() ~= e.self:GetID() ) then
			return; -- don't spawn Drornok unless all these types are dead at same time
		end
	end

	if ( killed > 31 ) then
		killed = 0;
		eq.spawn_condition("postorms", 1, 0);		-- disable respawns
		eq.unique_spawn(DRORNOK_TYPE, 0, 0, -46, -180, -574, 0);
		for _, coords in ipairs(DRORNOK_ADDS) do
			eq.spawn2(eq.ChooseRandom(CAVE_TYPES[1], CAVE_TYPES[2], CAVE_TYPES[3], CAVE_TYPES[4]), 0, 0, coords[1], coords[2], coords[3], 0);
		end
		eq.debug("Drornok spawn");
	end
end

function DrornokDeathEvent(e)
	local elist = eq.get_entity_list();
	
	for _, id in ipairs(SPAWNPOINT_IDS) do
		elist:GetSpawnByID(id):SetTimer(3000000 + math.random(0, 600000));
	end

	eq.spawn_condition("postorms", 1, 1);		-- enable respawns
	killed = 0;
	eq.debug("Drornok killed");
end

function DrornokCombatEvent(e)
	if ( e.joined ) then
		eq.set_timer("adds", 120000);
	else
		eq.stop_timer("adds");
	end
end

function DrornokTimerEvent(e)
	if ( e.timer == "adds" ) then
		for i = 1, 4 do
			eq.spawn2(eq.ChooseRandom(ADD_TYPES[1], ADD_TYPES[2], ADD_TYPES[3], ADD_TYPES[4]), 0, 0, e.self:GetX() + math.random(-30, 30), e.self:GetY() + math.random(-30, 30), e.self:GetZ() + 5, 0);
		end
	end
end

function AddSpawnEvent(e)
	eq.set_timer("depop", 180000);
end

function AddCombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function AddTimerEvent(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function event_encounter_load(e)

	for _, id in ipairs(CAVE_TYPES) do
		eq.register_npc_event("Drornok", Event.death, id, DeathEvent);
	end
	for _, id in ipairs(ADD_TYPES) do
		eq.register_npc_event("Drornok", Event.spawn, id, AddSpawnEvent);
		eq.register_npc_event("Drornok", Event.combat, id, AddCombatEvent);
		eq.register_npc_event("Drornok", Event.timer, id, AddTimerEvent);
	end
	
	eq.register_npc_event("Drornok", Event.death, DRORNOK_TYPE, DrornokDeathEvent);
	eq.register_npc_event("Drornok", Event.combat, DRORNOK_TYPE, DrornokCombatEvent);
	eq.register_npc_event("Drornok", Event.timer, DRORNOK_TYPE, DrornokTimerEvent);
	
	eq.spawn_condition("postorms", 1, 1);		-- enable respawns; in case zone went down with Drornok up
end
