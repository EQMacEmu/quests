function event_signal(e) 		
	if(e.signal == 1) then 		
 		eq.start(4);
	end
 end

 function event_waypoint_arrive(e)
 	local zone_time = eq.get_zone_time();
	local hour = zone_time["zone_hour"];
	local minute = zone_time["zone_minute"];
	if(e.wp == 2) then
		eq.stop();
		eq.debug("Shuttle to butcherblock (4) has reached its destination! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:Signal(2);
			end,
			function(ent)
				-- Server thinks we're on Maidens_Voyage and are about to zone.
				if(ent:GetBoatID() == 838 and ent:GetX() < -7100) then
					return true;
				end
				return false;
			end
		);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(68,3658,476,-13, 0);
			end,
			function(ent)
				if(ent:GetBoatID() == 842) then
					return true;
				end
				return false;
			end
		);
	end
end