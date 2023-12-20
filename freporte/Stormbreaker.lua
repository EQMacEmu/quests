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
	if(e.wp == 9) then
		eq.debug("Boat to OOT has reached its destination! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
		eq.spawn_condition("freporte",3,0);
		eq.spawn_condition("freporte",4,0);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(69,-10607,-2995,20,0);
			end,
			function(ent)
			 	if(ent:GetBoatID() == 770) then
					return true;
				end
				return false;
			end
		);
	end
end