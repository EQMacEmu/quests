function event_click_door(e)
	local door_id = e.door:GetDoorID();

	if(door_id == 27) then
		if(e.self:GetLevel() < 46) then
			e.self:Message(13, "You are not yet experienced enough to pass through an inter-planar portal.");
		end
	end
 
 end