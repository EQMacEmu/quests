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
	elseif(e.wp == 17) then -- signal before 19 to allow them to move sooner (we pause at 19)
		eq.debug("Boat to firiona (2) has reached the shuttle. Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
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
				local px = ent:GetX();
				local py = ent:GetY();
				local boat_id = ent:GetBoatID();
				local diff_boat_check = boat_id == 96075 or boat_id == 846 or boat_id == 847 or boat_id == 848 or boat_id == 849;
				-- bounding box of Maiden_Voyage at wp 30
				local valid_pos_check = px >= -3000 and px <= -1700 and py >= 0 and py <= 1800;
				-- Server thinks we're on Island_Shuttle, Shuttle_I, Shuttle_II, Shuttle_III or Shuttle_IV and are about to zone.
				if(diff_boat_check and valid_pos_check) then
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
