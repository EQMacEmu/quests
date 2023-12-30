function event_enter_zone(e)
	if(e.self:GetBoatID() == 770 or e.self:GetBoatID() == 771) then
		eq.signal(68054,1); -- NPC: Glorin_Binfurr
	else
		eq.signal(68054,2); -- NPC: Glorin_Binfurr
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:SetBoatID(846);
		e.self:SetBoatName("Shuttle_I000");
	elseif(e.signal == 2) then
		e.self:SetBoatID(847);
		e.self:SetBoatName("Shuttle_II000");
	elseif(e.signal == 3) then
		e.self:SetBoatID(848);
		e.self:SetBoatName("Shuttle_III000");
	elseif(e.signal == 4) then
		e.self:SetBoatID(849);
		e.self:SetBoatName("Shuttle_IV000");
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
	local minute = zone_time["zone_minute"];
	eq.debug(" At: " .. hour .. ":" .. minute .. " I left BoatID: " .. e.boat_id .. ".", 1);
end