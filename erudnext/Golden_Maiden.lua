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
	if(e.wp == 7) then
		eq.signal(24056,1); -- NPC: Sabrina
	elseif(e.wp == 8) then
		eq.signal(24056,2); -- NPC: Sabrina
		eq.signal(24085,1); -- NPC: Reko_Saltamer
	elseif(e.wp == 10) then
		eq.debug("Boat to Erudsxing has reached its destination! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
		eq.spawn_condition("erudnext",1,0);
		eq.spawn_condition("erudnext",2,0);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:Signal(2);
			end,
			function(ent)
				-- Server thinks we're on Sabrina and are about to zone.
				if(ent:GetBoatID() == 24056 and ent:GetY() > 500) then
					return true;
				end
				return false;
			end
		);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(98,2337,418,-22,-1);
			end,
			function(ent)
				if(ent:GetBoatID() == 773 and ent:GetY() > 500) then
					return true;
				end
				return false;
			end
		);
	end
end