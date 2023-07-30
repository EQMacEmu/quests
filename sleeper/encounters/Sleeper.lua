local CONTROLLER_TYPE = 128134; -- StaticShoutOne
local SLEEPER_TYPE = 128094; -- #The_Sleeper
local GUARDIAN_TYPE = 114508; -- A_Guardian_of_the_Shrine in skyshrine
local WARDER_TYPES = { 128090, 128091, 128092, 128093 };
local SIGNAL_TYPES = { 119112, 120084, 32040, 73057, 108510, 123011 }; -- nag, vox, klandicar etc
local GRID = {
	-1487.00, -2149.00, -1049.80,
	-1489.00, -2017.00, -990.30,
	-1489.00, -1969.00, -989.80,
	-1073.00, -1968.00, -989.80,
	-1073.00, -2383.00, -989.80,
	-613.00, -2384.00, -985.80,
	-384.00, -2384.00, -917.60,
	24.00, -2384.00, -917.60,
	29.00, -2384.00, -697.80,
	382.00, -2385.00, -697.80,
	627.00, -2382.00, -704.70,
	621.00, -2338.00, -410.00,
	621.00, -2329.00, -409.80,
	624.00, -2262.00, -441.80,
	624.00, -975.00, -409.80,
	817.00, -975.00, -377.80,
	817.00, -1165.00, -345.80,
	623.00, -1165.00, -313.80,
	625.00, -973.00, -281.80,
	817.00, -974.00, -249.80,
	815.00, -1169.00, -217.80,
	620.00, -1167.00, -185.80,
	625.00, -976.00, -153.80,
	1009.00, -976.00, -121.80,
	1008.00, -1328.00, -121.80,
	1172.00, -1328.00, -121.80,
	1295.00, -1461.00, -121.80,
	1295.00, -2032.00, -89.80,
	1107.00, -2034.00, -57.80,
	1103.00, -1836.00, -25.80,
	1291.00, -1839.00, 6.20,
	1295.00, -2034.00, 38.20,
	1100.00, -2033.00, 70.20,
	1105.00, -1670.00, 106.20,
	971.00, -1626.00, 106.20,
	975.00, -1247.00, 106.20,
	1104.00, -1249.00, 106.20,
	1103.00, -977.00, 106.20,
	640.00, -975.00, 106.20,
	529.00, -977.00, 58.20,
	227.00, -976.00, 58.20,
	159.00, -976.00, 106.20,
	-81.00, -975.00, 106.20,
	-79.00, -618.00, 106.20,
	-79.00, -978.00, 106.20,
	161.00, -975.00, 106.10,
	274.00, -975.00, 58.20,
	273.00, -928.00, 58.20,
	274.00, -810.00, 6.20,
	403.00, -483.00, 6.20,
	396.00, -19.00, 6.20,
	-64.00, -12.00, 2.10,
};

function ControllerSignal(e)
	if ( e.signal == 1 ) then
		local sleeper = eq.get_entity_list():GetNPCByNPCTypeID(SLEEPER_TYPE);
		if ( not sleeper.valid ) then
			eq.debug("Sleeper NPC is missing; aborting");
			return;
		end
		local rng = math.random(33); -- 3% chance to wake
		if ( rng > 1 ) then
			eq.debug("All warders killed and Sleeper roll failed. ("..rng..")");
			return;
		end

		local kerafyrm = eq.spawn2(SLEEPER_TYPE, 0, 0, sleeper:GetX(), sleeper:GetY(), sleeper:GetZ(), sleeper:GetHeading(), "Kerafyrm"):CastToNPC();
		sleeper:Depop();
		kerafyrm:SetSpecialAbility(24, 0); -- will not aggro
		kerafyrm:SetSpecialAbility(35, 0); -- no harm from players
		kerafyrm:SetWalkspeed(1.0);
		kerafyrm:SetRunspeed(2.5);

		kerafyrm:Shout("I AM FREE!");
		
		kerafyrm:SetWanderType(6);
		kerafyrm:SetPauseType(1);
		kerafyrm:AddWaypoint(kerafyrm:GetX(), kerafyrm:GetY(), kerafyrm:GetZ(), -1, 0, false);
		kerafyrm:AddWaypoint(kerafyrm:GetX(), kerafyrm:GetY(), kerafyrm:GetZ(), -1, 20, false);
		local i = 1;
		while (GRID[i]) do
			kerafyrm:AddWaypoint(GRID[i], GRID[i+1], GRID[i+2], -1, 0, false);
			i = i + 3;
		end
		
		local npcList = eq.get_entity_list():GetNPCList();
		for npc in npcList.entries do
		
			if ( npc.valid and npc:GetPrimaryFaction() == 472 ) then -- Warders of The Claw
				npc:SetNPCAggro(true);
			end			
		end
		
		for _, t in ipairs(SIGNAL_TYPES) do
			eq.signal(t, 1);
		end

	end
end

function WaypointArrive(e)
	if ( e.wp == e.self:GetMaxWp() - 1 ) then
		eq.signal(GUARDIAN_TYPE, 1);
		eq.debug("Sleeper at end waypoint");
	end
end

function WarderDeath(e)
	for _, id in ipairs(WARDER_TYPES) do
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(id) ) then
			return;
		end
	end
	eq.debug("all warders slain");
	eq.signal(CONTROLLER_TYPE, 1, 25000);
end

function event_encounter_load(e)
	for _, id in ipairs(WARDER_TYPES) do
		eq.register_npc_event("Sleeper", Event.death_complete, id, WarderDeath);
	end
	
	eq.register_npc_event("Sleeper", Event.signal, CONTROLLER_TYPE, ControllerSignal);
	eq.register_npc_event("Sleeper", Event.waypoint_arrive, SLEEPER_TYPE, WaypointArrive);
end
