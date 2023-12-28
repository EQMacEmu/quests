function event_spawn(e)
	local zone_time = eq.get_zone_time();
	local hour = zone_time["zone_hour"];
	local minute = zone_time["zone_minute"];
	eq.debug("Boat spawned! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
end

function event_waypoint_arrive(e)
	local zone_time = eq.get_zone_time();
	local hour = zone_time["zone_hour"];
	local minute = zone_time["zone_minute"];
	if(e.wp == 4) then
		eq.signal(96075,1); -- NPC: Island_Shuttle
		eq.debug("Boat to firiona (2) has reached the Elf docks. Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
	elseif(e.wp == 5) then
		eq.signal(96075,2); -- NPC: Island_Shuttle
	elseif(e.wp == 18) then -- signal one before 19 to allow them to move sooner
		eq.debug("Boat to firiona (2) has reached the shuttle. Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
		--eq.signal(842,1); -- NPC: Captains_Skiff	
        eq.signal(846,1); -- NPC: Shuttle_I
        eq.signal(847,1); -- NPC: Shuttle_II
        eq.signal(848,1); -- NPC: Shuttle_III
        eq.signal(849,1); -- NPC: Shuttle_IV
	elseif(e.wp == 30) then
		eq.debug("Boat to firiona (2) has reached its destination! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:Signal(1);
					end,
			function(ent)
				-- Server thinks we're on Island_Shuttle and are about to zone.
				if(ent:GetBoatID() == 96075 and ent:GetX() < -2000 and ent:GetY() > 500) then
					return true;
				end
				return false;
			end
		);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(84,4421,-5685,-67, 0);
			end,
			function(ent)
				if(ent:GetBoatID() == 838) then
					return true;
				end
				return false;
			end
		);
	end
end

function event_waypoint_depart(e)
    if(e.wp == 5) then
        -- signal BB shuttles to depart
        eq.signal(68236,2);
    end
end
