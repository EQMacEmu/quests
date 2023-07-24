function event_click_door(e)
	local door_id = e.door:GetDoorID();
	if (door_id == 225) then
		if(e.self:HasItem(28602) and not e.self:KeyRingCheck(28602)) then
			e.self:KeyRingAdd(28602);
		end
		if( e.self:KeyRingCheck(28602) ) then
 			MoveGroup(e.self:GetGroup(),e.self, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 894, -942, 315, 5);
		end
	end
end

function MoveGroup(frozen_group, player, src_x, src_y, src_z, distance, tgt_x, tgt_y, tgt_z, tgt_h)
	if ( frozen_group.valid ) then
		local frozen_count = frozen_group:GroupCount();

		for i = 0, frozen_count - 1, 1 do
			local client_v = frozen_group:GetMember(i):CastToClient();
		
			if (client_v.valid) then
				-- check the distance and port them up if close enough
				if (client_v:CalculateDistance(src_x, src_y, src_z) <= distance) then
					-- port the player up
					client_v:MovePC(117, tgt_x, tgt_y, tgt_z, tgt_h);
				end
			end
		end
	else
		player:MovePC(117, tgt_x, tgt_y, tgt_z, tgt_h);
	end
end