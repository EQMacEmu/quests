function event_click_door(e)
	local door_id = e.door:GetDoorID();

	if ( door_id >= 9 and door_id <= 11 ) then
	
		if ( eq.get_qglobals(e.self).earthb_key ) then
			if ( e.self:HasZoneFlag(222) == false ) then
				e.self:SetZoneFlag(222);
			end
			e.self:MovePC(222, -764, 333, -59, 132);
		end
	end
end