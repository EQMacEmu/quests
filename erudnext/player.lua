function event_enter_zone(e)
	if(e.self:GetBoatID() == 772 or e.self:GetBoatID() == 773) then
		eq.signal(24056,3); -- NPC: Sabrina
	else
		eq.signal(24056,4); -- NPC: Sabrina
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:SetBoatID(772);
		e.self:SetBoatName("Sea_King000");
		eq.debug("Setting boat to Sea_King000 for " .. e.self:GetName() .. " at " .. e.self:GetX() .. "," .. e.self:GetY() .. "," .. e.self:GetZ() .. "", 1);

	elseif(e.signal == 2) then 
		e.self:SetBoatID(773);
		e.self:SetBoatName("Golden_Maiden000");
		eq.debug("Setting boat to Golden_Maiden000 for " .. e.self:GetName() .. " at " .. e.self:GetX() .. "," .. e.self:GetY() .. "," .. e.self:GetZ() .. "", 1);
	end
end

function event_board_boat(e)
	local zone_time = eq.get_zone_time();
	local hour = zone_time["zone_hour"];
	local minute = zone_time["zone_minute"];
	eq.debug(" At: " .. hour .. ":" .. minute .. " BoatID: " .. e.boat_id .. " was boarded. Its name is: " .. e.self:GetBoatName() .. ".", 1);
end

function event_leave_boat(e)
	local zone_time = eq.get_zone_time();
	local hour = zone_time["zone_hour"];
	eq.debug(" At: " .. hour .. ":00 I left BoatID: " .. e.boat_id .. ".", 1);
end