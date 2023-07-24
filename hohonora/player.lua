function event_click_door(e)
	local door_id = e.door:GetDoorID();
	
	-- HoHB portals
	if ( door_id == 19 or door_id == 20 ) then
	
		local qglobals = eq.get_qglobals(e.self);

		if ( qglobals.hohtrials and qglobals.hohtrials == "111" ) then
		
			if ( e.self:HasZoneFlag(220) == false ) then
				e.self:SetZoneFlag(220);
			end
		else
			e.self:Message(13, "You lack the will to pass through this portal safely.");
		end
		
	end
end