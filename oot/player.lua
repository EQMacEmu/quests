function event_enter_zone(e)
	local qglobals = eq.get_qglobals();
	
	if(e.self:GetBoatID() == 770 or e.self:GetBoatID() == 771) then
		eq.signal(69078,1); -- NPC: Zachariah_Reigh
	else
		eq.signal(69078,2); -- NPC: Zachariah_Reigh
	end
	
	if(qglobals.strongbox ~= nil) then
		eq.create_ground_object(13860, -9205, -433, -293, 0, 3000000);
		eq.delete_global("strongbox");
	end
end

function event_board_boat(e)
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	local minute = zone_time["zone_minute"];
	eq.debug(" At: " .. hour .. ":" .. minute .. " BoatID: " .. e.boat_id .. " was boarded. Its name is: " .. e.self:GetBoatName() .. ".", 1);
end

function event_leave_boat(e)
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	eq.debug(" At: " .. hour .. ":00 I left BoatID: " .. e.boat_id .. ".", 1);
end