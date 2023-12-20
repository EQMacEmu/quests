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
	-- Qeynos
	if(e.self:GetGrid() == 5 and e.wp == 3) then
		eq.debug("Boat to Qeynos (5) has reached its destination! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(1,775,260,22,192);
			end,
			function(ent)
				if(ent:GetBoatID() == 772) then
					return true;
				end
				return false;
			end
		);
	-- Erud
	elseif(e.self:GetGrid() == 7 and e.wp == 20) then
		eq.debug("Boat to Erud (7) has reached its destination! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(24,-1606,-584,0,-1);
			end,
			function(ent)
				if(ent:GetBoatID() == 772) then
					return true;
				end
				return false;
			end
		);
	end
end