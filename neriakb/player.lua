function event_click_door(e)
	local id = e.door:GetDoorID();

	if ( id == 1 ) then
		eq.get_entity_list():GetDoorsByDoorID(2):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(49):ForceOpen(e.self);
	elseif ( id == 2 ) then
		eq.get_entity_list():GetDoorsByDoorID(1):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(49):ForceOpen(e.self);
	elseif ( id == 49 ) then
		eq.get_entity_list():GetDoorsByDoorID(1):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(2):ForceOpen(e.self);
	end
end
