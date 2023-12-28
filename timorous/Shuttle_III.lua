function event_spawn(e)
	local zone_time = eq.get_zone_time();
	local hour = zone_time["zone_hour"];
	local minute = zone_time["zone_minute"];
	e.self:Say("Boat spawned! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
end

function event_signal(e)
	if(e.signal == 1) then
		eq.start(18);
	end
 end

function event_waypoint_arrive(e)
	local zone_time = eq.get_zone_time();
	local hour = zone_time["zone_hour"];
	local minute = zone_time["zone_minute"];
	if(e.gridid == 18 and e.wp == 9) then
        eq.spawn_condition("butcher",5,1);
        eq.spawn_condition("timorous",7,0);
		eq.debug("Shuttle to butcher (4) has reached its destination! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(68, 3529, 556, 19, 0);
			end,
			function(ent)
				if(ent:GetBoatID() == 848) then
					return true;
				end
				return false;
			end
		);
	end
end