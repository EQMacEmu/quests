function event_board_boat(e)
	local zone_time = eq.get_zone_time();
	local hour = zone_time["zone_hour"];
	local minute = zone_time["zone_minute"];
	eq.debug(" At: " .. hour .. ":" .. minute .. " BoatID: " .. e.boat_id .. " was boarded. Its name is: " .. e.self:GetBoatName() .. ".", 1);
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:SetBoatID(838);
		e.self:SetBoatName("Maidens_Voyage000");
	elseif(e.signal == 2) then
		e.self:SetBoatID(846);
		e.self:SetBoatName("Shuttle_I000");
	elseif(e.signal == 3) then
		e.self:SetBoatID(847);
		e.self:SetBoatName("Shuttle_II000");
	elseif(e.signal == 4) then
		e.self:SetBoatID(848);
		e.self:SetBoatName("Shuttle_III000");
	elseif(e.signal == 5) then
		e.self:SetBoatID(849);
		e.self:SetBoatName("Shuttle_IV000");
	end
end

function event_leave_boat(e)
	local zone_time = eq.get_zone_time();
	local hour = zone_time["zone_hour"];
	eq.debug(" At: " .. hour .. ":00 I left BoatID: " .. e.boat_id .. ".", 1);
end