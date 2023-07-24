local BOAR1_TYPE = 214301; -- a_Stampeding_Boar (armored)
local BOAR2_TYPE = 214302; -- a_Stampeding_Boar (unarmored)
local PIGLET_TYPE = 214303; -- #a_Stampeding_Piglet

local SPAWN_LOCS_X = { 1205, 1200, 1210, 1200, 1205, 1200, 1210, 1200, 1210, 1205 };
local SPAWN_LOCS_Y = { -300, -300, -310, -320, -310, -310, -315, -315, -300, -315 };

function SpawnBoars()
	local y, npc, pause;
	local z = -286.625;
	local x2, x3, y2, y3;
	
	-- spawn 30 boars and 1 piglet from 10 spawnpoints
	for j = 1, 4 do
		pause = 10 + j * 4;
		
		for i, x in ipairs(SPAWN_LOCS_X) do
		
			y = SPAWN_LOCS_Y[i];
				
			if ( j == 4 and i > 1 ) then
				return;
			end

			if ( i == 1 or i == 4 or i == 7 ) then
				x2 = math.random(485,750);
				y2 = math.random(-330, 300);
				
				if ( i == 1 and j == 1 ) then
					x3 = x2;	-- save these for piglet; it needs to run out with wave 1
					y3 = y2;
				end
			elseif ( i == 10 ) then
				x2 = 925;
				y2 = 220;
			end
			
			if ( j == 4 ) then
				z = -294.75;
				pause = 14;
				npc = eq.spawn2(PIGLET_TYPE, 0, 0, x, y, z, 0);
				x2 = x3;
				y2 = y3;
			else			
				z = -286.625;
				npc = eq.spawn2(eq.ChooseRandom(BOAR1_TYPE, BOAR2_TYPE), 0, 0, x, y, z, 0);
			end
			npc = npc:CastToNPC();
			npc:SetRunning(true);
			npc:SetWanderType(6);
			npc:SetPauseType(1);
			npc:AddWaypoint(x, y, z, -1, pause, false);
			npc:AddWaypoint(1140, -240, z, -1, 0, false);
			npc:AddWaypoint(925, -240, z, -1, 0, false);
			npc:AddWaypoint(x2, y2, z, -1, 0, false);
			npc:AddWaypoint(925, 220, z, -1, 0, false);
			npc:AddWaypoint(1200, 220, z, -1, 0, false);
			npc:AddWaypoint(1200, -320, z, -1, 0, false);
		end
	end
end

function event_spawn(e)
	eq.set_timer("stamp", math.random(40, 120) * 60000);
end

function event_timer(e)
	if ( e.timer == "stamp" ) then
		eq.set_timer("stamp", math.random(40, 120) * 60000);
		
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(214312) ) then -- Rallos_Zek_the_Warlord
			eq.zone_emote(0, "You hear the pounding of hooves.");
			eq.set_timer("spawn", 15000);
		end
		
	elseif ( e.timer == "spawn" ) then
		eq.stop_timer(e.timer);
		SpawnBoars();		
	end
end
