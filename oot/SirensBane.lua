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
	-- Freeport
	if(e.self:GetGrid() == 60 and e.wp == 18) then
		eq.debug("Boat to Freeport (60) has reached its destination! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(10,-1853,-748,-80,0); -- Zone: arena2
			end,
			function(ent)
				if(ent:GetBoatID() == 771) then
					return true;
				end
				return false;
			end
		);
	-- Butcher
	elseif(e.self:GetGrid() == 61 and e.wp == 16) then
		eq.debug("Boat to Butcher (61) has reached its destination! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
		-- This grid zones a few seconds after the other.
		-- eq.spawn_condition("oot",1,0);
		-- eq.spawn_condition("oot",2,0);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(68,4591,2090,-15,0);
			end,
			function(ent)
				if(ent:GetBoatID() == 771) then
					return true;
				end
				return false;
			end
		);
	end
end