function event_click_door(e)
	local id = e.door:GetDoorID();

	if ( id == 57 ) then
		eq.get_entity_list():GetDoorsByDoorID(58):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(59):ForceOpen(e.self);
	elseif ( id == 58 ) then
		eq.get_entity_list():GetDoorsByDoorID(57):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(59):ForceOpen(e.self);
	elseif ( id == 59 ) then
		eq.get_entity_list():GetDoorsByDoorID(57):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(58):ForceOpen(e.self);
	end
end
