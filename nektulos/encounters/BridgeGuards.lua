-- This is scripted primarily because if normal grids were used, it would require long pauses at the bridge
-- which would make the guards not return to their spawn points after aggroing for long periods of time.
-- Not sure how Sony did these spawns, they weren't observed on AK, but they did path along the roads periodically

local BRIDGE_TYPES = { 25439, 25442, 25447, 25123, 25436, 25440, 25449, 25117, 25441, 25443, 25406, 25437, 25438, 25448 };
local NW_SPAWNID = 369636;
local NE_SPAWNID = 342022;
local SW_SPAWNID = 342044;
local SE_SPAWNID = 342039;
local NORTH_GRID = {
    -53.00, -816.00, -7.50, 0,
    -53.00, -816.00, -7.50, 0,
    -54.00, -578.00, -5.70, 0,
    55.00, -503.00, -5.70, 0,
    50.00, -295.00, -3.10, 0,
    45.00, 321.00, -4.40, 0,
    155.00, 394.00, -4.10, 0,
    149.00, 503.00, -5.70, 0,
    152.00, 720.00, -2.80, 0,
    43.00, 794.00, -13.00, 0,
    53.00, 1119.00, -0.20, 0,
    -58.00, 1195.00, -5.60, 0,
    -62.00, 1704.00, -0.80, 0,
    -154.00, 1719.00, -2.60, 0,
    -150.00, 2198.00, -2.60, 0,
    67.00, 2200.00, -2.20, 0,
    136.00, 2309.00, -2.80, 0,
    465.00, 2301.00, -16.60, 0,
    527.00, 2416.00, -20.80, 0,
    575.00, 2424.00, -24.90, 0,
    655.00, 2496.00, -19.10, 0,
    648.00, 2591.00, -17.70, 60,
    647.00, 2486.00, -19.60, 0,
    513.00, 2400.00, -21.30, 0,
    463.00, 2299.00, -16.20, 0,
    134.00, 2311.00, -2.00, 0,
    60.00, 2200.00, -1.70, 0,
    -156.00, 2199.00, -2.90, 0,
    -152.00, 1718.00, -2.70, 0,
    -60.00, 1697.00, -0.80, 0,
    -56.00, 1190.00, -5.40, 0,
    55.00, 1117.00, 0.00, 0,
    45.00, 790.00, -13.00, 0,
    154.00, 715.00, -2.70, 0,
    145.00, 501.00, -5.70, 0,
    -265.00, 504.00, 0.40, 0,
    -359.00, 606.00, 2.50, 0,
    -352.00, 688.00, -2.30, 60,
    -355.00, 591.00, 2.40, 0,
    -261.00, 493.00, 1.50, 0,
    150.00, 504.00, -5.70, 0,
    148.00, 388.00, -4.30, 0,
    42.00, 322.00, -4.40, 0,
    51.00, -295.00, -3.10, 0,
    365.00, -299.00, -12.30, 0,
    440.00, -186.00, -14.50, 0,
    961.00, -198.00, -11.60, 0,
    1154.00, -4.00, 0.80, 0,
    1148.00, 90.00, 6.00, 60,
    1150.00, -16.00, 1.20, 0,
    949.00, -202.00, -14.60, 0,
    436.00, -191.00, -14.20, 0,
    352.00, -300.00, -10.30, 0,
    46.00, -294.00, -3.20, 0,
    48.00, -511.00, -5.70, 0,
    -57.00, -581.00, -5.70, 0,
    -53.00, -815.00, -7.50, 0,
};
local SOUTH_GRID = {
	-39.00, -1085.00, -7.50, 0,
	-39.00, -1085.00, -7.50, 0,
	-48.00, -1311.00, -5.70, 0,
	-258.00, -1485.00, -5.70, 0,
	-249.00, -1792.00, -5.70, 0,
	-249.00, -1913.00, -5.70, 0,
	-557.00, -2183.00, -5.70, 0,
	-551.00, -2278.00, -9.90, 60,
	-553.00, -2177.00, -5.70, 0,
	-244.00, -1901.00, -5.70, 0,
	-249.00, -1795.00, -5.70, 0,
	131.00, -1794.00, -1.70, 60,
	-247.00, -1791.00, -5.70, 0,
	-252.00, -1477.00, -5.70, 0,
	-43.00, -1305.00, -5.70, 0,
	-41.00, -1086.00, -7.50, 0,
};
local eq = eq;

function TimerEvent(e)
	local s1, s2, grid, npc;
    local elist = eq.get_entity_list();
	local sid = e.self:GetSpawnPointID();
	if ( sid == NW_SPAWNID or sid == NE_SPAWNID ) then
		s1 = elist:GetSpawnByID(NW_SPAWNID):GetNPC();
		s2 = elist:GetSpawnByID(NE_SPAWNID):GetNPC();
		grid = NORTH_GRID;
	else
		s1 = elist:GetSpawnByID(SW_SPAWNID):GetNPC();
		s2 = elist:GetSpawnByID(SE_SPAWNID):GetNPC();
		grid = SOUTH_GRID;
	end
    
    if ( s1 and s1.valid and s2 and s2.valid ) then
        if ( s1:GetX() == s1:GetSpawnPointX() and s1:GetY() == s1:GetSpawnPointY() and s1:GetGrid() == 0
            and s2:GetX() == s2:GetSpawnPointX() and s2:GetY() == s2:GetSpawnPointY() and s2:GetGrid() == 0
        ) then
            if ( math.random(2) == 1 ) then
                npc = s1;
            else
                npc = s2;
            end
            npc:SetWanderType(0);
            npc:SetPauseType(1);

            local i = 1;
            while (grid[i]) do
                npc:AddWaypoint(grid[i], grid[i+1], grid[i+2], -1, grid[i+3], false);
                i = i + 4;
            end
			npc:AddWaypoint(npc:GetSpawnPointX(), npc:GetSpawnPointY(), npc:GetSpawnPointZ(), npc:GetHeading(), 3, false);
        end
        
    end
end

function SpawnEvent(e)
    eq.set_timer("check_move", 600000);
end

function WaypointArrive(e)
	local sid = e.self:GetSpawnPointID();
	if ( sid == NW_SPAWNID or sid == NE_SPAWNID ) then
		if ( e.wp == 57 ) then
			e.self:RemoveWaypoints();
		end
	else
		if ( e.wp == 16 ) then
			e.self:RemoveWaypoints();
		end
	end
end

function event_encounter_load(e)
	for _, typ in ipairs(BRIDGE_TYPES) do
		eq.register_npc_event("BridgeGuards", Event.timer, typ, TimerEvent);
		eq.register_npc_event("BridgeGuards", Event.spawn, typ, SpawnEvent);
		eq.register_npc_event("BridgeGuards", Event.waypoint_arrive, typ, WaypointArrive);
	end
end
