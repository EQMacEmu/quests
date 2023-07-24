function event_click_door(e)
	local door_id = e.door:GetDoorID();
	local entity_list = eq.get_entity_list();
		
	if(door_id == 5) then
		OpenDoors(e,entity_list,door_id,7,9);
	end
end

function OpenDoors(e, entity_list, door_id, first_id, last_id)
	for i = first_id, last_id, 1 do
		-- the server handles the door actually clicked by the player.
		-- if we do not exclude it, then it does not get opened.
		if (door_id ~= i) then
			entity_list:FindDoor(i):ForceOpen(e.self);
		end
	end
end